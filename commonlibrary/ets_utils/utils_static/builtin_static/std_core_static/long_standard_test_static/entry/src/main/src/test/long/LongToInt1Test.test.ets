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
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function LongToInt1Test(): void {
  describe('LongToInt1Test', () => {
    beforeAll(() => {
    });

    afterAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });
    const TI1_OVERFLOW_BELOW_MIN: long = -2147483649;
    const TI1_INT_MIN: long = -2147483648;
    const TI1_NEG_100: long = -100;
    const TI1_NEG_1: long = -1;
    const TI1_0: long = 0;
    const TI1_1: long = 1;
    const TI1_1234: long = 1234;
    const TI1_INT_MAX: long = 2147483647;
    const TI1_OVERFLOW_ABOVE_MAX: long = 2147483648;
    const TI1_LARGE_POS: long = 10000000000;
    const TI1_LARGE_POS_TRUNCATED_INT: int = 1410065408;

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOINT1_0100
     * @tc.name testLongToInt1001
     * @tc.desc Verify toInt() basic 1234 → 1234
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToInt1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(TI1_1234);
      const result: int = value.toInt();
      expect(result).assertEqual(TI1_1234);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOINT1_0200
     * @tc.name testLongToInt1002
     * @tc.desc Verify toInt() value 0 → 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToInt1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(TI1_0);
      const result: int = value.toInt();
      expect(result).assertEqual(TI1_0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOINT1_0300
     * @tc.name testLongToInt1003
     * @tc.desc Verify toInt() negative -100 → -100
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToInt1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(TI1_NEG_100);
      const result: int = value.toInt();
      expect(result).assertEqual(TI1_NEG_100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOINT1_0400
     * @tc.name testLongToInt1004
     * @tc.desc Verify toInt() value 1 → 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToInt1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(TI1_1);
      const result: int = value.toInt();
      expect(result).assertEqual(TI1_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOINT1_0500
     * @tc.name testLongToInt1005
     * @tc.desc Verify toInt() value -1 → -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToInt1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(TI1_NEG_1);
      const result: int = value.toInt();
      expect(result).assertEqual(TI1_NEG_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOINT1_0600
     * @tc.name testLongToInt1006
     * @tc.desc Verify toInt() int max TI1_INT_MAX → 2147483647
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToInt1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(TI1_INT_MAX);
      const result: int = value.toInt();
      expect(result).assertEqual(TI1_INT_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOINT1_0700
     * @tc.name testLongToInt1007
     * @tc.desc Verify toInt() int min TI1_INT_MIN → -2147483648
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToInt1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(TI1_INT_MIN);
      const result: int = value.toInt();
      expect(result).assertEqual(TI1_INT_MIN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOINT1_0800
     * @tc.name testLongToInt1008
     * @tc.desc Verify toInt() out of range TI1_OVERFLOW_ABOVE_MAX → truncation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToInt1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(TI1_OVERFLOW_ABOVE_MAX);
      const result: int = value.toInt();
      expect(result).assertEqual(TI1_INT_MIN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOINT1_0900
     * @tc.name testLongToInt1009
     * @tc.desc Verify toInt() out of range negative TI1_OVERFLOW_BELOW_MIN → truncation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToInt1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(TI1_OVERFLOW_BELOW_MIN);
      const result: int = value.toInt();
      expect(result).assertEqual(TI1_INT_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOINT1_1000
     * @tc.name testLongToInt1010
     * @tc.desc Verify toInt() large positive TI1_LARGE_POS → truncation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToInt1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(TI1_LARGE_POS);
      const result: int = value.toInt();
      expect(result !== TI1_LARGE_POS).assertTrue();
      expect(result).assertEqual(TI1_LARGE_POS_TRUNCATED_INT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOINT1_1100
     * @tc.name testLongToInt1011
     * @tc.desc Verify toInt() multiple calls consistent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToInt1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(TI1_1234);
      const result1: int = value.toInt();
      const result2: int = value.toInt();
      const result3: int = value.toInt();
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOINT1_1200
     * @tc.name testLongToInt1012
     * @tc.desc Verify toInt() Long.MAX_VALUE → TI1_NEG_1 truncation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToInt1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(Long.MAX_VALUE);
      const result: int = value.toInt();
      expect(result).assertEqual(TI1_NEG_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOINT1_1300
     * @tc.name testLongToInt1013
     * @tc.desc Verify toInt() Long.MIN_VALUE → TI1_0 truncation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToInt1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(Long.MIN_VALUE);
      const result: int = value.toInt();
      expect(result).assertEqual(TI1_0);
    });
  });
}

