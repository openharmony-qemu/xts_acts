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

export default function rationalNumberIsZero01Test(): void {
  describe('rationalNumberIsZero01Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_ZERO_ONE_0100
     * @tc.name rationalNumberIsZeroOneTest001
     * @tc.desc Verify new RationalNumber().isZero() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsZeroOneTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = new util.RationalNumber();
      let actual1: boolean = rationalNumber.isZero();
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_ZERO_ONE_0200
     * @tc.name rationalNumberIsZeroOneTest002
     * @tc.desc Verify RationalNumber.parseRationalNumber(0, 1).isZero() returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsZeroOneTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(0, 1);
      let actual1: boolean = rationalNumber.isZero();
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_ZERO_ONE_0300
     * @tc.name rationalNumberIsZeroOneTest003
     * @tc.desc Verify RationalNumber.parseRationalNumber(0, 2).isZero() returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsZeroOneTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(0, 2);
      let actual1: boolean = rationalNumber.isZero();
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_ZERO_ONE_0400
     * @tc.name rationalNumberIsZeroOneTest004
     * @tc.desc Verify RationalNumber.parseRationalNumber(0, -1).isZero() returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsZeroOneTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(0, -1);
      let actual1: boolean = rationalNumber.isZero();
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_ZERO_ONE_0500
     * @tc.name rationalNumberIsZeroOneTest005
     * @tc.desc Verify RationalNumber.parseRationalNumber(0, 2147483647).isZero() returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsZeroOneTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(0, 2147483647);
      let actual1: boolean = rationalNumber.isZero();
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_ZERO_ONE_0600
     * @tc.name rationalNumberIsZeroOneTest006
     * @tc.desc Verify RationalNumber.parseRationalNumber(2, 4).isZero() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsZeroOneTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(2, 4);
      let actual1: boolean = rationalNumber.isZero();
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_ZERO_ONE_0700
     * @tc.name rationalNumberIsZeroOneTest007
     * @tc.desc Verify RationalNumber.parseRationalNumber(9223372036854775807, 1).isZero() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsZeroOneTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(9223372036854775807, 1);
      let actual1: boolean = rationalNumber.isZero();
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_ZERO_ONE_0800
     * @tc.name rationalNumberIsZeroOneTest008
     * @tc.desc Verify RationalNumber.parseRationalNumber(0, 0).isZero() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsZeroOneTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(0, 0);
      let actual1: boolean = rationalNumber.isZero();
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_ZERO_ONE_0900
     * @tc.name rationalNumberIsZeroOneTest009
     * @tc.desc Verify RationalNumber.createRationalFromString('0/1').isZero() returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsZeroOneTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.createRationalFromString('0/1');
      let actual1: boolean = rationalNumber.isZero();
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_ZERO_ONE_1000
     * @tc.name rationalNumberIsZeroOneTest010
     * @tc.desc Verify createRationalFromString('-0') without '/' throws BusinessError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsZeroOneTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        util.RationalNumber.createRationalFromString('-0');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('BusinessError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_ZERO_ONE_1100
     * @tc.name rationalNumberIsZeroOneTest011
     * @tc.desc Verify RationalNumber.createRationalFromString('1/2').isZero() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsZeroOneTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.createRationalFromString('1/2');
      let actual1: boolean = rationalNumber.isZero();
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_ZERO_ONE_1200
     * @tc.name rationalNumberIsZeroOneTest012
     * @tc.desc Verify RationalNumber.createRationalFromString('1/0').isZero() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsZeroOneTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.createRationalFromString('1/0');
      let actual1: boolean = rationalNumber.isZero();
      expect(actual1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_ZERO_ONE_1300
     * @tc.name rationalNumberIsZeroOneTest013
     * @tc.desc Verify RationalNumber.createRationalFromString('1/2/3').isZero() returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsZeroOneTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.createRationalFromString('1/2/3');
      let actual1: boolean = rationalNumber.isZero();
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_ZERO_ONE_1400
     * @tc.name rationalNumberIsZeroOneTest014
     * @tc.desc Verify typeof RationalNumber.parseRationalNumber(0, 2).isZero() returns 'boolean'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsZeroOneTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber: util.RationalNumber = util.RationalNumber.parseRationalNumber(0, 2);
      let result: boolean = rationalNumber.isZero();
      let actual1: string = typeof result;
      let expected1: string = 'boolean';
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_ZERO_ONE_1500
     * @tc.name rationalNumberIsZeroOneTest015
     * @tc.desc Verify 3/4 isZero 3/4 equals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsZeroOneTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber: util.RationalNumber = util.RationalNumber.parseRationalNumber(3, 4);
      rationalNumber.isZero();
      let eq: boolean = rationalNumber.equals(util.RationalNumber.parseRationalNumber(3, 4));
      expect(eq).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_ZERO_ONE_1600
     * @tc.name rationalNumberIsZeroOneTest016
     * @tc.desc Verify 0/2 isZero equals(0/1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsZeroOneTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber: util.RationalNumber = util.RationalNumber.parseRationalNumber(0, 2);
      let result: boolean = rationalNumber.isZero();
      expect(result).assertEqual(rationalNumber.equals(util.RationalNumber.parseRationalNumber(0, 1)));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_ZERO_ONE_1700
     * @tc.name rationalNumberIsZeroOneTest017
     * @tc.desc Verify RationalNumber.parseRationalNumber(0, 2).isZero() returns true, and RationalNumber.parseRationalNumber(0, 2).valueOf() returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsZeroOneTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber: util.RationalNumber = util.RationalNumber.parseRationalNumber(0, 2);
      let result: boolean = rationalNumber.isZero();
      expect(result).assertTrue();
      let actual1: number = rationalNumber.valueOf();
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_IS_ZERO_ONE_1800
     * @tc.name rationalNumberIsZeroOneTest018
     * @tc.desc Verify RationalNumber.parseRationalNumber(0, 6).isZero() returns true, and new RationalNumber().isZero() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberIsZeroOneTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let zero: util.RationalNumber = util.RationalNumber.parseRationalNumber(0, 6);
      let dflt: util.RationalNumber = new util.RationalNumber();
      let result: boolean = zero.isZero();
      expect(result).assertTrue();
      let resultDefault: boolean = dflt.isZero();
      expect(resultDefault).assertFalse();
    });
  });
}
