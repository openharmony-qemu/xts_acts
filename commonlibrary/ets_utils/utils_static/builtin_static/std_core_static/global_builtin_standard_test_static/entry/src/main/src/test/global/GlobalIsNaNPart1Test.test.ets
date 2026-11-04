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
} from '@ohos/hypium-static/src/main/indexStatic';
import Utils from "../Util.test";

interface NumObj { num: number }

export default function GlobalIsNaNPart_1Test(): void {
  describe("GlobalIsNaNPart_1Test", (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0010
     * @tc.name testGlobalIsNaNTest001
     * @tc.desc Verify isNaN(2) false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: boolean = isNaN(2);
      expect(r1).assertFalse();
      const r2: boolean = isNaN(3);
      expect(r2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0020
     * @tc.name testGlobalIsNaNTest002
     * @tc.desc Verify isNaN(-2) false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = -2;
      const r: boolean = isNaN(valInner);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0030
     * @tc.name testGlobalIsNaNTest003
     * @tc.desc Verify isNaN(1.0e10) false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = 1.0e10;
      const r: boolean = isNaN(valInner);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0040
     * @tc.name testGlobalIsNaNTest004
     * @tc.desc Verify isNaN(Math.asin(2)) true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const asinVal: number = Math.asin(2);
      const r: boolean = isNaN(asinVal);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0050
     * @tc.name testGlobalIsNaNTest005
     * @tc.desc Verify isNaN(Number.POSITIVE_INFINITY * Number.POSITIVE_INFINITY) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const x: number = Number.POSITIVE_INFINITY;
      const y: number = Number.POSITIVE_INFINITY;
      const val: number = x * y;
      const r: boolean = isNaN(val);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0060
     * @tc.name testGlobalIsNaNTest006
     * @tc.desc isNaN(Number.POSITIVE_INFINITY + Number.POSITIVE_INFINITY) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const x: number = Number.POSITIVE_INFINITY;
      const val: number = x + x;
      const r: boolean = isNaN(val);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0070
     * @tc.name testGlobalIsNaNTest007
     * @tc.desc !isNaN(1 as long typed variable) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const x: long = 1;
      const r: boolean = !isNaN(x);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0080
     * @tc.name testGlobalIsNaNTest008
     * @tc.desc isNaN(Number.POSITIVE_INFINITY * 2.0f) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = Number.POSITIVE_INFINITY * 2.0f;
      const r: boolean = isNaN(valInner);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0090
     * @tc.name testGlobalIsNaNTest009
     * @tc.desc Verify isNaN(Number.NaN) returns true (nan label)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const label: string = isNaN(Number.NaN) ? "nan" : "finite";
      expect(label).assertEqual("nan");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0100
     * @tc.name testGlobalIsNaNTest010
     * @tc.desc Verify isNaN finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const label: string = isNaN(1.0f) ? "nan" : "finite";
      expect(label).assertEqual("finite");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0110
     * @tc.name testGlobalIsNaNTest011
     * @tc.desc Verify isNaN(Math.sqrt(-1))
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sqrtVal: number = Math.sqrt(-1);
      const r: boolean = isNaN(sqrtVal);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0120
     * @tc.name testGlobalIsNaNTest012
     * @tc.desc isNaN batch values in loop (cross-API) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const chars: string[] = [];
      for (let i: int = 0;
      i < 10;
      i++) {
        chars.push("a");
      }
      const ls: string = chars.join("");
      const result: number = parseInt(ls);
      const resultIsResult: boolean = isNaN(result);
      expect(resultIsResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0130
     * @tc.name testGlobalIsNaNTest013
     * @tc.desc isNaN(parseInt("9007199254740991", 1) (cross-API) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parsedInner: number = parseInt("9007199254740991", 1);
      const result: boolean = isNaN(parsedInner);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0140
     * @tc.name testGlobalIsNaNTest014
     * @tc.desc isNaN(parseInt("-2147483648") (cross-API) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parsedInner: number = parseInt("-2147483648");
      const result: boolean = isNaN(parsedInner);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0150
     * @tc.name testGlobalIsNaNTest015
     * @tc.desc Verify parseFloat(" ") isNaN true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseFloat("  ");
      const resultIsResult: boolean = isNaN(result);
      expect(resultIsResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0160
     * @tc.name testGlobalIsNaNTest016
     * @tc.desc Verify parseInt("2147483647") isNaN false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: number = parseInt("2147483647");
      const result: boolean = isNaN(val);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0170
     * @tc.name testGlobalIsNaNTest017
     * @tc.desc isNaN(100) returns false for positive number (type broadening coverage)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = 100;
      const r: boolean = isNaN(valInner);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0180
     * @tc.name testGlobalIsNaNTest018
     * @tc.desc isNaN(-32768) returns false for negative number (type broadening coverage)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = -32768;
      const r: boolean = isNaN(valInner);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0190
     * @tc.name testGlobalIsNaNTest019
     * @tc.desc isNaN(float -1.5) returns false for negative float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = -1.5f;
      const r: boolean = isNaN(valInner);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0200
     * @tc.name testGlobalIsNaNTest020
     * @tc.desc isNaN(-Float.POSITIVE_INFINITY) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = -Float.POSITIVE_INFINITY;
      const r: boolean = isNaN(valInner);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0210
     * @tc.name testGlobalIsNaNTest021
     * @tc.desc isNaN(parseFloat("3.14")) returns false (cross-API valid number)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parsedInner: number = parseFloat("3.14");
      const r: boolean = isNaN(parsedInner);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0220
     * @tc.name testGlobalIsNaNTest022
     * @tc.desc isNaN(parseInt("", 10)) returns true (empty string produces Float.NaN)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parsedInner: number = parseInt("", 10);
      const r: boolean = isNaN(parsedInner);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0230
     * @tc.name testGlobalIsNaNTest023
     * @tc.desc isNaN with loop: [42, -1, 0, 3.14, Float.POSITIVE_INFINITY] all false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: number[] = [42, -1, 0, 3.14, Float.POSITIVE_INFINITY];
      for (let i: int = 0;
      i < values.length;
      i = i + 1) {
        const valInner: number = values[i];
      const r: boolean = isNaN(valInner);
      expect(r).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0240
     * @tc.name testGlobalIsNaNTest024
     * @tc.desc isNaN with loop: [Float.NaN, 0.0/0.0, parseFloat("abc")] all true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: number[] = [Float.NaN, 0.0 / 0.0, parseFloat("abc")];
      for (let i: int = 0;
      i < values.length;
      i = i + 1) {
        const valInner: number = values[i];
      const r: boolean = isNaN(valInner);
      expect(r).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0250
     * @tc.name testGlobalIsNaNTest025
     * @tc.desc isNaN(Float.POSITIVE_INFINITY % 1) returns true (Float.POSITIVE_INFINITY%n=Float.NaN)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = Float.POSITIVE_INFINITY % 1;
      const r: boolean = isNaN(valInner);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0260
     * @tc.name testGlobalIsNaNTest026
     * @tc.desc isNaN(null as Double) throws ClassCastError (cast fails at runtime)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        isNaN(null as Double);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0270
     * @tc.name testGlobalIsNaNTest027
     * @tc.desc isNaN(Number.NEGATIVE_INFINITY) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = Number.NEGATIVE_INFINITY;
      const r: boolean = isNaN(valInner);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0280
     * @tc.name testGlobalIsNaNTest028
     * @tc.desc isNaN(Number.EPSILON) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = Number.EPSILON;
      const r: boolean = isNaN(valInner);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0290
     * @tc.name testGlobalIsNaNTest029
     * @tc.desc parseFloat("e10") returns Float.NaN (exponent marker without digits)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parsedInner: number = parseFloat("e10");
      const r: boolean = isNaN(parsedInner);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0300
     * @tc.name testGlobalIsNaNTest030
     * @tc.desc parseFloat("++1") returns Float.NaN (double sign prefix)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parsedInner: number = parseFloat("++1");
      const r: boolean = isNaN(parsedInner);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0310
     * @tc.name testGlobalIsNaNTest031
     * @tc.desc parseFloat("$12.5") returns Float.NaN (currency prefix not recognized)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parsedInner: number = parseFloat("$12.5");
      const r: boolean = isNaN(parsedInner);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0320
     * @tc.name testGlobalIsNaNTest032
     * @tc.desc parseFloat("<script>1.5</script>") returns Float.NaN (XSS tag prefix not numeric)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parsedInner: number = parseFloat("<script>1.5</script>");
      const r: boolean = isNaN(parsedInner);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0330
     * @tc.name testGlobalIsNaNTest033
     * @tc.desc isNaN(Float.EPSILON) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = Float.EPSILON;
      const r: boolean = isNaN(valInner);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0340
     * @tc.name testGlobalIsNaNTest034
     * @tc.desc isNaN(float(0.0) / float(0.0)) returns true (float Float.NaN from division)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: float = 0.0f;
      const b: float = 0.0f;
      const valInner: number = a / b;
      const r: boolean = isNaN(valInner);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0350
     * @tc.name testGlobalIsNaNTest035
     * @tc.desc Verify isNaN returns true for parseInt with decimal point prefix in radix 16
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = parseInt(".f", 16);
      const result: boolean = isNaN(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0360
     * @tc.name testGlobalIsNaNTest036
     * @tc.desc Verify isNaN returns true for parseInt with currency prefix
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = parseInt("$12", 10);
      const result: boolean = isNaN(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0370
     * @tc.name testGlobalIsNaNTest037
     * @tc.desc Verify isNaN returns true for parseFloat with underscore prefix
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = parseFloat("_12");
      const result: boolean = isNaN(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0380
     * @tc.name testGlobalIsNaNTest038
     * @tc.desc Verify isNaN returns false for parseFloat stopping at underscore after digit
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = parseFloat("1_2");
      const result: boolean = isNaN(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0390
     * @tc.name testGlobalIsNaNTest039
     * @tc.desc Verify isNaN returns false for parseInt stopping at hyphen after digit
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = parseInt("1-2", 10);
      const result: boolean = isNaN(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0400
     * @tc.name testGlobalIsNaNTest040
     * @tc.desc Verify isNaN returns false for parseInt stopping at plus after digit
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = parseInt("1+2", 10);
      const result: boolean = isNaN(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0410
     * @tc.name testGlobalIsNaNTest041
     * @tc.desc Verify isNaN returns false for parseFloat with hexadecimal prefix parsed as zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = parseFloat("0x1p2");
      const result: boolean = isNaN(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0420
     * @tc.name testGlobalIsNaNTest042
     * @tc.desc Verify isNaN returns false for parseFloat with binary prefix parsed as zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = parseFloat("0b101");
      const result: boolean = isNaN(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0430
     * @tc.name testGlobalIsNaNTest043
     * @tc.desc Verify isNaN returns false for parseFloat with octal prefix parsed as zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = parseFloat("0o77");
      const result: boolean = isNaN(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0440
     * @tc.name testGlobalIsNaNTest044
     * @tc.desc Verify isNaN returns false for parseFloat with trailing exponent marker
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = parseFloat("99e");
      const result: boolean = isNaN(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0450
     * @tc.name testGlobalIsNaNTest045
     * @tc.desc Verify isNaN returns false for parseFloat with trailing signed exponent marker
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = parseFloat("99e+");
      const result: boolean = isNaN(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0460
     * @tc.name testGlobalIsNaNTest046
     * @tc.desc Verify isNaN returns false for parseFloat with trailing negative exponent marker
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = parseFloat("99e-");
      const result: boolean = isNaN(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0470
     * @tc.name testGlobalIsNaNTest047
     * @tc.desc Verify isNaN returns false for parseFloat with comma after integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = parseFloat("1, 234.5");
      const result: boolean = isNaN(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0480
     * @tc.name testGlobalIsNaNTest048
     * @tc.desc Verify isNaN returns false for parseInt with comma after integer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = parseInt("1, 234", 10);
      const result: boolean = isNaN(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0490
     * @tc.name testGlobalIsNaNTest049
     * @tc.desc Verify isNaN returns false for parseInt with uppercase digit in radix 17
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = parseInt("G", 17);
      const result: boolean = isNaN(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0500
     * @tc.name testGlobalIsNaNTest050
     * @tc.desc Verify isNaN returns false for parseInt with lowercase digit in radix 17
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = parseInt("g", 17);
      const result: boolean = isNaN(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0510
     * @tc.name testGlobalIsNaNTest051
     * @tc.desc Verify isNaN returns false for parseFloat with positive overflow
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = parseFloat("1e309");
      const result: boolean = isNaN(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0520
     * @tc.name testGlobalIsNaNTest052
     * @tc.desc Verify isNaN returns false for parseFloat with negative overflow
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = parseFloat("-1e309");
      const result: boolean = isNaN(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0530
     * @tc.name testGlobalIsNaNTest053
     * @tc.desc Verify isNaN returns false for parseFloat with positive underflow
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = parseFloat("1e-400");
      const result: boolean = isNaN(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0540
     * @tc.name testGlobalIsNaNTest054
     * @tc.desc Verify isNaN returns false for parseFloat with negative underflow
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = parseFloat("-1e-400");
      const result: boolean = isNaN(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0550
     * @tc.name testGlobalIsNaNTest055
     * @tc.desc Verify isNaN returns false for parseInt with radix from positive infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = parseInt("10", Number.POSITIVE_INFINITY);
      const result: boolean = isNaN(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0560
     * @tc.name testGlobalIsNaNTest056
     * @tc.desc Verify isNaN returns false for parseInt with radix from negative infinity
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = parseInt("10", Number.NEGATIVE_INFINITY);
      const result: boolean = isNaN(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0570
     * @tc.name testGlobalIsNaNTest057
     * @tc.desc Verify isNaN returns false for Number.MAX_VALUE/2 and Number.EPSILON/2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const halfMaxVal: number = Number.MAX_VALUE / 2.0;
      const halfEpsilon: number = Number.EPSILON / 2.0;
      expect(isNaN(halfMaxVal)).assertFalse();
      expect(isNaN(halfEpsilon)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0580
     * @tc.name testGlobalIsNaNTest058
     * @tc.desc Verify isNaN returns false for -Number.MAX_VALUE/2 and -Number.EPSILON/2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negHalfMaxVal: number = -Number.MAX_VALUE / 2.0;
      const negHalfEpsilon: number = -Number.EPSILON / 2.0;
      expect(isNaN(negHalfMaxVal)).assertFalse();
      expect(isNaN(negHalfEpsilon)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0590
     * @tc.name testGlobalIsNaNTest059
     * @tc.desc Verify isNaN returns false for parseFloat signed zero with text suffix
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = parseFloat("-0text");
      const result: boolean = isNaN(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0600
     * @tc.name testGlobalIsNaNTest060
     * @tc.desc Verify isNaN returns false for parseFloat positive signed zero with text suffix
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = parseFloat("+0text");
      const result: boolean = isNaN(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0610
     * @tc.name testGlobalIsNaNTest061
     * @tc.desc Verify isNaN returns false for parseInt with large base 36 value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = parseInt("zzzz", 36);
      const result: boolean = isNaN(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0620
     * @tc.name testGlobalIsNaNTest062
     * @tc.desc Verify isNaN returns false for parseFloat with numeric prefix before Chinese text
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = parseFloat("42测试");
      const result: boolean = isNaN(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0630
     * @tc.name testGlobalIsNaNTest063
     * @tc.desc Verify isNaN returns true for parseFloat with letter prefix before digits
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = parseFloat("value42");
      const result: boolean = isNaN(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0640
     * @tc.name testGlobalIsNaNTest064
     * @tc.desc isNaN(-128) returns false (byte minimum)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = -128;
      const r: boolean = isNaN(valInner);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0650
     * @tc.name testGlobalIsNaNTest065
     * @tc.desc isNaN(Int.MIN_VALUE) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = Int.MIN_VALUE;
      const r: boolean = isNaN(valInner);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0660
     * @tc.name testGlobalIsNaNTest066
     * @tc.desc isNaN(Int.MAX_VALUE) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = Int.MAX_VALUE;
      const r: boolean = isNaN(valInner);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0670
     * @tc.name testGlobalIsNaNTest067
     * @tc.desc isNaN(Long.MIN_VALUE) returns false (long minimum)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = Long.MIN_VALUE;
      const r: boolean = isNaN(valInner);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0680
     * @tc.name testGlobalIsNaNTest068
     * @tc.desc isNaN(Long.MAX_VALUE) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = Long.MAX_VALUE;
      const r: boolean = isNaN(valInner);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0690
     * @tc.name testGlobalIsNaNTest069
     * @tc.desc isNaN(16777216.0f) returns false (float exact integer boundary)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = 16777216.0f;
      const r: boolean = isNaN(valInner);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0700
     * @tc.name testGlobalIsNaNTest070
     * @tc.desc isNaN(16777217.0f) returns false (float precision loss boundary)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = 16777217.0f;
      const r: boolean = isNaN(valInner);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0710
     * @tc.name testGlobalIsNaNTest071
     * @tc.desc Verify isNaN returns false for scientific notation 1e3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: boolean = isNaN(1e3);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0720
     * @tc.name testGlobalIsNaNTest072
     * @tc.desc Verify isNaN returns false for scientific notation 1e-3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = 1e-3;
      const r: boolean = isNaN(valInner);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0730
     * @tc.name testGlobalIsNaNTest073
     * @tc.desc Verify isNaN returns false for scientific notation 1e308
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: boolean = isNaN(1e308);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0740
     * @tc.name testGlobalIsNaNTest074
     * @tc.desc Verify isNaN returns false for scientific notation 1e-324
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = 1e-324;
      const r: boolean = isNaN(valInner);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0750
     * @tc.name testGlobalIsNaNTest075
     * @tc.desc Verify isNaN(42) && true returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: boolean = isNaN(42) && true;
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0760
     * @tc.name testGlobalIsNaNTest076
     * @tc.desc Verify isNaN(42) || false returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: boolean = isNaN(42) || false;
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0770
     * @tc.name testGlobalIsNaNTest077
     * @tc.desc Verify !isNaN(42) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: boolean = !isNaN(42);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0780
     * @tc.name testGlobalIsNaNTest078
     * @tc.desc Verify !!isNaN(42) double negation returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: boolean = !!isNaN(42);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0790
     * @tc.name testGlobalIsNaNTest079
     * @tc.desc Verify isNaN(Float.NaN) && isFinite(Float.NaN) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: boolean = isNaN(Float.NaN) && isFinite(Float.NaN);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0800
     * @tc.name testGlobalIsNaNTest080
     * @tc.desc Verify isNaN(Float.NaN) || isFinite(Float.NaN) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: boolean = isNaN(Float.NaN) || isFinite(Float.NaN);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0810
     * @tc.name testGlobalIsNaNTest081
     * @tc.desc Verify isNaN with if condition for numeric input
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = true;
      if (isNaN(42)) {
        result = false;
      }
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0820
     * @tc.name testGlobalIsNaNTest082
     * @tc.desc Verify if(!isNaN(42)) condition is true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = false;
      if (!isNaN(42)) {
        result = true;
      }
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0830
     * @tc.name testGlobalIsNaNTest083
     * @tc.desc Verify ternary operator with isNaN(42) returns number
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = isNaN(42) ? "NaN" : "number";
      expect(result).assertEqual("number");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0840
     * @tc.name testGlobalIsNaNTest084
     * @tc.desc Verify isNaN(-0) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = -0;
      const r: boolean = isNaN(valInner);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0850
     * @tc.name testGlobalIsNaNTest085
     * @tc.desc Verify isNaN result can be stored in array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let flags: boolean[] = [isNaN(Float.NaN), isNaN(42), isNaN(Float.POSITIVE_INFINITY)];
      expect(flags[0]).assertTrue();
      expect(flags[1]).assertFalse();
      expect(flags[2]).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0860
     * @tc.name testGlobalIsNaNTest086
     * @tc.desc Verify isNaN result can be stored in Map
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, Any> = new Map<string, Any>();
      map.set("test", isNaN(Float.NaN));
      expect(map.get("test") as boolean).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0870
     * @tc.name testGlobalIsNaNTest087
     * @tc.desc Verify isNaN result can be stored in Set
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let set: Set<boolean> = new Set<boolean>();
      set.add(isNaN(Float.NaN));
      set.add(isNaN(42));
      expect(set.has(true)).assertTrue();

      expect(set.has(false)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0880
     * @tc.name testGlobalIsNaNTest088
     * @tc.desc Verify isNaN throws ClassCastError for empty string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let strVal: number | string = "";
        isNaN(strVal as number);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0890
     * @tc.name testGlobalIsNaNTest089
     * @tc.desc Verify isNaN throws ClassCastError for digit string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let strVal: number | string = "123";
        isNaN(strVal as number);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0900
     * @tc.name testGlobalIsNaNTest090
     * @tc.desc Verify isNaN throws ClassCastError for Date argument
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let dateVal: number | Date = new Date();
        isNaN(dateVal as number);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0910
     * @tc.name testGlobalIsNaNTest091
     * @tc.desc Verify isNaN throws ClassCastError for Error argument
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let errVal: number | Error = new Error("test");
        isNaN(errVal as number);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0920
     * @tc.name testGlobalIsNaNTest092
     * @tc.desc isNaN(Number.NEGATIVE_INFINITY * 0.0) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = Number.NEGATIVE_INFINITY * 0.0;
      const r: boolean = isNaN(valInner);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0930
     * @tc.name testGlobalIsNaNTest093
     * @tc.desc isNaN(Number.NEGATIVE_INFINITY / Number.NEGATIVE_INFINITY) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = Number.NEGATIVE_INFINITY / Number.NEGATIVE_INFINITY;
      const r: boolean = isNaN(valInner);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0940
     * @tc.name testGlobalIsNaNTest094
     * @tc.desc isNaN(Number.NEGATIVE_INFINITY - Number.NEGATIVE_INFINITY) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = Number.NEGATIVE_INFINITY - Number.NEGATIVE_INFINITY;
      const r: boolean = isNaN(valInner);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0950
     * @tc.name testGlobalIsNaNTest095
     * @tc.desc isNaN(Number.NEGATIVE_INFINITY + Number.POSITIVE_INFINITY) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = Number.NEGATIVE_INFINITY + Number.POSITIVE_INFINITY;
      const r: boolean = isNaN(valInner);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0960
     * @tc.name testGlobalIsNaNTest096
     * @tc.desc isNaN(Number.NEGATIVE_INFINITY % 2.0) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = Number.NEGATIVE_INFINITY % 2.0;
      const r: boolean = isNaN(valInner);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0970
     * @tc.name testGlobalIsNaNTest097
     * @tc.desc isNaN(Math.log(-1)) returns true for out-of-domain logarithm
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const logVal: number = Math.log(-1);
      const r: boolean = isNaN(logVal);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0980
     * @tc.name testGlobalIsNaNTest098
     * @tc.desc isNaN(Math.acos(2)) returns true for out-of-domain acos
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const acosVal: number = Math.acos(2);
      const r: boolean = isNaN(acosVal);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_0990
     * @tc.name testGlobalIsNaNTest099
     * @tc.desc isNaN(Math.pow(-1, 0.5)) returns true for negative base with fractional exponent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const powVal: number = Math.pow(-1, 0.5);
      const r: boolean = isNaN(powVal);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_1000
     * @tc.name testGlobalIsNaNTest100
     * @tc.desc isNaN(Math.pow(Float.NaN, 0)) returns false (NaN^0 = 1 by IEEE 754)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const powNaNVal: number = Math.pow(Float.NaN, 0);
      const r: boolean = isNaN(powNaNVal);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_1010
     * @tc.name testGlobalIsNaNTest101
     * @tc.desc Number(null) returns 0, isNaN(0) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const n: number = Number(null);
      const r: boolean = isNaN(n);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_1020
     * @tc.name testGlobalIsNaNTest102
     * @tc.desc isNaN with int type parameter 42 returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: int = 42;
      const r: boolean = isNaN(val);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_1030
     * @tc.name testGlobalIsNaNTest103
     * @tc.desc isNaN with byte type parameter returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 0;
      const r: boolean = isNaN(v);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_1040
     * @tc.name testGlobalIsNaNTest104
     * @tc.desc isNaN with bytemax type parameter returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 127;
      const r: boolean = isNaN(v);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_1050
     * @tc.name testGlobalIsNaNTest105
     * @tc.desc isNaN with short type parameter returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: short = 0;
      const r: boolean = isNaN(v);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_1060
     * @tc.name testGlobalIsNaNTest106
     * @tc.desc isNaN with shortmax type parameter returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: short = 32767;
      const r: boolean = isNaN(v);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_1070
     * @tc.name testGlobalIsNaNTest107
     * @tc.desc isNaN with int type parameter 0 returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: int = 0;
      const r: boolean = isNaN(v);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_1080
     * @tc.name testGlobalIsNaNTest108
     * @tc.desc isNaN with long type parameter returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: long = 0;
      const r: boolean = isNaN(v);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_1090
     * @tc.name testGlobalIsNaNTest109
     * @tc.desc isNaN with floatnan type parameter returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: float = Float.NaN;
      const r: boolean = isNaN(v);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_1100
     * @tc.name testGlobalIsNaNTest110
     * @tc.desc isNaN with floatinf type parameter returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: float = Float.POSITIVE_INFINITY;
      const r: boolean = isNaN(v);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_1110
     * @tc.name testGlobalIsNaNTest111
     * @tc.desc isNaN with numberzero type parameter returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: number = 0.0;
      const r: boolean = isNaN(v);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_1120
     * @tc.name testGlobalIsNaNTest112
     * @tc.desc isNaN with numbernan type parameter returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: number = Number.NaN;
      const r: boolean = isNaN(v);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_1130
     * @tc.name testGlobalIsNaNTest113
     * @tc.desc isNaN with numberinf type parameter returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: number = Number.POSITIVE_INFINITY;
      const r: boolean = isNaN(v);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_1140
     * @tc.name testGlobalIsNaNTest114
     * @tc.desc isNaN with floatnegzero type parameter returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: float = -0.0f;
      const r: boolean = isNaN(v);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_1150
     * @tc.name testGlobalIsNaNTest115
     * @tc.desc isNaN with floatneginf type parameter returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: float = Float.NEGATIVE_INFINITY;
      const r: boolean = isNaN(v);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_1160
     * @tc.name testGlobalIsNaNTest116
     * @tc.desc isNaN with intoverflow type parameter returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: int = Int.MAX_VALUE + 1;
      const r: boolean = isNaN(v);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_1170
     * @tc.name testGlobalIsNaNTest117
     * @tc.desc isNaN with intunderflow type parameter returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: int = Int.MIN_VALUE - 1;
      const r: boolean = isNaN(v);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_1180
     * @tc.name testGlobalIsNaNTest118
     * @tc.desc isNaN with longoverflow type parameter returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: long = Long.MAX_VALUE + 1;
      const r: boolean = isNaN(v);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_1190
     * @tc.name testGlobalIsNaNTest119
     * @tc.desc isNaN with longunderflow type parameter returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: long = Long.MIN_VALUE - 1;
      const r: boolean = isNaN(v);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_1200
     * @tc.name testGlobalIsNaNTest120
     * @tc.desc isNaN with numberoverflow type, overflow double returns false not NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: number = Number.MAX_VALUE * 2;
      const r: boolean = isNaN(v);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_1210
     * @tc.name testGlobalIsNaNTest121
     * @tc.desc isNaN with float/number max positive values returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: boolean = isNaN(Float.MAX_VALUE);
      expect(r1).assertFalse();
      const r2: boolean = isNaN(Number.MAX_VALUE);
      expect(r2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_1220
     * @tc.name testGlobalIsNaNTest122
     * @tc.desc isNaN with float/number max negative values returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: boolean = isNaN(-Float.MAX_VALUE);
      expect(r1).assertFalse();
      const r2: boolean = isNaN(-Number.MAX_VALUE);
      expect(r2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_1230
     * @tc.name testGlobalIsNaNTest123
     * @tc.desc isNaN with float/number min positive values returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: boolean = isNaN(Float.MIN_VALUE);
      expect(r1).assertFalse();
      const r2: boolean = isNaN(Number.MIN_VALUE);
      expect(r2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_1240
     * @tc.name testGlobalIsNaNTest124
     * @tc.desc isNaN with positive hex boundary returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: boolean = isNaN(0x7FFFFFFF);
      expect(r1).assertFalse();
      const r2: boolean = isNaN(0x7FFFFFFFFFFFFFFF as long);
      expect(r2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_1250
     * @tc.name testGlobalIsNaNTest125
     * @tc.desc isNaN with negative hex boundary returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: boolean = isNaN(-0x80000000);
      expect(r1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_1260
     * @tc.name testGlobalIsNaNTest126
     * @tc.desc isNaN with binary literal returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: boolean = isNaN(0b1111111111111111111111111111111);
      expect(r1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_1270
     * @tc.name testGlobalIsNaNTest127
     * @tc.desc isNaN(string as Any as number) throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let val: string = "NaN";
        isNaN(val as Any as number);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_1280
     * @tc.name testGlobalIsNaNTest128
     * @tc.desc isNaN(byte 42 as Any as float) throws ClassCastError on invalid cast
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: byte = 42;
      try {
isNaN(val as Any as float);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_1290
     * @tc.name testGlobalIsNaNTest129
     * @tc.desc isNaN(short 1000 as Any as float) throws ClassCastError on invalid cast
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: short = 1000;
      try {
isNaN(val as Any as float);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_1300
     * @tc.name testGlobalIsNaNTest130
     * @tc.desc isNaN(int 100000 as Any as float) throws ClassCastError on invalid cast
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: int = 100000;
      try {
isNaN(val as Any as float);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_1310
     * @tc.name testGlobalIsNaNTest131
     * @tc.desc isNaN(long 100 as Any as float) throws ClassCastError on invalid cast
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: long = 100;
      try {
isNaN(val as Any as float);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_1320
     * @tc.name testGlobalIsNaNTest132
     * @tc.desc isNaN(float 1.5 as Any as byte) throws ClassCastError on invalid cast
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 1.5f;
      try {
isNaN(val as Any as byte);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_1330
     * @tc.name testGlobalIsNaNTest133
     * @tc.desc isNaN(float 1.5 as Any as short) throws ClassCastError on invalid cast
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 1.5f;
      try {
isNaN(val as Any as short);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_1340
     * @tc.name testGlobalIsNaNTest134
     * @tc.desc isNaN(float 1.5 as Any as int) throws ClassCastError on invalid cast
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 1.5f;
      try {
isNaN(val as Any as int);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_1350
     * @tc.name testGlobalIsNaNTest135
     * @tc.desc isNaN(float 1.5 as Any as long) throws ClassCastError on invalid cast
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 1.5f;
      try {
isNaN(val as Any as long);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_1360
     * @tc.name testGlobalIsNaNTest136
     * @tc.desc isNaN(number 3.14 as Any as byte) throws ClassCastError on invalid cast
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: number = 3.14;
      try {
isNaN(val as Any as byte);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_1370
     * @tc.name testGlobalIsNaNTest137
     * @tc.desc isNaN(number 3.14 as Any as short) throws ClassCastError on invalid cast
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: number = 3.14;
      try {
isNaN(val as Any as short);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_1380
     * @tc.name testGlobalIsNaNTest138
     * @tc.desc isNaN(number 3.14 as Any as int) throws ClassCastError on invalid cast
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: number = 3.14;
      try {
isNaN(val as Any as int);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_1390
     * @tc.name testGlobalIsNaNTest139
     * @tc.desc isNaN(number 3.14 as Any as long) throws ClassCastError on invalid cast
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: number = 3.14;
      try {
isNaN(val as Any as long);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_1400
     * @tc.name testGlobalIsNaNTest140
     * @tc.desc isNaN(byte 42 as Any as short) throws ClassCastError on invalid cast
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: byte = 42;
      try {
isNaN(val as Any as short);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_1410
     * @tc.name testGlobalIsNaNTest141
     * @tc.desc isNaN(short 1000 as Any as int) throws ClassCastError on invalid cast
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: short = 1000;
      try {
isNaN(val as Any as int);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_1420
     * @tc.name testGlobalIsNaNTest142
     * @tc.desc isNaN(int 100000 as Any as long) throws ClassCastError on invalid cast
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: int = 100000;
      try {
isNaN(val as Any as long);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_1430
     * @tc.name testGlobalIsNaNTest143
     * @tc.desc isNaN(byte value widening to number) returns false (byte widening to number should not throw)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: byte = 42;
      const num: number = val;
      const r: boolean = isNaN(num);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_1440
     * @tc.name testGlobalIsNaNTest144
     * @tc.desc isNaN(short value widening to number) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: short = 1000;
      const num: number = val;
      const r: boolean = isNaN(num);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_1450
     * @tc.name testGlobalIsNaNTest145
     * @tc.desc isNaN(int value widening to number) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: int = 100000;
      const num: number = val;
      const r: boolean = isNaN(num);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_1460
     * @tc.name testGlobalIsNaNTest146
     * @tc.desc isNaN(long value widening to number) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: long = 100;
      const num: number = val;
      const r: boolean = isNaN(num);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_1470
     * @tc.name testGlobalIsNaNTest147
     * @tc.desc isNaN(float value widening to number) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 1.5f;
      const num: number = val;
      const r: boolean = isNaN(num);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_1480
     * @tc.name testGlobalIsNaNTest148
     * @tc.desc isNaN(null/undefined as Any as byte) throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        isNaN(null as Any as byte);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
      try {
        isNaN(undefined as Any as byte);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_1490
     * @tc.name testGlobalIsNaNTest149
     * @tc.desc isNaN(null/undefined as Any as short) throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        isNaN(null as Any as short);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
      try {
        isNaN(undefined as Any as short);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_1500
     * @tc.name testGlobalIsNaNTest150
     * @tc.desc isNaN(null/undefined as Any as int) throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        isNaN(null as Any as int);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
      try {
        isNaN(undefined as Any as int);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_1510
     * @tc.name testGlobalIsNaNTest151
     * @tc.desc isNaN(null/undefined as Any as long) throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        isNaN(null as Any as long);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
      try {
        isNaN(undefined as Any as long);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_1520
     * @tc.name testGlobalIsNaNTest152
     * @tc.desc isNaN(null/undefined as Any as float) throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        isNaN(null as Any as float);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
      try {
        isNaN(undefined as Any as float);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_1530
     * @tc.name testGlobalIsNaNTest153
     * @tc.desc isNaN(obj.num) with object number field 42 returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: NumObj = { num: 42 };
      const r: boolean = isNaN(obj.num);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_1540
     * @tc.name testGlobalIsNaNTest154
     * @tc.desc isNaN(obj.num) with object number field Number.NaN returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: NumObj = { num: Number.NaN };
      const r: boolean = isNaN(obj.num);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_1550
     * @tc.name testGlobalIsNaNTest155
     * @tc.desc isNaN(Float.NaN as Any as byte/short/int/long) throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        isNaN(Float.NaN as Any as byte);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
      try {
        isNaN(Float.NaN as Any as short);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
      try {
        isNaN(Float.NaN as Any as int);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
      try {
        isNaN(Float.NaN as Any as long);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_1560
     * @tc.name testGlobalIsNaNTest156
     * @tc.desc isNaN(Float.POSITIVE_INFINITY as Any as byte/short/int/long) throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        isNaN(Float.POSITIVE_INFINITY as Any as byte);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
      try {
        isNaN(Float.POSITIVE_INFINITY as Any as short);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
      try {
        isNaN(Float.POSITIVE_INFINITY as Any as int);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
      try {
        isNaN(Float.POSITIVE_INFINITY as Any as long);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_1570
     * @tc.name testGlobalIsNaNTest157
     * @tc.desc isNaN(Float.NEGATIVE_INFINITY as Any as byte/short/int/long) throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        isNaN(Float.NEGATIVE_INFINITY as Any as byte);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
      try {
        isNaN(Float.NEGATIVE_INFINITY as Any as short);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
      try {
        isNaN(Float.NEGATIVE_INFINITY as Any as int);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
      try {
        isNaN(Float.NEGATIVE_INFINITY as Any as long);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_1580
     * @tc.name testGlobalIsNaNTest158
     * @tc.desc Verify isNaN throws ClassCastError for null union value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let nullVal: number | null = null;
        isNaN(nullVal as number);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_1590
     * @tc.name testGlobalIsNaNTest159
     * @tc.desc Verify isNaN throws ClassCastError for undefined union value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let undefVal: number | undefined = undefined;
        isNaN(undefVal as number);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISNAN_TEST_1600
     * @tc.name testGlobalIsNaNTest160
     * @tc.desc Verify isNaN throws ClassCastError for emoji string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsNaNTest160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let emojiVal: number | string = "🎉";
        isNaN(emojiVal as number);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

  });
}
