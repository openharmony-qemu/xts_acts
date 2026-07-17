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
     * @tc.desc Verify at reads MAX_SAFE_INTEGER element by positive index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeInteger: number = 9007199254740991;
      const arr = new Float64Array([0.1, maxSafeInteger, 0]);
      const maxSafeIndex: int = 1;
      const actualValue = arr.at(maxSafeIndex);
      expect((actualValue as number)).assertEqual(maxSafeInteger);
    });

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
      const arr = Float64Array.of(pointFive, 1.5, 0.25, 0.125, 0.0625);
      const firstIndex: int = 0;
      const actualValue = arr.at(firstIndex);
      const expectedValue: number = pointFive;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0030
     * @tc.name testFloat64ArrayAt003
     * @tc.desc Verify at with binary index reads octal second element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const octalSecondValue: number = 0o10;
      const arr = Float64Array.of(0x01, octalSecondValue, 0b1010, 0x7F, 0o400);
      const secondIndex: short = 0b1;
      const actualValue = arr.at(secondIndex);
      const expectedValue: number = octalSecondValue;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0040
     * @tc.name testFloat64ArrayAt004
     * @tc.desc Verify at with index=length-1 returns last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MaxValue: number = 2147483647;
      const arr = new Float64Array([-2147483648, -1, 0, 1, int32MaxValue]);
      const indexFour: short = 4;
      const actualValue = arr.at(indexFour);
      const expectedValue: number = int32MaxValue;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0050
     * @tc.name testFloat64ArrayAt005
     * @tc.desc Verify at with index=-1 returns last element via negative index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tinyNegativeValue: number = -1e-100;
      const arr = Float64Array.of(0.1, 9007199254740991, 0, 3.141592653589793, tinyNegativeValue);
      const negativeLastIndex: int = -1;
      const actualValue = arr.at(negativeLastIndex);
      const expectedValue: number = tinyNegativeValue;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0060
     * @tc.name testFloat64ArrayAt006
     * @tc.desc Verify at with negative binary index returns hexadecimal second-to-last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexSecondFromLastValue: number = 0x10;
      const arr = Float64Array.of(0x02, 0o4, 0.25, hexSecondFromLastValue, 0b11);
      const secondFromLastIndex: int = -0b10;
      const actualValue = arr.at(secondFromLastIndex);
      const expectedValue: number = hexSecondFromLastValue;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    });

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
      const arr = new Float64Array([int16MinValue, -128, 0, 127, 32767]);
      const fifthFromLastIndex: int = -5;
      const actualValue = arr.at(fifthFromLastIndex);
      const expectedValue: number = int16MinValue;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0080
     * @tc.name testFloat64ArrayAt008
     * @tc.desc Verify at with index=-3 returns middle element via negative index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = Float64Array.of(-2147483648, -1, zeroValue, 1, 2147483647);
      const thirdFromLastIndex: int = -3;
      const actualValue = arr.at(thirdFromLastIndex);
      const expectedValue: number = zeroValue;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0090
     * @tc.name testFloat64ArrayAt009
     * @tc.desc Verify at with index=length out of bounds returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(0.1, 9007199254740991, 0, 3.141592653589793, -1e-100);
      const indexFive: int = 5;
      const actualValue = arr.at(indexFive);
      const expectVal = undefined;
      expect(actualValue).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0100
     * @tc.name testFloat64ArrayAt010
     * @tc.desc Verify at with index=length+1 out of bounds returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.5, 1.5, 0.25, 0.125, 0.0625]);
      const indexSix: int = 6;
      const actualValue = arr.at(indexSix);
      const expectVal = undefined;
      expect(actualValue).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0110
     * @tc.name testFloat64ArrayAt011
     * @tc.desc Verify at with index=-length-1 negative out of bounds returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([-32768, -128, 0, 127, 32767]);
      const indexNegativeSix: int = -6;
      const actualValue = arr.at(indexNegativeSix);
      const expectVal = undefined;
      expect(actualValue).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0120
     * @tc.name testFloat64ArrayAt012
     * @tc.desc Verify at with INT32_MIN index returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([-2147483648, -1, 0, 1, 2147483647]);
      const int32MinIndex: int = -2147483648;
      const actualValue = arr.at(int32MinIndex);
      expect(actualValue).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0130
     * @tc.name testFloat64ArrayAt013
     * @tc.desc Verify at with very large positive index out of bounds returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.1, 9007199254740991, 0]);
      const millionOobIndex: int = 1000000;
      const actualValue = arr.at(millionOobIndex);
      const expectVal = undefined;
      expect(actualValue).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0140
     * @tc.name testFloat64ArrayAt014
     * @tc.desc Verify at with very large negative index out of bounds returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      const negativeMillionOobIndex: int = -1000000;
      const actualValue = arr.at(negativeMillionOobIndex);
      const expectVal = undefined;
      expect(actualValue).assertEqual(expectVal);
    });

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
    });

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
    });

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
    });

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
      const arr = new Float64Array([int32MinValue]);
      const singleElementNegIndex: int = -1;
      const actualValue = arr.at(singleElementNegIndex);
      const expectedValue: number = int32MinValue;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0190
     * @tc.name testFloat64ArrayAt019
     * @tc.desc Verify at with index=1 out of bounds on single-element array returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(0.1);
      const secondIndex: int = 1;
      const actualValue = arr.at(secondIndex);
      const expectVal = undefined;
      expect(actualValue).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0200
     * @tc.name testFloat64ArrayAt020
     * @tc.desc Verify at with index=-2 out of bounds on single-element array returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.5]);
      const secondFromLastIndex: int = -2;
      const actualValue = arr.at(secondFromLastIndex);
      const expectVal = undefined;
      expect(actualValue).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0210
     * @tc.name testFloat64ArrayAt021
     * @tc.desc Verify at reads positive zero element preserving sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const arr = Float64Array.of(zeroPointZero, 1.0, 2.0);
      const firstIndex: int = 0;
      const actualValue = arr.at(firstIndex);
      const actualNumber: number = actualValue as number;
      expect(actualNumber).assertEqual(zeroPointZero);
      expect(1 / actualNumber).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0220
     * @tc.name testFloat64ArrayAt022
     * @tc.desc Verify at reads negative element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const arr = Float64Array.of(-2147483648, negativeOne, 0);
      const secondIndex: int = 1;
      const actualValue = arr.at(secondIndex);
      const expectedValue: number = negativeOne;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    });

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
      const arr = Float64Array.of(positiveInfinity, 2.0, 3.0);
      const firstIndex: int = 0;
      const actualValue = arr.at(firstIndex);
      const expectedValue: number = positiveInfinity;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0240
     * @tc.name testFloat64ArrayAt024
     * @tc.desc Verify at reads -Infinity element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeInfinity: number = -Infinity;
      const arr = Float64Array.of(1.0, negativeInfinity, 3.0);
      const secondIndex: int = 1;
      const actualValue = arr.at(secondIndex);
      const expectedValue: number = negativeInfinity;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0250
     * @tc.name testFloat64ArrayAt025
     * @tc.desc Verify at reads NaN element using Number.isNaN check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = NaN;
      const arr = new Float64Array([1.0, 2.0, nanValue]);
      const thirdIndex: int = 2;
      const actualValue = arr.at(thirdIndex);
      const actVal1 = Number.isNaN(actualValue as Double);
      const expectVal = true;
      expect(actVal1).assertEqual(expectVal);
    });

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
      const arr = new Float64Array([doubleMinValue, 2.0, 3.0]);
      const firstIndex: int = 0;
      const actualValue = arr.at(firstIndex);
      const expectedValue: number = doubleMinValue;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0270
     * @tc.name testFloat64ArrayAt027
     * @tc.desc Verify at reads MAX_VALUE maximum number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMaxValue: number = 1.7976931348623157e+308;
      const arr = new Float64Array([1.0, doubleMaxValue, 3.0]);
      const secondIndex: int = 1;
      const actualValue = arr.at(secondIndex);
      const expectedValue: number = doubleMaxValue;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    });

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
      const arr = Float64Array.of(negativeZero, 2.0, 3.0);
      const firstIndex: int = 0;
      const actualValue = arr.at(firstIndex);
      const actualNumber: number = actualValue as number;
      expect(actualNumber).assertEqual(0.0);
      expect(1 / actualNumber).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0290
     * @tc.name testFloat64ArrayAt029
     * @tc.desc Verify at reads scientific notation element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sciValue10e308: number = 1.0e-308;
      const arr = Float64Array.of(1.0, sciValue10e308, 3.0);
      const secondIndex: int = 1;
      const actualValue = arr.at(secondIndex);
      const expectedValue: number = sciValue10e308;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0300
     * @tc.name testFloat64ArrayAt030
     * @tc.desc Verify at with negative index reads MAX_VALUE at last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMaxValue: number = 1.7976931348623157e+308;
      const arr = new Float64Array([1.0, 2.0, doubleMaxValue]);
      const lastIndex: int = -1;
      const actualValue = arr.at(lastIndex);
      expect((actualValue as number)).assertEqual(doubleMaxValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0310
     * @tc.name testFloat64ArrayAt031
     * @tc.desc Verify at with negative index reads MIN_VALUE in middle position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMinValue: number = 5e-324;
      const arr = Float64Array.of(1.0, doubleMinValue, 3.0);
      const middleFromEndIndex: int = -2;
      const actualValue = arr.at(middleFromEndIndex);
      expect((actualValue as number)).assertEqual(doubleMinValue);
    });

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
      const arr = Float64Array.of(precisePointOnePlusPointTwo, 2.0);
      const firstIndex: int = 0;
      const actualValue = arr.at(firstIndex);
      const expectedValue: number = precisePointOnePlusPointTwo;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0330
     * @tc.name testFloat64ArrayAt033
     * @tc.desc Verify at with INT32_MAX index returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(-32768, -128);
      const int32MaxIndex: int = 2147483647;
      const actualValue = arr.at(int32MaxIndex);
      expect(actualValue).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0340
     * @tc.name testFloat64ArrayAt034
     * @tc.desc Verify at with negative hex literal out of bounds returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([-2147483648, -1]);
      const negativeHexOobIndex: int = -0x400;
      const actualValue = arr.at(negativeHexOobIndex);
      expect(actualValue).assertUndefined();
    });

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
    });

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
    });

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
    });

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
    });

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
      const fiftyPointZero: number = 50.0;
      const arr = new Float64Array(100);
      for (let i: int = 0; i < 100; i++) {
        arr.$_set(i, i * onePointZero);
      }
      const indexFifty: int = 50;
      const actualValue = arr.at(indexFifty);
      const expectedValue: number = fiftyPointZero;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    });

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
      const fiftyPointZero: number = 50.0;
      const arr = new Float64Array(100);
      for (let i: int = 0; i < 100; i++) {
        arr.$_set(i, i * onePointZero);
      }
      const fiftyFromEndIndex: int = -50;
      const actualValue = arr.at(fiftyFromEndIndex);
      const expectedValue: number = fiftyPointZero;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0410
     * @tc.name testFloat64ArrayAt041
     * @tc.desc Verify at with negative byte index parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const lastValue: number = 30.0;
      const arr = Float64Array.of(10.0, 20.0, lastValue);
      const idx: byte = -1;
      const actualValue = arr.at(idx);
      const expectedValue: number = lastValue;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0420
     * @tc.name testFloat64ArrayAt042
     * @tc.desc Verify at with positive byte index out of bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(0.5, 1.5, 0.25);
      const idx: byte = 10;
      const actualValue = arr.at(idx);
      const expectVal = undefined;
      expect(actualValue).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0430
     * @tc.name testFloat64ArrayAt043
     * @tc.desc Verify at with int variable computed as length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = new Float64Array([-32768, -128, zeroValue]);
      const idx: int = arr.length - 1;
      const actualValue = arr.at(idx);
      const expectedValue: number = zeroValue;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    });

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
      const arr = new Float64Array([int32MinValue, -1, 0]);
      const idx: int = -arr.length;
      const actualValue = arr.at(idx);
      const expectedValue: number = int32MinValue;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0450
     * @tc.name testFloat64ArrayAt045
     * @tc.desc Verify at with positive short index out of bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.1, 9007199254740991, 0]);
      const idx: short = 10;
      const actualValue = arr.at(idx);
      const expectVal = undefined;
      expect(actualValue).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0460
     * @tc.name testFloat64ArrayAt046
     * @tc.desc Verify at return value is undefined when index out of bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      const indexTen: int = 10;
      const actualValue = arr.at(indexTen);
      const expectVal = undefined;
      expect(actualValue).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0470
     * @tc.name testFloat64ArrayAt047
     * @tc.desc Verify at length-1 index matches negative one index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const lastValue: number = 0.25;
      const arr = new Float64Array([0.5, 1.5, lastValue]);
      const lastPositiveIndex: int = arr.length - 1;
      const lastNegativeIndex: int = -1;
      const positiveResult = arr.at(lastPositiveIndex);
      const negativeResult = arr.at(lastNegativeIndex);
      expect((positiveResult as number)).assertEqual(lastValue);
      expect(positiveResult).assertEqual(negativeResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0480
     * @tc.name testFloat64ArrayAt048
     * @tc.desc Verify at index 0 matches negative length index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const firstValue: number = -2147483648;
      const arr = Float64Array.of(firstValue, -1, 0);
      const firstIndex: int = 0;
      const negativeLengthIndex: int = -3;
      const positiveResult = arr.at(firstIndex);
      const negativeResult = arr.at(negativeLengthIndex);
      expect((positiveResult as number)).assertEqual(firstValue);
      expect(positiveResult).assertEqual(negativeResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0490
     * @tc.name testFloat64ArrayAt049
     * @tc.desc Verify original array elements are unchanged after at
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      const firstBeforeCall = arr.$_get(0);
      const secondBeforeCall = arr.$_get(1);
      const firstIndex: int = 0;
      arr.at(firstIndex);
      const firstAfterCall = arr.$_get(0);
      const secondAfterCall = arr.$_get(1);
      expect(firstAfterCall).assertEqual(firstBeforeCall);
      expect(secondAfterCall).assertEqual(secondBeforeCall);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0500
     * @tc.name testFloat64ArrayAt050
     * @tc.desc Verify multiple at calls with same index return same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([-32768, -128, 0]);
      const secondIndex: int = 1;
      const firstActualValue = arr.at(secondIndex);
      const secondActualValue = arr.at(secondIndex);
      const expectVal = secondActualValue;
      expect(firstActualValue).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0510
     * @tc.name testFloat64ArrayAt051
     * @tc.desc Verify at with Double.toInt(Double.NEGATIVE_INFINITY) index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([10.0, 20.0, 30.0]);
      const idx: int = Double.toInt(Double.NEGATIVE_INFINITY);
      const actualValue = arr.at(idx);
      const expectVal = undefined;
      expect(actualValue).assertEqual(expectVal);
    });

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
      const arr = new Float64Array([tenPointZero, 20.0, 30.0]);
      const idx: int = -0;
      const actualValue = arr.at(idx);
      const expectedValue: number = tenPointZero;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    });

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
      const arr = new Float64Array([tenPointZero, 20.0, 30.0]);
      const idx: int = Double.toInt(NaN);
      const actualValue = arr.at(idx);
      const expectedValue: number = tenPointZero;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0540
     * @tc.name testFloat64ArrayAt054
     * @tc.desc Verify at truncates float index to int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twentyPointZero: number = 20.0;
      const arr = new Float64Array([10.0, twentyPointZero, 30.0]);
      const idx: int = Double.toInt(1.9);
      const actualValue = arr.at(idx);
      const expectedValue: number = twentyPointZero;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0550
     * @tc.name testFloat64ArrayAt055
     * @tc.desc Verify at with negative index reads NaN element from mixed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = NaN;
      const arr = new Float64Array([1.0, nanValue, 2.0]);
      const negativeMiddleIndex: int = -2;
      const actualValue = arr.at(negativeMiddleIndex);
      expect(Number.isNaN(actualValue as Double)).assertTrue();
    });

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
      const arr = new Float64Array([positiveInfinity, negativeInfinity, positiveInfinity]);
      const firstIndex: int = 0;
      const actualValue = arr.at(firstIndex);
      const expectedValue: number = positiveInfinity;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0570
     * @tc.name testFloat64ArrayAt057
     * @tc.desc Verify at reads -Infinity element via negative index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeInfinity: number = -Infinity;
      const arr = Float64Array.of(1.0, negativeInfinity, 3.0);
      const secondFromLastIndex: int = -2;
      const actualValue = arr.at(secondFromLastIndex);
      const expectedValue: number = negativeInfinity;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0580
     * @tc.name testFloat64ArrayAt058
     * @tc.desc Verify at with negative index reads -0.0 element preserving sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeZero: number = -0.0;
      const arr = Float64Array.of(1.0, 2.0, negativeZero);
      const lastIndex: int = -1;
      const actualValue = arr.at(lastIndex);
      const actualNumber: number = actualValue as number;
      expect(actualNumber).assertEqual(0.0);
      expect(1 / actualNumber).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0590
     * @tc.name testFloat64ArrayAt059
     * @tc.desc Verify at with negative index reads last element from subarray view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const piValue: number = 3.141592653589793;
      const parent = Float64Array.of(0.1, 9007199254740991, 0, piValue, -1e-100);
      const sub = parent.subarray(1, 4);
      const subArrayLastIndex: int = -1;
      const actualValue = sub.at(subArrayLastIndex);
      expect((actualValue as number)).assertEqual(piValue);
      expect(sub.buffer).assertEqual(parent.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0600
     * @tc.name testFloat64ArrayAt060
     * @tc.desc Verify at with positive index reads updated element from subarray view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOneTwoFive: number = 0.125;
      const parent = Float64Array.of(0.5, 1.5, 0.25, 0.0);
      const sub = parent.subarray(1, 4);
      parent.$_set(2, pointOneTwoFive);
      const secondIndex: int = 1;
      const actualValue = sub.at(secondIndex);
      expect((actualValue as number)).assertEqual(pointOneTwoFive);
      expect(parent.$_get(2)).assertEqual(pointOneTwoFive);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0610
     * @tc.name testFloat64ArrayAt061
     * @tc.desc Verify at reads element from sliced copy values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int8MinValue: number = -128;
      const source = new Float64Array([-32768, int8MinValue, 0, 127, 32767]);
      const sliced = source.slice(1, 4);
      const firstIndex: int = 0;
      const actualValue = sliced.at(firstIndex);
      expect((actualValue as number)).assertEqual(int8MinValue);
      sliced[0] = 64.0;
      expect(source[1]).assertEqual(int8MinValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0620
     * @tc.name testFloat64ArrayAt062
     * @tc.desc Verify at reads element from chained map result with hexadecimal multiplier
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negnum4Value: number = -4.0;
      const source = new Float64Array([-2.0, -1.0, 0.0]);
      const hexMultiplier: number = 0x02;
      const firstIndex: int = 0b0;
      const actualValue = source.map((value: number): number => value * hexMultiplier).at(firstIndex);
      expect((actualValue as number)).assertEqual(negnum4Value);
      expect(source.$_get(0)).assertEqual(-2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0630
     * @tc.name testFloat64ArrayAt063
     * @tc.desc Verify at reads first element from filtered Float64Array result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeInteger: number = 9007199254740991;
      const source = Float64Array.of(1.0, maxSafeInteger, 3.141592653589793);
      const filtered = source.filter((value: number): boolean => value > 3.0);
      const firstIndex: int = 0;
      const actualValue = filtered.at(firstIndex);
      expect((actualValue as number)).assertEqual(maxSafeInteger);
      expect(filtered.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0640
     * @tc.name testFloat64ArrayAt064
     * @tc.desc Verify at with two-element array reads second element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointFive: number = 1.5;
      const arr = new Float64Array([0.5, onePointFive]);
      const secondIndex: int = 1;
      const actualValue = arr.at(secondIndex);
      expect((actualValue as number)).assertEqual(onePointFive);
    });

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
    });

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
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0670
     * @tc.name testFloat64ArrayAt067
     * @tc.desc Verify at reads distinct target element among repeated values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int8MaxValue: number = 127;
      const distinctValue: number = 255.0;
      const arr = Float64Array.of(int8MaxValue, int8MaxValue, distinctValue, int8MaxValue);
      const thirdIndex: int = 2;
      const actualValue = arr.at(thirdIndex);
      expect((actualValue as number)).assertEqual(distinctValue);
      expect(arr.$_get(1)).assertEqual(int8MaxValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0680
     * @tc.name testFloat64ArrayAt068
     * @tc.desc Verify at reads value written by $_set after fixed-length initialization
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const setValue: number = 8.0;
      const arr = new Float64Array(5);
      arr.$_set(3, setValue);
      const indexThree: int = 3;
      const actualValue = arr.at(indexThree);
      expect((actualValue as number)).assertEqual(setValue);
      expect(arr.at(0)).assertEqual(zeroPointZero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0690
     * @tc.name testFloat64ArrayAt069
     * @tc.desc Verify at on array with alternating positive and negative elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const arr = new Float64Array([-2147483648, -1, 0, oneValue, 2147483647]);
      const indexThree: int = 3;
      const actualValue = arr.at(indexThree);
      const expectedValue: number = oneValue;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0700
     * @tc.name testFloat64ArrayAt070
     * @tc.desc Verify at with negative index on alternating elements array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = new Float64Array([0.1, 9007199254740991, zeroValue, 3.141592653589793, -1e-100]);
      const thirdFromLastIndex: int = -3;
      const actualValue = arr.at(thirdFromLastIndex);
      const expectedValue: number = zeroValue;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0710
     * @tc.name testFloat64ArrayAt071
     * @tc.desc Verify at with negative floating index truncates to last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const lastValue: number = 30.0;
      const arr = Float64Array.of(10.0, 20.0, lastValue);
      const idx: int = Double.toInt(-1.9);
      const actualValue = arr.at(idx);
      expect((actualValue as number)).assertEqual(lastValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0720
     * @tc.name testFloat64ArrayAt072
     * @tc.desc Verify at with negative index on descending sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int8MinValue: number = -128;
      const arr = Float64Array.of(32767, 127, 0, int8MinValue, -32768);
      const secondFromLastIndex: int = -2;
      const actualValue = arr.at(secondFromLastIndex);
      expect((actualValue as number)).assertEqual(int8MinValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0730
     * @tc.name testFloat64ArrayAt073
     * @tc.desc Verify at with byte minimum index returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(3.0, -1, 5.0, 0.0, 2.0);
      const idx: byte = -128;
      const actualValue = arr.at(idx);
      const expectVal = undefined;
      expect(actualValue).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0740
     * @tc.name testFloat64ArrayAt074
     * @tc.desc Verify at with negative index reads scientific notation element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sciValue20e308: number = 2.0e-308;
      const arr = Float64Array.of(1.0e+308, sciValue20e308, 3.0e+100);
      const secondFromLastIndex: int = -2;
      const actualValue = arr.at(secondFromLastIndex);
      expect((actualValue as number)).assertEqual(sciValue20e308);
    });

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
      const arr = new Float64Array([positiveInfinity, negativeInfinity, nanValue, 0.0, -0.0]);
      const thirdIndex: int = 2;
      const actualValue = arr.at(thirdIndex);
      const actVal4 = Number.isNaN(actualValue as Double);
      const expectVal = true;
      expect(actVal4).assertEqual(expectVal);
    });

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
      const arr = new Float64Array([positiveInfinity, negativeInfinity, nanValue, 0.0, -0.0]);
      const fourthFromLastIndex: int = -4;
      const actualValue = arr.at(fourthFromLastIndex);
      const expectedValue: number = negativeInfinity;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0770
     * @tc.name testFloat64ArrayAt077
     * @tc.desc Verify at on copy constructed from existing Float64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const original = new Float64Array([-2147483648, negativeOne, 0]);
      const copy = new Float64Array(original);
      const secondIndex: int = 1;
      const actualValue = copy.at(secondIndex);
      const expectedValue: number = negativeOne;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0780
     * @tc.name testFloat64ArrayAt078
     * @tc.desc Verify at on Float64Array constructed from number array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const thirtyPointZero: number = 30.0;
      const input: Array<number> = [10.0, 20.0, thirtyPointZero];
      const arr = new Float64Array(input);
      const thirdIndex: int = 2;
      const actualValue = arr.at(thirdIndex);
      expect((actualValue as number)).assertEqual(thirtyPointZero);
      expect(arr.length).assertEqual(input.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0790
     * @tc.name testFloat64ArrayAt079
     * @tc.desc Verify at reads copied element after copyWithin operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const piValue: number = 3.141592653589793;
      const arr = new Float64Array([0.0, piValue, 2.0, 3.0]);
      arr.copyWithin(2, 1, 2);
      const copiedIndex: int = 2;
      const actualValue = arr.at(copiedIndex);
      expect((actualValue as number)).assertEqual(piValue);
      expect(arr.$_get(1)).assertEqual(piValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0800
     * @tc.name testFloat64ArrayAt080
     * @tc.desc Verify at reads element after fill operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fillValue99: number = 99.0;
      const arr = Float64Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      arr.fill(fillValue99, 1, 4);
      const thirdIndex: int = 2;
      const actualValue = arr.at(thirdIndex);
      expect((actualValue as number)).assertEqual(fillValue99);
      expect(arr.$_get(4)).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0810
     * @tc.name testFloat64ArrayAt081
     * @tc.desc Verify at reads element from sliced Float64Array values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointFive: number = 1.5;
      const source = new Float64Array([0.5, onePointFive, 0.25, 0.125]);
      const sliced = source.slice(1, 3);
      const firstIndex: int = 0;
      const actualValue = sliced.at(firstIndex);
      expect((actualValue as number)).assertEqual(onePointFive);
      expect(sliced.length).assertEqual(2);
    });

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
      const reversed = Float64Array.of(0, -128, int16MinValue);
      reversed.reverse();
      const firstIndex: int = 0;
      const actualValue = reversed.at(firstIndex);
      expect((actualValue as number)).assertEqual(int16MinValue);
      expect(reversed.$_get(2)).assertEqual(0);
    });

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
      const sorted = new Float64Array([0, -1, int32MinValue]);
      sorted.sort();
      const firstIndex: int = 0;
      const actualValue = sorted.at(firstIndex);
      expect((actualValue as number)).assertEqual(int32MinValue);
      expect(sorted.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0840
     * @tc.name testFloat64ArrayAt084
     * @tc.desc Verify at with computed negative int variable reads last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tinyNegativeValue: number = -1e-100;
      const arr = Float64Array.of(0.1, 9007199254740991, 0, 3.141592653589793, tinyNegativeValue);
      const idx: int = 0 - 1;
      const actualValue = arr.at(idx);
      expect((actualValue as number)).assertEqual(tinyNegativeValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0850
     * @tc.name testFloat64ArrayAt085
     * @tc.desc Verify at with array containing integer values reads middle element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const middleValue: number = 3.0;
      const arr = new Float64Array([1.0, 2.0, middleValue, 4.0, 5.0]);
      const thirdIndex: int = 2;
      const actualValue = arr.at(thirdIndex);
      expect((actualValue as number)).assertEqual(middleValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0860
     * @tc.name testFloat64ArrayAt086
     * @tc.desc Verify at with negative int type index variable reads second from last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = new Float64Array([-32768, -128, zeroValue, 127]);
      const idx: int = -2;
      const actualValue = arr.at(idx);
      expect((actualValue as number)).assertEqual(zeroValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0870
     * @tc.name testFloat64ArrayAt087
     * @tc.desc Verify at with short type index parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const arr = Float64Array.of(-2147483648, negativeOne, 0);
      const shortIndex: short = 1;
      const actualValue = arr.at(shortIndex);
      const expectedValue: number = negativeOne;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0880
     * @tc.name testFloat64ArrayAt088
     * @tc.desc Verify at with negative short type index parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = Float64Array.of(0.1, 9007199254740991, zeroValue);
      const negativeShortIndex: short = -1;
      const actualValue = arr.at(negativeShortIndex);
      const expectedValue: number = zeroValue;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0890
     * @tc.name testFloat64ArrayAt089
     * @tc.desc Verify at with short minimum index returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([10.0, 20.0, 30.0, 40.0]);
      const idx: short = -32768;
      const actualValue = arr.at(idx);
      const expectVal = undefined;
      expect(actualValue).assertEqual(expectVal);
    });

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
      const secondIndex: int = 1;
      const thirdIndex: int = 2;
      expect(arr.at(firstIndex)).assertEqual(int16MinValue);
      expect(arr.at(secondIndex)).assertEqual(int8MinValue);
      expect(arr.at(thirdIndex)).assertEqual(zeroValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0910
     * @tc.name testFloat64ArrayAt091
     * @tc.desc Verify at negative index result matches direct bracket access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const arr = new Float64Array([-2147483648, negativeOne, 0]);
      const secondFromLastIndex: int = -2;
      const actualValue = arr.at(secondFromLastIndex);
      const directValue = arr[1];
      expect(actualValue).assertEqual(directValue);
      expect((actualValue as number)).assertEqual(negativeOne);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0920
     * @tc.name testFloat64ArrayAt092
     * @tc.desc Verify calling at with hex literal argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const thirtyPointZero: number = 30.0;
      const arr = Float64Array.of(10.0, 20.0, thirtyPointZero);
      const idxHex: int = 0x02;
      const actualValue = arr.at(idxHex);
      const expectedValue: number = thirtyPointZero;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0930
     * @tc.name testFloat64ArrayAt093
     * @tc.desc Verify calling at with binary literal argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const thirtyPointZero: number = 30.0;
      const arr = Float64Array.of(10.0, 20.0, thirtyPointZero);
      const idx: int = 0b10;
      const actualValue = arr.at(idx);
      const expectedValue: number = thirtyPointZero;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    });

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
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0950
     * @tc.name testFloat64ArrayAt095
     * @tc.desc Verify calling at with Double.toInt(Double.POSITIVE_INFINITY) index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([3.0]);
      const idx: int = Double.toInt(Double.POSITIVE_INFINITY);
      const actualValue = arr.at(idx);
      const expectVal = undefined;
      expect(actualValue).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0960
     * @tc.name testFloat64ArrayAt096
     * @tc.desc Verify calling at with Double.toInt(Double.MIN_VALUE/MAX_VALUE) index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tenPointZero: number = 10.0;
      const arr = Float64Array.of(tenPointZero);
      const idxMin: int = Double.toInt(Double.MIN_VALUE);
      const idxMax: int = Double.toInt(Double.MAX_VALUE);
      const actualValue = arr.at(idxMin);
      const expectedValue: number = tenPointZero;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
      const actVal5 = arr.at(idxMax);
      const expectVal2 = undefined;
      expect(actVal5).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0970
     * @tc.name testFloat64ArrayAt097
     * @tc.desc Verify at with byte type index parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeInteger: number = 9007199254740991;
      const arr = Float64Array.of(0.1, maxSafeInteger, 0);
      const idx: byte = 1;
      const actualValue = arr.at(idx);
      const expectedValue: number = maxSafeInteger;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0980
     * @tc.name testFloat64ArrayAt098
     * @tc.desc Verify calling at with octal literal argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const thirtyPointZero: number = 30.0;
      const arr = Float64Array.of(10.0, 20.0, thirtyPointZero);
      const idx: int = 0o02;
      const actualValue = arr.at(idx);
      const expectedValue: number = thirtyPointZero;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_0990
     * @tc.name testFloat64ArrayAt099
     * @tc.desc Verify at on Float64Array constructed from FixedArray<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fifteenPointzero: number = 15.0;
      const fixedArrayInput: FixedArray<number> = [5.0, 10.0, 15.0];
      const arr = new Float64Array(fixedArrayInput);
      const fixedArrayConstructedNegIndex: int = -1;
      const actualValue = arr.at(fixedArrayConstructedNegIndex);
      const expectedValue: number = fifteenPointzero;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_1000
     * @tc.name testFloat64ArrayAt100
     * @tc.desc Verify at on Float64Array constructed from Array<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const thirtyPointZero: number = 30.0;
      const arrayInput: Array<number> = [10.0, 20.0, 30.0];
      const arr = new Float64Array(arrayInput);
      const thirdIndex: int = 2;
      const actualValue = arr.at(thirdIndex);
      const expectedValue: number = thirtyPointZero;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_1010
     * @tc.name testFloat64ArrayAt101
     * @tc.desc Verify $_set then at reads updated element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const updatedValue: number = 33.0;
      const arr = new Float64Array([10.0, 20.0, 30.0]);
      const updateIndex: int = 2;
      arr.$_set(updateIndex, updatedValue);
      const actVal6 = arr.at(updateIndex);
      expect((actVal6 as number)).assertEqual(updatedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_1020
     * @tc.name testFloat64ArrayAt102
     * @tc.desc Verify nested at using at result as index for next at
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const arr = Float64Array.of(2.0, 99.0, onePointZero, 88.0, 77.0);
      const firstIndex: int = 0;
      const firstElementAsIndex: number = arr.at(firstIndex) as number;
      const actualValue = arr.at(Double.toInt(firstElementAsIndex));
      const expectedValue: number = onePointZero;
      const expectVal = expectedValue;
      expect(actualValue).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_1030
     * @tc.name testFloat64ArrayAt103
     * @tc.desc Verify at return value participating in arithmetic operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sevenPointZero: number = 7.0;
      const thirtyPointZero: number = 30.0;
      const preciseTenDividedByThree: number = 3.3333333333333335;
      const arr = new Float64Array([10.0, 3.0, 20.0]);
      const firstIndex: int = 0;
      const firstActualValue: number = arr.at(firstIndex) as number;
      const secondIndex: int = 1;
      const secondActualValue: number = arr.at(secondIndex) as number;
      const expectedValue: number = sevenPointZero;
      const expectedValue2: number = thirtyPointZero;
      const expectedValue3: number = preciseTenDividedByThree;
      expect(firstActualValue - secondActualValue).assertEqual(expectedValue);
      expect(firstActualValue * secondActualValue).assertEqual(expectedValue2);
      expect(firstActualValue / secondActualValue).assertEqual(expectedValue3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_1040
     * @tc.name testFloat64ArrayAt104
     * @tc.desc Verify at with negative floating index truncates to second from last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const expectedValue: number = 30.0;
      const arr = new Float64Array([10.0, 20.0, expectedValue, 40.0]);
      const idx: int = Double.toInt(-2.9);
      const actualValue = arr.at(idx);
      expect((actualValue as number)).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_1050
     * @tc.name testFloat64ArrayAt105
     * @tc.desc Verify at positive index matches direct bracket access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(10.0, 20.0, 30.0);
      const secondIndex: int = 1;
      const atResult = arr.at(secondIndex);
      const bracketResult = arr[1];
      const expectVal = bracketResult;
      expect(atResult).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_1060
     * @tc.name testFloat64ArrayAt106
     * @tc.desc Verify at index 0 returns defined first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tenPointZero: number = 10.0;
      const arr = Float64Array.of(tenPointZero);
      const firstIndex: int = 0;
      const value: number | undefined = arr.at(firstIndex);
      expect(value).assertEqual(tenPointZero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_1070
     * @tc.name testFloat64ArrayAt107
     * @tc.desc Verify at reflects element mutation via bracket assignment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(10.0, 20.0, 30.0);
      const secondIndex: int = 1;
      const before = arr.at(secondIndex);
      arr[1] = 99.0;
      const after = arr.at(secondIndex);
      const expectVal = 20.0;
      expect(before).assertEqual(expectVal);
      const expectVal2 = 99.0;
      expect(after).assertEqual(expectVal2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_AT_1080
     * @tc.name testFloat64ArrayAt108
     * @tc.desc Verify at negative one reflects updated last element after reassignment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayAt108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(10.0, 20.0);
      const tailIndex: int = -1;
      const originalTail = arr.at(tailIndex);
      arr[1] = 99.0;
      const updatedTail = arr.at(tailIndex);
      const expectVal = 20.0;
      expect(originalTail).assertEqual(expectVal);
      const expectVal2 = 99.0;
      expect(updatedTail).assertEqual(expectVal2);
    });
  })
}
