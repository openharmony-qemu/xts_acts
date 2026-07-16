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

export default function LongToShort2Test(): void {
  describe('LongToShort2Test', () => {

    beforeAll(() => {
    });

    afterAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    const TS2_OVERFLOW_BELOW_MIN: long = -32769;
    const TS2_SHORT_MIN: long = -32768;
    const TS2_NEG_500: long = -500;
    const TS2_NEG_1: long = -1;
    const TS2_0: long = 0;
    const TS2_1: long = 1;
    const TS2_1024: long = 1024;
    const TS2_SHORT_MAX: long = 32767;
    const TS2_OVERFLOW_ABOVE_MAX: long = 32768;
    const TS2_WRAP_TO_ZERO: long = 65536;

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT2_0100
     * @tc.name testLongToShort2001
     * @tc.desc Verify Long.toShort(TS2_1024) basic → 1024
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToShort2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: short = Long.toShort(TS2_1024);
      expect(result).assertEqual(TS2_1024);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT2_0200
     * @tc.name testLongToShort2002
     * @tc.desc Verify Long.toShort(TS2_0) → 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToShort2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: short = Long.toShort(TS2_0);
      expect(result).assertEqual(TS2_0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT2_0300
     * @tc.name testLongToShort2003
     * @tc.desc Verify Long.toShort(TS2_NEG_500) negative → -500
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToShort2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: short = Long.toShort(TS2_NEG_500);
      expect(result).assertEqual(TS2_NEG_500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT2_0400
     * @tc.name testLongToShort2004
     * @tc.desc Verify Long.toShort(TS2_SHORT_MAX) short max → 32767
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToShort2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: short = Long.toShort(TS2_SHORT_MAX);
      expect(result).assertEqual(TS2_SHORT_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT2_0500
     * @tc.name testLongToShort2005
     * @tc.desc Verify Long.toShort(TS2_SHORT_MIN) short min → -32768
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToShort2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: short = Long.toShort(TS2_SHORT_MIN);
      expect(result).assertEqual(TS2_SHORT_MIN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT2_0600
     * @tc.name testLongToShort2006
     * @tc.desc Verify Long.toShort(TS2_1) → 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToShort2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: short = Long.toShort(TS2_1);
      expect(result).assertEqual(TS2_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT2_0700
     * @tc.name testLongToShort2007
     * @tc.desc Verify Long.toShort(TS2_NEG_1) → -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToShort2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: short = Long.toShort(TS2_NEG_1);
      expect(result).assertEqual(TS2_NEG_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT2_0800
     * @tc.name testLongToShort2008
     * @tc.desc Verify Long.toShort(TS2_OVERFLOW_ABOVE_MAX) out of range truncation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToShort2008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: short = Long.toShort(TS2_OVERFLOW_ABOVE_MAX);
      expect(result).assertEqual(TS2_SHORT_MIN);
      expect(result >= TS2_SHORT_MIN).assertTrue();
      expect(result <= TS2_SHORT_MAX).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT2_0900
     * @tc.name testLongToShort2009
     * @tc.desc Verify Long.toShort(TS2_OVERFLOW_BELOW_MIN) out of range truncation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToShort2009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: short = Long.toShort(TS2_OVERFLOW_BELOW_MIN);
      expect(result).assertEqual(TS2_SHORT_MAX);
      expect(result >= TS2_SHORT_MIN).assertTrue();
      expect(result <= TS2_SHORT_MAX).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT2_1000
     * @tc.name testLongToShort2010
     * @tc.desc Verify Long.toShort(TS2_WRAP_TO_ZERO) large value truncation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToShort2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: short = Long.toShort(TS2_WRAP_TO_ZERO);
      expect(result).assertEqual(TS2_0);
      expect(result >= TS2_SHORT_MIN).assertTrue();
      expect(result <= TS2_SHORT_MAX).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT2_1100
     * @tc.name testLongToShort2011
     * @tc.desc Verify Long.toShort(Long.MAX_VALUE) extreme truncation — upper boundary (low 16 bits = 0xFFFF → -1)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToShort2011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: short = Long.toShort(Long.MAX_VALUE);
      expect(result).assertEqual(TS2_NEG_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOSHORT2_1200
     * @tc.name testLongToShort2012
     * @tc.desc Verify Long.toShort(Long.MIN_VALUE) extreme truncation — lower boundary (low 16 bits = 0x0000 → 0)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToShort2012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: short = Long.toShort(Long.MIN_VALUE);
      expect(result).assertEqual(TS2_0);
    });
  });
}
