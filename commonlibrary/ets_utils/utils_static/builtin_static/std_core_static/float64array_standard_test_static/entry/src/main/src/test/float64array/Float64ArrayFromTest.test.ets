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

export default function float64ArrayFromTest(): void {
  describe('Float64ArrayFromTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_0100
     * @tc.name testFloat64ArrayFrom001
     * @tc.desc Verify from with FixedArray basic usage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const source: FixedArray<number> = [1.0, 2.0, 3.0];
      const result = Float64Array.from(source);
      const expectVal = threeValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_0200
     * @tc.name testFloat64ArrayFrom002
     * @tc.desc Verify from with empty FixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const source: FixedArray<number> = [];
      const result = Float64Array.from(source);
      const expectVal = zeroValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_0300
     * @tc.name testFloat64ArrayFrom003
     * @tc.desc Verify from with single-element FixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const fillValue42: number = 42.0;
      const source: FixedArray<number> = [42.0];
      const result = Float64Array.from(source);
      expect(result.length).assertEqual(oneValue);
      const actVal1 = result.$_get(0);
      const expectVal = fillValue42;
      expect(actVal1).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_0400
     * @tc.name testFloat64ArrayFrom004
     * @tc.desc Verify from with FixedArray containing positive floats
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointFive: number = 1.5;
      const twoPointseven: number = 2.7;
      const piApprox: number = 3.14;
      const source: FixedArray<number> = [1.5, 2.7, 3.14];
      const result = Float64Array.from(source);
      const actVal2 = result.$_get(0);
      const expectVal = onePointFive;
      expect(actVal2).assertEqual(expectVal);
      const actVal3 = result.$_get(1);
      const expectVal2 = twoPointseven;
      expect(actVal3).assertEqual(expectVal2);
      const actVal4 = result.$_get(2);
      const expectVal3 = piApprox;
      expect(actVal4).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_0500
     * @tc.name testFloat64ArrayFrom005
     * @tc.desc Verify from with FixedArray containing negative floats
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negonePointfive: number = -1.5;
      const negtwoPointseven: number = -2.7;
      const negthreePointonefour: number = -3.14;
      const source: FixedArray<number> = [-1.5, -2.7, -3.14];
      const result = Float64Array.from(source);
      const actVal5 = result.$_get(0);
      const expectVal = negonePointfive;
      expect(actVal5).assertEqual(expectVal);
      const actVal6 = result.$_get(1);
      const expectVal2 = negtwoPointseven;
      expect(actVal6).assertEqual(expectVal2);
      const actVal7 = result.$_get(2);
      const expectVal3 = negthreePointonefour;
      expect(actVal7).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_0600
     * @tc.name testFloat64ArrayFrom006
     * @tc.desc Verify from with FixedArray containing zeros
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const threeValue: number = 3;
      const source: FixedArray<number> = [0.0, 0.0, 0.0];
      const result = Float64Array.from(source);
      const actVal8 = result.$_get(0);
      const expectVal = zeroPointZero;
      expect(actVal8).assertEqual(expectVal);
      expect(result.length).assertEqual(threeValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_0700
     * @tc.name testFloat64ArrayFrom007
     * @tc.desc Verify from with FixedArray containing negative zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeZero: number = -0.0;
      const source: FixedArray<number> = [-0.0];
      const result = Float64Array.from(source);
      const actVal9 = result.$_get(0);
      const expectVal = negativeZero;
      expect(actVal9).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_0800
     * @tc.name testFloat64ArrayFrom008
     * @tc.desc Verify from with FixedArray containing Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Infinity;
      const source: FixedArray<number> = [Infinity];
      const result = Float64Array.from(source);
      const actVal10 = result.$_get(0);
      const expectVal = positiveInfinity;
      expect(actVal10).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_0900
     * @tc.name testFloat64ArrayFrom009
     * @tc.desc Verify from with FixedArray containing -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeInfinity: number = -Infinity;
      const source: FixedArray<number> = [-Infinity];
      const result = Float64Array.from(source);
      const actVal11 = result.$_get(0);
      const expectVal = negativeInfinity;
      expect(actVal11).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_1000
     * @tc.name testFloat64ArrayFrom010
     * @tc.desc Verify from with FixedArray containing NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<number> = [NaN];
      const result = Float64Array.from(source);
      const actVal12 = Number.isNaN(result.$_get(0));
      const expectVal = true;
      expect(actVal12).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_1100
     * @tc.name testFloat64ArrayFrom011
     * @tc.desc Verify from with FixedArray containing MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMaxValue: number = 1.7976931348623157e+308;
      const source: FixedArray<number> = [1.7976931348623157e+308];
      const result = Float64Array.from(source);
      const actVal13 = result.$_get(0);
      const expectVal = doubleMaxValue;
      expect(actVal13).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_1200
     * @tc.name testFloat64ArrayFrom012
     * @tc.desc Verify from with FixedArray containing MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMinValue: number = 5e-324;
      const source: FixedArray<number> = [5e-324];
      const result = Float64Array.from(source);
      const actVal14 = result.$_get(0);
      const expectVal = doubleMinValue;
      expect(actVal14).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_1300
     * @tc.name testFloat64ArrayFrom013
     * @tc.desc Verify from with FixedArray of 10 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tenValue: number = 10;
      const tenPointZero: number = 10.0;
      const source: FixedArray<number> = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0];
      const result = Float64Array.from(source);
      expect(result.length).assertEqual(tenValue);
      const actVal15 = result.$_get(9);
      const expectVal = tenPointZero;
      expect(actVal15).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_1400
     * @tc.name testFloat64ArrayFrom014
     * @tc.desc Verify from with FixedArray of 100 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const tenValue: number = 10;
      const arr = new Float64Array(100);
      for (let i: int = 0; i < 100; i++) {
        arr.$_set(i, i * onePointZero);
      }
      const source: FixedArray<number> = [0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0];
      const result = Float64Array.from(source);
      const expectVal = tenValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_1500
     * @tc.name testFloat64ArrayFrom015
     * @tc.desc Verify from with large FixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twentyValue: number = 20;
      const twentyPointzero: number = 20.0;
      const source: FixedArray<number> =
        [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0, 12.0, 13.0, 14.0, 15.0, 16.0, 17.0, 18.0, 19.0, 20.0];
      const result = Float64Array.from(source);
      expect(result.length).assertEqual(twentyValue);
      const actVal16 = result.$_get(19);
      const expectVal = twentyPointzero;
      expect(actVal16).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_1600
     * @tc.name testFloat64ArrayFrom016
     * @tc.desc Verify from with FixedArray containing MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeIntegerValue: number = 9007199254740991.0;
      const source: FixedArray<number> = [9007199254740991.0];
      const result = Float64Array.from(source);
      const actVal17 = result.$_get(0);
      const expectVal = maxSafeIntegerValue;
      expect(actVal17).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_1700
     * @tc.name testFloat64ArrayFrom017
     * @tc.desc Verify from with FixedArray containing MIN_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeMaxSafeIntegerValue: number = -9007199254740991.0;
      const source: FixedArray<number> = [-9007199254740991.0];
      const result = Float64Array.from(source);
      const actVal18 = result.$_get(0);
      const expectVal = negativeMaxSafeIntegerValue;
      expect(actVal18).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_1800
     * @tc.name testFloat64ArrayFrom018
     * @tc.desc Verify from with FixedArray of scientific notation values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sciValue10e308: number = 1.0e+308;
      const sciValue10e3082: number = 1.0e-308;
      const source: FixedArray<number> = [1.0e+308, 1.0e-308];
      const result = Float64Array.from(source);
      const actVal19 = result.$_get(0);
      const expectVal = sciValue10e308;
      expect(actVal19).assertEqual(expectVal);
      const actVal20 = result.$_get(1);
      const expectVal2 = sciValue10e3082;
      expect(actVal20).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_1900
     * @tc.name testFloat64ArrayFrom019
     * @tc.desc Verify from with FixedArray of hex octal binary literals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sixteenPointzero: number = 16.0;
      const fourPointZero: number = 4.0;
      const source: FixedArray<number> = [0x10, 0o20, 0b100];
      const result = Float64Array.from(source);
      const actVal21 = result.$_get(0);
      const expectVal = sixteenPointzero;
      expect(actVal21).assertEqual(expectVal);
      const actVal22 = result.$_get(1);
      const expectVal2 = sixteenPointzero;
      expect(actVal22).assertEqual(expectVal2);
      const actVal23 = result.$_get(2);
      const expectVal3 = fourPointZero;
      expect(actVal23).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2000
     * @tc.name testFloat64ArrayFrom020
     * @tc.desc Verify from with FixedArray of mixed positive negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sixValue: number = 6;
      const negonePointzero: number = -1.0;
      const negativeInfinity: number = -Infinity;
      const positiveInfinity: number = Infinity;
      const source: FixedArray<number> = [-1.0, 0.0, 1.0, -Infinity, Infinity, NaN];
      const result = Float64Array.from(source);
      expect(result.length).assertEqual(sixValue);
      const actVal24 = result.$_get(0);
      const expectVal = negonePointzero;
      expect(actVal24).assertEqual(expectVal);
      const actVal25 = result.$_get(3);
      const expectVal2 = negativeInfinity;
      expect(actVal25).assertEqual(expectVal2);
      const actVal26 = result.$_get(4);
      const expectVal3 = positiveInfinity;
      expect(actVal26).assertEqual(expectVal3);
      const actVal27 = Number.isNaN(result.$_get(5));
      const expectVal4 = true;
      expect(actVal27).assertEqual(expectVal4);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2100
     * @tc.name testFloat64ArrayFrom021
     * @tc.desc Verify from with FixedArray of all zeros
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fiveValue: number = 5;
      const zeroPointZero: number = 0.0;
      const source: FixedArray<number> = [0.0, 0.0, 0.0, 0.0, 0.0];
      const result = Float64Array.from(source);
      expect(result.length).assertEqual(fiveValue);
      const actVal28 = result.$_get(0);
      const expectVal = zeroPointZero;
      expect(actVal28).assertEqual(expectVal);
      const actVal29 = result.$_get(4);
      const expectVal2 = zeroPointZero;
      expect(actVal29).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2200
     * @tc.name testFloat64ArrayFrom022
     * @tc.desc Verify from with FixedArray of identical values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fourValue: number = 4;
      const sevenPointZero: number = 7.0;
      const source: FixedArray<number> = [7.0, 7.0, 7.0, 7.0];
      const result = Float64Array.from(source);
      expect(result.length).assertEqual(fourValue);
      const actVal30 = result.$_get(0);
      const expectVal = sevenPointZero;
      expect(actVal30).assertEqual(expectVal);
      const actVal31 = result.$_get(3);
      const expectVal2 = sevenPointZero;
      expect(actVal31).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2300
     * @tc.name testFloat64ArrayFrom023
     * @tc.desc Verify from with FixedArray of decimal precision values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const pointThree: number = 0.3;
      const source: FixedArray<number> = [0.1, 0.2, 0.3];
      const result = Float64Array.from(source);
      const actVal32 = result.$_get(0);
      const expectVal = pointOne;
      expect(actVal32).assertEqual(expectVal);
      const actVal33 = result.$_get(2);
      const expectVal2 = pointThree;
      expect(actVal33).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2400
     * @tc.name testFloat64ArrayFrom024
     * @tc.desc Verify from with 50-element FixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fiftyValue: number = 50;
      const twentyfivePointzero: number = 25.0;
      const source: FixedArray<number> = [
        0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0,
        10.0, 11.0, 12.0, 13.0, 14.0, 15.0, 16.0, 17.0, 18.0, 19.0,
        20.0, 21.0, 22.0, 23.0, 24.0, 25.0, 26.0, 27.0, 28.0, 29.0,
        30.0, 31.0, 32.0, 33.0, 34.0, 35.0, 36.0, 37.0, 38.0, 39.0,
        40.0, 41.0, 42.0, 43.0, 44.0, 45.0, 46.0, 47.0, 48.0, 49.0
      ];
      const result = Float64Array.from(source);
      expect(result.length).assertEqual(fiftyValue);
      const actVal34 = result.$_get(25);
      const expectVal = twentyfivePointzero;
      expect(actVal34).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2500
     * @tc.name testFloat64ArrayFrom025
     * @tc.desc Verify from with two-element FixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const hundredPointfive: number = 100.5;
      const num200Pointfive: number = 200.5;
      const source: FixedArray<number> = [100.5, 200.5];
      const result = Float64Array.from(source);
      expect(result.length).assertEqual(twoValue);
      const actVal35 = result.$_get(0);
      const expectVal = hundredPointfive;
      expect(actVal35).assertEqual(expectVal);
      const actVal36 = result.$_get(1);
      const expectVal2 = num200Pointfive;
      expect(actVal36).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2600
     * @tc.name testFloat64ArrayFrom026
     * @tc.desc Verify from creates independent copy from FixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<number> = [1.0, 2.0, 3.0];
      const result1 = Float64Array.from(source);
      const result2 = Float64Array.from(source);
      const expectVal = false;
      expect(result1.buffer === result2.buffer).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2700
     * @tc.name testFloat64ArrayFrom027
     * @tc.desc Verify from with FixedArray of scientific notation positive exponent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sciValue10e100: number = 1.0e+100;
      const source: FixedArray<number> = [1.0e+100, 2.0e+100];
      const result = Float64Array.from(source);
      const actVal37 = result.$_get(0);
      const expectVal = sciValue10e100;
      expect(actVal37).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2800
     * @tc.name testFloat64ArrayFrom028
     * @tc.desc Verify from with FixedArray of scientific notation negative exponent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sciValue10e100: number = 1.0e-100;
      const source: FixedArray<number> = [1.0e-100, 2.0e-100];
      const result = Float64Array.from(source);
      const actVal38 = result.$_get(0);
      const expectVal = sciValue10e100;
      expect(actVal38).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_2900
     * @tc.name testFloat64ArrayFrom029
     * @tc.desc Verify from with FixedArray of mixed int and float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointFive: number = 2.5;
      const threePointZero: number = 3.0;
      const source: FixedArray<number> = [1, 2.5, 3];
      const result = Float64Array.from(source);
      const actVal39 = result.$_get(0);
      const expectVal = onePointZero;
      expect(actVal39).assertEqual(expectVal);
      const actVal40 = result.$_get(1);
      const expectVal2 = twoPointFive;
      expect(actVal40).assertEqual(expectVal2);
      const actVal41 = result.$_get(2);
      const expectVal3 = threePointZero;
      expect(actVal41).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_3000
     * @tc.name testFloat64ArrayFrom030
     * @tc.desc Verify from with FixedArray of all identical values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fourValue: number = 4;
      const sevenPointseven: number = 7.7;
      const source: FixedArray<number> = [7.7, 7.7, 7.7, 7.7];
      const result = Float64Array.from(source);
      expect(result.length).assertEqual(fourValue);
      const actVal42 = result.$_get(2);
      const expectVal = sevenPointseven;
      expect(actVal42).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_3100
     * @tc.name testFloat64ArrayFrom031
     * @tc.desc Verify from with FixedArray of descending sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tenPointZero: number = 10.0;
      const sevenPointZero: number = 7.0;
      const source: FixedArray<number> = [10.0, 9.0, 8.0, 7.0];
      const result = Float64Array.from(source);
      const actVal43 = result.$_get(0);
      const expectVal = tenPointZero;
      expect(actVal43).assertEqual(expectVal);
      const actVal44 = result.$_get(3);
      const expectVal2 = sevenPointZero;
      expect(actVal44).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_3200
     * @tc.name testFloat64ArrayFrom032
     * @tc.desc Verify from with FixedArray of ascending sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fivePointZero: number = 5.0;
      const source: FixedArray<number> = [1.0, 2.0, 3.0, 4.0, 5.0];
      const result = Float64Array.from(source);
      const actVal45 = result.$_get(4);
      const expectVal = fivePointZero;
      expect(actVal45).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_3300
     * @tc.name testFloat64ArrayFrom033
     * @tc.desc Verify from return value content matches source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fivePointfive: number = 5.5;
      const sixPointsix: number = 6.6;
      const sevenPointseven: number = 7.7;
      const source: FixedArray<number> = [5.5, 6.6, 7.7];
      const result = Float64Array.from(source);
      const actVal46 = result.$_get(0);
      const expectVal = fivePointfive;
      expect(actVal46).assertEqual(expectVal);
      const actVal47 = result.$_get(1);
      const expectVal2 = sixPointsix;
      expect(actVal47).assertEqual(expectVal2);
      const actVal48 = result.$_get(2);
      const expectVal3 = sevenPointseven;
      expect(actVal48).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_3400
     * @tc.name testFloat64ArrayFrom034
     * @tc.desc Verify from return is a different object from FixedArray source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<number> = [1.0];
      const result = Float64Array.from(source);
      const expectVal = false;
      expect(result === source).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_3500
     * @tc.name testFloat64ArrayFrom035
     * @tc.desc Verify from modifying result does not affect source FixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fillValue99: number = 99.0;
      const source: FixedArray<number> = [1.0, 2.0];
      const result = Float64Array.from(source);
      result.$_set(0, fillValue99);
      const actVal49 = result.$_get(0);
      const expectVal = fillValue99;
      expect(actVal49).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_3600
     * @tc.name testFloat64ArrayFrom036
     * @tc.desc Verify from with FixedArray containing undefined becomes NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fiveValue: number = 5;
      const threePointZero: number = 3.0;
      const source: FixedArray<number> = [1.0, 2.0, 3.0, 4.0, 5.0];
      const result = Float64Array.from(source);
      expect(result.length).assertEqual(fiveValue);
      const actVal50 = result.$_get(2);
      const expectVal = threePointZero;
      expect(actVal50).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_3700
     * @tc.name testFloat64ArrayFrom037
     * @tc.desc Verify from with FixedArray of two-element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const num200Pointzero: number = 200.0;
      const source: FixedArray<number> = [100.0, 200.0];
      const result = Float64Array.from(source);
      expect(result.length).assertEqual(twoValue);
      const actVal51 = result.$_get(1);
      const expectVal = num200Pointzero;
      expect(actVal51).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_3800
     * @tc.name testFloat64ArrayFrom038
     * @tc.desc Verify from with Float64Array source basic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const threeValue: number = 3;
      const source = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const result = Float64Array.from(source);
      const expectVal = threeValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_3900
     * @tc.name testFloat64ArrayFrom039
     * @tc.desc Verify from with empty Float64Array source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const source = new Float64Array(0);
      const result = Float64Array.from(source);
      const expectVal = zeroValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_4000
     * @tc.name testFloat64ArrayFrom040
     * @tc.desc Verify from with single-element Float64Array source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const oneValue: number = 1;
      const source = Float64Array.of(int16MinValue);
      const result = Float64Array.from(source);
      expect(result.length).assertEqual(oneValue);
      const actVal52 = result.$_get(0);
      const expectVal = int16MinValue;
      expect(actVal52).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_4100
     * @tc.name testFloat64ArrayFrom041
     * @tc.desc Verify from with large Float64Array source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const thousandValue: number = 1000;
      const source = new Float64Array(1000);
      const result = Float64Array.from(source);
      const expectVal = thousandValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_4200
     * @tc.name testFloat64ArrayFrom042
     * @tc.desc Verify from Float64Array copy has identical content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const int32MaxValue: number = 2147483647;
      const source = Float64Array.of(int32MinValue, -1, zeroValue, oneValue, int32MaxValue);
      const result = Float64Array.from(source);
      const actVal53 = result.$_get(0);
      const expectVal = int32MinValue;
      expect(actVal53).assertEqual(expectVal);
      const actVal54 = result.$_get(2);
      const expectVal2 = zeroValue;
      expect(actVal54).assertEqual(expectVal2);
      const actVal55 = result.$_get(4);
      const expectVal3 = int32MaxValue;
      expect(actVal55).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_4300
     * @tc.name testFloat64ArrayFrom043
     * @tc.desc Verify from Float64Array copy with negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const source = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const result = Float64Array.from(source);
      const actVal56 = result.$_get(0);
      const expectVal = pointOne;
      expect(actVal56).assertEqual(expectVal);
      const actVal57 = result.$_get(2);
      const expectVal2 = zeroValue;
      expect(actVal57).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_4400
     * @tc.name testFloat64ArrayFrom044
     * @tc.desc Verify from Float64Array copy with zero and negative zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointTwoFive: number = 0.25;
      const onePointFive: number = 1.5;
      const source = Float64Array.of(pointTwoFive, onePointFive, pointTwoFive);
      const result = Float64Array.from(source);
      const actVal58 = result.$_get(0);
      const expectVal = pointTwoFive;
      expect(actVal58).assertEqual(expectVal);
      const actVal59 = result.$_get(1);
      const expectVal2 = onePointFive;
      expect(actVal59).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_4500
     * @tc.name testFloat64ArrayFrom045
     * @tc.desc Verify from Float64Array copy with Infinity values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const int8MinValue: number = -128;
      const source = Float64Array.of(zeroValue, -128, zeroValue);
      const result = Float64Array.from(source);
      const actVal60 = result.$_get(0);
      const expectVal = zeroValue;
      expect(actVal60).assertEqual(expectVal);
      const actVal61 = result.$_get(1);
      const expectVal2 = int8MinValue;
      expect(actVal61).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_4600
     * @tc.name testFloat64ArrayFrom046
     * @tc.desc Verify from Float64Array copy with NaN values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const source = Float64Array.of(negativeOne, -1);
      const result = Float64Array.from(source);
      const actVal62 = Number.isNaN(result.$_get(0));
      const expectVal = false;
      expect(actVal62).assertEqual(expectVal);
      const actVal63 = Number.isNaN(result.$_get(1));
      const expectVal2 = false;
      expect(actVal63).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_4700
     * @tc.name testFloat64ArrayFrom047
     * @tc.desc Verify from Float64Array copy with MAX_VALUE and MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const source = Float64Array.of(pointOne, maxSafeInteger);
      const result = Float64Array.from(source);
      const actVal64 = result.$_get(0);
      const expectVal = pointOne;
      expect(actVal64).assertEqual(expectVal);
      const actVal65 = result.$_get(1);
      const expectVal2 = maxSafeInteger;
      expect(actVal65).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_4800
     * @tc.name testFloat64ArrayFrom048
     * @tc.desc Verify from Float64Array copy with scientific notation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const source = Float64Array.of(pointFive, onePointFive);
      const result = Float64Array.from(source);
      const actVal66 = result.$_get(0);
      const expectVal = pointFive;
      expect(actVal66).assertEqual(expectVal);
      const actVal67 = result.$_get(1);
      const expectVal2 = onePointFive;
      expect(actVal67).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_4900
     * @tc.name testFloat64ArrayFrom049
     * @tc.desc Verify from Float64Array copy with alternating signs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const int8MaxValue: number = 127;
      const int16MaxValue: number = 32767;
      const int8MinValue: number = -128;
      const source = Float64Array.of(int16MinValue, -128, zeroValue, int8MaxValue, int16MaxValue, zeroValue);
      const result = Float64Array.from(source);
      const actVal68 = result.$_get(1);
      const expectVal = int8MinValue;
      expect(actVal68).assertEqual(expectVal);
      const actVal69 = result.$_get(3);
      const expectVal2 = int8MaxValue;
      expect(actVal69).assertEqual(expectVal2);
      const actVal70 = result.$_get(5);
      const expectVal3 = zeroValue;
      expect(actVal70).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_5000
     * @tc.name testFloat64ArrayFrom050
     * @tc.desc Verify from Float64Array copy with all zeros
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const fourValue: number = 4;
      const source = Float64Array.of(oneValue, oneValue, oneValue, oneValue);
      const result = Float64Array.from(source);
      expect(result.length).assertEqual(fourValue);
      const actVal71 = result.$_get(3);
      const expectVal = oneValue;
      expect(actVal71).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_5100
     * @tc.name testFloat64ArrayFrom051
     * @tc.desc Verify from Float64Array copy with descending sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const piValue: number = 3.141592653589793;
      const source = Float64Array.of(pointOne, maxSafeInteger, zeroValue, piValue);
      const result = Float64Array.from(source);
      const actVal72 = result.$_get(0);
      const expectVal = pointOne;
      expect(actVal72).assertEqual(expectVal);
      const actVal73 = result.$_get(3);
      const expectVal2 = piValue;
      expect(actVal73).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_5200
     * @tc.name testFloat64ArrayFrom052
     * @tc.desc Verify from Float64Array copy with ascending sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const pointOneTwoFive: number = 0.125;
      const pointZeroSixTwoFive: number = 0.0625;
      const source = Float64Array.of(pointFive, onePointFive, pointTwoFive, pointOneTwoFive, pointZeroSixTwoFive);
      const result = Float64Array.from(source);
      const actVal74 = result.$_get(4);
      const expectVal = pointZeroSixTwoFive;
      expect(actVal74).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_5300
     * @tc.name testFloat64ArrayFrom053
     * @tc.desc Verify from Float64Array copy with MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const source = Float64Array.of(int16MinValue, -128);
      const result = Float64Array.from(source);
      const actVal75 = result.$_get(0);
      const expectVal = int16MinValue;
      expect(actVal75).assertEqual(expectVal);
      const actVal76 = result.$_get(1);
      const expectVal2 = int8MinValue;
      expect(actVal76).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_5400
     * @tc.name testFloat64ArrayFrom054
     * @tc.desc Verify from Float64Array copy return is different object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const source = Float64Array.of(int32MinValue, -1);
      const result = Float64Array.from(source);
      const expectVal = false;
      expect(result === source).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_5500
     * @tc.name testFloat64ArrayFrom055
     * @tc.desc Verify from Float64Array copy modifying result does not affect source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const eightyeightPointzero: number = 88.0;
      const source = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const result = Float64Array.from(source);
      result.$_set(1, eightyeightPointzero);
      const actVal77 = result.$_get(1);
      const expectVal = eightyeightPointzero;
      expect(actVal77).assertEqual(expectVal);
      const actVal78 = source.$_get(1);
      const expectVal2 = maxSafeInteger;
      expect(actVal78).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_5600
     * @tc.name testFloat64ArrayFrom056
     * @tc.desc Verify from Float64Array copy return buffer independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const source = Float64Array.of(int16MinValue, -128);
      const result = Float64Array.from(source);
      const expectVal = false;
      expect(result.buffer === source.buffer).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_5700
     * @tc.name testFloat64ArrayFrom057
     * @tc.desc Verify from Float64Array when source modified after from returns independent copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const num999Pointzero: number = 999.0;
      const source = Float64Array.of(int32MinValue, -1);
      const result = Float64Array.from(source);
      source.$_set(0, num999Pointzero);
      const actVal79 = result.$_get(0);
      const expectVal = int32MinValue;
      expect(actVal79).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_5800
     * @tc.name testFloat64ArrayFrom058
     * @tc.desc Verify from with int type variables in FixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tenPointZero: number = 10.0;
      const twentyPointzero: number = 20.0;
      const i1: int = 10;
      const i2: int = 20;
      const source: FixedArray<number> = [i1, i2, 30];
      const result = Float64Array.from(source);
      const actVal80 = result.$_get(0);
      const expectVal = tenPointZero;
      expect(actVal80).assertEqual(expectVal);
      const actVal81 = result.$_get(1);
      const expectVal2 = twentyPointzero;
      expect(actVal81).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_5900
     * @tc.name testFloat64ArrayFrom059
     * @tc.desc Verify from with double type variables in FixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointFive: number = 1.5;
      const twoPointFive: number = 2.5;
      const d1: double = 1.5;
      const d2: double = 2.5;
      const source: FixedArray<number> = [d1, d2];
      const result = Float64Array.from(source);
      const actVal82 = result.$_get(0);
      const expectVal = onePointFive;
      expect(actVal82).assertEqual(expectVal);
      const actVal83 = result.$_get(1);
      const expectVal2 = twoPointFive;
      expect(actVal83).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_6000
     * @tc.name testFloat64ArrayFrom060
     * @tc.desc Verify from with short type variables in Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const s1: short = 1;
      const s2: short = 2;
      const source: Array<number> = [s1, s2, 3];
      const result = Float64Array.from(source);
      const actVal84 = result.$_get(0);
      const expectVal = onePointZero;
      expect(actVal84).assertEqual(expectVal);
      const actVal85 = result.$_get(1);
      const expectVal2 = twoPointZero;
      expect(actVal85).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_6100
     * @tc.name testFloat64ArrayFrom061
     * @tc.desc Verify from with int variable in Float64Array source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hundredValue: number = 100;
      const fillValue42: number = 42.0;
      const iv: int = 42;
      const source = Float64Array.of(iv, hundredValue);
      const result = Float64Array.from(source);
      const actVal86 = result.$_get(0);
      const expectVal = fillValue42;
      expect(actVal86).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_6200
     * @tc.name testFloat64ArrayFrom062
     * @tc.desc Verify from with array negative check (D7 two-way)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const arr = Float64Array.from([onePointZero, twoPointZero, threePointZero]);
      expect(arr[0] === 1.0).assertEqual(true);
      expect(arr[0] === 9.0).assertEqual(false);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_6300
     * @tc.name testFloat64ArrayFrom063
     * @tc.desc Verify from with hex literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValueFF: number = 0xFF;
      const hexValueAA: number = 0xAA;
      const num255Value: number = 255;
      const num170Pointzero: number = 170.0;
      const arr = Float64Array.from([hexValueFF, hexValueAA]);
      expect(arr[0]).assertEqual(num255Value);
      expect(arr[1]).assertEqual(num170Pointzero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_6400
     * @tc.name testFloat64ArrayFrom064
     * @tc.desc Verify from with binary literal (D8 binary)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const binaryValue11111111: number = 0b11111111;
      const binaryValue10101010: number = 0b10101010;
      const num255Value: number = 255;
      const num170Pointzero: number = 170.0;
      const arr = Float64Array.from([binaryValue11111111, binaryValue10101010]);
      expect(arr[0]).assertEqual(num255Value);
      expect(arr[1]).assertEqual(num170Pointzero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_6500
     * @tc.name testFloat64ArrayFrom065
     * @tc.desc Verify from with Double.NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = Double.NaN;
      const doubleMaxValue: number = Double.MAX_VALUE;
      const arr = Float64Array.from([nanValue, doubleMaxValue]);
      const actVal87 = Number.isNaN(arr[0]);
      const expectVal = true;
      expect(actVal87).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_6600
     * @tc.name testFloat64ArrayFrom066
     * @tc.desc Verify from with Double.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Double.POSITIVE_INFINITY;
      const negativeInfinity: number = Double.NEGATIVE_INFINITY;
      const arr = Float64Array.from([positiveInfinity, negativeInfinity]);
      const expectVal = true;
      expect(arr[0] > 0.0).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FROM_6700
     * @tc.name testFloat64ArrayFrom067
     * @tc.desc Verify from with Double.MIN_VALUE/MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFrom067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMinValue: number = Double.MIN_VALUE;
      const doubleMaxValue: number = Double.MAX_VALUE;
      const arr = Float64Array.from([doubleMinValue, doubleMaxValue]);
      expect(arr[0] > 0.0).assertEqual(true);
      expect(arr[1] > 0.0).assertEqual(true);
    })

  })
}
