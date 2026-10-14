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

export default function rationalNumberCompare02Test(): void {
  describe('rationalNumberCompare02Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_COMPARE_TWO_0100
     * @tc.name rationalNumberCompareTwoTest001
     * @tc.desc Verify RationalNumber.parseRationalNumber(1, 2).compare(same instance) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberCompareTwoTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = util.RationalNumber.parseRationalNumber(1, 2);
      let res = a.compare(a);
      expect(res).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_COMPARE_TWO_0200
     * @tc.name rationalNumberCompareTwoTest002
     * @tc.desc Verify RationalNumber.createRationalFromString('-2/3').compare(RationalNumber.createRationalFromString('-4/6')) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberCompareTwoTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = util.RationalNumber.createRationalFromString('-2/3');
      let b = util.RationalNumber.createRationalFromString('-4/6');
      let actual1: number = a.compare(b);
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_COMPARE_TWO_0300
     * @tc.name rationalNumberCompareTwoTest003
     * @tc.desc Verify RationalNumber.parseRationalNumber(2, 3).compare(RationalNumber.parseRationalNumber(-2, -3)) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberCompareTwoTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = util.RationalNumber.parseRationalNumber(2, 3);
      let b = util.RationalNumber.parseRationalNumber(-2, -3);
      let actual1: number = a.compare(b);
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_COMPARE_TWO_0400
     * @tc.name rationalNumberCompareTwoTest004
     * @tc.desc Verify RationalNumber.parseRationalNumber(3, 8).compare(RationalNumber.parseRationalNumber(5, 12)) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberCompareTwoTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = util.RationalNumber.parseRationalNumber(3, 8);
      let b = util.RationalNumber.parseRationalNumber(5, 12);
      let actual1: number = a.compare(b);
      let expected1: int = -1;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_COMPARE_TWO_0500
     * @tc.name rationalNumberCompareTwoTest005
     * @tc.desc Verify RationalNumber.createRationalFromString('3/5').compare(RationalNumber.createRationalFromString('2/3')) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberCompareTwoTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = util.RationalNumber.createRationalFromString('3/5');
      let b = util.RationalNumber.createRationalFromString('2/3');
      let actual1: number = a.compare(b);
      let expected1: int = -1;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_COMPARE_TWO_0600
     * @tc.name rationalNumberCompareTwoTest006
     * @tc.desc Verify RationalNumber.parseRationalNumber(-1, 9223372036854775807).compare(RationalNumber.parseRationalNumber(0, 1)) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberCompareTwoTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = util.RationalNumber.parseRationalNumber(-1, 9223372036854775807);
      let b = util.RationalNumber.parseRationalNumber(0, 1);
      let actual1: number = a.compare(b);
      let expected1: int = -1;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_COMPARE_TWO_0700
     * @tc.name rationalNumberCompareTwoTest007
     * @tc.desc Verify RationalNumber.parseRationalNumber(5, 1).compare(RationalNumber.parseRationalNumber(11, 2)) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberCompareTwoTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = util.RationalNumber.parseRationalNumber(5, 1);
      let b = util.RationalNumber.parseRationalNumber(11, 2);
      let actual1: number = a.compare(b);
      let expected1: int = -1;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_COMPARE_TWO_0800
     * @tc.name rationalNumberCompareTwoTest008
     * @tc.desc Verify RationalNumber.parseRationalNumber(-2, 0).compare(RationalNumber.parseRationalNumber(1, 0)) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberCompareTwoTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = util.RationalNumber.parseRationalNumber(-2, 0);
      let b = util.RationalNumber.parseRationalNumber(1, 0);
      let actual1: number = a.compare(b);
      let expected1: int = -1;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_COMPARE_TWO_0900
     * @tc.name rationalNumberCompareTwoTest009
     * @tc.desc Verify RationalNumber.parseRationalNumber(4, 3).compare(RationalNumber.parseRationalNumber(2, 3)) returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberCompareTwoTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = util.RationalNumber.parseRationalNumber(4, 3);
      let b = util.RationalNumber.parseRationalNumber(2, 3);
      let actual1: number = a.compare(b);
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_COMPARE_TWO_1000
     * @tc.name rationalNumberCompareTwoTest010
     * @tc.desc Verify RationalNumber.createRationalFromString('2/3').compare(RationalNumber.createRationalFromString('3/5')) returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberCompareTwoTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = util.RationalNumber.createRationalFromString('2/3');
      let b = util.RationalNumber.createRationalFromString('3/5');
      let actual1: number = a.compare(b);
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_COMPARE_TWO_1100
     * @tc.name rationalNumberCompareTwoTest011
     * @tc.desc Verify RationalNumber.parseRationalNumber(1, 9223372036854775807).compare(RationalNumber.parseRationalNumber(0, 1)) returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberCompareTwoTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = util.RationalNumber.parseRationalNumber(1, 9223372036854775807);
      let b = util.RationalNumber.parseRationalNumber(0, 1);
      let actual1: number = a.compare(b);
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_COMPARE_TWO_1200
     * @tc.name rationalNumberCompareTwoTest012
     * @tc.desc Verify RationalNumber.parseRationalNumber(1, 0).compare(RationalNumber.parseRationalNumber(-2, 0)) returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberCompareTwoTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = util.RationalNumber.parseRationalNumber(1, 0);
      let b = util.RationalNumber.parseRationalNumber(-2, 0);
      let actual1: number = a.compare(b);
      let expected1: int = 1;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_COMPARE_TWO_1300
     * @tc.name rationalNumberCompareTwoTest013
     * @tc.desc Verify RationalNumber.parseRationalNumber(1, 3).compare(RationalNumber.parseRationalNumber(1, 2)) returns -RationalNumber.parseRationalNumber(1, 2).compare(RationalNumber.parseRationalNumber(1, 3))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberCompareTwoTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = util.RationalNumber.parseRationalNumber(1, 3);
      let b = util.RationalNumber.parseRationalNumber(1, 2);
      let forward = a.compare(b);
      let backward = b.compare(a);
      expect(forward).assertEqual(-backward);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_COMPARE_TWO_1400
     * @tc.name rationalNumberCompareTwoTest014
     * @tc.desc Verify RationalNumber.parseRationalNumber(1, 2).compare(RationalNumber.parseRationalNumber(3, 4)) returns same result on repeated calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberCompareTwoTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = util.RationalNumber.parseRationalNumber(1, 2);
      let b = util.RationalNumber.parseRationalNumber(3, 4);
      let first = a.compare(b);
      let second = a.compare(b);
      expect(first).assertEqual(second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_COMPARE_TWO_1500
     * @tc.name rationalNumberCompareTwoTest015
     * @tc.desc Verify RationalNumber.parseRationalNumber(1, 2).compare(RationalNumber.parseRationalNumber(2, 4)) returns 0 and valueOf() values are equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberCompareTwoTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = util.RationalNumber.parseRationalNumber(1, 2);
      let b = util.RationalNumber.parseRationalNumber(2, 4);
      let res = a.compare(b);
      expect(res).assertEqual(0);
      let actual1: number = a.valueOf();
      let expected1: number = b.valueOf();
      expect(actual1).assertEqual(expected1);
    });
  });
}
