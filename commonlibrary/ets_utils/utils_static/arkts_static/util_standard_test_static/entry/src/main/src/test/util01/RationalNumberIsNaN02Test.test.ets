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

export default function rationalNumberIsNaN02Test(): void {
  describe('rationalNumberIsNaN02Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_NA_N_TWO_0100
     * @tc.name rationalNumberIsNaNTwoTest001
     * @tc.desc Verify typeof RationalNumber.parseRationalNumber(0, 0).isNaN() returns 'boolean', and RationalNumber.parseRationalNumber(0, 0).isNaN() returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsNaNTwoTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = util.RationalNumber.parseRationalNumber(0, 0);
      let result: boolean = r.isNaN();
      let actual1: string = typeof result;
      let expected1: string = 'boolean';
      expect(actual1).assertEqual(expected1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_NA_N_TWO_0200
     * @tc.name rationalNumberIsNaNTwoTest002
     * @tc.desc Verify RationalNumber.parseRationalNumber(3, 6).isNaN() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsNaNTwoTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = util.RationalNumber.parseRationalNumber(3, 6);
      let result: boolean = r.isNaN();
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_NA_N_TWO_0300
     * @tc.name rationalNumberIsNaNTwoTest003
     * @tc.desc Verify RationalNumber.parseRationalNumber(-2, 5).isNaN() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsNaNTwoTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = util.RationalNumber.parseRationalNumber(-2, 5);
      let result: boolean = r.isNaN();
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_NA_N_TWO_0400
     * @tc.name rationalNumberIsNaNTwoTest004
     * @tc.desc Verify RationalNumber.createRationalFromString('-3/7').isNaN() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsNaNTwoTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = util.RationalNumber.createRationalFromString('-3/7');
      let result: boolean = r.isNaN();
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_NA_N_TWO_0500
     * @tc.name rationalNumberIsNaNTwoTest005
     * @tc.desc Verify RationalNumber.createRationalFromString('9/3').isNaN() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsNaNTwoTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = util.RationalNumber.createRationalFromString('9/3');
      let result: boolean = r.isNaN();
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_NA_N_TWO_0600
     * @tc.name rationalNumberIsNaNTwoTest006
     * @tc.desc Verify RationalNumber.parseRationalNumber(-7, 0).isNaN() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsNaNTwoTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = util.RationalNumber.parseRationalNumber(-7, 0);
      let result: boolean = r.isNaN();
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_NA_N_TWO_0700
     * @tc.name rationalNumberIsNaNTwoTest007
     * @tc.desc Verify RationalNumber.parseRationalNumber(3, 0).isNaN() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsNaNTwoTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = util.RationalNumber.parseRationalNumber(3, 0);
      let result: boolean = r.isNaN();
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_NA_N_TWO_0800
     * @tc.name rationalNumberIsNaNTwoTest008
     * @tc.desc Verify RationalNumber.parseRationalNumber(0, 0).isNaN() ? 'nan' : 'num' returns 'nan'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsNaNTwoTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = util.RationalNumber.parseRationalNumber(0, 0);
      let tag: string = r.isNaN() ? 'nan' : 'num';
      expect(tag).assertEqual('nan');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_NA_N_TWO_0900
     * @tc.name rationalNumberIsNaNTwoTest009
     * @tc.desc Verify parseRationalNumber(1, 2) returns "num"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsNaNTwoTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = util.RationalNumber.parseRationalNumber(1, 2);
      let tag: string = r.isNaN() ? 'nan' : 'num';
      expect(tag).assertEqual('num');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_NA_N_TWO_1000
     * @tc.name rationalNumberIsNaNTwoTest010
     * @tc.desc Verify RationalNumber.parseRationalNumber(0, 0).isNaN() returns true, and RationalNumber.parseRationalNumber(0, 0).isNaN() returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsNaNTwoTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = util.RationalNumber.parseRationalNumber(0, 0);
      let b = util.RationalNumber.parseRationalNumber(0, 0);
      let ra: boolean = a.isNaN();
      let rb: boolean = b.isNaN();
      expect(ra).assertTrue();
      expect(rb).assertTrue();
      expect(ra).assertEqual(rb);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_NA_N_TWO_1100
     * @tc.name rationalNumberIsNaNTwoTest011
     * @tc.desc Verify RationalNumber.createRationalFromString('0/0').isNaN() returns true, and RationalNumber.parseRationalNumber(0, 0).isNaN() returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsNaNTwoTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = util.RationalNumber.createRationalFromString('0/0');
      let b = util.RationalNumber.parseRationalNumber(0, 0);
      let ra: boolean = a.isNaN();
      let rb: boolean = b.isNaN();
      expect(ra).assertTrue();
      expect(rb).assertTrue();
      expect(ra).assertEqual(rb);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_NA_N_TWO_1200
     * @tc.name rationalNumberIsNaNTwoTest012
     * @tc.desc Verify RationalNumber.parseRationalNumber(1, 0).isNaN() returns false, and RationalNumber.parseRationalNumber(1, 0).isFinite() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsNaNTwoTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = util.RationalNumber.parseRationalNumber(1, 0);
      let actual1: boolean = r.isNaN();
      expect(actual1).assertFalse();
      let actual2: boolean = r.isFinite();
      expect(actual2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_NA_N_TWO_1300
     * @tc.name rationalNumberIsNaNTwoTest013
     * @tc.desc Verify RationalNumber.createRationalFromString('0/0').isNaN() returns true, and RationalNumber.createRationalFromString('0/0').isFinite() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsNaNTwoTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = util.RationalNumber.createRationalFromString('0/0');
      let actual1: boolean = r.isNaN();
      expect(actual1).assertTrue();
      let actual2: boolean = r.isFinite();
      expect(actual2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_NA_N_TWO_1400
     * @tc.name rationalNumberIsNaNTwoTest014
     * @tc.desc Verify RationalNumber.parseRationalNumber(6, 3).isNaN() returns false, and RationalNumber.parseRationalNumber(6, 3).isFinite() returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsNaNTwoTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = util.RationalNumber.parseRationalNumber(6, 3);
      let actual1: boolean = r.isNaN();
      expect(actual1).assertFalse();
      let actual2: boolean = r.isFinite();
      expect(actual2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_NA_N_TWO_1500
     * @tc.name rationalNumberIsNaNTwoTest015
     * @tc.desc Verify 1/2 equals isNaN false, and isNaN does not modify state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsNaNTwoTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = util.RationalNumber.parseRationalNumber(1, 2);
      let b = util.RationalNumber.parseRationalNumber(1, 2);
      let first: boolean = a.isNaN();
      let eq: boolean = a.equals(b);
      let second: boolean = a.isNaN();
      expect(first).assertFalse();
      expect(eq).assertTrue();
      expect(second).assertFalse();
    });
  });
}
