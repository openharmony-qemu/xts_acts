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

export default function rationalNumberCreateRationalFromString01Test(): void {
  describe('rationalNumberCreateRationalFromString01Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_ONE_0100
     * @tc.name rationalNumberCreateRationalFromStringOneTest001
     * @tc.desc Verify getNumerator() of 1/4 returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringOneTest001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rational = util.RationalNumber.createRationalFromString('1/4');
        let actual1: number = rational.getNumerator();
        let expected1: int = 1;
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_ONE_0200
     * @tc.name rationalNumberCreateRationalFromStringOneTest002
     * @tc.desc Verify RationalNumber.createRationalFromString('3/4').getNumerator() returns 3, and RationalNumber.createRationalFromString('3/4').getDenominator() returns 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringOneTest002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rational = util.RationalNumber.createRationalFromString('3/4');
        let actual1: number = rational.getNumerator();
        let expected1: int = 3;
        expect(actual1).assertEqual(expected1);
        let actual2: number = rational.getDenominator();
        let expected2: int = 4;
        expect(actual2).assertEqual(expected2);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_ONE_0300
     * @tc.name rationalNumberCreateRationalFromStringOneTest003
     * @tc.desc Verify toString() of 5/8 returns '5/8'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringOneTest003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rational = util.RationalNumber.createRationalFromString('5/8');
        let actual1: string = rational.toString();
        let expected1: string = '5/8';
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_ONE_0400
     * @tc.name rationalNumberCreateRationalFromStringOneTest004
     * @tc.desc Verify getNumerator() of 2/4 returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringOneTest004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rational = util.RationalNumber.createRationalFromString('2/4');
        let actual1: number = rational.getNumerator();
        let expected1: int = 1;
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_ONE_0500
     * @tc.name rationalNumberCreateRationalFromStringOneTest005
     * @tc.desc Verify toString() of 6/8 returns '3/4'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringOneTest005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rational = util.RationalNumber.createRationalFromString('6/8');
        let actual1: string = rational.toString();
        let expected1: string = '3/4';
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_ONE_0600
     * @tc.name rationalNumberCreateRationalFromStringOneTest006
     * @tc.desc Verify getNumerator() of -4/6 returns -2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringOneTest006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rational = util.RationalNumber.createRationalFromString('-4/6');
        let actual1: number = rational.getNumerator();
        let expected1: int = -2;
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_ONE_0700
     * @tc.name rationalNumberCreateRationalFromStringOneTest007
     * @tc.desc Verify getNumerator() of 999999999/333333333 returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringOneTest007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rational = util.RationalNumber.createRationalFromString('999999999/333333333');
        let actual1: number = rational.getNumerator();
        let expected1: int = 3;
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_ONE_0800
     * @tc.name rationalNumberCreateRationalFromStringOneTest008
     * @tc.desc Verify toString() of 1/1 returns '1/1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringOneTest008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rational = util.RationalNumber.createRationalFromString('1/1');
        let actual1: string = rational.toString();
        let expected1: string = '1/1';
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_ONE_0900
     * @tc.name rationalNumberCreateRationalFromStringOneTest009
     * @tc.desc Verify toString() of 4/2 returns '2/1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringOneTest009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rational = util.RationalNumber.createRationalFromString('4/2');
        let actual1: string = rational.toString();
        let expected1: string = '2/1';
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_ONE_1000
     * @tc.name rationalNumberCreateRationalFromStringOneTest010
     * @tc.desc Verify getDenominator() of 0/5 returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringOneTest010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rational = util.RationalNumber.createRationalFromString('0/5');
        let actual1: number = rational.getDenominator();
        let expected1: int = 1;
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_ONE_1100
     * @tc.name rationalNumberCreateRationalFromStringOneTest011
     * @tc.desc Verify RationalNumber.createRationalFromString('5/0').getDenominator() returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringOneTest011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rational = util.RationalNumber.createRationalFromString('5/0');
        let actual1: number = rational.getDenominator();
        let expected1: int = 0;
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_ONE_1200
     * @tc.name rationalNumberCreateRationalFromStringOneTest012
     * @tc.desc Verify RationalNumber.createRationalFromString('-2/5').getNumerator() returns -2, and RationalNumber.createRationalFromString('-2/5').getDenominator() returns 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringOneTest012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rational = util.RationalNumber.createRationalFromString('-2/5');
        let actual1: number = rational.getNumerator();
        let expected1: int = -2;
        expect(actual1).assertEqual(expected1);
        let actual2: number = rational.getDenominator();
        let expected2: int = 5;
        expect(actual2).assertEqual(expected2);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_ONE_1300
     * @tc.name rationalNumberCreateRationalFromStringOneTest013
     * @tc.desc Verify createRationalFromString('-3/-4') toString returns '3/4'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringOneTest013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rational = util.RationalNumber.createRationalFromString('-3/-4');
        let actual1: string = rational.toString();
        let expected1: string = '3/4';
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_ONE_1400
     * @tc.name rationalNumberCreateRationalFromStringOneTest014
     * @tc.desc Verify createRationalFromString('3/-4') toString returns '-3/4'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringOneTest014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rational = util.RationalNumber.createRationalFromString('3/-4');
        let actual1: string = rational.toString();
        let expected1: string = '-3/4';
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_ONE_1500
     * @tc.name rationalNumberCreateRationalFromStringOneTest015
     * @tc.desc Verify toString() of -1/1 returns '-1/1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringOneTest015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rational = util.RationalNumber.createRationalFromString('-1/1');
        let actual1: string = rational.toString();
        let expected1: string = '-1/1';
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_ONE_1600
     * @tc.name rationalNumberCreateRationalFromStringOneTest016
     * @tc.desc Verify getNumerator() of 9223372036854775807/1 returns 9223372036854775807
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringOneTest016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rational = util.RationalNumber.createRationalFromString('9223372036854775807/1');
        let actual1: number = rational.getNumerator();
        let expected1: number = 9223372036854775807;
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_ONE_1700
     * @tc.name rationalNumberCreateRationalFromStringOneTest017
     * @tc.desc Verify getNumerator() of -9223372036854775808/1 returns -9223372036854775808
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringOneTest017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rational = util.RationalNumber.createRationalFromString('-9223372036854775808/1');
        let actual1: number = rational.getNumerator();
        let expected1: number = -9223372036854775808;
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_ONE_1800
     * @tc.name rationalNumberCreateRationalFromStringOneTest018
     * @tc.desc Verify getDenominator() of 1/9223372036854775807 returns 9223372036854775807
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringOneTest018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rational = util.RationalNumber.createRationalFromString('1/9223372036854775807');
        let actual1: number = rational.getDenominator();
        let expected1: number = 9223372036854775807;
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_ONE_1900
     * @tc.name rationalNumberCreateRationalFromStringOneTest019
     * @tc.desc Verify toString() of 03/04 returns '3/4'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringOneTest019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rational = util.RationalNumber.createRationalFromString('03/04');
        let actual1: string = rational.toString();
        let expected1: string = '3/4';
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_ONE_2000
     * @tc.name rationalNumberCreateRationalFromStringOneTest020
     * @tc.desc Verify createRationalFromString('1/3') returns r2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringOneTest020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let r1 = util.RationalNumber.createRationalFromString('1/3');
        let r2 = util.RationalNumber.createRationalFromString('1/3');
        expect(r1).not().assertEqual(r2);
      },
    );
  });
}
