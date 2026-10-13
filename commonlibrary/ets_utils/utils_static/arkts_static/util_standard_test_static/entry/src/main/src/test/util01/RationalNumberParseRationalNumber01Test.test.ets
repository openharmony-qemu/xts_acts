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

export default function rationalNumberParseRationalNumber01Test(): void {
  describe('rationalNumberParseRationalNumber01Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_ONE_0100
     * @tc.name rationalNumberParseRationalNumberOneTest001
     * @tc.desc Verify getDenominator() of 3, 5 returns 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberParseRationalNumberOneTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = util.RationalNumber.parseRationalNumber(3, 5);
      let actual1: number = r.getDenominator();
      let expected1: int = 5;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_ONE_0200
     * @tc.name rationalNumberParseRationalNumberOneTest002
     * @tc.desc Verify getNumerator() of n, d returns 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberParseRationalNumberOneTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: int = 5;
      let d: int = 7;
      let r = util.RationalNumber.parseRationalNumber(n, d);
      let actual1: number = r.getNumerator();
      let expected1: int = 5;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_ONE_0300
     * @tc.name rationalNumberParseRationalNumberOneTest003
     * @tc.desc Verify parseRationalNumber(9, 2) returns '9/2'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberParseRationalNumberOneTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n: int = 9;
      let d: int = 2;
      let r = util.RationalNumber.parseRationalNumber(n, d);
      let actual1: string = r.toString();
      let expected1: string = '9/2';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_ONE_0400
     * @tc.name rationalNumberParseRationalNumberOneTest004
     * @tc.desc Verify parseRationalNumber(6, 3) returns '2/1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberParseRationalNumberOneTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = util.RationalNumber.parseRationalNumber(6, 3);
      let actual1: string = r.toString();
      let expected1: string = '2/1';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_ONE_0500
     * @tc.name rationalNumberParseRationalNumberOneTest005
     * @tc.desc Verify loop parseRationalNumber(1, 2) is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberParseRationalNumberOneTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ok: boolean = true;
      for (let i = 0; i < 8; i++) {
        let r = util.RationalNumber.parseRationalNumber(1, 2);
        if (r.toString() !== '1/2') {
          ok = false;
        }
      }
      expect(ok).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_ONE_0600
     * @tc.name rationalNumberParseRationalNumberOneTest006
     * @tc.desc Verify parseRationalNumber(1, 2) is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberParseRationalNumberOneTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1 = util.RationalNumber.parseRationalNumber(1, 2);
      let r2 = util.RationalNumber.parseRationalNumber(1, 2);
      let actual1: boolean = r1 === r2;
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_ONE_0700
     * @tc.name rationalNumberParseRationalNumberOneTest007
     * @tc.desc Verify toString() of 0, 1 returns '0/1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberParseRationalNumberOneTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = util.RationalNumber.parseRationalNumber(0, 1);
      let actual1: string = r.toString();
      let expected1: string = '0/1';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_ONE_0800
     * @tc.name rationalNumberParseRationalNumberOneTest008
     * @tc.desc Verify getNumerator() of -1, 3 returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberParseRationalNumberOneTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = util.RationalNumber.parseRationalNumber(-1, 3);
      let actual1: number = r.getNumerator();
      let expected1: int = -1;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_ONE_0900
     * @tc.name rationalNumberParseRationalNumberOneTest009
     * @tc.desc Verify toString() of -4, 2 returns '-2/1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberParseRationalNumberOneTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = util.RationalNumber.parseRationalNumber(-4, 2);
      let actual1: string = r.toString();
      let expected1: string = '-2/1';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_ONE_1000
     * @tc.name rationalNumberParseRationalNumberOneTest010
     * @tc.desc Verify toString() of 7, 7 returns '1/1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberParseRationalNumberOneTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = util.RationalNumber.parseRationalNumber(7, 7);
      let actual1: string = r.toString();
      let expected1: string = '1/1';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_ONE_1100
     * @tc.name rationalNumberParseRationalNumberOneTest011
     * @tc.desc Verify valueOf() of 100, 0 returns Double.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberParseRationalNumberOneTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = util.RationalNumber.parseRationalNumber(100, 0);
      let actual1: number = r.valueOf();
      let expected1: number = Double.POSITIVE_INFINITY;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_ONE_1200
     * @tc.name rationalNumberParseRationalNumberOneTest012
     * @tc.desc Verify toString() of 1, -2 returns '-1/2'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberParseRationalNumberOneTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = util.RationalNumber.parseRationalNumber(1, -2);
      let actual1: string = r.toString();
      let expected1: string = '-1/2';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_ONE_1300
     * @tc.name rationalNumberParseRationalNumberOneTest013
     * @tc.desc Verify getDenominator() of 1, 1000000 returns 1000000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberParseRationalNumberOneTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = util.RationalNumber.parseRationalNumber(1, 1000000);
      let actual1: number = r.getDenominator();
      let expected1: int = 1000000;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_ONE_1400
     * @tc.name rationalNumberParseRationalNumberOneTest014
     * @tc.desc Verify getNumerator() of 1, -9223372036854775807 - 1 returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberParseRationalNumberOneTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = util.RationalNumber.parseRationalNumber(1, -9223372036854775807 - 1);
      let actual1: number = r.getNumerator();
      let expected1: int = -1;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_ONE_1500
     * @tc.name rationalNumberParseRationalNumberOneTest015
     * @tc.desc Verify valueOf() of -1234567, 0 returns Double.NEGATIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberParseRationalNumberOneTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = util.RationalNumber.parseRationalNumber(-1234567, 0);
      let actual1: number = r.valueOf();
      let expected1: number = Double.NEGATIVE_INFINITY;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_ONE_1600
     * @tc.name rationalNumberParseRationalNumberOneTest016
     * @tc.desc Verify toString() of -9, -3 returns '3/1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberParseRationalNumberOneTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = util.RationalNumber.parseRationalNumber(-9, -3);
      let actual1: string = r.toString();
      let expected1: string = '3/1';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_ONE_1700
     * @tc.name rationalNumberParseRationalNumberOneTest017
     * @tc.desc Verify toString() of 5, -10 returns '-1/2'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberParseRationalNumberOneTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = util.RationalNumber.parseRationalNumber(5, -10);
      let actual1: string = r.toString();
      let expected1: string = '-1/2';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_ONE_1800
     * @tc.name rationalNumberParseRationalNumberOneTest018
     * @tc.desc Verify toString() of 1000000, 250000 returns '4/1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberParseRationalNumberOneTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = util.RationalNumber.parseRationalNumber(1000000, 250000);
      let actual1: string = r.toString();
      let expected1: string = '4/1';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_ONE_1900
     * @tc.name rationalNumberParseRationalNumberOneTest019
     * @tc.desc Verify RationalNumber.parseRationalNumber(9223372036854775807, 9223372036854775807).toString() returns '1/1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberParseRationalNumberOneTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = util.RationalNumber.parseRationalNumber(9223372036854775807, 9223372036854775807);
      let actual1: string = r.toString();
      let expected1: string = '1/1';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_ONE_2000
     * @tc.name rationalNumberParseRationalNumberOneTest020
     * @tc.desc Verify RationalNumber.parseRationalNumber(-9223372036854775807 - 1, -9223372036854775807 - 1).toString() returns '1/1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberParseRationalNumberOneTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = util.RationalNumber.parseRationalNumber(-9223372036854775807 - 1, -9223372036854775807 - 1);
      let actual1: string = r.toString();
      let expected1: string = '1/1';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_ONE_2100
     * @tc.name rationalNumberParseRationalNumberOneTest021
     * @tc.desc Verify toString() of 9223372036854775807, -9223372036854775807 - 1 returns '9223372036854775807/-9223372036854775808' irreducible MAX/MIN pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberParseRationalNumberOneTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = util.RationalNumber.parseRationalNumber(9223372036854775807, -9223372036854775807 - 1);
      let actual1: string = r.toString();
      let expected1: string = '9223372036854775807/-9223372036854775808';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_ONE_2200
     * @tc.name rationalNumberParseRationalNumberOneTest022
     * @tc.desc Verify getDenominator() of 9223372036854775807, 2 returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberParseRationalNumberOneTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = util.RationalNumber.parseRationalNumber(9223372036854775807, 2);
      let actual1: number = r.getDenominator();
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_ONE_2300
     * @tc.name rationalNumberParseRationalNumberOneTest023
     * @tc.desc Verify getNumerator() of 2, 9223372036854775807 returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberParseRationalNumberOneTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = util.RationalNumber.parseRationalNumber(2, 9223372036854775807);
      let actual1: number = r.getNumerator();
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_ONE_2400
     * @tc.name rationalNumberParseRationalNumberOneTest024
     * @tc.desc Verify RationalNumber.parseRationalNumber(-9223372036854775807 - 1, -1).getNumerator() returns -9223372036854775807 - 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberParseRationalNumberOneTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = util.RationalNumber.parseRationalNumber(-9223372036854775807 - 1, -1);
      let actual1: number = r.getNumerator();
      let expected1: number = -9223372036854775807 - 1;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_ONE_2500
     * @tc.name rationalNumberParseRationalNumberOneTest025
     * @tc.desc Verify toString() of 2000000000, 1000000000 returns '2/1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberParseRationalNumberOneTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = util.RationalNumber.parseRationalNumber(2000000000, 1000000000);
      let actual1: string = r.toString();
      let expected1: string = '2/1';
      expect(actual1).assertEqual(expected1);
    });
  });
}
