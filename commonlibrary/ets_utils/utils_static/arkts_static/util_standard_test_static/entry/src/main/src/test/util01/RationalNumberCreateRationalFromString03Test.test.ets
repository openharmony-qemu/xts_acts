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

export default function rationalNumberCreateRationalFromString03Test(): void {
  describe('rationalNumberCreateRationalFromString03Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_THREE_0100
     * @tc.name rationalNumberCreateRationalFromStringThreeTest001
     * @tc.desc Verify RationalNumber.createRationalFromString('15/25').getNumerator() returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringThreeTest001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rational = util.RationalNumber.createRationalFromString('15/25');
        let actual1: number = rational.getNumerator();
        let expected1: int = 3;
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_THREE_0200
     * @tc.name rationalNumberCreateRationalFromStringThreeTest002
     * @tc.desc Verify RationalNumber.createRationalFromString('2147483647/1').getNumerator() returns 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringThreeTest002',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rational = util.RationalNumber.createRationalFromString('2147483647/1');
        let actual1: number = rational.getNumerator();
        let expected1: int = 2147483647;
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_THREE_0300
     * @tc.name rationalNumberCreateRationalFromStringThreeTest003
     * @tc.desc Verify RationalNumber.createRationalFromString('-2147483648/1').getNumerator() returns -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringThreeTest003',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rational = util.RationalNumber.createRationalFromString('-2147483648/1');
        let actual1: number = rational.getNumerator();
        let expected1: int = -2147483648;
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_THREE_0400
     * @tc.name rationalNumberCreateRationalFromStringThreeTest004
     * @tc.desc Verify RationalNumber.createRationalFromString('2147483648/1') is not null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringThreeTest004',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rational = util.RationalNumber.createRationalFromString('2147483648/1');
        expect(rational instanceof util.RationalNumber).assertTrue();
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_THREE_0500
     * @tc.name rationalNumberCreateRationalFromStringThreeTest005
     * @tc.desc Verify RationalNumber.createRationalFromString('4294967295/1').toString() returns '4294967295/1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringThreeTest005',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rational = util.RationalNumber.createRationalFromString('4294967295/1');
        let actual1: string = rational.toString();
        let expected1: string = '4294967295/1';
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_THREE_0600
     * @tc.name rationalNumberCreateRationalFromStringThreeTest006
     * @tc.desc Verify createRationalFromString('4294967296/1') returns non-null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringThreeTest006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rational = util.RationalNumber.createRationalFromString('4294967296/1');
        expect(rational instanceof util.RationalNumber).assertTrue();
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_THREE_0700
     * @tc.name rationalNumberCreateRationalFromStringThreeTest007
     * @tc.desc Verify createRationalFromString(' ') throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringThreeTest007',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        try {
          util.RationalNumber.createRationalFromString(' ');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
        }
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_THREE_0800
     * @tc.name rationalNumberCreateRationalFromStringThreeTest008
     * @tc.desc Verify createRationalFromString('1/') throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringThreeTest008',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        try {
          util.RationalNumber.createRationalFromString('1/');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
        }
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_THREE_0900
     * @tc.name rationalNumberCreateRationalFromStringThreeTest009
     * @tc.desc Verify createRationalFromString('null/1') throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringThreeTest009',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        try {
          util.RationalNumber.createRationalFromString('null/1');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
        }
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_THREE_1000
     * @tc.name rationalNumberCreateRationalFromStringThreeTest010
     * @tc.desc Verify createRationalFromString('true/1') throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringThreeTest010',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        try {
          util.RationalNumber.createRationalFromString('true/1');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
        }
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_THREE_1100
     * @tc.name rationalNumberCreateRationalFromStringThreeTest011
     * @tc.desc Verify createRationalFromString('--1/2') throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringThreeTest011',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        try {
          util.RationalNumber.createRationalFromString('--1/2');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
        }
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_THREE_1200
     * @tc.name rationalNumberCreateRationalFromStringThreeTest012
     * @tc.desc Verify RationalNumber.createRationalFromString('-0/1').getNumerator() returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringThreeTest012',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rational = util.RationalNumber.createRationalFromString('-0/1');
        let actual1: number = rational.getNumerator();
        let expected1: int = 0;
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_THREE_1300
     * @tc.name rationalNumberCreateRationalFromStringThreeTest013
     * @tc.desc Verify createRationalFromString('-/1') throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringThreeTest013',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        try {
          util.RationalNumber.createRationalFromString('-/1');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
        }
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_THREE_1400
     * @tc.name rationalNumberCreateRationalFromStringThreeTest014
     * @tc.desc Verify createRationalFromString('+0/1') toString returns '0/1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringThreeTest014',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rational = util.RationalNumber.createRationalFromString('+0/1');
        let actual1: string = rational.toString();
        let expected1: string = '0/1';
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_THREE_1500
     * @tc.name rationalNumberCreateRationalFromStringThreeTest015
     * @tc.desc Verify createRationalFromString('1/-0') returns RationalNumber
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringThreeTest015',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rational = util.RationalNumber.createRationalFromString('1/-0');
        expect(rational instanceof util.RationalNumber).assertTrue();
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_THREE_1600
     * @tc.name rationalNumberCreateRationalFromStringThreeTest016
     * @tc.desc Verify createRationalFromString('-0/0') returns RationalNumber
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringThreeTest016',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rational = util.RationalNumber.createRationalFromString('-0/0');
        expect(rational instanceof util.RationalNumber).assertTrue();
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_THREE_1700
     * @tc.name rationalNumberCreateRationalFromStringThreeTest017
     * @tc.desc Verify createRationalFromString('0b101/2') toString returns '5/2'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringThreeTest017',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rational = util.RationalNumber.createRationalFromString('0b101/2');
        let actual1: string = rational.toString();
        let expected1: string = '5/2';
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_THREE_1800
     * @tc.name rationalNumberCreateRationalFromStringThreeTest018
     * @tc.desc Verify createRationalFromString('0o17/2') toString returns '15/2'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringThreeTest018',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rational = util.RationalNumber.createRationalFromString('0o17/2');
        let actual1: string = rational.toString();
        let expected1: string = '15/2';
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_THREE_1900
     * @tc.name rationalNumberCreateRationalFromStringThreeTest019
     * @tc.desc Verify createRationalFromString('0x10') throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringThreeTest019',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        try {
          util.RationalNumber.createRationalFromString('0x10');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
        }
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_THREE_2000
     * @tc.name rationalNumberCreateRationalFromStringThreeTest020
     * @tc.desc Verify createRationalFromString('0X1F/2') toString returns '31/2'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringThreeTest020',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rational = util.RationalNumber.createRationalFromString('0X1F/2');
        let actual1: string = rational.toString();
        let expected1: string = '31/2';
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_THREE_2100
     * @tc.name rationalNumberCreateRationalFromStringThreeTest021
     * @tc.desc Verify createRationalFromString('1E3') throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringThreeTest021',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        try {
          util.RationalNumber.createRationalFromString('1E3');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
        }
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_THREE_2200
     * @tc.name rationalNumberCreateRationalFromStringThreeTest022
     * @tc.desc Verify createRationalFromString('3/4.') returns RationalNumber
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringThreeTest022',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rational = util.RationalNumber.createRationalFromString('3/4.');
        expect(rational instanceof util.RationalNumber).assertTrue();
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_THREE_2300
     * @tc.name rationalNumberCreateRationalFromStringThreeTest023
     * @tc.desc Verify createRationalFromString('.3/1') returns RationalNumber
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringThreeTest023',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rational = util.RationalNumber.createRationalFromString('.3/1');
        expect(rational instanceof util.RationalNumber).assertTrue();
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_THREE_2400
     * @tc.name rationalNumberCreateRationalFromStringThreeTest024
     * @tc.desc Verify createRationalFromString('1/2.5') returns RationalNumber
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringThreeTest024',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rational = util.RationalNumber.createRationalFromString('1/2.5');
        expect(rational instanceof util.RationalNumber).assertTrue();
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_THREE_2500
     * @tc.name rationalNumberCreateRationalFromStringThreeTest025
     * @tc.desc Verify createRationalFromString('\t3/4') toString returns '3/4'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringThreeTest025',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rational = util.RationalNumber.createRationalFromString('\t3/4');
        let actual1: string = rational.toString();
        let expected1: string = '3/4';
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_THREE_2600
     * @tc.name rationalNumberCreateRationalFromStringThreeTest026
     * @tc.desc Verify createRationalFromString('\u0000/1') throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringThreeTest026',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        try {
          util.RationalNumber.createRationalFromString('\u0000/1');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
        }
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_THREE_2700
     * @tc.name rationalNumberCreateRationalFromStringThreeTest027
     * @tc.desc Verify createRationalFromString('3/4\u0000') toString returns 'Infinity'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringThreeTest027',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rational = util.RationalNumber.createRationalFromString('3/4\u0000');
        let actual1: string = rational.toString();
        let expected1: string = 'Infinity';
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_THREE_2800
     * @tc.name rationalNumberCreateRationalFromStringThreeTest028
     * @tc.desc Verify createRationalFromString('//1') throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringThreeTest028',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        try {
          util.RationalNumber.createRationalFromString('//1');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
        }
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_THREE_2900
     * @tc.name rationalNumberCreateRationalFromStringThreeTest029
     * @tc.desc Verify createRationalFromString('1:2') returns RationalNumber
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringThreeTest029',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rational = util.RationalNumber.createRationalFromString('1:2');
        expect(rational instanceof util.RationalNumber).assertTrue();
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_THREE_3000
     * @tc.name rationalNumberCreateRationalFromStringThreeTest030
     * @tc.desc Verify createRationalFromString('9223372036854775807/-9223372036854775808') returns RationalNumber
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringThreeTest030',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rational = util.RationalNumber.createRationalFromString('9223372036854775807/-9223372036854775808');
        expect(rational instanceof util.RationalNumber).assertTrue();
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_THREE_3100
     * @tc.name rationalNumberCreateRationalFromStringThreeTest031
     * @tc.desc Verify RationalNumber.createRationalFromString('1/0xFFFFFFFFFFFFFFFF') returns RationalNumber
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringThreeTest031',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rational = util.RationalNumber.createRationalFromString('1/0xFFFFFFFFFFFFFFFF');
        expect(rational instanceof util.RationalNumber).assertTrue();
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_THREE_3200
     * @tc.name rationalNumberCreateRationalFromStringThreeTest032
     * @tc.desc Verify RationalNumber.createRationalFromString('25/15').toString() returns '5/3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringThreeTest032',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rational = util.RationalNumber.createRationalFromString('25/15');
        let actual1: string = rational.toString();
        let expected1: string = '5/3';
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_THREE_3300
     * @tc.name rationalNumberCreateRationalFromStringThreeTest033
     * @tc.desc Verify RationalNumber.createRationalFromString('-9/0').isFinite() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringThreeTest033',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rational = util.RationalNumber.createRationalFromString('-9/0');
        let actual1: boolean = rational.isFinite();
        expect(actual1).assertFalse();
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_THREE_3400
     * @tc.name rationalNumberCreateRationalFromStringThreeTest034
     * @tc.desc Verify RationalNumber.createRationalFromString('-7/7').toString() returns '-1/1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringThreeTest034',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        let rational = util.RationalNumber.createRationalFromString('-7/7');
        let actual1: string = rational.toString();
        let expected1: string = '-1/1';
        expect(actual1).assertEqual(expected1);
      },
    );

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_CREATE_RATIONAL_FROM_STRING_THREE_3500
     * @tc.name rationalNumberCreateRationalFromStringThreeTest035
     * @tc.desc Verify createRationalFromString('U+00B1 1/2') throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it(
      'rationalNumberCreateRationalFromStringThreeTest035',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      (): void => {
        try {
          util.RationalNumber.createRationalFromString('±1/2');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
        }
      },
    );
  });
}
