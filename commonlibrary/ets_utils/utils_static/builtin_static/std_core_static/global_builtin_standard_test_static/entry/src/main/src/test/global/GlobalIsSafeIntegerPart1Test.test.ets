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

class SafeIntegerBox {
  val: number = 42;
  unsafeVal: number = 9007199254740992;
}

export default function GlobalIsSafeIntegerPart_1Test(): void {
  describe("GlobalIsSafeIntegerPart_1Test", (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0010
     * @tc.name testGlobalIsSafeIntegerTest001
     * @tc.desc isSafeInteger(-1) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = -1;
      const r: boolean = isSafeInteger(valInner);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0020
     * @tc.name testGlobalIsSafeIntegerTest002
     * @tc.desc isSafeInteger(long 9007199254740992 - 1 = Number.MAX_SAFE_INTEGER) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base: long = 9007199254740992;
      const v: long = base - 1;
      const _r: boolean = isSafeInteger(v);
      expect(_r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0030
     * @tc.name testGlobalIsSafeIntegerTest003
     * @tc.desc isSafeInteger(-9007199254740992) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base: long = -9007199254740991;
      const v: long = base - 1;
      const _r: boolean = isSafeInteger(v);
      expect(_r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0040
     * @tc.name testGlobalIsSafeIntegerTest004
     * @tc.desc isSafeInteger(long = base + 1, -9007199254740991) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base: long = -9007199254740992;
      const v: long = base + 1;
      const _r: boolean = isSafeInteger(v);
      expect(_r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0050
     * @tc.name testGlobalIsSafeIntegerTest005
     * @tc.desc isSafeInteger(long = 1073741824) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base: long = 1073741824;
      const v: long = base * 4;
      const _r: boolean = isSafeInteger(v);
      expect(_r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0060
     * @tc.name testGlobalIsSafeIntegerTest006
     * @tc.desc isSafeInteger(long = base-1000, 9223372036854774807) returns false (exceeds 2^53)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base: long = 9223372036854775807;
      const v: long = base - 1000;
      const _r: boolean = isSafeInteger(v);
      expect(_r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0070
     * @tc.name testGlobalIsSafeIntegerTest007
     * @tc.desc isSafeInteger(long = Long.MIN_VALUE) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: long = Long.MIN_VALUE;
      const _r: boolean = isSafeInteger(v);
      expect(_r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0080
     * @tc.name testGlobalIsSafeIntegerTest008
     * @tc.desc isSafeInteger(float = 0x10f) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: float = 0x10f;
      const _r: boolean = isSafeInteger(v);
      expect(_r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0090
     * @tc.name testGlobalIsSafeIntegerTest009
     * @tc.desc isSafeInteger(float = -1f) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: float = -1f;
      const _r: boolean = isSafeInteger(v);
      expect(_r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0100
     * @tc.name testGlobalIsSafeIntegerTest010
     * @tc.desc isSafeInteger(float = -0.5f) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: float = -0.5f;
      const _r: boolean = isSafeInteger(v);
      expect(_r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0110
     * @tc.name testGlobalIsSafeIntegerTest011
     * @tc.desc isSafeInteger(number = 1e-1f) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: number = 1e-1f;
      const _r: boolean = isSafeInteger(v);
      expect(_r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0120
     * @tc.name testGlobalIsSafeIntegerTest012
     * @tc.desc isSafeInteger(number = -1e-1f) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: number = -1e-1f;
      const _r: boolean = isSafeInteger(v);
      expect(_r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0130
     * @tc.name testGlobalIsSafeIntegerTest013
     * @tc.desc isSafeInteger for float division results: 1/2=false, 1/1=true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const halfFloat: number = 1.0f / (2.0f);
      expect(isSafeInteger(halfFloat)).assertFalse();
      const oneFloat: number = 1.0f / (1.0f);
      expect(isSafeInteger(oneFloat)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0140
     * @tc.name testGlobalIsSafeIntegerTest014
     * @tc.desc isSafeInteger(number = 1.0f + 2.0f) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: number = 1.0f + 2.0f;
      const r: boolean = isSafeInteger(v);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0150
     * @tc.name testGlobalIsSafeIntegerTest015
     * @tc.desc isSafeInteger(number = 10.0f - 0.5f) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: number = 10.0f - 0.5f;
      const _r: boolean = isSafeInteger(v);
      expect(_r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0160
     * @tc.name testGlobalIsSafeIntegerTest016
     * @tc.desc isSafeInteger(number = 10.0f - 10.0f) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: number = 10.0f - 10.0f;
      const _r: boolean = isSafeInteger(v);
      expect(_r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0170
     * @tc.name testGlobalIsSafeIntegerTest017
     * @tc.desc isSafeInteger(number = 3.0f * 3.0f) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: number = 3.0f * 3.0f;
      const _r: boolean = isSafeInteger(v);
      expect(_r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0180
     * @tc.name testGlobalIsSafeIntegerTest018
     * @tc.desc isSafeInteger(float = Float.MAX_VALUE) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: float = Float.MAX_VALUE;
      const _r: boolean = isSafeInteger(v);
      expect(_r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0190
     * @tc.name testGlobalIsSafeIntegerTest019
     * @tc.desc isSafeInteger(Float.MIN_VALUE) returns true (underflows to 0)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: float = Float.MIN_VALUE;
      const _r: boolean = isSafeInteger(v);
      expect(_r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0200
     * @tc.name testGlobalIsSafeIntegerTest020
     * @tc.desc isSafeInteger(float = 0.5f) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: float = 0.5f;
      const _r: boolean = isSafeInteger(v);
      expect(_r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0210
     * @tc.name testGlobalIsSafeIntegerTest021
     * @tc.desc isSafeInteger(1.4e-45) returns true (underflows to 0)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: float = 1.4e-45f;
      const _r: boolean = isSafeInteger(f);
      expect(_r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0220
     * @tc.name testGlobalIsSafeIntegerTest022
     * @tc.desc isSafeInteger(number = 5e-324) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: number = 5e-324;
      const _r: boolean = isSafeInteger(d);
      expect(_r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0230
     * @tc.name testGlobalIsSafeIntegerTest023
     * @tc.desc isSafeInteger(number = 2.220446049250313e-16) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: number = 2.220446049250313e-16;
      const _r: boolean = isSafeInteger(d);
      expect(_r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0240
     * @tc.name testGlobalIsSafeIntegerTest024
     * @tc.desc isSafeInteger(number = 2.0e-10) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: number = 2.0e-10;
      const _r: boolean = isSafeInteger(d);
      expect(_r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0250
     * @tc.name testGlobalIsSafeIntegerTest025
     * @tc.desc isSafeInteger(number = -2.0e-10) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: number = -2.0e-10;
      const _r: boolean = isSafeInteger(d);
      expect(_r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0260
     * @tc.name testGlobalIsSafeIntegerTest026
     * @tc.desc isSafeInteger(long = (-128 as long)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: long = (-128 as long);
      const _r: boolean = isSafeInteger(v);
      expect(_r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0270
     * @tc.name testGlobalIsSafeIntegerTest027
     * @tc.desc isSafeInteger(long = (2147483647 as long)) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: long = (2147483647 as long);
      const _r: boolean = isSafeInteger(v);
      expect(_r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0280
     * @tc.name testGlobalIsSafeIntegerTest028
     * @tc.desc isSafeInteger(long = 9007199254740993) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: long = 9007199254740993;
      const _r: boolean = isSafeInteger(v);
      expect(_r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0290
     * @tc.name testGlobalIsSafeIntegerTest029
     * @tc.desc isSafeInteger(long = (-10000000000000000 as long)) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: long = (-10000000000000000 as long);
      const _r: boolean = isSafeInteger(v);
      expect(_r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0300
     * @tc.name testGlobalIsSafeIntegerTest030
     * @tc.desc isSafeInteger(float = 1.5f) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: float = 1.5f;
      const _r: boolean = isSafeInteger(f);
      expect(_r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0310
     * @tc.name testGlobalIsSafeIntegerTest031
     * @tc.desc isSafeInteger(float = -1.5f) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: float = -1.5f;
      const _r: boolean = isSafeInteger(f);
      expect(_r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0320
     * @tc.name testGlobalIsSafeIntegerTest032
     * @tc.desc isSafeInteger(number = 0.5) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: number = 0.5;
      const _r: boolean = isSafeInteger(d);
      expect(_r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0330
     * @tc.name testGlobalIsSafeIntegerTest033
     * @tc.desc isSafeInteger(number = 1e21) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: number = 1e21;
      const _r: boolean = isSafeInteger(d);
      expect(_r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0340
     * @tc.name testGlobalIsSafeIntegerTest034
     * @tc.desc isSafeInteger(number = -1e21) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: number = -1e21;
      const _r: boolean = isSafeInteger(d);
      expect(_r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0350
     * @tc.name testGlobalIsSafeIntegerTest035
     * @tc.desc isSafeInteger(number = 0.1 + 0.2) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: number = 0.1 + 0.2;
      const r: boolean = isSafeInteger(d);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0360
     * @tc.name testGlobalIsSafeIntegerTest036
     * @tc.desc isSafeInteger(number = 1.0 / 3.0) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: number = 1.0 / 3.0;
      const r: boolean = isSafeInteger(d);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0370
     * @tc.name testGlobalIsSafeIntegerTest037
     * @tc.desc isSafeInteger(4.0 / 2.0) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(isSafeInteger(4.0 / 2.0)).assertTrue();
      expect(isSafeInteger(4 / 2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0380
     * @tc.name testGlobalIsSafeIntegerTest038
     * @tc.desc isSafeInteger(long = 0x20000000000001) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: long = 0x20000000000001;
      const _r: boolean = isSafeInteger(v);
      expect(_r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0390
     * @tc.name testGlobalIsSafeIntegerTest039
     * @tc.desc isSafeInteger(long = -0x1FFFFFFFFFFFFF) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: long = -0x1FFFFFFFFFFFFF;
      const _r: boolean = isSafeInteger(v);
      expect(_r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0400
     * @tc.name testGlobalIsSafeIntegerTest040
     * @tc.desc isSafeInteger(long = -0x20000000000000) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: long = -0x20000000000000;
      const _r: boolean = isSafeInteger(v);
      expect(_r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0410
     * @tc.name testGlobalIsSafeIntegerTest041
     * @tc.desc isSafeInteger(number = -1e+20) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: number = -1e+20;
      const _r: boolean = isSafeInteger(d);
      expect(_r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0420
     * @tc.name testGlobalIsSafeIntegerTest042
     * @tc.desc isSafeInteger(number = 10 - 0.1) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: number = 10 - 0.1;
      const _r: boolean = isSafeInteger(d);
      expect(_r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0430
     * @tc.name testGlobalIsSafeIntegerTest043
     * @tc.desc isSafeInteger(long = -9223372036854775807 as long) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base: long = -9223372036854775807 as long;
      const v: long = base - 1 as long;
      const _r: boolean = isSafeInteger(v);
      expect(_r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0440
     * @tc.name testGlobalIsSafeIntegerTest044
     * @tc.desc isSafeInteger(number = 5e15) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: number = 5e15;
      const _r: boolean = isSafeInteger(v);
      expect(_r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0450
     * @tc.name testGlobalIsSafeIntegerTest045
     * @tc.desc isSafeInteger(number = -5e15) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: number = -5e15;
      const _r: boolean = isSafeInteger(v);
      expect(_r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0460
     * @tc.name testGlobalIsSafeIntegerTest046
     * @tc.desc isSafeInteger(number = 9.007199254740991e15) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: number = 9.007199254740991e15;
      const _r: boolean = isSafeInteger(v);
      expect(_r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0470
     * @tc.name testGlobalIsSafeIntegerTest047
     * @tc.desc isSafeInteger(number = 9.007199254740992e15) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: number = 9.007199254740992e15;
      const _r: boolean = isSafeInteger(v);
      expect(_r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0480
     * @tc.name testGlobalIsSafeIntegerTest048
     * @tc.desc isSafeInteger(number = 1 + 2) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const d: number = 1 + 2;
      const _r: boolean = isSafeInteger(d);
      expect(_r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0490
     * @tc.name testGlobalIsSafeIntegerTest049
     * @tc.desc isSafeInteger(number = Number.MAX_VALUE) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: number = Number.MAX_VALUE;
      const _r: boolean = isSafeInteger(v);
      expect(_r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0500
     * @tc.name testGlobalIsSafeIntegerTest050
     * @tc.desc isSafeInteger(5) returns true, count increments to 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const intFive: int = 5;
      const floatPi: float = 3.14f;
      let count: int = 0;
      if (isSafeInteger(intFive)) {
        count = count + 1;
      }
      if (isSafeInteger(floatPi)) {
        count = count + 1;
      }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0510
     * @tc.name testGlobalIsSafeIntegerTest051
     * @tc.desc isSafeInteger(int = 100) returns _r2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const vi: int = 100;
      const vl: long = (100 as long);
      const _r: boolean = isSafeInteger(vi);
      const _r2: boolean = isSafeInteger(vl);
      expect(_r).assertTrue();
      expect(_r2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0520
     * @tc.name testGlobalIsSafeIntegerTest052
     * @tc.desc isSafeInteger(int = -100) returns _r2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const vi: int = -100;
      const vl: long = (-100 as long);
      const _r: boolean = isSafeInteger(vi);
      const _r2: boolean = isSafeInteger(vl);
      expect(_r).assertTrue();
      expect(_r2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0530
     * @tc.name testGlobalIsSafeIntegerTest053
     * @tc.desc isSafeInteger(int = 0) returns 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: int = 0;
      let path: int = 0;
      if (isSafeInteger(v)) {
        path = 1;
      } else {
        path = -1;
      }
      expect(path).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0540
     * @tc.name testGlobalIsSafeIntegerTest054
     * @tc.desc isSafeInteger(-2147483648) returns false -> path = -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: int = -2147483648;
      let path: int = 0;
      if (isSafeInteger(v)) {
        path = 1;
      } else {
        path = -1;
      }
      expect(path).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0550
     * @tc.name testGlobalIsSafeIntegerTest055
     * @tc.desc isSafeInteger(Long.MAX_VALUE) returns false, isSafeInteger(5) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const vl: long = 9223372036854775807;
      const vi: int = 5;
      let _r: boolean = isSafeInteger(vl);
      expect(_r).assertFalse();
      _r = isSafeInteger(vi);
      expect(_r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0560
     * @tc.name testGlobalIsSafeIntegerTest056
     * @tc.desc isSafeInteger(long = (0 as long)) returns _r2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const vl: long = (0 as long);
      const vi: int = 0;
      const _r: boolean = isSafeInteger(vl);
      const _r2: boolean = isSafeInteger(vi);
      expect(_r).assertTrue();
      expect(_r2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0570
     * @tc.name testGlobalIsSafeIntegerTest057
     * @tc.desc isSafeInteger(float = (10.0 / 3.0) as float) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: float = (10.0 / 3.0) as float;
      const _r: boolean = isSafeInteger(v);
      expect(_r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0580
     * @tc.name testGlobalIsSafeIntegerTest058
     * @tc.desc isSafeInteger(vf) returns _r2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const vf: float = 1.0f;
      const vi: int = 1;
      const _r: boolean = isSafeInteger(vf);
      const _r2: boolean = isSafeInteger(vi);
      expect(_r).assertTrue();
      expect(_r2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0590
     * @tc.name testGlobalIsSafeIntegerTest059
     * @tc.desc isSafeInteger(v) returns 3.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: float = 3.0f;
      const r: float = isSafeInteger(v) ? v : -1.0f;
      expect(r).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0600
     * @tc.name testGlobalIsSafeIntegerTest060
     * @tc.desc isSafeInteger(v) returns 0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: float = 0.5f;
      const r: float = isSafeInteger(v) ? v : 0.0f;
      expect(r).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0610
     * @tc.name testGlobalIsSafeIntegerTest061
     * @tc.desc isSafeInteger(3.14f) or isSafeInteger(5.0f) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const floatPi: float = 3.14f;
      const floatFive: float = 5.0f;
      const _r: boolean = isSafeInteger(floatPi) || isSafeInteger(floatFive);
      expect(_r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0620
     * @tc.name testGlobalIsSafeIntegerTest062
     * @tc.desc isSafeInteger(vf) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const vf: float = Float.NaN;
      const vt: float = 5.0f;
      const _r: boolean = isSafeInteger(vf) && isSafeInteger(vt);
      expect(_r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0630
     * @tc.name testGlobalIsSafeIntegerTest063
     * @tc.desc isSafeInteger(vn) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const vn: number = Float.NaN;
      const vf: float = Float.NaN;
      const _r: boolean = isSafeInteger(vn) || isSafeInteger(vf);
      expect(_r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0640
     * @tc.name testGlobalIsSafeIntegerTest064
     * @tc.desc isSafeInteger(1e-200f) returns true (underflows to 0)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: float = 1e-200f;
      const _r: boolean = isSafeInteger(v);
      expect(_r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0650
     * @tc.name testGlobalIsSafeIntegerTest065
     * @tc.desc isSafeInteger(-1e-200f) returns true (underflows to -0.0)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: float = -1e-200f;
      const _r: boolean = isSafeInteger(v);
      expect(_r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0660
     * @tc.name testGlobalIsSafeIntegerTest066
     * @tc.desc isSafeInteger(vi) returns 4
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const vi: int = 5;
      const vl: long = (5 as long);
      const vf: float = 5.0f;
      const vn: number = 5;
      let sum: int = 0;
      if (isSafeInteger(vi)) {
        sum = sum + 1;
      }
      if (isSafeInteger(vl)) {
        sum = sum + 1;
      }
      if (isSafeInteger(vf)) {
        sum = sum + 1;
      }
      if (isSafeInteger(vn)) {
        sum = sum + 1;
      }
      expect(sum).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0670
     * @tc.name testGlobalIsSafeIntegerTest067
     * @tc.desc isSafeInteger(v) returns "unsafe"
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: float = 3.14f;
      let label: string = "";
      if (isSafeInteger(v)) {
        label = "safe";
      } else {
        label = "unsafe";
      }
      expect(label).assertEqual("unsafe");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0680
     * @tc.name testGlobalIsSafeIntegerTest068
     * @tc.desc isSafeInteger(v) returns 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: float = 3.14f;
      let count: int = 0;
      while (isSafeInteger(v) && count < 5) {
        count = count + 1;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0690
     * @tc.name testGlobalIsSafeIntegerTest069
     * @tc.desc isSafeInteger(vi) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const vi: int = 1;
      const vl: long = (1 as long);
      const vf: float = 1.0f;
      const vn: number = 1;
      const _r: boolean = isSafeInteger(vi) && isSafeInteger(vl) && isSafeInteger(vf) && isSafeInteger(vn);
      expect(_r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0700
     * @tc.name testGlobalIsSafeIntegerTest070
     * @tc.desc isSafeInteger(int=1, long=MAX, float=1.0, number=1) combined result is false (long exceeds safe range)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const vi: int = 1;
      const vl: long = 9223372036854775807;
      const vf: float = 1.0f;
      const vn: number = 1;
      const _r: boolean = isSafeInteger(vi) && isSafeInteger(vl) && isSafeInteger(vf) && isSafeInteger(vn);
      expect(_r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0710
     * @tc.name testGlobalIsSafeIntegerTest071
     * @tc.desc isSafeInteger(0.0) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = 0.0;
      const r: boolean = isSafeInteger(valInner);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0720
     * @tc.name testGlobalIsSafeIntegerTest072
     * @tc.desc isSafeInteger(vf) returns false, isSafeInteger(vi) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const vf: float = 3.14f;
      const vi: int = 3;
      let _r: boolean = isSafeInteger(vf);
      expect(_r).assertFalse();
      _r = isSafeInteger(vi);
      expect(_r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0730
     * @tc.name testGlobalIsSafeIntegerTest073
     * @tc.desc isSafeInteger(float = 0.2f) returns -1.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: float = 0.2f;
      const r: float = isSafeInteger(v) ? v : -1.0f;
      expect(r).assertEqual(-1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0740
     * @tc.name testGlobalIsSafeIntegerTest074
     * @tc.desc isSafeInteger(5) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: int = 5;
      const _r: boolean = isSafeInteger(v) && isFinite(v);
      expect(_r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0750
     * @tc.name testGlobalIsSafeIntegerTest075
     * @tc.desc isSafeInteger(int = 5) returns 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: int = 5;
      const r: int = isSafeInteger(v) ? 1 : -1;
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0760
     * @tc.name testGlobalIsSafeIntegerTest076
     * @tc.desc isSafeInteger(number = 9007199254740992) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: number = 9007199254740992;
      const r1: boolean = isSafeInteger(v);
      expect(r1).assertFalse();
      const r2: boolean = isInteger(v);
      expect(r2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0770
     * @tc.name testGlobalIsSafeIntegerTest077
     * @tc.desc isSafeInteger(5) returns true, isNaN(5) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: int = 5;
      const _r1: boolean = isNaN(v);
      expect(_r1).assertFalse();
      const _r2: boolean = isSafeInteger(v);
      expect(_r2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0780
     * @tc.name testGlobalIsSafeIntegerTest078
     * @tc.desc isSafeInteger(number = Float.POSITIVE_INFINITY) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: number = Float.POSITIVE_INFINITY;
      const _r: boolean = isSafeInteger(v) || isFinite(v);
      expect(_r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0790
     * @tc.name testGlobalIsSafeIntegerTest079
     * @tc.desc isSafeInteger(v) || isNaN(v) returns true (true from isNaN when v=Float.NaN)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: number = Float.NaN;
      const _r: boolean = isSafeInteger(v) || isNaN(v);
      expect(_r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0800
     * @tc.name testGlobalIsSafeIntegerTest080
     * @tc.desc isSafeInteger(number = 9007199254740991) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: number = 9007199254740991;
      const _r: boolean = isSafeInteger(v) || isNaN(v);
      expect(_r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0810
     * @tc.name testGlobalIsSafeIntegerTest081
     * @tc.desc isSafeInteger(number = Float.NaN) returns -1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: number = Float.NaN;
      const r: int = isSafeInteger(v) ? 1 : -1;
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0820
     * @tc.name testGlobalIsSafeIntegerTest082
     * @tc.desc isNaN(v) returns true, isSafeInteger(v) returns false for v=Float.NaN
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: number = Float.NaN;
      const _r1: boolean = isNaN(v);
      expect(_r1).assertTrue();
      const _r2: boolean = isSafeInteger(v);
      expect(_r2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0830
     * @tc.name testGlobalIsSafeIntegerTest083
     * @tc.desc isSafeInteger(5) returns true, isFinite(5) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: int = 5;
      const _r1: boolean = isFinite(v);
      expect(_r1).assertTrue();
      const _r2: boolean = isSafeInteger(v);
      expect(_r2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0840
     * @tc.name testGlobalIsSafeIntegerTest084
     * @tc.desc isSafeInteger(float = 3.14f) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: float = 3.14f;
      const _r1: boolean = isInteger(v);
      expect(_r1).assertFalse();
      const _r2: boolean = isSafeInteger(v);
      expect(_r2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0850
     * @tc.name testGlobalIsSafeIntegerTest085
     * @tc.desc isSafeInteger(int = 5) returns true (via negated assertion)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: int = 5;
      const _r1: boolean = !isSafeInteger(v);
      expect(_r1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0860
     * @tc.name testGlobalIsSafeIntegerTest086
     * @tc.desc isSafeInteger(1e15f) returns false (float precision loss)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: float = 1e15f;
      const _r: boolean = isSafeInteger(v);
      expect(_r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0870
     * @tc.name testGlobalIsSafeIntegerTest087
     * @tc.desc isSafeInteger(-1e15f) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const v: float = -1e15f;
      const _r: boolean = isSafeInteger(v);
      expect(_r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0880
     * @tc.name testGlobalIsSafeIntegerTest088
     * @tc.desc isSafeInteger(result) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const result: number = parseInt("  ");
        const resultIsResult: boolean = isSafeInteger(result);
        expect(resultIsResult).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0890
     * @tc.name testGlobalIsSafeIntegerTest089
     * @tc.desc isSafeInteger(result) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        const result: number = parseFloat("1e2");
        const resultIsResult: boolean = isSafeInteger(result);
        expect(resultIsResult).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0900
     * @tc.name testGlobalIsSafeIntegerTest090
     * @tc.desc isSafeInteger(number = parseInt("2147483647")) returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: number = parseInt("2147483647");
      const result: boolean = isSafeInteger(val);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0910
     * @tc.name testGlobalIsSafeIntegerTest091
     * @tc.desc isSafeInteger(Long.MIN_VALUE) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = Long.MIN_VALUE;
      const result: boolean = isSafeInteger(valInner);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0920
     * @tc.name testGlobalIsSafeIntegerTest092
     * @tc.desc isSafeInteger(parseFloat("42.0")) returns true (cross-API)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inputs: string[] = ["42.0", "42.", "1.25e2", "1e + 02", "42, 5"];
      for (let i: int = 0; i < inputs.length; i++) {
        const parsed: number = parseFloat(inputs[i]);
        expect(isSafeInteger(parsed)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0930
     * @tc.name testGlobalIsSafeIntegerTest093
     * @tc.desc isSafeInteger(parseFloat decimal positive non-integer) returns false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inputs: string[] = ["3.5", ".42", ".75", "1.2.3", "1e-02"];
      for (let i: int = 0; i < inputs.length; i++) {
        const parsed: number = parseFloat(inputs[i]);
        expect(isSafeInteger(parsed)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0940
     * @tc.name testGlobalIsSafeIntegerTest094
     * @tc.desc isSafeInteger(parseFloat("NaN")) returns false (cross-API Float.NaN)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parsed: number = parseFloat("NaN");
      const r: boolean = isSafeInteger(parsed);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0950
     * @tc.name testGlobalIsSafeIntegerTest095
     * @tc.desc isSafeInteger(parseInt("42")) returns true (cross-API parseInt)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inputs: string[] = ["42", "15<script>"];
      for (let i: int = 0; i < inputs.length; i++) {
        const parsed: number = parseInt(inputs[i], 10);
        expect(isSafeInteger(parsed)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0960
     * @tc.name testGlobalIsSafeIntegerTest096
     * @tc.desc isSafeInteger(1e308 * 10) returns false (overflow to Float.POSITIVE_INFINITY)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = 1e308 * 10;
      const r: boolean = isSafeInteger(valInner);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0970
     * @tc.name testGlobalIsSafeIntegerTest097
     * @tc.desc isSafeInteger with loop: [42, -42, 0, 1, Number.MAX_SAFE_INTEGER] all return true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: number[] = [42, -42, 0, 1, Number.MAX_SAFE_INTEGER];
      for (let i: int = 0;
      i < values.length;
      i = i + 1) {
        const valInner: number = values[i];
      const r: boolean = isSafeInteger(valInner);
        expect(r).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0980
     * @tc.name testGlobalIsSafeIntegerTest098
     * @tc.desc isSafeInteger with loop: [3.5, Float.NaN, Float.POSITIVE_INFINITY, 1e308] all false
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: number[] = [3.5, Float.NaN, Float.POSITIVE_INFINITY, 1e308];
      for (let i: int = 0;
      i < values.length;
      i = i + 1) {
        const valInner: number = values[i];
      const r: boolean = isSafeInteger(valInner);
        expect(r).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_0990
     * @tc.name testGlobalIsSafeIntegerTest099
     * @tc.desc isSafeInteger(null as Double) throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        isSafeInteger(null as Double);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ClassCastError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_1000
     * @tc.name testGlobalIsSafeIntegerTest100
     * @tc.desc isSafeInteger(16777216.0f) returns false (float precision, not safe in ArkTS runtime)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = 16777216.0f;
      const r: boolean = isSafeInteger(valInner);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_1010
     * @tc.name testGlobalIsSafeIntegerTest101
     * @tc.desc isSafeInteger(Float.EPSILON) returns false (tiny fraction, not a safe integer)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valInner: number = Float.EPSILON;
      const r: boolean = isSafeInteger(valInner);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_1020
     * @tc.name testGlobalIsSafeIntegerTest102
     * @tc.desc isSafeInteger(parseFloat("-Infinity")) returns false (cross-API negative infinity)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parsed: number = parseFloat("-Infinity");
      const r: boolean = isSafeInteger(parsed);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_1030
     * @tc.name testGlobalIsSafeIntegerTest103
     * @tc.desc isSafeInteger(parseFloat("9.007199254740992e15")) returns false (cross-API exponent outside safe range)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parsed: number = parseFloat("9.007199254740992e15");
      const r: boolean = isSafeInteger(parsed);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_1040
     * @tc.name testGlobalIsSafeIntegerTest104
     * @tc.desc isSafeInteger(parseInt("9007199254740991abc", 10)) returns true (cross-API truncated suffix)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parsed: number = parseInt("9007199254740991abc", 10);
      const r: boolean = isSafeInteger(parsed);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_1050
     * @tc.name testGlobalIsSafeIntegerTest105
     * @tc.desc isSafeInteger(parseInt("2", 2)) returns false (cross-API invalid digit for radix)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parsed: number = parseInt("2", 2);
      const r: boolean = isSafeInteger(parsed);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_1060
     * @tc.name testGlobalIsSafeIntegerTest106
     * @tc.desc isSafeInteger(parseFloat("-0")) returns true (cross-API negative zero)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parsed: number = parseFloat("-0");
      const r: boolean = isSafeInteger(parsed);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_1070
     * @tc.name testGlobalIsSafeIntegerTest107
     * @tc.desc isSafeInteger(parseFloat("1e-324")) returns true (cross-API underflow to zero)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parsed: number = parseFloat("1e-324");
      const r: boolean = isSafeInteger(parsed);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_1080
     * @tc.name testGlobalIsSafeIntegerTest108
     * @tc.desc isSafeInteger(parseInt("9007199254740991", 10)) returns true (cross-API safe max with radix)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parsed: number = parseInt("9007199254740991", 10);
      const r: boolean = isSafeInteger(parsed);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_1090
     * @tc.name testGlobalIsSafeIntegerTest109
     * @tc.desc isSafeInteger(parseInt("-9007199254740991", 10)) returns true (cross-API safe min with radix)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parsed: number = parseInt("-9007199254740991", 10);
      const r: boolean = isSafeInteger(parsed);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_1100
     * @tc.name testGlobalIsSafeIntegerTest110
     * @tc.desc isSafeInteger(parseFloat("9007199254740991.0")) returns true (cross-API safe max decimal)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parsed: number = parseFloat("9007199254740991.0");
      const r: boolean = isSafeInteger(parsed);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_1110
     * @tc.name testGlobalIsSafeIntegerTest111
     * @tc.desc isSafeInteger(parseFloat("-9007199254740991.0")) returns true (cross-API safe min decimal)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parsed: number = parseFloat("-9007199254740991.0");
      const r: boolean = isSafeInteger(parsed);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_1120
     * @tc.name testGlobalIsSafeIntegerTest112
     * @tc.desc isSafeInteger(parseFloat("9007199254740991.5")) returns false (cross-API fractional truncation)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parsed: number = parseFloat("9007199254740991.5");
      const r: boolean = isSafeInteger(parsed);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_1130
     * @tc.name testGlobalIsSafeIntegerTest113
     * @tc.desc isSafeInteger(parseFloat("-9007199254740991.5")) returns false (cross-API negative fractional)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parsed: number = parseFloat("-9007199254740991.5");
      const r: boolean = isSafeInteger(parsed);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_1140
     * @tc.name testGlobalIsSafeIntegerTest114
     * @tc.desc isSafeInteger(parseInt("2147483648", 10)) returns true (cross-API int overflow value)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parsed: number = parseInt("2147483648", 10);
      const r: boolean = isSafeInteger(parsed);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_1150
     * @tc.name testGlobalIsSafeIntegerTest115
     * @tc.desc isSafeInteger(parseInt("-2147483649", 10)) returns true (cross-API below int minimum)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parsed: number = parseInt("-2147483649", 10);
      const r: boolean = isSafeInteger(parsed);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_1160
     * @tc.name testGlobalIsSafeIntegerTest116
     * @tc.desc isSafeInteger(parseFloat("2147483647.0")) returns true (cross-API int max decimal)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parsed: number = parseFloat("2147483647.0");
      const r: boolean = isSafeInteger(parsed);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_1170
     * @tc.name testGlobalIsSafeIntegerTest117
     * @tc.desc isSafeInteger(parseFloat("-2147483648.0")) returns true (cross-API int min decimal)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parsed: number = parseFloat("-2147483648.0");
      const r: boolean = isSafeInteger(parsed);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_1180
     * @tc.name testGlobalIsSafeIntegerTest118
     * @tc.desc isSafeInteger(parseFloat("-.75")) returns false (cross-API decimal no integer part)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parsed: number = parseFloat("-.75");
      const r: boolean = isSafeInteger(parsed);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_1190
     * @tc.name testGlobalIsSafeIntegerTest119
     * @tc.desc isSafeInteger(parseFloat("5e-324")) returns false (cross-API minimum positive float)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parsed: number = parseFloat("5e-324");
      const r: boolean = isSafeInteger(parsed);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_1200
     * @tc.name testGlobalIsSafeIntegerTest120
     * @tc.desc isSafeInteger(parseFloat("1e309")) returns false (cross-API positive overflow to Float.POSITIVE_INFINITY)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parsed: number = parseFloat("1e309");
      const r: boolean = isSafeInteger(parsed);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_1210
     * @tc.name testGlobalIsSafeIntegerTest121
     * @tc.desc isSafeInteger(parseFloat("-1e309")) returns false (cross-API negative overflow to -Float.POSITIVE_INFINITY)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parsed: number = parseFloat("-1e309");
      const r: boolean = isSafeInteger(parsed);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_1220
     * @tc.name testGlobalIsSafeIntegerTest122
     * @tc.desc isSafeInteger(parseFloat("infinity")) returns false (cross-API lowercase infinity Float.NaN)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parsed: number = parseFloat("infinity");
      const r: boolean = isSafeInteger(parsed);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_1230
     * @tc.name testGlobalIsSafeIntegerTest123
     * @tc.desc isSafeInteger(parseFloat("+")) returns false (cross-API plus only Float.NaN)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parsed: number = parseFloat("+");
      const r: boolean = isSafeInteger(parsed);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_1240
     * @tc.name testGlobalIsSafeIntegerTest124
     * @tc.desc isSafeInteger(parseInt("101101", 2)) returns true (cross-API binary radix)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parsed: number = parseInt("101101", 2);
      const r: boolean = isSafeInteger(parsed);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_1250
     * @tc.name testGlobalIsSafeIntegerTest125
     * @tc.desc isSafeInteger(parseInt("101201", 2)) returns true (cross-API invalid binary digit truncation)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parsed: number = parseInt("101201", 2);
      const r: boolean = isSafeInteger(parsed);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_1260
     * @tc.name testGlobalIsSafeIntegerTest126
     * @tc.desc isSafeInteger(parseInt("10", 37)) returns false (cross-API invalid radix Float.NaN)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parsed: number = parseInt("10", 37);
      const r: boolean = isSafeInteger(parsed);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_1270
     * @tc.name testGlobalIsSafeIntegerTest127
     * @tc.desc isSafeInteger(parseInt("_123", 10)) returns false (cross-API underscore prefix Float.NaN)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parsed: number = parseInt("_123", 10);
      const r: boolean = isSafeInteger(parsed);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_1280
     * @tc.name testGlobalIsSafeIntegerTest128
     * @tc.desc isSafeInteger(parseInt("z", 36)) returns true (cross-API base 36 max digit)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parsed: number = parseInt("z", 36);
      const r: boolean = isSafeInteger(parsed);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_1290
     * @tc.name testGlobalIsSafeIntegerTest129
     * @tc.desc isSafeInteger(parseFloat("42, 5")) returns true (cross-API comma truncation)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parsed: number = parseFloat("42, 5");
      const r: boolean = isSafeInteger(parsed);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_1300
     * @tc.name testGlobalIsSafeIntegerTest130
     * @tc.desc Verify isSafeInteger with long addition 100 + 200 returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: long = 100 + 200;
      const r: boolean = isSafeInteger(v);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_1310
     * @tc.name testGlobalIsSafeIntegerTest131
     * @tc.desc Verify isSafeInteger with long subtraction 500-300 returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let v: long = 500 - 300;
      const r: boolean = isSafeInteger(v);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_GLOBAL_ISSAFEINTEGER_TEST_1320
     * @tc.name testGlobalIsSafeIntegerTest132
     * @tc.desc Verify isSafeInteger with long multiplication 100*1000 returns true
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testGlobalIsSafeIntegerTest132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
