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

export default function LongToChar1Test(): void {
  describe('LongToChar1Test', () => {
    beforeAll(() => {
    });

    afterAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });
    const TC1_NEG_1: long = -1;
    const TC1_0: long = 0;
    const TC1_10: long = 10;
    const TC1_32: long = 32;
    const TC1_48: long = 48;
    const TC1_65: long = 65;
    const TC1_97: long = 97;
    const TC1_EURO_SIGN: long = 8364;
    const TC1_CHAR_MAX: long = 65535;
    const TC1_OVERFLOW_ABOVE_MAX: long = 65536;
    const TC1_CHAR_NULL: char = c'\0';
    const TC1_CHAR_NEWLINE: char = c'\n';
    const TC1_CHAR_SPACE: char = c' ';
    const TC1_CHAR_0: char = c'0';
    const TC1_CHAR_A: char = c'A';
    const TC1_CHAR_a: char = c'a';
    const TC1_CHAR_EURO: char = c'€';
    const TC1_CHAR_EXP_MAX: char = c'￿';
    const TC1_CJK_UNIFIED: long = 19968;
    const TC1_CHAR_CJK: char = c'一';

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR1_0100
     * @tc.name testLongToChar1001
     * @tc.desc Verify toChar() TC1_65 -> 'A'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToChar1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(TC1_65);
      const result: char = value.toChar();
      expect(result).assertEqual(TC1_CHAR_A);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR1_0200
     * @tc.name testLongToChar1002
     * @tc.desc Verify toChar() TC1_97 -> 'a'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToChar1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(TC1_97);
      const result: char = value.toChar();
      expect(result).assertEqual(TC1_CHAR_a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR1_0300
     * @tc.name testLongToChar1003
     * @tc.desc Verify toChar() TC1_48 -> '0'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToChar1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(TC1_48);
      const result: char = value.toChar();
      expect(result).assertEqual(TC1_CHAR_0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR1_0400
     * @tc.name testLongToChar1004
     * @tc.desc Verify toChar() TC1_32 -> space char
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToChar1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(TC1_32);
      const result: char = value.toChar();
      expect(result).assertEqual(TC1_CHAR_SPACE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR1_0500
     * @tc.name testLongToChar1005
     * @tc.desc Verify toChar() TC1_CHAR_MAX -> max char value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToChar1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(TC1_CHAR_MAX);
      const result: char = value.toChar();
      expect(result).assertEqual(TC1_CHAR_EXP_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR1_0600
     * @tc.name testLongToChar1006
     * @tc.desc Verify toChar() TC1_0 -> null char
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToChar1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(TC1_0);
      const result: char = value.toChar();
      expect(result).assertEqual(TC1_CHAR_NULL);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR1_0700
     * @tc.name testLongToChar1007
     * @tc.desc Verify toChar() TC1_10 -> newline char
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToChar1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(TC1_10);
      const result: char = value.toChar();
      expect(result).assertEqual(TC1_CHAR_NEWLINE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR1_0800
     * @tc.name testLongToChar1008
     * @tc.desc Verify toChar() TC1_EURO_SIGN -> Euro sign
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToChar1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(TC1_EURO_SIGN);
      const result: char = value.toChar();
      expect(result).assertEqual(TC1_CHAR_EURO);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR1_0900
     * @tc.name testLongToChar1009
     * @tc.desc Verify multiple calls on same instance return consistent result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToChar1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(TC1_65);
      const result1: char = value.toChar();
      const result2: char = value.toChar();
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR1_1000
     * @tc.name testLongToChar1010
     * @tc.desc Verify toChar() overflow: TC1_OVERFLOW_ABOVE_MAX truncates to TC1_0 (null char)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToChar1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(TC1_OVERFLOW_ABOVE_MAX);
      const result: char = value.toChar();
      expect(result).assertEqual(TC1_CHAR_NULL);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR1_1100
     * @tc.name testLongToChar1011
     * @tc.desc Verify toChar() negative value TC1_NEG_1 truncates to TC1_CHAR_MAX (TC1_CHAR_EXP_MAX)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToChar1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(TC1_NEG_1);
      const result: char = value.toChar();
      expect(result).assertEqual(TC1_CHAR_EXP_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR1_1200
     * @tc.name testLongToChar1012
     * @tc.desc Verify toChar() Long.MAX_VALUE — extreme upper boundary truncation to char range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToChar1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(Long.MAX_VALUE);
      const result: char = value.toChar();
      expect(result).assertEqual(TC1_CHAR_EXP_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR1_1300
     * @tc.name testLongToChar1013
     * @tc.desc Verify toChar() Long.MIN_VALUE — extreme lower boundary truncation to char range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToChar1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(Long.MIN_VALUE);
      const result: char = value.toChar();
      expect(result >= TC1_CHAR_NULL && result <= TC1_CHAR_EXP_MAX).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR1_1400
     * @tc.name testLongToChar1014
     * @tc.desc Verify toChar() CJK unified ideograph U+4E00 (一, 19968)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToChar1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(TC1_CJK_UNIFIED);
      const result: char = value.toChar();
      expect(result).assertEqual(TC1_CHAR_CJK);
    });
  });
}
