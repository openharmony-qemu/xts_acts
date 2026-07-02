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

export default function LongCrossTypeSubDivTest(): void {
  describe('LongCrossTypeSubDivTest', () => {

    beforeAll(() => {
    });

    afterAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    const CSD_INT_0: int = 0;
    const CSD_INT_127: int = 127;
    const CSD_INT_NEG_128: int = -128;
    const CSD_INT_32767: int = 32767;
    const CSD_INT_NEG_32768: int = -32768;
    const CSD_INT_MAX: int = 2147483647;
    const CSD_INT_MIN: int = -2147483648;

    const CSD_L_FLOAT_0: long = 0;
    const CSD_L_FLOAT_1: long = 1;
    const CSD_L_DOUBLE_0: long = 0;
    const CSD_L_FROM_CHAR_A: long = 65;
    const CSD_L_FROM_CHAR_0: long = 48;

    const CSD_L_0: long = 0;
    const CSD_L_1: long = 1;

    const CSD_SHORT_0: short = 0 as short;
    const CSD_SHORT_50: short = 50 as short;
    const CSD_SHORT_100: short = 100 as short;
    const CSD_SHORT_200: short = 200 as short;
    const CSD_SHORT_32767: short = 32767 as short;
    const CSD_INT_30: int = 30;
    const CSD_INT_100: int = 100;
    const CSD_INT_1000: int = 1000;
    const CSD_INT_NEG_1: int = -1;

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_SUBDIV_0100
     * @tc.name testLongCrossSubDiv001
     * @tc.desc Verify Long(int 0) sub Long(long 0) returns "0" (zero identity)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossSubDiv001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(CSD_INT_0).sub(new Long(CSD_L_0));
      expect(result.toString()).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_SUBDIV_0200
     * @tc.name testLongCrossSubDiv002
     * @tc.desc Verify Long(int 127) sub Long(long 0) preserves byte-range value "127"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossSubDiv002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(CSD_INT_127).sub(new Long(CSD_L_0));
      expect(result.toString()).assertEqual("127");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_SUBDIV_0300
     * @tc.name testLongCrossSubDiv003
     * @tc.desc Verify Long(int 0) sub Long(long 1) returns "-1" (zero minus positive, different source types)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossSubDiv003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(CSD_INT_0).sub(new Long(CSD_L_1));
      expect(result.toString()).assertEqual("-1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_SUBDIV_0400
     * @tc.name testLongCrossSubDiv004
     * @tc.desc Verify Long(int MIN) sub Long(long 0) preserves int min value as string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossSubDiv004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(CSD_INT_MIN).sub(new Long(CSD_L_0));
      expect(result.toString()).assertEqual("-2147483648");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_SUBDIV_0500
     * @tc.name testLongCrossSubDiv005
     * @tc.desc Verify Long(int 127) sub Long(Long.MAX_VALUE) equals 127 - Long.MAX_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossSubDiv005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(CSD_INT_127).sub(new Long(Long.MAX_VALUE));
      const expected: long = (CSD_INT_127 as long) - Long.MAX_VALUE;
      expect(result.toLong()).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_SUBDIV_0600
     * @tc.name testLongCrossSubDiv006
     * @tc.desc Verify Long(float 0.0 → long 0) sub Long(long 0) returns "0"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossSubDiv006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(CSD_L_FLOAT_0).sub(new Long(CSD_L_0));
      expect(result.toString()).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_SUBDIV_0700
     * @tc.name testLongCrossSubDiv007
     * @tc.desc Verify Long(float 1.0 → long 1) sub Long(long 0) returns "1"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossSubDiv007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(CSD_L_FLOAT_1).sub(new Long(CSD_L_0));
      expect(result.toString()).assertEqual("1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_SUBDIV_0800
     * @tc.name testLongCrossSubDiv008
     * @tc.desc Verify Long(double 0.0 → long 0) sub Long(long 0) returns "0"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossSubDiv008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(CSD_L_DOUBLE_0).sub(new Long(CSD_L_0));
      expect(result.toString()).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_SUBDIV_0900
     * @tc.name testLongCrossSubDiv009
     * @tc.desc Verify Long(char 'A' code 65) sub Long(long 0) returns "65" (char code point preserved)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossSubDiv009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(CSD_L_FROM_CHAR_A).sub(new Long(CSD_L_0));
      expect(result.toString()).assertEqual("65");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_SUBDIV_1000
     * @tc.name testLongCrossSubDiv010
     * @tc.desc Verify Long(char 'A' code 65) sub Long(long 1) returns "64"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossSubDiv010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(CSD_L_FROM_CHAR_A).sub(new Long(CSD_L_1));
      expect(result.toString()).assertEqual("64");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_SUBDIV_1100
     * @tc.name testLongCrossSubDiv011
     * @tc.desc Verify Long(int 0) div Long(long 1) returns "0" (zero divided, int-sourced)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossSubDiv011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(CSD_INT_0).div(new Long(CSD_L_1));
      expect(result.toString()).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_SUBDIV_1200
     * @tc.name testLongCrossSubDiv012
     * @tc.desc Verify Long(int 127) div Long(long 1) returns "127" (identity division, int-sourced)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossSubDiv012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(CSD_INT_127).div(new Long(CSD_L_1));
      expect(result.toString()).assertEqual("127");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_SUBDIV_1300
     * @tc.name testLongCrossSubDiv013
     * @tc.desc Verify Long(int -128) div Long(long 1) preserves byte min negative value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossSubDiv013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(CSD_INT_NEG_128).div(new Long(CSD_L_1));
      expect(result.toString()).assertEqual("-128");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_SUBDIV_1400
     * @tc.name testLongCrossSubDiv014
     * @tc.desc Verify Long(int 0) div Long(Long.MAX_VALUE) returns "0" (zero divided by extreme divisor)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossSubDiv014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(CSD_INT_0).div(new Long(Long.MAX_VALUE));
      expect(result.toString()).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_SUBDIV_1500
     * @tc.name testLongCrossSubDiv015
     * @tc.desc Verify Long(int 127) div Long(Long.MAX_VALUE) returns "0" (divisor exceeds dividend magnitude)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossSubDiv015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(CSD_INT_127).div(new Long(Long.MAX_VALUE));
      expect(result.toString()).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_SUBDIV_1600
     * @tc.name testLongCrossSubDiv016
     * @tc.desc Verify Long(float 0.0 → long 0) div Long(long 1) returns "0"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossSubDiv016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(CSD_L_FLOAT_0).div(new Long(CSD_L_1));
      expect(result.toString()).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_SUBDIV_1700
     * @tc.name testLongCrossSubDiv017
     * @tc.desc Verify Long(float 1.0 → long 1) div Long(long 1) returns "1"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossSubDiv017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(CSD_L_FLOAT_1).div(new Long(CSD_L_1));
      expect(result.toString()).assertEqual("1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_SUBDIV_1800
     * @tc.name testLongCrossSubDiv018
     * @tc.desc Verify Long(double 0.0 → long 0) div Long(long 1) returns "0"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossSubDiv018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(CSD_L_DOUBLE_0).div(new Long(CSD_L_1));
      expect(result.toString()).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_SUBDIV_1900
     * @tc.name testLongCrossSubDiv019
     * @tc.desc Verify Long(char 'A' code 65) div Long(long 1) returns "65"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossSubDiv019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(CSD_L_FROM_CHAR_A).div(new Long(CSD_L_1));
      expect(result.toString()).assertEqual("65");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_SUBDIV_2000
     * @tc.name testLongCrossSubDiv020
     * @tc.desc Verify Long(char '0' code 48) div Long(long 1) returns "48"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossSubDiv020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(CSD_L_FROM_CHAR_0).div(new Long(CSD_L_1));
      expect(result.toString()).assertEqual("48");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_SUBDIV_2100
     * @tc.name testLongCrossSubDiv021
     * @tc.desc Verify Long(int 0) div Long(Long.MIN_VALUE) returns "0" without throwing
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossSubDiv021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(CSD_INT_0).div(new Long(Long.MIN_VALUE));
      expect(result.toString()).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_SUBDIV_2200
     * @tc.name testLongCrossSubDiv022
     * @tc.desc Verify new Long(int 127).toByte() returns 127 (byte max within range)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossSubDiv022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = new Long(CSD_INT_127).toByte();
      expect(result).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_SUBDIV_2300
     * @tc.name testLongCrossSubDiv023
     * @tc.desc Verify new Long(int -128).toByte() returns -128 (byte min within range)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossSubDiv023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = new Long(CSD_INT_NEG_128).toByte();
      expect(result).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_SUBDIV_2400
     * @tc.name testLongCrossSubDiv024
     * @tc.desc Verify new Long(256).toByte() truncates to 0 (overflow wraps to zero in byte range)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossSubDiv024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = new Long(256).toByte();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_SUBDIV_2500
     * @tc.name testLongCrossSubDiv025
     * @tc.desc Verify new Long(int 32767).toShort() returns 32767 (short max within range)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossSubDiv025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = new Long(CSD_INT_32767).toShort();
      expect(result).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_SUBDIV_2600
     * @tc.name testLongCrossSubDiv026
     * @tc.desc Verify new Long(int -32768).toShort() returns -32768 (short min within range)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossSubDiv026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = new Long(CSD_INT_NEG_32768).toShort();
      expect(result).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_SUBDIV_2700
     * @tc.name testLongCrossSubDiv027
     * @tc.desc Verify new Long(32768).toShort() truncates to -32768 (overflow wraps around)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossSubDiv027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = new Long(32768).toShort();
      expect(result).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_SUBDIV_2800
     * @tc.name testLongCrossSubDiv028
     * @tc.desc Verify new Long(int MAX).toInt() preserves 2147483647
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossSubDiv028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = new Long(CSD_INT_MAX).toInt();
      expect(result).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_SUBDIV_2900
     * @tc.name testLongCrossSubDiv029
     * @tc.desc Verify new Long(int MIN).toInt() preserves -2147483648
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossSubDiv029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = new Long(CSD_INT_MIN).toInt();
      expect(result).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_SUBDIV_3000
     * @tc.name testLongCrossSubDiv030
     * @tc.desc Verify new Long(Long.MAX_VALUE).toInt() truncates to finite int (low 32 bits)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossSubDiv030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = new Long(Long.MAX_VALUE).toInt();
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_SUBDIV_3100
     * @tc.name testLongCrossSubDiv031
     * @tc.desc Verify new Long(Long.MIN_VALUE).toInt() truncates to finite int (low 32 bits)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossSubDiv031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = new Long(Long.MIN_VALUE).toInt();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_SUBDIV_3200
     * @tc.name testLongCrossSubDiv032
     * @tc.desc Verify new Long(1).toDouble() returns finite double preserving value 1.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossSubDiv032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(1);
      const result: double = value.toDouble();
      expect(result).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_SUBDIV_3300
     * @tc.name testLongCrossSubDiv033
     * @tc.desc Verify new Long(1).toFloat() returns finite float value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossSubDiv033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(1);
      const result: float = value.toFloat();
      expect(result).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_SUBDIV_3400
     * @tc.name testLongCrossSubDiv034
     * @tc.desc Verify new Long(65).toChar() returns char with code 65 ('A')
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossSubDiv034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = new Long(65).toChar();
      expect(result).assertEqual(c'A');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_SUBDIV_3500
     * @tc.name testLongCrossSubDiv035
     * @tc.desc Verify new Long(48).toChar() returns char with code 48 ('0')
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossSubDiv035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = new Long(48).toChar();
      expect(result).assertEqual(c'0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_SUBDIV_3600
     * @tc.name testLongCrossSubDiv036
     * @tc.desc Verify new Long(-1).toChar() wraps around to max char (0xFFFF)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossSubDiv036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: char = new Long(-1).toChar();
      expect(result).assertEqual(c'￿');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_SUBDIV_3700
     * @tc.name testLongCrossSubDiv037
     * @tc.desc Verify Long(int 100) sub Long(int 30) returns "70" (both operands int-sourced)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossSubDiv037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(CSD_INT_100).sub(new Long(CSD_INT_30));
      expect(result.toString()).assertEqual("70");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_SUBDIV_3800
     * @tc.name testLongCrossSubDiv038
     * @tc.desc Verify Long(short 200) sub Long(short 50) returns "150" (both operands short-sourced)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossSubDiv038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(CSD_SHORT_200).sub(new Long(CSD_SHORT_50));
      expect(result.toString()).assertEqual("150");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_SUBDIV_3900
     * @tc.name testLongCrossSubDiv039
     * @tc.desc Verify Long(int MAX) sub Long(short 32767) preserves int-short cross-type sub
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossSubDiv039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const expected: string = Long.toString((CSD_INT_MAX - CSD_SHORT_32767) as long);
      const result: Long = new Long(CSD_INT_MAX).sub(new Long(CSD_SHORT_32767));
      expect(result.toString()).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_SUBDIV_4000
     * @tc.name testLongCrossSubDiv040
     * @tc.desc Verify Long(short 0) sub Long(int -1) returns "1" (short-int cross-type sub with negative)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossSubDiv040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(CSD_SHORT_0).sub(new Long(CSD_INT_NEG_1));
      expect(result.toString()).assertEqual("1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_SUBDIV_4100
     * @tc.name testLongCrossSubDiv041
     * @tc.desc Verify Long(int 1000) div Long(int 100) returns "10" (both operands int-sourced)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossSubDiv041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(CSD_INT_1000).div(new Long(CSD_INT_100));
      expect(result.toString()).assertEqual("10");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_SUBDIV_4200
     * @tc.name testLongCrossSubDiv042
     * @tc.desc Verify Long(short 200) div Long(short 50) returns "4" (both operands short-sourced)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossSubDiv042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(CSD_SHORT_200).div(new Long(CSD_SHORT_50));
      expect(result.toString()).assertEqual("4");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_SUBDIV_4300
     * @tc.name testLongCrossSubDiv043
     * @tc.desc Verify Long(int 1000) div Long(short 100) returns "10" (int-short cross-type div)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossSubDiv043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(CSD_INT_1000).div(new Long(CSD_SHORT_100));
      expect(result.toString()).assertEqual("10");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_SUBDIV_4400
     * @tc.name testLongCrossSubDiv044
     * @tc.desc Verify Long(short 100) div Long(int 30) returns "3" (short-int cross-type integer div truncation)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossSubDiv044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(CSD_SHORT_100).div(new Long(CSD_INT_30));
      expect(result.toString()).assertEqual("3");
    });
  });
}
