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

export default function rationalNumberGetNumerator01Test(): void {
  describe('rationalNumberGetNumerator01Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_NUMERATOR_ONE_0100
     * @tc.name rationalNumberGetNumeratorOneTest001
     * @tc.desc Verify RationalNumber.createRationalFromString('11/7').getNumerator() returns 11
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetNumeratorOneTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalString = util.RationalNumber.createRationalFromString('11/7');
      let actual1: number = rationalString.getNumerator();
      let expected1: int = 11;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_NUMERATOR_ONE_0200
     * @tc.name rationalNumberGetNumeratorOneTest002
     * @tc.desc Verify RationalNumber.parseRationalNumber(17, 3).getNumerator() returns 17
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetNumeratorOneTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalSeventeenThirds = util.RationalNumber.parseRationalNumber(17, 3);
      let actual1: number = rationalSeventeenThirds.getNumerator();
      let expected1: int = 17;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_NUMERATOR_ONE_0300
     * @tc.name rationalNumberGetNumeratorOneTest003
     * @tc.desc Verify RationalNumber.parseRationalNumber(7, 2).getNumerator() returns 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetNumeratorOneTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalSevenHalves = util.RationalNumber.parseRationalNumber(7, 2);
      let actual1: number = rationalSevenHalves.getNumerator();
      let expected1: int = 7;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_NUMERATOR_ONE_0400
     * @tc.name rationalNumberGetNumeratorOneTest004
     * @tc.desc Verify RationalNumber.parseRationalNumber(8, 2).getNumerator() returns 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetNumeratorOneTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalEightHalves = util.RationalNumber.parseRationalNumber(8, 2);
      let actual1: number = rationalEightHalves.getNumerator();
      let expected1: int = 4;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_NUMERATOR_ONE_0500
     * @tc.name rationalNumberGetNumeratorOneTest005
     * @tc.desc Verify RationalNumber.parseRationalNumber(2, 4).getNumerator() returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetNumeratorOneTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalTwoQuarters = util.RationalNumber.parseRationalNumber(2, 4);
      let actual1: number = rationalTwoQuarters.getNumerator();
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_NUMERATOR_ONE_0600
     * @tc.name rationalNumberGetNumeratorOneTest006
     * @tc.desc Verify RationalNumber.parseRationalNumber(6, 9).getNumerator() returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetNumeratorOneTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalSixNinths = util.RationalNumber.parseRationalNumber(6, 9);
      let actual1: number = rationalSixNinths.getNumerator();
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_NUMERATOR_ONE_0700
     * @tc.name rationalNumberGetNumeratorOneTest007
     * @tc.desc Verify RationalNumber.parseRationalNumber(36, 48).getNumerator() returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetNumeratorOneTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalThirtySixFortyEighths = util.RationalNumber.parseRationalNumber(36, 48);
      let actual1: number = rationalThirtySixFortyEighths.getNumerator();
      let expected1: int = 3;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_NUMERATOR_ONE_0800
     * @tc.name rationalNumberGetNumeratorOneTest008
     * @tc.desc Verify RationalNumber.parseRationalNumber(9, 9).getNumerator() returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetNumeratorOneTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNineNinths = util.RationalNumber.parseRationalNumber(9, 9);
      let actual1: number = rationalNineNinths.getNumerator();
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_NUMERATOR_ONE_0900
     * @tc.name rationalNumberGetNumeratorOneTest009
     * @tc.desc Verify RationalNumber.parseRationalNumber(2147483646, 1).getNumerator() returns 2147483646
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetNumeratorOneTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalIntMaxMinusOne = util.RationalNumber.parseRationalNumber(2147483646, 1);
      let actual1: number = rationalIntMaxMinusOne.getNumerator();
      let expected1: int = 2147483646;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_NUMERATOR_ONE_1000
     * @tc.name rationalNumberGetNumeratorOneTest010
     * @tc.desc Verify RationalNumber.parseRationalNumber(9223372036854775806, 1).getNumerator() returns 9223372036854775806
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetNumeratorOneTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalLongMaxMinusOne = util.RationalNumber.parseRationalNumber(9223372036854775806, 1);
      let actual1: number = rationalLongMaxMinusOne.getNumerator();
      let expected1: number = 9223372036854775806;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_NUMERATOR_ONE_1100
     * @tc.name rationalNumberGetNumeratorOneTest011
     * @tc.desc Verify RationalNumber.parseRationalNumber(-9223372036854775808, 1).getNumerator() returns -9223372036854775808
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetNumeratorOneTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalLongMin = util.RationalNumber.parseRationalNumber(-9223372036854775808, 1);
      let actual1: number = rationalLongMin.getNumerator();
      let expected1: number = -9223372036854775808;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_NUMERATOR_ONE_1200
     * @tc.name rationalNumberGetNumeratorOneTest012
     * @tc.desc Verify RationalNumber.parseRationalNumber(-1, 1).getNumerator() returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetNumeratorOneTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalMinusOneOverOne = util.RationalNumber.parseRationalNumber(-1, 1);
      let actual1: number = rationalMinusOneOverOne.getNumerator();
      let expected1: int = -1;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_NUMERATOR_ONE_1300
     * @tc.name rationalNumberGetNumeratorOneTest013
     * @tc.desc Verify RationalNumber.parseRationalNumber(3, -2).getNumerator() returns -3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetNumeratorOneTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalThreeOverMinusTwo = util.RationalNumber.parseRationalNumber(3, -2);
      let actual1: number = rationalThreeOverMinusTwo.getNumerator();
      let expected1: int = -3;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_NUMERATOR_ONE_1400
     * @tc.name rationalNumberGetNumeratorOneTest014
     * @tc.desc Verify RationalNumber.parseRationalNumber(-3, -2).getNumerator() returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetNumeratorOneTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalDoubleNegative = util.RationalNumber.parseRationalNumber(-3, -2);
      let actual1: number = rationalDoubleNegative.getNumerator();
      let expected1: int = 3;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_NUMERATOR_ONE_1500
     * @tc.name rationalNumberGetNumeratorOneTest015
     * @tc.desc Verify RationalNumber.parseRationalNumber(0, -5).getNumerator() returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetNumeratorOneTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalZeroOverMinusFive = util.RationalNumber.parseRationalNumber(0, -5);
      let actual1: number = rationalZeroOverMinusFive.getNumerator();
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_NUMERATOR_ONE_1600
     * @tc.name rationalNumberGetNumeratorOneTest016
     * @tc.desc Verify RationalNumber.parseRationalNumber(8, 7).getNumerator() returns 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetNumeratorOneTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalEightSevenths = util.RationalNumber.parseRationalNumber(8, 7);
      let actual1: number = rationalEightSevenths.getNumerator();
      let expected1: int = 8;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_NUMERATOR_ONE_1700
     * @tc.name rationalNumberGetNumeratorOneTest017
     * @tc.desc Verify RationalNumber.parseRationalNumber(9, 11).getNumerator() returns 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetNumeratorOneTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNineElevenths = util.RationalNumber.parseRationalNumber(9, 11);
      let actual1: number = rationalNineElevenths.getNumerator();
      let expected1: int = 9;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_NUMERATOR_ONE_1800
     * @tc.name rationalNumberGetNumeratorOneTest018
     * @tc.desc Verify RationalNumber.parseRationalNumber(5, 0).getNumerator() returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetNumeratorOneTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalPositiveInfinityFive = util.RationalNumber.parseRationalNumber(5, 0);
      let actual1: number = rationalPositiveInfinityFive.getNumerator();
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_NUMERATOR_ONE_1900
     * @tc.name rationalNumberGetNumeratorOneTest019
     * @tc.desc Verify RationalNumber.parseRationalNumber(-2, 0).getNumerator() returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetNumeratorOneTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNegativeInfinityMinusTwo = util.RationalNumber.parseRationalNumber(-2, 0);
      let actual1: number = rationalNegativeInfinityMinusTwo.getNumerator();
      let expected1: int = -1;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_NUMERATOR_ONE_2000
     * @tc.name rationalNumberGetNumeratorOneTest020
     * @tc.desc Verify RationalNumber.createRationalFromString('-11/4').getNumerator() returns -11
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetNumeratorOneTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalStringMinusElevenQuarters = util.RationalNumber.createRationalFromString('-11/4');
      let actual1: number = rationalStringMinusElevenQuarters.getNumerator();
      let expected1: int = -11;
      expect(actual1).assertEqual(expected1);
    });
  });
}
