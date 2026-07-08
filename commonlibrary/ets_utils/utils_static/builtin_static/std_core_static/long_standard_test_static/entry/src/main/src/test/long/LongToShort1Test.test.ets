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
} from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../Util.test';

export default function LongToShort1Test(): void {
  describe('LongToShort1Test', () => {

    beforeAll(() => {
    });

    afterAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });
    const TS1_OVERFLOW_BELOW_MIN: long = -32769;
    const TS1_SHORT_MIN: long = -32768;
    const TS1_NEG_100: long = -100;
    const TS1_NEG_1: long = -1;
    const TS1_0: long = 0;
    const TS1_1: long = 1;
    const TS1_123: long = 123;
    const TS1_SHORT_MAX: long = 32767;
    const TS1_OVERFLOW_ABOVE_MAX: long = 32768;
    const TS1_LARGE_POS: long = 100000;
    const TS1_LARGE_POS_TRUNCATED_SHORT: short = -31072 as short;

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT1_0100
     * @tc.name testLongToShort1001
     * @tc.desc Verify toShort() basic 123 → 123
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToShort1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(TS1_123);
      const result: short = value.toShort();
      expect(result).assertEqual(TS1_123);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT1_0200
     * @tc.name testLongToShort1002
     * @tc.desc Verify toShort() zero 0 → 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToShort1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(TS1_0);
      const result: short = value.toShort();
      expect(result).assertEqual(TS1_0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT1_0300
     * @tc.name testLongToShort1003
     * @tc.desc Verify toShort() negative -100 → -100
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToShort1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(TS1_NEG_100);
      const result: short = value.toShort();
      expect(result).assertEqual(TS1_NEG_100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT1_0400
     * @tc.name testLongToShort1004
     * @tc.desc Verify toShort() short max 32767 → 32767
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToShort1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(TS1_SHORT_MAX);
      const result: short = value.toShort();
      expect(result).assertEqual(TS1_SHORT_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT1_0500
     * @tc.name testLongToShort1005
     * @tc.desc Verify toShort() short min -32768 → -32768
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToShort1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(TS1_SHORT_MIN);
      const result: short = value.toShort();
      expect(result).assertEqual(TS1_SHORT_MIN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT1_0600
     * @tc.name testLongToShort1006
     * @tc.desc Verify toShort() value 1 → 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToShort1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(TS1_1);
      const result: short = value.toShort();
      expect(result).assertEqual(TS1_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT1_0700
     * @tc.name testLongToShort1007
     * @tc.desc Verify toShort() value -1 → -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToShort1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(TS1_NEG_1);
      const result: short = value.toShort();
      expect(result).assertEqual(TS1_NEG_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT1_0800
     * @tc.name testLongToShort1008
     * @tc.desc Verify toShort() out of range TS1_OVERFLOW_ABOVE_MAX truncation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToShort1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(TS1_OVERFLOW_ABOVE_MAX);
      const result: short = value.toShort();
      expect(result).assertEqual(TS1_SHORT_MIN);
      expect(result >= TS1_SHORT_MIN).assertTrue();
      expect(result <= TS1_SHORT_MAX).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT1_0900
     * @tc.name testLongToShort1009
     * @tc.desc Verify toShort() out of range TS1_OVERFLOW_BELOW_MIN truncation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToShort1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(TS1_OVERFLOW_BELOW_MIN);
      const result: short = value.toShort();
      expect(result).assertEqual(TS1_SHORT_MAX);
      expect(result >= TS1_SHORT_MIN).assertTrue();
      expect(result <= TS1_SHORT_MAX).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT1_1000
     * @tc.name testLongToShort1010
     * @tc.desc Verify toShort() large value TS1_LARGE_POS truncation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToShort1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(TS1_LARGE_POS);
      const result: short = value.toShort();
      expect(result !== TS1_LARGE_POS).assertTrue();
      expect(result).assertEqual(TS1_LARGE_POS_TRUNCATED_SHORT);
      expect(result >= TS1_SHORT_MIN).assertTrue();
      expect(result <= TS1_SHORT_MAX).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT1_1100
     * @tc.name testLongToShort1011
     * @tc.desc Verify toShort() multiple calls consistent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToShort1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(TS1_123);
      const result1: short = value.toShort();
      const result2: short = value.toShort();
      expect(result1).assertEqual(result2);
      expect(result1).assertEqual(TS1_123);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT1_1200
     * @tc.name testLongToShort1012
     * @tc.desc Verify toShort() Long.MAX_VALUE truncation — extreme upper boundary
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToShort1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(Long.MAX_VALUE);
      const result: short = value.toShort();
      expect(result >= TS1_SHORT_MIN).assertTrue();
      expect(result <= TS1_SHORT_MAX).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT1_1300
     * @tc.name testLongToShort1013
     * @tc.desc Verify toShort() Long.MIN_VALUE truncation — extreme lower boundary
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToShort1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = new Long(Long.MIN_VALUE);
      const result: short = value.toShort();
      expect(result >= TS1_SHORT_MIN).assertTrue();
      expect(result <= TS1_SHORT_MAX).assertTrue();
    });
  });
}

