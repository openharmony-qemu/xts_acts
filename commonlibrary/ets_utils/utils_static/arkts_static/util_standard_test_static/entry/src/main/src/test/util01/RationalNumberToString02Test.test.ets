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

export default function rationalNumberToString02Test(): void {
  describe('rationalNumberToString02Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_TO_STRING_TWO_0100
     * @tc.name rationalNumberToStringTwoTest001
     * @tc.desc Verify typeof RationalNumber.createRationalFromString('1/2').toString() returns 'string'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberToStringTwoTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalTypeFromString = util.RationalNumber.createRationalFromString('1/2');
      let actual1: string = typeof rationalTypeFromString.toString();
      let expected1: string = 'string';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_TO_STRING_TWO_0200
     * @tc.name rationalNumberToStringTwoTest002
     * @tc.desc Verify RationalNumber.parseRationalNumber(-6, -9).toString() returns '2/3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberToStringTwoTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalValueNegNeg = util.RationalNumber.parseRationalNumber(-6, -9);
      let actual1: string = rationalValueNegNeg.toString();
      let expected1: string = '2/3';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_TO_STRING_TWO_0300
     * @tc.name rationalNumberToStringTwoTest003
     * @tc.desc Verify RationalNumber.parseRationalNumber(9, -6).toString() returns '-3/2'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberToStringTwoTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalValuePosNegImproper = util.RationalNumber.parseRationalNumber(9, -6);
      let actual1: string = rationalValuePosNegImproper.toString();
      let expected1: string = '-3/2';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_TO_STRING_TWO_0400
     * @tc.name rationalNumberToStringTwoTest004
     * @tc.desc Verify RationalNumber.parseRationalNumber(15, 25).toString() returns '3/5'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberToStringTwoTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalValueGcdFive = util.RationalNumber.parseRationalNumber(15, 25);
      let actual1: string = rationalValueGcdFive.toString();
      let expected1: string = '3/5';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_TO_STRING_TWO_0500
     * @tc.name rationalNumberToStringTwoTest005
     * @tc.desc Verify RationalNumber.parseRationalNumber(26, 14).toString() returns '13/7'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberToStringTwoTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalValueTwentySixFourteenths = util.RationalNumber.parseRationalNumber(26, 14);
      let actual1: string = rationalValueTwentySixFourteenths.toString();
      let expected1: string = '13/7';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_TO_STRING_TWO_0600
     * @tc.name rationalNumberToStringTwoTest006
     * @tc.desc Verify RationalNumber.parseRationalNumber(97, 101).toString() returns '97/101'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberToStringTwoTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalValueNinetySevenOverHundredOne = util.RationalNumber.parseRationalNumber(97, 101);
      let actual1: string = rationalValueNinetySevenOverHundredOne.toString();
      let expected1: string = '97/101';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_TO_STRING_TWO_0700
     * @tc.name rationalNumberToStringTwoTest007
     * @tc.desc Verify RationalNumber.parseRationalNumber(9007199254740992, 4503599627370496).toString() returns '2/1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberToStringTwoTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalValueLongPow = util.RationalNumber.parseRationalNumber(9007199254740992, 4503599627370496);
      let actual1: string = rationalValueLongPow.toString();
      let expected1: string = '2/1';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_TO_STRING_TWO_0800
     * @tc.name rationalNumberToStringTwoTest008
     * @tc.desc Verify RationalNumber.parseRationalNumber(9223372036854775807, 4611686018427387903).toString() returns '9223372036854775807/4611686018427387903'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberToStringTwoTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalValueLongCoprime = util.RationalNumber.parseRationalNumber(9223372036854775807, 4611686018427387903);
      let actual1: string = rationalValueLongCoprime.toString();
      let expected1: string = '9223372036854775807/4611686018427387903';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_TO_STRING_TWO_0900
     * @tc.name rationalNumberToStringTwoTest009
     * @tc.desc Verify RationalNumber.createRationalFromString('-1/0').toString() returns '-Infinity'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberToStringTwoTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalStrMinusInf = util.RationalNumber.createRationalFromString('-1/0');
      let actual1: string = rationalStrMinusInf.toString();
      let expected1: string = '-Infinity';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_TO_STRING_TWO_1000
     * @tc.name rationalNumberToStringTwoTest010
     * @tc.desc Verify RationalNumber.parseRationalNumber(48, 60).toString() returns '4/5'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberToStringTwoTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalValueGcdTwelve = util.RationalNumber.parseRationalNumber(48, 60);
      let actual1: string = rationalValueGcdTwelve.toString();
      let expected1: string = '4/5';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_TO_STRING_TWO_1100
     * @tc.name rationalNumberToStringTwoTest011
     * @tc.desc Verify RationalNumber.parseRationalNumber(63, 72).toString() returns '7/8'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberToStringTwoTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalValueGcdNine = util.RationalNumber.parseRationalNumber(63, 72);
      let actual1: string = rationalValueGcdNine.toString();
      let expected1: string = '7/8';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_TO_STRING_TWO_1200
     * @tc.name rationalNumberToStringTwoTest012
     * @tc.desc Verify RationalNumber.parseRationalNumber(33, 77).toString() returns '3/7'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberToStringTwoTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalValueGcdEleven = util.RationalNumber.parseRationalNumber(33, 77);
      let actual1: string = rationalValueGcdEleven.toString();
      let expected1: string = '3/7';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_TO_STRING_TWO_1300
     * @tc.name rationalNumberToStringTwoTest013
     * @tc.desc Verify RationalNumber.parseRationalNumber(110, 30).toString() returns '11/3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberToStringTwoTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalValueGcdTen = util.RationalNumber.parseRationalNumber(110, 30);
      let actual1: string = rationalValueGcdTen.toString();
      let expected1: string = '11/3';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_TO_STRING_TWO_1400
     * @tc.name rationalNumberToStringTwoTest014
     * @tc.desc Verify RationalNumber.parseRationalNumber(-15, 25).toString() returns '-3/5'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberToStringTwoTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalValueNegGcdFive = util.RationalNumber.parseRationalNumber(-15, 25);
      let actual1: string = rationalValueNegGcdFive.toString();
      let expected1: string = '-3/5';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_TO_STRING_TWO_1500
     * @tc.name rationalNumberToStringTwoTest015
     * @tc.desc Verify RationalNumber.createRationalFromString('0/3').toString() returns '0/1'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberToStringTwoTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalValueZeroStr = util.RationalNumber.createRationalFromString('0/3');
      let actual1: string = rationalValueZeroStr.toString();
      let expected1: string = '0/1';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_TO_STRING_TWO_1600
     * @tc.name rationalNumberToStringTwoTest016
     * @tc.desc Verify RationalNumber.createRationalFromString('6/4').toString() returns '3/2'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberToStringTwoTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalValueSimplifyStr = util.RationalNumber.createRationalFromString('6/4');
      let actual1: string = rationalValueSimplifyStr.toString();
      let expected1: string = '3/2';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_TO_STRING_TWO_1700
     * @tc.name rationalNumberToStringTwoTest017
     * @tc.desc Verify RationalNumber.parseRationalNumber(1, 2).toString().split('/').length returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberToStringTwoTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalStructHalf = util.RationalNumber.parseRationalNumber(1, 2);
      let actual1: int = rationalStructHalf.toString().split('/').length;
      let expected1: int = 2;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_TO_STRING_TWO_1800
     * @tc.name rationalNumberToStringTwoTest018
     * @tc.desc Verify RationalNumber.parseRationalNumber(6, 8).toString().split('/')[0] returns '3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberToStringTwoTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalStructSimplifiedNum = util.RationalNumber.parseRationalNumber(6, 8);
      let actual1: string = rationalStructSimplifiedNum.toString().split('/')[0];
      let expected1: string = '3';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_TO_STRING_TWO_1900
     * @tc.name rationalNumberToStringTwoTest019
     * @tc.desc Verify RationalNumber.parseRationalNumber(0, 1).toString().length returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberToStringTwoTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalLenZero = util.RationalNumber.parseRationalNumber(0, 1);
      let actual1: int = rationalLenZero.toString().length;
      let expected1: int = 3;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_TO_STRING_TWO_2000
     * @tc.name rationalNumberToStringTwoTest020
     * @tc.desc Verify RationalNumber.parseRationalNumber(9223372036854775807, 1).toString().length returns 21
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberToStringTwoTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalLenLongMax = util.RationalNumber.parseRationalNumber(9223372036854775807, 1);
      let actual1: int = rationalLenLongMax.toString().length;
      let expected1: int = 21;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_TO_STRING_TWO_2100
     * @tc.name rationalNumberToStringTwoTest021
     * @tc.desc Verify RationalNumber.parseRationalNumber(1, 0).getNumerator() returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberToStringTwoTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalStateInfNum = util.RationalNumber.parseRationalNumber(1, 0);
      rationalStateInfNum.toString();
      let actual1: number = rationalStateInfNum.getNumerator();
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_TO_STRING_TWO_2200
     * @tc.name rationalNumberToStringTwoTest022
     * @tc.desc Verify RationalNumber.parseRationalNumber(0, 0).getNumerator() returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberToStringTwoTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalStateNaNNum = util.RationalNumber.parseRationalNumber(0, 0);
      rationalStateNaNNum.toString();
      let actual1: number = rationalStateNaNNum.getNumerator();
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_TO_STRING_TWO_2300
     * @tc.name rationalNumberToStringTwoTest023
     * @tc.desc Verify RationalNumber.parseRationalNumber(1, 3).valueOf() returns RationalNumber.parseRationalNumber(1, 3).valueOf()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberToStringTwoTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalStateValueOf = util.RationalNumber.parseRationalNumber(1, 3);
      let beforeValueOf = rationalStateValueOf.valueOf();
      rationalStateValueOf.toString();
      let afterValueOf = rationalStateValueOf.valueOf();
      expect(afterValueOf).assertEqual(beforeValueOf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_TO_STRING_TWO_2400
     * @tc.name rationalNumberToStringTwoTest024
     * @tc.desc Verify RationalNumber.parseRationalNumber(1, 0).toString() returns RationalNumber.parseRationalNumber(1, 0).toString()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberToStringTwoTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalIdemInf = util.RationalNumber.parseRationalNumber(1, 0);
      let firstInf = rationalIdemInf.toString();
      let secondInf = rationalIdemInf.toString();
      expect(secondInf).assertEqual(firstInf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_TO_STRING_TWO_2500
     * @tc.name rationalNumberToStringTwoTest025
     * @tc.desc Verify toString() returns firstDefault
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberToStringTwoTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalIdemDefault = new util.RationalNumber();
      let firstDefault = rationalIdemDefault.toString();
      let secondDefault = rationalIdemDefault.toString();
      expect(secondDefault).assertEqual(firstDefault);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_TO_STRING_TWO_2600
     * @tc.name rationalNumberToStringTwoTest026
     * @tc.desc Verify RationalNumber.parseRationalNumber(3, 5).toString() returns RationalNumber.parseRationalNumber(3, 5).getNumerator() + '/' + RationalNumber.parseRationalNumber(3, 5).getDenominator()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberToStringTwoTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalConcatPos = util.RationalNumber.parseRationalNumber(3, 5);
      let actual1: string = rationalConcatPos.toString();
      let expected1: string = rationalConcatPos.getNumerator() + '/' + rationalConcatPos.getDenominator();
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_TO_STRING_TWO_2700
     * @tc.name rationalNumberToStringTwoTest027
     * @tc.desc Verify RationalNumber.parseRationalNumber(-7, 11).toString() returns RationalNumber.parseRationalNumber(-7, 11).getNumerator() + '/' + RationalNumber.parseRationalNumber(-7, 11).getDenominator()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberToStringTwoTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalConcatNeg = util.RationalNumber.parseRationalNumber(-7, 11);
      let actual1: string = rationalConcatNeg.toString();
      let expected1: string = rationalConcatNeg.getNumerator() + '/' + rationalConcatNeg.getDenominator();
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_TO_STRING_TWO_2800
     * @tc.name rationalNumberToStringTwoTest028
     * @tc.desc Verify RationalNumber.parseRationalNumber(1, 2).toString().startsWith('1') returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberToStringTwoTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalOneOverTwo = util.RationalNumber.parseRationalNumber(1, 2);
      let actual1: string = rationalOneOverTwo.toString();
      expect(actual1.startsWith('1')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_TO_STRING_TWO_2900
     * @tc.name rationalNumberToStringTwoTest029
     * @tc.desc Verify RationalNumber.parseRationalNumber(1, 2).toString().indexOf('/') returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberToStringTwoTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalChainIndex = util.RationalNumber.parseRationalNumber(1, 2);
      let actual1: int = rationalChainIndex.toString().indexOf('/');
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_TO_STRING_TWO_3000
     * @tc.name rationalNumberToStringTwoTest030
     * @tc.desc Verify RationalNumber.parseRationalNumber(1, 1024).toString().endsWith('1024') returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberToStringTwoTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalChainPow = util.RationalNumber.parseRationalNumber(1, 1024);
      let str1: string = rationalChainPow.toString();
      expect(str1.endsWith('1024')).assertTrue();
    });
  });
}
