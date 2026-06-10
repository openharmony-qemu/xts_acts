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

import { beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function LongCrossTypeSubDivTest(): void {
  describe('LongCrossTypeSubDivTest', () => {
    beforeEach(async () => { await Utils.msSleep(30); });

    const CSD_INT_0: int = 0;
    const CSD_INT_127: int = 127;
    const CSD_INT_NEG_128: int = -128;
    const CSD_INT_32767: int = 32767;
    const CSD_INT_NEG_32768: int = -32768;
    const CSD_INT_MAX: int = 2147483647;
    const CSD_INT_MIN: int = -2147483648;

    // long-typed variables covering values from float/double/char ranges
    const CSD_L_FLOAT_0: long = 0;          // float 0.0 → long 0
    const CSD_L_FLOAT_1: long = 1;          // float 1.0 → long 1
    const CSD_L_DOUBLE_0: long = 0;         // double 0.0 → long 0
    const CSD_L_FROM_CHAR_A: long = 65;     // char 'A' code point
    const CSD_L_FROM_CHAR_0: long = 48;     // char '0' code point

    const CSD_L_0: long = 0;
    const CSD_L_1: long = 1;

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_SUB2_0100
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_SUB2_0200
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_SUB2_0300
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_SUB2_0400
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_SUB2_0500
     * @tc.name testLongCrossSubDiv005
     * @tc.desc Verify Long(int 127) sub Long(Long.MAX_VALUE) returns Long instance (extreme operand)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossSubDiv005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Long = new Long(CSD_INT_127).sub(new Long(Long.MAX_VALUE));
      expect(result instanceof Long).assertTrue();
      expect(result.toString()).assertEqual("-9223372036854775680");
    });

    // ── Cross-type sub: float/double/char-range sourced Long ──

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_SUB2_0600
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_SUB2_0700
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_SUB2_0800
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_SUB2_0900
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_SUB2_1000
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_DIV2_0100
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_DIV2_0200
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_DIV2_0300
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_DIV2_0400
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_DIV2_0500
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

    // ── Cross-type div: float/double/char-range sourced Long ──

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_DIV2_0600
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_DIV2_0700
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_DIV2_0800
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_DIV2_0900
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_DIV2_1000
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_DIV2_1100
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_CONV_0100
     * @tc.name testLongCrossSubDiv022
     * @tc.desc Verify new Long(int 127).toByte() returns 127 (byte max within range)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossSubDiv022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = new Long(CSD_INT_127).toByte();
      expect(result === 127).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_CONV_0200
     * @tc.name testLongCrossSubDiv023
     * @tc.desc Verify new Long(int -128).toByte() returns -128 (byte min within range)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossSubDiv023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = new Long(CSD_INT_NEG_128).toByte();
      expect(result === -128).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_CONV_0300
     * @tc.name testLongCrossSubDiv024
     * @tc.desc Verify new Long(256).toByte() truncates to 0 (overflow wraps to zero in byte range)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossSubDiv024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = new Long(256).toByte();
      expect(result === 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_CONV_0400
     * @tc.name testLongCrossSubDiv025
     * @tc.desc Verify new Long(int 32767).toShort() returns 32767 (short max within range)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossSubDiv025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = new Long(CSD_INT_32767).toShort();
      expect(result === 32767).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_CONV_0500
     * @tc.name testLongCrossSubDiv026
     * @tc.desc Verify new Long(int -32768).toShort() returns -32768 (short min within range)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossSubDiv026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = new Long(CSD_INT_NEG_32768).toShort();
      expect(result === -32768).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_CONV_0600
     * @tc.name testLongCrossSubDiv027
     * @tc.desc Verify new Long(32768).toShort() truncates to -32768 (overflow wraps around)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossSubDiv027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = new Long(32768).toShort();
      expect(result === -32768).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_CONV_0700
     * @tc.name testLongCrossSubDiv028
     * @tc.desc Verify new Long(int MAX).toInt() preserves 2147483647
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossSubDiv028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = new Long(CSD_INT_MAX).toInt();
      expect(result === 2147483647).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_CONV_0800
     * @tc.name testLongCrossSubDiv029
     * @tc.desc Verify new Long(int MIN).toInt() preserves -2147483648
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossSubDiv029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = new Long(CSD_INT_MIN).toInt();
      expect(result === -2147483648).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_CONV_0900
     * @tc.name testLongCrossSubDiv030
     * @tc.desc Verify new Long(Long.MAX_VALUE).toInt() truncates to finite int (low 32 bits)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossSubDiv030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = new Long(Long.MAX_VALUE).toInt();
      expect(result === -1).assertTrue();  // MAX_VALUE low 32 bits = -1 as int
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_CONV_1000
     * @tc.name testLongCrossSubDiv031
     * @tc.desc Verify new Long(Long.MIN_VALUE).toInt() truncates to finite int (low 32 bits)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossSubDiv031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: int = new Long(Long.MIN_VALUE).toInt();
      expect(result === 0).assertTrue();  // MIN_VALUE low 32 bits = 0 as int
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_CONV_1100
     * @tc.name testLongCrossSubDiv032
     * @tc.desc Verify new Long(1).toDouble() returns finite double preserving value 1.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossSubDiv032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(1);
      const result: double = value.toDouble();
      expect(result === 1.0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_CONV_1200
     * @tc.name testLongCrossSubDiv033
     * @tc.desc Verify new Long(1).toFloat() returns finite float value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossSubDiv033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(1);
      const result: float = value.toFloat();
      expect(result === 1.0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_CONV_1300
     * @tc.name testLongCrossSubDiv034
     * @tc.desc Verify new Long(65).toChar() returns char with code 65 ('A')
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossSubDiv034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(65);
      let toCharThrew: boolean = false;
      try {
        const result: char = value.toChar();
        expect(result === c'A').assertTrue();
      } catch (e) {
        console.error(e.message);
        toCharThrew = true;
      }
      expect(toCharThrew).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_CONV_1400
     * @tc.name testLongCrossSubDiv035
     * @tc.desc Verify new Long(48).toChar() returns char with code 48 ('0')
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossSubDiv035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(48);
      let toCharThrew: boolean = false;
      try {
        const result: char = value.toChar();
        expect(result === c'0').assertTrue();
      } catch (e) {
        console.error(e.message);
        toCharThrew = true;
      }
      expect(toCharThrew).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_CONV_1500
     * @tc.name testLongCrossSubDiv036
     * @tc.desc Verify new Long(-1).toChar() wraps around to max char (negative truncation)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossSubDiv036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: Long = new Long(-1);
      let toCharThrew: boolean = false;
      try {
        const result: char = value.toChar();
      } catch (e) {
        console.error(e.message);
        toCharThrew = true;
      }
      expect(toCharThrew).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_LONG_CROSS_DIV2_1600
     * @tc.name testLongCrossSubDiv037
     * @tc.desc Verify Long.div(0) throws an exception
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testLongCrossSubDiv037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Long(CSD_L_1).div(new Long(CSD_L_0));
        expect(false).assertTrue();
      } catch (e) {
        expect(e instanceof Error).assertTrue();
      }
    });
  });
}
