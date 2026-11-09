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

export default function rationalNumberIsFinite02Test(): void {
  describe('rationalNumberIsFinite02Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_FINITE_TWO_0100
     * @tc.name rationalNumberIsFiniteTwoTest001
     * @tc.desc Verify typeof RationalNumber.parseRationalNumber(5, 11).isFinite() returns 'boolean'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsFiniteTwoTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(5, 11);
      let actual1: string = typeof rationalNumber.isFinite();
      let expected1: string = 'boolean';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_FINITE_TWO_0200
     * @tc.name rationalNumberIsFiniteTwoTest002
     * @tc.desc Verify RationalNumber.parseRationalNumber(17, 29).isFinite() returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsFiniteTwoTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(17, 29);
      let actual1: boolean = rationalNumber.isFinite();
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_FINITE_TWO_0300
     * @tc.name rationalNumberIsFiniteTwoTest003
     * @tc.desc Verify RationalNumber.createRationalFromString('29/41').isFinite() returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsFiniteTwoTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.createRationalFromString('29/41');
      let actual1: boolean = rationalNumber.isFinite();
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_FINITE_TWO_0400
     * @tc.name rationalNumberIsFiniteTwoTest004
     * @tc.desc Verify RationalNumber.parseRationalNumber(-37, 47).isFinite() returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsFiniteTwoTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(-37, 47);
      let actual1: boolean = rationalNumber.isFinite();
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_FINITE_TWO_0500
     * @tc.name rationalNumberIsFiniteTwoTest005
     * @tc.desc Verify RationalNumber.parseRationalNumber(9223372036854775806, 7).isFinite() returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsFiniteTwoTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(9223372036854775806, 7);
      let actual1: boolean = rationalNumber.isFinite();
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_FINITE_TWO_0600
     * @tc.name rationalNumberIsFiniteTwoTest006
     * @tc.desc Verify RationalNumber.parseRationalNumber(2, 0).isFinite() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsFiniteTwoTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(2, 0);
      let actual1: boolean = rationalNumber.isFinite();
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_FINITE_TWO_0700
     * @tc.name rationalNumberIsFiniteTwoTest007
     * @tc.desc Verify RationalNumber.parseRationalNumber(-2, 0).isFinite() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsFiniteTwoTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(-2, 0);
      let actual1: boolean = rationalNumber.isFinite();
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_FINITE_TWO_0800
     * @tc.name rationalNumberIsFiniteTwoTest008
     * @tc.desc Verify RationalNumber.createRationalFromString('-5/0').isFinite() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsFiniteTwoTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.createRationalFromString('-5/0');
      let actual1: boolean = rationalNumber.isFinite();
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_FINITE_TWO_0900
     * @tc.name rationalNumberIsFiniteTwoTest009
     * @tc.desc Verify RationalNumber.parseRationalNumber(3, 0).isFinite() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsFiniteTwoTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(3, 0);
      let flag: boolean = rationalNumber.isFinite();
      expect(flag).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_FINITE_TWO_1000
     * @tc.name rationalNumberIsFiniteTwoTest010
     * @tc.desc Verify parseRationalNumber(59, 67) returns "finite"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsFiniteTwoTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(59, 67);
      let tag: string = rationalNumber.isFinite() ? 'finite' : 'infinite';
      expect(tag).assertEqual('finite');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_FINITE_TWO_1100
     * @tc.name rationalNumberIsFiniteTwoTest011
     * @tc.desc Verify RationalNumber.parseRationalNumber(9, 0).isFinite() ? 'finite' : 'infinite' returns 'infinite'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsFiniteTwoTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(9, 0);
      let tag: string = rationalNumber.isFinite() ? 'finite' : 'infinite';
      expect(tag).assertEqual('infinite');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_FINITE_TWO_1200
     * @tc.name rationalNumberIsFiniteTwoTest012
     * @tc.desc Verify RationalNumber.parseRationalNumber(7, 0).isFinite() returns RationalNumber.parseRationalNumber(11, 0).isFinite(), and RationalNumber.parseRationalNumber(7, 0).isFinite() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsFiniteTwoTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = util.RationalNumber.parseRationalNumber(7, 0);
      let b = util.RationalNumber.parseRationalNumber(11, 0);
      let actual1: boolean = a.isFinite();
      let expected1: boolean = b.isFinite();
      expect(actual1).assertEqual(expected1);
      let actual2: boolean = a.isFinite();
      expect(actual2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_FINITE_TWO_1300
     * @tc.name rationalNumberIsFiniteTwoTest013
     * @tc.desc Verify RationalNumber.parseRationalNumber(17, 0).valueOf() === Double.POSITIVE_INFINITY returns true, and RationalNumber.parseRationalNumber(17, 0).isFinite() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsFiniteTwoTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(17, 0);
      let actual1: boolean = rationalNumber.valueOf() === Double.POSITIVE_INFINITY;
      expect(actual1).assertTrue();
      let actual2: boolean = rationalNumber.isFinite();
      expect(actual2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_FINITE_TWO_1400
     * @tc.name rationalNumberIsFiniteTwoTest014
     * @tc.desc Verify RationalNumber.parseRationalNumber(79, 89).isNaN() returns false, and RationalNumber.parseRationalNumber(79, 89).isFinite() returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsFiniteTwoTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(79, 89);
      let actual1: boolean = rationalNumber.isNaN();
      expect(actual1).assertFalse();
      let actual2: boolean = rationalNumber.isFinite();
      expect(actual2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_FINITE_TWO_1500
     * @tc.name rationalNumberIsFiniteTwoTest015
     * @tc.desc Verify parseRationalNumber(55, 57) isFinite returns true twice, and getNumerator returns 55
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsFiniteTwoTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(55, 57);
      let first: boolean = rationalNumber.isFinite();
      let second: boolean = rationalNumber.isFinite();
      expect(first).assertTrue();
      expect(second).assertTrue();
      let actual1: number = rationalNumber.getNumerator();
      let expected1: int = 55;
      expect(actual1).assertEqual(expected1);
    });
  });
}
