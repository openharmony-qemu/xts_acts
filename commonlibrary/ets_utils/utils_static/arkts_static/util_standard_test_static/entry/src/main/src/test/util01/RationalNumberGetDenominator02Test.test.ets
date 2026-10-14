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

export default function rationalNumberGetDenominator02Test(): void {
  describe('rationalNumberGetDenominator02Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_DENOMINATOR_TWO_0100
     * @tc.name rationalNumberGetDenominatorTwoTest001
     * @tc.desc Verify typeof RationalNumber.parseRationalNumber(-7, 2).getDenominator() returns 'long'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetDenominatorTwoTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalMinusSevenHalves = util.RationalNumber.parseRationalNumber(-7, 2);
      let denominatorMinusSevenHalves = rationalMinusSevenHalves.getDenominator();
      let actual1: string = typeof denominatorMinusSevenHalves;
      let expected1: string = 'long';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_DENOMINATOR_TWO_0200
     * @tc.name rationalNumberGetDenominatorTwoTest002
     * @tc.desc Verify isFinite(RationalNumber.parseRationalNumber(-7, 2).getDenominator()) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetDenominatorTwoTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalMinusSevenHalves = util.RationalNumber.parseRationalNumber(-7, 2);
      let denominatorMinusSevenHalves = rationalMinusSevenHalves.getDenominator();
      let actual1: boolean = isFinite(denominatorMinusSevenHalves);
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_DENOMINATOR_TWO_0300
     * @tc.name rationalNumberGetDenominatorTwoTest003
     * @tc.desc Verify RationalNumber.parseRationalNumber(3, 4).getDenominator() returns RationalNumber.createRationalFromString('3/4').getDenominator()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetDenominatorTwoTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalParseQuarter = util.RationalNumber.parseRationalNumber(3, 4);
      let rationalStringQuarter = util.RationalNumber.createRationalFromString('3/4');
      let actual1: number = rationalParseQuarter.getDenominator();
      let expected1: number = rationalStringQuarter.getDenominator();
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_DENOMINATOR_TWO_0400
     * @tc.name rationalNumberGetDenominatorTwoTest004
     * @tc.desc Verify RationalNumber.parseRationalNumber(6, 9).getDenominator() returns RationalNumber.createRationalFromString('2/3').getDenominator()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetDenominatorTwoTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalUnreducedThird = util.RationalNumber.parseRationalNumber(6, 9);
      let rationalStringThird = util.RationalNumber.createRationalFromString('2/3');
      let actual1: number = rationalUnreducedThird.getDenominator();
      let expected1: number = rationalStringThird.getDenominator();
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_DENOMINATOR_TWO_0500
     * @tc.name rationalNumberGetDenominatorTwoTest005
     * @tc.desc Verify RationalNumber.parseRationalNumber(5, 8).getNumerator() returns 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetDenominatorTwoTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalFiveEighths = util.RationalNumber.parseRationalNumber(5, 8);
      rationalFiveEighths.getDenominator();
      let actual1: number = rationalFiveEighths.getNumerator();
      let expected1: int = 5;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_DENOMINATOR_TWO_0600
     * @tc.name rationalNumberGetDenominatorTwoTest006
     * @tc.desc Verify RationalNumber.parseRationalNumber(-7, 2).getDenominator() returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetDenominatorTwoTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalMinusSevenHalves = util.RationalNumber.parseRationalNumber(-7, 2);
      rationalMinusSevenHalves.getDenominator();
      let actual1: number = rationalMinusSevenHalves.getDenominator();
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_DENOMINATOR_TWO_0700
     * @tc.name rationalNumberGetDenominatorTwoTest007
     * @tc.desc Verify RationalNumber.parseRationalNumber(5, 8).toString() returns '5/8'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetDenominatorTwoTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalFiveEighths = util.RationalNumber.parseRationalNumber(5, 8);
      rationalFiveEighths.getDenominator();
      let actual1: string = rationalFiveEighths.toString();
      let expected1: string = '5/8';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_DENOMINATOR_TWO_0800
     * @tc.name rationalNumberGetDenominatorTwoTest008
     * @tc.desc Verify RationalNumber.createRationalFromString('7/0').getDenominator() returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetDenominatorTwoTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalStringInfinity = util.RationalNumber.createRationalFromString('7/0');
      rationalStringInfinity.getDenominator();
      let actual1: number = rationalStringInfinity.getDenominator();
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_DENOMINATOR_TWO_0900
     * @tc.name rationalNumberGetDenominatorTwoTest009
     * @tc.desc Verify RationalNumber.parseRationalNumber(4, 6).getDenominator() returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetDenominatorTwoTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalUnreducedHalf = util.RationalNumber.parseRationalNumber(4, 6);
      rationalUnreducedHalf.getDenominator();
      let actual1: number = rationalUnreducedHalf.getDenominator();
      let expected1: int = 3;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_DENOMINATOR_TWO_1000
     * @tc.name rationalNumberGetDenominatorTwoTest010
     * @tc.desc Verify RationalNumber.parseRationalNumber(1, 2147483647).getDenominator() returns 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetDenominatorTwoTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalOverIntMax = util.RationalNumber.parseRationalNumber(1, 2147483647);
      let actual1: number = rationalOverIntMax.getDenominator();
      let expected1: int = 2147483647;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_DENOMINATOR_TWO_1100
     * @tc.name rationalNumberGetDenominatorTwoTest011
     * @tc.desc Verify RationalNumber.parseRationalNumber(1, -2147483648).getDenominator() returns 2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetDenominatorTwoTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalOverIntMin = util.RationalNumber.parseRationalNumber(1, -2147483648);
      let actual1: number = rationalOverIntMin.getDenominator();
      let expected1: number = 2147483648;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_DENOMINATOR_TWO_1200
     * @tc.name rationalNumberGetDenominatorTwoTest012
     * @tc.desc Verify RationalNumber.parseRationalNumber(1, 9007199254740993).getDenominator() returns 9007199254740992.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetDenominatorTwoTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalOverTwoPow53PlusOne = util.RationalNumber.parseRationalNumber(1, 9007199254740993);
      let actual1: number = rationalOverTwoPow53PlusOne.getDenominator();
      let expected1: number = 9007199254740992.0;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_DENOMINATOR_TWO_1300
     * @tc.name rationalNumberGetDenominatorTwoTest013
     * @tc.desc Verify RationalNumber.parseRationalNumber(0, 0).getDenominator() returns RationalNumber.createRationalFromString('0/0').getDenominator()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetDenominatorTwoTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalParseNaN = util.RationalNumber.parseRationalNumber(0, 0);
      let rationalStringNaN = util.RationalNumber.createRationalFromString('0/0');
      let actual1: number = rationalParseNaN.getDenominator();
      let expected1: number = rationalStringNaN.getDenominator();
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_DENOMINATOR_TWO_1400
     * @tc.name rationalNumberGetDenominatorTwoTest014
     * @tc.desc Verify RationalNumber.parseRationalNumber(1, -0).getDenominator() returns RationalNumber.parseRationalNumber(1, 0).getDenominator()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetDenominatorTwoTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalOverNegativeZero = util.RationalNumber.parseRationalNumber(1, -0);
      let rationalOverPositiveZero = util.RationalNumber.parseRationalNumber(1, 0);
      let actual1: number = rationalOverNegativeZero.getDenominator();
      let expected1: number = rationalOverPositiveZero.getDenominator();
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_DENOMINATOR_TWO_1500
     * @tc.name rationalNumberGetDenominatorTwoTest015
     * @tc.desc Verify RationalNumber.parseRationalNumber(2, -4).getDenominator() returns RationalNumber.parseRationalNumber(-1, 2).getDenominator()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetDenominatorTwoTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalTwoOverMinusFour = util.RationalNumber.parseRationalNumber(2, -4);
      let rationalMinusHalf = util.RationalNumber.parseRationalNumber(-1, 2);
      let actual1: number = rationalTwoOverMinusFour.getDenominator();
      let expected1: number = rationalMinusHalf.getDenominator();
      expect(actual1).assertEqual(expected1);
    });
  });
}
