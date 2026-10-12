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
import Utils from '../Util.test';

interface CfgObj { value: string }

export default function GlobalParseFloatPart_1Test(): void {
  describe('GlobalParseFloatPart_1Test', (): void => {
    beforeAll((): void => {

    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {

    });

    afterAll((): void => {

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0010
     * @tc.name testGlobalParseFloatTest001
     * @tc.desc parseFloat(longNum) returns 1.2345678901234567e39
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const longNum: string = '1234567890123456789012345678901234567890  ';
      const result: number = parseFloat(longNum);
      expect(result).assertEqual(1.2345678901234567e39);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0020
     * @tc.name testGlobalParseFloatTest002
     * @tc.desc parseFloat("3" + ".14") concatenated returns 3.14
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: string = '3' + '.14';
      const result: number = parseFloat(s);
      expect(result).assertEqual(3.14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0030
     * @tc.name testGlobalParseFloatTest003
     * @tc.desc parseFloat(str) returns 42.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = String(42);
      const result: number = parseFloat(str);
      expect(result).assertEqual(42.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0040
     * @tc.name testGlobalParseFloatTest004
     * @tc.desc parseFloat(str) returns -Number.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = String(-Number.POSITIVE_INFINITY);
      const result: number = parseFloat(str);
      expect(result).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0050
     * @tc.name testGlobalParseFloatTest005
     * @tc.desc parseFloat(str) isNaN(result)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = String(Number.NaN);
      const result: number = parseFloat(str);
      const isNan: boolean = isNaN(result);
      expect(isNan).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0060
     * @tc.name testGlobalParseFloatTest006
     * @tc.desc parseFloat(String(i + 1)) returns 15.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum: number = 0.0;
      for (let i: int = 0; i < 5; i++) {
        sum = sum + parseFloat(String(i + 1));
      }
      expect(sum).assertEqual(15.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0070
     * @tc.name testGlobalParseFloatTest007
     * @tc.desc parseFloat(String(i)) returns 3.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [];
      for (let i: int = 0; i < 5; i++) {
        arr.push(parseFloat(String(i)));
      }
      expect(arr[3]).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0080
     * @tc.name testGlobalParseFloatTest008
     * @tc.desc parseFloat("0.5") summed three times equals 1.5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum: number = 0.0;
      for (let i: int = 0; i < 3; i++) {
        sum = sum + parseFloat('0.5');
      }
      expect(sum).assertEqual(1.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0090
     * @tc.name testGlobalParseFloatTest009
     * @tc.desc parseFloat("1.1")+parseFloat("2.2")+parseFloat("3.3") equals 6.6 within tolerance
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vals: number[] = [parseFloat('1.1'), parseFloat('2.2'), parseFloat('3.3')];
      const sum: number = vals[0] + vals[1] + vals[2];
      expect(sum).assertClose(6.6, 1e-12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0100
     * @tc.name testGlobalParseFloatTest010
     * @tc.desc parseFloat("5.0") subtracted 1.0 five times equals 0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: number = parseFloat('5.0');
      let iterations: int = 0;
      while (r > 0.0 && iterations < 10) {
        r = r - parseFloat('1.0');
        iterations++;
      }
      expect(r).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0110
     * @tc.name testGlobalParseFloatTest011
     * @tc.desc parseFloat((i * 2).toString()) returns 12.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let total: number = 0.0;
      for (let i: int = 0; i < 4; i++) {
        total = total + parseFloat((i * 2).toString());
      }
      expect(total).assertEqual(12.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0120
     * @tc.name testGlobalParseFloatTest012
     * @tc.desc parseFloat("1e-323") returns 1e-323
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseFloat('1e-323');
      expect(result).assertEqual(1e-323);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0130
     * @tc.name testGlobalParseFloatTest013
     * @tc.desc parseFloat("9223372036854775807") loses precision, approximates 9223372036854776000 (diff~0)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: number = parseFloat('9223372036854775807');
      const diff: number = a - 9223372036854776000.0;
      expect(diff).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0140
     * @tc.name testGlobalParseFloatTest014
     * @tc.desc parseFloat("0123" + ".456") returns 123.456
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseFloat('0123' + '.456');
      expect(result).assertEqual(123.456);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0150
     * @tc.name testGlobalParseFloatTest015
     * @tc.desc parseFloat("" + "3.14" + "Chinese") returns 3.14
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseFloat('' + '3.14' + '中文');
      expect(result).assertEqual(3.14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0160
     * @tc.name testGlobalParseFloatTest016
     * @tc.desc parseFloat(s) returns 3.14, input string unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: string = '3.14';
      const r: number = parseFloat(s);
      expect(s).assertEqual('3.14');
      expect(r).assertEqual(3.14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0170
     * @tc.name testGlobalParseFloatTest017
     * @tc.desc parseFloat("3.5") returns 3.5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const y: number = parseFloat('3.5');
      expect(y).assertEqual(3.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0180
     * @tc.name testGlobalParseFloatTest018
     * @tc.desc parseFloat("\"3.14\"") - quoted string is non-numeric, returns Float.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseFloat('"3.14"');
      const isNan: boolean = isNaN(result);
      expect(isNan).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0190
     * @tc.name testGlobalParseFloatTest019
     * @tc.desc parseFloat("12\"34") returns 12
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseFloat('12"34');
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0200
     * @tc.name testGlobalParseFloatTest020
     * @tc.desc parseFloat("1e2") returns 100
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: number = parseFloat('1e2');
      expect(val).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0210
     * @tc.name testGlobalParseFloatTest021
     * @tc.desc parseFloat("") returns Float.NaN for empty string input
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseFloat('');
      const resultIsNaN: boolean = isNaN(result);
      expect(resultIsNaN).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0220
     * @tc.name testGlobalParseFloatTest022
     * @tc.desc parseFloat("Infinity") returns Number.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseFloat('Infinity');
      expect(result).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0230
     * @tc.name testGlobalParseFloatTest023
     * @tc.desc parseFloat("-Infinity") returns -Number.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseFloat('-Infinity');
      expect(result).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0240
     * @tc.name testGlobalParseFloatTest024
     * @tc.desc parseFloat("NaN") returns Float.NaN value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseFloat('NaN');
      const resultIsNaN: boolean = isNaN(result);
      expect(resultIsNaN).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0250
     * @tc.name testGlobalParseFloatTest025
     * @tc.desc parseFloat("xyz") returns Float.NaN for non-numeric input
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseFloat('xyz');
      const resultIsNaN: boolean = isNaN(result);
      expect(resultIsNaN).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0260
     * @tc.name testGlobalParseFloatTest026
     * @tc.desc parseFloat("7.") returns 7 for trailing decimal point
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseFloat('7.');
      expect(result).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0270
     * @tc.name testGlobalParseFloatTest027
     * @tc.desc parseFloat(".") returns Float.NaN for single dot input
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseFloat('.');
      const resultIsNaN: boolean = isNaN(result);
      expect(resultIsNaN).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0280
     * @tc.name testGlobalParseFloatTest028
     * @tc.desc parseFloat("2.5extra") returns 2.5 truncating trailing non-numeric chars
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseFloat('2.5extra');
      expect(result).assertEqual(2.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0290
     * @tc.name testGlobalParseFloatTest029
     * @tc.desc parseFloat("0xFF") returns 0 (hex prefix not recognized)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseFloat('0xFF');
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0300
     * @tc.name testGlobalParseFloatTest030
     * @tc.desc parseFloat("0o77") returns 0 (octal prefix not recognized)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseFloat('0o77');
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0310
     * @tc.name testGlobalParseFloatTest031
     * @tc.desc parseFloat("   ") returns Float.NaN for whitespace-only input
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseFloat('   ');
      const resultIsNaN: boolean = isNaN(result);
      expect(resultIsNaN).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0320
     * @tc.name testGlobalParseFloatTest032
     * @tc.desc parseFloat("\t\n 3.14") returns 3.14 with leading control chars trimmed
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseFloat('\t\n 3.14');
      expect(result).assertEqual(3.14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0330
     * @tc.name testGlobalParseFloatTest033
     * @tc.desc parseFloat("0003.1400") returns 3.14 with leading/trailing zeros
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseFloat('0003.1400');
      expect(result).assertEqual(3.14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0340
     * @tc.name testGlobalParseFloatTest034
     * @tc.desc parseFloat("+3.14") returns 3.14 with explicit plus sign
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseFloat('+3.14');
      expect(result).assertEqual(3.14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0350
     * @tc.name testGlobalParseFloatTest035
     * @tc.desc parseFloat("1e309") returns Float.POSITIVE_INFINITY for overflow exponent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseFloat('1e309');
      expect(result).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0360
     * @tc.name testGlobalParseFloatTest036
     * @tc.desc parseFloat("-1e309") returns -Number.POSITIVE_INFINITY for negative overflow
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseFloat('-1e309');
      expect(result).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0370
     * @tc.name testGlobalParseFloatTest037
     * @tc.desc parseFloat("1e-324") returns 0 for underflow exponent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseFloat('1e-324');
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0380
     * @tc.name testGlobalParseFloatTest038
     * @tc.desc parseFloat("0.1 + 0.2") returns 0.1 (truncates at space)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseFloat('0.1 + 0.2');
      expect(result).assertEqual(0.1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0390
     * @tc.name testGlobalParseFloatTest039
     * @tc.desc parseFloat("1e-5") returns 0.00001 for negative exponent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseFloat('1e-5');
      expect(result).assertEqual(0.00001);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0400
     * @tc.name testGlobalParseFloatTest040
     * @tc.desc parseFloat("0b111") returns 0 (binary prefix not recognized)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseFloat('0b111');
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0410
     * @tc.name testGlobalParseFloatTest041
     * @tc.desc parseFloat("  3.14") returns 3.14 (leading spaces ignored)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseFloat('  3.14');
      expect(result).assertEqual(3.14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0420
     * @tc.name testGlobalParseFloatTest042
     * @tc.desc parseFloat("1e+10") returns 1e10 (signed positive exponent)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseFloat('1e+10');
      expect(result).assertEqual(1e10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0430
     * @tc.name testGlobalParseFloatTest043
     * @tc.desc parseFloat("1e-10") returns 1e-10 (signed negative exponent)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseFloat('1e-10');
      expect(result).assertEqual(1e-10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0440
     * @tc.name testGlobalParseFloatTest044
     * @tc.desc parseFloat("1e") returns 1 (trailing exponent marker ignored)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseFloat('1e');
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0450
     * @tc.name testGlobalParseFloatTest045
     * @tc.desc parseFloat("3.") returns 3 (trailing dot ignored)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseFloat('3.');
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0460
     * @tc.name testGlobalParseFloatTest046
     * @tc.desc parseFloat("42px") returns 42 (trailing unit text truncated)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseFloat('42px');
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0470
     * @tc.name testGlobalParseFloatTest047
     * @tc.desc parseFloat("+") returns Float.NaN (plus sign only)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseFloat('+');
      const r: boolean = isNaN(result);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0480
     * @tc.name testGlobalParseFloatTest048
     * @tc.desc parseFloat("-") returns Float.NaN (minus sign only)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseFloat('-');
      const r: boolean = isNaN(result);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0490
     * @tc.name testGlobalParseFloatTest049
     * @tc.desc parseFloat("12+34") returns 12 (stops at embedded plus)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseFloat('12+34');
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0500
     * @tc.name testGlobalParseFloatTest050
     * @tc.desc parseFloat("_42") returns Float.NaN (leading underscore)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseFloat('_42');
      const r: boolean = isNaN(result);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0510
     * @tc.name testGlobalParseFloatTest051
     * @tc.desc parseFloat("08") returns 8 (leading zero, not octal)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseFloat('08');
      expect(result).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0520
     * @tc.name testGlobalParseFloatTest052
     * @tc.desc parseFloat("12.e2") returns 1200 (trailing decimal before exponent)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseFloat('12.e2');
      expect(result).assertEqual(1200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0530
     * @tc.name testGlobalParseFloatTest053
     * @tc.desc parseFloat("1e0003") returns 1000 (exponent with leading zeros)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseFloat('1e0003');
      expect(result).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0540
     * @tc.name testGlobalParseFloatTest054
     * @tc.desc parseFloat("1e-0003") returns 0.001 (negative exponent with leading zeros)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseFloat('1e-0003');
      expect(result).assertEqual(0.001);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0550
     * @tc.name testGlobalParseFloatTest055
     * @tc.desc parseFloat("+.75e+2") returns 75 (signed fractional exponent)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseFloat('+.75e+2');
      expect(result).assertEqual(75);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0560
     * @tc.name testGlobalParseFloatTest056
     * @tc.desc parseFloat("-.5e2") returns -50 (negative fractional exponent)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseFloat('-.5e2');
      expect(result).assertEqual(-50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0570
     * @tc.name testGlobalParseFloatTest057
     * @tc.desc parseFloat("0x1.8p10") returns 0 (hex float notation not recognized)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseFloat('0x1.8p10');
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0580
     * @tc.name testGlobalParseFloatTest058
     * @tc.desc parseFloat("-.0001") returns -0.0001 (negative tiny decimal)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseFloat('-.0001');
      expect(result).assertEqual(-0.0001);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0590
     * @tc.name testGlobalParseFloatTest059
     * @tc.desc parseFloat with loop: [".5", "-.5", "+.5", "1.5e2"] returns expected
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: string[] = ['.5', '-.5', '+.5', '1.5e2'];
      const expected: number[] = [0.5, -0.5, 0.5, 150];
      for (let i: int = 0; i < values.length; i = i + 1) {
        const r: number = parseFloat(values[i]);
        expect(r).assertEqual(expected[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0600
     * @tc.name testGlobalParseFloatTest060
     * @tc.desc parseFloat("-0") returns negative zero (verify via 1/result)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseFloat('-0');
      expect(1.0 / result).assertEqual(-Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0610
     * @tc.name testGlobalParseFloatTest061
     * @tc.desc parseFloat("\f5.5") returns 5.5 (form feed whitespace ignored)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseFloat('\f5.5');
      expect(result).assertEqual(5.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0620
     * @tc.name testGlobalParseFloatTest062
     * @tc.desc parseFloat("42test") returns 42 (Chinese suffix truncated)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseFloat('42测试');
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0630
     * @tc.name testGlobalParseFloatTest063
     * @tc.desc parseFloat("42<emoji>") returns 42 (emoji suffix truncated)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseFloat('42😀');
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0640
     * @tc.name testGlobalParseFloatTest064
     * @tc.desc parseFloat(" 42.5") returns 42.5 (non-breaking space prefix)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseFloat(' 42.5');
      expect(result).assertEqual(42.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0650
     * @tc.name testGlobalParseFloatTest065
     * @tc.desc parseFloat("<zwsp>42.5") returns Float.NaN (zero-width space prefix rejected)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseFloat('​42.5');
      const r: boolean = isNaN(result);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0660
     * @tc.name testGlobalParseFloatTest066
     * @tc.desc parseFloat(null as String) throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        parseFloat(null as String);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0670
     * @tc.name testGlobalParseFloatTest067
     * @tc.desc parseFloat("\\r42.25") returns 42.25 (CR whitespace prefix)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseFloat('\r42.25');
      expect(result).assertEqual(42.25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0680
     * @tc.name testGlobalParseFloatTest068
     * @tc.desc parseFloat("\\n-42.25") returns -42.25 (LF whitespace prefix)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseFloat('\n-42.25');
      expect(result).assertEqual(-42.25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0690
     * @tc.name testGlobalParseFloatTest069
     * @tc.desc parseFloat("12e+") returns 12, not NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseFloat('12e+');
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0700
     * @tc.name testGlobalParseFloatTest070
     * @tc.desc parseFloat("12e-") returns 12, not NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseFloat('12e-');
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0710
     * @tc.name testGlobalParseFloatTest071
     * @tc.desc parseFloat(".5.3") returns 0.5 (truncates at second decimal point)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseFloat('.5.3');
      expect(result).assertEqual(0.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0720
     * @tc.name testGlobalParseFloatTest072
     * @tc.desc parseFloat("-3.2e2") returns -320 (negative mantissa with exponent)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseFloat('-3.2e2');
      expect(result).assertEqual(-320);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0730
     * @tc.name testGlobalParseFloatTest073
     * @tc.desc parseFloat("+1.25e2") returns 125 (signed mantissa with exponent)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseFloat('+1.25e2');
      expect(result).assertEqual(125);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0740
     * @tc.name testGlobalParseFloatTest074
     * @tc.desc parseFloat("47e1") returns 470 (two-digit mantissa with exponent)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseFloat('47e1');
      expect(result).assertEqual(470);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0750
     * @tc.name testGlobalParseFloatTest075
     * @tc.desc parseFloat("6.022e23") returns 6.022e23 (Avogadro constant form)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseFloat('6.022e23');
      expect(result).assertEqual(6.022e23);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0760
     * @tc.name testGlobalParseFloatTest076
     * @tc.desc parseFloat("5eText") returns 5 (exponent marker without exponent digits)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseFloat('5eText');
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0770
     * @tc.name testGlobalParseFloatTest077
     * @tc.desc parseFloat("000123.4500") returns 123.45 (leading and trailing zeros)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseFloat('000123.4500');
      expect(result).assertEqual(123.45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0780
     * @tc.name testGlobalParseFloatTest078
     * @tc.desc parseFloat("1.7976931348623157e+308") returns Number.MAX_VALUE (largest finite double)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseFloat('1.7976931348623157e+308');
      expect(result).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0790
     * @tc.name testGlobalParseFloatTest079
     * @tc.desc parseFloat("5e-324") returns 5e-324 (Number.MIN_VALUE, smallest positive denormalized)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseFloat('5e-324');
      expect(result).assertEqual(5e-324);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0800
     * @tc.name testGlobalParseFloatTest080
     * @tc.desc parseFloat("9007199254740991") returns 9007199254740991 (Number.MAX_SAFE_INTEGER)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseFloat('9007199254740991');
      expect(result).assertEqual(9007199254740991);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0810
     * @tc.name testGlobalParseFloatTest081
     * @tc.desc parseFloat("-9007199254740991") returns -9007199254740991 (Number.MIN_SAFE_INTEGER)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseFloat('-9007199254740991');
      expect(result).assertEqual(-9007199254740991);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0820
     * @tc.name testGlobalParseFloatTest082
     * @tc.desc parseFloat("9007199254740993") returns 9007199254740992 (precision loss above MAX_SAFE_INTEGER)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseFloat('9007199254740993');
      expect(result).assertEqual(9007199254740992);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0830
     * @tc.name testGlobalParseFloatTest083
     * @tc.desc parseFloat("-1e-324") returns -0 (underflows to negative zero, verified via 1/result)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseFloat('-1e-324');
      expect(1.0 / result).assertEqual(-Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0840
     * @tc.name testGlobalParseFloatTest084
     * @tc.desc parseFloat("0") returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat('0');
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0850
     * @tc.name testGlobalParseFloatTest085
     * @tc.desc Verify parseFloat with undefined s parameter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const undefStr: Any = undefined;
        parseFloat(undefStr as string);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0860
     * @tc.name testGlobalParseFloatTest086
     * @tc.desc parseFloat("1e-2") returns 0.01 (negative exponent notation)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat('1e-2');
      expect(result).assertEqual(0.01);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0870
     * @tc.name testGlobalParseFloatTest087
     * @tc.desc parseFloat("1e21") returns 1e21 (large positive exponent)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat('1e21');
      expect(result).assertEqual(1e21);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0880
     * @tc.name testGlobalParseFloatTest088
     * @tc.desc Verify parseFloat parses small '1e-20'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat('1e-20');
      expect(result).assertEqual(1e-20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0890
     * @tc.name testGlobalParseFloatTest089
     * @tc.desc parseFloat("null") isNaN(result)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat('null');
      const r: boolean = isNaN(result);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0900
     * @tc.name testGlobalParseFloatTest090
     * @tc.desc Verify parseFloat 'undefined' returns Float.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat('undefined');
      const r: boolean = isNaN(result);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0910
     * @tc.name testGlobalParseFloatTest091
     * @tc.desc Verify parseFloat parses '3.14e2'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat('3.14e2');
      expect(result).assertEqual(314);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0920
     * @tc.name testGlobalParseFloatTest092
     * @tc.desc Verify parseFloat '3.14%' returns 3.14
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat('3.14%');
      expect(result).assertEqual(3.14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0930
     * @tc.name testGlobalParseFloatTest093
     * @tc.desc Verify parseFloat '0o10' stops at o returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat('0o10');
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0940
     * @tc.name testGlobalParseFloatTest094
     * @tc.desc parseFloat("1e+2") returns 100 (signed positive exponent notation)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat('1e+2');
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0950
     * @tc.name testGlobalParseFloatTest095
     * @tc.desc Verify parseFloat '.5e-1' leading dot exp
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat('.5e-1');
      expect(result).assertEqual(0.05);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0960
     * @tc.name testGlobalParseFloatTest096
     * @tc.desc parseFloat("  +3.14") returns 3.14 (leading whitespace and explicit plus sign ignored)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat('  +3.14');
      expect(result).assertEqual(3.14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0970
     * @tc.name testGlobalParseFloatTest097
     * @tc.desc Verify parseFloat vertical tab prefix
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat('\u000b3.14');
      expect(result).assertEqual(3.14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0980
     * @tc.name testGlobalParseFloatTest098
     * @tc.desc Verify parseFloat '1e-1' simple exponent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat('1e-1');
      expect(result).assertEqual(0.1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_0990
     * @tc.name testGlobalParseFloatTest099
     * @tc.desc Verify parseFloat '1.0' integer decimal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat('1.0');
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_1000
     * @tc.name testGlobalParseFloatTest100
     * @tc.desc parseFloat(".0") returns 0 (leading decimal point without integer part)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat('.0');
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_1010
     * @tc.name testGlobalParseFloatTest101
     * @tc.desc Verify parseFloat '1e+1' equals 10
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat('1e+1');
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_1020
     * @tc.name testGlobalParseFloatTest102
     * @tc.desc Verify parseFloat '-1e-1' negative small
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat('-1e-1');
      expect(result).assertEqual(-0.1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_1030
     * @tc.name testGlobalParseFloatTest103
     * @tc.desc Verify parseFloat '3.14e0' zero exponent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat('3.14e0');
      expect(result).assertEqual(3.14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_1040
     * @tc.name testGlobalParseFloatTest104
     * @tc.desc parseFloat("0.000001") returns 0.000001 (small decimal with leading zeros)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat('0.000001');
      expect(result).assertEqual(0.000001);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_1050
     * @tc.name testGlobalParseFloatTest105
     * @tc.desc Verify parseFloat '1.23456789' precision
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = parseFloat('1.23456789');
      expect(result).assertEqual(1.23456789);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_1060
     * @tc.name testGlobalParseFloatTest106
     * @tc.desc parseFloat("e5") returns NaN (exponent without base)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseFloat('e5');
      const r: boolean = isNaN(result);
      expect(r).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_1070
     * @tc.name testGlobalParseFloatTest107
     * @tc.desc parseFloat(String(Float.POSITIVE_INFINITY)) returns Float.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseFloat(String(Float.POSITIVE_INFINITY));
      expect(result).assertEqual(Float.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_1080
     * @tc.name testGlobalParseFloatTest108
     * @tc.desc parseFloat with massive leading zeros
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number = parseFloat('00000000000000000000000000003.14');
      expect(r).assertEqual(3.14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_1090
     * @tc.name testGlobalParseFloatTest109
     * @tc.desc parseFloat very long digit string (100 digits) is finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = '';
      for (let i: int = 0; i < 100; i++) {
        s += '1';
      }
      const r: number = parseFloat(s);
      expect(isFinite(r)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_1100
     * @tc.name testGlobalParseFloatTest110
     * @tc.desc parseFloat with emoji prefix returns Float.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number = parseFloat('🔥3.14');
      expect(isNaN(r)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_1110
     * @tc.name testGlobalParseFloatTest111
     * @tc.desc parseFloat with Russian/Korean prefix returns Float.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(isNaN(parseFloat('тест3.14'))).assertTrue();
      expect(isNaN(parseFloat('테스트3.14'))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_1120
     * @tc.name testGlobalParseFloatTest112
     * @tc.desc parseFloat with XSS-injection-like string returns NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: number = parseFloat('<script>3.14</script>');
      expect(isNaN(r)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_1130
     * @tc.name testGlobalParseFloatTest113
     * @tc.desc parseFloat result used in arithmetic chain: addition and multiplication
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: number = parseFloat('2.5');
      const b: number = parseFloat('3.5');
      const sum: number = a + b;
      const product: number = a * b;
      expect(sum).assertEqual(6.0);
      expect(product).assertEqual(8.75);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_1140
     * @tc.name testGlobalParseFloatTest114
     * @tc.desc parseFloat result used in comparison chain: less than, greater than, strict equal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: number = parseFloat('5.0');
      const b: number = parseFloat('3.0');
      expect(a > b).assertTrue();
      expect(b < a).assertTrue();
      expect(a).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_1150
     * @tc.name testGlobalParseFloatTest115
     * @tc.desc parseFloat result passed to Math.abs returns absolute value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: number = parseFloat('-42.5');
      const abs: number = Math.abs(v);
      expect(abs).assertEqual(42.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_1160
     * @tc.name testGlobalParseFloatTest116
     * @tc.desc parseFloat result used as array index coerces to integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [10.0, 20.0, 30.0];
      const idx: number = parseFloat('1.9');
      const i: int = idx.toInt();
      expect(arr[i]).assertEqual(20.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_1170
     * @tc.name testGlobalParseFloatTest117
     * @tc.desc parseFloat in if-else branch: positive value takes true branch
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: number = parseFloat('3.14');
      let branch: string = '';
      if (v > 0.0) {
        branch = 'positive';
      } else {
        branch = 'non-positive';
      }
      expect(branch).assertEqual('positive');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_1180
     * @tc.name testGlobalParseFloatTest118
     * @tc.desc parseFloat result in ternary expression selects correct branch
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: number = parseFloat('-5.5');
      const label: string = v < 0.0 ? 'negative' : 'non-negative';
      expect(label).assertEqual('negative');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_1190
     * @tc.name testGlobalParseFloatTest119
     * @tc.desc Nested parseFloat calls: outer parses result of inner toString conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner: number = parseFloat('3.14');
      const outer: number = parseFloat(inner.toString());
      expect(outer).assertEqual(3.14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_1200
     * @tc.name testGlobalParseFloatTest120
     * @tc.desc parseFloat with template literal string input returns expected value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: string = `3.14`;
      const result: number = parseFloat(s);
      expect(result).assertEqual(3.14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_1210
     * @tc.name testGlobalParseFloatTest121
     * @tc.desc parseFloat with string containing embedded null character truncates at null
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: string = '3.14\u0000extra';
      const result: number = parseFloat(s);
      expect(result).assertEqual(3.14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_1220
     * @tc.name testGlobalParseFloatTest122
     * @tc.desc parseFloat with String.fromCharCode constructed input returns expected value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: string = String.fromCharCode(0x33, 0x2e, 0x31, 0x34);
      const result: number = parseFloat(s);
      expect(result).assertEqual(3.14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_1230
     * @tc.name testGlobalParseFloatTest123
     * @tc.desc parseFloat with string containing actual newline in content returns numeric prefix
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: string = '3.14\n5.67';
      const result: number = parseFloat(s);
      expect(result).assertEqual(3.14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_1240
     * @tc.name testGlobalParseFloatTest124
     * @tc.desc typeof parseFloat result is number for both numeric and NaN inputs
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inputs: string[] = ['42.0', 'NaN', '-1', 'Infinity'];
      for (let i: int = 0; i < inputs.length; i++) {
        const v: number = parseFloat(inputs[i]);
      const t: string = typeof v;
      expect(t).assertEqual('number');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_1250
     * @tc.name testGlobalParseFloatTest125
     * @tc.desc parseFloat result of NaN passed to isNaN returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: number = parseFloat('not-a-number');
      const nan: boolean = isNaN(v);
      expect(nan).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_1260
     * @tc.name testGlobalParseFloatTest126
     * @tc.desc parseFloat round-trips values stringified via String() and via int.toString() back to the original number
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: number[] = [3.14, -42, 255];
      for (let i: int = 0; i < values.length; i++) {
        const s: string = String(values[i]);
      const result: number = parseFloat(s);
        expect(result).assertEqual(values[i]);
      }
      const intVal: int = 255;
      const fromToString: number = parseFloat(intVal.toString());
      expect(fromToString).assertEqual(255.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_1270
     * @tc.name testGlobalParseFloatTest127
     * @tc.desc parseFloat with very long digit strings (308-digit integer and 100-digit fraction) returns finite values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let intDigits: string = '';
      for (let i: int = 0; i < 308; i++) {
        intDigits = intDigits + '1';
      }
      const intResult: number = parseFloat(intDigits);
      expect(isFinite(intResult)).assertTrue();
      let fracDigits: string = '0.';
      for (let i: int = 0; i < 100; i++) {
        fracDigits = fracDigits + '1';
      }
      const fracResult: number = parseFloat(fracDigits);
      expect(isFinite(fracResult)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_1280
     * @tc.name testGlobalParseFloatTest128
     * @tc.desc parseFloat result with bitwise NOT produces expected integer conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: number = parseFloat('3.14');
      const notV: int = ~v.toInt();
      expect(notV).assertEqual(-4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_1290
     * @tc.name testGlobalParseFloatTest129
     * @tc.desc parseFloat with strings having no numeric prefix (boolean, single letter, email) returns NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inputs: string[] = [String(true), String('a'), 'test@example.com'];
      for (let i: int = 0; i < inputs.length; i++) {
        const result: number = parseFloat(inputs[i]);
        expect(isNaN(result)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_1300
     * @tc.name testGlobalParseFloatTest130
     * @tc.desc parseFloat routed by if-else chain on parsed value branch
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: number = parseFloat('2.0');
      let label: string = '';
      if (v === 1.0) {
        label = 'one';
      } else if (v === 2.0) {
        label = 'two';
      } else {
        label = 'other';
      }
      expect(label).assertEqual('two');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_1310
     * @tc.name testGlobalParseFloatTest131
     * @tc.desc parseFloat with string containing only a sign and whitespace returns NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseFloat('+ ');
      const nan: boolean = isNaN(result);
      expect(nan).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_1320
     * @tc.name testGlobalParseFloatTest132
     * @tc.desc parseFloat rejects non-ASCII and Unicode-prefixed strings (Thai digits, RTL override, lone surrogate, replacement char, mojibake) with NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inputs: string[] = ['๑๒.๓๔', '\u202E3.14', '\uFFFD3.14', '\uD8003.14', 'æµè¯3.14'];
      for (let i: int = 0; i < inputs.length; i++) {
        const result: number = parseFloat(inputs[i]);
        expect(isNaN(result)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_1330
     * @tc.name testGlobalParseFloatTest133
     * @tc.desc parseFloat with object property access as input string returns parsed value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cfg: CfgObj = { value: '3.14' };
      const result: number = parseFloat(cfg.value);
      expect(result).assertEqual(3.14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_1340
     * @tc.name testGlobalParseFloatTest134
     * @tc.desc parseFloat with phone number string returns 13800138000 (11-digit integer exactly representable)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseFloat('13800138000');
      expect(result).assertEqual(13800138000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_1350
     * @tc.name testGlobalParseFloatTest135
     * @tc.desc parseFloat with ISO date string returns year prefix before first hyphen
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseFloat('2026-03-05');
      expect(result).assertEqual(2026);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_PARSEFLOAT_TEST_1360
     * @tc.name testGlobalParseFloatTest136
     * @tc.desc parseFloat does not mutate the original string argument after parsing
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalParseFloatTest136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original: string = '  3.14extra  ';
      const snapshot: string = original;
      const result: number = parseFloat(original);
      expect(result).assertEqual(3.14);
      expect(original).assertEqual(snapshot);
    });
  });
}