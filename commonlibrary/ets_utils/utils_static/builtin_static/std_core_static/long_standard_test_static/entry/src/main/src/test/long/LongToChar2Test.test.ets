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

export default function LongToChar2Test(): void {
  describe('LongToChar2Test', () => {
    beforeAll(() => {
    });

    afterAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });
    const TC2_NEG_1: long = -1;
    const TC2_0: long = 0;
    const TC2_48: long = 48;
    const TC2_65: long = 65;
    const TC2_90: long = 90;
    const TC2_97: long = 97;
    const TC2_122: long = 122;
    const TC2_EURO_SIGN: long = 8364;
    const TC2_LEFT_ARROW: long = 8592;
    const TC2_CHAR_MAX: long = 65535;
    const TC2_OVERFLOW_ABOVE_MAX: long = 65536;
    const TC2_CHAR_NULL: char = c'\0';
    const TC2_CHAR_0: char = c'0';
    const TC2_CHAR_A: char = c'A';
    const TC2_CHAR_Z: char = c'Z';
    const TC2_CHAR_a: char = c'a';
    const TC2_CHAR_z: char = c'z';
    const TC2_CHAR_EURO: char = c'€';
    const TC2_CHAR_LEFTARROW: char = c'←';
    const TC2_CHAR_EXP_MAX: char = c'￿';
    const TC2_CJK_ER: long = 20108;
    const TC2_CHAR_ER: char = c'二';

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR2_0100
     * @tc.name testLongToChar2001
     * @tc.desc Verify Long.toChar(TC2_65) -> 'A'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToChar2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(TC2_65);
      expect(result).assertEqual(TC2_CHAR_A);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR2_0200
     * @tc.name testLongToChar2002
     * @tc.desc Verify Long.toChar(TC2_97) -> 'a'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToChar2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(TC2_97);
      expect(result).assertEqual(TC2_CHAR_a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR2_0300
     * @tc.name testLongToChar2003
     * @tc.desc Verify Long.toChar(TC2_48) -> '0'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToChar2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(TC2_48);
      expect(result).assertEqual(TC2_CHAR_0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR2_0400
     * @tc.name testLongToChar2004
     * @tc.desc Verify Long.toChar(TC2_90) -> 'Z'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToChar2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(TC2_90);
      expect(result).assertEqual(TC2_CHAR_Z);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR2_0500
     * @tc.name testLongToChar2005
     * @tc.desc Verify Long.toChar(TC2_122) -> 'z'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToChar2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(TC2_122);
      expect(result).assertEqual(TC2_CHAR_z);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR2_0600
     * @tc.name testLongToChar2006
     * @tc.desc Verify Long.toChar(TC2_0) -> null char
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToChar2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(TC2_0);
      expect(result).assertEqual(TC2_CHAR_NULL);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR2_0700
     * @tc.name testLongToChar2007
     * @tc.desc Verify Long.toChar(TC2_CHAR_MAX) -> max char
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToChar2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(TC2_CHAR_MAX);
      expect(result).assertEqual(TC2_CHAR_EXP_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR2_0800
     * @tc.name testLongToChar2008
     * @tc.desc Verify Long.toChar(TC2_EURO_SIGN) -> Euro sign
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToChar2008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(TC2_EURO_SIGN);
      expect(result).assertEqual(TC2_CHAR_EURO);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR2_0900
     * @tc.name testLongToChar2009
     * @tc.desc Verify Long.toChar(TC2_LEFT_ARROW) -> left arrow
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToChar2009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(TC2_LEFT_ARROW);
      expect(result).assertEqual(TC2_CHAR_LEFTARROW);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR2_1000
     * @tc.name testLongToChar2010
     * @tc.desc Verify different inputs produce different chars
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToChar2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result1: char = Long.toChar(TC2_65);
      const result2: char = Long.toChar(TC2_97);
      expect(result1 !== result2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR2_1100
     * @tc.name testLongToChar2011
     * @tc.desc Verify Long.toChar overflow: TC2_OVERFLOW_ABOVE_MAX truncates to TC2_0 (TC2_CHAR_NULL)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToChar2011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(TC2_OVERFLOW_ABOVE_MAX);
      expect(result).assertEqual(TC2_CHAR_NULL);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR2_1200
     * @tc.name testLongToChar2012
     * @tc.desc Verify Long.toChar negative value TC2_NEG_1 truncates to TC2_CHAR_MAX (TC2_CHAR_EXP_MAX)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToChar2012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(TC2_NEG_1);
      expect(result).assertEqual(TC2_CHAR_EXP_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR2_1300
     * @tc.name testLongToChar2013
     * @tc.desc Verify Long.toChar CJK unified ideograph U+4E8C (二, 20108)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToChar2013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(TC2_CJK_ER);
      expect(result).assertEqual(TC2_CHAR_ER);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR2_1400
     * @tc.name testLongToChar2014
     * @tc.desc Verify Long.toChar(Long.MAX_VALUE) truncation is within char range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToChar2014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(Long.MAX_VALUE);
      expect(result >= c'\0').assertTrue();
      expect(result <= c'￿').assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_TOCHAR2_1500
     * @tc.name testLongToChar2015
     * @tc.desc Verify Long.toChar(Long.MIN_VALUE) truncation is within char range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongToChar2015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = Long.toChar(Long.MIN_VALUE);
      expect(result >= c'\0').assertTrue();
      expect(result <= c'￿').assertTrue();
    });
  });
}
