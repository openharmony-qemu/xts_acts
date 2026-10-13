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

export default function rationalNumberCompare03Test(): void {
  describe('rationalNumberCompare03Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_COMPARE_THREE_0100
     * @tc.name rationalNumberCompareThreeTest001
     * @tc.desc Verify RationalNumber.parseRationalNumber(1, 2).compare(RationalNumber.parseRationalNumber(0, 1)) returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberCompareThreeTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base = util.RationalNumber.parseRationalNumber(1, 2);
      let result = base.compare(util.RationalNumber.parseRationalNumber(0, 1));
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_COMPARE_THREE_0200
     * @tc.name rationalNumberCompareThreeTest002
     * @tc.desc Verify RationalNumber.parseRationalNumber(0, 1).compare(RationalNumber.parseRationalNumber(0, 1)) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberCompareThreeTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base = util.RationalNumber.parseRationalNumber(0, 1);
      let result = base.compare(util.RationalNumber.parseRationalNumber(0, 1));
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_COMPARE_THREE_0300
     * @tc.name rationalNumberCompareThreeTest003
     * @tc.desc Verify RationalNumber.parseRationalNumber(-1, 2).compare(RationalNumber.parseRationalNumber(0, 1)) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberCompareThreeTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base = util.RationalNumber.parseRationalNumber(-1, 2);
      let result = base.compare(util.RationalNumber.parseRationalNumber(0, 1));
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_COMPARE_THREE_0400
     * @tc.name rationalNumberCompareThreeTest004
     * @tc.desc Verify RationalNumber.parseRationalNumber(1, 2).compare(RationalNumber.parseRationalNumber(1, 2)) returns 0 across parseRationalNumber and createRationalFromString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberCompareThreeTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a1 = util.RationalNumber.parseRationalNumber(1, 2);
      let a2 = util.RationalNumber.parseRationalNumber(1, 2);
      let a3 = util.RationalNumber.createRationalFromString('1/2');
      let actual1: number = a1.compare(a2);
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
      let actual2: number = a2.compare(a3);
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
      let actual3: number = a1.compare(a3);
      let expected3: int = 0;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_COMPARE_THREE_0500
     * @tc.name rationalNumberCompareThreeTest005
     * @tc.desc Verify RationalNumber.parseRationalNumber(0, 1).compare(RationalNumber.parseRationalNumber(1, 1)) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberCompareThreeTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let start = util.RationalNumber.parseRationalNumber(0, 1);
      let unit = util.RationalNumber.parseRationalNumber(1, 1);
      let actual1: number = start.compare(unit);
      let expected1: int = -1;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_COMPARE_THREE_0600
     * @tc.name rationalNumberCompareThreeTest006
     * @tc.desc Verify RationalNumber.parseRationalNumber(2, 4).compare(RationalNumber.createRationalFromString('1/2')) returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberCompareThreeTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a = util.RationalNumber.parseRationalNumber(2, 4);
      let b = util.RationalNumber.createRationalFromString('1/2');
      let actual1: number = a.compare(b);
      let expected1: int = 0;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_COMPARE_THREE_0700
     * @tc.name rationalNumberCompareThreeTest007
     * @tc.desc Verify RationalNumber.createRationalFromString('5/8').compare(RationalNumber.parseRationalNumber(3, 5)) returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberCompareThreeTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = util.RationalNumber.createRationalFromString('5/8');
      let y = util.RationalNumber.parseRationalNumber(3, 5);
      let result = x.compare(y);
      expect(result).assertEqual(1);
      let actual1: boolean = isFinite(result);
      expect(actual1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_COMPARE_THREE_0800
     * @tc.name rationalNumberCompareThreeTest008
     * @tc.desc Verify RationalNumber.parseRationalNumber(9223372036854775807, 3).compare(RationalNumber.parseRationalNumber(0, 1)) returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberCompareThreeTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base = util.RationalNumber.parseRationalNumber(9223372036854775807, 3);
      let result = base.compare(util.RationalNumber.parseRationalNumber(0, 1));
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_RATIONALNUMBER_COMPARE_THREE_0900
     * @tc.name rationalNumberCompareThreeTest009
     * @tc.desc Verify RationalNumber.parseRationalNumber(-9223372036854775807 - 1, 7).compare(RationalNumber.parseRationalNumber(0, 1)) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('rationalNumberCompareThreeTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base = util.RationalNumber.parseRationalNumber(-9223372036854775807 - 1, 7);
      let result = base.compare(util.RationalNumber.parseRationalNumber(0, 1));
      expect(result).assertEqual(-1);
    });
  });
}
