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

class IntegerBox {
  count: number = 42;
  frac: number = 3.14;
  floatCount: float = 5.0f;
}

export default function GlobalIsIntegerPart_1Test(): void {
  describe("GlobalIsIntegerPart_1Test", (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0010
     * @tc.name testGlobalIsIntegerTest001
     * @tc.desc isInteger(-Float.POSITIVE_INFINITY) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: float = -Float.POSITIVE_INFINITY;
      const r: boolean = isInteger(v);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0020
     * @tc.name testGlobalIsIntegerTest002
     * @tc.desc isInteger(9223372036854775807 as long) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: long = 9223372036854775807;
      const r: boolean = isInteger(v);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0030
     * @tc.name testGlobalIsIntegerTest003
     * @tc.desc isInteger(0.5f) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: float = 0.5f;
      const r: boolean = isInteger(v);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0040
     * @tc.name testGlobalIsIntegerTest004
     * @tc.desc isInteger(5 with byte type) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 5;
      const r1: boolean = isInteger(v);
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0050
     * @tc.name testGlobalIsIntegerTest005
     * @tc.desc isInteger(77) true converted to int 1 via ternary
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: int = 77;
      const result: int = isInteger(v) ? 1 : 0;
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0060
     * @tc.name testGlobalIsIntegerTest006
     * @tc.desc isInteger(Long.MIN_VALUE) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: long = Long.MIN_VALUE;
      const result: boolean = isInteger(v);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0070
     * @tc.name testGlobalIsIntegerTest007
     * @tc.desc isInteger(5 with number type) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: number = 5;
      const r: boolean = isInteger(v);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0080
     * @tc.name testGlobalIsIntegerTest008
     * @tc.desc isInteger(parseInt("abc")) returns false (NaN from non-numeric string)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p: number = parseInt("abc");
      const r: boolean = isInteger(p);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0090
     * @tc.name testGlobalIsIntegerTest009
     * @tc.desc isInteger(byte 0) and isInteger(int 0) return same result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const vb: byte = 0;
      const vi: int = 0;
      const r1: boolean = isInteger(vb);
      const r2: boolean = isInteger(vi);
      expect(r1).assertEqual(true);
      expect(r2).assertEqual(true);
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0100
     * @tc.name testGlobalIsIntegerTest010
     * @tc.desc isInteger(byte 1) and isInteger(float 1.0) return same result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const vb: byte = 1;
      const vf: float = 1.0f;
      const r1: boolean = isInteger(vb);
      const r2: boolean = isInteger(vf);
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0110
     * @tc.name testGlobalIsIntegerTest011
     * @tc.desc isInteger(parseFloat("abc")) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: number = parseFloat("abc");
      const r: boolean = isInteger(v);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0120
     * @tc.name testGlobalIsIntegerTest012
     * @tc.desc isInteger(parseInt("xyz")) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parsedInner: number = parseInt("xyz");
      const r: boolean = isInteger(parsedInner);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0130
     * @tc.name testGlobalIsIntegerTest013
     * @tc.desc isInteger(parseFloat("9007199254740991")) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parsedInner: number = parseFloat("9007199254740991");
      const result: boolean = isInteger(parsedInner);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0140
     * @tc.name testGlobalIsIntegerTest014
     * @tc.desc isInteger(parseInt("2147483647")) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const result: number = parseInt("2147483647");
        const resultIsResult: boolean = isInteger(result);
        expect(resultIsResult).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0150
     * @tc.name testGlobalIsIntegerTest015
     * @tc.desc isInteger(result) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const result: number = parseInt("  ");
        const resultIsResult: boolean = isInteger(result);
        expect(resultIsResult).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0160
     * @tc.name testGlobalIsIntegerTest016
     * @tc.desc isInteger(parseFloat("1e2")) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const result: number = parseFloat("1e2");
        const resultIsResult: boolean = isInteger(result);
        expect(resultIsResult).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0170
     * @tc.name testGlobalIsIntegerTest017
     * @tc.desc isInteger(100 as number value) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = 100;
      const r: boolean = isInteger(valInner);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0180
     * @tc.name testGlobalIsIntegerTest018
     * @tc.desc isInteger(Int.MAX_VALUE as number value) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = Int.MAX_VALUE;
      const r: boolean = isInteger(valInner);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0190
     * @tc.name testGlobalIsIntegerTest019
     * @tc.desc isInteger(3.14f) returns false for non-integer float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = 3.14f;
      const r: boolean = isInteger(valInner);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0200
     * @tc.name testGlobalIsIntegerTest020
     * @tc.desc isInteger(5.0f) returns true for integer-value float
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = 5.0f;
      const r: boolean = isInteger(valInner);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0210
     * @tc.name testGlobalIsIntegerTest021
     * @tc.desc isInteger(parseFloat("42.0")) returns true (cross-API)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parsedInner: number = parseFloat("42.0");
      const r: boolean = isInteger(parsedInner);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0220
     * @tc.name testGlobalIsIntegerTest022
     * @tc.desc isInteger(parseFloat("3.5")) returns false (cross-API non-integer)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parsedInner: number = parseFloat("3.5");
      const r: boolean = isInteger(parsedInner);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0230
     * @tc.name testGlobalIsIntegerTest023
     * @tc.desc isInteger(parseFloat("Infinity")) returns false (cross-API Float.POSITIVE_INFINITY)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parsedInner: number = parseFloat("Infinity");
      const r: boolean = isInteger(parsedInner);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0240
     * @tc.name testGlobalIsIntegerTest024
     * @tc.desc isInteger(parseFloat("NaN")) returns false (cross-API Float.NaN)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parsedInner: number = parseFloat("NaN");
      const r: boolean = isInteger(parsedInner);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0250
     * @tc.name testGlobalIsIntegerTest025
     * @tc.desc isInteger(parseInt("42")) returns true (cross-API parseInt)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parsedInner: number = parseInt("42");
      const r: boolean = isInteger(parsedInner);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0260
     * @tc.name testGlobalIsIntegerTest026
     * @tc.desc isInteger(parseInt("", 10)) returns false (Float.NaN from empty string)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parsedInner: number = parseInt("", 10);
      const r: boolean = isInteger(parsedInner);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0270
     * @tc.name testGlobalIsIntegerTest027
     * @tc.desc isInteger(1.0 / 0.0) returns false (Float.POSITIVE_INFINITY from division)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = 1.0 / 0.0;
      const r: boolean = isInteger(valInner);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0280
     * @tc.name testGlobalIsIntegerTest028
     * @tc.desc isInteger(0.0 / 0.0) returns false (Float.NaN from 0/0)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = 0.0 / 0.0;
      const r: boolean = isInteger(valInner);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0290
     * @tc.name testGlobalIsIntegerTest029
     * @tc.desc isInteger with loop: [0, 1, -1, 42, Number.MAX_SAFE_INTEGER] all true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: number[] = [0, 1, -1, 42, Number.MAX_SAFE_INTEGER];
      for (let i: int = 0;
      i < values.length;
      i = i + 1) {
        const valInner: number = values[i];
      const r: boolean = isInteger(valInner);
      expect(r).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0300
     * @tc.name testGlobalIsIntegerTest030
     * @tc.desc isInteger with loop: [3.5, 0.1, -0.5, Float.NaN, Float.POSITIVE_INFINITY] all false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: number[] = [3.5, 0.1, -0.5, Float.NaN, Float.POSITIVE_INFINITY];
      for (let i: int = 0;
      i < values.length;
      i = i + 1) {
        const valInner: number = values[i];
      const r: boolean = isInteger(valInner);
      expect(r).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0310
     * @tc.name testGlobalIsIntegerTest031
     * @tc.desc isInteger(parseFloat("5e-1")) returns false (0.5 not integer)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parsedInner: number = parseFloat("5e-1");
      const r: boolean = isInteger(parsedInner);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0320
     * @tc.name testGlobalIsIntegerTest032
     * @tc.desc isInteger(parseFloat("1e3")) returns true (1000 is integer)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parsedInner: number = parseFloat("1e3");
      const r: boolean = isInteger(parsedInner);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0330
     * @tc.name testGlobalIsIntegerTest033
     * @tc.desc isInteger(1e308 * 10) returns false (overflow to Float.POSITIVE_INFINITY)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = 1e308 * 10;
      const r: boolean = isInteger(valInner);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0340
     * @tc.name testGlobalIsIntegerTest034
     * @tc.desc isInteger(null as Double) throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        isInteger(null as Double);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0350
     * @tc.name testGlobalIsIntegerTest035
     * @tc.desc isInteger(0.0000001) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = 0.0000001;
      const r: boolean = isInteger(valInner);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0360
     * @tc.name testGlobalIsIntegerTest036
     * @tc.desc isInteger(40.5) returns false (fractional number)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = 40.5;
      const r: boolean = isInteger(valInner);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0370
     * @tc.name testGlobalIsIntegerTest037
     * @tc.desc isInteger(Number.MIN_VALUE) returns false (subnormal is not an integer)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = Number.MIN_VALUE;
      const r: boolean = isInteger(valInner);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0380
     * @tc.name testGlobalIsIntegerTest038
     * @tc.desc isInteger(parseFloat("42.")) returns true (trailing decimal, integer value)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parsedInner: number = parseFloat("42.");
      const r: boolean = isInteger(parsedInner);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0390
     * @tc.name testGlobalIsIntegerTest039
     * @tc.desc isInteger(parseFloat(".42")) returns false (leading decimal, fractional value)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parsedInner: number = parseFloat(".42");
      const r: boolean = isInteger(parsedInner);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0400
     * @tc.name testGlobalIsIntegerTest040
     * @tc.desc isInteger(parseFloat("1.25e2")) returns true (exponent producing integer 125)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parsedInner: number = parseFloat("1.25e2");
      const r: boolean = isInteger(parsedInner);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0410
     * @tc.name testGlobalIsIntegerTest041
     * @tc.desc isInteger(parseFloat("1.25e-1")) returns false (negative exponent produces fraction)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parsedInner: number = parseFloat("1.25e-1");
      const r: boolean = isInteger(parsedInner);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0420
     * @tc.name testGlobalIsIntegerTest042
     * @tc.desc isInteger(Float.MIN_VALUE) returns false (Float.MIN_VALUE is 1.4e-45f, a non-integer value)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = Float.MIN_VALUE;
      const r: boolean = isInteger(valInner);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0430
     * @tc.name testGlobalIsIntegerTest043
     * @tc.desc isInteger(16777217.0f) returns true (float rounds to 16777216.0, an integer)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = 16777217.0f;
      const r: boolean = isInteger(valInner);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0440
     * @tc.name testGlobalIsIntegerTest044
     * @tc.desc isInteger(-16777217.0f) returns true (float rounds to -16777216.0, an integer)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = -16777217.0f;
      const r: boolean = isInteger(valInner);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0450
     * @tc.name testGlobalIsIntegerTest045
     * @tc.desc isInteger(Float.EPSILON) returns false (tiny fraction, not an integer)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = Float.EPSILON;
      const r: boolean = isInteger(valInner);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0460
     * @tc.name testGlobalIsIntegerTest046
     * @tc.desc Verify isInteger returns false for parseInt invalid radix
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = parseInt("10", 37);
      const result: boolean = isInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0470
     * @tc.name testGlobalIsIntegerTest047
     * @tc.desc Verify isInteger returns false for parseInt underscore prefix
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = parseInt("_123", 10);
      const result: boolean = isInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0480
     * @tc.name testGlobalIsIntegerTest048
     * @tc.desc Verify isInteger returns true for parseInt comma truncation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = parseInt("123, 456", 10);
      const result: boolean = isInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0490
     * @tc.name testGlobalIsIntegerTest049
     * @tc.desc Verify isInteger returns true for parseFloat comma truncation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = parseFloat("42, 5");
      const result: boolean = isInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0500
     * @tc.name testGlobalIsIntegerTest050
     * @tc.desc Verify isInteger returns false for parseFloat fraction underscore truncation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = parseFloat("42.5_6");
      const result: boolean = isInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0510
     * @tc.name testGlobalIsIntegerTest051
     * @tc.desc Verify isInteger returns true for parseInt safe integer maximum
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = parseInt("9007199254740991", 10);
      const result: boolean = isInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0520
     * @tc.name testGlobalIsIntegerTest052
     * @tc.desc Verify isInteger returns true for parseInt safe integer minimum
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = parseInt("-9007199254740991", 10);
      const result: boolean = isInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0530
     * @tc.name testGlobalIsIntegerTest053
     * @tc.desc Verify isInteger returns true for Number safe max plus one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = Number.MAX_SAFE_INTEGER + 1;
      const result: boolean = isInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0540
     * @tc.name testGlobalIsIntegerTest054
     * @tc.desc Verify isInteger returns true for Number safe min minus one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = Number.MIN_SAFE_INTEGER - 1;
      const result: boolean = isInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0550
     * @tc.name testGlobalIsIntegerTest055
     * @tc.desc Verify isInteger returns false for negative Number EPSILON
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = -Number.EPSILON;
      const result: boolean = isInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0560
     * @tc.name testGlobalIsIntegerTest056
     * @tc.desc Verify isInteger returns false for negative Number MIN_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = -Number.MIN_VALUE;
      const result: boolean = isInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0570
     * @tc.name testGlobalIsIntegerTest057
     * @tc.desc Verify isInteger returns true for negative Number MAX_VALUE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = -Number.MAX_VALUE;
      const result: boolean = isInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0580
     * @tc.name testGlobalIsIntegerTest058
     * @tc.desc Verify isInteger returns false for parseFloat XSS suffix
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = parseFloat("1.5<script>");
      const result: boolean = isInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0590
     * @tc.name testGlobalIsIntegerTest059
     * @tc.desc Verify isInteger returns true for parseInt XSS suffix
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = parseInt("15<script>", 10);
      const result: boolean = isInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0600
     * @tc.name testGlobalIsIntegerTest060
     * @tc.desc Verify isInteger returns true for parseFloat int maximum decimal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = parseFloat("2147483647.0");
      const result: boolean = isInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0610
     * @tc.name testGlobalIsIntegerTest061
     * @tc.desc Verify isInteger returns true for parseFloat int minimum decimal
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = parseFloat("-2147483648.0");
      const result: boolean = isInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0620
     * @tc.name testGlobalIsIntegerTest062
     * @tc.desc Verify isInteger returns true for parseInt int overflow
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = parseInt("2147483648", 10);
      const result: boolean = isInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0630
     * @tc.name testGlobalIsIntegerTest063
     * @tc.desc Verify isInteger returns true for parseInt below int minimum
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = parseInt("-2147483649", 10);
      const result: boolean = isInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0640
     * @tc.name testGlobalIsIntegerTest064
     * @tc.desc Verify isInteger returns true for parseFloat binary looking string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = parseFloat("0b10");
      const result: boolean = isInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0650
     * @tc.name testGlobalIsIntegerTest065
     * @tc.desc Verify isInteger returns true for parseFloat hex looking string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = parseFloat("0x10");
      const result: boolean = isInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0660
     * @tc.name testGlobalIsIntegerTest066
     * @tc.desc Verify isInteger returns false for parseFloat long mantissa
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = parseFloat("1.2345678901234567");
      const result: boolean = isInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0670
     * @tc.name testGlobalIsIntegerTest067
     * @tc.desc Verify isInteger returns true for parseFloat huge exponent with suffix
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = parseFloat("6.02e+23mol");
      const result: boolean = isInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0680
     * @tc.name testGlobalIsIntegerTest068
     * @tc.desc Verify isInteger returns true for parseInt base 11 digit a
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = parseInt("a", 11);
      const result: boolean = isInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0690
     * @tc.name testGlobalIsIntegerTest069
     * @tc.desc Verify isInteger returns false for parseInt digit b outside base 11
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = parseInt("b", 11);
      const result: boolean = isInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0700
     * @tc.name testGlobalIsIntegerTest070
     * @tc.desc Verify isInteger returns true for parseInt base 20 digit j
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = parseInt("j", 20);
      const result: boolean = isInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0710
     * @tc.name testGlobalIsIntegerTest071
     * @tc.desc Verify isInteger returns false for parseInt digit k outside base 20
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = parseInt("k", 20);
      const result: boolean = isInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0720
     * @tc.name testGlobalIsIntegerTest072
     * @tc.desc Verify isInteger returns true for parseInt base 35 digit y
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = parseInt("y", 35);
      const result: boolean = isInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0730
     * @tc.name testGlobalIsIntegerTest073
     * @tc.desc Verify isInteger returns false for parseInt digit z outside base 35
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = parseInt("z", 35);
      const result: boolean = isInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0740
     * @tc.name testGlobalIsIntegerTest074
     * @tc.desc Verify isInteger returns false for parseFloat Japanese suffix truncation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = parseFloat("3.5テスト");
      const result: boolean = isInteger(value);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0750
     * @tc.name testGlobalIsIntegerTest075
     * @tc.desc Verify isInteger returns true for parseInt Japanese suffix truncation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = parseInt("42テスト");
      const result: boolean = isInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0760
     * @tc.name testGlobalIsIntegerTest076
     * @tc.desc Verify isInteger returns true for parseFloat negative zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value: number = parseFloat("-0.0");
      const result: boolean = isInteger(value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0770
     * @tc.name testGlobalIsIntegerTest077
     * @tc.desc isInteger(-128) returns true (byte minimum)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = -128;
      const r: boolean = isInteger(valInner);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0780
     * @tc.name testGlobalIsIntegerTest078
     * @tc.desc isInteger(Int.MIN_VALUE) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = Int.MIN_VALUE;
      const r: boolean = isInteger(valInner);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0790
     * @tc.name testGlobalIsIntegerTest079
     * @tc.desc isInteger(Long.MAX_VALUE) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = Long.MAX_VALUE;
      const r: boolean = isInteger(valInner);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0800
     * @tc.name testGlobalIsIntegerTest080
     * @tc.desc isInteger(16777216.0f) returns true (float exact integer boundary)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = 16777216.0f;
      const r: boolean = isInteger(valInner);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0810
     * @tc.name testGlobalIsIntegerTest081
     * @tc.desc Verify isInteger returns true for hex literal 0xFF
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: boolean = isInteger(0xFF);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0820
     * @tc.name testGlobalIsIntegerTest082
     * @tc.desc Verify isInteger returns true for hex literal 0xABC
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: boolean = isInteger(0xABC);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0830
     * @tc.name testGlobalIsIntegerTest083
     * @tc.desc Verify isInteger returns true for binary 0b1010
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: boolean = isInteger(0b1010);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0840
     * @tc.name testGlobalIsIntegerTest084
     * @tc.desc Verify isInteger returns true for binary 0b11111111
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: boolean = isInteger(0b11111111);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0850
     * @tc.name testGlobalIsIntegerTest085
     * @tc.desc Verify isInteger returns true for 127+1 (int arithmetic, no byte overflow)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = 127 + 1;
      const r: boolean = isInteger(b);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0860
     * @tc.name testGlobalIsIntegerTest086
     * @tc.desc Verify isInteger returns true for -128-1 (int arithmetic)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = -128 - 1;
      const r: boolean = isInteger(b);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0870
     * @tc.name testGlobalIsIntegerTest087
     * @tc.desc Verify isInteger returns true for 32767+1 (int arithmetic, no short overflow)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s = 32767 + 1;
      const r: boolean = isInteger(s);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0880
     * @tc.name testGlobalIsIntegerTest088
     * @tc.desc Verify isInteger returns true for hex 0xFFFF (65535, int literal)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s = 0xFFFF;
      const r: boolean = isInteger(s);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0890
     * @tc.name testGlobalIsIntegerTest089
     * @tc.desc Verify isInteger returns true for hex 0xFFFFFFFF (4294967295, long literal)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let i = 0xFFFFFFFF;
      const r: boolean = isInteger(i);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0900
     * @tc.name testGlobalIsIntegerTest090
     * @tc.desc Verify isInteger returns true for float 100.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: float = 100.0f;
      const r: boolean = isInteger(f);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0910
     * @tc.name testGlobalIsIntegerTest091
     * @tc.desc Verify isInteger returns true for float -5.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: float = -5.0f;
      const r: boolean = isInteger(f);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0920
     * @tc.name testGlobalIsIntegerTest092
     * @tc.desc Verify isInteger returns false for float -2.718f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: float = -2.718f;
      const r: boolean = isInteger(f);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0930
     * @tc.name testGlobalIsIntegerTest093
     * @tc.desc Verify isInteger returns false for float 1.5f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: float = 1.5f;
      const r: boolean = isInteger(f);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0940
     * @tc.name testGlobalIsIntegerTest094
     * @tc.desc Verify isInteger returns false for float 0.25f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: float = 0.25f;
      const r: boolean = isInteger(f);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0950
     * @tc.name testGlobalIsIntegerTest095
     * @tc.desc Verify isInteger returns false for float -Float.POSITIVE_INFINITY
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: float = Double.toFloat(-Float.POSITIVE_INFINITY);
      const r: boolean = isInteger(f);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0960
     * @tc.name testGlobalIsIntegerTest096
     * @tc.desc Verify isInteger returns false for float 0.1f+0.2f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: float = 0.1f + 0.2f;
      const r: boolean = isInteger(f);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0970
     * @tc.name testGlobalIsIntegerTest097
     * @tc.desc Verify isInteger returns true for float 1.0f+2.0f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: float = 1.0f + 2.0f;
      const r: boolean = isInteger(f);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0980
     * @tc.name testGlobalIsIntegerTest098
     * @tc.desc Verify isInteger returns true for float 5.5f-3.5f
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let f: float = 5.5f - 3.5f;
      const r: boolean = isInteger(f);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_0990
     * @tc.name testGlobalIsIntegerTest099
     * @tc.desc Verify isInteger returns true for Math.sqrt(4)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sqrtVal: number = Math.sqrt(4);
      const r: boolean = isInteger(sqrtVal);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_1000
     * @tc.name testGlobalIsIntegerTest100
     * @tc.desc Verify isInteger returns false for Math.sqrt(2)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sqrtVal: number = Math.sqrt(2);
      const r: boolean = isInteger(sqrtVal);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_1010
     * @tc.name testGlobalIsIntegerTest101
     * @tc.desc Verify isInteger returns true for Math.ceil(3.2)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ceilVal: number = Math.ceil(3.2);
      const r: boolean = isInteger(ceilVal);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_1020
     * @tc.name testGlobalIsIntegerTest102
     * @tc.desc Verify isInteger returns true for Math.floor(3.5)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const floorVal: number = Math.floor(3.5);
      const r: boolean = isInteger(floorVal);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_1030
     * @tc.name testGlobalIsIntegerTest103
     * @tc.desc Verify isInteger returns true for Math.round(3.4)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const roundVal: number = Math.round(3.4);
      const r: boolean = isInteger(roundVal);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_1040
     * @tc.name testGlobalIsIntegerTest104
     * @tc.desc Verify isInteger returns true for Math.abs(-5)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const absVal: number = Math.abs(-5);
      const r: boolean = isInteger(absVal);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_1050
     * @tc.name testGlobalIsIntegerTest105
     * @tc.desc Verify isInteger returns false for Math.abs(-3.5)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const absVal: number = Math.abs(-3.5);
      const r: boolean = isInteger(absVal);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_1060
     * @tc.name testGlobalIsIntegerTest106
     * @tc.desc Verify isInteger returns true for Math.pow(2, 3)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const powVal: number = Math.pow(2, 3);
      const r: boolean = isInteger(powVal);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_1070
     * @tc.name testGlobalIsIntegerTest107
     * @tc.desc Verify isInteger returns false for Math.pow(2, -1)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const powVal: number = Math.pow(2, -1);
      const r: boolean = isInteger(powVal);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_1080
     * @tc.name testGlobalIsIntegerTest108
     * @tc.desc Verify isInteger returns false for Math.sqrt(-1)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sqrtVal: number = Math.sqrt(-1);
      const r: boolean = isInteger(sqrtVal);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_1090
     * @tc.name testGlobalIsIntegerTest109
     * @tc.desc Verify isInteger returns true for Math.trunc(3.7)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const truncVal: number = Math.trunc(3.7);
      const r: boolean = isInteger(truncVal);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_1100
     * @tc.name testGlobalIsIntegerTest110
     * @tc.desc Verify isInteger with array element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [1, 2.5, 3];
      const valInner6: number = arr[0];
      const r1: boolean = isInteger(valInner6);
      expect(r1).assertTrue();
      const valInner4: number = arr[1];
      const r2: boolean = isInteger(valInner4);
      expect(r2).assertFalse();
      const valInner2: number = arr[2];
      const r3: boolean = isInteger(valInner2);
      expect(r3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_1110
     * @tc.name testGlobalIsIntegerTest111
     * @tc.desc Verify isInteger with function return value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const getValue = (): int => {
        return 42;
      }
      expect(isInteger(getValue())).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_1120
     * @tc.name testGlobalIsIntegerTest112
     * @tc.desc Verify isInteger with reassignment
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 10;
      const r1: boolean = isInteger(x);
      expect(r1).assertTrue();
      x = 10.5;
      const r2: boolean = isInteger(x);
      expect(r2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_1130
     * @tc.name testGlobalIsIntegerTest113
     * @tc.desc Verify isInteger in if condition
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: boolean = false;
      if (isInteger(42)) { result = true;
      }
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_1140
     * @tc.name testGlobalIsIntegerTest114
     * @tc.desc Verify isInteger in ternary operator
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = isInteger(42) ? "int" : "not int";
      expect(result).assertEqual("int");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_1150
     * @tc.name testGlobalIsIntegerTest115
     * @tc.desc Verify isInteger(Double.NEGATIVE_INFINITY) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = Double.NEGATIVE_INFINITY;
      const r: boolean = isInteger(valInner);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_1160
     * @tc.name testGlobalIsIntegerTest116
     * @tc.desc Verify isInteger(Double.MAX_VALUE) returns true (integer-valued double)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = Double.MAX_VALUE;
      const r: boolean = isInteger(valInner);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_1170
     * @tc.name testGlobalIsIntegerTest117
     * @tc.desc Verify isInteger(Double(5.0)) returns true (integer-valued double)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner10: number = 5.0;
      const r: boolean = isInteger(valInner10);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_1180
     * @tc.name testGlobalIsIntegerTest118
     * @tc.desc isInteger with byte type parameter returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 0;
      const r: boolean = isInteger(v);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_1190
     * @tc.name testGlobalIsIntegerTest119
     * @tc.desc isInteger with bytemin type parameter returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = -128;
      const r: boolean = isInteger(v);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_1200
     * @tc.name testGlobalIsIntegerTest120
     * @tc.desc isInteger with bytemax type parameter returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: byte = 127;
      const r: boolean = isInteger(v);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_1210
     * @tc.name testGlobalIsIntegerTest121
     * @tc.desc isInteger with short type parameter returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: short = 0;
      const r: boolean = isInteger(v);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_1220
     * @tc.name testGlobalIsIntegerTest122
     * @tc.desc isInteger with shortmin type parameter returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: short = -32768;
      const r: boolean = isInteger(v);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_1230
     * @tc.name testGlobalIsIntegerTest123
     * @tc.desc isInteger with shortmax type parameter returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: short = 32767;
      const r: boolean = isInteger(v);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_1240
     * @tc.name testGlobalIsIntegerTest124
     * @tc.desc isInteger with int type parameter returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: int = 0;
      const r: boolean = isInteger(v);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_1250
     * @tc.name testGlobalIsIntegerTest125
     * @tc.desc isInteger with intmin type parameter returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: int = Int.MIN_VALUE;
      const r: boolean = isInteger(v);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_1260
     * @tc.name testGlobalIsIntegerTest126
     * @tc.desc isInteger with intmax type parameter returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: int = Int.MAX_VALUE;
      const r: boolean = isInteger(v);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_1270
     * @tc.name testGlobalIsIntegerTest127
     * @tc.desc isInteger with long type parameter returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: long = 0;
      const r: boolean = isInteger(v);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_1280
     * @tc.name testGlobalIsIntegerTest128
     * @tc.desc isInteger with longmax type parameter returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: long = Long.MAX_VALUE;
      const r: boolean = isInteger(v);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_1290
     * @tc.name testGlobalIsIntegerTest129
     * @tc.desc isInteger with floatzero type parameter returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: float = 0.0f;
      const r: boolean = isInteger(v);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_1300
     * @tc.name testGlobalIsIntegerTest130
     * @tc.desc isInteger with floatnegzero type parameter returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: float = -0.0f;
      const r: boolean = isInteger(v);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_1310
     * @tc.name testGlobalIsIntegerTest131
     * @tc.desc isInteger with floatnan type parameter returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: float = Float.NaN;
      const r: boolean = isInteger(v);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_1320
     * @tc.name testGlobalIsIntegerTest132
     * @tc.desc isInteger with floatinf type parameter returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: float = Float.POSITIVE_INFINITY;
      const r: boolean = isInteger(v);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_1330
     * @tc.name testGlobalIsIntegerTest133
     * @tc.desc isInteger with numberfrac type parameter returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: number = 3.14;
      const r: boolean = isInteger(v);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_1340
     * @tc.name testGlobalIsIntegerTest134
     * @tc.desc isInteger with numbernan type parameter returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: number = Number.NaN;
      const r: boolean = isInteger(v);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_1350
     * @tc.name testGlobalIsIntegerTest135
     * @tc.desc isInteger with floatneginf type parameter returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: float = Float.NEGATIVE_INFINITY;
      const r: boolean = isInteger(v);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_1360
     * @tc.name testGlobalIsIntegerTest136
     * @tc.desc isInteger with floatmax type parameter returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: float = Float.MAX_VALUE;
      const r: boolean = isInteger(v);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISINTEGER_TEST_1370
     * @tc.name testGlobalIsIntegerTest137
     * @tc.desc isInteger with numberneginf type parameter returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsIntegerTest137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
