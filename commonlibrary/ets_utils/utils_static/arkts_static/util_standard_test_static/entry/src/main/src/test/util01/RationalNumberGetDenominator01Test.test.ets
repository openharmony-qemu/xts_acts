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

export default function rationalNumberGetDenominator01Test(): void {
  describe('rationalNumberGetDenominator01Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_DENOMINATOR_ONE_0100
     * @tc.name rationalNumberGetDenominatorOneTest001
     * @tc.desc Verify RationalNumber.parseRationalNumber(2, 4).getDenominator() returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetDenominatorOneTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(2, 4);
      let actual1: number = rationalNumber.getDenominator();
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_DENOMINATOR_ONE_0200
     * @tc.name rationalNumberGetDenominatorOneTest002
     * @tc.desc Verify RationalNumber.parseRationalNumber(6, 8).getDenominator() returns 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetDenominatorOneTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(6, 8);
      let actual1: number = rationalNumber.getDenominator();
      let expected1: int = 4;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_DENOMINATOR_ONE_0300
     * @tc.name rationalNumberGetDenominatorOneTest003
     * @tc.desc Verify RationalNumber.parseRationalNumber(10, 15).getDenominator() returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetDenominatorOneTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(10, 15);
      let actual1: number = rationalNumber.getDenominator();
      let expected1: int = 3;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_DENOMINATOR_ONE_0400
     * @tc.name rationalNumberGetDenominatorOneTest004
     * @tc.desc Verify RationalNumber.parseRationalNumber(7, 49).getDenominator() returns 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetDenominatorOneTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(7, 49);
      let actual1: number = rationalNumber.getDenominator();
      let expected1: int = 7;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_DENOMINATOR_ONE_0500
     * @tc.name rationalNumberGetDenominatorOneTest005
     * @tc.desc Verify RationalNumber.parseRationalNumber(4, 2).getDenominator() returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetDenominatorOneTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(4, 2);
      let actual1: number = rationalNumber.getDenominator();
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_DENOMINATOR_ONE_0600
     * @tc.name rationalNumberGetDenominatorOneTest006
     * @tc.desc Verify RationalNumber.parseRationalNumber(-1, 2).getDenominator() returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetDenominatorOneTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(-1, 2);
      let actual1: number = rationalNumber.getDenominator();
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_DENOMINATOR_ONE_0700
     * @tc.name rationalNumberGetDenominatorOneTest007
     * @tc.desc Verify RationalNumber.parseRationalNumber(1, -2).getDenominator() returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetDenominatorOneTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(1, -2);
      let actual1: number = rationalNumber.getDenominator();
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_DENOMINATOR_ONE_0800
     * @tc.name rationalNumberGetDenominatorOneTest008
     * @tc.desc Verify RationalNumber.parseRationalNumber(-3, -6).getDenominator() returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetDenominatorOneTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(-3, -6);
      let actual1: number = rationalNumber.getDenominator();
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_DENOMINATOR_ONE_0900
     * @tc.name rationalNumberGetDenominatorOneTest009
     * @tc.desc Verify RationalNumber.parseRationalNumber(0, 5).getDenominator() returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetDenominatorOneTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(0, 5);
      let actual1: number = rationalNumber.getDenominator();
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_DENOMINATOR_ONE_1000
     * @tc.name rationalNumberGetDenominatorOneTest010
     * @tc.desc Verify RationalNumber.parseRationalNumber(0, -7).getDenominator() returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetDenominatorOneTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(0, -7);
      let actual1: number = rationalNumber.getDenominator();
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_DENOMINATOR_ONE_1100
     * @tc.name rationalNumberGetDenominatorOneTest011
     * @tc.desc Verify RationalNumber.parseRationalNumber(1, -9223372036854775807).getDenominator() returns 9223372036854775807
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetDenominatorOneTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(1, -9223372036854775807);
      let actual1: number = rationalNumber.getDenominator();
      let expected1: number = 9223372036854775807;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_DENOMINATOR_ONE_1200
     * @tc.name rationalNumberGetDenominatorOneTest012
     * @tc.desc Verify RationalNumber.parseRationalNumber(9223372036854775807, 9223372036854775807).getDenominator() returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetDenominatorOneTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(9223372036854775807, 9223372036854775807);
      let actual1: number = rationalNumber.getDenominator();
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_DENOMINATOR_ONE_1300
     * @tc.name rationalNumberGetDenominatorOneTest013
     * @tc.desc Verify RationalNumber.parseRationalNumber(2147483647, 2).getDenominator() returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetDenominatorOneTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(2147483647, 2);
      let actual1: number = rationalNumber.getDenominator();
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_DENOMINATOR_ONE_1400
     * @tc.name rationalNumberGetDenominatorOneTest014
     * @tc.desc Verify RationalNumber.parseRationalNumber(3, 11).getDenominator() returns 11
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetDenominatorOneTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(3, 11);
      let actual1: number = rationalNumber.getDenominator();
      let expected1: int = 11;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_DENOMINATOR_ONE_1500
     * @tc.name rationalNumberGetDenominatorOneTest015
     * @tc.desc Verify RationalNumber.parseRationalNumber(1, -1).getDenominator() returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetDenominatorOneTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(1, -1);
      let actual1: number = rationalNumber.getDenominator();
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_DENOMINATOR_ONE_1600
     * @tc.name rationalNumberGetDenominatorOneTest016
     * @tc.desc Verify RationalNumber.parseRationalNumber(1, 256).getDenominator() returns 256
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetDenominatorOneTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(1, 256);
      let actual1: number = rationalNumber.getDenominator();
      let expected1: int = 256;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_DENOMINATOR_ONE_1700
     * @tc.name rationalNumberGetDenominatorOneTest017
     * @tc.desc Verify RationalNumber.parseRationalNumber(1, 15).getDenominator() returns 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetDenominatorOneTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(1, 15);
      let actual1: number = rationalNumber.getDenominator();
      let expected1: int = 15;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_DENOMINATOR_ONE_1800
     * @tc.name rationalNumberGetDenominatorOneTest018
     * @tc.desc Verify RationalNumber.parseRationalNumber(3, 100).getDenominator() returns 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetDenominatorOneTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(3, 100);
      let actual1: number = rationalNumber.getDenominator();
      let expected1: int = 100;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_DENOMINATOR_ONE_1900
     * @tc.name rationalNumberGetDenominatorOneTest019
     * @tc.desc Verify RationalNumber.createRationalFromString('3/4').getDenominator() returns 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetDenominatorOneTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.createRationalFromString('3/4');
      let actual1: number = rationalNumber.getDenominator();
      let expected1: int = 4;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_DENOMINATOR_ONE_2000
     * @tc.name rationalNumberGetDenominatorOneTest020
     * @tc.desc Verify RationalNumber.createRationalFromString('6/8').getDenominator() returns 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetDenominatorOneTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.createRationalFromString('6/8');
      let actual1: number = rationalNumber.getDenominator();
      let expected1: int = 4;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_DENOMINATOR_ONE_2100
     * @tc.name rationalNumberGetDenominatorOneTest021
     * @tc.desc Verify RationalNumber.createRationalFromString('1/0').getDenominator() returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetDenominatorOneTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.createRationalFromString('1/0');
      let actual1: number = rationalNumber.getDenominator();
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_DENOMINATOR_ONE_2200
     * @tc.name rationalNumberGetDenominatorOneTest022
     * @tc.desc Verify RationalNumber.createRationalFromString('-2/5').getDenominator() returns 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetDenominatorOneTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.createRationalFromString('-2/5');
      let actual1: number = rationalNumber.getDenominator();
      let expected1: int = 5;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_DENOMINATOR_ONE_2300
     * @tc.name rationalNumberGetDenominatorOneTest023
     * @tc.desc Verify RationalNumber.createRationalFromString('5/-2').getDenominator() returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetDenominatorOneTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.createRationalFromString('5/-2');
      let actual1: number = rationalNumber.getDenominator();
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_DENOMINATOR_ONE_2400
     * @tc.name rationalNumberGetDenominatorOneTest024
     * @tc.desc Verify RationalNumber.parseRationalNumber(5, 0).getDenominator() returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetDenominatorOneTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(5, 0);
      let actual1: number = rationalNumber.getDenominator();
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_GET_DENOMINATOR_ONE_2500
     * @tc.name rationalNumberGetDenominatorOneTest025
     * @tc.desc Verify RationalNumber.parseRationalNumber(0, 0).getDenominator() returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberGetDenominatorOneTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(0, 0);
      let actual1: number = rationalNumber.getDenominator();
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
    });
  });
}
