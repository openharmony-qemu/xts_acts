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
import Utils from "../Util.test";

class ParseIntObj {
  prop: string;
  radix: int;

  constructor(p: string, r: int) {
    this.prop = p;
    this.radix = r;
  }
}

export default function GlobalParseIntPart_1Test(): void {
  describe("GlobalParseIntPart_1Test", (): void => {
    beforeAll(() => {

    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {

    });

    afterAll(() => {

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0010
     * @tc.name testGlobalParseIntTest001
     * @tc.desc Verify parseInt on non-numeric string returns NaN, isNaN returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = '';
      for (let i: int = 0; i < 10; i++) {
        s += 'x';
      }
      const result: number = parseInt(s);
      const resultIsNaN: boolean = isNaN(result);
      expect(resultIsNaN).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0020
     * @tc.name testGlobalParseIntTest002
     * @tc.desc parseInt("42", -2147483648) returns NaN (radix out of [2, 36])
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt("42", Int.MIN_VALUE);
      const resultIsNaN: boolean = isNaN(result);
      expect(resultIsNaN).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0030
     * @tc.name testGlobalParseIntTest003
     * @tc.desc parseInt("10", 10) === parseInt("10", 16) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: boolean = parseInt("10", 10) === parseInt("10", 16);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0040
     * @tc.name testGlobalParseIntTest004
     * @tc.desc parseInt("10", Number.NaN) returns 10 (NaN radix defaults to 10)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt("10", Number.NaN);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0050
     * @tc.name testGlobalParseIntTest005
     * @tc.desc parseInt("10", Number.POSITIVE_INFINITY) returns 10 (Infinity radix defaults to 10)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt("10", Number.POSITIVE_INFINITY);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0060
     * @tc.name testGlobalParseIntTest006
     * @tc.desc parseInt("10", -Number.POSITIVE_INFINITY) returns 10
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt("10", -Number.POSITIVE_INFINITY);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0070
     * @tc.name testGlobalParseIntTest007
     * @tc.desc parseInt("42", 10.0) returns 42
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number = parseInt("42", 10.0);
      expect(r).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0080
     * @tc.name testGlobalParseIntTest008
     * @tc.desc parseInt("42", r) returns 42
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: int = 10;
      const result: number = parseInt("42", r);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0090
     * @tc.name testGlobalParseIntTest009
     * @tc.desc parseInt("10", 1.5) returns NaN (radix out of [2, 36])
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number = 1.5;
      const result: number = parseInt("10", r);
      const resultIsNaN: boolean = isNaN(result);
      expect(resultIsNaN).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0100
     * @tc.name testGlobalParseIntTest010
     * @tc.desc parseInt(" -42", r) returns -42
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: int = 10;
      const result: number = parseInt("  -42", r);
      expect(result).assertEqual(-42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0110
     * @tc.name testGlobalParseIntTest011
     * @tc.desc parseInt("10", Number.MAX_VALUE) returns Float.NaN (radix not in 2-36)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt("10", Number.MAX_VALUE);
      const r: boolean = isNaN(result);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0120
     * @tc.name testGlobalParseIntTest012
     * @tc.desc parseInt("10", Number.MIN_VALUE) returns Float.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt("10", Number.MIN_VALUE);
      const r: boolean = isNaN(result);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0130
     * @tc.name testGlobalParseIntTest013
     * @tc.desc parseInt("10", -Number.MAX_VALUE) returns Float.NaN (radix not in 2-36)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt("10", -Number.MAX_VALUE);
      const r: boolean = isNaN(result);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0140
     * @tc.name testGlobalParseIntTest014
     * @tc.desc parseInt("10", -Number.MIN_VALUE) returns Float.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt("10", -Number.MIN_VALUE);
      const r: boolean = isNaN(result);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0150
     * @tc.name testGlobalParseIntTest015
     * @tc.desc parseInt("42") with default radix equals parseInt("42", 10) with explicit radix
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: number = parseInt("42");
      const b: number = parseInt("42", 10);
      expect(a).assertEqual(b);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0160
     * @tc.name testGlobalParseIntTest016
     * @tc.desc parseInt(" 42 ", 8) returns 34
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt("  42  ", 8);
      expect(result).assertEqual(34);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0170
     * @tc.name testGlobalParseIntTest017
     * @tc.desc parseInt("2147483647", 16) returns 142929835591
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: number = parseInt(String(Int.MAX_VALUE), 16);
      expect(val).assertEqual(0x2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0180
     * @tc.name testGlobalParseIntTest018
     * @tc.desc parseInt("2147483647 ") returns 2147483647
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: number = parseInt(String(Int.MAX_VALUE) + "  ");
      expect(val).assertEqual(Int.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0190
     * @tc.name testGlobalParseIntTest019
     * @tc.desc parseInt(" -2147483647") returns -2147483647
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: number = parseInt("  " + String(Int.MIN_VALUE + 1));
      expect(val).assertEqual(-Int.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0200
     * @tc.name testGlobalParseIntTest020
     * @tc.desc parseInt("") returns Float.NaN for empty string input
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt('');
      const resultIsNaN: boolean = isNaN(result);
      expect(resultIsNaN).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0210
     * @tc.name testGlobalParseIntTest021
     * @tc.desc parseInt("   ") returns Float.NaN for whitespace-only input
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt("   ");
      const resultIsNaN: boolean = isNaN(result);
      expect(resultIsNaN).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0220
     * @tc.name testGlobalParseIntTest022
     * @tc.desc parseInt('1e5') stops at 'e', returns 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt("1e5");
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0230
     * @tc.name testGlobalParseIntTest023
     * @tc.desc parseInt("111", 2) returns 7 for binary radix
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt("111", 2);
      expect(result).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0240
     * @tc.name testGlobalParseIntTest024
     * @tc.desc parseInt("77", 8) returns 63 for octal radix
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt("77", 8);
      expect(result).assertEqual(63);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0250
     * @tc.name testGlobalParseIntTest025
     * @tc.desc parseInt("z", 36) returns 35 for max radix digit
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt('z', 36);
      expect(result).assertEqual(35);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0260
     * @tc.name testGlobalParseIntTest026
     * @tc.desc parseInt("99", 0) returns 99 with radix=0 using default rules
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt("99", 0);
      expect(result).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0270
     * @tc.name testGlobalParseIntTest027
     * @tc.desc parseInt("10", 1) returns Float.NaN for invalid radix 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt("10", 1);
      const resultIsNaN: boolean = isNaN(result);
      expect(resultIsNaN).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0280
     * @tc.name testGlobalParseIntTest028
     * @tc.desc parseInt("55", 37) returns Float.NaN for radix out of range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt("55", 37);
      const resultIsNaN: boolean = isNaN(result);
      expect(resultIsNaN).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0290
     * @tc.name testGlobalParseIntTest029
     * @tc.desc parseInt("0xFF", 16) with explicit int radix=16 returns 255
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt("0xFF", 16);
      expect(result).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0300
     * @tc.name testGlobalParseIntTest030
     * @tc.desc parseInt("ff", 16) with lowercase hex and int radix returns 255
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt("ff", 16);
      expect(result).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0310
     * @tc.name testGlobalParseIntTest031
     * @tc.desc parseInt("-1e3", 10) with negative scientific notation returns -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt("-1e3", 10);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0320
     * @tc.name testGlobalParseIntTest032
     * @tc.desc parseInt("", 16) with empty string and int radix returns Float.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt('', 16);
      const resultIsNaN: boolean = isNaN(result);
      expect(resultIsNaN).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0330
     * @tc.name testGlobalParseIntTest033
     * @tc.desc parseInt("  ", 10) with whitespace-only string and int radix returns Float.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt("  ", 10);
      const resultIsNaN: boolean = isNaN(result);
      expect(resultIsNaN).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0340
     * @tc.name testGlobalParseIntTest034
     * @tc.desc parseInt('10', 2.5) truncates radix to 2, '10' in base 2 = 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt("10", 2.5);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0350
     * @tc.name testGlobalParseIntTest035
     * @tc.desc parseInt('42', 2) with invalid digit '4' in radix=2 returns Float.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt("42", 2);
      const resultIsNaN: boolean = isNaN(result);
      expect(resultIsNaN).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0360
     * @tc.name testGlobalParseIntTest036
     * @tc.desc parseInt("A", 11) with letter digit at radix boundary returns 10
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt('A', 11);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0370
     * @tc.name testGlobalParseIntTest037
     * @tc.desc parseInt("A", 10) with letter digit out of radix range returns Float.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt('A', 10);
      const resultIsNaN: boolean = isNaN(result);
      expect(resultIsNaN).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0380
     * @tc.name testGlobalParseIntTest038
     * @tc.desc parseInt("-0", 10) returns negative zero, verified via 1/result = -Float.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt("-0", 10);
      expect(1 / result).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0390
     * @tc.name testGlobalParseIntTest039
     * @tc.desc parseInt("3.14", 16) stops at '.' returns 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt("3.14", 16);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0400
     * @tc.name testGlobalParseIntTest040
     * @tc.desc parseInt("0x1A", 16) with mixed hex digits returns 26
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt("0x1A", 16);
      expect(result).assertEqual(26);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0410
     * @tc.name testGlobalParseIntTest041
     * @tc.desc parseInt("42abc") returns 42 truncating trailing non-numeric chars
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt("42abc");
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0420
     * @tc.name testGlobalParseIntTest042
     * @tc.desc parseInt("10", r) for radices 3-9 returns radix value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: number = parseInt("10", 3);
      expect(r1).assertEqual(3);
      const r2: number = parseInt("10", 4);
      expect(r2).assertEqual(4);
      const r3: number = parseInt("10", 5);
      expect(r3).assertEqual(5);
      const r4: number = parseInt("10", 6);
      expect(r4).assertEqual(6);
      const r5: number = parseInt("10", 7);
      expect(r5).assertEqual(7);
      const r6: number = parseInt("10", 8);
      expect(r6).assertEqual(8);
      const r7: number = parseInt("10", 9);
      expect(r7).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0430
     * @tc.name testGlobalParseIntTest043
     * @tc.desc parseInt("10", r) for radices 11-35 returns radix value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const radices: int[] = [
        11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35,
      ];
      for (let i: int = 0; i < radices.length; i++) {
        const r: number = parseInt("10", radices[i]);
        expect(r).assertEqual(radices[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0440
     * @tc.name testGlobalParseIntTest044
     * @tc.desc parseInt("0XFF") returns 255 for uppercase hex prefix
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number = parseInt("0XFF");
      expect(r).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0450
     * @tc.name testGlobalParseIntTest045
     * @tc.desc parseInt("0o77") returns 0 (octal 0o prefix not supported, stops at 'o')
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number = parseInt("0o77");
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0460
     * @tc.name testGlobalParseIntTest046
     * @tc.desc parseInt("0B111") returns 0 (uppercase binary prefix not supported)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number = parseInt("0B111");
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0470
     * @tc.name testGlobalParseIntTest047
     * @tc.desc parseInt("  42") returns 42 (leading spaces ignored)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt("  42");
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0480
     * @tc.name testGlobalParseIntTest048
     * @tc.desc parseInt("101", 3) returns 10 (base-3 parsing)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt("101", 3);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0490
     * @tc.name testGlobalParseIntTest049
     * @tc.desc parseInt("zz", 36) returns 1295 (base-36 highest digits)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt("zz", 36);
      expect(result).assertEqual(1295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0500
     * @tc.name testGlobalParseIntTest050
     * @tc.desc parseInt("9", 8) returns Float.NaN (digit out of range for radix 8)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt('9', 8);
      const r: boolean = isNaN(result);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0510
     * @tc.name testGlobalParseIntTest051
     * @tc.desc parseInt("42", 37) returns Float.NaN (radix out of range)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt("42", 37);
      const r: boolean = isNaN(result);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0520
     * @tc.name testGlobalParseIntTest052
     * @tc.desc parseInt("42", -1) returns Float.NaN (negative radix)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt("42", -1);
      const r: boolean = isNaN(result);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0530
     * @tc.name testGlobalParseIntTest053
     * @tc.desc parseInt("3.14") returns 3 (truncates at decimal point)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt("3.14");
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0540
     * @tc.name testGlobalParseIntTest054
     * @tc.desc parseInt("1e3") returns 1 (stops at exponent marker)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt("1e3");
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0550
     * @tc.name testGlobalParseIntTest055
     * @tc.desc parseInt("+42") assertEqual(42)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt("+42");
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0560
     * @tc.name testGlobalParseIntTest056
     * @tc.desc parseInt("  -42") returns -42 (leading space and sign)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt("  -42");
      expect(result).assertEqual(-42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0570
     * @tc.name testGlobalParseIntTest057
     * @tc.desc parseInt("12+34") returns 12 (stops at embedded plus)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt("12+34");
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0580
     * @tc.name testGlobalParseIntTest058
     * @tc.desc parseInt("12/34") returns 12 (stops at slash)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt("12/34");
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0590
     * @tc.name testGlobalParseIntTest059
     * @tc.desc parseInt("1, 234") returns 1 (stops at comma)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt("1, 234");
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0600
     * @tc.name testGlobalParseIntTest060
     * @tc.desc parseInt("_42") returns Float.NaN (leading underscore)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt("_42");
      const r: boolean = isNaN(result);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0610
     * @tc.name testGlobalParseIntTest061
     * @tc.desc parseInt with loop: ["42", "-42", "0xFF"] returns expected values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: string[] = ["42", "-42", "0xFF"];
      const expected: number[] = [42, -42, 255];
      for (let i: int = 0; i < values.length; i = i + 1) {
        const r: number = parseInt(values[i]);
        expect(r).assertEqual(expected[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0620
     * @tc.name testGlobalParseIntTest062
     * @tc.desc parseInt("12:34") returns 12 (stops at colon)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt("12:34");
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0630
     * @tc.name testGlobalParseIntTest063
     * @tc.desc parseInt("\t\n  42") returns 42 (mixed whitespace prefix)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt("\t\n  42");
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0640
     * @tc.name testGlobalParseIntTest064
     * @tc.desc parseInt("101", 2) returns 5 (binary radix explicit)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt("101", 2);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0650
     * @tc.name testGlobalParseIntTest065
     * @tc.desc parseInt("FF", 16) assertEqual(255)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt("FF", 16);
      expect(result).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0660
     * @tc.name testGlobalParseIntTest066
     * @tc.desc parseInt("0xFF", 10) assertEqual(0)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt("0xFF", 10);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0670
     * @tc.name testGlobalParseIntTest067
     * @tc.desc parseInt("08", 10) returns 8 (not octal in radix 10)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt("08", 10);
      expect(result).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0680
     * @tc.name testGlobalParseIntTest068
     * @tc.desc parseInt("42", 0) returns 42 (radix 0 uses default rules)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt("42", 0);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0690
     * @tc.name testGlobalParseIntTest069
     * @tc.desc parseInt(null as String, 10) throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        parseInt(null as String, 10);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0700
     * @tc.name testGlobalParseIntTest070
     * @tc.desc parseInt("@#$") returns NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt("@#$");
      const r: boolean = isNaN(result);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0710
     * @tc.name testGlobalParseIntTest071
     * @tc.desc parseInt(fullwidth digits) returns Float.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt("１２３");
      const r: boolean = isNaN(result);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0720
     * @tc.name testGlobalParseIntTest072
     * @tc.desc parseInt(Arabic-Indic digits) returns Float.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt("١٢", 10);
      const r: boolean = isNaN(result);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0730
     * @tc.name testGlobalParseIntTest073
     * @tc.desc parseInt(" 42", 10) returns 42 (nonbreaking space prefix)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt(" 42", 10);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0740
     * @tc.name testGlobalParseIntTest074
     * @tc.desc parseInt("\\f15", 10) returns 15 (form feed whitespace prefix)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt("\f15", 10);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0750
     * @tc.name testGlobalParseIntTest075
     * @tc.desc parseInt("abc42") returns Float.NaN (letter-prefix before digits)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt("abc42");
      const r: boolean = isNaN(result);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0760
     * @tc.name testGlobalParseIntTest076
     * @tc.desc parseInt(".75", 10) returns Float.NaN (leading decimal point)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt(".75", 10);
      const r: boolean = isNaN(result);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0770
     * @tc.name testGlobalParseIntTest077
     * @tc.desc parseInt("9007199254740991") equals Number.MAX_SAFE_INTEGER
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt(String(Number.MAX_SAFE_INTEGER));
      expect(result).assertEqual(Number.MAX_SAFE_INTEGER);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0780
     * @tc.name testGlobalParseIntTest078
     * @tc.desc parseInt("Aa", 11) returns 120 (mixed case alphabetic digits in base 11)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt("Aa", 11);
      expect(result).assertEqual(120);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0790
     * @tc.name testGlobalParseIntTest079
     * @tc.desc parseInt("12_34", 10) returns 12 (truncates at underscore separator)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt("12_34", 10);
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0800
     * @tc.name testGlobalParseIntTest080
     * @tc.desc parseInt("0x", 16) returns Float.NaN (hex prefix only, no digits)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt("0x", 16);
      const r: boolean = isNaN(result);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0810
     * @tc.name testGlobalParseIntTest081
     * @tc.desc parseInt("12.99", 10) returns 12 (truncates at decimal point)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt("12.99", 10);
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0820
     * @tc.name testGlobalParseIntTest082
     * @tc.desc parseInt("80000000", 16) returns 2147483648 (hex just above signed int max)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt((0x80000000).toString(16), 16);
      expect(result).assertEqual(0x80000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0830
     * @tc.name testGlobalParseIntTest083
     * @tc.desc parseInt("-80000000", 16) returns -2147483648 (negative hex signed int min)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt("-" + (0x80000000).toString(16), 16);
      expect(result).assertEqual(Int.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0840
     * @tc.name testGlobalParseIntTest084
     * @tc.desc parseInt("ffffffff", 16) returns 4294967295 (eight hex f digits)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt("ffffffff", 16);
      expect(result).assertEqual(0xFFFFFFFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0850
     * @tc.name testGlobalParseIntTest085
     * @tc.desc parseInt("10000000000000", 16) returns 4503599627370496 (2^52 hex boundary)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt((2 ** 52).toString(16), 16);
      expect(result).assertEqual(0x10000000000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0860
     * @tc.name testGlobalParseIntTest086
     * @tc.desc parseInt("42" + Chinese suffix) returns 42 (truncates at non-Latin text)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt("42测试", 10);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0870
     * @tc.name testGlobalParseIntTest087
     * @tc.desc parseInt("-2147483648", 10) returns -2147483648 (Int32 min decimal)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt(String(Int.MIN_VALUE), 10);
      expect(result).assertEqual(Int.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0880
     * @tc.name testGlobalParseIntTest088
     * @tc.desc parseInt("2147483647", 10) returns 2147483647 (Int32 max decimal)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt(String(Int.MAX_VALUE), 10);
      expect(result).assertEqual(Int.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0890
     * @tc.name testGlobalParseIntTest089
     * @tc.desc parseInt("7fffffff", 16) returns 2147483647 (hex Int32 max)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt("7fffffff", 16);
      expect(result).assertEqual(Int.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0900
     * @tc.name testGlobalParseIntTest090
     * @tc.desc parseInt("-9007199254740991", 10) returns -9007199254740991 (MIN_SAFE_INTEGER)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt(String(Number.MIN_SAFE_INTEGER), 10);
      expect(result).assertEqual(Number.MIN_SAFE_INTEGER);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0910
     * @tc.name testGlobalParseIntTest091
     * @tc.desc parseInt("-9007199254740992", 10) returns -9007199254740992 (beyond MIN_SAFE_INTEGER)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt(String(Number.MIN_SAFE_INTEGER - 1), 10);
      expect(result).assertEqual(Number.MIN_SAFE_INTEGER - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0920
     * @tc.name testGlobalParseIntTest092
     * @tc.desc parseInt("9007199254740992", 10) returns 9007199254740992 (beyond MAX_SAFE_INTEGER)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt(String(Number.MAX_SAFE_INTEGER + 1), 10);
      expect(result).assertEqual(Number.MAX_SAFE_INTEGER + 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0930
     * @tc.name testGlobalParseIntTest093
     * @tc.desc parseInt("-00042", 10) returns -42 (leading zeros with negative sign)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt("-00042", 10);
      expect(result).assertEqual(-42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0940
     * @tc.name testGlobalParseIntTest094
     * @tc.desc parseInt("+00042", 10) returns 42 (leading zeros with positive sign)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt("+00042", 10);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0950
     * @tc.name testGlobalParseIntTest095
     * @tc.desc parseInt("-0xFF") returns -255 (hex prefix with negative sign)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt("-0xFF");
      expect(result).assertEqual(-255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0960
     * @tc.name testGlobalParseIntTest096
     * @tc.desc parseInt("12-34", 10) returns 12 (stops at embedded minus)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt("12-34", 10);
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0970
     * @tc.name testGlobalParseIntTest097
     * @tc.desc parseInt("1", 2) returns 1 (single valid binary digit)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt('1', 2);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0980
     * @tc.name testGlobalParseIntTest098
     * @tc.desc parseInt("xyz", 36) returns 44027 (max radix boundary: x=33, y=34, z=35)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt("xyz", 36);
      expect(result).assertEqual(44027);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_0990
     * @tc.name testGlobalParseIntTest099
     * @tc.desc parseInt("10000000000000001", 10) may lose precision beyond MAX_SAFE_INTEGER
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt("10000000000000001", 10);
      expect(result).assertEqual(10000000000000001);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_1000
     * @tc.name testGlobalParseIntTest100
     * @tc.desc parseInt("0") assertEqual(0)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = parseInt('0');
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_1010
     * @tc.name testGlobalParseIntTest101
     * @tc.desc Verify parseInt parses three digit string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = parseInt("100");
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_1020
     * @tc.name testGlobalParseIntTest102
     * @tc.desc Verify parseInt handles large number string beyond MAX_SAFE_INTEGER
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = parseInt(String(Number.MAX_SAFE_INTEGER + 2));
      expect(result).assertEqual(Number.MAX_SAFE_INTEGER + 2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_1030
     * @tc.name testGlobalParseIntTest103
     * @tc.desc parseInt("+-42") returns NaN (alternating signs)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = parseInt("+-42");
      const r: boolean = isNaN(result);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_1040
     * @tc.name testGlobalParseIntTest104
     * @tc.desc parseInt(String(Float.NaN)) returns Float.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt(String(Float.NaN));
      expect(result).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_1050
     * @tc.name testGlobalParseIntTest105
     * @tc.desc String(parseInt("NaN")) returns "NaN"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: string = String(parseInt("NaN"));
      expect(result).assertEqual("NaN");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_1060
     * @tc.name testGlobalParseIntTest106
     * @tc.desc Verify parseInt("xyz") returns Float.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = parseInt("xyz");
      expect(result).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_1070
     * @tc.name testGlobalParseIntTest107
     * @tc.desc parseInt with radix as number type variable returns correct value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const radixNum: double = 16.0;
      const r: number = parseInt("FF", radixNum);
      expect(r).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_1080
     * @tc.name testGlobalParseIntTest108
     * @tc.desc parseInt with radix as int type variable returns correct value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const radixInt: int = 16;
      const r: number = parseInt("FF", radixInt);
      expect(r).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_1090
     * @tc.name testGlobalParseIntTest109
     * @tc.desc parseInt with invisible whitespace variants (\r, \v, \r\n)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inputs: string[] = ["\r42", "\v42", "\r\n42"];
      for (let i: int = 0; i < inputs.length; i++) {
        const r: number = parseInt(inputs[i]);
        expect(r).assertEqual(42);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_1100
     * @tc.name testGlobalParseIntTest110
     * @tc.desc parseInt with whitespace plus explicit positive sign
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: number = parseInt("  +42");
      expect(r1).assertEqual(42);
      const r2: number = parseInt("\t+42");
      expect(r2).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_1110
     * @tc.name testGlobalParseIntTest111
     * @tc.desc parseInt("-0") default radix returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt("-0");
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_1120
     * @tc.name testGlobalParseIntTest112
     * @tc.desc parseInt("+0") default radix returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt("+0");
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_1130
     * @tc.name testGlobalParseIntTest113
     * @tc.desc parseInt with massive leading zeros
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number = parseInt("000000000000000000000000000042");
      expect(r).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_1140
     * @tc.name testGlobalParseIntTest114
     * @tc.desc parseInt very long digit string (100 digits)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = '';
      for (let i: int = 0; i < 100; i++) {
        s += '1';
      }
      const r: number = parseInt(s);
      const check: boolean = isFinite(r);
      expect(check).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_1150
     * @tc.name testGlobalParseIntTest115
     * @tc.desc parseInt with emoji suffix truncates at emoji
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number = parseInt("42🔥");
      expect(r).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_1160
     * @tc.name testGlobalParseIntTest116
     * @tc.desc parseInt with Russian/Korean prefix returns Float.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: number = parseInt("тест42");
      const r2: number = parseInt("테스트42");
      expect(isNaN(r1)).assertTrue();
      expect(isNaN(r2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_1170
     * @tc.name testGlobalParseIntTest117
     * @tc.desc parseInt with XSS-injection-like string returns NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number = parseInt("<script>42</script>");
      const result: boolean = isNaN(r);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_1180
     * @tc.name testGlobalParseIntTest118
     * @tc.desc parseInt("1.5e2") stops at decimal point, returns 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number = parseInt("1.5e2");
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_1190
     * @tc.name testGlobalParseIntTest119
     * @tc.desc parseInt("-  42") negative sign followed by spaces returns NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number = parseInt("-  42");
      const result: boolean = isNaN(r);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_1200
     * @tc.name testGlobalParseIntTest120
     * @tc.desc parseInt("+0xFF") with explicit positive sign and hex prefix returns 255
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number = parseInt("+0xFF");
      expect(r).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_1210
     * @tc.name testGlobalParseIntTest121
     * @tc.desc parseInt with whitespace + key radices (2/8/10/16/36)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(parseInt("  101", 2)).assertEqual(5);
      expect(parseInt("  -77", 8)).assertEqual(-63);
      expect(parseInt("\r\n42", 10)).assertEqual(42);
      expect(parseInt("  FF", 16)).assertEqual(255);
      expect(parseInt("-z", 36)).assertEqual(-35);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_1220
     * @tc.name testGlobalParseIntTest122
     * @tc.desc parseInt boundary large values for each key radix
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r2: number = parseInt("1111111111111111", 2);
      expect(r2).assertEqual(0xFFFF);
      const r10: number = parseInt("999999999999999", 10);
      expect(r10).assertEqual(999999999999999);
      const r36: number = parseInt("zzzzzzzzzzzzz", 36);
      const check: boolean = isFinite(r36);
      expect(check).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_1230
     * @tc.name testGlobalParseIntTest123
     * @tc.desc parseInt large hex and octal boundary values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const rHex: number = parseInt("FFFFFFFFFFFFFFFF", 16);
      const checkHex: boolean = isFinite(rHex);
      expect(checkHex).assertTrue();
      const rOct: number = parseInt("7777777777777777", 8);
      const checkOct: boolean = isFinite(rOct);
      expect(checkOct).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_1240
     * @tc.name testGlobalParseIntTest124
     * @tc.desc parseInt with int radix and leading sign+whitespace combos
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(parseInt("  +42", 10)).assertEqual(42);
      expect(parseInt("\t-42", 10)).assertEqual(-42);
      expect(parseInt("  +FF", 16)).assertEqual(255);
      expect(parseInt("\t-FF", 16)).assertEqual(-255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_1250
     * @tc.name testGlobalParseIntTest125
     * @tc.desc parseInt with int radix and fullwidth digits returns NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number = parseInt("１２", 10);
      expect(isNaN(r)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_1260
     * @tc.name testGlobalParseIntTest126
     * @tc.desc parseInt with fractional number radix: in-range [2, 36] truncated (2.1->2, 2.9->2), out-of-range 1.9->NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(parseInt("10", 2.1)).assertEqual(2);
      expect(parseInt("10", 2.9)).assertEqual(2);
      expect(isNaN(parseInt("10", 1.9))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_1270
     * @tc.name testGlobalParseIntTest127
     * @tc.desc parseInt with negative fractional radix returns Float.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: number = parseInt("10", -0.5);
      expect(isNaN(r1)).assertTrue();
      const r2: number = parseInt("10", -1.5);
      expect(isNaN(r2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_1280
     * @tc.name testGlobalParseIntTest128
     * @tc.desc parseInt with Number.NEGATIVE_INFINITY radix returns 10 (ArkTS: +/-Infinity radix -> ToInt32 -> 0 -> default radix)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number = parseInt("10", Number.NEGATIVE_INFINITY);
      expect(r).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_1290
     * @tc.name testGlobalParseIntTest129
     * @tc.desc parseInt with Float constants as radix (Float.MAX_VALUE/Float.MIN_VALUE -> NaN, Float.NaN -> 10)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: number = parseInt("10", Float.MAX_VALUE);
      expect(isNaN(r1)).assertTrue();
      const r2: number = parseInt("10", Float.MIN_VALUE);
      expect(isNaN(r2)).assertTrue();
      const r3: number = parseInt("10", Float.NaN);
      expect(r3).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_1300
     * @tc.name testGlobalParseIntTest130
     * @tc.desc parseInt with Number.EPSILON radix (tiny positive -> NaN, not in 2-36)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number = parseInt("10", Number.EPSILON);
      expect(isNaN(r)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_1310
     * @tc.name testGlobalParseIntTest131
     * @tc.desc parseInt with 36.5 radix out of [2, 36] range -> NaN (ArkTS raw value range check)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number = parseInt('z', 36.5);
      expect(isNaN(r)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_1320
     * @tc.name testGlobalParseIntTest132
     * @tc.desc parseInt with radix as number variable covering Float/Number cross-type boundary
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const radixF: number = 16.0;
      const radixD: number = 16.0;
      const radixN: number = 16;
      expect(parseInt("2a", radixF)).assertEqual(42);
      expect(parseInt("2a", radixD)).assertEqual(42);
      expect(parseInt("2a", radixN)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_1330
     * @tc.name testGlobalParseIntTest133
     * @tc.desc parseInt(null as String) without radix throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        parseInt(null as String);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_1340
     * @tc.name testGlobalParseIntTest134
     * @tc.desc parseInt(null as String, 10.0) with number radix throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        parseInt(null as String, 10.0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_1350
     * @tc.name testGlobalParseIntTest135
     * @tc.desc parseInt with object property string input returns parsed value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: ParseIntObj = new ParseIntObj("42", 10);
      const result: number = parseInt(obj.prop);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_1360
     * @tc.name testGlobalParseIntTest136
     * @tc.desc parseInt with object property string and radix returns parsed value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: ParseIntObj = new ParseIntObj("2a", 16);
      const result: number = parseInt(obj.prop, obj.radix);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEINT_TEST_1370
     * @tc.name testGlobalParseIntTest137
     * @tc.desc parseInt does not mutate the original string argument
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseIntTest137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: string = "42abc";
      const result: number = parseInt(s);
      expect(result).assertEqual(42);
      expect(s).assertEqual("42abc");
    });

  });
}
