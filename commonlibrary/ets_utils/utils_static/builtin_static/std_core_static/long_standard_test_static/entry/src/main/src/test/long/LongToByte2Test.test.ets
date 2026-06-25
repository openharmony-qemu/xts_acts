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

export default function LongToByte2Test(): void {
  describe('LongToByte2Test', () => {
    beforeAll(() => {
    });

    afterAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });
    const TB2_LARGE_NEG: long = -100000;
    const TB2_OVERFLOW_BELOW_MIN: long = -129;
    const TB2_BYTE_MIN: long = -128;
    const TB2_NEG_1: long = -1;
    const TB2_0: long = 0;
    const TB2_1: long = 1;
    const TB2_8: long = 8;
    const TB2_BYTE_MAX: long = 127;
    const TB2_OVERFLOW_ABOVE_MAX: long = 128;
    const TB2_LARGE_POS: long = 100000;
    const TB2_EXPECTED_NEG_96: byte = -96;
    const TB2_EXPECTED_96: byte = 96;

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE2_0100
     * @tc.name testLongToByte2001
     * @tc.desc Verify Long.toByte(TB2_8) basic → 8
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToByte2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Long.toByte(TB2_8);
      expect(result).assertEqual(TB2_8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE2_0200
     * @tc.name testLongToByte2002
     * @tc.desc Verify Long.toByte(TB2_0) → 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToByte2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Long.toByte(TB2_0);
      expect(result).assertEqual(TB2_0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE2_0300
     * @tc.name testLongToByte2003
     * @tc.desc Verify Long.toByte(TB2_127) byte max → 127
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToByte2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Long.toByte(TB2_BYTE_MAX);
      expect(result).assertEqual(TB2_BYTE_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE2_0400
     * @tc.name testLongToByte2004
     * @tc.desc Verify Long.toByte(TB2_BYTE_MIN) byte min → -128
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToByte2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Long.toByte(TB2_BYTE_MIN);
      expect(result).assertEqual(TB2_BYTE_MIN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE2_0500
     * @tc.name testLongToByte2005
     * @tc.desc Verify Long.toByte(TB2_NEG_1) → -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToByte2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Long.toByte(TB2_NEG_1);
      expect(result).assertEqual(TB2_NEG_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE2_0600
     * @tc.name testLongToByte2006
     * @tc.desc Verify Long.toByte(TB2_1) → 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToByte2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Long.toByte(TB2_1);
      expect(result).assertEqual(TB2_1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE2_0700
     * @tc.name testLongToByte2007
     * @tc.desc Verify Long.toByte(TB2_128) out of range truncation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToByte2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Long.toByte(TB2_OVERFLOW_ABOVE_MAX);
      expect(result).assertEqual(TB2_BYTE_MIN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE2_0800
     * @tc.name testLongToByte2008
     * @tc.desc Verify Long.toByte(TB2_OVERFLOW_BELOW_MIN) out of range truncation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToByte2008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Long.toByte(TB2_OVERFLOW_BELOW_MIN);
      expect(result).assertEqual(TB2_BYTE_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE2_0900
     * @tc.name testLongToByte2009
     * @tc.desc Verify Long.toByte(TB2_100000) large value truncation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToByte2009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Long.toByte(TB2_LARGE_POS);
      expect(result !== TB2_LARGE_POS).assertTrue();
      expect(result).assertEqual(TB2_EXPECTED_NEG_96);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE2_1000
     * @tc.name testLongToByte2010
     * @tc.desc Verify Long.toByte(TB2_LARGE_NEG) large negative truncation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToByte2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Long.toByte(TB2_LARGE_NEG);
      expect(result !== TB2_LARGE_NEG).assertTrue();
      expect(result).assertEqual(TB2_EXPECTED_96);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE2_1100
     * @tc.name testLongToByte2011
     * @tc.desc Verify Long.toByte(Long.MAX_VALUE) extreme truncation — upper boundary
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToByte2011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Long.toByte(Long.MAX_VALUE);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOBYTE2_1200
     * @tc.name testLongToByte2012
     * @tc.desc Verify Long.toByte(Long.MIN_VALUE) extreme truncation — lower boundary
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToByte2012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: byte = Long.toByte(Long.MIN_VALUE);
      expect(result).assertEqual(0);
    });

  });
}
