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

export default function rationalNumberCreateRationalFromString02Test(): void {
  describe('rationalNumberCreateRationalFromString02Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_TWO_0100
     * @tc.name rationalNumberCreateRationalFromStringTwoTest001
     * @tc.desc Verify RationalNumber.createRationalFromString('3/4') instanceof RationalNumber returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringTwoTest001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rationalNumber = util.RationalNumber.createRationalFromString('3/4');
        let actual1: boolean = rationalNumber instanceof util.RationalNumber;
        expect(actual1).assertTrue();
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_TWO_0200
     * @tc.name rationalNumberCreateRationalFromStringTwoTest002
     * @tc.desc Verify getNumerator() of 3/4 returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringTwoTest002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rationalNumber = util.RationalNumber.createRationalFromString('3/4');
        let actual1: number = rationalNumber.getNumerator();
        let expected1: int = 3;
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_TWO_0300
     * @tc.name rationalNumberCreateRationalFromStringTwoTest003
     * @tc.desc Verify getNumerator() of 4/8 returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringTwoTest003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rationalNumber = util.RationalNumber.createRationalFromString('4/8');
        let actual1: number = rationalNumber.getNumerator();
        let expected1: int = 1;
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_TWO_0400
     * @tc.name rationalNumberCreateRationalFromStringTwoTest004
     * @tc.desc Verify getNumerator() of 0/1 returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringTwoTest004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rationalNumber = util.RationalNumber.createRationalFromString('0/1');
        let actual1: number = rationalNumber.getNumerator();
        let expected1: int = 0;
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_TWO_0500
     * @tc.name rationalNumberCreateRationalFromStringTwoTest005
     * @tc.desc Verify getNumerator() of 1/0 returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringTwoTest005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rationalNumber = util.RationalNumber.createRationalFromString('1/0');
        let actual1: number = rationalNumber.getNumerator();
        let expected1: int = 1;
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_TWO_0600
     * @tc.name rationalNumberCreateRationalFromStringTwoTest006
     * @tc.desc Verify getNumerator() of -2/5 returns -2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringTwoTest006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rationalNumber = util.RationalNumber.createRationalFromString('-2/5');
        let actual1: number = rationalNumber.getNumerator();
        let expected1: int = -2;
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_TWO_0700
     * @tc.name rationalNumberCreateRationalFromStringTwoTest007
     * @tc.desc Verify getNumerator() of -2/-3 returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringTwoTest007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rationalNumber = util.RationalNumber.createRationalFromString('-2/-3');
        let actual1: number = rationalNumber.getNumerator();
        let expected1: int = 2;
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_TWO_0800
     * @tc.name rationalNumberCreateRationalFromStringTwoTest008
     * @tc.desc Verify getDenominator() of 4/8 returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringTwoTest008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rationalNumber = util.RationalNumber.createRationalFromString('4/8');
        let actual1: number = rationalNumber.getDenominator();
        let expected1: int = 2;
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_TWO_0900
     * @tc.name rationalNumberCreateRationalFromStringTwoTest009
     * @tc.desc Verify getDenominator() of 2/-5 returns 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringTwoTest009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rationalNumber = util.RationalNumber.createRationalFromString('2/-5');
        let actual1: number = rationalNumber.getDenominator();
        let expected1: int = 5;
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_TWO_1000
     * @tc.name rationalNumberCreateRationalFromStringTwoTest010
     * @tc.desc Verify getDenominator() of 5/25 returns 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringTwoTest010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rationalNumber = util.RationalNumber.createRationalFromString('5/25');
        let actual1: number = rationalNumber.getDenominator();
        let expected1: int = 5;
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_TWO_1100
     * @tc.name rationalNumberCreateRationalFromStringTwoTest011
     * @tc.desc Verify valueOf() of 1/2 returns 0.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringTwoTest011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rationalNumber = util.RationalNumber.createRationalFromString('1/2');
        let actual1: number = rationalNumber.valueOf();
        let expected1: number = 0.5;
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_TWO_1200
     * @tc.name rationalNumberCreateRationalFromStringTwoTest012
     * @tc.desc Verify RationalNumber.createRationalFromString('7/3').valueOf() returns 7.0 / 3.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringTwoTest012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rationalNumber = util.RationalNumber.createRationalFromString('7/3');
        let actual1: number = rationalNumber.valueOf();
        let expected1: number = 7.0 / 3.0;
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_TWO_1300
     * @tc.name rationalNumberCreateRationalFromStringTwoTest013
     * @tc.desc Verify valueOf() of 8/4 returns 2.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringTwoTest013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rationalNumber = util.RationalNumber.createRationalFromString('8/4');
        let actual1: number = rationalNumber.valueOf();
        let expected1: number = 2.0;
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_TWO_1400
     * @tc.name rationalNumberCreateRationalFromStringTwoTest014
     * @tc.desc Verify valueOf() of 0/1 returns 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringTwoTest014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rationalNumber = util.RationalNumber.createRationalFromString('0/1');
        let actual1: number = rationalNumber.valueOf();
        let expected1: number = 0.0;
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_TWO_1500
     * @tc.name rationalNumberCreateRationalFromStringTwoTest015
     * @tc.desc Verify isNaN(RationalNumber.createRationalFromString('0/0').valueOf()) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringTwoTest015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rationalNumber = util.RationalNumber.createRationalFromString('0/0');
        let actual1: boolean = isNaN(rationalNumber.valueOf());
        expect(actual1).assertTrue();
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_TWO_1600
     * @tc.name rationalNumberCreateRationalFromStringTwoTest016
     * @tc.desc Verify createRationalFromString('9223372036854775807/1') is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringTwoTest016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rationalNumber = util.RationalNumber.createRationalFromString('9223372036854775807/1');
        let v: double = rationalNumber.valueOf();
        let actual1: boolean = v > 9.0e18 && v < 9.4e18;
        expect(actual1).assertTrue();
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_TWO_1700
     * @tc.name rationalNumberCreateRationalFromStringTwoTest017
     * @tc.desc Verify RationalNumber.createRationalFromString('4/8').toString() returns '1/2'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringTwoTest017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rationalNumber = util.RationalNumber.createRationalFromString('4/8');
        let actual1: string = rationalNumber.toString();
        let expected1: string = '1/2';
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_TWO_1800
     * @tc.name rationalNumberCreateRationalFromStringTwoTest018
     * @tc.desc Verify RationalNumber.createRationalFromString('-2/-3').toString() returns '2/3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringTwoTest018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rationalNumber = util.RationalNumber.createRationalFromString('-2/-3');
        let actual1: string = rationalNumber.toString();
        let expected1: string = '2/3';
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_TWO_1900
     * @tc.name rationalNumberCreateRationalFromStringTwoTest019
     * @tc.desc Verify RationalNumber.createRationalFromString('9/6').toString() returns '3/2'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringTwoTest019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rationalNumber = util.RationalNumber.createRationalFromString('9/6');
        let actual1: string = rationalNumber.toString();
        let expected1: string = '3/2';
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_TWO_2000
     * @tc.name rationalNumberCreateRationalFromStringTwoTest020
     * @tc.desc Verify toString() of 9223372036854775807/1 returns '9223372036854775807/1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringTwoTest020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rationalNumber = util.RationalNumber.createRationalFromString('9223372036854775807/1');
        let actual1: string = rationalNumber.toString();
        let expected1: string = '9223372036854775807/1';
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_TWO_2100
     * @tc.name rationalNumberCreateRationalFromStringTwoTest021
     * @tc.desc Verify RationalNumber.createRationalFromString('-9223372036854775808/1').toString() returns '-9223372036854775808/1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringTwoTest021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rationalNumber = util.RationalNumber.createRationalFromString('-9223372036854775808/1');
        let actual1: string = rationalNumber.toString();
        let expected1: string = '-9223372036854775808/1';
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_TWO_2200
     * @tc.name rationalNumberCreateRationalFromStringTwoTest022
     * @tc.desc Verify RationalNumber.createRationalFromString('0/-5').isZero() returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringTwoTest022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rationalNumber = util.RationalNumber.createRationalFromString('0/-5');
        let actual1: boolean = rationalNumber.isZero();
        expect(actual1).assertTrue();
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_TWO_2300
     * @tc.name rationalNumberCreateRationalFromStringTwoTest023
     * @tc.desc Verify isNaN() is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringTwoTest023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rationalNumber = util.RationalNumber.createRationalFromString('1/0');
        let actual1: boolean = rationalNumber.isNaN();
        expect(actual1).assertFalse();
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_TWO_2400
     * @tc.name rationalNumberCreateRationalFromStringTwoTest024
     * @tc.desc Verify RationalNumber.createRationalFromString('0/1').isNaN() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringTwoTest024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rationalNumber = util.RationalNumber.createRationalFromString('0/1');
        let actual1: boolean = rationalNumber.isNaN();
        expect(actual1).assertFalse();
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_TWO_2500
     * @tc.name rationalNumberCreateRationalFromStringTwoTest025
     * @tc.desc Verify '1/2' '2/4' equals true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringTwoTest025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let r1 = util.RationalNumber.createRationalFromString('1/2');
        let r2 = util.RationalNumber.createRationalFromString('2/4');
        let actual1: boolean = r1.equals(r2);
        expect(actual1).assertTrue();
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_TWO_2600
     * @tc.name rationalNumberCreateRationalFromStringTwoTest026
     * @tc.desc Verify '1/2' '1/3' equals false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringTwoTest026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let r1 = util.RationalNumber.createRationalFromString('1/2');
        let r2 = util.RationalNumber.createRationalFromString('1/3');
        let actual1: boolean = r1.equals(r2);
        expect(actual1).assertFalse();
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_TWO_2700
     * @tc.name rationalNumberCreateRationalFromStringTwoTest027
     * @tc.desc Verify '2/-5' '-2/5' -2/5 equals true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringTwoTest027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let r1 = util.RationalNumber.createRationalFromString('2/-5');
        let r2 = util.RationalNumber.createRationalFromString('-2/5');
        let actual1: boolean = r1.equals(r2);
        expect(actual1).assertTrue();
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_TWO_2800
     * @tc.name rationalNumberCreateRationalFromStringTwoTest028
     * @tc.desc Verify '1/0' '2/0' equals true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringTwoTest028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let r1 = util.RationalNumber.createRationalFromString('1/0');
        let r2 = util.RationalNumber.createRationalFromString('2/0');
        let actual1: boolean = r1.equals(r2);
        expect(actual1).assertTrue();
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_TWO_2900
     * @tc.name rationalNumberCreateRationalFromStringTwoTest029
     * @tc.desc Verify '-1/0' '1/0' equals false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringTwoTest029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let r1 = util.RationalNumber.createRationalFromString('-1/0');
        let r2 = util.RationalNumber.createRationalFromString('1/0');
        let actual1: boolean = r1.equals(r2);
        expect(actual1).assertFalse();
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_TWO_3000
     * @tc.name rationalNumberCreateRationalFromStringTwoTest030
     * @tc.desc Verify '0/0' '0/0' NaN equals true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringTwoTest030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let r1 = util.RationalNumber.createRationalFromString('0/0');
        let r2 = util.RationalNumber.createRationalFromString('0/0');
        let actual1: boolean = r1.equals(r2);
        expect(actual1).assertTrue();
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_TWO_3100
     * @tc.name rationalNumberCreateRationalFromStringTwoTest031
     * @tc.desc Verify '0/5' '0/1' 0 equals true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringTwoTest031',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let r1 = util.RationalNumber.createRationalFromString('0/5');
        let r2 = util.RationalNumber.createRationalFromString('0/1');
        let actual1: boolean = r1.equals(r2);
        expect(actual1).assertTrue();
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_TWO_3200
     * @tc.name rationalNumberCreateRationalFromStringTwoTest032
     * @tc.desc Verify equals() is symmetric for 5/6 and 10/12 created via createRationalFromString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringTwoTest032',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let r1 = util.RationalNumber.createRationalFromString('5/6');
        let r2 = util.RationalNumber.createRationalFromString('10/12');
        let actual1: boolean = r1.equals(r2);
        let expected1: boolean = r2.equals(r1);
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_TWO_3300
     * @tc.name rationalNumberCreateRationalFromStringTwoTest033
     * @tc.desc Verify RationalNumber.createRationalFromString('1/2').compare(RationalNumber.createRationalFromString('2/4')) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringTwoTest033',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let r1 = util.RationalNumber.createRationalFromString('1/2');
        let r2 = util.RationalNumber.createRationalFromString('2/4');
        let actual1: number = r1.compare(r2);
        let expected1: int = 0;
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_TWO_3400
     * @tc.name rationalNumberCreateRationalFromStringTwoTest034
     * @tc.desc Verify RationalNumber.createRationalFromString('1/2').compare(RationalNumber.createRationalFromString('-1/2')) returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringTwoTest034',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let r1 = util.RationalNumber.createRationalFromString('1/2');
        let r2 = util.RationalNumber.createRationalFromString('-1/2');
        let actual1: number = r1.compare(r2);
        let expected1: int = 1;
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_TWO_3500
     * @tc.name rationalNumberCreateRationalFromStringTwoTest035
     * @tc.desc Verify RationalNumber.createRationalFromString('1/0').compare(RationalNumber.createRationalFromString('-1/0')) returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringTwoTest035',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let r1 = util.RationalNumber.createRationalFromString('1/0');
        let r2 = util.RationalNumber.createRationalFromString('-1/0');
        let actual1: number = r1.compare(r2);
        let expected1: int = 1;
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_TWO_3600
     * @tc.name rationalNumberCreateRationalFromStringTwoTest036
     * @tc.desc Verify RationalNumber.createRationalFromString('1/2').compare(RationalNumber.createRationalFromString('1/0')) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringTwoTest036',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let r1 = util.RationalNumber.createRationalFromString('1/2');
        let r2 = util.RationalNumber.createRationalFromString('1/0');
        let actual1: number = r1.compare(r2);
        let expected1: int = -1;
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_TWO_3700
     * @tc.name rationalNumberCreateRationalFromStringTwoTest037
     * @tc.desc Verify RationalNumber.createRationalFromString('1/2').compare(RationalNumber.createRationalFromString('1/0')) returns -RationalNumber.createRationalFromString('1/0').compare(RationalNumber.createRationalFromString('1/2'))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringTwoTest037',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let r1 = util.RationalNumber.createRationalFromString('1/2');
        let r2 = util.RationalNumber.createRationalFromString('1/0');
        let actual1: number = r1.compare(r2);
        let expected1: number = -r2.compare(r1);
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_TWO_3800
     * @tc.name rationalNumberCreateRationalFromStringTwoTest038
     * @tc.desc Verify isFinite() of '1/0' and '2/0' both return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringTwoTest038',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let r1 = util.RationalNumber.createRationalFromString('1/0');
        let r2 = util.RationalNumber.createRationalFromString('2/0');
        let actual1: boolean = r1.isFinite();
        let expected1: boolean = false;
        expect(actual1).assertEqual(expected1);
        let actual2: boolean = r2.isFinite();
        let expected2: boolean = false;
        expect(actual2).assertEqual(expected2);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_TWO_3900
     * @tc.name rationalNumberCreateRationalFromStringTwoTest039
     * @tc.desc Verify isNaN() of valueOf() for '0/0' and '0/0' both return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringTwoTest039',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let r1 = util.RationalNumber.createRationalFromString('0/0');
        let r2 = util.RationalNumber.createRationalFromString('0/0');
        let actual1: boolean = isNaN(r1.valueOf());
        let expected1: boolean = true;
        expect(actual1).assertEqual(expected1);
        let actual2: boolean = isNaN(r2.valueOf());
        let expected2: boolean = true;
        expect(actual2).assertEqual(expected2);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_TWO_4000
     * @tc.name rationalNumberCreateRationalFromStringTwoTest040
     * @tc.desc Verify createRationalFromString('1/2') is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringTwoTest040',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let r1 = util.RationalNumber.createRationalFromString('1/2');
        let r2 = util.RationalNumber.createRationalFromString('1/2');
        let actual1: boolean = r1 === r2;
        expect(actual1).assertFalse();
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_TWO_4100
     * @tc.name rationalNumberCreateRationalFromStringTwoTest041
     * @tc.desc Verify loop createRationalFromString('' + (i + 1) is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringTwoTest041',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let ok: boolean = true;
        for (let i = 0; i < 16; i++) {
          let rationalNumber = util.RationalNumber.createRationalFromString('' + (i + 1) + '/' + (i + 2));
          if (rationalNumber.getNumerator() !== i + 1 || rationalNumber.getDenominator() !== i + 2) {
            ok = false;
          }
        }
        expect(ok).assertTrue();
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_TWO_4200
     * @tc.name rationalNumberCreateRationalFromStringTwoTest042
     * @tc.desc Verify createRationalFromString('1/2') returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringTwoTest042',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let actual1: number = util.RationalNumber.createRationalFromString('1/2').getNumerator();
        let expected1: int = 1;
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_TWO_4300
     * @tc.name rationalNumberCreateRationalFromStringTwoTest043
     * @tc.desc Verify valueOf() of createRationalFromString('1/2') returns 0.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringTwoTest043',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let actual1: number = util.RationalNumber.createRationalFromString('1/2').valueOf();
        let expected1: number = 0.5;
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_TWO_4400
     * @tc.name rationalNumberCreateRationalFromStringTwoTest044
     * @tc.desc Verify toString() of createRationalFromString('2/4') returns '1/2'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringTwoTest044',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let actual1: string = util.RationalNumber.createRationalFromString('2/4').toString();
        let expected1: string = '1/2';
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_TWO_4500
     * @tc.name rationalNumberCreateRationalFromStringTwoTest045
     * @tc.desc Verify isFinite() is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringTwoTest045',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let actual1: boolean = util.RationalNumber.createRationalFromString('1/0').isFinite();
        expect(actual1).assertFalse();
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_TWO_4600
     * @tc.name rationalNumberCreateRationalFromStringTwoTest046
     * @tc.desc Verify RationalNumber.createRationalFromString('5/6').getNumerator() returns 5, and RationalNumber.createRationalFromString('5/6').getDenominator() returns 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringTwoTest046',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rationalNumber = util.RationalNumber.createRationalFromString('5/6');
        let d: number = rationalNumber.getDenominator();
        let actual1: number = rationalNumber.getNumerator();
        let expected1: int = 5;
        expect(actual1).assertEqual(expected1);
        expect(d).assertEqual(6);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_TWO_4700
     * @tc.name rationalNumberCreateRationalFromStringTwoTest047
     * @tc.desc Verify createRationalFromString('1/0') returns Double.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringTwoTest047',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rationalNumber = util.RationalNumber.createRationalFromString('1/0');
        let f: boolean = rationalNumber.isFinite();
        let v: double = rationalNumber.valueOf();
        expect(v).assertEqual(Double.POSITIVE_INFINITY);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_TWO_4800
     * @tc.name rationalNumberCreateRationalFromStringTwoTest048
     * @tc.desc Verify RationalNumber.createRationalFromString('5/6').toString() returns RationalNumber.parseRationalNumber(5, 6).toString()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringTwoTest048',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let r1 = util.RationalNumber.createRationalFromString('5/6');
        let r2 = util.RationalNumber.parseRationalNumber(5, 6);
        let actual1: string = r1.toString();
        let expected1: string = r2.toString();
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_TWO_4900
     * @tc.name rationalNumberCreateRationalFromStringTwoTest049
     * @tc.desc Verify RationalNumber.createRationalFromString('7/8').valueOf() returns RationalNumber.parseRationalNumber(7, 8).valueOf()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringTwoTest049',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let r1 = util.RationalNumber.createRationalFromString('7/8');
        let r2 = util.RationalNumber.parseRationalNumber(7, 8);
        let actual1: number = r1.valueOf();
        let expected1: number = r2.valueOf();
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_TWO_5000
     * @tc.name rationalNumberCreateRationalFromStringTwoTest050
     * @tc.desc Verify RationalNumber.createRationalFromString('9/6').getNumerator() returns RationalNumber.parseRationalNumber(9, 6).getNumerator()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringTwoTest050',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let r1 = util.RationalNumber.createRationalFromString('9/6');
        let r2 = util.RationalNumber.parseRationalNumber(9, 6);
        let actual1: number = r1.getNumerator();
        let expected1: number = r2.getNumerator();
        expect(actual1).assertEqual(expected1);
      },
    );
  });
}
