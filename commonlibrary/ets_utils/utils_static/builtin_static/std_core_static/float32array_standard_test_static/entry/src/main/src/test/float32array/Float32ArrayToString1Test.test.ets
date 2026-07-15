'use static'
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

export default function Float32ArrayToString1Test(): void {
  describe('Float32ArrayToString1Test', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGONE_0100
     * @tc.name testFloat32ArrayToStringONE001
     * @tc.desc Verify toString() no-argument (0-arity) call triggers stringification, returning "3.5" for [3.5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringONE001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.5]);
      expect(arr.toString()).assertEqual("3.5");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGONE_0200
     * @tc.name testFloat32ArrayToStringONE002
     * @tc.desc Verify multiple 0-arity calls to toString() on the same array return consistent results (determinism)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringONE002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.25, 2.5]);
      const first = arr.toString();
      const second = arr.toString();
      expect(first).assertEqual(second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGONE_0300
     * @tc.name testFloat32ArrayToStringONE003
     * @tc.desc Verify single-element [0] stringifies to "0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringONE003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0]);
      expect(arr.toString()).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGONE_0400
     * @tc.name testFloat32ArrayToStringONE004
     * @tc.desc Verify single-element [1] stringifies to "1"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringONE004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1]);
      expect(arr.toString()).assertEqual("1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGONE_0500
     * @tc.name testFloat32ArrayToStringONE005
     * @tc.desc Verify single-element [16777216] (2^24 max exact integer) stringifies to "16777216"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringONE005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([16777216]);
      expect(arr.toString()).assertEqual("16777216");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGONE_0600
     * @tc.name testFloat32ArrayToStringONE006
     * @tc.desc Verify single-element [16777217] (2^24+1, float32 truncated to 16777216) stringifies to "16777216"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringONE006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([16777217]);
      expect(arr.toString()).assertEqual("16777216");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGONE_0700
     * @tc.name testFloat32ArrayToStringONE007
     * @tc.desc Verify single-element [16777218] (2^24+2, still exactly representable) stringifies to "16777218"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringONE007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([16777218]);
      expect(arr.toString()).assertEqual("16777218");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGONE_0800
     * @tc.name testFloat32ArrayToStringONE008
     * @tc.desc Verify single-element [2147483647] (int32 MAX, float32 truncated to 2147483648) stringifies to "2147483648"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringONE008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([2147483647]);
      expect(arr.toString()).assertEqual("2147483648");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGONE_0900
     * @tc.name testFloat32ArrayToStringONE009
     * @tc.desc Verify single-element [-2147483648] (int32 MIN, a power of 2 exactly representable) stringifies to "-2147483648"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringONE009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-2147483648]);
      expect(arr.toString()).assertEqual("-2147483648");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGONE_1000
     * @tc.name testFloat32ArrayToStringONE010
     * @tc.desc Verify single-element [-16777216] stringifies to "-16777216"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringONE010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-16777216]);
      expect(arr.toString()).assertEqual("-16777216");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGONE_1100
     * @tc.name testFloat32ArrayToStringONE011
     * @tc.desc Verify single-element [-16777217] (truncated to -16777216 in the negative direction) stringifies to "-16777216"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringONE011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-16777217]);
      expect(arr.toString()).assertEqual("-16777216");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGONE_1200
     * @tc.name testFloat32ArrayToStringONE012
     * @tc.desc Verify single-element [NaN] stringifies to "NaN"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringONE012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([NaN]);
      expect(arr.toString()).assertEqual("NaN");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGONE_1300
     * @tc.name testFloat32ArrayToStringONE013
     * @tc.desc Verify single-element [Infinity] stringifies to "Infinity"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringONE013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([Infinity]);
      expect(arr.toString()).assertEqual("Infinity");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGONE_1400
     * @tc.name testFloat32ArrayToStringONE014
     * @tc.desc Verify single-element [-Infinity] stringifies to "-Infinity"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringONE014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-Infinity]);
      expect(arr.toString()).assertEqual("-Infinity");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGONE_1500
     * @tc.name testFloat32ArrayToStringONE015
     * @tc.desc Verify single-element [-0] (negative zero) stringifies to "0" (negative zero does not preserve the sign)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringONE015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-0]);
      expect(arr.toString()).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGONE_1600
     * @tc.name testFloat32ArrayToStringONE016
     * @tc.desc Verify single-element [3.4028234663852886e+38] (Float32 MAX largest finite value) stringifies to "3.4028234663852886e+38"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringONE016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.4028234663852886e+38]);
      expect(arr.toString()).assertEqual("3.4028234663852886e+38");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGONE_1700
     * @tc.name testFloat32ArrayToStringONE017
     * @tc.desc Verify single-element [-3.4028234663852886e+38] (Float32 smallest finite negative value) stringifies to "-3.4028234663852886e+38"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringONE017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-3.4028234663852886e+38]);
      expect(arr.toString()).assertEqual("-3.4028234663852886e+38");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGONE_1800
     * @tc.name testFloat32ArrayToStringONE018
     * @tc.desc Verify single-element [1.1754943508222875e-38] (MIN_NORMAL smallest positive normal number) stringifies to "1.1754943508222875e-38"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringONE018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.1754943508222875e-38]);
      expect(arr.toString()).assertEqual("1.1754943508222875e-38");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGONE_1900
     * @tc.name testFloat32ArrayToStringONE019
     * @tc.desc Verify single-element [1.401298464324817e-45] (MIN_VALUE smallest positive subnormal number) stringifies to "1.401298464324817e-45"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringONE019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.401298464324817e-45]);
      expect(arr.toString()).assertEqual("1.401298464324817e-45");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGONE_2000
     * @tc.name testFloat32ArrayToStringONE020
     * @tc.desc Verify single-element [0.75] (exactly representable fraction) stringifies to "0.75"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringONE020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.75]);
      expect(arr.toString()).assertEqual("0.75");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGONE_2100
     * @tc.name testFloat32ArrayToStringONE021
     * @tc.desc Verify single-element [0.375] (exactly representable fraction) stringifies to "0.375"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringONE021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.375]);
      expect(arr.toString()).assertEqual("0.375");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGONE_2200
     * @tc.name testFloat32ArrayToStringONE022
     * @tc.desc Verify single-element [1.75] (exactly representable fraction) stringifies to "1.75"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringONE022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.75]);
      expect(arr.toString()).assertEqual("1.75");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGONE_2300
     * @tc.name testFloat32ArrayToStringONE023
     * @tc.desc Verify single-element [-1.25] (exactly representable fraction) stringifies to "-1.25"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringONE023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-1.25]);
      expect(arr.toString()).assertEqual("-1.25");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGONE_2400
     * @tc.name testFloat32ArrayToStringONE024
     * @tc.desc Verify single-element [0.5] (2^-1 exactly representable) stringifies to "0.5"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringONE024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.5]);
      expect(arr.toString()).assertEqual("0.5");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGONE_2500
     * @tc.name testFloat32ArrayToStringONE025
     * @tc.desc Verify single-element [0.25] (2^-2 exactly representable) stringifies to "0.25"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringONE025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.25]);
      expect(arr.toString()).assertEqual("0.25");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGONE_2600
     * @tc.name testFloat32ArrayToStringONE026
     * @tc.desc Verify single-element [0.125] (2^-3 exactly representable) stringifies to "0.125"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringONE026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.125]);
      expect(arr.toString()).assertEqual("0.125");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGONE_2700
     * @tc.name testFloat32ArrayToStringONE027
     * @tc.desc Verify single-element [1.5] is exactly representable, stringifies to "1.5"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringONE027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.5]);
      expect(arr.toString()).assertEqual("1.5");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGONE_2800
     * @tc.name testFloat32ArrayToStringONE028
     * @tc.desc Verify single-element [2.5] is exactly representable, stringifies to "2.5"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringONE028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([2.5]);
      expect(arr.toString()).assertEqual("2.5");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGONE_2900
     * @tc.name testFloat32ArrayToStringONE029
     * @tc.desc Verify single-element [1.0e40] (exceeds float32 range, overflows to +Infinity) stringifies to "Infinity"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringONE029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0e40]);
      expect(arr.toString()).assertEqual("Infinity");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGONE_3000
     * @tc.name testFloat32ArrayToStringONE030
     * @tc.desc Verify single-element [-1.0e40] (overflows to -Infinity) stringifies to "-Infinity"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringONE030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-1.0e40]);
      expect(arr.toString()).assertEqual("-Infinity");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGONE_3100
     * @tc.name testFloat32ArrayToStringONE031
     * @tc.desc Verify single-element [1.0e-46] (smaller than the smallest subnormal number, underflows to +0) stringifies to "0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringONE031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0e-46]);
      expect(arr.toString()).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGONE_3200
     * @tc.name testFloat32ArrayToStringONE032
     * @tc.desc Verify single-element [0x10] (hexadecimal literal = 16) stringifies to "16"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringONE032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0x10]);
      expect(arr.toString()).assertEqual("16");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGONE_3300
     * @tc.name testFloat32ArrayToStringONE033
     * @tc.desc Verify single-element [0o17] (octal literal = 15) stringifies to "15"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringONE033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0o17]);
      expect(arr.toString()).assertEqual("15");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGONE_3400
     * @tc.name testFloat32ArrayToStringONE034
     * @tc.desc Verify single-element [0b101] (binary literal = 5) stringifies to "5"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringONE034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0b101]);
      expect(arr.toString()).assertEqual("5");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGONE_3500
     * @tc.name testFloat32ArrayToStringONE035
     * @tc.desc Verify single-element [1e2] (scientific notation = 100) stringifies to "100"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringONE035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1e2]);
      expect(arr.toString()).assertEqual("100");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGONE_3600
     * @tc.name testFloat32ArrayToStringONE036
     * @tc.desc Verify two-element [1, 2] stringifies comma-separated to "1,2"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringONE036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1, 2]);
      expect(arr.toString()).assertEqual("1,2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGONE_3700
     * @tc.name testFloat32ArrayToStringONE037
     * @tc.desc Verify negative values [-1, -2] stringify comma-separated to "-1,-2"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringONE037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-1, -2]);
      expect(arr.toString()).assertEqual("-1,-2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGONE_3800
     * @tc.name testFloat32ArrayToStringONE038
     * @tc.desc Verify positive zero and negative zero coexist [0, -0] stringifies to "0,0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringONE038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0, -0]);
      expect(arr.toString()).assertEqual("0,0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGONE_3900
     * @tc.name testFloat32ArrayToStringONE039
     * @tc.desc Verify NaN and a numeric value coexist [NaN, 1] stringifies to "NaN,1"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringONE039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([NaN, 1]);
      expect(arr.toString()).assertEqual("NaN,1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGONE_4000
     * @tc.name testFloat32ArrayToStringONE040
     * @tc.desc Verify NaN in the middle [1, NaN, 2] stringifies to "1,NaN,2"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringONE040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1, NaN, 2]);
      expect(arr.toString()).assertEqual("1,NaN,2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGONE_4100
     * @tc.name testFloat32ArrayToStringONE041
     * @tc.desc Verify positive and negative infinity coexist [Infinity, -Infinity] stringifies to "Infinity,-Infinity"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringONE041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([Infinity, -Infinity]);
      expect(arr.toString()).assertEqual("Infinity,-Infinity");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGONE_4200
     * @tc.name testFloat32ArrayToStringONE042
     * @tc.desc Verify multi-element exact fractions [0.75, 1.25] stringify to "0.75,1.25"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringONE042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.75, 1.25]);
      expect(arr.toString()).assertEqual("0.75,1.25");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGONE_4300
     * @tc.name testFloat32ArrayToStringONE043
     * @tc.desc Verify multi-element exact decimals [1.5, 2.5] stringify to "1.5,2.5"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringONE043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.5, 2.5]);
      expect(arr.toString()).assertEqual("1.5,2.5");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGONE_4400
     * @tc.name testFloat32ArrayToStringONE044
     * @tc.desc Verify all-zero three-element [0, 0, 0] stringifies to "0,0,0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringONE044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0, 0, 0]);
      expect(arr.toString()).assertEqual("0,0,0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGONE_4500
     * @tc.name testFloat32ArrayToStringONE045
     * @tc.desc Verify truncated values coexist [16777216, 16777217] stringify to "16777216,16777216"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringONE045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([16777216, 16777217]);
      expect(arr.toString()).assertEqual("16777216,16777216");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGONE_4600
     * @tc.name testFloat32ArrayToStringONE046
     * @tc.desc Verify mixed special values [NaN, Infinity, -Infinity, 0, -0, 1] stringify to "NaN,Infinity,-Infinity,0,0,1"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringONE046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([NaN, Infinity, -Infinity, 0, -0, 1]);
      expect(arr.toString()).assertEqual("NaN,Infinity,-Infinity,0,0,1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGONE_4700
     * @tc.name testFloat32ArrayToStringONE047
     * @tc.desc Verify same value in different bases coexist [255, 0xff] stringifies to "255,255"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringONE047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([255, 0xff]);
      expect(arr.toString()).assertEqual("255,255");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGONE_4800
     * @tc.name testFloat32ArrayToStringONE048
     * @tc.desc Verify literal empty array new Float32Array([]) stringifies to empty string ""
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringONE048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([]);
      expect(arr.toString()).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGONE_4900
     * @tc.name testFloat32ArrayToStringONE049
     * @tc.desc Verify an array of 100 ones, after stringification, splits by comma into 100 segments, with both first and last being "1"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringONE049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(100);
      arr.fill(1);
      const parts = arr.toString().split(",");
      expect(parts.length).assertEqual(100);
      expect(parts[0]).assertEqual("1");
      expect(parts[99]).assertEqual("1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGONE_5000
     * @tc.name testFloat32ArrayToStringONE050
     * @tc.desc Verify an array of 50 zeros, after stringification, splits by comma into 50 segments, with the middle segment being "0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringONE050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(50);
      arr.fill(0);
      const parts = arr.toString().split(",");
      expect(parts.length).assertEqual(50);
      expect(parts[25]).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGONE_5100
     * @tc.name testFloat32ArrayToStringONE051
     * @tc.desc Verify an array of 10 NaNs, after stringification, splits by comma into 10 segments, with the middle segment being "NaN"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringONE051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(10);
      arr.fill(NaN);
      const parts = arr.toString().split(",");
      expect(parts.length).assertEqual(10);
      expect(parts[5]).assertEqual("NaN");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGONE_5200
     * @tc.name testFloat32ArrayToStringONE052
     * @tc.desc Verify length-constructed new Float32Array(3) produces 3 zeros, stringifies to "0,0,0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringONE052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      expect(arr.toString()).assertEqual("0,0,0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGONE_5300
     * @tc.name testFloat32ArrayToStringONE053
     * @tc.desc Verify length-constructed new Float32Array(1) produces 1 zero, stringifies to "0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringONE053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      expect(arr.toString()).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGONE_5400
     * @tc.name testFloat32ArrayToStringONE054
     * @tc.desc Verify Float32Array.of(0x10, 0b1010, -1.0) static construction stringifies to "16,10,-1"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringONE054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      expect(arr.toString()).assertEqual('16,10,-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGONE_5500
     * @tc.name testFloat32ArrayToStringONE055
     * @tc.desc Verify Float32Array.of() no-argument static construction produces an empty array, stringifies to empty string ""
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringONE055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of();
      expect(arr.toString()).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGONE_5600
     * @tc.name testFloat32ArrayToStringONE056
     * @tc.desc Verify Float32Array.from([0.625, 1.875]) static construction stringifies to "0.625,1.875"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringONE056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.from([0.625, 1.875]);
      expect(arr.toString()).assertEqual("0.625,1.875");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGONE_5700
     * @tc.name testFloat32ArrayToStringONE057
     * @tc.desc Verify ArrayBuffer view construction (8 bytes = 2 zeros) stringifies to "0,0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringONE057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Float32Array(buf);
      expect(arr.toString()).assertEqual("0,0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_STRINGONE_5800
     * @tc.name testFloat32ArrayToStringONE058
     * @tc.desc Verify negative zero stringifies as 0 while the source keeps its sign bit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToStringONE058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-0.0);
      expect(arr.toString()).assertEqual('0');
      expect(1.0 / arr.$_get(0)).assertEqual(-Infinity);
    });

  });
}
