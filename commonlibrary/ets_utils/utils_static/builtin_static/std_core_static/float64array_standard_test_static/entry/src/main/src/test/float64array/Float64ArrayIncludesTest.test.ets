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

export default function Float64ArrayIncludesTest(): void {
  describe('Float64ArrayIncludesTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0010
     * @tc.name testFloat64ArrayIncludes001
     * @tc.desc Verify includes called without arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const negonePointzero: number = -1.0;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const result = arr.includes(negonePointzero);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0020
     * @tc.name testFloat64ArrayIncludes002
     * @tc.desc Verify includes called with single argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const twoPointZero: number = 2.0;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue);
      const result = arr.includes(twoPointZero);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0030
     * @tc.name testFloat64ArrayIncludes003
     * @tc.desc Verify includes called with two arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const twoPointZero: number = 2.0;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue);
      const result = arr.includes(twoPointZero, 1);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0040
     * @tc.name testFloat64ArrayIncludes004
     * @tc.desc Verify includes search for positive integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const piValue: number = 3.141592653589793;
      const tinyNegativeValue: number = -1e-100;
      const threePointZero: number = 3.0;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue, piValue, tinyNegativeValue);
      const result = arr.includes(threePointZero);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0050
     * @tc.name testFloat64ArrayIncludes005
     * @tc.desc Verify includes search for negative integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const pointOneTwoFive: number = 0.125;
      const pointZeroSixTwoFive: number = 0.0625;
      const negthreePointzero: number = -3.0;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive, pointOneTwoFive, pointZeroSixTwoFive);
      const result = arr.includes(negthreePointzero);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0060
     * @tc.name testFloat64ArrayIncludes006
     * @tc.desc Verify includes search for zero value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const int8MaxValue: number = 127;
      const zeroPointZero: number = 0.0;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue, int8MaxValue);
      const result = arr.includes(zeroPointZero);
      const expectVal = true;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0070
     * @tc.name testFloat64ArrayIncludes007
     * @tc.desc Verify includes search for positive zero +0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const zeroPointZero: number = 0.0;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue);
      const result = arr.includes(+zeroPointZero);
      const expectVal = true;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0080
     * @tc.name testFloat64ArrayIncludes008
     * @tc.desc Verify includes search for negative zero -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const negativeZero: number = -0.0;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const result = arr.includes(negativeZero);
      const expectVal = true;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0090
     * @tc.name testFloat64ArrayIncludes009
     * @tc.desc Verify includes positive zero equals negative zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const zeroPointZero: number = 0.0;
      const negativeZero: number = -0.0;
      const arr = Float64Array.of(pointFive);
      const r1 = arr.includes(+zeroPointZero);
      const r2 = arr.includes(negativeZero);
      const expectVal = false;
      expect(r1).assertEqual(expectVal);
      const expectVal2 = false;
      expect(r2).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0100
     * @tc.name testFloat64ArrayIncludes010
     * @tc.desc Verify includes search for positive Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const positiveInfinity: number = Infinity;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue);
      const result = arr.includes(positiveInfinity);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0110
     * @tc.name testFloat64ArrayIncludes011
     * @tc.desc Verify includes search for negative Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const negativeInfinity: number = -Infinity;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue);
      const result = arr.includes(negativeInfinity);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0120
     * @tc.name testFloat64ArrayIncludes012
     * @tc.desc Verify includes search for NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const nanValue: number = NaN;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const result = arr.includes(nanValue);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0130
     * @tc.name testFloat64ArrayIncludes013
     * @tc.desc Verify includes search among multiple NaN elements 
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointTwoFive: number = 0.25;
      const nanValue: number = NaN;
      const arr = Float64Array.of(pointTwoFive, pointTwoFive, pointTwoFive);
      const result = arr.includes(nanValue);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0140
     * @tc.name testFloat64ArrayIncludes014
     * @tc.desc Verify includes search for minimum positive 5e-324
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const doubleMinValue: number = 5e-324;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue);
      const result = arr.includes(doubleMinValue);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0150
     * @tc.name testFloat64ArrayIncludes015
     * @tc.desc Verify includes search for maximum 1.7976931348623157e+308
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const onePointZero: number = 1.0;
      const maxVal = 1.7976931348623157e+308;
      const arr = Float64Array.of(zeroPointZero, maxVal, onePointZero);
      const result = arr.includes(maxVal);
      const expectVal = true;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0160
     * @tc.name testFloat64ArrayIncludes016
     * @tc.desc Verify includes search for overflow 1.7976931348623158e+308 as Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const positiveInfinity: number = Infinity;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue);
      const result = arr.includes(positiveInfinity);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0170
     * @tc.name testFloat64ArrayIncludes017
     * @tc.desc Verify includes search for scientific notation literal 1.0e-308
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const sciValue10e308: number = 1.0e-308;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const result = arr.includes(sciValue10e308);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0180
     * @tc.name testFloat64ArrayIncludes018
     * @tc.desc Verify includes search for scientific notation literal 1.0e+308
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const sciValue10e308: number = 1.0e+308;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const result = arr.includes(sciValue10e308);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0190
     * @tc.name testFloat64ArrayIncludes019
     * @tc.desc Verify includes search for decimal0.1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const pointOne: number = 0.1;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue);
      const result = arr.includes(pointOne);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0200
     * @tc.name testFloat64ArrayIncludes020
     * @tc.desc Verify includes search for decimal0.2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const pointTwo: number = 0.2;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue);
      const result = arr.includes(pointTwo);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0210
     * @tc.name testFloat64ArrayIncludes021
     * @tc.desc Verify includes search for negative decimal -999999.99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const negnum999999Pointninenine: number = -999999.99;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const result = arr.includes(negnum999999Pointninenine);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0220
     * @tc.name testFloat64ArrayIncludes022
     * @tc.desc Verify includes search for non-existent positive number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const fivePointZero: number = 5.0;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const result = arr.includes(fivePointZero);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0230
     * @tc.name testFloat64ArrayIncludes023
     * @tc.desc Verify includes search for non-existent negative number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const negfivePointzero: number = -5.0;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue);
      const result = arr.includes(negfivePointzero);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0240
     * @tc.name testFloat64ArrayIncludes024
     * @tc.desc Verify includes search for non-existent zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const zeroPointZero: number = 0.0;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue);
      const result = arr.includes(zeroPointZero);
      const expectVal = true;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0250
     * @tc.name testFloat64ArrayIncludes025
     * @tc.desc Verify includes search for non-existent Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const positiveInfinity: number = Infinity;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const result = arr.includes(positiveInfinity);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0260
     * @tc.name testFloat64ArrayIncludes026
     * @tc.desc Verify includes search for non-existent NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const nanValue: number = NaN;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const result = arr.includes(nanValue);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0270
     * @tc.name testFloat64ArrayIncludes027
     * @tc.desc Verify includes search for boundary integer 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const num2147483647Pointzero: number = 2147483647.0;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue);
      const result = arr.includes(num2147483647Pointzero);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0280
     * @tc.name testFloat64ArrayIncludes028
     * @tc.desc Verify includes search for boundary integer -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const negnum2147483648Pointzero: number = -2147483648.0;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue);
      const result = arr.includes(negnum2147483648Pointzero);
      const expectVal = true;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0290
     * @tc.name testFloat64ArrayIncludes029
     * @tc.desc Verify includes search for Number.MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const onePointZero: number = 1.0;
      const maxSafe = 9007199254740991.0;
      const arr = Float64Array.of(zeroPointZero, maxSafe, onePointZero);
      const result = arr.includes(maxSafe);
      const expectVal = true;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0300
     * @tc.name testFloat64ArrayIncludes030
     * @tc.desc Verify includes search for Number.MIN_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const onePointZero: number = 1.0;
      const minSafe = -9007199254740991.0;
      const arr = Float64Array.of(minSafe, zeroPointZero, onePointZero);
      const result = arr.includes(minSafe);
      const expectVal = true;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0310
     * @tc.name testFloat64ArrayIncludes031
     * @tc.desc Verify includes search for MAX_SAFE_INTEGER+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const onePointZero: number = 1.0;
      const beyondSafe = 9007199254740992.0;
      const arr = Float64Array.of(zeroPointZero, beyondSafe, onePointZero);
      const result = arr.includes(beyondSafe);
      const expectVal = true;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0320
     * @tc.name testFloat64ArrayIncludes032
     * @tc.desc Verify includes fromIndex=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const onePointZero: number = 1.0;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const result = arr.includes(onePointZero, 0);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0330
     * @tc.name testFloat64ArrayIncludes033
     * @tc.desc Verify includes fromIndex=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const twoPointZero: number = 2.0;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const result = arr.includes(twoPointZero, 1);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0340
     * @tc.name testFloat64ArrayIncludes034
     * @tc.desc Verify includes fromIndex=length+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const threePointZero: number = 3.0;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const result = arr.includes(threePointZero, 4);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0350
     * @tc.name testFloat64ArrayIncludes035
     * @tc.desc Verify includes fromIndex very large positive number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const onePointZero: number = 1.0;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const result = arr.includes(onePointZero, 1000000);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0360
     * @tc.name testFloat64ArrayIncludes036
     * @tc.desc Verify includes fromIndex=-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const threePointZero: number = 3.0;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue);
      const result = arr.includes(threePointZero, -1);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0370
     * @tc.name testFloat64ArrayIncludes037
     * @tc.desc Verify includes fromIndex=-2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const twoPointZero: number = 2.0;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue);
      const result = arr.includes(twoPointZero, -2);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0380
     * @tc.name testFloat64ArrayIncludes038
     * @tc.desc Verify includes fromIndex=-length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const onePointZero: number = 1.0;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const result = arr.includes(onePointZero, -3);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0390
     * @tc.name testFloat64ArrayIncludes039
     * @tc.desc Verify includes fromIndex=-length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const onePointZero: number = 1.0;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const result = arr.includes(onePointZero, -4);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0400
     * @tc.name testFloat64ArrayIncludes040
     * @tc.desc Verify includes fromIndex very large negative number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const onePointZero: number = 1.0;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue);
      const result = arr.includes(onePointZero, -1000000);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0410
     * @tc.name testFloat64ArrayIncludes041
     * @tc.desc Verify includes fromIndex=0 search for first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const fivePointZero: number = 5.0;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue);
      const result = arr.includes(fivePointZero, 0);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0420
     * @tc.name testFloat64ArrayIncludes042
     * @tc.desc Verify includes fromIndex=1 skips first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const fivePointZero: number = 5.0;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const result = arr.includes(fivePointZero, 1);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0430
     * @tc.name testFloat64ArrayIncludes043
     * @tc.desc Verify includes fromIndex=-3 equivalent to fromIndex=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const onePointZero: number = 1.0;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const r1 = arr.includes(onePointZero, 0);
      const r2 = arr.includes(onePointZero, -3);
      const expectVal = false;
      expect(r1).assertEqual(expectVal);
      const expectVal2 = false;
      expect(r2).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0440
     * @tc.name testFloat64ArrayIncludes044
     * @tc.desc Verify includes with double type argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const val: double = 2.0;
      const result = arr.includes(val);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0450
     * @tc.name testFloat64ArrayIncludes045
     * @tc.desc Verify includes with number type argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const val: number = 2.0;
      const result = arr.includes(val);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0460
     * @tc.name testFloat64ArrayIncludes046
     * @tc.desc Verify includes returns false when element is absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const twoPointZero: number = 2.0;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue);
      const result = arr.includes(twoPointZero);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0470
     * @tc.name testFloat64ArrayIncludes047
     * @tc.desc Verify includes returns false when element not found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const fourPointZero: number = 4.0;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const result = arr.includes(fourPointZero);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0480
     * @tc.name testFloat64ArrayIncludes048
     * @tc.desc Verify includes on empty array returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const arr = new Float64Array();
      const result = arr.includes(onePointZero);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0490
     * @tc.name testFloat64ArrayIncludes049
     * @tc.desc Verify includes single element array returns false when value is absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const fillValue42: number = 42.0;
      const arr = Float64Array.of(pointFive);
      const result = arr.includes(fillValue42);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0500
     * @tc.name testFloat64ArrayIncludes050
     * @tc.desc Verify includes single element array not found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroPointZero: number = 0.0;
      const arr = Float64Array.of(int16MinValue);
      const result = arr.includes(zeroPointZero);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0510
     * @tc.name testFloat64ArrayIncludes051
     * @tc.desc Verify includes does not modify original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const twoPointZero: number = 2.0;
      const negativeOne: number = -1;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue);
      const lenBefore = arr.length;
      arr.includes(twoPointZero);
      expect(arr.length).assertEqual(lenBefore);
      const actVal1 = arr.$_get(0);
      const expectVal = int32MinValue;
      expect(actVal1).assertEqual(expectVal);
      const actVal2 = arr.$_get(1);
      const expectVal2 = negativeOne;
      expect(actVal2).assertEqual(expectVal2);
      const actVal3 = arr.$_get(2);
      const expectVal3 = zeroValue;
      expect(actVal3).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0520
     * @tc.name testFloat64ArrayIncludes052
     * @tc.desc Verify includes empty array search for zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array();
      const result = arr.includes(zeroPointZero);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0530
     * @tc.name testFloat64ArrayIncludes053
     * @tc.desc Verify includes empty arraysearch for Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Infinity;
      const arr = new Float64Array();
      const result = arr.includes(positiveInfinity);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0540
     * @tc.name testFloat64ArrayIncludes054
     * @tc.desc Verify includes empty arraysearch for NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = NaN;
      const arr = new Float64Array();
      const result = arr.includes(nanValue);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0550
     * @tc.name testFloat64ArrayIncludes055
     * @tc.desc Verify includes all-zero array search for zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(3);
      const result = arr.includes(zeroPointZero);
      const expectVal = true;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0560
     * @tc.name testFloat64ArrayIncludes056
     * @tc.desc Verify includes all-zero array search for non-zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const arr = new Float64Array(3);
      const result = arr.includes(onePointZero);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0570
     * @tc.name testFloat64ArrayIncludes057
     * @tc.desc Verify includes all identical elements array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const piValue: number = 3.141592653589793;
      const sevenPointZero: number = 7.0;
      const arr = Float64Array.of(piValue, piValue, piValue, piValue);
      const result = arr.includes(sevenPointZero);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0580
     * @tc.name testFloat64ArrayIncludes058
     * @tc.desc Verify includes all identical elements array not found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOneTwoFive: number = 0.125;
      const eightPointZero: number = 8.0;
      const arr = Float64Array.of(pointOneTwoFive, pointOneTwoFive, pointOneTwoFive, pointOneTwoFive);
      const result = arr.includes(eightPointZero);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0590
     * @tc.name testFloat64ArrayIncludes059
     * @tc.desc Verify includes array with negative and positive values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const int8MaxValue: number = 127;
      const int16MaxValue: number = 32767;
      const negthreePointzero: number = -3.0;
      const threePointZero: number = 3.0;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue, int8MaxValue, int16MaxValue);
      const result1 = arr.includes(negthreePointzero);
      const result2 = arr.includes(threePointZero);
      const expectVal = false;
      expect(result1).assertEqual(expectVal);
      const expectVal2 = false;
      expect(result2).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0600
     * @tc.name testFloat64ArrayIncludes060
     * @tc.desc Verify includes array with boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const negnum2147483648Pointzero: number = -2147483648.0;
      const num2147483647Pointzero: number = 2147483647.0;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue);
      const result1 = arr.includes(negnum2147483648Pointzero);
      const result2 = arr.includes(num2147483647Pointzero);
      const expectVal = true;
      expect(result1).assertEqual(expectVal);
      const expectVal2 = false;
      expect(result2).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0610
     * @tc.name testFloat64ArrayIncludes061
     * @tc.desc Verify includes array with NaN and Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const piValue: number = 3.141592653589793;
      const nanValue: number = NaN;
      const positiveInfinity: number = Infinity;
      const negativeInfinity: number = -Infinity;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue, piValue);
      const r1 = arr.includes(nanValue);
      const r2 = arr.includes(positiveInfinity);
      const r3 = arr.includes(negativeInfinity);
      const expectVal = false;
      expect(r1).assertEqual(expectVal);
      const expectVal2 = false;
      expect(r2).assertEqual(expectVal2);
      const expectVal3 = false;
      expect(r3).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0620
     * @tc.name testFloat64ArrayIncludes062
     * @tc.desc Verify includes large array search for first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num999Pointzero: number = 999.0;
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(200);
      arr.$_set(0, num999Pointzero);
      for (let i = 1; i < 200; i++) {
        arr.$_set(i, zeroPointZero);
      }
      const result = arr.includes(num999Pointzero);
      const expectVal = true;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0630
     * @tc.name testFloat64ArrayIncludes063
     * @tc.desc Verify includes large array search for last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num888Pointzero: number = 888.0;
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(200);
      arr.$_set(199, num888Pointzero);
      for (let i = 0; i < 199; i++) {
        arr.$_set(i, zeroPointZero);
      }
      const result = arr.includes(num888Pointzero);
      const expectVal = true;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0640
     * @tc.name testFloat64ArrayIncludes064
     * @tc.desc Verify includes large array search for middle element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num777Pointzero: number = 777.0;
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(200);
      arr.$_set(100, num777Pointzero);
      for (let i = 0; i < 200; i++) {
        if (i !== 100) {
          arr.$_set(i, zeroPointZero);
        }
      }
      const result = arr.includes(num777Pointzero);
      const expectVal = true;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0650
     * @tc.name testFloat64ArrayIncludes065
     * @tc.desc Verify includes large array not found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const onePointZero: number = 1.0;
      const arr = new Float64Array(200);
      for (let i = 0; i < 200; i++) {
        arr.$_set(i, zeroPointZero);
      }
      const result = arr.includes(onePointZero);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0660
     * @tc.name testFloat64ArrayIncludes066
     * @tc.desc Verify includes returns false when NaN is absent from fromIndex=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointTwoFive: number = 0.25;
      const onePointFive: number = 1.5;
      const nanValue: number = NaN;
      const arr = Float64Array.of(pointTwoFive, onePointFive, pointTwoFive);
      const result = arr.includes(nanValue, 0);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0670
     * @tc.name testFloat64ArrayIncludes067
     * @tc.desc Verify includes returns false when NaN is absent from fromIndex=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const nanValue: number = NaN;
      const arr = Float64Array.of(zeroValue, -128, zeroValue);
      const result = arr.includes(nanValue, 1);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0680
     * @tc.name testFloat64ArrayIncludes068
     * @tc.desc Verify includes returns false when NaN is absent from fromIndex=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const nanValue: number = NaN;
      const arr = Float64Array.of(zeroValue, -1, zeroValue);
      const result = arr.includes(nanValue, 2);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0690
     * @tc.name testFloat64ArrayIncludes069
     * @tc.desc Verify includes returns false when NaN is absent from fromIndex=-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const maxSafeInteger: number = 9007199254740991;
      const nanValue: number = NaN;
      const arr = Float64Array.of(zeroValue, maxSafeInteger, zeroValue);
      const result = arr.includes(nanValue, -1);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0700
     * @tc.name testFloat64ArrayIncludes070
     * @tc.desc Verify includes returns false when NaN is absent from fromIndex=-2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointTwoFive: number = 0.25;
      const onePointFive: number = 1.5;
      const nanValue: number = NaN;
      const arr = Float64Array.of(pointTwoFive, onePointFive, pointTwoFive);
      const result = arr.includes(nanValue, -2);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0710
     * @tc.name testFloat64ArrayIncludes071
     * @tc.desc Verify includes returns false when Infinity is absent from fromIndex=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const positiveInfinity: number = Infinity;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue);
      const result = arr.includes(positiveInfinity, 0);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0720
     * @tc.name testFloat64ArrayIncludes072
     * @tc.desc Verify includes returns false when Infinity is absent from fromIndex=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const positiveInfinity: number = Infinity;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue);
      const result = arr.includes(positiveInfinity, 1);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0730
     * @tc.name testFloat64ArrayIncludes073
     * @tc.desc Verify includes returns false when -Infinity is absent from fromIndex=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const negativeInfinity: number = -Infinity;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const result = arr.includes(negativeInfinity, 1);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0740
     * @tc.name testFloat64ArrayIncludes074
     * @tc.desc Verify includes returns false when +0.0 is absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const zeroPointZero: number = 0.0;
      const arr = Float64Array.of(pointFive, onePointFive);
      const result = arr.includes(+zeroPointZero);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0750
     * @tc.name testFloat64ArrayIncludes075
     * @tc.desc Verify includes returns false when integer array has no -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const negativeZero: number = -0.0;
      const arr = Float64Array.of(int16MinValue, -128);
      const result = arr.includes(negativeZero);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0760
     * @tc.name testFloat64ArrayIncludes076
     * @tc.desc Verify includes returns false when scientific notation value is absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const sciValue20e10: number = 2.0e-10;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue);
      const result = arr.includes(sciValue20e10);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0770
     * @tc.name testFloat64ArrayIncludes077
     * @tc.desc Verify includes scientific notation search not found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const sciValue40e10: number = 4.0e-10;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const result = arr.includes(sciValue40e10);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0780
     * @tc.name testFloat64ArrayIncludes078
     * @tc.desc Verify includes decimal precision boundary 0.1+0.2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const arr = Float64Array.of(pointFive);
      const computed = 0.1 + 0.2;
      const result = arr.includes(computed);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0790
     * @tc.name testFloat64ArrayIncludes079
     * @tc.desc Verify includes exact match 0.3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const pointThree: number = 0.3;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue);
      const result = arr.includes(pointThree);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0800
     * @tc.name testFloat64ArrayIncludes080
     * @tc.desc Verify includes fromIndex skips target element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const onePointZero: number = 1.0;
      const arr = Float64Array.of(zeroValue, -1, zeroValue);
      const result = arr.includes(onePointZero, 1);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0810
     * @tc.name testFloat64ArrayIncludes081
     * @tc.desc Verify includes fromIndex precisely locates target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const twoPointZero: number = 2.0;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const result = arr.includes(twoPointZero, 1);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0820
     * @tc.name testFloat64ArrayIncludes082
     * @tc.desc Verify includes duplicate elements first match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointTwoFive: number = 0.25;
      const fivePointZero: number = 5.0;
      const arr = Float64Array.of(pointTwoFive, pointTwoFive, pointTwoFive);
      const result = arr.includes(fivePointZero, 0);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0830
     * @tc.name testFloat64ArrayIncludes083
     * @tc.desc Verify includes duplicate elements fromIndex skips first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const fivePointZero: number = 5.0;
      const arr = Float64Array.of(zeroValue, zeroValue, zeroValue);
      const result = arr.includes(fivePointZero, 2);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0840
     * @tc.name testFloat64ArrayIncludes084
     * @tc.desc Verify includes duplicate elements fromIndex out of range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const fivePointZero: number = 5.0;
      const arr = Float64Array.of(zeroValue, zeroValue, zeroValue);
      const result = arr.includes(fivePointZero, 3);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0850
     * @tc.name testFloat64ArrayIncludes085
     * @tc.desc Verify includes boundary value combination search 
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const piValue: number = 3.141592653589793;
      const tinyNegativeValue: number = -1e-100;
      const negativeInfinity: number = -Infinity;
      const zeroPointZero: number = 0.0;
      const positiveInfinity: number = Infinity;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue, piValue, tinyNegativeValue);
      const r1 = arr.includes(negativeInfinity);
      const r2 = arr.includes(zeroPointZero);
      const r3 = arr.includes(positiveInfinity);
      const expectVal = false;
      expect(r1).assertEqual(expectVal);
      const expectVal2 = true;
      expect(r2).assertEqual(expectVal2);
      const expectVal3 = false;
      expect(r3).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0860
     * @tc.name testFloat64ArrayIncludes086
     * @tc.desc Verify includes mixed positive negative zero and NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const zeroPointZero: number = 0.0;
      const negativeZero: number = -0.0;
      const nanValue: number = NaN;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const r1 = arr.includes(+zeroPointZero);
      const r2 = arr.includes(negativeZero);
      const r3 = arr.includes(nanValue);
      const expectVal = false;
      expect(r1).assertEqual(expectVal);
      const expectVal2 = false;
      expect(r2).assertEqual(expectVal2);
      const expectVal3 = false;
      expect(r3).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0870
     * @tc.name testFloat64ArrayIncludes087
     * @tc.desc Verify includes fromIndex=-length search for first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const fillValue42: number = 42.0;
      const arr = Float64Array.of(int16MinValue, zeroValue, zeroValue);
      const result = arr.includes(fillValue42, -3);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0880
     * @tc.name testFloat64ArrayIncludes088
     * @tc.desc Verify includes fromIndex=0search for NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const nanValue: number = NaN;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue);
      const result = arr.includes(nanValue, 0);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0890
     * @tc.name testFloat64ArrayIncludes089
     * @tc.desc Verify includes fromIndex=1 skips NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const nanValue: number = NaN;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const result = arr.includes(nanValue, 1);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0900
     * @tc.name testFloat64ArrayIncludes090
     * @tc.desc Verify includes search for maximum value 
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const doubleMaxValue: number = 1.7976931348623157e+308;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const result = arr.includes(doubleMaxValue);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0910
     * @tc.name testFloat64ArrayIncludes091
     * @tc.desc Verify includes search for negative maximum 
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const negsciValue17976931348623157e308: number = -1.7976931348623157e+308;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue);
      const result = arr.includes(negsciValue17976931348623157e308);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0920
     * @tc.name testFloat64ArrayIncludes092
     * @tc.desc Verify includes search for negative minimum 
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const negsciValue5e324: number = -5e-324;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const result = arr.includes(negsciValue5e324);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0930
     * @tc.name testFloat64ArrayIncludes093
     * @tc.desc Verify includes hex literal search 
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const num255Pointzero: number = 255.0;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const result = arr.includes(num255Pointzero);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0940
     * @tc.name testFloat64ArrayIncludes094
     * @tc.desc Verify includes octal literal search 
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const sixtyfourPointzero: number = 64.0;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue);
      const result = arr.includes(sixtyfourPointzero);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0950
     * @tc.name testFloat64ArrayIncludes095
     * @tc.desc Verify includes binary literal search 
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const fifteenPointzero: number = 15.0;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue);
      const result = arr.includes(fifteenPointzero);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0960
     * @tc.name testFloat64ArrayIncludes096
     * @tc.desc Verify includes returns false when very large positive fromIndex skips NaN search
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const nanValue: number = NaN;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const result = arr.includes(nanValue, 1000000);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0970
     * @tc.name testFloat64ArrayIncludes097
     * @tc.desc Verify includes fromIndex large negative search for NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const nanValue: number = NaN;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const result = arr.includes(nanValue, -1000000);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0980
     * @tc.name testFloat64ArrayIncludes098
     * @tc.desc Verify includes fromIndex=0empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array();
      const result = arr.includes(zeroPointZero, 0);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_0990
     * @tc.name testFloat64ArrayIncludes099
     * @tc.desc Verify includes fromIndex=-1empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array();
      const result = arr.includes(zeroPointZero, -1);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_1000
     * @tc.name testFloat64ArrayIncludes100
     * @tc.desc Verify includes single element arrayfromIndex=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const hundredPointzero: number = 100.0;
      const arr = Float64Array.of(int16MinValue);
      const result = arr.includes(hundredPointzero, 0);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_1010
     * @tc.name testFloat64ArrayIncludes101
     * @tc.desc Verify includes single element arrayfromIndex=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const hundredPointzero: number = 100.0;
      const arr = Float64Array.of(int32MinValue);
      const result = arr.includes(hundredPointzero, 1);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_1020
     * @tc.name testFloat64ArrayIncludes102
     * @tc.desc Verify includes single element arrayfromIndex=-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const hundredPointzero: number = 100.0;
      const arr = Float64Array.of(pointOne);
      const result = arr.includes(hundredPointzero, -1);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_1030
     * @tc.name testFloat64ArrayIncludes103
     * @tc.desc Verify includes single element arrayfromIndex=-2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const hundredPointzero: number = 100.0;
      const arr = Float64Array.of(pointFive);
      const result = arr.includes(hundredPointzero, -2);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_1040
     * @tc.name testFloat64ArrayIncludes104
     * @tc.desc Verify includes two element array fromIndex=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const onePointZero: number = 1.0;
      const arr = Float64Array.of(int16MinValue, -128);
      const result = arr.includes(onePointZero, 0);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_1050
     * @tc.name testFloat64ArrayIncludes105
     * @tc.desc Verify includes two element array fromIndex=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const twoPointZero: number = 2.0;
      const arr = Float64Array.of(int32MinValue, -1);
      const result = arr.includes(twoPointZero, 1);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_1060
     * @tc.name testFloat64ArrayIncludes106
     * @tc.desc Verify includes two element array fromIndex=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const twoPointZero: number = 2.0;
      const arr = Float64Array.of(pointOne, maxSafeInteger);
      const result = arr.includes(twoPointZero, 2);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_1070
     * @tc.name testFloat64ArrayIncludes107
     * @tc.desc Verify includes two element array fromIndex=-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const twoPointZero: number = 2.0;
      const arr = Float64Array.of(pointFive, onePointFive);
      const result = arr.includes(twoPointZero, -1);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_1080
     * @tc.name testFloat64ArrayIncludes108
     * @tc.desc Verify includes two element array fromIndex=-2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const onePointZero: number = 1.0;
      const arr = Float64Array.of(int16MinValue, -128);
      const result = arr.includes(onePointZero, -2);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_1090
     * @tc.name testFloat64ArrayIncludes109
     * @tc.desc Verify includes two element array fromIndex=-3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const onePointZero: number = 1.0;
      const arr = Float64Array.of(int32MinValue, -1);
      const result = arr.includes(onePointZero, -3);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_1100
     * @tc.name testFloat64ArrayIncludes110
     * @tc.desc Verify includes search on buffer-derived view 
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const buffer = new ArrayBuffer(24);
      const view = new Float64Array(buffer, 0, 3);
      view.$_set(0, onePointZero);
      view.$_set(1, twoPointZero);
      view.$_set(2, threePointZero);
      const result = view.includes(twoPointZero);
      const expectVal = true;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_1110
     * @tc.name testFloat64ArrayIncludes111
     * @tc.desc Verify includes search on buffer-derived view with fromIndex 
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const buffer = new ArrayBuffer(24);
      const view = new Float64Array(buffer, 0, 3);
      view.$_set(0, onePointZero);
      view.$_set(1, twoPointZero);
      view.$_set(2, threePointZero);
      const result = view.includes(twoPointZero, 1);
      const expectVal = true;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_1120
     * @tc.name testFloat64ArrayIncludes112
     * @tc.desc Verify includes search on subarray sharing buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const fourPointZero: number = 4.0;
      const buffer = new ArrayBuffer(32);
      const parent = new Float64Array(buffer, 0, 4);
      parent.$_set(0, onePointZero);
      parent.$_set(1, twoPointZero);
      parent.$_set(2, threePointZero);
      parent.$_set(3, fourPointZero);
      const child = parent.subarray(1, 3);
      const result = child.includes(twoPointZero);
      const expectVal = true;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_1130
     * @tc.name testFloat64ArrayIncludes113
     * @tc.desc Verify includes search on subarray with fromIndex 
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const fourPointZero: number = 4.0;
      const buffer = new ArrayBuffer(32);
      const parent = new Float64Array(buffer, 0, 4);
      parent.$_set(0, onePointZero);
      parent.$_set(1, twoPointZero);
      parent.$_set(2, threePointZero);
      parent.$_set(3, fourPointZero);
      const child = parent.subarray(1, 3);
      const result = child.includes(threePointZero, 1);
      const expectVal = true;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_1140
     * @tc.name testFloat64ArrayIncludes114
     * @tc.desc Verify includes search after copy construction 
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const twentyPointzero: number = 20.0;
      const original = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const copy = new Float64Array(original);
      const result = copy.includes(twentyPointzero);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_1150
     * @tc.name testFloat64ArrayIncludes115
     * @tc.desc Verify includes search after of construction 
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const pointOneTwoFive: number = 0.125;
      const fivePointfive: number = 5.5;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive, pointOneTwoFive);
      const result = arr.includes(fivePointfive);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_1160
     * @tc.name testFloat64ArrayIncludes116
     * @tc.desc Verify includes search after fill 
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sevenPointseven: number = 7.7;
      const arr = new Float64Array(5);
      arr.fill(sevenPointseven);
      const result = arr.includes(sevenPointseven);
      const expectVal = true;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_1170
     * @tc.name testFloat64ArrayIncludes117
     * @tc.desc Verify includes search after fill with fromIndex 
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sevenPointseven: number = 7.7;
      const arr = new Float64Array(5);
      arr.fill(sevenPointseven);
      const result = arr.includes(sevenPointseven, 2);
      const expectVal = true;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_1180
     * @tc.name testFloat64ArrayIncludes118
     * @tc.desc Verify includes multiple NaN elements at different positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MaxValue: number = 32767;
      const int8MaxValue: number = 127;
      const nanValue: number = NaN;
      const arr = Float64Array.of(int16MaxValue, -128, int16MaxValue, int8MaxValue, int16MaxValue);
      const r1 = arr.includes(nanValue, 0);
      const r2 = arr.includes(nanValue, 2);
      const r3 = arr.includes(nanValue, 4);
      const expectVal = false;
      expect(r1).assertEqual(expectVal);
      const expectVal2 = false;
      expect(r2).assertEqual(expectVal2);
      const expectVal3 = false;
      expect(r3).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_1190
     * @tc.name testFloat64ArrayIncludes119
     * @tc.desc Verify includes multiple NaN elements fromIndex skips
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MaxValue: number = 2147483647;
      const oneValue: number = 1;
      const nanValue: number = NaN;
      const arr = Float64Array.of(int32MaxValue, -1, int32MaxValue, oneValue, int32MaxValue);
      const result = arr.includes(nanValue, 3);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_1200
     * @tc.name testFloat64ArrayIncludes120
     * @tc.desc Verify includes mixed special values full coverage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const piValue: number = 3.141592653589793;
      const tinyNegativeValue: number = -1e-100;
      const negativeInfinity: number = -Infinity;
      const zeroPointZero: number = 0.0;
      const positiveInfinity: number = Infinity;
      const nanValue: number = NaN;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue, piValue, tinyNegativeValue, zeroValue, zeroValue,
        zeroValue, zeroValue);
      const r1 = arr.includes(negativeInfinity);
      const r2 = arr.includes(zeroPointZero);
      const r3 = arr.includes(positiveInfinity);
      const r4 = arr.includes(nanValue);
      const expectVal = false;
      expect(r1).assertEqual(expectVal);
      const expectVal2 = true;
      expect(r2).assertEqual(expectVal2);
      const expectVal3 = false;
      expect(r3).assertEqual(expectVal3);
      const expectVal4 = false;
      expect(r4).assertEqual(expectVal4);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_1210
     * @tc.name testFloat64ArrayIncludes121
     * @tc.desc Verify includes mixed special values not found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const negativeInfinity: number = -Infinity;
      const positiveInfinity: number = Infinity;
      const nanValue: number = NaN;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const r1 = arr.includes(negativeInfinity);
      const r2 = arr.includes(positiveInfinity);
      const r3 = arr.includes(nanValue);
      const expectVal = false;
      expect(r1).assertEqual(expectVal);
      const expectVal2 = false;
      expect(r2).assertEqual(expectVal2);
      const expectVal3 = false;
      expect(r3).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_1220
     * @tc.name testFloat64ArrayIncludes122
     * @tc.desc Verify includes fromIndex=0 search all boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const zeroPointZero: number = 0.0;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue);
      const result = arr.includes(zeroPointZero, 0);
      const expectVal = true;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_1230
     * @tc.name testFloat64ArrayIncludes123
     * @tc.desc Verify includes fromIndex=-length search all boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const zeroPointZero: number = 0.0;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue);
      const result = arr.includes(zeroPointZero, -3);
      const expectVal = true;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_1240
     * @tc.name testFloat64ArrayIncludes124
     * @tc.desc Verify includes fromIndex=0empty arraysearch for Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Infinity;
      const arr = new Float64Array();
      const result = arr.includes(positiveInfinity, 0);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_1250
     * @tc.name testFloat64ArrayIncludes125
     * @tc.desc Verify includes fromIndex=0empty arraysearch for NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = NaN;
      const arr = new Float64Array();
      const result = arr.includes(nanValue, 0);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_1260
     * @tc.name testFloat64ArrayIncludes126
     * @tc.desc Verify includes all-NaN array search 
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const piValue: number = 3.141592653589793;
      const nanValue: number = NaN;
      const arr = Float64Array.of(piValue, piValue, piValue, piValue);
      const result = arr.includes(nanValue);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_1270
     * @tc.name testFloat64ArrayIncludes127
     * @tc.desc Verify includes all-NaN array fromIndex=2 search 
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOneTwoFive: number = 0.125;
      const nanValue: number = NaN;
      const arr = Float64Array.of(pointOneTwoFive, pointOneTwoFive, pointOneTwoFive, pointOneTwoFive);
      const result = arr.includes(nanValue, 2);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_1280
     * @tc.name testFloat64ArrayIncludes128
     * @tc.desc Verify includes all-Infinity array search 
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const positiveInfinity: number = Infinity;
      const arr = Float64Array.of(zeroValue, zeroValue, zeroValue);
      const result = arr.includes(positiveInfinity);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_1290
     * @tc.name testFloat64ArrayIncludes129
     * @tc.desc Verify includes all -Infinity array search 
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const negativeInfinity: number = -Infinity;
      const arr = Float64Array.of(zeroValue, zeroValue, zeroValue);
      const result = arr.includes(negativeInfinity);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_1300
     * @tc.name testFloat64ArrayIncludes130
     * @tc.desc Verify includes alternating positive and negative zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const piValue: number = 3.141592653589793;
      const zeroPointZero: number = 0.0;
      const negativeZero: number = -0.0;
      const arr = Float64Array.of(zeroValue, piValue, zeroValue, piValue);
      const r1 = arr.includes(+zeroPointZero);
      const r2 = arr.includes(negativeZero);
      const expectVal = true;
      expect(r1).assertEqual(expectVal);
      const expectVal2 = true;
      expect(r2).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_1310
     * @tc.name testFloat64ArrayIncludes131
     * @tc.desc Verify includes alternating positive and negative zerofromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointTwoFive: number = 0.25;
      const pointOneTwoFive: number = 0.125;
      const negativeZero: number = -0.0;
      const arr = Float64Array.of(pointTwoFive, pointOneTwoFive, pointTwoFive, pointOneTwoFive);
      const result = arr.includes(negativeZero, 1);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_1320
     * @tc.name testFloat64ArrayIncludes132
     * @tc.desc Verify includes search after Array construction 
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoPointFive: number = 2.5;
      const numbers: Array<number> = [1.5, 2.5, 3.5];
      const arr = new Float64Array(numbers);
      const result = arr.includes(twoPointFive);
      const expectVal = true;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_1330
     * @tc.name testFloat64ArrayIncludes133
     * @tc.desc Verify includes fromIndex large value search for first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const onePointZero: number = 1.0;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue);
      const result = arr.includes(onePointZero, 999999);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_1340
     * @tc.name testFloat64ArrayIncludes134
     * @tc.desc Verify includes fromIndex large negative search for first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const onePointZero: number = 1.0;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue);
      const result = arr.includes(onePointZero, -999999);
      const expectVal = false;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_1350
     * @tc.name testFloat64ArrayIncludes135
     * @tc.desc Verify includes search after FixedArray construction 
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num200Pointzero: number = 200.0;
      const numbers: FixedArray<number> = [100.0, 200.0, 300.0];
      const arr = new Float64Array(numbers);
      const result = arr.includes(num200Pointzero);
      const expectVal = true;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_1360
     * @tc.name testFloat64ArrayIncludes136
     * @tc.desc Verify includes search after Iterable construction 
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threePointZero: number = 3.0;
      const elements: Array<Number> = [1.0, 2.0, 3.0];
      const arr = new Float64Array(elements);
      const result = arr.includes(threePointZero);
      const expectVal = true;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_1370
     * @tc.name testFloat64ArrayIncludes137
     * @tc.desc Verify includes returns false when existing element is absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const fivePointZero: number = 5.0;
      const values = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const actVal4 = values.includes(fivePointZero);
      const expectVal = false;
      expect(actVal4).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_1380
     * @tc.name testFloat64ArrayIncludes138
     * @tc.desc Verify includes does not find non-existent element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const tenPointZero: number = 10.0;
      const values = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const actVal5 = values.includes(tenPointZero);
      const expectVal = false;
      expect(actVal5).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_1390
     * @tc.name testFloat64ArrayIncludes139
     * @tc.desc Verify includes returns false when NaN is absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const nanValue: number = NaN;
      const values = Float64Array.of(int16MinValue, -128, zeroValue);
      const actVal6 = values.includes(nanValue);
      const expectVal = false;
      expect(actVal6).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_1400
     * @tc.name testFloat64ArrayIncludes140
     * @tc.desc Verify includes fromIndex=0 search
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const fivePointZero: number = 5.0;
      const values = Float64Array.of(int32MinValue, -1, zeroValue);
      const actVal7 = values.includes(fivePointZero, 0);
      const expectVal = false;
      expect(actVal7).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_1410
     * @tc.name testFloat64ArrayIncludes141
     * @tc.desc Verify includes fromIndex=1 search
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const fivePointZero: number = 5.0;
      const values = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const actVal8 = values.includes(fivePointZero, 1);
      const expectVal = false;
      expect(actVal8).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_1420
     * @tc.name testFloat64ArrayIncludes142
     * @tc.desc Verify includes fromIndex=2 not found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const fivePointZero: number = 5.0;
      const values = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      const actVal9 = values.includes(fivePointZero, 2);
      const expectVal = false;
      expect(actVal9).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_1430
     * @tc.name testFloat64ArrayIncludes143
     * @tc.desc Verify includes fromIndex negative counts from end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const fivePointZero: number = 5.0;
      const values = Float64Array.of(int16MinValue, -128, zeroValue);
      const actVal10 = values.includes(fivePointZero, -2);
      const expectVal = false;
      expect(actVal10).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_1440
     * @tc.name testFloat64ArrayIncludes144
     * @tc.desc Verify includes fromIndex out of bounds returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const fivePointZero: number = 5.0;
      const values = Float64Array.of(int32MinValue, -1);
      const actVal11 = values.includes(fivePointZero, 10);
      const expectVal = false;
      expect(actVal11).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_1450
     * @tc.name testFloat64ArrayIncludes145
     * @tc.desc Verify includes empty array returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const values = new Float64Array();
      const actVal12 = values.includes(onePointZero);
      const expectVal = false;
      expect(actVal12).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_1460
     * @tc.name testFloat64ArrayIncludes146
     * @tc.desc Verify includes returns false when Infinity values are absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const positiveInfinity: number = Infinity;
      const negativeInfinity: number = -Infinity;
      const values = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const actVal13 = values.includes(positiveInfinity);
      const expectVal = false;
      expect(actVal13).assertEqual(expectVal);
      const actVal14 = values.includes(negativeInfinity);
      const expectVal2 = false;
      expect(actVal14).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_1470
     * @tc.name testFloat64ArrayIncludes147
     * @tc.desc Verify includes returns false when decimal array has no -0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const negativeZero: number = -0.0;
      const values = Float64Array.of(pointFive, onePointFive);
      const actVal15 = values.includes(negativeZero);
      const expectVal = false;
      expect(actVal15).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_1480
     * @tc.name testFloat64ArrayIncludes148
     * @tc.desc Verify includes with NaN fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const arr = Float64Array.of(onePointZero, twoPointZero, threePointZero);
      const result = arr.includes(threePointZero, -1);
      const expectVal = true;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_1490
     * @tc.name testFloat64ArrayIncludes149
     * @tc.desc Verify includes with undefined fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const threePointZero: number = 3.0;
      const arr = Float64Array.of(onePointZero, twoPointZero, threePointZero);
      const result = arr.includes(onePointZero, 0);
      const expectVal = true;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_1500
     * @tc.name testFloat64ArrayIncludes150
     * @tc.desc Verify includes with hex literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValueFF: number = 0xFF;
      const hexValueAA: number = 0xAA;
      const hexValue55: number = 0x55;
      const hexValueBB: number = 0xBB;
      const arr = Float64Array.of(hexValueFF, hexValueAA, hexValue55);
      const actVal16 = arr.includes(hexValueAA);
      const expectVal = true;
      expect(actVal16).assertEqual(expectVal);
      const actVal17 = arr.includes(hexValueBB);
      const expectVal2 = false;
      expect(actVal17).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_1510
     * @tc.name testFloat64ArrayIncludes151
     * @tc.desc Verify includes with binary literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const binaryValue11111111: number = 0b11111111;
      const binaryValue10101010: number = 0b10101010;
      const binaryValue01010101: number = 0b01010101;
      const binaryValue11110000: number = 0b11110000;
      const arr = Float64Array.of(binaryValue11111111, binaryValue10101010, binaryValue01010101);
      const actVal18 = arr.includes(binaryValue10101010);
      const expectVal = true;
      expect(actVal18).assertEqual(expectVal);
      const actVal19 = arr.includes(binaryValue11110000);
      const expectVal2 = false;
      expect(actVal19).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_1520
     * @tc.name testFloat64ArrayIncludes152
     * @tc.desc Verify includes with Double.NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = Double.NaN;
      const doubleMaxValue: number = Double.MAX_VALUE;
      const arr = Float64Array.of(nanValue, doubleMaxValue);
      const result = arr.includes(nanValue);
      const expectVal = true;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_1530
     * @tc.name testFloat64ArrayIncludes153
     * @tc.desc Verify includes with Double.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Double.POSITIVE_INFINITY;
      const negativeInfinity: number = Double.NEGATIVE_INFINITY;
      const arr = Float64Array.of(positiveInfinity, negativeInfinity);
      const result = arr.includes(positiveInfinity);
      const expectVal = true;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64_ARRAY_INCLUDES_1540
     * @tc.name testFloat64ArrayIncludes154
     * @tc.desc Verify includes with Double.MIN_VALUE/MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayIncludes154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMinValue: number = Double.MIN_VALUE;
      const doubleMaxValue: number = Double.MAX_VALUE;
      const arr = Float64Array.of(doubleMinValue, doubleMaxValue);
      const actVal20 = arr.includes(doubleMinValue);
      const expectVal = true;
      expect(actVal20).assertEqual(expectVal);
      const actVal21 = arr.includes(doubleMaxValue);
      const expectVal2 = true;
      expect(actVal21).assertEqual(expectVal2);
    })

  })
}
