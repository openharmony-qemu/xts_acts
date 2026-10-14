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
} from '../../../../hypium/index';
import Utils from '../Util.test';
import util from '@ohos.util';

export default function rationalNumberValueOf01Test(): void {
  describe('rationalNumberValueOf01Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_VALUE_OF_ONE_0100
     * @tc.name rationalNumberValueOfOneTest001
     * @tc.desc Verify RationalNumber.parseRationalNumber(1, 4).valueOf() returns 0.25, and RationalNumber.parseRationalNumber(1, 4).valueOf() returns 0.25
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberValueOfOneTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalQuarter = util.RationalNumber.parseRationalNumber(1, 4);
      let firstValue = rationalQuarter.valueOf();
      let secondValue = rationalQuarter.valueOf();
      expect(firstValue).assertEqual(0.25);
      expect(secondValue).assertEqual(0.25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_VALUE_OF_ONE_0200
     * @tc.name rationalNumberValueOfOneTest002
     * @tc.desc Verify parseRationalNumber(0, 1) returns 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberValueOfOneTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalZero = util.RationalNumber.parseRationalNumber(0, 1);
      let resultZero = rationalZero.valueOf();
      expect(resultZero).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_VALUE_OF_ONE_0300
     * @tc.name rationalNumberValueOfOneTest003
     * @tc.desc Verify RationalNumber.parseRationalNumber(-1, 1).valueOf() returns -1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberValueOfOneTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalMinusOne = util.RationalNumber.parseRationalNumber(-1, 1);
      let resultMinusOne = rationalMinusOne.valueOf();
      expect(resultMinusOne).assertEqual(-1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_VALUE_OF_ONE_0400
     * @tc.name rationalNumberValueOfOneTest004
     * @tc.desc Verify RationalNumber.parseRationalNumber(2147483647, 1).valueOf() returns 2147483647.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberValueOfOneTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalIntMax = util.RationalNumber.parseRationalNumber(2147483647, 1);
      let resultIntMax = rationalIntMax.valueOf();
      expect(resultIntMax).assertEqual(2147483647.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_VALUE_OF_ONE_0500
     * @tc.name rationalNumberValueOfOneTest005
     * @tc.desc Verify parseRationalNumber(9223372036854775807, 1) returns 9.223372036854776e18
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberValueOfOneTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalLongMax = util.RationalNumber.parseRationalNumber(9223372036854775807, 1);
      let resultLongMax = rationalLongMax.valueOf();
      expect(resultLongMax).assertEqual(9.223372036854776e18);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_VALUE_OF_ONE_0600
     * @tc.name rationalNumberValueOfOneTest006
     * @tc.desc Verify parseRationalNumber(-9223372036854775808, 1) returns -9.223372036854776e18
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberValueOfOneTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalLongMin = util.RationalNumber.parseRationalNumber(-9223372036854775808, 1);
      let resultLongMin = rationalLongMin.valueOf();
      expect(resultLongMin).assertEqual(-9.223372036854776e18);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_VALUE_OF_ONE_0700
     * @tc.name rationalNumberValueOfOneTest007
     * @tc.desc Verify parseRationalNumber(1, 1) returns 1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberValueOfOneTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalDenomOne = util.RationalNumber.parseRationalNumber(1, 1);
      let resultDenomOne = rationalDenomOne.valueOf();
      expect(resultDenomOne).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_VALUE_OF_ONE_0800
     * @tc.name rationalNumberValueOfOneTest008
     * @tc.desc Verify parseRationalNumber(1, 3) returns 0.3333333333333333
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberValueOfOneTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalDenomThree = util.RationalNumber.parseRationalNumber(1, 3);
      let resultDenomThree = rationalDenomThree.valueOf();
      expect(resultDenomThree).assertEqual(0.3333333333333333);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_VALUE_OF_ONE_0900
     * @tc.name rationalNumberValueOfOneTest009
     * @tc.desc Verify RationalNumber.parseRationalNumber(1, 4).valueOf() returns 0.25
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberValueOfOneTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalDenomFour = util.RationalNumber.parseRationalNumber(1, 4);
      let resultDenomFour = rationalDenomFour.valueOf();
      expect(resultDenomFour).assertEqual(0.25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_VALUE_OF_ONE_1000
     * @tc.name rationalNumberValueOfOneTest010
     * @tc.desc Verify RationalNumber.parseRationalNumber(1, -2).valueOf() returns -0.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberValueOfOneTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalDenomMinusTwo = util.RationalNumber.parseRationalNumber(1, -2);
      let resultDenomMinusTwo = rationalDenomMinusTwo.valueOf();
      expect(resultDenomMinusTwo).assertEqual(-0.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_VALUE_OF_ONE_1100
     * @tc.name rationalNumberValueOfOneTest011
     * @tc.desc Verify parseRationalNumber(1, 9223372036854775807) returns 1.0842021724855044e-19
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberValueOfOneTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalDenomLongMax = util.RationalNumber.parseRationalNumber(1, 9223372036854775807);
      let resultDenomLongMax = rationalDenomLongMax.valueOf();
      expect(resultDenomLongMax).assertEqual(1.0842021724855044e-19);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_VALUE_OF_ONE_1200
     * @tc.name rationalNumberValueOfOneTest012
     * @tc.desc Verify isNaN(RationalNumber.parseRationalNumber(0, 0).valueOf()) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberValueOfOneTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNaN = util.RationalNumber.parseRationalNumber(0, 0);
      let actual1: number = rationalNaN.valueOf();
      expect(isNaN(actual1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_VALUE_OF_ONE_1300
     * @tc.name rationalNumberValueOfOneTest013
     * @tc.desc Verify parseRationalNumber(0, 5) returns 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberValueOfOneTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalZeroOverPositive = util.RationalNumber.parseRationalNumber(0, 5);
      let resultZeroOverPositive = rationalZeroOverPositive.valueOf();
      expect(resultZeroOverPositive).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_VALUE_OF_ONE_1400
     * @tc.name rationalNumberValueOfOneTest014
     * @tc.desc Verify parseRationalNumber(2147483647, 2147483647) returns 1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberValueOfOneTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalEqualIntMax = util.RationalNumber.parseRationalNumber(2147483647, 2147483647);
      let resultEqualIntMax = rationalEqualIntMax.valueOf();
      expect(resultEqualIntMax).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_VALUE_OF_ONE_1500
     * @tc.name rationalNumberValueOfOneTest015
     * @tc.desc Verify parseRationalNumber(2147483647, 1000000000) returns 2.147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberValueOfOneTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalIntMaxOverBillion = util.RationalNumber.parseRationalNumber(2147483647, 1000000000);
      let resultIntMaxOverBillion = rationalIntMaxOverBillion.valueOf();
      expect(resultIntMaxOverBillion).assertEqual(2.147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_VALUE_OF_ONE_1600
     * @tc.name rationalNumberValueOfOneTest016
     * @tc.desc Verify RationalNumber.parseRationalNumber(-9223372036854775808, -1).valueOf() returns -9.223372036854776e18
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberValueOfOneTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalLongMinOverMinusOne = util.RationalNumber.parseRationalNumber(-9223372036854775808, -1);
      let actual1: number = rationalLongMinOverMinusOne.valueOf();
      let expected1: number = -9.223372036854776e18;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_VALUE_OF_ONE_1700
     * @tc.name rationalNumberValueOfOneTest017
     * @tc.desc Verify parseRationalNumber(4, 2) returns 2.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberValueOfOneTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalReducibleTwo = util.RationalNumber.parseRationalNumber(4, 2);
      let resultReducibleTwo = rationalReducibleTwo.valueOf();
      expect(resultReducibleTwo).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_VALUE_OF_ONE_1800
     * @tc.name rationalNumberValueOfOneTest018
     * @tc.desc Verify parseRationalNumber(-3, 2) returns -1.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberValueOfOneTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalMinusThreeHalves = util.RationalNumber.parseRationalNumber(-3, 2);
      let resultMinusThreeHalves = rationalMinusThreeHalves.valueOf();
      expect(resultMinusThreeHalves).assertEqual(-1.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_VALUE_OF_ONE_1900
     * @tc.name rationalNumberValueOfOneTest019
     * @tc.desc Verify parseRationalNumber(3, 2) returns 1.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberValueOfOneTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalThreeHalves = util.RationalNumber.parseRationalNumber(3, 2);
      let resultThreeHalves = rationalThreeHalves.valueOf();
      expect(resultThreeHalves).assertEqual(1.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_VALUE_OF_ONE_2000
     * @tc.name rationalNumberValueOfOneTest020
     * @tc.desc Verify parseRationalNumber(5, 2) returns 2.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberValueOfOneTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalFiveHalves = util.RationalNumber.parseRationalNumber(5, 2);
      let resultFiveHalves = rationalFiveHalves.valueOf();
      expect(resultFiveHalves).assertEqual(2.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_VALUE_OF_ONE_2100
     * @tc.name rationalNumberValueOfOneTest021
     * @tc.desc Verify RationalNumber.createRationalFromString('-2/5').valueOf() returns -0.4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberValueOfOneTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalStringMinusTwoFifths = util.RationalNumber.createRationalFromString('-2/5');
      let resultStringMinusTwoFifths = rationalStringMinusTwoFifths.valueOf();
      expect(resultStringMinusTwoFifths).assertEqual(-0.4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_VALUE_OF_ONE_2200
     * @tc.name rationalNumberValueOfOneTest022
     * @tc.desc Verify isNaN(RationalNumber.createRationalFromString('0/0').valueOf()) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberValueOfOneTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalStringNaN = util.RationalNumber.createRationalFromString('0/0');
      let actual1: number = rationalStringNaN.valueOf();
      expect(isNaN(actual1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_VALUE_OF_ONE_2300
     * @tc.name rationalNumberValueOfOneTest023
     * @tc.desc Verify RationalNumber.createRationalFromString('1/0').valueOf() returns Number.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberValueOfOneTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalStringInfinity = util.RationalNumber.createRationalFromString('1/0');
      let resultStringInfinity = rationalStringInfinity.valueOf();
      expect(resultStringInfinity).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_VALUE_OF_ONE_2400
     * @tc.name rationalNumberValueOfOneTest024
     * @tc.desc Verify createRationalFromString('7') throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberValueOfOneTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        util.RationalNumber.createRationalFromString('7');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('BusinessError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_VALUE_OF_ONE_2500
     * @tc.name rationalNumberValueOfOneTest025
     * @tc.desc Verify createRationalFromString("0/1") returns 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberValueOfOneTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalStringZero = util.RationalNumber.createRationalFromString('0/1');
      let resultStringZero = rationalStringZero.valueOf();
      expect(resultStringZero).assertEqual(0.0);
    });
  });
}
