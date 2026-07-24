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

export default function Float32ArrayIncludes1Test(): void {
  describe('Float32ArrayIncludes1Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0010
     * @tc.name testFloat32ArrayIncludesONE001
     * @tc.desc Verify Calling includes with a single argument passing only searchElement matches the element and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const result: boolean = arr.includes(0b1010);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0020
     * @tc.name testFloat32ArrayIncludesONE002
     * @tc.desc Verify Calling includes with a single argument does not match the element and returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const result: boolean = arr.includes(9.0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0030
     * @tc.name testFloat32ArrayIncludesONE003
     * @tc.desc Verify Calling includes with two arguments and fromIndex 0 behaves the same as the single-argument form and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([5.0, 6.0, 7.0]);
      const result: boolean = arr.includes(5.0, 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0040
     * @tc.name testFloat32ArrayIncludesONE004
     * @tc.desc Verify Calling includes with two arguments and fromIndex 1 skips the index 0 element and returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([5.0, 6.0, 7.0]);
      const result: boolean = arr.includes(5.0, 1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0050
     * @tc.name testFloat32ArrayIncludesONE005
     * @tc.desc Verify Calling includes with a single argument on an empty array to find any element returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([]);
      const result: boolean = arr.includes(1.0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0060
     * @tc.name testFloat32ArrayIncludesONE006
     * @tc.desc Verify Calling includes with two arguments and a negative fromIndex normalizes and matches, returning true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const result: boolean = arr.includes(-1.0, -1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0070
     * @tc.name testFloat32ArrayIncludesONE007
     * @tc.desc Verify Finding the Float32 maximum finite value 3.4028234663852886e+38 matches and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([3.4028234663852886e+38, 1.0]);
      const result: boolean = arr.includes(arr[0]);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0080
     * @tc.name testFloat32ArrayIncludesONE008
     * @tc.desc Verify Finding the Float32 maximum finite value in an array not containing that value returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const result: boolean = arr.includes(3.4028234663852886e+38);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0090
     * @tc.name testFloat32ArrayIncludesONE009
     * @tc.desc Verify Finding an approximation differing from the maximum finite value by only one digit of precision in an array containing the maximum value returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([3.4028234663852886e+38]);
      const result: boolean = arr.includes(3.4028234663852886e+37);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0100
     * @tc.name testFloat32ArrayIncludesONE010
     * @tc.desc Verify Finding the Float32 minimum finite negative value -3.4028234663852886e+38 matches and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([-3.4028234663852886e+38, 0.0]);
      const result: boolean = arr.includes(-3.4028234663852886e+38);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0110
     * @tc.name testFloat32ArrayIncludesONE011
     * @tc.desc Verify Finding the minimum finite negative value in an array containing positive numbers returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0]);
      const result: boolean = arr.includes(-3.4028234663852886e+38);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0120
     * @tc.name testFloat32ArrayIncludesONE012
     * @tc.desc Verify Finding the minimum positive normal number 1.1754943508222875e-38 matches and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.1754943508222875e-38, 1.0]);
      const result: boolean = arr.includes(arr[0]);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0130
     * @tc.name testFloat32ArrayIncludesONE013
     * @tc.desc Verify Finding the minimum positive normal number in an array containing zero returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0, 0.0]);
      const result: boolean = arr.includes(arr[0] + 1.1754943508222875e-38);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0140
     * @tc.name testFloat32ArrayIncludesONE014
     * @tc.desc Verify Finding the minimum positive subnormal number 1.401298464324817e-45 matches and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.401298464324817e-45]);
      const result: boolean = arr.includes(1.401298464324817e-45);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0150
     * @tc.name testFloat32ArrayIncludesONE015
     * @tc.desc Verify Finding the minimum positive subnormal number in an array containing zero returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0]);
      const result: boolean = arr.includes(1.401298464324817e-45);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0160
     * @tc.name testFloat32ArrayIncludesONE016
     * @tc.desc Verify Finding the minimum positive subnormal number in an array containing the minimum positive normal number returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.1754943508222875e-38]);
      const result: boolean = arr.includes(1.401298464324817e-45);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0170
     * @tc.name testFloat32ArrayIncludesONE017
     * @tc.desc Verify Finding NaN in an array containing NaN matches by SameValueZero and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([NaN, 1.0]);
      const result: boolean = arr.includes(NaN);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0180
     * @tc.name testFloat32ArrayIncludesONE018
     * @tc.desc Verify Finding NaN in an array not containing NaN returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const result: boolean = arr.includes(NaN);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0190
     * @tc.name testFloat32ArrayIncludesONE019
     * @tc.desc Verify Finding NaN in an all-zero array returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0, 0.0, 0.0]);
      const result: boolean = arr.includes(NaN);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0200
     * @tc.name testFloat32ArrayIncludesONE020
     * @tc.desc Verify Finding positive Infinity in an array containing Infinity matches and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([Infinity, 1.0]);
      const result: boolean = arr.includes(Infinity);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0210
     * @tc.name testFloat32ArrayIncludesONE021
     * @tc.desc Verify Finding positive infinity in an array not containing infinity returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0e30, 2.0]);
      const result: boolean = arr.includes(Infinity);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0220
     * @tc.name testFloat32ArrayIncludesONE022
     * @tc.desc Verify Finding positive infinity in an array containing 1.0e40 (truncated to positive infinity) matches and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0e40]);
      const result: boolean = arr.includes(Infinity);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0230
     * @tc.name testFloat32ArrayIncludesONE023
     * @tc.desc Verify Finding negative Infinity in an array containing negative infinity matches and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([-Infinity, 1.0]);
      const result: boolean = arr.includes(-Infinity);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0240
     * @tc.name testFloat32ArrayIncludesONE024
     * @tc.desc Verify Finding negative infinity in an array containing a large finite negative number returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([-1.0e30]);
      const result: boolean = arr.includes(-Infinity);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0250
     * @tc.name testFloat32ArrayIncludesONE025
     * @tc.desc Verify Finding negative infinity in an array containing -1.0e40 (truncated to negative infinity) matches and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([-1.0e40]);
      const result: boolean = arr.includes(-Infinity);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0260
     * @tc.name testFloat32ArrayIncludesONE026
     * @tc.desc Verify Finding positive zero 0 in an array containing positive zero matches and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0, 1.0]);
      const result: boolean = arr.includes(0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0270
     * @tc.name testFloat32ArrayIncludesONE027
     * @tc.desc Verify Finding positive zero in an array not containing zero returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const result: boolean = arr.includes(0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0280
     * @tc.name testFloat32ArrayIncludesONE028
     * @tc.desc Verify Finding positive zero in an array containing negative zero matches by SameValueZero and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([-0, 1.0]);
      const result: boolean = arr.includes(0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0290
     * @tc.name testFloat32ArrayIncludesONE029
     * @tc.desc Verify Finding negative zero -0 in an array containing negative zero matches and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([-0, 1.0]);
      const result: boolean = arr.includes(-0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0300
     * @tc.name testFloat32ArrayIncludesONE030
     * @tc.desc Verify Finding negative zero in an array containing positive zero matches by SameValueZero and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0, 1.0]);
      const result: boolean = arr.includes(-0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0310
     * @tc.name testFloat32ArrayIncludesONE031
     * @tc.desc Verify Finding negative zero in an array not containing zero returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([2.0, 3.0]);
      const result: boolean = arr.includes(-0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0320
     * @tc.name testFloat32ArrayIncludesONE032
     * @tc.desc Verify Finding 0.1 in an array containing float32-precision 0.1 matches and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.1, 0.2]);
      const result: boolean = arr.includes(Math.fround(0.1));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0330
     * @tc.name testFloat32ArrayIncludesONE033
     * @tc.desc Verify Finding 0.1 in an array containing 0.2 and 0.3 returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.2, 0.3]);
      const result: boolean = arr.includes(0.1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0340
     * @tc.name testFloat32ArrayIncludesONE034
     * @tc.desc Verify Finding 0.3 in a two-element array containing 0.1 and 0.2 returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.1, 0.2]);
      const result: boolean = arr.includes(0.3);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0350
     * @tc.name testFloat32ArrayIncludesONE035
     * @tc.desc Verify Finding 0.2 in an array containing 0.2 matches and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.2, 0.4]);
      const result: boolean = arr.includes(Math.fround(0.2));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0360
     * @tc.name testFloat32ArrayIncludesONE036
     * @tc.desc Verify Finding 0.2 in an array containing 0.1 and 0.3 returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.1, 0.3]);
      const result: boolean = arr.includes(0.2);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0370
     * @tc.name testFloat32ArrayIncludesONE037
     * @tc.desc Verify Finding 0.3 in an array containing float32-precision 0.3 matches and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.3, 0.6]);
      const result: boolean = arr.includes(Math.fround(0.3));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0380
     * @tc.name testFloat32ArrayIncludesONE038
     * @tc.desc Verify Finding 1.1 in an array containing 1.1 matches and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.1, 2.2]);
      const result: boolean = arr.includes(Math.fround(1.1));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0390
     * @tc.name testFloat32ArrayIncludesONE039
     * @tc.desc Verify Finding 1.1 in an array containing 1.0 returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0]);
      const result: boolean = arr.includes(1.1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0400
     * @tc.name testFloat32ArrayIncludesONE040
     * @tc.desc Verify Finding 1.0000001 in an array containing that precision-truncated value matches and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0000001]);
      const result: boolean = arr.includes(Math.fround(1.0000001));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0410
     * @tc.name testFloat32ArrayIncludesONE041
     * @tc.desc Verify Finding 1.0000001 in an array containing 1.0 returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0]);
      const result: boolean = arr.includes(1.0000001);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0420
     * @tc.name testFloat32ArrayIncludesONE042
     * @tc.desc Verify Finding 2 to the 24th power 16777216 in an array containing that value matches and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([16777216, 1.0]);
      const result: boolean = arr.includes(16777216);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0430
     * @tc.name testFloat32ArrayIncludesONE043
     * @tc.desc Verify Finding 2 to the 24th power in an array containing 2 to the 24th power plus 1 returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([16777216]);
      const result: boolean = arr.includes(arr[0] + 1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0440
     * @tc.name testFloat32ArrayIncludesONE044
     * @tc.desc Verify Finding 16777217 (truncated to 16777216) in an array containing 16777216 matches and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([16777216]);
      const result: boolean = arr.includes(16777217);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0450
     * @tc.name testFloat32ArrayIncludesONE045
     * @tc.desc Verify Finding 16777217 in an array not containing 16777216 returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0]);
      const result: boolean = arr.includes(16777217);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0460
     * @tc.name testFloat32ArrayIncludesONE046
     * @tc.desc Verify Finding 1.0e40 in an array containing positive infinity matches by truncation and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([Infinity]);
      const result: boolean = arr.includes(Math.fround(1.0e40));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0470
     * @tc.name testFloat32ArrayIncludesONE047
     * @tc.desc Verify Finding -1.0e40 in an array containing negative infinity matches by truncation and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([-Infinity]);
      const result: boolean = arr.includes(Math.fround(-1.0e40));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0480
     * @tc.name testFloat32ArrayIncludesONE048
     * @tc.desc Verify Finding 1.0e-46 (underflows to positive zero) in an array containing positive zero matches and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0]);
      const result: boolean = arr.includes(Math.fround(1.0e-46));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0490
     * @tc.name testFloat32ArrayIncludesONE049
     * @tc.desc Verify Finding the integer 0 in an array containing 0 matches and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0, 5.0]);
      const result: boolean = arr.includes(0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0500
     * @tc.name testFloat32ArrayIncludesONE050
     * @tc.desc Verify Finding the integer 0 in an array containing the positive zero literal matches and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([+0, 5.0]);
      const result: boolean = arr.includes(0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0510
     * @tc.name testFloat32ArrayIncludesONE051
     * @tc.desc Verify Finding the integer 0 in an array containing positive numbers returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([7.0, 8.0]);
      const result: boolean = arr.includes(0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0520
     * @tc.name testFloat32ArrayIncludesONE052
     * @tc.desc Verify Finding the integer -1 in an array containing -1 matches and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([-1, 2.0]);
      const result: boolean = arr.includes(-1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0530
     * @tc.name testFloat32ArrayIncludesONE053
     * @tc.desc Verify Finding the integer -1 in an array containing 1 returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1, 2.0]);
      const result: boolean = arr.includes(-1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0540
     * @tc.name testFloat32ArrayIncludesONE054
     * @tc.desc Verify Finding the int maximum value 2147483647 in an array containing that value matches and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([2147483647]);
      const result: boolean = arr.includes(arr[0]);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0550
     * @tc.name testFloat32ArrayIncludesONE055
     * @tc.desc Verify Finding the int maximum value in an array containing smaller integers returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([100, 200]);
      const result: boolean = arr.includes(2147483647);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0560
     * @tc.name testFloat32ArrayIncludesONE056
     * @tc.desc Verify Finding the int minimum value -2147483648 in an array containing that value matches and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([-2147483648]);
      const result: boolean = arr.includes(-2147483648);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0570
     * @tc.name testFloat32ArrayIncludesONE057
     * @tc.desc Verify Finding the int minimum value in an array containing positive integers returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([100, 200]);
      const result: boolean = arr.includes(-2147483648);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0580
     * @tc.name testFloat32ArrayIncludesONE058
     * @tc.desc Verify Finding the scientific-notation 1.0e3, i.e. 1000, in an array containing 1000 matches and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0e3, 2.0]);
      const result: boolean = arr.includes(1.0e3);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0590
     * @tc.name testFloat32ArrayIncludesONE059
     * @tc.desc Verify Finding the hexadecimal float 9.0, i.e. 9.0, in an array containing 9.0 matches and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([9.0]);
      const result: boolean = arr.includes(9.0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0600
     * @tc.name testFloat32ArrayIncludesONE060
     * @tc.desc Verify Finding the decimal literal 10 in an array containing 10 matches and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10, 20]);
      const result: boolean = arr.includes(10);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0610
     * @tc.name testFloat32ArrayIncludesONE061
     * @tc.desc Verify Finding the hexadecimal 0xA, i.e. 10, in an array containing 10 matches and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10, 20]);
      const result: boolean = arr.includes(0xA);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0620
     * @tc.name testFloat32ArrayIncludesONE062
     * @tc.desc Verify Finding the octal 0o12, i.e. 10, in an array containing 10 matches and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10, 20]);
      const result: boolean = arr.includes(0o12);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0630
     * @tc.name testFloat32ArrayIncludesONE063
     * @tc.desc Verify Finding the binary 0b1010, i.e. 10, in an array containing 10 matches and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10, 20]);
      const result: boolean = arr.includes(0b1010);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0640
     * @tc.name testFloat32ArrayIncludesONE064
     * @tc.desc Verify Finding the scientific-notation 1e1, i.e. 10, in an array containing 10 matches and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10, 20]);
      const result: boolean = arr.includes(1e1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0650
     * @tc.name testFloat32ArrayIncludesONE065
     * @tc.desc Verify Finding the huge double 1e308 (truncated to positive infinity) in an array containing positive infinity matches and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([Infinity]);
      const result: boolean = arr.includes(Math.fround(1e308));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0660
     * @tc.name testFloat32ArrayIncludesONE066
     * @tc.desc Verify Finding Number.MAX_SAFE_INTEGER in an array containing that value matches and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([Number.MAX_SAFE_INTEGER]);
      const result: boolean = arr.includes(Math.fround(Number.MAX_SAFE_INTEGER));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0670
     * @tc.name testFloat32ArrayIncludesONE067
     * @tc.desc Verify Finding MAX_SAFE_INTEGER plus 1 in an array containing MAX_SAFE_INTEGER matches by truncation and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([Number.MAX_SAFE_INTEGER]);
      const result: boolean = arr.includes(Number.MAX_SAFE_INTEGER + 1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0680
     * @tc.name testFloat32ArrayIncludesONE068
     * @tc.desc Verify Finding 0.5 (a binary-exact fraction) in an array containing 0.5 matches and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.5, 1.0]);
      const result: boolean = arr.includes(arr[0]);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0690
     * @tc.name testFloat32ArrayIncludesONE069
     * @tc.desc Verify Finding 0.5 in an array containing 0.4 returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.4, 0.6]);
      const result: boolean = arr.includes(0.5);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0700
     * @tc.name testFloat32ArrayIncludesONE070
     * @tc.desc Verify Finding -0.5 in an array containing -0.5 matches and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([-0.5, 1.0]);
      const result: boolean = arr.includes(-0.5);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0710
     * @tc.name testFloat32ArrayIncludesONE071
     * @tc.desc Verify Finding -0.5 in an array containing 0.5 returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.5, 1.0]);
      const result: boolean = arr.includes(-0.5);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0720
     * @tc.name testFloat32ArrayIncludesONE072
     * @tc.desc Verify Finding the minimum negative subnormal number -1.401298464324817e-45 in an array containing that value matches and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([-1.401298464324817e-45]);
      const result: boolean = arr.includes(-1.401298464324817e-45);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0730
     * @tc.name testFloat32ArrayIncludesONE073
     * @tc.desc Verify An empty array finding NaN returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([]);
      const result: boolean = arr.includes(NaN);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0740
     * @tc.name testFloat32ArrayIncludesONE074
     * @tc.desc Verify An empty array finding positive zero returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([]);
      const result: boolean = arr.includes(0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0750
     * @tc.name testFloat32ArrayIncludesONE075
     * @tc.desc Verify A single-element array finding its sole element matches and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([5.0]);
      const result: boolean = arr.includes(5.0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0760
     * @tc.name testFloat32ArrayIncludesONE076
     * @tc.desc Verify A single-element array finding another element returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([5.0]);
      const result: boolean = arr.includes(6.0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0770
     * @tc.name testFloat32ArrayIncludesONE077
     * @tc.desc Verify An all-zero array finding 0 matches and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0, 0.0, 0.0]);
      const result: boolean = arr.includes(0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0780
     * @tc.name testFloat32ArrayIncludesONE078
     * @tc.desc Verify An all-same-value array finding that value matches and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([2.5, 2.5, 2.5]);
      const result: boolean = arr.includes(arr[0]);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0790
     * @tc.name testFloat32ArrayIncludesONE079
     * @tc.desc Verify An all-same-value array finding another value returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([2.5, 2.5, 2.5]);
      const result: boolean = arr.includes(2.6);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0800
     * @tc.name testFloat32ArrayIncludesONE080
     * @tc.desc Verify Finding an element appearing at the first position matches and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([7.0, 8.0, 9.0]);
      const result: boolean = arr.includes(7.0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0810
     * @tc.name testFloat32ArrayIncludesONE081
     * @tc.desc Verify Finding an element appearing at the last position matches and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([7.0, 8.0, 9.0]);
      const result: boolean = arr.includes(9.0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0820
     * @tc.name testFloat32ArrayIncludesONE082
     * @tc.desc Verify Finding an element that repeats multiple times matches and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([3.0, 3.0, 4.0]);
      const result: boolean = arr.includes(3.0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0830
     * @tc.name testFloat32ArrayIncludesONE083
     * @tc.desc Verify Finding positive infinity in an array containing the large finite positive number 3.4e37 returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([3.4e37]);
      const result: boolean = arr.includes(Infinity);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0840
     * @tc.name testFloat32ArrayIncludesONE084
     * @tc.desc Verify Finding NaN in an array containing positive infinity returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([Infinity]);
      const result: boolean = arr.includes(NaN);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0850
     * @tc.name testFloat32ArrayIncludesONE085
     * @tc.desc Verify Finding negative zero in an array containing 1.0 returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0]);
      const result: boolean = arr.includes(-0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0860
     * @tc.name testFloat32ArrayIncludesONE086
     * @tc.desc Verify When fromIndex is 0, searching from the first position matches and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const result: boolean = arr.includes(0x10, 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0870
     * @tc.name testFloat32ArrayIncludesONE087
     * @tc.desc Verify When fromIndex is 0, finding a non-existent element returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const result: boolean = arr.includes(9.0, 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0880
     * @tc.name testFloat32ArrayIncludesONE088
     * @tc.desc Verify When fromIndex is 1, it skips the index 0 element and returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const result: boolean = arr.includes(0x10, 1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0890
     * @tc.name testFloat32ArrayIncludesONE089
     * @tc.desc Verify When fromIndex is 1, finding the index 1 element matches and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const result: boolean = arr.includes(0b1010, 1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0900
     * @tc.name testFloat32ArrayIncludesONE090
     * @tc.desc Verify When fromIndex is length minus 1, i.e. 2, finding the last element matches and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const result: boolean = arr.includes(-1.0, 2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0910
     * @tc.name testFloat32ArrayIncludesONE091
     * @tc.desc Verify When fromIndex is length minus 1, finding the first element returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const result: boolean = arr.includes(0x10, 2);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0920
     * @tc.name testFloat32ArrayIncludesONE092
     * @tc.desc Verify When fromIndex equals length, i.e. 3, it is out of bounds and returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const result: boolean = arr.includes(-1.0, 3);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0930
     * @tc.name testFloat32ArrayIncludesONE093
     * @tc.desc Verify When fromIndex is length plus 1, i.e. 4, it is out of bounds and returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const result: boolean = arr.includes(0x10, 4);
      expect(result).assertFalse();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0940
     * @tc.name testFloat32ArrayIncludesONE094
     * @tc.desc Verify When fromIndex is -1, finding the first element returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const result: boolean = arr.includes(0x10, -1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0950
     * @tc.name testFloat32ArrayIncludesONE095
     * @tc.desc Verify When fromIndex is negative length, i.e. -3, it wraps around to the first element and matches, returning true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const result: boolean = arr.includes(0x10, -3);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0960
     * @tc.name testFloat32ArrayIncludesONE096
     * @tc.desc Verify When fromIndex is negative length, i.e. -3, finding a non-existent element returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const result: boolean = arr.includes(9.0, -3);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0970
     * @tc.name testFloat32ArrayIncludesONE097
     * @tc.desc Verify When fromIndex is negative length minus 1, i.e. -4, it truncates to 0 then finding the first element matches and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const result: boolean = arr.includes(0x10, -4);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0980
     * @tc.name testFloat32ArrayIncludesONE098
     * @tc.desc Verify When fromIndex is negative length minus 1, i.e. -4, it truncates to 0 then finding a non-existent element returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const result: boolean = arr.includes(9.0, -4);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_0990
     * @tc.name testFloat32ArrayIncludesONE099
     * @tc.desc Verify When fromIndex is the huge positive number 1000, it is out of bounds and returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const result: boolean = arr.includes(0x10, 1000);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_1000
     * @tc.name testFloat32ArrayIncludesONE100
     * @tc.desc Verify When fromIndex is the huge negative number -1000, it truncates to 0 then finding the first element matches and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const result: boolean = arr.includes(0x10, -1000);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_1010
     * @tc.name testFloat32ArrayIncludesONE101
     * @tc.desc Verify When fromIndex is the int maximum value 2147483647, it is out of bounds and returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const result: boolean = arr.includes(0x10, 2147483647);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_1020
     * @tc.name testFloat32ArrayIncludesONE102
     * @tc.desc Verify When fromIndex is the int minimum value -2147483648, it truncates to 0 then finding the first element matches and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const result: boolean = arr.includes(0x10, -2147483648);
      expect(result).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_1030
     * @tc.name testFloat32ArrayIncludesONE103
     * @tc.desc Verify Omitting fromIndex defaults to searching from 0 and finding a non-existent element returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const result: boolean = arr.includes(8.0);
      expect(result).assertFalse();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_1040
     * @tc.name testFloat32ArrayIncludesONE104
     * @tc.desc Verify When fromIndex is 2, finding the index 1 element returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const result: boolean = arr.includes(0b1010, 2);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_1050
     * @tc.name testFloat32ArrayIncludesONE105
     * @tc.desc Verify When fromIndex is -2, it wraps around to index 1 and finding the element at that position matches and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const result: boolean = arr.includes(0b1010, -2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_1060
     * @tc.name testFloat32ArrayIncludesONE106
     * @tc.desc Verify When fromIndex is -2, it wraps around to index 1 and finding the index 0 element returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const result: boolean = arr.includes(0x10, -2);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_1070
     * @tc.name testFloat32ArrayIncludesONE107
     * @tc.desc Verify When fromIndex is 0, finding a duplicate element matches the first one and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([3.0, 3.0, 4.0]);
      const result: boolean = arr.includes(3.0, 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_1080
     * @tc.name testFloat32ArrayIncludesONE108
     * @tc.desc Verify When fromIndex is 1, finding a duplicate element present at both index 0 and 2 matches and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([3.0, 5.0, 3.0]);
      const result: boolean = arr.includes(3.0, 1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_1090
     * @tc.name testFloat32ArrayIncludesONE109
     * @tc.desc Verify When fromIndex is 1, finding a duplicate element present only at index 0 returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([3.0, 5.0, 6.0]);
      const result: boolean = arr.includes(3.0, 1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_1100
     * @tc.name testFloat32ArrayIncludesONE110
     * @tc.desc Verify For a single-element array, when fromIndex is 0, finding that element matches and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([5.0]);
      const result: boolean = arr.includes(5.0, 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_1110
     * @tc.name testFloat32ArrayIncludesONE111
     * @tc.desc Verify For a single-element array, when fromIndex is 1, it is out of bounds and returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([5.0]);
      const result: boolean = arr.includes(5.0, 1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_1120
     * @tc.name testFloat32ArrayIncludesONE112
     * @tc.desc Verify For a single-element array, when fromIndex is -1, it wraps around and finding that element matches and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([5.0]);
      const result: boolean = arr.includes(5.0, -1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_1130
     * @tc.name testFloat32ArrayIncludesONE113
     * @tc.desc Verify For an empty array, when fromIndex is -1, finding any element returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([]);
      const result: boolean = arr.includes(1.0, -1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_1140
     * @tc.name testFloat32ArrayIncludesONE114
     * @tc.desc Verify Explicitly passing undefined as fromIndex defaults to searching from 0 and matches, returning true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const result: boolean = arr.includes(0x10, undefined);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_1150
     * @tc.name testFloat32ArrayIncludesONE115
     * @tc.desc Verify When fromIndex is 1, finding NaN at index 1 matches and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, NaN, 3.0]);
      const result: boolean = arr.includes(NaN, 1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_1160
     * @tc.name testFloat32ArrayIncludesONE116
     * @tc.desc Verify When fromIndex is 2, finding NaN present only at index 1 returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, NaN, 3.0]);
      const result: boolean = arr.includes(NaN, 2);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_1170
     * @tc.name testFloat32ArrayIncludesONE117
     * @tc.desc Verify When fromIndex is 0, finding negative zero in an array containing negative zero matches and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([-0, 1.0, 2.0]);
      const result: boolean = arr.includes(-0, 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_1180
     * @tc.name testFloat32ArrayIncludesONE118
     * @tc.desc Verify When fromIndex is 1, finding negative zero present only at index 0 returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([-0, 1.0, 2.0]);
      const result: boolean = arr.includes(-0, 1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_1190
     * @tc.name testFloat32ArrayIncludesONE119
     * @tc.desc Verify When fromIndex is -2, finding the float32 maximum value at index 1 matches and returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 3.4028234663852886e+38, 2.0]);
      const result: boolean = arr.includes(arr[1], -2);
      expect(result).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_INCLUDESONE_1200
     * @tc.name testFloat32ArrayIncludesONE120
     * @tc.desc Verify fromIndex -length starts searching from the first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayIncludesONE120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(7.0, 8.0, 9.0);
      const fromIndex: int = -arr.length;
      expect(arr.includes(7.0, fromIndex)).assertTrue();
    });

  });
}
