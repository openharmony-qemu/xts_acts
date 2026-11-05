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

export default function rationalNumberIsFinite01Test(): void {
  describe('rationalNumberIsFinite01Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_FINITE_ONE_0100
     * @tc.name rationalNumberIsFiniteOneTest001
     * @tc.desc Verify RationalNumber.createRationalFromString('3/4').isFinite() returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsFiniteOneTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.createRationalFromString('3/4');
      let actual1: boolean = rationalNumber.isFinite();
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_FINITE_ONE_0200
     * @tc.name rationalNumberIsFiniteOneTest002
     * @tc.desc Verify RationalNumber.parseRationalNumber(0, 1).isFinite() returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsFiniteOneTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(0, 1);
      let actual1: boolean = rationalNumber.isFinite();
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_FINITE_ONE_0300
     * @tc.name rationalNumberIsFiniteOneTest003
     * @tc.desc Verify RationalNumber.parseRationalNumber(9223372036854775807, 1).isFinite() returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsFiniteOneTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(9223372036854775807, 1);
      let actual1: boolean = rationalNumber.isFinite();
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_FINITE_ONE_0400
     * @tc.name rationalNumberIsFiniteOneTest004
     * @tc.desc Verify RationalNumber.parseRationalNumber(-3, 6).isFinite() returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsFiniteOneTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(-3, 6);
      let actual1: boolean = rationalNumber.isFinite();
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_FINITE_ONE_0500
     * @tc.name rationalNumberIsFiniteOneTest005
     * @tc.desc Verify RationalNumber.parseRationalNumber(5, 5).isFinite() returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsFiniteOneTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(5, 5);
      let actual1: boolean = rationalNumber.isFinite();
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_FINITE_ONE_0600
     * @tc.name rationalNumberIsFiniteOneTest006
     * @tc.desc Verify new RationalNumber().isFinite() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsFiniteOneTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = new util.RationalNumber();
      let actual1: boolean = rationalNumber.isFinite();
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_FINITE_ONE_0700
     * @tc.name rationalNumberIsFiniteOneTest007
     * @tc.desc Verify RationalNumber.parseRationalNumber(1, 0).isFinite() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsFiniteOneTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(1, 0);
      let actual1: boolean = rationalNumber.isFinite();
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_FINITE_ONE_0800
     * @tc.name rationalNumberIsFiniteOneTest008
     * @tc.desc Verify RationalNumber.parseRationalNumber(0, 0).isFinite() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsFiniteOneTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(0, 0);
      let actual1: boolean = rationalNumber.isFinite();
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_FINITE_ONE_0900
     * @tc.name rationalNumberIsFiniteOneTest009
     * @tc.desc Verify RationalNumber.parseRationalNumber(-2147483648, 0).isFinite() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsFiniteOneTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(-2147483648, 0);
      let actual1: boolean = rationalNumber.isFinite();
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_FINITE_ONE_1000
     * @tc.name rationalNumberIsFiniteOneTest010
     * @tc.desc Verify RationalNumber.createRationalFromString('1/0').isFinite() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsFiniteOneTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.createRationalFromString('1/0');
      let actual1: boolean = rationalNumber.isFinite();
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_FINITE_ONE_1100
     * @tc.name rationalNumberIsFiniteOneTest011
     * @tc.desc Verify RationalNumber.parseRationalNumber(2147483647, 1).isFinite() returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsFiniteOneTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(2147483647, 1);
      let actual1: boolean = rationalNumber.isFinite();
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_FINITE_ONE_1200
     * @tc.name rationalNumberIsFiniteOneTest012
     * @tc.desc Verify RationalNumber.parseRationalNumber(-1, 0).isFinite() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsFiniteOneTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(-1, 0);
      let actual1: boolean = rationalNumber.isFinite();
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_FINITE_ONE_1300
     * @tc.name rationalNumberIsFiniteOneTest013
     * @tc.desc Verify RationalNumber.parseRationalNumber(7, 8).isFinite() returns true, and RationalNumber.parseRationalNumber(7, 8).isFinite() returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsFiniteOneTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(7, 8);
      let first: boolean = rationalNumber.isFinite();
      let second: boolean = rationalNumber.isFinite();
      expect(first).assertEqual(second);
      expect(first).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_FINITE_ONE_1400
     * @tc.name rationalNumberIsFiniteOneTest014
     * @tc.desc Verify RationalNumber.parseRationalNumber(1, 2).isFinite() returns RationalNumber.createRationalFromString('1/2').isFinite(), and RationalNumber.parseRationalNumber(1, 2).isFinite() returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsFiniteOneTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = util.RationalNumber.parseRationalNumber(1, 2);
      let b = util.RationalNumber.createRationalFromString('1/2');
      let actual1: boolean = a.isFinite();
      let expected1: boolean = b.isFinite();
      expect(actual1).assertEqual(expected1);
      let actual2: boolean = a.isFinite();
      expect(actual2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_FINITE_ONE_1500
     * @tc.name rationalNumberIsFiniteOneTest015
     * @tc.desc Verify new RationalNumber().isFinite() returns false, and new RationalNumber().isFinite() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsFiniteOneTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = new util.RationalNumber();
      let first: boolean = rationalNumber.isFinite();
      let second: boolean = rationalNumber.isFinite();
      expect(first).assertFalse();
      expect(second).assertFalse();
    });
  });
}
