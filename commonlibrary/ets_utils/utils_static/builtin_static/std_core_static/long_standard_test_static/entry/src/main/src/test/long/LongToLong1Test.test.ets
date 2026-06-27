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

export default function LongToLong1Test(): void {
  describe('LongToLong1Test', () => {

    beforeAll(() => {
    });

    afterAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    const TL1_LARGE_NEG: long = -922337203685477580;
    const TL1_NEG_100: long = -100;
    const TL1_NEG_1: long = -1;
    const TL1_0: long = 0;
    const TL1_1: long = 1;
    const TL1_100: long = 100;
    const TL1_1234: long = 1234;
    const TL1_LARGE_POS: long = 922337203685477580;

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLONG1_0100
     * @tc.name testLongToLong1001
     * @tc.desc Verify toLong() basic 1234 → 1234
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToLong1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(TL1_1234);
      const result: long = value.toLong();
      expect(result).assertEqual(TL1_1234);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLONG1_0200
     * @tc.name testLongToLong1002
     * @tc.desc Verify toLong() value 0 → 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToLong1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(TL1_0);
      const result: long = value.toLong();
      expect(result).assertEqual(TL1_0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLONG1_0300
     * @tc.name testLongToLong1003
     * @tc.desc Verify toLong() positive 100 → 100
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToLong1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(TL1_100);
      const result: long = value.toLong();
      expect(result).assertEqual(TL1_100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLONG1_0400
     * @tc.name testLongToLong1004
     * @tc.desc Verify toLong() negative -100 → -100
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToLong1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(TL1_NEG_100);
      const result: long = value.toLong();
      expect(result).assertEqual(TL1_NEG_100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLONG1_0500
     * @tc.name testLongToLong1005
     * @tc.desc Verify toLong() large positive TL1_LARGE_POS
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToLong1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(TL1_LARGE_POS);
      const result: long = value.toLong();
      expect(result).assertEqual(TL1_LARGE_POS);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLONG1_0600
     * @tc.name testLongToLong1006
     * @tc.desc Verify toLong() large negative TL1_LARGE_NEG
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToLong1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(TL1_LARGE_NEG);
      const result: long = value.toLong();
      expect(result).assertEqual(TL1_LARGE_NEG);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLONG1_0700
     * @tc.name testLongToLong1007
     * @tc.desc Verify toLong() value 1 → 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToLong1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(TL1_1);
      const result: long = value.toLong();
      expect(result).assertEqual(TL1_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLONG1_0800
     * @tc.name testLongToLong1008
     * @tc.desc Verify toLong() value -1 → -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToLong1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(TL1_NEG_1);
      const result: long = value.toLong();
      expect(result).assertEqual(TL1_NEG_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLONG1_0900
     * @tc.name testLongToLong1009
     * @tc.desc Verify toLong() multiple calls consistent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToLong1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(TL1_1234);
      const result1: long = value.toLong();
      const result2: long = value.toLong();
      const result3: long = value.toLong();
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLONG1_1000
     * @tc.name testLongToLong1010
     * @tc.desc Verify toLong() for Long.MAX_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToLong1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(Long.MAX_VALUE);
      const result: long = value.toLong();
      expect(result).assertEqual(Long.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLONG1_1100
     * @tc.name testLongToLong1011
     * @tc.desc Verify toLong() for Long.MIN_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToLong1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(Long.MIN_VALUE);
      const result: long = value.toLong();
      expect(result).assertEqual(Long.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOLONG1_1200
     * @tc.name testLongToLong1012
     * @tc.desc Verify toLong() return value typeof is numeric long primitive
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToLong1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(TL1_1234);
      const result: long = value.toLong();
      expect(typeof result).assertEqual('long');
    });
  });
}
