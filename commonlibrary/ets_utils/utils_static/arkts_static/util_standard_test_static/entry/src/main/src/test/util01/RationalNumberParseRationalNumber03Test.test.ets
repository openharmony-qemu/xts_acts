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

export default function rationalNumberParseRationalNumber03Test(): void {
  describe('rationalNumberParseRationalNumber03Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_THREE_0100
     * @tc.name rationalNumberParseRationalNumberThreeTest001
     * @tc.desc Verify parseRationalNumber(3, 1) getNumerator returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberParseRationalNumberThreeTest001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rationalNumber = util.RationalNumber.parseRationalNumber(3, 1);
        let actual1: number = rationalNumber.getNumerator();
        let expected1: int = 3;
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_THREE_0200
     * @tc.name rationalNumberParseRationalNumberThreeTest002
     * @tc.desc Verify toString() of 5, 5 returns '1/1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberParseRationalNumberThreeTest002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rationalNumber = util.RationalNumber.parseRationalNumber(5, 5);
        let actual1: string = rationalNumber.toString();
        let expected1: string = '1/1';
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_THREE_0300
     * @tc.name rationalNumberParseRationalNumberThreeTest003
     * @tc.desc Verify toString() of -7, -7 returns '1/1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberParseRationalNumberThreeTest003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rationalNumber = util.RationalNumber.parseRationalNumber(-7, -7);
        let actual1: string = rationalNumber.toString();
        let expected1: string = '1/1';
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_THREE_0400
     * @tc.name rationalNumberParseRationalNumberThreeTest004
     * @tc.desc Verify toString() of MIN long / 2 returns '4611686018427387904/1' sign-loss gcd normalized
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberParseRationalNumberThreeTest004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rationalNumber = util.RationalNumber.parseRationalNumber(-9223372036854775807 - 1, 2);
        let actual1: string = rationalNumber.toString();
        let expected1: string = '4611686018427387904/1';
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_THREE_0500
     * @tc.name rationalNumberParseRationalNumberThreeTest005
     * @tc.desc Verify RationalNumber.parseRationalNumber(9223372036854775807, -1).toString() returns '-9223372036854775807/1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberParseRationalNumberThreeTest005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rationalNumber = util.RationalNumber.parseRationalNumber(9223372036854775807, -1);
        let actual1: string = rationalNumber.toString();
        let expected1: string = '-9223372036854775807/1';
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_THREE_0600
     * @tc.name rationalNumberParseRationalNumberThreeTest006
     * @tc.desc Verify toString() of MIN long / -1 returns '-9223372036854775808/1' numerator keeps MIN long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberParseRationalNumberThreeTest006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rationalNumber = util.RationalNumber.parseRationalNumber(-9223372036854775807 - 1, -1);
        let actual1: string = rationalNumber.toString();
        let expected1: string = '-9223372036854775808/1';
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_THREE_0700
     * @tc.name rationalNumberParseRationalNumberThreeTest007
     * @tc.desc Verify parseRationalNumber(9223372036854775807, -9223372036854775807 - 1) is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberParseRationalNumberThreeTest007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rationalNumber = util.RationalNumber.parseRationalNumber(9223372036854775807, -9223372036854775807 - 1);
        let actual1: boolean = rationalNumber instanceof util.RationalNumber;
        expect(actual1).assertTrue();
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_THREE_0800
     * @tc.name rationalNumberParseRationalNumberThreeTest008
     * @tc.desc Verify getNumerator() of 2, 0 returns 1 gcd(2,0)=2 normalized
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberParseRationalNumberThreeTest008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rationalNumber = util.RationalNumber.parseRationalNumber(2, 0);
        let actual1: number = rationalNumber.getNumerator();
        let expected1: int = 1;
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_THREE_0900
     * @tc.name rationalNumberParseRationalNumberThreeTest009
     * @tc.desc Verify getDenominator() of 0, -1 returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberParseRationalNumberThreeTest009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rationalNumber = util.RationalNumber.parseRationalNumber(0, -1);
        let actual1: number = rationalNumber.getDenominator();
        let expected1: int = 1;
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_THREE_1000
     * @tc.name rationalNumberParseRationalNumberThreeTest010
     * @tc.desc Verify RationalNumber.parseRationalNumber(2, 9223372036854775807).toString() returns '2/9223372036854775807'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberParseRationalNumberThreeTest010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rationalNumber = util.RationalNumber.parseRationalNumber(2, 9223372036854775807);
        let actual1: string = rationalNumber.toString();
        let expected1: string = '2/9223372036854775807';
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_THREE_1100
     * @tc.name rationalNumberParseRationalNumberThreeTest011
     * @tc.desc Verify toString() of 1, 1000000007 returns '1/1000000007'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberParseRationalNumberThreeTest011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rationalNumber = util.RationalNumber.parseRationalNumber(1, 1000000007);
        let actual1: string = rationalNumber.toString();
        let expected1: string = '1/1000000007';
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_THREE_1200
     * @tc.name rationalNumberParseRationalNumberThreeTest012
     * @tc.desc Verify RationalNumber.parseRationalNumber(-2, -3).toString() returns '2/3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberParseRationalNumberThreeTest012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rationalNumber = util.RationalNumber.parseRationalNumber(-2, -3);
        let actual1: string = rationalNumber.toString();
        let expected1: string = '2/3';
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_THREE_1300
     * @tc.name rationalNumberParseRationalNumberThreeTest013
     * @tc.desc Verify toString() of 1, MIN long returns '-1/-9223372036854775808' denominator keeps MIN sign not normalized
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberParseRationalNumberThreeTest013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rationalNumber = util.RationalNumber.parseRationalNumber(1, -9223372036854775807 - 1);
        let actual1: string = rationalNumber.toString();
        let expected1: string = '-1/-9223372036854775808';
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_THREE_1400
     * @tc.name rationalNumberParseRationalNumberThreeTest014
     * @tc.desc Verify getDenominator() of 1, 3 returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberParseRationalNumberThreeTest014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rationalNumber = util.RationalNumber.parseRationalNumber(1, 3);
        let actual1: number = rationalNumber.getDenominator();
        let expected1: int = 3;
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_THREE_1500
     * @tc.name rationalNumberParseRationalNumberThreeTest015
     * @tc.desc Verify getDenominator() of 1, -5 returns 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberParseRationalNumberThreeTest015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rationalNumber = util.RationalNumber.parseRationalNumber(1, -5);
        let actual1: number = rationalNumber.getDenominator();
        let expected1: int = 5;
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_THREE_1600
     * @tc.name rationalNumberParseRationalNumberThreeTest016
     * @tc.desc Verify toString() of 4, 8 returns '1/2' gcd normalized
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberParseRationalNumberThreeTest016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rationalNumber = util.RationalNumber.parseRationalNumber(4, 8);
        let actual1: string = rationalNumber.toString();
        let expected1: string = '1/2';
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_THREE_1700
     * @tc.name rationalNumberParseRationalNumberThreeTest017
     * @tc.desc Verify toString() of 0, -9223372036854775807 returns '0/1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberParseRationalNumberThreeTest017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rationalNumber = util.RationalNumber.parseRationalNumber(0, -9223372036854775807);
        let actual1: string = rationalNumber.toString();
        let expected1: string = '0/1';
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_THREE_1800
     * @tc.name rationalNumberParseRationalNumberThreeTest018
     * @tc.desc Verify getNumerator() of 9223372036854775807, 1 returns 9223372036854776000 float-rounded MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberParseRationalNumberThreeTest018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rationalNumber = util.RationalNumber.parseRationalNumber(9223372036854775807, 1);
        let actual1: number = rationalNumber.getNumerator();
        let expected1: number = 9.223372036854776e18;
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_THREE_1900
     * @tc.name rationalNumberParseRationalNumberThreeTest019
     * @tc.desc Verify isZero() is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberParseRationalNumberThreeTest019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rationalNumber = util.RationalNumber.parseRationalNumber(0, -5);
        let actual1: boolean = rationalNumber.isZero();
        expect(actual1).assertTrue();
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_THREE_2000
     * @tc.name rationalNumberParseRationalNumberThreeTest020
     * @tc.desc Verify typeof RationalNumber.parseRationalNumber(0, 2).valueOf() returns 'number'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberParseRationalNumberThreeTest020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rationalNumber = util.RationalNumber.parseRationalNumber(0, 2);
        let v: double = rationalNumber.valueOf();
        let actual1: string = typeof v;
        let expected1: string = 'number';
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_THREE_2100
     * @tc.name rationalNumberParseRationalNumberThreeTest021
     * @tc.desc Verify valueOf() of 1, 1 returns 1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberParseRationalNumberThreeTest021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rationalNumber = util.RationalNumber.parseRationalNumber(1, 1);
        let actual1: number = rationalNumber.valueOf();
        let expected1: number = 1.0;
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_THREE_2200
     * @tc.name rationalNumberParseRationalNumberThreeTest022
     * @tc.desc Verify valueOf() of 7, 7 returns 1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberParseRationalNumberThreeTest022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rationalNumber = util.RationalNumber.parseRationalNumber(7, 7);
        let actual1: number = rationalNumber.valueOf();
        let expected1: number = 1.0;
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_THREE_2300
     * @tc.name rationalNumberParseRationalNumberThreeTest023
     * @tc.desc Verify RationalNumber.parseRationalNumber(2, 2).getDenominator() returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberParseRationalNumberThreeTest023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rationalNumber = util.RationalNumber.parseRationalNumber(2, 2);
        let actual1: number = rationalNumber.getDenominator();
        let expected1: int = 1;
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_THREE_2400
     * @tc.name rationalNumberParseRationalNumberThreeTest024
     * @tc.desc Verify valueOf() of 9223372036854775807, 9223372036854775807 returns 1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberParseRationalNumberThreeTest024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rationalNumber = util.RationalNumber.parseRationalNumber(9223372036854775807, 9223372036854775807);
        let actual1: number = rationalNumber.valueOf();
        let expected1: number = 1.0;
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_THREE_2500
     * @tc.name rationalNumberParseRationalNumberThreeTest025
     * @tc.desc Verify RationalNumber.parseRationalNumber(0, -1).toString() returns '0/1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberParseRationalNumberThreeTest025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rationalNumber = util.RationalNumber.parseRationalNumber(0, -1);
        let actual1: string = rationalNumber.toString();
        let expected1: string = '0/1';
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_THREE_2600
     * @tc.name rationalNumberParseRationalNumberThreeTest026
     * @tc.desc Verify valueOf() of MIN long, -1 returns -9223372036854776000 MIN kept +2^63 unrepresentable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberParseRationalNumberThreeTest026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rationalNumber = util.RationalNumber.parseRationalNumber(-9223372036854775807 - 1, -1);
        let actual1: number = rationalNumber.valueOf();
        let expected1: number = -9.223372036854776e18;
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_THREE_2700
     * @tc.name rationalNumberParseRationalNumberThreeTest027
     * @tc.desc Verify toString() of 3, MIN long returns '-3/-9223372036854775808' denominator keeps MIN sign not normalized
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberParseRationalNumberThreeTest027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rationalNumber = util.RationalNumber.parseRationalNumber(3, -9223372036854775807 - 1);
        let actual1: string = rationalNumber.toString();
        let expected1: string = '-3/-9223372036854775808';
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_THREE_2800
     * @tc.name rationalNumberParseRationalNumberThreeTest028
     * @tc.desc Verify toString() of -1, 1000000007 returns '-1/1000000007'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberParseRationalNumberThreeTest028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rationalNumber = util.RationalNumber.parseRationalNumber(-1, 1000000007);
        let actual1: string = rationalNumber.toString();
        let expected1: string = '-1/1000000007';
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_THREE_2900
     * @tc.name rationalNumberParseRationalNumberThreeTest029
     * @tc.desc Verify toString() of 1000000007, -1 returns '-1000000007/1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberParseRationalNumberThreeTest029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rationalNumber = util.RationalNumber.parseRationalNumber(1000000007, -1);
        let actual1: string = rationalNumber.toString();
        let expected1: string = '-1000000007/1';
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_PARSE_RATIONAL_NUMBER_THREE_3000
     * @tc.name rationalNumberParseRationalNumberThreeTest030
     * @tc.desc Verify RationalNumber.parseRationalNumber(-9223372036854775807 - 2, 1) instanceof RationalNumber returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberParseRationalNumberThreeTest030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rationalNumber = util.RationalNumber.parseRationalNumber(-9223372036854775807 - 2, 1);
        let actual1: boolean = rationalNumber instanceof util.RationalNumber;
        expect(actual1).assertTrue();
      },
    );
  });
}
