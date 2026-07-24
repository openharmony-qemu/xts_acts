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

export default function Float32ArrayFill1Test(): void {
  describe('Float32ArrayFill1Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0010
     * @tc.name testFloat32ArrayFillONE001
     * @tc.desc Verify arity 1 passing only value fills the entire array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(4);
      const v = 7;
      const ret = arr.fill(v);
      expect(ret).assertEqual(arr);
      expect(arr.$_get(0)).assertEqual(7);
      expect(arr.$_get(3)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0020
     * @tc.name testFloat32ArrayFillONE002
     * @tc.desc Verify arity 2 passing value and start fills to the end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(5);
      const v = 3;
      const ret = arr.fill(v, 2);
      expect(ret).assertEqual(arr);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(3);
      expect(arr.$_get(4)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0030
     * @tc.name testFloat32ArrayFillONE003
     * @tc.desc Verify arity 3 passing value, start, end fills the specified range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(6);
      const v = 9;
      const ret = arr.fill(v, 1, 4);
      expect(ret).assertEqual(arr);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(9);
      expect(arr.$_get(3)).assertEqual(9);
      expect(arr.$_get(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0040
     * @tc.name testFloat32ArrayFillONE004
     * @tc.desc Verify arity 1 filling an empty array does not throw and length is still 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      const v = 5;
      const ret = arr.fill(v);
      expect(ret).assertEqual(arr);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0050
     * @tc.name testFloat32ArrayFillONE005
     * @tc.desc Verify arity 3 with explicit start=0 and end=0 is a no-op on a non-empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const v = 8;
      const ret = arr.fill(v, 0, 0);
      expect(ret).assertEqual(arr);
      expect(arr.$_get(0)).assertEqual(16);
      expect(arr.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0060
     * @tc.name testFloat32ArrayFillONE006
     * @tc.desc Verify value is the Float32 maximum finite value 3.4028234663852886e+38
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      const v = 3.4028234663852886e+38;
      arr.fill(v);
      const expected = 3.4028234663852886e+38;
      expect(arr.$_get(0)).assertEqual(expected);
      expect(arr.$_get(1)).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0070
     * @tc.name testFloat32ArrayFillONE007
     * @tc.desc Verify value is the Float32 minimum positive normal number 1.1754943508222875e-38
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      const v = 1.1754943508222875e-38;
      arr.fill(v);
      const expected = 1.1754943508222875e-38;
      expect(arr.$_get(0)).assertEqual(expected);
      expect(arr.$_get(1)).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0080
     * @tc.name testFloat32ArrayFillONE008
     * @tc.desc Verify value is the Float32 minimum positive subnormal number 1.401298464324817e-45
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      const v = 1.401298464324817e-45;
      arr.fill(v);
      const expected = 1.401298464324817e-45;
      expect(arr.$_get(0)).assertEqual(expected);
      expect(arr.$_get(1)).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0090
     * @tc.name testFloat32ArrayFillONE009
     * @tc.desc Verify value is NaN and after filling the elements are NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      const v = NaN;
      arr.fill(v);
      expect(arr.$_get(0)).assertNaN();
      expect(arr.$_get(2)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0100
     * @tc.name testFloat32ArrayFillONE010
     * @tc.desc Verify value is positive Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      const v = Infinity;
      arr.fill(v);
      expect(arr.$_get(0)).assertEqual(Infinity);
      expect(arr.$_get(1)).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0110
     * @tc.name testFloat32ArrayFillONE011
     * @tc.desc Verify value is negative Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      const v = -Infinity;
      arr.fill(v);
      expect(arr.$_get(0)).assertEqual(-Infinity);
      expect(arr.$_get(1)).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0120
     * @tc.name testFloat32ArrayFillONE012
     * @tc.desc Verify value is positive zero +0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(5.0, 5.0);
      const v = 0;
      arr.fill(v);
      expect(arr.$_get(0)).assertEqual(0);
      expect(1 / arr.$_get(0)).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0130
     * @tc.name testFloat32ArrayFillONE013
     * @tc.desc Verify value is negative zero -0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(5.0, 5.0);
      const v = -0.0;
      arr.fill(v);
      expect(arr.$_get(0)).assertEqual(0);
      expect(1 / arr.$_get(0)).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0140
     * @tc.name testFloat32ArrayFillONE014
     * @tc.desc Verify value is the minimum finite negative value -3.4028234663852886e+38
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      const v = -3.4028234663852886e+38;
      arr.fill(v);
      const expected = -3.4028234663852886e+38;
      expect(arr.$_get(0)).assertEqual(expected);
      expect(arr.$_get(1)).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0150
     * @tc.name testFloat32ArrayFillONE015
     * @tc.desc Verify value is 0.1, a single-precision precision truncation value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      const v = 0.1;
      arr.fill(v);
      const expected = 0.1;
      expect(Math.abs(arr.$_get(0) - expected) < 1e-6).assertTrue();
      expect(Math.abs(arr.$_get(1) - expected) < 1e-6).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0160
     * @tc.name testFloat32ArrayFillONE016
     * @tc.desc Verify value is 0.2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      const v = 0.2;
      arr.fill(v);
      const expected = 0.2;
      expect(Math.abs(arr.$_get(0) - expected) < 1e-6).assertTrue();
      expect(Math.abs(arr.$_get(1) - expected) < 1e-6).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0170
     * @tc.name testFloat32ArrayFillONE017
     * @tc.desc Verify value is 0.3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      const v = 0.3;
      arr.fill(v);
      const expected = 0.3;
      expect(Math.abs(arr.$_get(0) - expected) < 1e-6).assertTrue();
      expect(Math.abs(arr.$_get(1) - expected) < 1e-6).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0180
     * @tc.name testFloat32ArrayFillONE018
     * @tc.desc Verify value is 1.1, a precision truncation value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      const v = 1.1;
      arr.fill(v);
      const expected = 1.1;
      expect(Math.abs(arr.$_get(0) - expected) < 1e-6).assertTrue();
      expect(Math.abs(arr.$_get(1) - expected) < 1e-6).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0190
     * @tc.name testFloat32ArrayFillONE019
     * @tc.desc Verify value is 1.0000001, a precision threshold value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      const v = 1.0000001;
      arr.fill(v);
      const expected = 1.0000001;
      expect(Math.abs(arr.$_get(0) - expected) < 1e-6).assertTrue();
      expect(Math.abs(arr.$_get(1) - expected) < 1e-6).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0200
     * @tc.name testFloat32ArrayFillONE020
     * @tc.desc Verify value is 16777216, i.e. 2^24, the maximum exact integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      const v = 16777216;
      arr.fill(v);
      expect(arr.$_get(0)).assertEqual(16777216);
      expect(arr.$_get(1)).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0210
     * @tc.name testFloat32ArrayFillONE021
     * @tc.desc Verify value is 16777217, i.e. 2^24+1, truncates to 16777216
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      const v = 16777217;
      arr.fill(v);
      expect(arr.$_get(0)).assertEqual(16777216);
      expect(arr.$_get(1)).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0220
     * @tc.name testFloat32ArrayFillONE022
     * @tc.desc Verify value is 1.0e40, exceeding the float32 range, overflows to positive Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      const v = 1.0e40;
      arr.fill(v);
      expect(arr.$_get(0)).assertEqual(Infinity);
      expect(arr.$_get(1)).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0230
     * @tc.name testFloat32ArrayFillONE023
     * @tc.desc Verify value is -1.0e40, exceeding the float32 range, overflows to negative Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      const v = -1.0e40;
      arr.fill(v);
      expect(arr.$_get(0)).assertEqual(-Infinity);
      expect(arr.$_get(1)).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0240
     * @tc.name testFloat32ArrayFillONE024
     * @tc.desc Verify value is 1.0e-46, underflows to positive zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(9.0, 9.0);
      const v = 1.0e-46;
      arr.fill(v);
      expect(arr.$_get(0)).assertEqual(0);
      expect(1 / arr.$_get(0)).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0250
     * @tc.name testFloat32ArrayFillONE025
     * @tc.desc Verify value is the integer 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.0, 4.0);
      const v = 0;
      arr.fill(v);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0260
     * @tc.name testFloat32ArrayFillONE026
     * @tc.desc Verify value is the negative integer -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      const v = -1;
      arr.fill(v);
      expect(arr.$_get(0)).assertEqual(-1);
      expect(arr.$_get(1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0270
     * @tc.name testFloat32ArrayFillONE027
     * @tc.desc Verify value is the int maximum value 2147483647 stored into float32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      const v = 2147483647;
      arr.fill(v);
      const expected = 2147483648;
      expect(arr.$_get(0)).assertEqual(expected);
      expect(arr.$_get(1)).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0280
     * @tc.name testFloat32ArrayFillONE028
     * @tc.desc Verify value is the int minimum value -2147483648 stored into float32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      const v = -2147483648;
      arr.fill(v);
      const expected = -2147483648;
      expect(arr.$_get(0)).assertEqual(expected);
      expect(arr.$_get(1)).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0290
     * @tc.name testFloat32ArrayFillONE029
     * @tc.desc Verify value is the scientific notation 1.0e3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      const v = 1.0e3;
      arr.fill(v);
      expect(arr.$_get(0)).assertEqual(1000);
      expect(arr.$_get(1)).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0300
     * @tc.name testFloat32ArrayFillONE030
     * @tc.desc Verify value is the hexadecimal float 9.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      const v = 9.0;
      arr.fill(v);
      expect(arr.$_get(0)).assertEqual(9);
      expect(arr.$_get(1)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0310
     * @tc.name testFloat32ArrayFillONE031
     * @tc.desc Verify value is 1e10, a large integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      const v = 1e10;
      arr.fill(v);
      expect(arr.$_get(0)).assertEqual(10000000000);
      expect(arr.$_get(1)).assertEqual(10000000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0320
     * @tc.name testFloat32ArrayFillONE032
     * @tc.desc Verify start of 0 fills from the first position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(4);
      const v = 2;
      arr.fill(v, 0);
      expect(arr.$_get(0)).assertEqual(2);
      expect(arr.$_get(3)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0330
     * @tc.name testFloat32ArrayFillONE033
     * @tc.desc Verify start of 1 skips the first position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(4);
      const v = 2;
      arr.fill(v, 1);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(3)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0340
     * @tc.name testFloat32ArrayFillONE034
     * @tc.desc Verify start of length-1 fills only the last position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(4);
      const v = 6;
      arr.fill(v, 3);
      expect(arr.$_get(2)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0350
     * @tc.name testFloat32ArrayFillONE035
     * @tc.desc Verify start equal to length is out of bounds and a silent no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const v = 9;
      arr.fill(v, 3);
      expect(arr.$_get(0)).assertEqual(16);
      expect(arr.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0360
     * @tc.name testFloat32ArrayFillONE036
     * @tc.desc Verify start of length+1 is out of bounds and a silent no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const v = 9;
      arr.fill(v, 4);
      expect(arr.$_get(0)).assertEqual(16);
      expect(arr.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0370
     * @tc.name testFloat32ArrayFillONE037
     * @tc.desc Verify start of -1 negative index wraps around to the last position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(4);
      const v = 5;
      arr.fill(v, -1);
      expect(arr.$_get(2)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0380
     * @tc.name testFloat32ArrayFillONE038
     * @tc.desc Verify start of -length wraps around to the first position and fills all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(4);
      const v = 5;
      arr.fill(v, -4);
      expect(arr.$_get(0)).assertEqual(5);
      expect(arr.$_get(3)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0390
     * @tc.name testFloat32ArrayFillONE039
     * @tc.desc Verify start of -length-1 exceeds the negative range and is a silent no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const v = 9;
      arr.fill(v, -4);
      expect(arr.$_get(0)).assertEqual(9);
      expect(arr.$_get(2)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0400
     * @tc.name testFloat32ArrayFillONE040
     * @tc.desc Verify start of 2 begins in the middle of a length-5 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(5);
      const v = 7;
      arr.fill(v, 2);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(7);
      expect(arr.$_get(4)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0410
     * @tc.name testFloat32ArrayFillONE041
     * @tc.desc Verify start of -2 begins from the second-to-last position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(5);
      const v = 7;
      arr.fill(v, -2);
      expect(arr.$_get(2)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(7);
      expect(arr.$_get(4)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0420
     * @tc.name testFloat32ArrayFillONE042
     * @tc.desc Verify start of the huge positive number 100 is a silent no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const v = 9;
      arr.fill(v, 100);
      expect(arr.$_get(0)).assertEqual(16);
      expect(arr.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0430
     * @tc.name testFloat32ArrayFillONE043
     * @tc.desc Verify start of the huge negative number -100 clamps to 0 and fills all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      const v = 9;
      arr.fill(v, -100);
      expect(arr.$_get(0)).assertEqual(9);
      expect(arr.$_get(2)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0440
     * @tc.name testFloat32ArrayFillONE044
     * @tc.desc Verify end of 0 results in an empty fill range and is a no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const v = 9;
      arr.fill(v, 0, 0);
      expect(arr.$_get(0)).assertEqual(16);
      expect(arr.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0450
     * @tc.name testFloat32ArrayFillONE045
     * @tc.desc Verify end of 1 fills only the first position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(4);
      const v = 8;
      arr.fill(v, 0, 1);
      expect(arr.$_get(0)).assertEqual(8);
      expect(arr.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0460
     * @tc.name testFloat32ArrayFillONE046
     * @tc.desc Verify end of length-1 excludes the last position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(4);
      const v = 8;
      arr.fill(v, 0, 3);
      expect(arr.$_get(2)).assertEqual(8);
      expect(arr.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0470
     * @tc.name testFloat32ArrayFillONE047
     * @tc.desc Verify end of length is equivalent to the default and fills to the end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(4);
      const v = 8;
      arr.fill(v, 0, 4);
      expect(arr.$_get(0)).assertEqual(8);
      expect(arr.$_get(3)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0480
     * @tc.name testFloat32ArrayFillONE048
     * @tc.desc Verify end of length+1 is out of bounds and clamps to length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(4);
      const v = 8;
      arr.fill(v, 0, 5);
      expect(arr.$_get(0)).assertEqual(8);
      expect(arr.$_get(3)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0490
     * @tc.name testFloat32ArrayFillONE049
     * @tc.desc Verify end of -1 excludes the last position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(4);
      const v = 8;
      arr.fill(v, 0, -1);
      expect(arr.$_get(2)).assertEqual(8);
      expect(arr.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0500
     * @tc.name testFloat32ArrayFillONE050
     * @tc.desc Verify end of -length keeps only the first position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(4);
      const v = 8;
      arr.fill(v, 0, -4);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0510
     * @tc.name testFloat32ArrayFillONE051
     * @tc.desc Verify end of -length-1 results in an empty range and is a no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const v = 9;
      arr.fill(v, 0, -4);
      expect(arr.$_get(0)).assertEqual(16);
      expect(arr.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0520
     * @tc.name testFloat32ArrayFillONE052
     * @tc.desc Verify when start is greater than end it is a silent no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      const v = 9;
      arr.fill(v, 3, 2);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0530
     * @tc.name testFloat32ArrayFillONE053
     * @tc.desc Verify when start equals end it is a silent no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      const v = 9;
      arr.fill(v, 2, 2);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0540
     * @tc.name testFloat32ArrayFillONE054
     * @tc.desc Verify end of 2 cuts off in the middle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(5);
      const v = 4;
      arr.fill(v, 0, 2);
      expect(arr.$_get(0)).assertEqual(4);
      expect(arr.$_get(1)).assertEqual(4);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0550
     * @tc.name testFloat32ArrayFillONE055
     * @tc.desc Verify end of -2 cuts off at the third-to-last position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(5);
      const v = 4;
      arr.fill(v, 0, -2);
      expect(arr.$_get(2)).assertEqual(4);
      expect(arr.$_get(3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0560
     * @tc.name testFloat32ArrayFillONE056
     * @tc.desc Verify overload 1 called with a const value: float type variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      const value = 12;
      arr.fill(value, 1, 3);
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(12);
      expect(arr.$_get(2)).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0570
     * @tc.name testFloat32ArrayFillONE057
     * @tc.desc Verify overload 1 with a float variable that is a negative floating-point value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      const value = -3.5;
      arr.fill(value);
      expect(arr.$_get(0)).assertEqual(-3.5);
      expect(arr.$_get(2)).assertEqual(-3.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0580
     * @tc.name testFloat32ArrayFillONE058
     * @tc.desc Verify overload 1 with a float variable that is a floating-point arithmetic result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      const a = 1.5;
      const b = 2.5;
      const value = a + b;
      arr.fill(value);
      expect(arr.$_get(0)).assertEqual(4);
      expect(arr.$_get(1)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0590
     * @tc.name testFloat32ArrayFillONE059
     * @tc.desc Verify overload 1 with a float variable assigned the NaN literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      const value = NaN;
      arr.fill(value, 0, 2);
      expect(arr.$_get(0)).assertNaN();
      expect(arr.$_get(1)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0600
     * @tc.name testFloat32ArrayFillONE060
     * @tc.desc Verify fill returns this, the same reference as the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      const v = 1;
      const ret = arr.fill(v);
      expect(ret).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0610
     * @tc.name testFloat32ArrayFillONE061
     * @tc.desc Verify the return value is a Float32Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      const v = 1;
      const ret = arr.fill(v);
      expect(ret instanceof Float32Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0620
     * @tc.name testFloat32ArrayFillONE062
     * @tc.desc Verify after fill the length remains unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(5);
      const before = arr.length;
      const v = 2;
      arr.fill(v);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0630
     * @tc.name testFloat32ArrayFillONE063
     * @tc.desc Verify after fill the byteLength remains unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(5);
      const before = arr.byteLength;
      const v = 2;
      arr.fill(v);
      expect(arr.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0640
     * @tc.name testFloat32ArrayFillONE064
     * @tc.desc Verify after fill the underlying buffer reference is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(5);
      const buf = arr.buffer;
      const v = 2;
      arr.fill(v);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0650
     * @tc.name testFloat32ArrayFillONE065
     * @tc.desc Verify after fill the byteOffset remains unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const arr = new Float32Array(buf, 8, 4);
      const v = 3;
      arr.fill(v);
      expect(arr.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0660
     * @tc.name testFloat32ArrayFillONE066
     * @tc.desc Verify fill modifies elements in place and verifies the write takes effect
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.0, 0.0, 0.0);
      const v = 7;
      arr.fill(v);
      expect(arr.$_get(0)).assertEqual(7);
      expect(arr.$_get(1)).assertEqual(7);
      expect(arr.$_get(2)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0670
     * @tc.name testFloat32ArrayFillONE067
     * @tc.desc Verify chained fill().fill() returns the same this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      const a = 1;
      const b = 2;
      const ret = arr.fill(a).fill(b);
      expect(ret).assertEqual(arr);
      expect(arr.$_get(0)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0680
     * @tc.name testFloat32ArrayFillONE068
     * @tc.desc Verify chained fill().subarray() returns a shared buffer view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(4);
      const v = 5;
      const view = arr.fill(v).subarray(1, 3);
      expect(view.length).assertEqual(2);
      expect(view.$_get(0)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0690
     * @tc.name testFloat32ArrayFillONE069
     * @tc.desc Verify multiple fill calls return a value that each time equals the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      const v = 1;
      const r1 = arr.fill(v);
      const r2 = arr.fill(v);
      expect(r1).assertEqual(arr);
      expect(r2).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0700
     * @tc.name testFloat32ArrayFillONE070
     * @tc.desc Verify after fill BYTES_PER_ELEMENT remains 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      const v = 1;
      arr.fill(v);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0710
     * @tc.name testFloat32ArrayFillONE071
     * @tc.desc Verify start greater than length is a silent no-op and does not throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0);
      const v = 9;
      arr.fill(v, 5);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0720
     * @tc.name testFloat32ArrayFillONE072
     * @tc.desc Verify end greater than length silently clamps to length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      const v = 7;
      arr.fill(v, 0, 10);
      expect(arr.$_get(0)).assertEqual(7);
      expect(arr.$_get(2)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0730
     * @tc.name testFloat32ArrayFillONE073
     * @tc.desc Verify a negative start whose absolute value is greater than length clamps to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      const v = 7;
      arr.fill(v, -10);
      expect(arr.$_get(0)).assertEqual(7);
      expect(arr.$_get(2)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0740
     * @tc.name testFloat32ArrayFillONE074
     * @tc.desc Verify a negative end whose absolute value is greater than length clamps to 0 and the range is empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const v = 9;
      arr.fill(v, 0, -10);
      expect(arr.$_get(0)).assertEqual(16);
      expect(arr.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0750
     * @tc.name testFloat32ArrayFillONE075
     * @tc.desc Verify start and end both out of bounds in the positive direction is a silent no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const v = 9;
      arr.fill(v, 5, 8);
      expect(arr.$_get(0)).assertEqual(16);
      expect(arr.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0760
     * @tc.name testFloat32ArrayFillONE076
     * @tc.desc Verify the combination of a negative start and a positive end where start is still less than end fills normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(5);
      const v = 6;
      arr.fill(v, -3, 4);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(6);
      expect(arr.$_get(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0770
     * @tc.name testFloat32ArrayFillONE077
     * @tc.desc Verify both start and end are negative and start is less than end, filling normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(6);
      const v = 6;
      arr.fill(v, -4, -1);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(6);
      expect(arr.$_get(4)).assertEqual(6);
      expect(arr.$_get(5)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0780
     * @tc.name testFloat32ArrayFillONE078
     * @tc.desc Verify filling 0.1 then reading back verifies that float32 precision differs from the number literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      const v = 0.1;
      arr.fill(v);
      const readback = arr.$_get(0);
      const expected = new Float32Array([0.1]);
      expect(readback).assertEqual(expected.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0790
     * @tc.name testFloat32ArrayFillONE079
     * @tc.desc Verify filling 0.1 and 0.2 and summing them is not equal to 0.3 due to precision truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      const a = 0.1;
      const b = 0.2;
      arr.fill(a, 0, 1);
      arr.fill(b, 1, 2);
      const sum = arr.$_get(0) + arr.$_get(1);
      const expected = new Float32Array([0.1, 0.2]);
      expect(sum).assertEqual(expected.$_get(0) + expected.$_get(1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0800
     * @tc.name testFloat32ArrayFillONE080
     * @tc.desc Verify filling Float32.MAX is stored exactly without overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      const v = 3.4028234663852886e+38;
      arr.fill(v);
      const expected = 3.4028234663852886e+38;
      expect(arr.$_get(0)).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0810
     * @tc.name testFloat32ArrayFillONE081
     * @tc.desc Verify filling a value slightly greater than Float32.MAX overflows to Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      const v = 3.41e+38;
      arr.fill(v);
      expect(arr.$_get(0)).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0820
     * @tc.name testFloat32ArrayFillONE082
     * @tc.desc Verify filling positive zero and negative zero are distinguished by sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Float32Array(1);
      const v1 = 0;
      arr1.fill(v1);
      const arr2 = new Float32Array(1);
      const v2 = -0.0;
      arr2.fill(v2);
      expect(1 / arr1.$_get(0)).assertEqual(Infinity);
      expect(1 / arr2.$_get(0)).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0830
     * @tc.name testFloat32ArrayFillONE083
     * @tc.desc Verify filling Infinity then taking the reciprocal produces 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      const v = Infinity;
      arr.fill(v);
      const inv = 1 / arr.$_get(0);
      expect(inv).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0840
     * @tc.name testFloat32ArrayFillONE084
     * @tc.desc Verify filling the minimum subnormal number MIN_VALUE stays non-zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      const v = 1.401298464324817e-45;
      arr.fill(v);
      expect(arr.$_get(0) > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0850
     * @tc.name testFloat32ArrayFillONE085
     * @tc.desc Verify filling the minimum normal number MIN_NORMAL stays non-zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      const v = 1.1754943508222875e-38;
      arr.fill(v);
      expect(arr.$_get(0) > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0860
     * @tc.name testFloat32ArrayFillONE086
     * @tc.desc Verify filling the large integer 16777218 exceeding 2^24 truncates to 16777216
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      const v = 16777218;
      arr.fill(v);
      expect(arr.$_get(0)).assertEqual(16777218);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0870
     * @tc.name testFloat32ArrayFillONE087
     * @tc.desc Verify filling a negative subnormal underflows to negative zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(9.0);
      const v = -1.0e-46;
      arr.fill(v);
      expect(arr.$_get(0)).assertEqual(0);
      expect(1 / arr.$_get(0)).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0880
     * @tc.name testFloat32ArrayFillONE088
     * @tc.desc Verify filling the hexadecimal float 1.0 equals 1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      const v = 1.0;
      arr.fill(v);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0890
     * @tc.name testFloat32ArrayFillONE089
     * @tc.desc Verify filling the hexadecimal float 12.0 equals 12.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(2);
      const v = 12.0;
      arr.fill(v);
      expect(arr.$_get(0)).assertEqual(12);
      expect(arr.$_get(1)).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0900
     * @tc.name testFloat32ArrayFillONE090
     * @tc.desc Verify a single-element array with start=-1 fills the last position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      const v = 5;
      arr.fill(v, -1);
      expect(arr.$_get(0)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0910
     * @tc.name testFloat32ArrayFillONE091
     * @tc.desc Verify a single-element array is fully filled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      const v = 42;
      arr.fill(v);
      expect(arr.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0920
     * @tc.name testFloat32ArrayFillONE092
     * @tc.desc Verify after filling, reading back via the values iterator verifies the result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      const v = 4;
      arr.fill(v);
      const it = arr.values();
      expect(it.next().value).assertEqual(4);
      expect(it.next().value).assertEqual(4);
      expect(it.next().value).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0930
     * @tc.name testFloat32ArrayFillONE093
     * @tc.desc Verify after filling NaN, indexOf returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      const v = NaN;
      arr.fill(v);
      expect(arr.indexOf(NaN)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0940
     * @tc.name testFloat32ArrayFillONE094
     * @tc.desc Verify after filling NaN, includes returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      const v = NaN;
      arr.fill(v);
      expect(arr.includes(NaN)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0950
     * @tc.name testFloat32ArrayFillONE095
     * @tc.desc Verify filling 2^24 is preserved exactly without truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      const v = 16777216;
      arr.fill(v);
      expect(arr.$_get(0)).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0960
     * @tc.name testFloat32ArrayFillONE096
     * @tc.desc Verify filling the negative maximum finite value then negating produces the positive maximum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      const v = -3.4028234663852886e+38;
      arr.fill(v);
      const neg = -arr.$_get(0);
      const expected = 3.4028234663852886e+38;
      expect(neg).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0970
     * @tc.name testFloat32ArrayFillONE097
     * @tc.desc Verify the fill range contains only some elements while the rest keep their original values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      const v = 0;
      arr.fill(v, 1, 4);
      expect(arr.$_get(0)).assertEqual(16);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(3)).assertEqual(0);
      expect(arr.$_get(4)).assertEqual(1000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0980
     * @tc.name testFloat32ArrayFillONE098
     * @tc.desc Verify after filling, indexed traversal verifies all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      const v = 6;
      arr.fill(v);
      let count = 0;
      for (let __f32i = 0; __f32i < arr.length; __f32i++) {
        const x = arr.$_get(__f32i);
        expect(x).assertEqual(6);
        count = count + 1;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_0990
     * @tc.name testFloat32ArrayFillONE099
     * @tc.desc Verify after filling negative Infinity, comparing its magnitude with -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      const v = -Infinity;
      arr.fill(v);
      expect(arr.$_get(0) < -1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_1000
     * @tc.name testFloat32ArrayFillONE100
     * @tc.desc Verify after filling, the buffer byte content changes with the write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Float32Array(buf);
      const v = 1;
      arr.fill(v);
      const view = new Float32Array(buf);
      expect(view.$_get(0)).assertEqual(1);
      expect(view.$_get(1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_1010
     * @tc.name testFloat32ArrayFillONE101
     * @tc.desc Verify fill on a shared buffer view affects the other view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const a = new Float32Array(buf, 0, 2);
      const b = new Float32Array(buf, 0, 2);
      const v = 9;
      a.fill(v);
      expect(b.$_get(0)).assertEqual(9);
      expect(b.$_get(1)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_1020
     * @tc.name testFloat32ArrayFillONE102
     * @tc.desc Verify filling 0.5 then multiplying by 2 equals 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      const v = 0.5;
      arr.fill(v);
      const doubled = arr.$_get(0) * 2;
      expect(doubled).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_1030
     * @tc.name testFloat32ArrayFillONE103
     * @tc.desc Verify fill range with negative start and positive end where end is less than the normalized start is a no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      const v = 9;
      arr.fill(v, -1, 1);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_1040
     * @tc.name testFloat32ArrayFillONE104
     * @tc.desc Verify after filling, the array join string reflects the write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      const v = 2;
      arr.fill(v);
      expect(arr.join(',')).assertEqual('2,2,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_1050
     * @tc.name testFloat32ArrayFillONE105
     * @tc.desc Verify after filling, toString reflects the write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(3);
      const v = 3;
      arr.fill(v);
      expect(arr.toString()).assertEqual('3,3,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_1060
     * @tc.name testFloat32ArrayFillONE106
     * @tc.desc Verify fill end beyond the view length is clamped and does not write outside the view boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const base = new Float32Array(buf);
      base.$_set(0, 1.0);
      base.$_set(1, 2.0);
      base.$_set(2, 3.0);
      base.$_set(3, 4.0);
      const view = new Float32Array(buf, 4, 2);
      view.fill(9.0, 0, 10);
      expect(base.$_get(0)).assertEqual(1.0);
      expect(base.$_get(1)).assertEqual(9.0);
      expect(base.$_get(2)).assertEqual(9.0);
      expect(base.$_get(3)).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_1070
     * @tc.name testFloat32ArrayFillONE107
     * @tc.desc Verify fill start beyond the view length is clamped to an empty range with shared buffer unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const base = new Float32Array(buf);
      base.$_set(0, 1.0);
      base.$_set(1, 2.0);
      base.$_set(2, 3.0);
      base.$_set(3, 4.0);
      const view = new Float32Array(buf, 4, 2);
      view.fill(9.0, 3, 10);
      expect(base.$_get(0)).assertEqual(1.0);
      expect(base.$_get(1)).assertEqual(2.0);
      expect(base.$_get(2)).assertEqual(3.0);
      expect(base.$_get(3)).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILLONE_1080
     * @tc.name testFloat32ArrayFillONE108
     * @tc.desc Verify fill with start greater than end is a no-op and returns this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFillONE108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.fill(9.0, 2, 1);
      expect(result).assertEqual(arr);
      expect(arr.$_get(0)).assertEqual(1.0);
      expect(arr.$_get(1)).assertEqual(2.0);
      expect(arr.$_get(2)).assertEqual(3.0);
    });

  });
}
