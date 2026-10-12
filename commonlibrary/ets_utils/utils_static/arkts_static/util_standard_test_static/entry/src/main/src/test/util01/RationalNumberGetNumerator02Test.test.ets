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

export default function rationalNumberGetNumerator02Test(): void {
  describe('rationalNumberGetNumerator02Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_NUMERATOR_TWO_0100
     * @tc.name rationalNumberGetNumeratorTwoTest001
     * @tc.desc Verify typeof RationalNumber.parseRationalNumber(0, 5).getNumerator() returns 'long'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetNumeratorTwoTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalZeroOverFive = util.RationalNumber.parseRationalNumber(0, 5);
      let numeratorZeroOverFive = rationalZeroOverFive.getNumerator();
      let actual1: string = typeof numeratorZeroOverFive;
      let expected1: string = 'long';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_NUMERATOR_TWO_0200
     * @tc.name rationalNumberGetNumeratorTwoTest002
     * @tc.desc Verify RationalNumber.parseRationalNumber(3, 4).getNumerator() returns RationalNumber.createRationalFromString('3/4').getNumerator()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetNumeratorTwoTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalParseQuarter = util.RationalNumber.parseRationalNumber(3, 4);
      let rationalStringQuarter = util.RationalNumber.createRationalFromString('3/4');
      let actual1: number = rationalParseQuarter.getNumerator();
      let expected1: number = rationalStringQuarter.getNumerator();
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_NUMERATOR_TWO_0300
     * @tc.name rationalNumberGetNumeratorTwoTest003
     * @tc.desc Verify RationalNumber.parseRationalNumber(-7, 2).getNumerator() returns -7, and calling twice returns same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetNumeratorTwoTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalMinusSevenHalves = util.RationalNumber.parseRationalNumber(-7, 2);
      rationalMinusSevenHalves.getNumerator();
      let actual1: number = rationalMinusSevenHalves.getNumerator();
      let expected1: int = -7;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_NUMERATOR_TWO_0400
     * @tc.name rationalNumberGetNumeratorTwoTest004
     * @tc.desc Verify RationalNumber.parseRationalNumber(4, 6).getNumerator() returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetNumeratorTwoTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalUnreducedHalf = util.RationalNumber.parseRationalNumber(4, 6);
      let actual1: number = rationalUnreducedHalf.getNumerator();
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_NUMERATOR_TWO_0500
     * @tc.name rationalNumberGetNumeratorTwoTest005
     * @tc.desc Verify RationalNumber.parseRationalNumber(5, 8).getNumerator() returns 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetNumeratorTwoTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalFiveEighths = util.RationalNumber.parseRationalNumber(5, 8);
      let actual1: number = rationalFiveEighths.getNumerator();
      let expected1: int = 5;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_NUMERATOR_TWO_0600
     * @tc.name rationalNumberGetNumeratorTwoTest006
     * @tc.desc Verify RationalNumber.parseRationalNumber(2147483647, 1).getNumerator() returns 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetNumeratorTwoTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalIntMax = util.RationalNumber.parseRationalNumber(2147483647, 1);
      let actual1: number = rationalIntMax.getNumerator();
      let expected1: int = 2147483647;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_NUMERATOR_TWO_0700
     * @tc.name rationalNumberGetNumeratorTwoTest007
     * @tc.desc Verify RationalNumber.parseRationalNumber(-2147483648, 1).getNumerator() returns -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetNumeratorTwoTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalIntMin = util.RationalNumber.parseRationalNumber(-2147483648, 1);
      let actual1: number = rationalIntMin.getNumerator();
      let expected1: int = -2147483648;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_NUMERATOR_TWO_0800
     * @tc.name rationalNumberGetNumeratorTwoTest008
     * @tc.desc Verify RationalNumber.parseRationalNumber(9007199254740991, 1).getNumerator() returns 9007199254740991
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetNumeratorTwoTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalMaxSafeInteger = util.RationalNumber.parseRationalNumber(9007199254740991, 1);
      let actual1: number = rationalMaxSafeInteger.getNumerator();
      let expected1: number = 9007199254740991;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_NUMERATOR_TWO_0900
     * @tc.name rationalNumberGetNumeratorTwoTest009
     * @tc.desc Verify RationalNumber.parseRationalNumber(1, 0).getNumerator() returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetNumeratorTwoTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalPositiveInfinity = util.RationalNumber.parseRationalNumber(1, 0);
      let actual1: number = rationalPositiveInfinity.getNumerator();
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_NUMERATOR_TWO_1000
     * @tc.name rationalNumberGetNumeratorTwoTest010
     * @tc.desc Verify RationalNumber.parseRationalNumber(-1, 0).getNumerator() returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetNumeratorTwoTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNegativeInfinity = util.RationalNumber.parseRationalNumber(-1, 0);
      let actual1: number = rationalNegativeInfinity.getNumerator();
      let expected1: int = -1;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_NUMERATOR_TWO_1100
     * @tc.name rationalNumberGetNumeratorTwoTest011
     * @tc.desc Verify RationalNumber.parseRationalNumber(0, 0).getNumerator() returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetNumeratorTwoTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNaN = util.RationalNumber.parseRationalNumber(0, 0);
      let actual1: number = rationalNaN.getNumerator();
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_NUMERATOR_TWO_1200
     * @tc.name rationalNumberGetNumeratorTwoTest012
     * @tc.desc Verify RationalNumber.parseRationalNumber(0, 1).getNumerator() returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetNumeratorTwoTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalZero = util.RationalNumber.parseRationalNumber(0, 1);
      let actual1: number = rationalZero.getNumerator();
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_NUMERATOR_TWO_1300
     * @tc.name rationalNumberGetNumeratorTwoTest013
     * @tc.desc Verify RationalNumber.parseRationalNumber(-1, 2).getNumerator() returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetNumeratorTwoTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalMinusHalf = util.RationalNumber.parseRationalNumber(-1, 2);
      let actual1: number = rationalMinusHalf.getNumerator();
      let expected1: int = -1;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_NUMERATOR_TWO_1400
     * @tc.name rationalNumberGetNumeratorTwoTest014
     * @tc.desc Verify RationalNumber.parseRationalNumber(-2, 4).getNumerator() returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetNumeratorTwoTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalUnreducedMinusHalf = util.RationalNumber.parseRationalNumber(-2, 4);
      let actual1: number = rationalUnreducedMinusHalf.getNumerator();
      let expected1: int = -1;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_NUMERATOR_TWO_1500
     * @tc.name rationalNumberGetNumeratorTwoTest015
     * @tc.desc Verify RationalNumber.createRationalFromString('-5/6').getNumerator() returns -5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetNumeratorTwoTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalStringMinusFiveSixths = util.RationalNumber.createRationalFromString('-5/6');
      let actual1: number = rationalStringMinusFiveSixths.getNumerator();
      let expected1: int = -5;
      expect(actual1).assertEqual(expected1);
    });
  });
}
