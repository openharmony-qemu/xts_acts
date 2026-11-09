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

export default function rationalNumberCompare01Test(): void {
  describe('rationalNumberCompare01Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_COMPARE_ONE_0100
     * @tc.name rationalNumberCompareOneTest001
     * @tc.desc Verify compare(1/2, 1/2) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberCompareOneTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cAr1 = util.RationalNumber.parseRationalNumber(1, 2);
      let cAr2 = util.RationalNumber.parseRationalNumber(1, 2);
      let result = cAr1.compare(cAr2);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_COMPARE_ONE_0200
     * @tc.name rationalNumberCompareOneTest002
     * @tc.desc Verify compare(3/4, 1/2) returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberCompareOneTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cAr3 = util.RationalNumber.parseRationalNumber(1, 2);
      let cAr4 = util.RationalNumber.parseRationalNumber(3, 4);
      let result = cAr4.compare(cAr3);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_COMPARE_ONE_0300
     * @tc.name rationalNumberCompareOneTest003
     * @tc.desc Verify RationalNumber.parseRationalNumber(1, 2).compare(RationalNumber.createRationalFromString('3/4')) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberCompareOneTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rationalNumber = util.RationalNumber.parseRationalNumber(1, 2);
      let rational = util.RationalNumber.createRationalFromString('3/4');
      let result = rationalNumber.compare(rational);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_COMPARE_ONE_0400
     * @tc.name rationalNumberCompareOneTest004
     * @tc.desc Verify RationalNumber.createRationalFromString('3/4').compare(RationalNumber.parseRationalNumber(3, 4)) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberCompareOneTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let b1 = util.RationalNumber.createRationalFromString('3/4');
      let b2 = util.RationalNumber.parseRationalNumber(3, 4);
      let result = b1.compare(b2);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_COMPARE_ONE_0500
     * @tc.name rationalNumberCompareOneTest005
     * @tc.desc Verify RationalNumber.createRationalFromString('1/2').compare(RationalNumber.createRationalFromString('2/4')) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberCompareOneTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f1 = util.RationalNumber.createRationalFromString('1/2');
      let f2 = util.RationalNumber.createRationalFromString('2/4');
      let result = f1.compare(f2);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_COMPARE_ONE_0600
     * @tc.name rationalNumberCompareOneTest006
     * @tc.desc Verify RationalNumber.createRationalFromString('2/3').compare(RationalNumber.parseRationalNumber(1, 2)) returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberCompareOneTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f3 = util.RationalNumber.createRationalFromString('2/3');
      let f4 = util.RationalNumber.parseRationalNumber(1, 2);
      let result = f3.compare(f4);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_COMPARE_ONE_0700
     * @tc.name rationalNumberCompareOneTest007
     * @tc.desc Verify compare(2/3, 4/6) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberCompareOneTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n9 = util.RationalNumber.parseRationalNumber(2, 3);
      let n10 = util.RationalNumber.parseRationalNumber(4, 6);
      let result = n9.compare(n10);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_COMPARE_ONE_0800
     * @tc.name rationalNumberCompareOneTest008
     * @tc.desc Verify compare(-3/4, -2/5) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberCompareOneTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let n19 = util.RationalNumber.parseRationalNumber(-3, 4);
      let n20 = util.RationalNumber.parseRationalNumber(-2, 5);
      let result = n19.compare(n20);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_COMPARE_ONE_0900
     * @tc.name rationalNumberCompareOneTest009
     * @tc.desc Verify RationalNumber.parseRationalNumber(1, 2).compare(RationalNumber.parseRationalNumber(-1, 2)) returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberCompareOneTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p1 = util.RationalNumber.parseRationalNumber(1, 2);
      let p2 = util.RationalNumber.parseRationalNumber(-1, 2);
      let result = p1.compare(p2);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_COMPARE_ONE_1000
     * @tc.name rationalNumberCompareOneTest010
     * @tc.desc Verify compare(0/5, 0/7) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberCompareOneTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p9 = util.RationalNumber.parseRationalNumber(0, 5);
      let p10 = util.RationalNumber.parseRationalNumber(0, 7);
      let result = p9.compare(p10);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_COMPARE_ONE_1100
     * @tc.name rationalNumberCompareOneTest011
     * @tc.desc Verify RationalNumber.parseRationalNumber(0, 1).compare(RationalNumber.parseRationalNumber(1, 2)) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberCompareOneTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let z1 = util.RationalNumber.parseRationalNumber(0, 1);
      let z2 = util.RationalNumber.parseRationalNumber(1, 2);
      let result = z1.compare(z2);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_COMPARE_ONE_1200
     * @tc.name rationalNumberCompareOneTest012
     * @tc.desc Verify compare(9223372036854775807, -9223372036854775808) returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberCompareOneTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let g5 = util.RationalNumber.parseRationalNumber(9223372036854775807, 1);
      let g6 = util.RationalNumber.parseRationalNumber(-9223372036854775807 - 1, 1);
      let result = g5.compare(g6);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_COMPARE_ONE_1300
     * @tc.name rationalNumberCompareOneTest013
     * @tc.desc Verify compare(-9223372036854775808, 9223372036854775807) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberCompareOneTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let g7 = util.RationalNumber.parseRationalNumber(-9223372036854775807 - 1, 1);
      let g8 = util.RationalNumber.parseRationalNumber(9223372036854775807, 1);
      let result = g7.compare(g8);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_COMPARE_ONE_1400
     * @tc.name rationalNumberCompareOneTest014
     * @tc.desc Verify RationalNumber.parseRationalNumber(1, 0).compare(RationalNumber.parseRationalNumber(1, 2)) returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberCompareOneTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i3 = util.RationalNumber.parseRationalNumber(1, 0);
      let i4 = util.RationalNumber.parseRationalNumber(1, 2);
      let result = i3.compare(i4);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_COMPARE_ONE_1500
     * @tc.name rationalNumberCompareOneTest015
     * @tc.desc Verify RationalNumber.parseRationalNumber(1, 0).compare(RationalNumber.parseRationalNumber(-1, 0)) returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberCompareOneTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i7 = util.RationalNumber.parseRationalNumber(1, 0);
      let i8 = util.RationalNumber.parseRationalNumber(-1, 0);
      let result = i7.compare(i8);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_COMPARE_ONE_1600
     * @tc.name rationalNumberCompareOneTest016
     * @tc.desc Verify RationalNumber.parseRationalNumber(1, 0).compare(RationalNumber.parseRationalNumber(1, 0)) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberCompareOneTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i9 = util.RationalNumber.parseRationalNumber(1, 0);
      let i10 = util.RationalNumber.parseRationalNumber(1, 0);
      let result = i9.compare(i10);
      expect(result).assertEqual(0);
    });
  });
}
