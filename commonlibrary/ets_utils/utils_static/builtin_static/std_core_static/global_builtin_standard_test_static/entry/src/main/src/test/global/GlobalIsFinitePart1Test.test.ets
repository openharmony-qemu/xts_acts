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

interface NumObj { num: number }

export default function GlobalIsFinitePart_1Test(): void {
  describe("GlobalIsFinitePart_1Test", (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0010
     * @tc.name testGlobalIsFiniteTest001
     * @tc.desc isFinite(a) returns same as isFinite(b)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: short = -10000;
      const b: short = 20000;
      const r1: boolean = isFinite(a);
      expect(r1).assertTrue();
      const r2: boolean = isFinite(b);
      expect(r2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0020
     * @tc.name testGlobalIsFiniteTest002
     * @tc.desc isFinite((-32768) as short) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: short = -32768;
      const result: boolean = isFinite(v);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0030
     * @tc.name testGlobalIsFiniteTest003
     * @tc.desc isFinite(1) is true, so !isFinite(1) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: boolean = !isFinite(1);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0040
     * @tc.name testGlobalIsFiniteTest004
     * @tc.desc isFinite(100) is true , ternary isFinite(100) ? 1 : 0 returns 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: int = isFinite(100) ? 1 : 0;
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0050
     * @tc.name testGlobalIsFiniteTest005
     * @tc.desc isFinite(2147483647) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: boolean = isFinite(2147483647);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0060
     * @tc.name testGlobalIsFiniteTest006
     * @tc.desc !isFinite(0 as long) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: long = 0;
      const r: boolean = !isFinite(v);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0070
     * @tc.name testGlobalIsFiniteTest007
     * @tc.desc !isFinite(-1 as long) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: long = -1;
      const r: boolean = !isFinite(v);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0080
     * @tc.name testGlobalIsFiniteTest008
     * @tc.desc isFinite(0 as long) and !isFinite(Float.POSITIVE_INFINITY) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: long = 0;
      const r: boolean = isFinite(v) && !isFinite(Float.POSITIVE_INFINITY);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0090
     * @tc.name testGlobalIsFiniteTest009
     * @tc.desc isFinite(Float.NaN) returns false, so !isFinite(Float.NaN) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: boolean = !isFinite(Float.NaN);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0100
     * @tc.name testGlobalIsFiniteTest010
     * @tc.desc isFinite(Float.NaN) false, isFinite(Float.POSITIVE_INFINITY) false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner4: number = Float.NaN;
      const r1: boolean = isFinite(valInner4);
      expect(r1).assertFalse();
      const valInner2: number = Float.POSITIVE_INFINITY;
      const r2: boolean = isFinite(valInner2);
      expect(r2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0110
     * @tc.name testGlobalIsFiniteTest011
     * @tc.desc isFinite(Float.POSITIVE_INFINITY) returns false, so !isFinite(...) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = Float.POSITIVE_INFINITY;
      const r1: boolean = isFinite(valInner);
      const r2: boolean = !r1;
      expect(r2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0120
     * @tc.name testGlobalIsFiniteTest012
     * @tc.desc isFinite(Float.POSITIVE_INFINITY) ? 1 : 0 returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: int = isFinite(Float.POSITIVE_INFINITY) ? 1 : 0;
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0130
     * @tc.name testGlobalIsFiniteTest013
     * @tc.desc isFinite(Float.NaN) ? 'finite' : 'infinite' returns 'infinite'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: string = isFinite(Float.NaN) ? "finite" : "infinite";
      expect(r).assertEqual("infinite");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0140
     * @tc.name testGlobalIsFiniteTest014
     * @tc.desc isFinite(Math.exp(710)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = Math.exp(710);
      const r: boolean = isFinite(valInner);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0150
     * @tc.name testGlobalIsFiniteTest015
     * @tc.desc isFinite(0.0 / 0.0) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = 0.0 / 0.0;
      const r: boolean = isFinite(valInner);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0160
     * @tc.name testGlobalIsFiniteTest016
     * @tc.desc isFinite(42) returns true, then isFinite(Float.POSITIVE_INFINITY) returns false after reassign
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: number = 42;
      const r1: boolean = isFinite(v);
      v = Float.POSITIVE_INFINITY;
      const r2: boolean = isFinite(v);
      expect(r1).assertTrue();
      expect(r2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0170
     * @tc.name testGlobalIsFiniteTest017
     * @tc.desc isFinite(parseInt("-2147483648")) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parsedInner: number = parseInt("-2147483648");
      const result: boolean = isFinite(parsedInner);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0180
     * @tc.name testGlobalIsFiniteTest018
     * @tc.desc isFinite(parseFloat("-2147483648")) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parsedInner: number = parseFloat("-2147483648");
      const result: boolean = isFinite(parsedInner);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0190
     * @tc.name testGlobalIsFiniteTest019
     * @tc.desc isFinite(parseInt("+2147483647")) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt("+2147483647");
      const resultIsResult: boolean = isFinite(result);
      expect(resultIsResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0200
     * @tc.name testGlobalIsFiniteTest020
     * @tc.desc isFinite(parseInt("  ")) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseInt("  ");
      const resultIsResult: boolean = isFinite(result);
      expect(resultIsResult).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0210
     * @tc.name testGlobalIsFiniteTest021
     * @tc.desc isFinite(parseFloat("1e2")) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: number = parseFloat("1e2");
      const resultIsResult: boolean = isFinite(result);
      expect(resultIsResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0220
     * @tc.name testGlobalIsFiniteTest022
     * @tc.desc isFinite(parseFloat("Infinity")) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: number = parseFloat("Infinity");
      const result: boolean = isFinite(val);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0230
     * @tc.name testGlobalIsFiniteTest023
     * @tc.desc isFinite(Number.MIN_VALUE) returns true for min positive double
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = Number.MIN_VALUE;
      const r: boolean = isFinite(valInner);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0240
     * @tc.name testGlobalIsFiniteTest024
     * @tc.desc isFinite(-1.5f) returns true for negative float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = -1.5f;
      const r: boolean = isFinite(valInner);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0250
     * @tc.name testGlobalIsFiniteTest025
     * @tc.desc isFinite(parseFloat("3.14")) returns true (cross-API)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parsedInner: number = parseFloat("3.14");
      const r: boolean = isFinite(parsedInner);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0260
     * @tc.name testGlobalIsFiniteTest026
     * @tc.desc isFinite(parseFloat("NaN")) returns false (cross-API)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parsedInner: number = parseFloat("NaN");
      const r: boolean = isFinite(parsedInner);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0270
     * @tc.name testGlobalIsFiniteTest027
     * @tc.desc isFinite(parseInt("42")) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parsedInner: number = parseInt("42");
      const r: boolean = isFinite(parsedInner);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0280
     * @tc.name testGlobalIsFiniteTest028
     * @tc.desc isFinite(parseInt("", 10)) returns false (NaN from empty string)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parsedInner: number = parseInt("", 10);
      const r: boolean = isFinite(parsedInner);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0290
     * @tc.name testGlobalIsFiniteTest029
     * @tc.desc isFinite(1.0 / 0.0) returns false (division by zero)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = 1.0 / 0.0;
      const r: boolean = isFinite(valInner);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0300
     * @tc.name testGlobalIsFiniteTest030
     * @tc.desc isFinite(1e308 * 10) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = 1e308 * 10;
      const r: boolean = isFinite(valInner);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0310
     * @tc.name testGlobalIsFiniteTest031
     * @tc.desc isFinite(-1e308 * 10) returns false (negative overflow)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = -1e308 * 10;
      const r: boolean = isFinite(valInner);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0320
     * @tc.name testGlobalIsFiniteTest032
     * @tc.desc isFinite(Float.POSITIVE_INFINITY - Float.POSITIVE_INFINITY) returns false (Float.NaN)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = Float.POSITIVE_INFINITY - Float.POSITIVE_INFINITY;
      const r: boolean = isFinite(valInner);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0330
     * @tc.name testGlobalIsFiniteTest033
     * @tc.desc isFinite with loop: [42, -1, 0, 3.14, Number.MAX_VALUE] all return true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: number[] = [42, -1, 0, 3.14, Number.MAX_VALUE];
      for (let i: int = 0;
        i < values.length;
        i = i + 1) {
        const valInner: number = values[i];
        const r: boolean = isFinite(valInner);
        expect(r).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0340
     * @tc.name testGlobalIsFiniteTest034
     * @tc.desc isFinite with loop: [Float.NaN, Float.POSITIVE_INFINITY, -Float.POSITIVE_INFINITY] all false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: number[] = [Float.NaN, Float.POSITIVE_INFINITY, -Float.POSITIVE_INFINITY];
      for (let i: int = 0;
        i < values.length;
        i = i + 1) {
        const valInner: number = values[i];
        const r: boolean = isFinite(valInner);
        expect(r).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0350
     * @tc.name testGlobalIsFiniteTest035
     * @tc.desc isFinite(parseFloat("9.99e307")) returns true with range check
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: number = parseFloat("9.99e307");
      const finite: boolean = isFinite(val);
      expect(finite).assertTrue();
      expect(val).assertLarger(9.98e307);
      expect(val).assertLess(1e308);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0360
     * @tc.name testGlobalIsFiniteTest036
     * @tc.desc isFinite(parseFloat("2.2250738585072014e-308")) returns true with range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: number = parseFloat("2.2250738585072014e-308");
      const finite: boolean = isFinite(val);
      expect(finite).assertTrue();
      expect(val).assertLarger(0);
      expect(val).assertLess(1e-307);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0370
     * @tc.name testGlobalIsFiniteTest037
     * @tc.desc isFinite(null as Double) throws ClassCastError (cast fails at runtime)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        isFinite(null as Double);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0380
     * @tc.name testGlobalIsFiniteTest038
     * @tc.desc isFinite(Number.EPSILON) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = Number.EPSILON;
      const r: boolean = isFinite(valInner);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0390
     * @tc.name testGlobalIsFiniteTest039
     * @tc.desc isFinite(-0) returns true (negative zero is finite)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = -0;
      const r: boolean = isFinite(valInner);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0400
     * @tc.name testGlobalIsFiniteTest040
     * @tc.desc isFinite(parseFloat("+Infinity")) returns false (signed infinity is not finite)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parsedInner: number = parseFloat("+Infinity");
      const r: boolean = isFinite(parsedInner);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0410
     * @tc.name testGlobalIsFiniteTest041
     * @tc.desc isFinite(parseFloat(".75")) returns true (leading decimal without integer part)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parsedInner: number = parseFloat(".75");
      const r: boolean = isFinite(parsedInner);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0420
     * @tc.name testGlobalIsFiniteTest042
     * @tc.desc isFinite(parseFloat("-.75")) returns true (negative leading decimal)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parsedInner: number = parseFloat("-.75");
      const r: boolean = isFinite(parsedInner);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0430
     * @tc.name testGlobalIsFiniteTest043
     * @tc.desc isFinite(-Number.EPSILON) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = -Number.EPSILON;
      const r: boolean = isFinite(valInner);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0440
     * @tc.name testGlobalIsFiniteTest044
     * @tc.desc isFinite(Float.MAX_VALUE) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = Float.MAX_VALUE;
      const r: boolean = isFinite(valInner);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0450
     * @tc.name testGlobalIsFiniteTest045
     * @tc.desc isFinite(Float.MIN_VALUE) returns true (smallest normalized float is finite)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = Float.MIN_VALUE;
      const r: boolean = isFinite(valInner);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0460
     * @tc.name testGlobalIsFiniteTest046
     * @tc.desc isFinite(float(1.0) / float(0.0)) returns false (float division by zero yields Float.POSITIVE_INFINITY)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: float = 1.0f;
      const b: float = 0.0f;
      const valInner: number = a / b;
      const r: boolean = isFinite(valInner);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0470
     * @tc.name testGlobalIsFiniteTest047
     * @tc.desc Verify isFinite returns false for parseInt zero width prefix
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = parseInt("​42");
      const result: boolean = isFinite(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0480
     * @tc.name testGlobalIsFiniteTest048
     * @tc.desc Verify isFinite returns false for parseFloat XSS tag prefix
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = parseFloat("<script>1.5</script>");
      const result: boolean = isFinite(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0490
     * @tc.name testGlobalIsFiniteTest049
     * @tc.desc Verify isFinite returns true for parseFloat XSS suffix
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = parseFloat("1.5<script>");
      const result: boolean = isFinite(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0500
     * @tc.name testGlobalIsFiniteTest050
     * @tc.desc Verify isFinite returns true for parseInt XSS suffix
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = parseInt("15<script>", 10);
      const result: boolean = isFinite(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0510
     * @tc.name testGlobalIsFiniteTest051
     * @tc.desc Verify isFinite returns false for parseInt invalid radix
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = parseInt("10", 37);
      const result: boolean = isFinite(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0520
     * @tc.name testGlobalIsFiniteTest052
     * @tc.desc Verify isFinite returns false for parseInt underscore prefix
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = parseInt("_123", 10);
      const result: boolean = isFinite(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0530
     * @tc.name testGlobalIsFiniteTest053
     * @tc.desc Verify isFinite returns false for parseFloat plus sign only
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = parseFloat("+");
      const result: boolean = isFinite(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0540
     * @tc.name testGlobalIsFiniteTest054
     * @tc.desc Verify isFinite returns false for parseFloat exponent marker only
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = parseFloat("e10");
      const result: boolean = isFinite(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0550
     * @tc.name testGlobalIsFiniteTest055
     * @tc.desc Verify isFinite returns true for parseFloat incomplete exponent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = parseFloat("1e+");
      const result: boolean = isFinite(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0560
     * @tc.name testGlobalIsFiniteTest056
     * @tc.desc Verify isFinite returns true for parseFloat second decimal truncation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = parseFloat("1.2.3");
      const result: boolean = isFinite(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0570
     * @tc.name testGlobalIsFiniteTest057
     * @tc.desc Verify isFinite returns true for parseInt("0b1010") without radix (ES: prefix not recognized, result 0)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = parseInt("0b1010");
      const result: boolean = isFinite(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0580
     * @tc.name testGlobalIsFiniteTest058
     * @tc.desc Verify isFinite returns true for parseFloat binary looking string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = parseFloat("0b10");
      const result: boolean = isFinite(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0590
     * @tc.name testGlobalIsFiniteTest059
     * @tc.desc Verify isFinite returns true for parseFloat hex looking string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = parseFloat("0x10");
      const result: boolean = isFinite(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0600
     * @tc.name testGlobalIsFiniteTest060
     * @tc.desc Verify isFinite returns false for parseFloat uppercase INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = parseFloat("INFINITY");
      const result: boolean = isFinite(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0610
     * @tc.name testGlobalIsFiniteTest061
     * @tc.desc Verify isFinite returns true for Number safe max plus one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = Number.MAX_SAFE_INTEGER + 1;
      const result: boolean = isFinite(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0620
     * @tc.name testGlobalIsFiniteTest062
     * @tc.desc Verify isFinite returns true for Number safe min minus one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = Number.MIN_SAFE_INTEGER - 1;
      const result: boolean = isFinite(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0630
     * @tc.name testGlobalIsFiniteTest063
     * @tc.desc Verify isFinite returns true for parseFloat int maximum
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = parseFloat("2147483647.0");
      const result: boolean = isFinite(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0640
     * @tc.name testGlobalIsFiniteTest064
     * @tc.desc Verify isFinite returns true for parseFloat int minimum
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = parseFloat("-2147483648.0");
      const result: boolean = isFinite(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0650
     * @tc.name testGlobalIsFiniteTest065
     * @tc.desc Verify isFinite returns true for parseInt int overflow
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = parseInt("2147483648", 10);
      const result: boolean = isFinite(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0660
     * @tc.name testGlobalIsFiniteTest066
     * @tc.desc Verify isFinite returns true for parseInt below int minimum
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = parseInt("-2147483649", 10);
      const result: boolean = isFinite(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0670
     * @tc.name testGlobalIsFiniteTest067
     * @tc.desc isFinite(-128) returns true (byte minimum)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = -128;
      const r: boolean = isFinite(v);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0680
     * @tc.name testGlobalIsFiniteTest068
     * @tc.desc isFinite(Int.MIN_VALUE) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = Int.MIN_VALUE;
      const r: boolean = isFinite(valInner);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0690
     * @tc.name testGlobalIsFiniteTest069
     * @tc.desc isFinite(Long.MIN_VALUE) returns true (long minimum)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = Long.MIN_VALUE;
      const r: boolean = isFinite(valInner);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0700
     * @tc.name testGlobalIsFiniteTest070
     * @tc.desc isFinite(Long.MAX_VALUE) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = Long.MAX_VALUE;
      const r: boolean = isFinite(valInner);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0710
     * @tc.name testGlobalIsFiniteTest071
     * @tc.desc isFinite(16777216.0f) returns true (float exact integer boundary)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = 16777216.0f;
      const r: boolean = isFinite(valInner);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0720
     * @tc.name testGlobalIsFiniteTest072
     * @tc.desc isFinite(16777217.0f) returns true (float precision loss boundary)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = 16777217.0f;
      const r: boolean = isFinite(valInner);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0730
     * @tc.name testGlobalIsFiniteTest073
     * @tc.desc Verify isFinite works with logical AND, OR and NOT
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const andResult: boolean = isFinite(42.0) && isFinite(3.14);
      expect(andResult).assertTrue();
      const orResult: boolean = isFinite(Float.POSITIVE_INFINITY) || isFinite(42.0);
      expect(orResult).assertTrue();
      const notResult: boolean = !isFinite(Float.POSITIVE_INFINITY);
      expect(notResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0740
     * @tc.name testGlobalIsFiniteTest074
     * @tc.desc Verify isFinite returns true for float 0.5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f = 0.5;
      const r: boolean = isFinite(f);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0750
     * @tc.name testGlobalIsFiniteTest075
     * @tc.desc Verify isFinite returns true for float -0.5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f = -0.5;
      const r: boolean = isFinite(f);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0760
     * @tc.name testGlobalIsFiniteTest076
     * @tc.desc Verify isFinite returns false for float -1/0 producing -Float.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f = -1.0 / 0;
      const r: boolean = isFinite(f);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0770
     * @tc.name testGlobalIsFiniteTest077
     * @tc.desc Verify isFinite returns false for float 1/(-0) producing -Float.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f = 1.0 / (-0.0);
      const r: boolean = isFinite(f);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0780
     * @tc.name testGlobalIsFiniteTest078
     * @tc.desc Verify isFinite returns false for Math.sqrt(Float.POSITIVE_INFINITY)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sqrtVal: number = Math.sqrt(Float.POSITIVE_INFINITY);
      const r: boolean = isFinite(sqrtVal);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0790
     * @tc.name testGlobalIsFiniteTest079
     * @tc.desc Verify isFinite returns false for Math.log(Float.POSITIVE_INFINITY)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const logInfVal: number = Math.log(Float.POSITIVE_INFINITY);
      const r: boolean = isFinite(logInfVal);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0800
     * @tc.name testGlobalIsFiniteTest080
     * @tc.desc Verify isFinite returns false for Math.log(0)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const logZeroVal: number = Math.log(0);
      const r: boolean = isFinite(logZeroVal);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0810
     * @tc.name testGlobalIsFiniteTest081
     * @tc.desc Verify isFinite returns false for Math.pow(0,-1)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const powVal: number = Math.pow(0, -1);
      const r: boolean = isFinite(powVal);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0820
     * @tc.name testGlobalIsFiniteTest082
     * @tc.desc Verify isFinite returns false for Math.pow(2,Float.POSITIVE_INFINITY)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const powInfVal: number = Math.pow(2, Float.POSITIVE_INFINITY);
      const r: boolean = isFinite(powInfVal);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0830
     * @tc.name testGlobalIsFiniteTest083
     * @tc.desc Verify isFinite returns false for Math.asin(2)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const asinVal: number = Math.asin(2);
      const r: boolean = isFinite(asinVal);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0840
     * @tc.name testGlobalIsFiniteTest084
     * @tc.desc Verify isFinite returns true for Math.atan(Float.POSITIVE_INFINITY)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const atanVal: number = Math.atan(Float.POSITIVE_INFINITY);
      const r: boolean = isFinite(atanVal);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0850
     * @tc.name testGlobalIsFiniteTest085
     * @tc.desc Verify isFinite returns false for Math.abs(-Float.POSITIVE_INFINITY)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const absVal: number = Math.abs(-Float.POSITIVE_INFINITY);
      const r: boolean = isFinite(absVal);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0860
     * @tc.name testGlobalIsFiniteTest086
     * @tc.desc Verify isFinite returns false for Math.floor(Float.POSITIVE_INFINITY)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const floorVal: number = Math.floor(Float.POSITIVE_INFINITY);
      const r: boolean = isFinite(floorVal);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0870
     * @tc.name testGlobalIsFiniteTest087
     * @tc.desc Verify isFinite returns false for Math.ceil(-Float.POSITIVE_INFINITY)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ceilVal: number = Math.ceil(-Float.POSITIVE_INFINITY);
      const r: boolean = isFinite(ceilVal);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0880
     * @tc.name testGlobalIsFiniteTest088
     * @tc.desc Verify isFinite returns false for Math.max(1, Float.POSITIVE_INFINITY)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxVal: number = Math.max(1, Float.POSITIVE_INFINITY);
      const r: boolean = isFinite(maxVal);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0890
     * @tc.name testGlobalIsFiniteTest089
     * @tc.desc Verify isFinite returns false for Math.min(-1, -Float.POSITIVE_INFINITY)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const minVal: number = Math.min(-1, -Float.POSITIVE_INFINITY);
      const r: boolean = isFinite(minVal);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0900
     * @tc.name testGlobalIsFiniteTest090
     * @tc.desc Verify isFinite used in logical AND with Float.POSITIVE_INFINITY returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: boolean = isFinite(Float.POSITIVE_INFINITY) && isFinite(42);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0910
     * @tc.name testGlobalIsFiniteTest091
     * @tc.desc Verify isFinite used in logical AND with Float.NaN returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: boolean = isFinite(42) && isFinite(Float.NaN);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0920
     * @tc.name testGlobalIsFiniteTest092
     * @tc.desc Verify isFinite used in logical OR with Float.POSITIVE_INFINITY and Float.NaN returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: boolean = isFinite(Float.POSITIVE_INFINITY) || isFinite(Float.NaN);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0930
     * @tc.name testGlobalIsFiniteTest093
     * @tc.desc Verify !!isFinite(42) double negation returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: boolean = !!isFinite(42);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0940
     * @tc.name testGlobalIsFiniteTest094
     * @tc.desc Verify isFinite result used in array filter
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, Float.POSITIVE_INFINITY, 3, Float.NaN, 5];
      const f: number[] = arr.filter((x: number): boolean => isFinite(x));
      expect(f.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0950
     * @tc.name testGlobalIsFiniteTest095
     * @tc.desc Verify isFinite result used in array every
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, 2, 3];
      expect(arr.every((x: number): boolean => isFinite(x))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0960
     * @tc.name testGlobalIsFiniteTest096
     * @tc.desc Verify isFinite result used in array some with Float.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: number[] = [1, Float.NaN, 3];
      expect(arr.some((x: number): boolean => isFinite(x))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0970
     * @tc.name testGlobalIsFiniteTest097
     * @tc.desc Verify isFinite with bitwise AND result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = 0xFF & 0x0F;
      const r: boolean = isFinite(valInner);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0980
     * @tc.name testGlobalIsFiniteTest098
     * @tc.desc Verify isFinite with bitwise OR result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = 0xF0 | 0x0F;
      const r: boolean = isFinite(valInner);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_0990
     * @tc.name testGlobalIsFiniteTest099
     * @tc.desc Verify isFinite with bitwise NOT result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = ~(-1);
      const r: boolean = isFinite(valInner);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_1000
     * @tc.name testGlobalIsFiniteTest100
     * @tc.desc Verify isFinite with hex literal 0x10
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: boolean = isFinite(0x10);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_1010
     * @tc.name testGlobalIsFiniteTest101
     * @tc.desc Verify isFinite with 1e100 large finite value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: boolean = isFinite(1e100);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_1020
     * @tc.name testGlobalIsFiniteTest102
     * @tc.desc Verify isFinite with 1e-100 very small finite value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = 1e-100;
      const r: boolean = isFinite(valInner);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_1030
     * @tc.name testGlobalIsFiniteTest103
     * @tc.desc Verify isFinite is false for Float.NaN and true for isNaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const x = Float.NaN;
      const r1: boolean = isFinite(x);
      expect(r1).assertFalse();
      const r2: boolean = isNaN(x);
      expect(r2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_1040
     * @tc.name testGlobalIsFiniteTest104
     * @tc.desc Verify isFinite is false for Float.POSITIVE_INFINITY and isNaN is false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const x = Float.POSITIVE_INFINITY;
      const r1: boolean = isFinite(x);
      expect(r1).assertFalse();
      const r2: boolean = isNaN(x);
      expect(r2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_1050
     * @tc.name testGlobalIsFiniteTest105
     * @tc.desc Verify isFinite(Math.acos(2)) returns false (acos domain error)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = Math.acos(2);
      const r: boolean = isFinite(valInner);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_1060
     * @tc.name testGlobalIsFiniteTest106
     * @tc.desc Verify isFinite(Math.acosh(0.5)) returns false (acosh domain error)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = Math.acosh(0.5);
      const r: boolean = isFinite(valInner);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_1070
     * @tc.name testGlobalIsFiniteTest107
     * @tc.desc Verify isFinite(Math.atanh(2)) returns false (atanh domain error)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = Math.atanh(2);
      const r: boolean = isFinite(valInner);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_1080
     * @tc.name testGlobalIsFiniteTest108
     * @tc.desc !isFinite(-Float.POSITIVE_INFINITY) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negInfVal: number = -Float.POSITIVE_INFINITY;
      const notFinite: boolean = !isFinite(negInfVal);
      expect(notFinite).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_1090
     * @tc.name testGlobalIsFiniteTest109
     * @tc.desc isFinite with byte type parameter returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 0;
      const r: boolean = isFinite(v);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_1100
     * @tc.name testGlobalIsFiniteTest110
     * @tc.desc isFinite with bytemax type parameter returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 127;
      const r: boolean = isFinite(v);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_1110
     * @tc.name testGlobalIsFiniteTest111
     * @tc.desc isFinite with short type parameter returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: short = 0;
      const r: boolean = isFinite(v);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_1120
     * @tc.name testGlobalIsFiniteTest112
     * @tc.desc isFinite with shortmax type parameter returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: short = 32767;
      const r: boolean = isFinite(v);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_1130
     * @tc.name testGlobalIsFiniteTest113
     * @tc.desc isFinite with int type parameter returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: int = 0;
      const r: boolean = isFinite(v);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_1140
     * @tc.name testGlobalIsFiniteTest114
     * @tc.desc isFinite with intmax type parameter returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: int = Int.MAX_VALUE;
      const r: boolean = isFinite(v);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_1150
     * @tc.name testGlobalIsFiniteTest115
     * @tc.desc isFinite with longmin type parameter returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: long = Long.MIN_VALUE;
      const r: boolean = isFinite(v);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_1160
     * @tc.name testGlobalIsFiniteTest116
     * @tc.desc isFinite with longmax type parameter returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: long = Long.MAX_VALUE;
      const r: boolean = isFinite(v);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_1170
     * @tc.name testGlobalIsFiniteTest117
     * @tc.desc isFinite with floatzero type parameter returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: float = 0.0f;
      const r: boolean = isFinite(v);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_1180
     * @tc.name testGlobalIsFiniteTest118
     * @tc.desc isFinite with floatmax type parameter returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: float = Float.MAX_VALUE;
      const r: boolean = isFinite(v);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_1190
     * @tc.name testGlobalIsFiniteTest119
     * @tc.desc isFinite with floatnan type parameter returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: float = Float.NaN;
      const r: boolean = isFinite(v);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_1200
     * @tc.name testGlobalIsFiniteTest120
     * @tc.desc isFinite with floatinf type parameter returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: float = Float.POSITIVE_INFINITY;
      const r: boolean = isFinite(v);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_1210
     * @tc.name testGlobalIsFiniteTest121
     * @tc.desc isFinite with numbernan type parameter returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: number = Number.NaN;
      const r: boolean = isFinite(v);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_1220
     * @tc.name testGlobalIsFiniteTest122
     * @tc.desc isFinite with numberinf type parameter returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: number = Number.POSITIVE_INFINITY;
      const r: boolean = isFinite(v);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_1230
     * @tc.name testGlobalIsFiniteTest123
     * @tc.desc isFinite with floatnegzero type parameter returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: float = -0.0f;
      const r: boolean = isFinite(v);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_1240
     * @tc.name testGlobalIsFiniteTest124
     * @tc.desc isFinite with floatneginf type parameter returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: float = Float.NEGATIVE_INFINITY;
      const r: boolean = isFinite(v);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_1250
     * @tc.name testGlobalIsFiniteTest125
     * @tc.desc isFinite with floatmin type parameter returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: float = Float.MIN_VALUE;
      const r: boolean = isFinite(v);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_1260
     * @tc.name testGlobalIsFiniteTest126
     * @tc.desc isFinite with numberneginf type parameter returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: number = Number.NEGATIVE_INFINITY;
      const r: boolean = isFinite(v);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_1270
     * @tc.name testGlobalIsFiniteTest127
     * @tc.desc isFinite with intoverflow type parameter returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: int = Int.MAX_VALUE + 1;
      const r: boolean = isFinite(v);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_1280
     * @tc.name testGlobalIsFiniteTest128
     * @tc.desc isFinite with intunderflow type parameter returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: int = Int.MIN_VALUE - 1;
      const r: boolean = isFinite(v);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_1290
     * @tc.name testGlobalIsFiniteTest129
     * @tc.desc isFinite with longoverflow type parameter returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: long = Long.MAX_VALUE + 1;
      const r: boolean = isFinite(v);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_1300
     * @tc.name testGlobalIsFiniteTest130
     * @tc.desc isFinite with longunderflow type parameter returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: long = Long.MIN_VALUE - 1;
      const r: boolean = isFinite(v);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_1310
     * @tc.name testGlobalIsFiniteTest131
     * @tc.desc isFinite with numberoverflow type, overflow double is not finite
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: number = Number.MAX_VALUE * 2;
      const r: boolean = isFinite(v);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_1320
     * @tc.name testGlobalIsFiniteTest132
     * @tc.desc isFinite with integer type min values returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: boolean = isFinite(-128);
      expect(r1).assertTrue();
      const r2: boolean = isFinite(-32768);
      expect(r2).assertTrue();
      const r3: boolean = isFinite(Int.MIN_VALUE);
      expect(r3).assertTrue();
      const r4: boolean = isFinite(Long.MIN_VALUE);
      expect(r4).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_1330
     * @tc.name testGlobalIsFiniteTest133
     * @tc.desc isFinite with integer type max values returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: boolean = isFinite(127);
      expect(r1).assertTrue();
      const r2: boolean = isFinite(32767);
      expect(r2).assertTrue();
      const r3: boolean = isFinite(Int.MAX_VALUE);
      expect(r3).assertTrue();
      const r4: boolean = isFinite(Long.MAX_VALUE);
      expect(r4).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_1340
     * @tc.name testGlobalIsFiniteTest134
     * @tc.desc isFinite with float/number max positive values returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: boolean = isFinite(Float.MAX_VALUE);
      expect(r1).assertTrue();
      const r2: boolean = isFinite(Number.MAX_VALUE);
      expect(r2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_1350
     * @tc.name testGlobalIsFiniteTest135
     * @tc.desc isFinite with float/number max negative values returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: boolean = isFinite(-Float.MAX_VALUE);
      expect(r1).assertTrue();
      const r2: boolean = isFinite(-Number.MAX_VALUE);
      expect(r2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_1360
     * @tc.name testGlobalIsFiniteTest136
     * @tc.desc isFinite with float/number min positive values returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: boolean = isFinite(Float.MIN_VALUE);
      expect(r1).assertTrue();
      const r2: boolean = isFinite(Number.MIN_VALUE);
      expect(r2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_1370
     * @tc.name testGlobalIsFiniteTest137
     * @tc.desc isFinite with positive infinities returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: boolean = isFinite(Float.POSITIVE_INFINITY);
      expect(r1).assertFalse();
      const r2: boolean = isFinite(Number.POSITIVE_INFINITY);
      expect(r2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_1380
     * @tc.name testGlobalIsFiniteTest138
     * @tc.desc isFinite with negative infinities returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: boolean = isFinite(Float.NEGATIVE_INFINITY);
      expect(r1).assertFalse();
      const r2: boolean = isFinite(Number.NEGATIVE_INFINITY);
      expect(r2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_1390
     * @tc.name testGlobalIsFiniteTest139
     * @tc.desc isFinite with positive hex boundary returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: boolean = isFinite(0x7FFFFFFF);
      expect(r1).assertTrue();
      const r2: boolean = isFinite(0x7FFFFFFFFFFFFFFF as long);
      expect(r2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_1400
     * @tc.name testGlobalIsFiniteTest140
     * @tc.desc isFinite with negative hex boundary returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: boolean = isFinite(-0x80000000);
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_1410
     * @tc.name testGlobalIsFiniteTest141
     * @tc.desc isFinite with binary literal returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: boolean = isFinite(0b1111111111111111111111111111111);
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_1420
     * @tc.name testGlobalIsFiniteTest142
     * @tc.desc isFinite with octal literal returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r1: boolean = isFinite(0o7777777777777777 as long);
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_1430
     * @tc.name testGlobalIsFiniteTest143
     * @tc.desc isFinite(short 3) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: short = 3;
      expect(isFinite(val)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_1440
     * @tc.name testGlobalIsFiniteTest144
     * @tc.desc isFinite(byte value widening to number) returns true (byte widening to number should not throw)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: byte = 42;
      const num: number = val;
      const r: boolean = isFinite(num);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_1450
     * @tc.name testGlobalIsFiniteTest145
     * @tc.desc isFinite(short value widening to number) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: short = 1000;
      const num: number = val;
      const r: boolean = isFinite(num);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_1460
     * @tc.name testGlobalIsFiniteTest146
     * @tc.desc isFinite(int value widening to number) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: int = 100000;
      const num: number = val;
      const r: boolean = isFinite(num);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_1470
     * @tc.name testGlobalIsFiniteTest147
     * @tc.desc isFinite(long value widening to number) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: long = 100;
      const num: number = val;
      const r: boolean = isFinite(num);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_1480
     * @tc.name testGlobalIsFiniteTest148
     * @tc.desc isFinite(float value widening to number) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 1.5f;
      const num: number = val;
      const r: boolean = isFinite(num);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_1490
     * @tc.name testGlobalIsFiniteTest149
     * @tc.desc isFinite(obj.num) with object number field 42 returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: NumObj = { num: 42 };
      const r: boolean = isFinite(obj.num);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_1500
     * @tc.name testGlobalIsFiniteTest150
     * @tc.desc isFinite(obj.num) with object number field Number.POSITIVE_INFINITY returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: NumObj = { num: Number.POSITIVE_INFINITY };
      const r: boolean = isFinite(obj.num);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_1510
     * @tc.name testGlobalIsFiniteTest151
     * @tc.desc Verify isFinite throws ClassCastError for null union value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let nullVal: number | null = null;
        isFinite(nullVal as number);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_1520
     * @tc.name testGlobalIsFiniteTest152
     * @tc.desc Verify isFinite throws ClassCastError for undefined union value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let undefVal: number | undefined = undefined;
        isFinite(undefVal as number);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_1530
     * @tc.name testGlobalIsFiniteTest153
     * @tc.desc Verify isFinite throws ClassCastError for empty string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let strVal: number | string = "";
        isFinite(strVal as number);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_1540
     * @tc.name testGlobalIsFiniteTest154
     * @tc.desc Verify isFinite throws ClassCastError for emoji string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let emojiVal: number | string = "🎉";
        isFinite(emojiVal as number);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISFINITE_TEST_1550
     * @tc.name testGlobalIsFiniteTest155
     * @tc.desc Verify isFinite throws ClassCastError for digit string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsFiniteTest155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let strVal: number | string = "123";
        isFinite(strVal as number);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

  });
  }