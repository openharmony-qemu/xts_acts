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

export default function rationalNumberValueOf02Test(): void {
  describe('rationalNumberValueOf02Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_VALUE_OF_TWO_0100
     * @tc.name rationalNumberValueOfTwoTest001
     * @tc.desc Verify typeof RationalNumber.parseRationalNumber(1, 2).valueOf() returns 'number'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberValueOfTwoTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalHalf = util.RationalNumber.parseRationalNumber(1, 2);
      let resultHalf = rationalHalf.valueOf();
      let actual1: string = typeof resultHalf;
      let expected1: string = 'number';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_VALUE_OF_TWO_0200
     * @tc.name rationalNumberValueOfTwoTest002
     * @tc.desc Verify RationalNumber.parseRationalNumber(1, 2).valueOf() returns 1.0 / 2.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberValueOfTwoTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalHalf = util.RationalNumber.parseRationalNumber(1, 2);
      let resultHalf = rationalHalf.valueOf();
      let expectedHalf: double = 1.0 / 2.0;
      expect(resultHalf).assertEqual(expectedHalf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_VALUE_OF_TWO_0300
     * @tc.name rationalNumberValueOfTwoTest003
     * @tc.desc Verify RationalNumber.parseRationalNumber(7, 2).valueOf() returns 7.0 / 2.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberValueOfTwoTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalSevenHalves = util.RationalNumber.parseRationalNumber(7, 2);
      let resultSevenHalves = rationalSevenHalves.valueOf();
      let expectedSevenHalves: double = 7.0 / 2.0;
      expect(resultSevenHalves).assertEqual(expectedSevenHalves);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_VALUE_OF_TWO_0400
     * @tc.name rationalNumberValueOfTwoTest004
     * @tc.desc Verify 1/3 valueOf 1/3 equals true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberValueOfTwoTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalOne = util.RationalNumber.parseRationalNumber(1, 3);
      let rationalTwo = util.RationalNumber.parseRationalNumber(1, 3);
      rationalOne.valueOf();
      let actual1: boolean = rationalOne.equals(rationalTwo);
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_VALUE_OF_TWO_0500
     * @tc.name rationalNumberValueOfTwoTest005
     * @tc.desc Verify RationalNumber.parseRationalNumber(1, 3).compare(RationalNumber.parseRationalNumber(1, 2)) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberValueOfTwoTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalThird = util.RationalNumber.parseRationalNumber(1, 3);
      let rationalHalf = util.RationalNumber.parseRationalNumber(1, 2);
      rationalThird.valueOf();
      let actual1: number = rationalThird.compare(rationalHalf);
      let expected1: int = -1;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_VALUE_OF_TWO_0600
     * @tc.name rationalNumberValueOfTwoTest006
     * @tc.desc Verify parseRationalNumber(2, 3) returns secondCallValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberValueOfTwoTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalTwoThirds = util.RationalNumber.parseRationalNumber(2, 3);
      let firstCallValue = rationalTwoThirds.valueOf();
      let secondCallValue = rationalTwoThirds.valueOf();
      expect(firstCallValue).assertEqual(secondCallValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_VALUE_OF_TWO_0700
     * @tc.name rationalNumberValueOfTwoTest007
     * @tc.desc Verify RationalNumber.parseRationalNumber(1, 2).valueOf() returns 0.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberValueOfTwoTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalHalf = util.RationalNumber.parseRationalNumber(1, 2);
      let resultHalf = rationalHalf.valueOf();
      expect(resultHalf).assertEqual(0.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_VALUE_OF_TWO_0800
     * @tc.name rationalNumberValueOfTwoTest008
     * @tc.desc Verify RationalNumber.parseRationalNumber(1, 2).valueOf() + RationalNumber.parseRationalNumber(1, 4).valueOf() returns 0.75
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberValueOfTwoTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalHalf = util.RationalNumber.parseRationalNumber(1, 2);
      let rationalQuarter = util.RationalNumber.parseRationalNumber(1, 4);
      let sumOfValues: double = rationalHalf.valueOf() + rationalQuarter.valueOf();
      expect(sumOfValues).assertEqual(0.75);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_VALUE_OF_TWO_0900
     * @tc.name rationalNumberValueOfTwoTest009
     * @tc.desc Verify RationalNumber.parseRationalNumber(1, 2).valueOf() * RationalNumber.parseRationalNumber(2, 1).valueOf() returns 1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberValueOfTwoTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalHalf = util.RationalNumber.parseRationalNumber(1, 2);
      let rationalTwo = util.RationalNumber.parseRationalNumber(2, 1);
      let productOfValues: double = rationalHalf.valueOf() * rationalTwo.valueOf();
      expect(productOfValues).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_VALUE_OF_TWO_1000
     * @tc.name rationalNumberValueOfTwoTest010
     * @tc.desc Verify RationalNumber.parseRationalNumber(0, 0).valueOf() !== RationalNumber.parseRationalNumber(0, 0).valueOf() returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberValueOfTwoTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNaN = util.RationalNumber.parseRationalNumber(0, 0);
      let nanResult = rationalNaN.valueOf();
      let actual1: boolean = nanResult !== nanResult;
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_VALUE_OF_TWO_1100
     * @tc.name rationalNumberValueOfTwoTest011
     * @tc.desc Verify RationalNumber.parseRationalNumber(1, 0).valueOf() * 2.0 returns Number.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberValueOfTwoTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalPositiveInfinity = util.RationalNumber.parseRationalNumber(1, 0);
      let infinityValue = rationalPositiveInfinity.valueOf();
      let doubledInfinity: double = infinityValue * 2.0;
      expect(doubledInfinity).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_VALUE_OF_TWO_1200
     * @tc.name rationalNumberValueOfTwoTest012
     * @tc.desc Verify RationalNumber.parseRationalNumber(-1, 0).valueOf() + 1.0 returns -Number.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberValueOfTwoTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNegativeInfinity = util.RationalNumber.parseRationalNumber(-1, 0);
      let negativeInfinityValue = rationalNegativeInfinity.valueOf();
      let shiftedNegativeInfinity: double = negativeInfinityValue + 1.0;
      expect(shiftedNegativeInfinity).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_VALUE_OF_TWO_1300
     * @tc.name rationalNumberValueOfTwoTest013
     * @tc.desc Verify RationalNumber.parseRationalNumber(4, 2).valueOf() returns RationalNumber.parseRationalNumber(2, 1).valueOf()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberValueOfTwoTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalUnreducedTwo = util.RationalNumber.parseRationalNumber(4, 2);
      let rationalTwo = util.RationalNumber.parseRationalNumber(2, 1);
      let actual1: number = rationalUnreducedTwo.valueOf();
      let expected1: number = rationalTwo.valueOf();
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_VALUE_OF_TWO_1400
     * @tc.name rationalNumberValueOfTwoTest014
     * @tc.desc Verify parseRationalNumber(9223372036854775807, 2) returns 4.611686018427388e18
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberValueOfTwoTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalLongMaxHalves = util.RationalNumber.parseRationalNumber(9223372036854775807, 2);
      let resultLongMaxHalves = rationalLongMaxHalves.valueOf();
      expect(resultLongMaxHalves).assertEqual(4.611686018427388e18);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_VALUE_OF_TWO_1500
     * @tc.name rationalNumberValueOfTwoTest015
     * @tc.desc Verify parseRationalNumber(9007199254740993, 1) returns 9007199254740992.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberValueOfTwoTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalTwoPow53PlusOne = util.RationalNumber.parseRationalNumber(9007199254740993, 1);
      let resultTwoPow53PlusOne = rationalTwoPow53PlusOne.valueOf();
      expect(resultTwoPow53PlusOne).assertEqual(9007199254740992.0);
    });
  });
}
