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

export default function float64ArrayAtTest(): void {
  describe('Float64ArrayAtTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0010
     * @tc.name testFloat64ArrayAt001
     * @tc.desc Verify at with 1 parameter is a legal call returning first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const firstIndex: int = 0;
      const actualValue = arr.at(firstIndex);
      const expectedValue: number = pointOne;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0020
     * @tc.name testFloat64ArrayAt002
     * @tc.desc Verify at with index=0 returns first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const pointOneTwoFive: number = 0.125;
      const pointZeroSixTwoFive: number = 0.0625;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive, pointOneTwoFive, pointZeroSixTwoFive);
      const firstIndex: int = 0;
      const actualValue = arr.at(firstIndex);
      const expectedValue: number = pointFive;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0030
     * @tc.name testFloat64ArrayAt003
     * @tc.desc Verify at with index=1 returns second element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const int8MaxValue: number = 127;
      const int16MaxValue: number = 32767;
      const arr = Float64Array.of(int16MinValue, int8MinValue, zeroValue, int8MaxValue, int16MaxValue);
      const secondIndex: int = 1;
      const actualValue = arr.at(secondIndex);
      const expectedValue: number = int8MinValue;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0040
     * @tc.name testFloat64ArrayAt004
     * @tc.desc Verify at with index=length-1 returns last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const int32MaxValue: number = 2147483647;
      const arr = Float64Array.of(int32MinValue, negativeOne, zeroValue, oneValue, int32MaxValue);
      const indexFour: int = 4;
      const actualValue = arr.at(indexFour);
      const expectedValue: number = int32MaxValue;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0050
     * @tc.name testFloat64ArrayAt005
     * @tc.desc Verify at with index=-1 returns last element via negative index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const piValue: number = 3.141592653589793;
      const tinyNegativeValue: number = -1e-100;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue, piValue, tinyNegativeValue);
      const negativeLastIndex: int = -1;
      const actualValue = arr.at(negativeLastIndex);
      const expectedValue: number = tinyNegativeValue;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0060
     * @tc.name testFloat64ArrayAt006
     * @tc.desc Verify at with index=-2 returns second-to-last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const pointOneTwoFive: number = 0.125;
      const pointZeroSixTwoFive: number = 0.0625;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive, pointOneTwoFive, pointZeroSixTwoFive);
      const secondFromLastIndex: int = -2;
      const actualValue = arr.at(secondFromLastIndex);
      const expectedValue: number = pointOneTwoFive;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0070
     * @tc.name testFloat64ArrayAt007
     * @tc.desc Verify at with index=-length returns first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const int8MaxValue: number = 127;
      const int16MaxValue: number = 32767;
      const arr = Float64Array.of(int16MinValue, int8MinValue, zeroValue, int8MaxValue, int16MaxValue);
      const fifthFromLastIndex: int = -5;
      const actualValue = arr.at(fifthFromLastIndex);
      const expectedValue: number = int16MinValue;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0080
     * @tc.name testFloat64ArrayAt008
     * @tc.desc Verify at with index=-3 returns middle element via negative index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const int32MaxValue: number = 2147483647;
      const arr = Float64Array.of(int32MinValue, negativeOne, zeroValue, oneValue, int32MaxValue);
      const thirdFromLastIndex: int = -3;
      const actualValue = arr.at(thirdFromLastIndex);
      const expectedValue: number = zeroValue;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0090
     * @tc.name testFloat64ArrayAt009
     * @tc.desc Verify at with index=length out of bounds returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const piValue: number = 3.141592653589793;
      const tinyNegativeValue: number = -1e-100;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue, piValue, tinyNegativeValue);
      const indexFive: int = 5;
      const actualValue = arr.at(indexFive);
      const expectVal = undefined;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0100
     * @tc.name testFloat64ArrayAt010
     * @tc.desc Verify at with index=length+1 out of bounds returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const pointOneTwoFive: number = 0.125;
      const pointZeroSixTwoFive: number = 0.0625;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive, pointOneTwoFive, pointZeroSixTwoFive);
      const indexSix: int = 6;
      const actualValue = arr.at(indexSix);
      const expectVal = undefined;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0110
     * @tc.name testFloat64ArrayAt011
     * @tc.desc Verify at with index=-length-1 negative out of bounds returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const int8MaxValue: number = 127;
      const int16MaxValue: number = 32767;
      const arr = Float64Array.of(int16MinValue, int8MinValue, zeroValue, int8MaxValue, int16MaxValue);
      const indexNegativeSix: int = -6;
      const actualValue = arr.at(indexNegativeSix);
      const expectVal = undefined;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0120
     * @tc.name testFloat64ArrayAt012
     * @tc.desc Verify at with index=-length-2 negative out of bounds returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const int32MaxValue: number = 2147483647;
      const arr = Float64Array.of(int32MinValue, negativeOne, zeroValue, oneValue, int32MaxValue);
      const indexNegativeSeven: int = -7;
      const actualValue = arr.at(indexNegativeSeven);
      const expectVal = undefined;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0130
     * @tc.name testFloat64ArrayAt013
     * @tc.desc Verify at with very large positive index out of bounds returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const millionOobIndex: int = 1000000;
      const actualValue = arr.at(millionOobIndex);
      const expectVal = undefined;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0140
     * @tc.name testFloat64ArrayAt014
     * @tc.desc Verify at with very large negative index out of bounds returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const negativeMillionOobIndex: int = -1000000;
      const actualValue = arr.at(negativeMillionOobIndex);
      const expectVal = undefined;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0150
     * @tc.name testFloat64ArrayAt015
     * @tc.desc Verify at with index=0 on empty array returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(0);
      const firstIndex: int = 0;
      const actualValue = arr.at(firstIndex);
      const expectVal = undefined;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0160
     * @tc.name testFloat64ArrayAt016
     * @tc.desc Verify at with index=-1 on empty array returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(0);
      const invalidNegativeIndex: int = -1;
      const actualValue = arr.at(invalidNegativeIndex);
      const expectVal = undefined;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0170
     * @tc.name testFloat64ArrayAt017
     * @tc.desc Verify at with index=0 on single-element array returns the element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const arr = Float64Array.of(int16MinValue);
      const firstIndex: int = 0;
      const actualValue = arr.at(firstIndex);
      const expectedValue: number = int16MinValue;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0180
     * @tc.name testFloat64ArrayAt018
     * @tc.desc Verify at with index=-1 on single-element array returns the element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const arr = Float64Array.of(int32MinValue);
      const singleElementNegIndex: int = -1;
      const actualValue = arr.at(singleElementNegIndex);
      const expectedValue: number = int32MinValue;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0190
     * @tc.name testFloat64ArrayAt019
     * @tc.desc Verify at with index=1 out of bounds on single-element array returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const arr = Float64Array.of(pointOne);
      const secondIndex: int = 1;
      const actualValue = arr.at(secondIndex);
      const expectVal = undefined;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0200
     * @tc.name testFloat64ArrayAt020
     * @tc.desc Verify at with index=-2 out of bounds on single-element array returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const arr = Float64Array.of(pointFive);
      const secondFromLastIndex: int = -2;
      const actualValue = arr.at(secondFromLastIndex);
      const expectVal = undefined;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0210
     * @tc.name testFloat64ArrayAt021
     * @tc.desc Verify at reads element with value 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const arr = Float64Array.of(zeroPointZero, onePointZero, twoPointZero);
      const firstIndex: int = 0;
      const actualValue = arr.at(firstIndex);
      const expectedValue: number = zeroPointZero;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0220
     * @tc.name testFloat64ArrayAt022
     * @tc.desc Verify at reads negative element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int32MinValue, negativeOne, zeroValue);
      const secondIndex: int = 1;
      const actualValue = arr.at(secondIndex);
      const expectedValue: number = negativeOne;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0230
     * @tc.name testFloat64ArrayAt023
     * @tc.desc Verify at reads Infinity element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Infinity;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const arr = Float64Array.of(positiveInfinity, twoPointZero, threePointZero);
      const firstIndex: int = 0;
      const actualValue = arr.at(firstIndex);
      const expectedValue: number = positiveInfinity;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0240
     * @tc.name testFloat64ArrayAt024
     * @tc.desc Verify at reads -Infinity element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const negativeInfinity: number = -Infinity;
      const threePointZero: number = 3.0;
      const arr = Float64Array.of(onePointZero, negativeInfinity, threePointZero);
      const secondIndex: int = 1;
      const actualValue = arr.at(secondIndex);
      const expectedValue: number = negativeInfinity;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0250
     * @tc.name testFloat64ArrayAt025
     * @tc.desc Verify at reads NaN element using Number.isNaN check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const nanValue: number = NaN;
      const arr = Float64Array.of(onePointZero, twoPointZero, nanValue);
      const thirdIndex: int = 2;
      const actualValue = arr.at(thirdIndex);
      const actVal1 = Number.isNaN(actualValue as Double);
      const expectVal = true;
      expect(actVal1).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0260
     * @tc.name testFloat64ArrayAt026
     * @tc.desc Verify at reads MIN_VALUE tiny positive number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMinValue: number = 5e-324;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const arr = Float64Array.of(doubleMinValue, twoPointZero, threePointZero);
      const firstIndex: int = 0;
      const actualValue = arr.at(firstIndex);
      const expectedValue: number = doubleMinValue;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0270
     * @tc.name testFloat64ArrayAt027
     * @tc.desc Verify at reads MAX_VALUE maximum number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const doubleMaxValue: number = 1.7976931348623157e+308;
      const threePointZero: number = 3.0;
      const arr = Float64Array.of(onePointZero, doubleMaxValue, threePointZero);
      const secondIndex: int = 1;
      const actualValue = arr.at(secondIndex);
      const expectedValue: number = doubleMaxValue;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0280
     * @tc.name testFloat64ArrayAt028
     * @tc.desc Verify at reads negative zero element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeZero: number = -0.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const arr = Float64Array.of(negativeZero, twoPointZero, threePointZero);
      const firstIndex: int = 0;
      const actualValue = arr.at(firstIndex);
      const expectedValue: number = negativeZero;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0290
     * @tc.name testFloat64ArrayAt029
     * @tc.desc Verify at reads scientific notation element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const sciValue10e308: number = 1.0e-308;
      const threePointZero: number = 3.0;
      const arr = Float64Array.of(onePointZero, sciValue10e308, threePointZero);
      const secondIndex: int = 1;
      const actualValue = arr.at(secondIndex);
      const expectedValue: number = sciValue10e308;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0300
     * @tc.name testFloat64ArrayAt030
     * @tc.desc Verify at reads MAX_VALUE at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMaxValue: number = 1.7976931348623157e+308;
      const twoPointZero: number = 2.0;
      const arr = Float64Array.of(doubleMaxValue, twoPointZero);
      const firstIndex: int = 0;
      const actualValue = arr.at(firstIndex);
      const expectedValue: number = doubleMaxValue;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0310
     * @tc.name testFloat64ArrayAt031
     * @tc.desc Verify at reads MIN_VALUE at index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const doubleMinValue: number = 5e-324;
      const threePointZero: number = 3.0;
      const arr = Float64Array.of(onePointZero, doubleMinValue, threePointZero);
      const secondIndex: int = 1;
      const actualValue = arr.at(secondIndex);
      const expectedValue: number = doubleMinValue;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0320
     * @tc.name testFloat64ArrayAt032
     * @tc.desc Verify at reads floating-point precision boundary value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const precisePointOnePlusPointTwo: number = 0.30000000000000004;
      const twoPointZero: number = 2.0;
      const arr = Float64Array.of(precisePointOnePlusPointTwo, twoPointZero);
      const firstIndex: int = 0;
      const actualValue = arr.at(firstIndex);
      const expectedValue: number = precisePointOnePlusPointTwo;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0330
     * @tc.name testFloat64ArrayAt033
     * @tc.desc Verify at with index=100 far out of bounds on two-element array returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const arr = Float64Array.of(int16MinValue, int8MinValue);
      const largeOobIndex: int = 100;
      const actualValue = arr.at(largeOobIndex);
      const expectVal = undefined;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0340
     * @tc.name testFloat64ArrayAt034
     * @tc.desc Verify at with index=-100 far out of bounds on two-element array returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const arr = Float64Array.of(int32MinValue, negativeOne);
      const negativeLargeOobIndex: int = -100;
      const actualValue = arr.at(negativeLargeOobIndex);
      const expectVal = undefined;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0350
     * @tc.name testFloat64ArrayAt035
     * @tc.desc Verify at reads first element of 100-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(100);
      for (let i: int = 0; i < 100; i++) {
        arr.$_set(i, i * onePointZero);
      }
      const firstIndex: int = 0;
      const actualValue = arr.at(firstIndex);
      const expectedValue: number = zeroPointZero;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0360
     * @tc.name testFloat64ArrayAt036
     * @tc.desc Verify at reads last element of 100-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const fillValue99: number = 99.0;
      const arr = new Float64Array(100);
      for (let i: int = 0; i < 100; i++) {
        arr.$_set(i, i * onePointZero);
      }
      const index99: int = 99;
      const actualValue = arr.at(index99);
      const expectedValue: number = fillValue99;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0370
     * @tc.name testFloat64ArrayAt037
     * @tc.desc Verify at with index=-1 reads last element of 100-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const fillValue99: number = 99.0;
      const arr = new Float64Array(100);
      for (let i: int = 0; i < 100; i++) {
        arr.$_set(i, i * onePointZero);
      }
      const hundredElementLastIndex: int = -1;
      const actualValue = arr.at(hundredElementLastIndex);
      const expectedValue: number = fillValue99;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0380
     * @tc.name testFloat64ArrayAt038
     * @tc.desc Verify at with index=-100 reads first element of 100-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(100);
      for (let i: int = 0; i < 100; i++) {
        arr.$_set(i, i * onePointZero);
      }
      const negativeLargeOobIndex: int = -100;
      const actualValue = arr.at(negativeLargeOobIndex);
      const expectedValue: number = zeroPointZero;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0390
     * @tc.name testFloat64ArrayAt039
     * @tc.desc Verify at reads middle element of 100-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const fiftyPointzero: number = 50.0;
      const arr = new Float64Array(100);
      for (let i: int = 0; i < 100; i++) {
        arr.$_set(i, i * onePointZero);
      }
      const indexFifty: int = 50;
      const actualValue = arr.at(indexFifty);
      const expectedValue: number = fiftyPointzero;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0400
     * @tc.name testFloat64ArrayAt040
     * @tc.desc Verify at with index=-50 reads element at offset 50 from end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const fiftyPointzero: number = 50.0;
      const arr = new Float64Array(100);
      for (let i: int = 0; i < 100; i++) {
        arr.$_set(i, i * onePointZero);
      }
      const fiftyFromEndIndex: int = -50;
      const actualValue = arr.at(fiftyFromEndIndex);
      const expectedValue: number = fiftyPointzero;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0410
     * @tc.name testFloat64ArrayAt041
     * @tc.desc Verify at with int type variable index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const idx: int = 0;
      const actualValue = arr.at(idx);
      const expectedValue: number = pointOne;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0420
     * @tc.name testFloat64ArrayAt042
     * @tc.desc Verify at with int type variable index -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const idx: int = -1;
      const actualValue = arr.at(idx);
      const expectedValue: number = pointTwoFive;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0430
     * @tc.name testFloat64ArrayAt043
     * @tc.desc Verify at with int variable computed as length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int16MinValue, int8MinValue, zeroValue);
      const idx: int = arr.length - 1;
      const actualValue = arr.at(idx);
      const expectedValue: number = zeroValue;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0440
     * @tc.name testFloat64ArrayAt044
     * @tc.desc Verify at with int variable computed as -length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int32MinValue, negativeOne, zeroValue);
      const idx: int = -arr.length;
      const actualValue = arr.at(idx);
      const expectedValue: number = int32MinValue;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0450
     * @tc.name testFloat64ArrayAt045
     * @tc.desc Verify at return value is not undefined when element found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const firstIndex: int = 0;
      const actualValue = arr.at(firstIndex);
      const expectVal = false;
      expect(actualValue === undefined).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0460
     * @tc.name testFloat64ArrayAt046
     * @tc.desc Verify at return value is undefined when index out of bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const indexTen: int = 10;
      const actualValue = arr.at(indexTen);
      const expectVal = undefined;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0470
     * @tc.name testFloat64ArrayAt047
     * @tc.desc Verify at return value can participate in numeric operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const negnum32758Value: number = -32758;
      const arr = Float64Array.of(int16MinValue, int8MinValue, zeroValue);
      const firstIndex: int = 0;
      const actualValue = arr.at(firstIndex);
      const sum = (actualValue as number) + 10.0;
      const expectedValue: number = negnum32758Value;
      const expectVal = expectedValue;
      expect(sum).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0480
     * @tc.name testFloat64ArrayAt048
     * @tc.desc Verify at return value can be used in comparison operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const thresholdValue: number = 1.0;
      const arr = Float64Array.of(int32MinValue, negativeOne, zeroValue);
      const secondIndex: int = 1;
      const actualValue = arr.at(secondIndex);
      const expectVal = false;
      expect((actualValue as number) > thresholdValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0490
     * @tc.name testFloat64ArrayAt049
     * @tc.desc Verify original array elements are unchanged after at
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const elementBeforeCall = arr.$_get(0);
      const firstIndex: int = 0;
      arr.at(firstIndex);
      const actVal2 = arr.$_get(0);
      const expectVal = elementBeforeCall;
      expect(actVal2).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0500
     * @tc.name testFloat64ArrayAt050
     * @tc.desc Verify multiple at calls with same index return same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int16MinValue, int8MinValue, zeroValue);
      const secondIndex: int = 1;
      const firstActualValue = arr.at(secondIndex);
      const secondActualValue = arr.at(secondIndex);
      const expectVal = secondActualValue;
      expect(firstActualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0510
     * @tc.name testFloat64ArrayAt051
     * @tc.desc Verify at returns undefined with correct type when out of bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const arr = Float64Array.of(int32MinValue, negativeOne);
      const indexFive: int = 5;
      const actualValue = arr.at(indexFive);
      const expectVal = undefined;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0520
     * @tc.name testFloat64ArrayAt052
     * @tc.desc Verify at with index -0 returns first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tenPointZero: number = 10.0;
      const twentyPointZero: number = 20.0;
      const thirtyPointZero: number = 30.0;
      const arr = Float64Array.of(tenPointZero, twentyPointZero, thirtyPointZero);
      const idx: int = -0;
      const actualValue = arr.at(idx);
      const expectedValue: number = tenPointZero;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0530
     * @tc.name testFloat64ArrayAt053
     * @tc.desc Verify at with NaN as int index returns first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tenPointZero: number = 10.0;
      const twentyPointZero: number = 20.0;
      const thirtyPointZero: number = 30.0;
      const arr = Float64Array.of(tenPointZero, twentyPointZero, thirtyPointZero);
      const idx: int = Double.toInt(NaN);
      const actualValue = arr.at(idx);
      const expectedValue: number = tenPointZero;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0540
     * @tc.name testFloat64ArrayAt054
     * @tc.desc Verify at truncates float index to int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tenPointZero: number = 10.0;
      const twentyPointZero: number = 20.0;
      const thirtyPointZero: number = 30.0;
      const arr = Float64Array.of(tenPointZero, twentyPointZero, thirtyPointZero);
      const idx: int = Double.toInt(1.9);
      const actualValue = arr.at(idx);
      const expectedValue: number = twentyPointZero;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0550
     * @tc.name testFloat64ArrayAt055
     * @tc.desc Verify at reads NaN element from array containing only NaN values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = NaN;
      const arr = Float64Array.of(nanValue, nanValue, nanValue);
      const secondIndex: int = 1;
      const actualValue = arr.at(secondIndex);
      const actVal3 = Number.isNaN(actualValue as Double);
      const expectVal = true;
      expect(actVal3).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0560
     * @tc.name testFloat64ArrayAt056
     * @tc.desc Verify at reads Infinity element from mixed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Infinity;
      const negativeInfinity: number = -Infinity;
      const arr = Float64Array.of(positiveInfinity, negativeInfinity, positiveInfinity);
      const firstIndex: int = 0;
      const actualValue = arr.at(firstIndex);
      const expectedValue: number = positiveInfinity;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0570
     * @tc.name testFloat64ArrayAt057
     * @tc.desc Verify at reads -Infinity element via negative index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const negativeInfinity: number = -Infinity;
      const threePointZero: number = 3.0;
      const arr = Float64Array.of(onePointZero, negativeInfinity, threePointZero);
      const secondFromLastIndex: int = -2;
      const actualValue = arr.at(secondFromLastIndex);
      const expectedValue: number = negativeInfinity;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0580
     * @tc.name testFloat64ArrayAt058
     * @tc.desc Verify at reads -0.0 element correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeZero: number = -0.0;
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const arr = Float64Array.of(negativeZero, onePointZero, twoPointZero);
      const firstIndex: int = 0;
      const actualValue = arr.at(firstIndex);
      const expectedValue: number = negativeZero;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0590
     * @tc.name testFloat64ArrayAt059
     * @tc.desc Verify at with negative index on subarray view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const piValue: number = 3.141592653589793;
      const tinyNegativeValue: number = -1e-100;
      const sub = Float64Array.of(zeroValue, piValue);
      const subArrayLastIndex: int = -1;
      const actualValue = sub.at(subArrayLastIndex);
      const expectedValue: number = piValue;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0600
     * @tc.name testFloat64ArrayAt060
     * @tc.desc Verify at with positive index on subarray view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const pointOneTwoFive: number = 0.125;
      const pointZeroSixTwoFive: number = 0.0625;
      const sub = Float64Array.of(onePointFive, pointTwoFive, pointOneTwoFive);
      const thirdIndex: int = 2;
      const actualValue = sub.at(thirdIndex);
      const expectedValue: number = pointOneTwoFive;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0610
     * @tc.name testFloat64ArrayAt061
     * @tc.desc Verify at returns correct element on copied values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const int8MaxValue: number = 127;
      const int16MaxValue: number = 32767;
      const sliced = Float64Array.of(int8MinValue, zeroValue, int8MaxValue);
      const firstIndex: int = 0;
      const actualValue = sliced.at(firstIndex);
      const expectedValue: number = int8MinValue;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0620
     * @tc.name testFloat64ArrayAt062
     * @tc.desc Verify at returns transformed-equivalent element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negnum4294967296Value: number = -4294967296;
      const mapped = Float64Array.of(negnum4294967296Value, -2.0, 0.0);
      const firstIndex: int = 0;
      const actualValue = mapped.at(firstIndex);
      const expectedValue: number = negnum4294967296Value;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0630
     * @tc.name testFloat64ArrayAt063
     * @tc.desc Verify at returns first selected matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeInteger: number = 9007199254740991;
      const piValue: number = 3.141592653589793;
      const filtered = Float64Array.of(maxSafeInteger, piValue);
      const firstIndex: int = 0;
      const actualValue = filtered.at(firstIndex);
      const expectedValue: number = maxSafeInteger;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0640
     * @tc.name testFloat64ArrayAt064
     * @tc.desc Verify at returns correct element from first two values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const arr = Float64Array.of(pointFive, onePointFive);
      const secondIndex: int = 1;
      const actualValue = arr.at(secondIndex);
      const expectedValue: number = onePointFive;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0650
     * @tc.name testFloat64ArrayAt065
     * @tc.desc Verify at reads middle element of long array 1000 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const num250Pointzero: number = 250.0;
      const arr = new Float64Array(1000);
      for (let i: int = 0; i < 1000; i++) {
        arr.$_set(i, i * pointFive);
      }
      const index500: int = 500;
      const actualValue = arr.at(index500);
      const expectedValue: number = num250Pointzero;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0660
     * @tc.name testFloat64ArrayAt066
     * @tc.desc Verify at with negative index reads middle element from end of long array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const num250Pointzero: number = 250.0;
      const arr = new Float64Array(1000);
      for (let i: int = 0; i < 1000; i++) {
        arr.$_set(i, i * pointFive);
      }
      const negativeIndex500: int = -500;
      const actualValue = arr.at(negativeIndex500);
      const expectedValue: number = num250Pointzero;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0670
     * @tc.name testFloat64ArrayAt067
     * @tc.desc Verify at on array with all identical elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int8MaxValue: number = 127;
      const arr = Float64Array.of(int8MaxValue, int8MaxValue, int8MaxValue, int8MaxValue);
      const thirdIndex: int = 2;
      const actualValue = arr.at(thirdIndex);
      const expectedValue: number = int8MaxValue;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0680
     * @tc.name testFloat64ArrayAt068
     * @tc.desc Verify at on array initialized with all zeros
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(5);
      const indexThree: int = 3;
      const actualValue = arr.at(indexThree);
      const expectedValue: number = zeroPointZero;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0690
     * @tc.name testFloat64ArrayAt069
     * @tc.desc Verify at on array with alternating positive and negative elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const int32MaxValue: number = 2147483647;
      const arr = Float64Array.of(int32MinValue, negativeOne, zeroValue, oneValue, int32MaxValue);
      const indexThree: int = 3;
      const actualValue = arr.at(indexThree);
      const expectedValue: number = oneValue;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0700
     * @tc.name testFloat64ArrayAt070
     * @tc.desc Verify at with negative index on alternating elements array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const piValue: number = 3.141592653589793;
      const tinyNegativeValue: number = -1e-100;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue, piValue, tinyNegativeValue);
      const thirdFromLastIndex: int = -3;
      const actualValue = arr.at(thirdFromLastIndex);
      const expectedValue: number = zeroValue;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0710
     * @tc.name testFloat64ArrayAt071
     * @tc.desc Verify at reads last element of ascending sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const pointOneTwoFive: number = 0.125;
      const pointZeroSixTwoFive: number = 0.0625;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive, pointOneTwoFive, pointZeroSixTwoFive);
      const indexFour: int = 4;
      const actualValue = arr.at(indexFour);
      const expectedValue: number = pointZeroSixTwoFive;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0720
     * @tc.name testFloat64ArrayAt072
     * @tc.desc Verify at with negative index on descending sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const int8MaxValue: number = 127;
      const int16MaxValue: number = 32767;
      const arr = Float64Array.of(int16MinValue, int8MinValue, zeroValue, int8MaxValue, int16MaxValue);
      const secondFromLastIndex: int = -2;
      const actualValue = arr.at(secondFromLastIndex);
      const expectedValue: number = int8MaxValue;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0730
     * @tc.name testFloat64ArrayAt073
     * @tc.desc Verify at reads element from randomly distributed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const int32MaxValue: number = 2147483647;
      const arr = Float64Array.of(int32MinValue, negativeOne, zeroValue, oneValue, int32MaxValue);
      const secondIndex: int = 1;
      const actualValue = arr.at(secondIndex);
      const expectedValue: number = negativeOne;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0740
     * @tc.name testFloat64ArrayAt074
     * @tc.desc Verify at reads scientific notation element from mixed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sciValue10e308: number = 1.0e+308;
      const sciValue20e308: number = 2.0e-308;
      const sciValue30e100: number = 3.0e+100;
      const arr = Float64Array.of(sciValue10e308, sciValue20e308, sciValue30e100);
      const secondIndex: int = 1;
      const actualValue = arr.at(secondIndex);
      const expectedValue: number = sciValue20e308;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0750
     * @tc.name testFloat64ArrayAt075
     * @tc.desc Verify at reads NaN from array with mixed special values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Infinity;
      const negativeInfinity: number = -Infinity;
      const nanValue: number = NaN;
      const zeroPointZero: number = 0.0;
      const negativeZero: number = -0.0;
      const arr = Float64Array.of(positiveInfinity, negativeInfinity, nanValue, zeroPointZero, negativeZero);
      const thirdIndex: int = 2;
      const actualValue = arr.at(thirdIndex);
      const actVal4 = Number.isNaN(actualValue as Double);
      const expectVal = true;
      expect(actVal4).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0760
     * @tc.name testFloat64ArrayAt076
     * @tc.desc Verify at with negative index reads -Infinity from mixed special values array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Infinity;
      const negativeInfinity: number = -Infinity;
      const nanValue: number = NaN;
      const zeroPointZero: number = 0.0;
      const negativeZero: number = -0.0;
      const arr = Float64Array.of(positiveInfinity, negativeInfinity, nanValue, zeroPointZero, negativeZero);
      const fourthFromLastIndex: int = -4;
      const actualValue = arr.at(fourthFromLastIndex);
      const expectedValue: number = negativeInfinity;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0770
     * @tc.name testFloat64ArrayAt077
     * @tc.desc Verify at on copy constructed from existing Float64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const original = Float64Array.of(int32MinValue, negativeOne, zeroValue);
      const copy = new Float64Array(original);
      const secondIndex: int = 1;
      const actualValue = copy.at(secondIndex);
      const expectedValue: number = negativeOne;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0780
     * @tc.name testFloat64ArrayAt078
     * @tc.desc Verify at on Float64Array constructed from number array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tenPointZero: number = 10.0;
      const twentyPointzero: number = 20.0;
      const thirtyPointzero: number = 30.0;
      const arr = new Float64Array(3);
      arr.$_set(0, tenPointZero);
      arr.$_set(1, twentyPointzero);
      arr.$_set(2, thirtyPointzero);
      const thirdIndex: int = 2;
      const actualValue = arr.at(thirdIndex);
      const expectedValue: number = thirtyPointzero;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0790
     * @tc.name testFloat64ArrayAt079
     * @tc.desc Verify at reads first copied-equivalent element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const piValue: number = 3.141592653589793;
      const arr = Float64Array.of(zeroValue, piValue, zeroValue, piValue);
      const firstIndex: int = 0;
      const actualValue = arr.at(firstIndex);
      const expectedValue: number = zeroValue;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0800
     * @tc.name testFloat64ArrayAt080
     * @tc.desc Verify at reads filled-equivalent element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fillValue99: number = 99.0;
      const arr = Float64Array.of(fillValue99, fillValue99, fillValue99, fillValue99, fillValue99);
      const thirdIndex: int = 2;
      const actualValue = arr.at(thirdIndex);
      const expectedValue: number = fillValue99;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0810
     * @tc.name testFloat64ArrayAt081
     * @tc.desc Verify at reads copied-equivalent element from Float64Array values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const secondIndex: int = 1;
      const actualValue = arr.at(secondIndex);
      const expectedValue: number = onePointFive;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0820
     * @tc.name testFloat64ArrayAt082
     * @tc.desc Verify at after reverse operation reads first element of reversed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const reversed = Float64Array.of(zeroValue, int8MinValue, int16MinValue);
      const firstIndex: int = 0;
      const actualValue = reversed.at(firstIndex);
      const expectedValue: number = zeroValue;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0830
     * @tc.name testFloat64ArrayAt083
     * @tc.desc Verify at after sort operation reads smallest element first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const sorted = Float64Array.of(int32MinValue, negativeOne, zeroValue);
      const firstIndex: int = 0;
      const actualValue = sorted.at(firstIndex);
      const expectedValue: number = int32MinValue;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0840
     * @tc.name testFloat64ArrayAt084
     * @tc.desc Verify at with int variable index at last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const piValue: number = 3.141592653589793;
      const tinyNegativeValue: number = -1e-100;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue, piValue, tinyNegativeValue);
      const idx: int = 4;
      const actualValue = arr.at(idx);
      const expectedValue: number = tinyNegativeValue;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0850
     * @tc.name testFloat64ArrayAt085
     * @tc.desc Verify at with array containing integer values reads correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const pointOneTwoFive: number = 0.125;
      const pointZeroSixTwoFive: number = 0.0625;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive, pointOneTwoFive, pointZeroSixTwoFive);
      const thirdIndex: int = 2;
      const actualValue = arr.at(thirdIndex);
      const expectedValue: number = pointTwoFive;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0860
     * @tc.name testFloat64ArrayAt086
     * @tc.desc Verify at with int type index variable reading last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const int8MaxValue: number = 127;
      const arr = Float64Array.of(int16MinValue, int8MinValue, zeroValue, int8MaxValue);
      const idx: int = 3;
      const actualValue = arr.at(idx);
      const expectedValue: number = int8MaxValue;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0870
     * @tc.name testFloat64ArrayAt087
     * @tc.desc Verify at with short type index parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int32MinValue, negativeOne, zeroValue);
      const shortIndex: short = 1;
      const actualValue = arr.at(shortIndex);
      const expectedValue: number = negativeOne;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0880
     * @tc.name testFloat64ArrayAt088
     * @tc.desc Verify at with negative short type index parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const negativeShortIndex: short = -1;
      const actualValue = arr.at(negativeShortIndex);
      const expectedValue: number = zeroValue;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0890
     * @tc.name testFloat64ArrayAt089
     * @tc.desc Verify at with integer array and negative int index at last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const pointOneTwoFive: number = 0.125;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive, pointOneTwoFive);
      const idx: int = -1;
      const actualValue = arr.at(idx);
      const expectedValue: number = pointOneTwoFive;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0900
     * @tc.name testFloat64ArrayAt090
     * @tc.desc Verify at reads integer boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int16MinValue, int8MinValue, zeroValue);
      const firstIndex: int = 0;
      const actualValue = arr.at(firstIndex);
      const expectedValue: number = int16MinValue;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0910
     * @tc.name testFloat64ArrayAt091
     * @tc.desc Verify at with positive assertion on array element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int32MinValue, negativeOne, zeroValue);
      const firstIndex: int = 0;
      const actualValue = arr.at(firstIndex);
      const expectedValue: number = int32MinValue;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0920
     * @tc.name testFloat64ArrayAt092
     * @tc.desc Verify calling at with hex literal argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tenPointZero: number = 10.0;
      const twentyPointZero: number = 20.0;
      const thirtyPointZero: number = 30.0;
      const arr = Float64Array.of(tenPointZero, twentyPointZero, thirtyPointZero);
      const idxHex: int = 0x02;
      const actualValue = arr.at(idxHex);
      const expectedValue: number = thirtyPointZero;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0930
     * @tc.name testFloat64ArrayAt093
     * @tc.desc Verify calling at with binary literal argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tenPointZero: number = 10.0;
      const twentyPointZero: number = 20.0;
      const thirtyPointZero: number = 30.0;
      const arr = Float64Array.of(tenPointZero, twentyPointZero, thirtyPointZero);
      const idx: int = 0b10;
      const actualValue = arr.at(idx);
      const expectedValue: number = thirtyPointZero;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0940
     * @tc.name testFloat64ArrayAt094
     * @tc.desc Verify calling at with Double.toInt(Double.NaN) index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tenPointZero: number = 10.0;
      const arr = Float64Array.of(tenPointZero);
      const idx: int = Double.toInt(Double.NaN);
      const actualValue = arr.at(idx);
      const expectedValue: number = tenPointZero;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0950
     * @tc.name testFloat64ArrayAt095
     * @tc.desc Verify calling at with Double.toInt(Double.POSITIVE_INFINITY) index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threePointzero: number = 3.0;
      const arr = Float64Array.of(threePointzero);
      const idx: int = Double.toInt(Double.POSITIVE_INFINITY);
      const actualValue = arr.at(idx);
      const expectVal = undefined;
      expect(actualValue).assertEqual(expectVal);
    })
  })
}
