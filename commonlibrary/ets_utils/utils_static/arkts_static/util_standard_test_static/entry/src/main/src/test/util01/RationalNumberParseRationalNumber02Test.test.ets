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

export default function rationalNumberParseRationalNumber02Test(): void {
  describe('rationalNumberParseRationalNumber02Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_TWO_0100
     * @tc.name rationalNumberParseRationalNumberTwoTest001
     * @tc.desc Verify RationalNumber.parseRationalNumber(0, 0) instanceof RationalNumber returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberParseRationalNumberTwoTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(0, 0);
      let actual1: boolean = rationalNumber instanceof util.RationalNumber;
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_TWO_0200
     * @tc.name rationalNumberParseRationalNumberTwoTest002
     * @tc.desc Verify RationalNumber.parseRationalNumber(9223372036854775807, 1) instanceof RationalNumber returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberParseRationalNumberTwoTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(9223372036854775807, 1);
      let actual1: boolean = rationalNumber instanceof util.RationalNumber;
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_TWO_0300
     * @tc.name rationalNumberParseRationalNumberTwoTest003
     * @tc.desc Verify typeof RationalNumber.parseRationalNumber(0, 0) returns 'object'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberParseRationalNumberTwoTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(0, 0);
      let actual1: string = typeof rationalNumber;
      let expected1: string = 'object';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_TWO_0400
     * @tc.name rationalNumberParseRationalNumberTwoTest004
     * @tc.desc Verify getNumerator() of 8, 4 returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberParseRationalNumberTwoTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(8, 4);
      let actual1: number = rationalNumber.getNumerator();
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_TWO_0500
     * @tc.name rationalNumberParseRationalNumberTwoTest005
     * @tc.desc Verify getNumerator() of 1, -2 returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberParseRationalNumberTwoTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(1, -2);
      let actual1: number = rationalNumber.getNumerator();
      let expected1: int = -1;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_TWO_0600
     * @tc.name rationalNumberParseRationalNumberTwoTest006
     * @tc.desc Verify getNumerator() of -2, -4 returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberParseRationalNumberTwoTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(-2, -4);
      let actual1: number = rationalNumber.getNumerator();
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_TWO_0700
     * @tc.name rationalNumberParseRationalNumberTwoTest007
     * @tc.desc Verify getNumerator() of 9, 12 returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberParseRationalNumberTwoTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(9, 12);
      let actual1: number = rationalNumber.getNumerator();
      let expected1: int = 3;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_TWO_0800
     * @tc.name rationalNumberParseRationalNumberTwoTest008
     * @tc.desc Verify getDenominator() of 6, 9 returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberParseRationalNumberTwoTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(6, 9);
      let actual1: number = rationalNumber.getDenominator();
      let expected1: int = 3;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_TWO_0900
     * @tc.name rationalNumberParseRationalNumberTwoTest009
     * @tc.desc Verify getDenominator() of 8, 4 returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberParseRationalNumberTwoTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(8, 4);
      let actual1: number = rationalNumber.getDenominator();
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_TWO_1000
     * @tc.name rationalNumberParseRationalNumberTwoTest010
     * @tc.desc Verify getDenominator() of -2, -4 returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberParseRationalNumberTwoTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(-2, -4);
      let actual1: number = rationalNumber.getDenominator();
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_TWO_1100
     * @tc.name rationalNumberParseRationalNumberTwoTest011
     * @tc.desc Verify valueOf() of 8, 4 returns 2.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberParseRationalNumberTwoTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(8, 4);
      let actual1: number = rationalNumber.valueOf();
      let expected1: number = 2.0;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_TWO_1200
     * @tc.name rationalNumberParseRationalNumberTwoTest012
     * @tc.desc Verify RationalNumber.parseRationalNumber(0, 5).valueOf() returns 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberParseRationalNumberTwoTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(0, 5);
      let actual1: number = rationalNumber.valueOf();
      let expected1: number = 0.0;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_TWO_1300
     * @tc.name rationalNumberParseRationalNumberTwoTest013
     * @tc.desc Verify isNaN(RationalNumber.parseRationalNumber(0, 0).valueOf()) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberParseRationalNumberTwoTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(0, 0);
      let actual1: boolean = isNaN(rationalNumber.valueOf());
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_TWO_1400
     * @tc.name rationalNumberParseRationalNumberTwoTest014
     * @tc.desc Verify RationalNumber.parseRationalNumber(-1, 2).valueOf() returns -0.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberParseRationalNumberTwoTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(-1, 2);
      let actual1: number = rationalNumber.valueOf();
      let expected1: number = -0.5;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_TWO_1500
     * @tc.name rationalNumberParseRationalNumberTwoTest015
     * @tc.desc Verify RationalNumber.parseRationalNumber(-2, -4).valueOf() returns 0.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberParseRationalNumberTwoTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(-2, -4);
      let actual1: number = rationalNumber.valueOf();
      let expected1: number = 0.5;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_TWO_1600
     * @tc.name rationalNumberParseRationalNumberTwoTest016
     * @tc.desc Verify RationalNumber.parseRationalNumber(6, 9).valueOf() returns 2.0 / 3.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberParseRationalNumberTwoTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(6, 9);
      let actual1: number = rationalNumber.valueOf();
      let expected1: number = 2.0 / 3.0;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_TWO_1700
     * @tc.name rationalNumberParseRationalNumberTwoTest017
     * @tc.desc Verify valueOf() of 1000000007, 1 returns 1000000007.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberParseRationalNumberTwoTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(1000000007, 1);
      let actual1: number = rationalNumber.valueOf();
      let expected1: number = 1000000007.0;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_TWO_1800
     * @tc.name rationalNumberParseRationalNumberTwoTest018
     * @tc.desc Verify parseRationalNumber(9223372036854775807, 1) is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberParseRationalNumberTwoTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(9223372036854775807, 1);
      let v: double = rationalNumber.valueOf();
      let actual1: boolean = v > 9.0e18 && v < 9.4e18;
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_TWO_1900
     * @tc.name rationalNumberParseRationalNumberTwoTest019
     * @tc.desc Verify RationalNumber.parseRationalNumber(1, 0).toString() returns 'Infinity'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberParseRationalNumberTwoTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(1, 0);
      let actual1: string = rationalNumber.toString();
      let expected1: string = 'Infinity';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_TWO_2000
     * @tc.name rationalNumberParseRationalNumberTwoTest020
     * @tc.desc Verify RationalNumber.parseRationalNumber(-1, 0).toString() returns '-Infinity'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberParseRationalNumberTwoTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(-1, 0);
      let actual1: string = rationalNumber.toString();
      let expected1: string = '-Infinity';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_TWO_2100
     * @tc.name rationalNumberParseRationalNumberTwoTest021
     * @tc.desc Verify RationalNumber.parseRationalNumber(-2, -4).toString() returns '1/2'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberParseRationalNumberTwoTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(-2, -4);
      let actual1: string = rationalNumber.toString();
      let expected1: string = '1/2';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_TWO_2200
     * @tc.name rationalNumberParseRationalNumberTwoTest022
     * @tc.desc Verify RationalNumber.parseRationalNumber(-9223372036854775807 - 1, 1).toString() returns '-9223372036854775808/1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberParseRationalNumberTwoTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(-9223372036854775807 - 1, 1);
      let actual1: string = rationalNumber.toString();
      let expected1: string = '-9223372036854775808/1';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_TWO_2300
     * @tc.name rationalNumberParseRationalNumberTwoTest023
     * @tc.desc Verify RationalNumber.parseRationalNumber(0, 9).toString().length returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberParseRationalNumberTwoTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(0, 9);
      let actual1: int = rationalNumber.toString().length;
      let expected1: int = 3;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_TWO_2400
     * @tc.name rationalNumberParseRationalNumberTwoTest024
     * @tc.desc Verify startsWith('3/') is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberParseRationalNumberTwoTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(3, 4);
      let s: string = rationalNumber.toString();
      let actual1: boolean = s.startsWith('3/');
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_TWO_2500
     * @tc.name rationalNumberParseRationalNumberTwoTest025
     * @tc.desc Verify endsWith('/4') is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberParseRationalNumberTwoTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(3, 4);
      let s: string = rationalNumber.toString();
      let actual1: boolean = s.endsWith('/4');
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_TWO_2600
     * @tc.name rationalNumberParseRationalNumberTwoTest026
     * @tc.desc Verify toString() of 7, 9 equals numerator + '/' + denominator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberParseRationalNumberTwoTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(7, 9);
      let joined: string = '' + rationalNumber.getNumerator() + '/' + rationalNumber.getDenominator();
      let actual1: string = rationalNumber.toString();
      let expected1: string = joined;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_TWO_2700
     * @tc.name rationalNumberParseRationalNumberTwoTest027
     * @tc.desc Verify RationalNumber.parseRationalNumber(0, -7).isZero() returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberParseRationalNumberTwoTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(0, -7);
      let actual1: boolean = rationalNumber.isZero();
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_TWO_2800
     * @tc.name rationalNumberParseRationalNumberTwoTest028
     * @tc.desc Verify RationalNumber.parseRationalNumber(0, 5).isNaN() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberParseRationalNumberTwoTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(0, 5);
      let actual1: boolean = rationalNumber.isNaN();
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_TWO_2900
     * @tc.name rationalNumberParseRationalNumberTwoTest029
     * @tc.desc Verify RationalNumber.parseRationalNumber(8, 4).isFinite() returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberParseRationalNumberTwoTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(8, 4);
      let actual1: boolean = rationalNumber.isFinite();
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_TWO_3000
     * @tc.name rationalNumberParseRationalNumberTwoTest030
     * @tc.desc Verify RationalNumber.parseRationalNumber(0, 0).isNaN() returns isNaN(RationalNumber.parseRationalNumber(0, 0).valueOf())
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberParseRationalNumberTwoTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(0, 0);
      let actual1: boolean = rationalNumber.isNaN();
      let expected1: boolean = isNaN(rationalNumber.valueOf());
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_TWO_3100
     * @tc.name rationalNumberParseRationalNumberTwoTest031
     * @tc.desc Verify parse(1,2) parse(1,-2) equals false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberParseRationalNumberTwoTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1 = util.RationalNumber.parseRationalNumber(1, 2);
      let r2 = util.RationalNumber.parseRationalNumber(1, -2);
      let actual1: boolean = r1.equals(r2);
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_TWO_3200
     * @tc.name rationalNumberParseRationalNumberTwoTest032
     * @tc.desc Verify parse(1,-2) parse(-1,2) -1/2 equals true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberParseRationalNumberTwoTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1 = util.RationalNumber.parseRationalNumber(1, -2);
      let r2 = util.RationalNumber.parseRationalNumber(-1, 2);
      let actual1: boolean = r1.equals(r2);
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_TWO_3300
     * @tc.name rationalNumberParseRationalNumberTwoTest033
     * @tc.desc Verify parse(1,0) parse(2,0) equals true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberParseRationalNumberTwoTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1 = util.RationalNumber.parseRationalNumber(1, 0);
      let r2 = util.RationalNumber.parseRationalNumber(2, 0);
      let actual1: boolean = r1.equals(r2);
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_TWO_3400
     * @tc.name rationalNumberParseRationalNumberTwoTest034
     * @tc.desc Verify parse(0,0) parse(0,0) NaN equals true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberParseRationalNumberTwoTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1 = util.RationalNumber.parseRationalNumber(0, 0);
      let r2 = util.RationalNumber.parseRationalNumber(0, 0);
      let actual1: boolean = r1.equals(r2);
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_TWO_3500
     * @tc.name rationalNumberParseRationalNumberTwoTest035
     * @tc.desc Verify parse(8,4) parse(2,1) equals true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberParseRationalNumberTwoTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1 = util.RationalNumber.parseRationalNumber(8, 4);
      let r2 = util.RationalNumber.parseRationalNumber(2, 1);
      let actual1: boolean = r1.equals(r2);
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_TWO_3600
     * @tc.name rationalNumberParseRationalNumberTwoTest036
     * @tc.desc Verify parse(9223372036854775807,1) equals true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberParseRationalNumberTwoTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1 = util.RationalNumber.parseRationalNumber(9223372036854775807, 1);
      let r2 = util.RationalNumber.parseRationalNumber(9223372036854775807, 1);
      let actual1: boolean = r1.equals(r2);
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_TWO_3700
     * @tc.name rationalNumberParseRationalNumberTwoTest037
     * @tc.desc Verify RationalNumber.parseRationalNumber(1, 0).compare(RationalNumber.parseRationalNumber(-1, 0)) returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberParseRationalNumberTwoTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1 = util.RationalNumber.parseRationalNumber(1, 0);
      let r2 = util.RationalNumber.parseRationalNumber(-1, 0);
      let actual1: number = r1.compare(r2);
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_TWO_3800
     * @tc.name rationalNumberParseRationalNumberTwoTest038
     * @tc.desc Verify RationalNumber.parseRationalNumber(8, 4).compare(RationalNumber.parseRationalNumber(2, 1)) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberParseRationalNumberTwoTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1 = util.RationalNumber.parseRationalNumber(8, 4);
      let r2 = util.RationalNumber.parseRationalNumber(2, 1);
      let actual1: number = r1.compare(r2);
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_TWO_3900
     * @tc.name rationalNumberParseRationalNumberTwoTest039
     * @tc.desc Verify RationalNumber.parseRationalNumber(1, 2).compare(RationalNumber.parseRationalNumber(1, 0)) returns -RationalNumber.parseRationalNumber(1, 0).compare(RationalNumber.parseRationalNumber(1, 2))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberParseRationalNumberTwoTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1 = util.RationalNumber.parseRationalNumber(1, 2);
      let r2 = util.RationalNumber.parseRationalNumber(1, 0);
      let actual1: number = r1.compare(r2);
      let expected1: number = -r2.compare(r1);
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_TWO_4000
     * @tc.name rationalNumberParseRationalNumberTwoTest040
     * @tc.desc Verify RationalNumber.parseRationalNumber(0, 5).compare(RationalNumber.parseRationalNumber(0, 1)) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberParseRationalNumberTwoTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1 = util.RationalNumber.parseRationalNumber(0, 5);
      let r2 = util.RationalNumber.parseRationalNumber(0, 1);
      let actual1: number = r1.compare(r2);
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_TWO_4100
     * @tc.name rationalNumberParseRationalNumberTwoTest041
     * @tc.desc Verify valueOf() of parseRationalNumber(1, 2) and parseRationalNumber(2, 4) both return 0.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberParseRationalNumberTwoTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1 = util.RationalNumber.parseRationalNumber(1, 2);
      let r2 = util.RationalNumber.parseRationalNumber(2, 4);
      let actual1: number = r1.valueOf();
      let expected1: number = 0.5;
      expect(actual1).assertEqual(expected1);
      let actual2: number = r2.valueOf();
      let expected2: number = 0.5;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_TWO_4200
     * @tc.name rationalNumberParseRationalNumberTwoTest042
     * @tc.desc Verify parseRationalNumber(1, 2) is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberParseRationalNumberTwoTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(1, 2);
      let dft = new util.RationalNumber();
      let actual1: boolean = rationalNumber === dft;
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_TWO_4300
     * @tc.name rationalNumberParseRationalNumberTwoTest043
     * @tc.desc Verify loop parseRationalNumber(i + 1, i + 2) is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberParseRationalNumberTwoTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ok: boolean = true;
      for (let i = 0; i < 16; i++) {
        let rationalNumber = util.RationalNumber.parseRationalNumber(i + 1, i + 2);
        if (rationalNumber.getNumerator() !== i + 1 || rationalNumber.getDenominator() !== i + 2) {
          ok = false;
        }
      }
      expect(ok).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_TWO_4400
     * @tc.name rationalNumberParseRationalNumberTwoTest044
     * @tc.desc Verify parseRationalNumber(1, 3).compare(parseRationalNumber(1, 2)) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberParseRationalNumberTwoTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let actual1: number = util.RationalNumber.parseRationalNumber(1, 3).compare(
        util.RationalNumber.parseRationalNumber(1, 2),
      );
      let expected1: int = -1;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_TWO_4500
     * @tc.name rationalNumberParseRationalNumberTwoTest045
     * @tc.desc Verify toString() of 1, 2 is stable across calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberParseRationalNumberTwoTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(1, 2);
      let actual1: string = rationalNumber.toString();
      let expected1: string = rationalNumber.toString();
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_TWO_4600
     * @tc.name rationalNumberParseRationalNumberTwoTest046
     * @tc.desc Verify RationalNumber.parseRationalNumber(5, 6).getNumerator() returns 5, and RationalNumber.parseRationalNumber(5, 6).getDenominator() returns 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberParseRationalNumberTwoTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(5, 6);
      let d: number = rationalNumber.getDenominator();
      let actual1: number = rationalNumber.getNumerator();
      let expected1: int = 5;
      expect(actual1).assertEqual(expected1);
      expect(d).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_TWO_4700
     * @tc.name rationalNumberParseRationalNumberTwoTest047
     * @tc.desc Verify getNumerator() of 5, 6 returns 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberParseRationalNumberTwoTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(0, 0);
      let z: boolean = rationalNumber.isZero();
      let nn: boolean = rationalNumber.isNaN();
      expect(z).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_TWO_4800
     * @tc.name rationalNumberParseRationalNumberTwoTest048
     * @tc.desc Verify parseRationalNumber(1, 0) returns Double.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberParseRationalNumberTwoTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(1, 0);
      let f: boolean = rationalNumber.isFinite();
      let v: double = rationalNumber.valueOf();
      expect(v).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_TWO_4900
     * @tc.name rationalNumberParseRationalNumberTwoTest049
     * @tc.desc Verify RationalNumber.parseRationalNumber(1, 2).toString() returns RationalNumber.createRationalFromString('1/2').toString()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberParseRationalNumberTwoTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1 = util.RationalNumber.parseRationalNumber(1, 2);
      let r2 = util.RationalNumber.createRationalFromString('1/2');
      let actual1: string = r1.toString();
      let expected1: string = r2.toString();
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_TWO_5000
     * @tc.name rationalNumberParseRationalNumberTwoTest050
     * @tc.desc Verify RationalNumber.parseRationalNumber(1, 2).compare(RationalNumber.createRationalFromString('1/2')) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberParseRationalNumberTwoTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1 = util.RationalNumber.parseRationalNumber(1, 2);
      let r2 = util.RationalNumber.createRationalFromString('1/2');
      let actual1: number = r1.compare(r2);
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
    });
  });
}
