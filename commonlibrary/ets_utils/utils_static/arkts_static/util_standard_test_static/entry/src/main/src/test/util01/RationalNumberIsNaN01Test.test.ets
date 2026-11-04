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

export default function rationalNumberIsNaN01Test(): void {
  describe('rationalNumberIsNaN01Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_NA_N_ONE_0100
     * @tc.name rationalNumberIsNaNOneTest001
     * @tc.desc Verify new RationalNumber().isNaN() returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsNaNOneTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = new util.RationalNumber();
      let actual1: boolean = rationalNumber.isNaN();
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_NA_N_ONE_0200
     * @tc.name rationalNumberIsNaNOneTest002
     * @tc.desc Verify RationalNumber.parseRationalNumber(0, 0).isNaN() returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsNaNOneTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(0, 0);
      let actual1: boolean = rationalNumber.isNaN();
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_NA_N_ONE_0300
     * @tc.name rationalNumberIsNaNOneTest003
     * @tc.desc Verify RationalNumber.parseRationalNumber(-0, 0).isNaN() returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsNaNOneTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(-0, 0);
      let actual1: boolean = rationalNumber.isNaN();
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_NA_N_ONE_0400
     * @tc.name rationalNumberIsNaNOneTest004
     * @tc.desc Verify RationalNumber.parseRationalNumber(7, 0).isNaN() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsNaNOneTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(7, 0);
      let actual1: boolean = rationalNumber.isNaN();
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_NA_N_ONE_0500
     * @tc.name rationalNumberIsNaNOneTest005
     * @tc.desc Verify RationalNumber.parseRationalNumber(0, 9223372036854775807).isNaN() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsNaNOneTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(0, 9223372036854775807);
      let actual1: boolean = rationalNumber.isNaN();
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_NA_N_ONE_0600
     * @tc.name rationalNumberIsNaNOneTest006
     * @tc.desc Verify RationalNumber.parseRationalNumber(-0, 1).isNaN() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsNaNOneTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(-0, 1);
      let actual1: boolean = rationalNumber.isNaN();
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_NA_N_ONE_0700
     * @tc.name rationalNumberIsNaNOneTest007
     * @tc.desc Verify RationalNumber.parseRationalNumber(-1, 2).isNaN() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsNaNOneTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(-1, 2);
      let actual1: boolean = rationalNumber.isNaN();
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_NA_N_ONE_0800
     * @tc.name rationalNumberIsNaNOneTest008
     * @tc.desc Verify RationalNumber.parseRationalNumber(1, 0).isNaN() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsNaNOneTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(1, 0);
      let actual1: boolean = rationalNumber.isNaN();
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_NA_N_ONE_0900
     * @tc.name rationalNumberIsNaNOneTest009
     * @tc.desc Verify RationalNumber.parseRationalNumber(1, 9223372036854775807).isNaN() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsNaNOneTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(1, 9223372036854775807);
      let actual1: boolean = rationalNumber.isNaN();
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_NA_N_ONE_1000
     * @tc.name rationalNumberIsNaNOneTest010
     * @tc.desc Verify RationalNumber.parseRationalNumber(9223372036854775807, 1).isNaN() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsNaNOneTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(9223372036854775807, 1);
      let actual1: boolean = rationalNumber.isNaN();
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_NA_N_ONE_1100
     * @tc.name rationalNumberIsNaNOneTest011
     * @tc.desc Verify RationalNumber.parseRationalNumber(0, 0).isNaN() returns RationalNumber.parseRationalNumber(0, 0).isNaN(), and RationalNumber.parseRationalNumber(0, 0).isNaN() returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsNaNOneTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(0, 0);
      let first: boolean = rationalNumber.isNaN();
      let second: boolean = rationalNumber.isNaN();
      expect(first).assertEqual(second);
      expect(first).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_NA_N_ONE_1200
     * @tc.name rationalNumberIsNaNOneTest012
     * @tc.desc Verify RationalNumber.parseRationalNumber(0, 0).isNaN() returns true, and RationalNumber.createRationalFromString('0/0').isNaN() returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsNaNOneTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = util.RationalNumber.parseRationalNumber(0, 0);
      let b = util.RationalNumber.parseRationalNumber(0, 0);
      let c = util.RationalNumber.createRationalFromString('0/0');
      let actual1: boolean = a.isNaN();
      expect(actual1).assertTrue();
      let actual2: boolean = b.isNaN();
      expect(actual2).assertTrue();
      let actual3: boolean = c.isNaN();
      expect(actual3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_NA_N_ONE_1300
     * @tc.name rationalNumberIsNaNOneTest013
     * @tc.desc Verify RationalNumber.parseRationalNumber(1, 2).isNaN() returns false, and RationalNumber.createRationalFromString('1/2').isNaN() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsNaNOneTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = util.RationalNumber.parseRationalNumber(1, 2);
      let b = util.RationalNumber.parseRationalNumber(1, 2);
      let c = util.RationalNumber.createRationalFromString('1/2');
      let actual1: boolean = a.isNaN();
      expect(actual1).assertFalse();
      let actual2: boolean = b.isNaN();
      expect(actual2).assertFalse();
      let actual3: boolean = c.isNaN();
      expect(actual3).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_NA_N_ONE_1400
     * @tc.name rationalNumberIsNaNOneTest014
     * @tc.desc Verify RationalNumber.parseRationalNumber(1, 0).isNaN() returns false, and RationalNumber.createRationalFromString('1/0').isNaN() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsNaNOneTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = util.RationalNumber.parseRationalNumber(1, 0);
      let b = util.RationalNumber.parseRationalNumber(1, 0);
      let c = util.RationalNumber.createRationalFromString('1/0');
      let actual1: boolean = a.isNaN();
      expect(actual1).assertFalse();
      let actual2: boolean = b.isNaN();
      expect(actual2).assertFalse();
      let actual3: boolean = c.isNaN();
      expect(actual3).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_NA_N_ONE_1500
     * @tc.name rationalNumberIsNaNOneTest015
     * @tc.desc Verify RationalNumber.parseRationalNumber(0, 0).isNaN() returns true, and RationalNumber.parseRationalNumber(0, 0).isNaN() returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsNaNOneTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = util.RationalNumber.parseRationalNumber(0, 0);
      let b = util.RationalNumber.parseRationalNumber(0, 0);
      let actual1: boolean = a.isNaN();
      expect(actual1).assertTrue();
      let actual2: boolean = b.isNaN();
      expect(actual2).assertTrue();
    });
  });
}
