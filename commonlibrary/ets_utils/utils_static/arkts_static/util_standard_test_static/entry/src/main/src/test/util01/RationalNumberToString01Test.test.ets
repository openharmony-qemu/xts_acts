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
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '@ohos/hypium-static/src/main/indexStatic';
import Utils from '../Util.test';
import util from '@ohos.util';

export default function rationalNumberToString01Test(): void {
  describe('rationalNumberToString01Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_TO_STRING_ONE_0100
     * @tc.name rationalNumberToStringOneTest001
     * @tc.desc Verify RationalNumber.createRationalFromString('1/2').toString() returns '1/2'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberToStringOneTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalFromString = util.RationalNumber.createRationalFromString('1/2');
      let actual1: string = rationalFromString.toString();
      let expected1: string = '1/2';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_TO_STRING_ONE_0200
     * @tc.name rationalNumberToStringOneTest002
     * @tc.desc Verify new RationalNumber().toString() returns 'NaN'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberToStringOneTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumberDefault = new util.RationalNumber();
      let actual1: string = rationalNumberDefault.toString();
      let expected1: string = 'NaN';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_TO_STRING_ONE_0300
     * @tc.name rationalNumberToStringOneTest003
     * @tc.desc Verify RationalNumber.parseRationalNumber(-1, 2).toString() returns '-1/2'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberToStringOneTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNegPos = util.RationalNumber.parseRationalNumber(-1, 2);
      let actual1: string = rationalNegPos.toString();
      let expected1: string = '-1/2';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_TO_STRING_ONE_0400
     * @tc.name rationalNumberToStringOneTest004
     * @tc.desc Verify RationalNumber.parseRationalNumber(-1, -2).toString() returns '1/2'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberToStringOneTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNegNeg = util.RationalNumber.parseRationalNumber(-1, -2);
      let actual1: string = rationalNegNeg.toString();
      let expected1: string = '1/2';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_TO_STRING_ONE_0500
     * @tc.name rationalNumberToStringOneTest005
     * @tc.desc Verify RationalNumber.parseRationalNumber(0, -7).toString() returns '0/1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberToStringOneTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalZeroOverMinusSeven = util.RationalNumber.parseRationalNumber(0, -7);
      let actual1: string = rationalZeroOverMinusSeven.toString();
      let expected1: string = '0/1';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_TO_STRING_ONE_0600
     * @tc.name rationalNumberToStringOneTest006
     * @tc.desc Verify RationalNumber.parseRationalNumber(5, 0).toString() returns 'Infinity'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberToStringOneTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalFiveOverZero = util.RationalNumber.parseRationalNumber(5, 0);
      let actual1: string = rationalFiveOverZero.toString();
      let expected1: string = 'Infinity';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_TO_STRING_ONE_0700
     * @tc.name rationalNumberToStringOneTest007
     * @tc.desc Verify RationalNumber.parseRationalNumber(0, 0).toString() returns 'NaN'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberToStringOneTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalZeroOverZero = util.RationalNumber.parseRationalNumber(0, 0);
      let actual1: string = rationalZeroOverZero.toString();
      let expected1: string = 'NaN';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_TO_STRING_ONE_0800
     * @tc.name rationalNumberToStringOneTest008
     * @tc.desc Verify RationalNumber.createRationalFromString('0/0').toString() returns 'NaN'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberToStringOneTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalStrNaN = util.RationalNumber.createRationalFromString('0/0');
      let actual1: string = rationalStrNaN.toString();
      let expected1: string = 'NaN';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_TO_STRING_ONE_0900
     * @tc.name rationalNumberToStringOneTest009
     * @tc.desc Verify RationalNumber.parseRationalNumber(12, 8).toString() returns '3/2'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberToStringOneTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalTwelveEighths = util.RationalNumber.parseRationalNumber(12, 8);
      let actual1: string = rationalTwelveEighths.toString();
      let expected1: string = '3/2';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_TO_STRING_ONE_1000
     * @tc.name rationalNumberToStringOneTest010
     * @tc.desc Verify RationalNumber.parseRationalNumber(6, 9).toString() returns '2/3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberToStringOneTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalSixNinths = util.RationalNumber.parseRationalNumber(6, 9);
      let actual1: string = rationalSixNinths.toString();
      let expected1: string = '2/3';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_TO_STRING_ONE_1100
     * @tc.name rationalNumberToStringOneTest011
     * @tc.desc Verify RationalNumber.parseRationalNumber(16, 16).toString() returns '1/1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberToStringOneTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalSixteenSixteen = util.RationalNumber.parseRationalNumber(16, 16);
      let actual1: string = rationalSixteenSixteen.toString();
      let expected1: string = '1/1';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_TO_STRING_ONE_1200
     * @tc.name rationalNumberToStringOneTest012
     * @tc.desc Verify RationalNumber.parseRationalNumber(2, -4).toString() returns '-1/2'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberToStringOneTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalTwoMinusFour = util.RationalNumber.parseRationalNumber(2, -4);
      let actual1: string = rationalTwoMinusFour.toString();
      let expected1: string = '-1/2';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_TO_STRING_ONE_1300
     * @tc.name rationalNumberToStringOneTest013
     * @tc.desc Verify RationalNumber.parseRationalNumber(999983, 999979).toString() returns '999983/999979'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberToStringOneTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalCoprimePrimes = util.RationalNumber.parseRationalNumber(999983, 999979);
      let actual1: string = rationalCoprimePrimes.toString();
      let expected1: string = '999983/999979';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_TO_STRING_ONE_1400
     * @tc.name rationalNumberToStringOneTest014
     * @tc.desc Verify RationalNumber.parseRationalNumber(17, 3).toString() returns '17/3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberToStringOneTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalSeventeenThirds = util.RationalNumber.parseRationalNumber(17, 3);
      let actual1: string = rationalSeventeenThirds.toString();
      let expected1: string = '17/3';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_TO_STRING_ONE_1500
     * @tc.name rationalNumberToStringOneTest015
     * @tc.desc Verify RationalNumber.parseRationalNumber(7, 2).toString() returns '7/2'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberToStringOneTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalSevenHalves = util.RationalNumber.parseRationalNumber(7, 2);
      let actual1: string = rationalSevenHalves.toString();
      let expected1: string = '7/2';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_TO_STRING_ONE_1600
     * @tc.name rationalNumberToStringOneTest016
     * @tc.desc Verify RationalNumber.parseRationalNumber(2147483647, 1).toString() returns '2147483647/1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberToStringOneTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalIntMax = util.RationalNumber.parseRationalNumber(2147483647, 1);
      let actual1: string = rationalIntMax.toString();
      let expected1: string = '2147483647/1';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_TO_STRING_ONE_1700
     * @tc.name rationalNumberToStringOneTest017
     * @tc.desc Verify RationalNumber.parseRationalNumber(-2147483648, 1).toString() returns '-2147483648/1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberToStringOneTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalIntMin = util.RationalNumber.parseRationalNumber(-2147483648, 1);
      let actual1: string = rationalIntMin.toString();
      let expected1: string = '-2147483648/1';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_TO_STRING_ONE_1800
     * @tc.name rationalNumberToStringOneTest018
     * @tc.desc Verify RationalNumber.parseRationalNumber(-9223372036854775808, 1).toString() returns '-9223372036854775808/1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberToStringOneTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalLongMin = util.RationalNumber.parseRationalNumber(-9223372036854775808, 1);
      let actual1: string = rationalLongMin.toString();
      let expected1: string = '-9223372036854775808/1';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_TO_STRING_ONE_1900
     * @tc.name rationalNumberToStringOneTest019
     * @tc.desc Verify RationalNumber.parseRationalNumber(9223372036854775807, 2).toString() returns '9223372036854775807/2'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberToStringOneTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalLongMaxHalves = util.RationalNumber.parseRationalNumber(9223372036854775807, 2);
      let actual1: string = rationalLongMaxHalves.toString();
      let expected1: string = '9223372036854775807/2';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_TO_STRING_ONE_2000
     * @tc.name rationalNumberToStringOneTest020
     * @tc.desc Verify RationalNumber.parseRationalNumber(1, 9223372036854775807).toString() returns '1/9223372036854775807'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberToStringOneTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalOneOverLongMax = util.RationalNumber.parseRationalNumber(1, 9223372036854775807);
      let actual1: string = rationalOneOverLongMax.toString();
      let expected1: string = '1/9223372036854775807';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_TO_STRING_ONE_2100
     * @tc.name rationalNumberToStringOneTest021
     * @tc.desc Verify RationalNumber.parseRationalNumber(1024, 1).toString() returns '1024/1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberToStringOneTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalTwoPowTen = util.RationalNumber.parseRationalNumber(1024, 1);
      let actual1: string = rationalTwoPowTen.toString();
      let expected1: string = '1024/1';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_TO_STRING_ONE_2200
     * @tc.name rationalNumberToStringOneTest022
     * @tc.desc Verify RationalNumber.parseRationalNumber(-1, 1).toString() returns '-1/1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberToStringOneTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalMinusOne = util.RationalNumber.parseRationalNumber(-1, 1);
      let actual1: string = rationalMinusOne.toString();
      let expected1: string = '-1/1';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_TO_STRING_ONE_2300
     * @tc.name rationalNumberToStringOneTest023
     * @tc.desc Verify RationalNumber.createRationalFromString('3/4').toString() returns '3/4'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberToStringOneTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalStrThreeQuarters = util.RationalNumber.createRationalFromString('3/4');
      let actual1: string = rationalStrThreeQuarters.toString();
      let expected1: string = '3/4';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_TO_STRING_ONE_2400
     * @tc.name rationalNumberToStringOneTest024
     * @tc.desc Verify RationalNumber.createRationalFromString('1/0').toString() returns 'Infinity'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberToStringOneTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalStrInf = util.RationalNumber.createRationalFromString('1/0');
      let actual1: string = rationalStrInf.toString();
      let expected1: string = 'Infinity';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_TO_STRING_ONE_2500
     * @tc.name rationalNumberToStringOneTest025
     * @tc.desc Verify RationalNumber.parseRationalNumber(-6, 9).toString() returns '-2/3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberToStringOneTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalMinusSixNinths = util.RationalNumber.parseRationalNumber(-6, 9);
      let actual1: string = rationalMinusSixNinths.toString();
      let expected1: string = '-2/3';
      expect(actual1).assertEqual(expected1);
    });
  });
}
