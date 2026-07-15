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

export default function Float32ArrayEvery2Test(): void {
  describe('Float32ArrayEvery2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_0100
     * @tc.name testFloat32ArrayEveryTWO001
     * @tc.desc Verify all-positive array every returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, 1000000.0);
      const result = arr.every((value: number) => value > 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_0200
     * @tc.name testFloat32ArrayEveryTWO002
     * @tc.desc Verify all-equal array every returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5.0, 5.0, 5.0]);
      const result = arr.every((value: number) => value === 5);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_0300
     * @tc.name testFloat32ArrayEveryTWO003
     * @tc.desc Verify empty array every returns true for a vacuous predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      const result = arr.every((value: number) => value > 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_0400
     * @tc.name testFloat32ArrayEveryTWO004
     * @tc.desc Verify array containing NaN satisfies a NaN predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([NaN]);
      const result = arr.every((value: number) => value !== value);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_0500
     * @tc.name testFloat32ArrayEveryTWO005
     * @tc.desc Verify ArrayBuffer view containing Infinity satisfies an Infinity predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Float32Array(buf, 0, 2);
      arr.$_set(0, Infinity);
      arr.$_set(1, Infinity);
      const result = arr.every((value: number) => value === Infinity);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_0600
     * @tc.name testFloat32ArrayEveryTWO006
     * @tc.desc Verify Float32Array.of containing -0 satisfies a negative-zero predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-0.0);
      const result = arr.every((value: number) => (1 / value) === -Infinity);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_0700
     * @tc.name testFloat32ArrayEveryTWO007
     * @tc.desc Verify middle false array every returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, -2.0, 3.0]);
      const result = arr.every((value: number) => value > 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_0800
     * @tc.name testFloat32ArrayEveryTWO008
     * @tc.desc Verify subarray floating-point view every returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = new Float32Array([0.5, 1.5, 2.5, 3.5]);
      const arr = base.subarray(1, 4);
      const result = arr.every((value: number) => value > 1);
      expect(result).assertTrue();
    });




    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_0900
     * @tc.name testFloat32ArrayEveryTWO009
     * @tc.desc Verify all-zero array greater-than-or-equal-to-zero assertion every returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0, 0, 0]);
      const result = arr.every((value: number) => value >= 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_1000
     * @tc.name testFloat32ArrayEveryTWO010
     * @tc.desc Verify every return value runtime type is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const result = arr.every((value: number) => value > 0);
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_1100
     * @tc.name testFloat32ArrayEveryTWO011
     * @tc.desc Verify Float32 maximum finite value greater than zero every returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.4028234663852886e+38]);
      const result = arr.every((value: number) => value > 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_1200
     * @tc.name testFloat32ArrayEveryTWO012
     * @tc.desc Verify Float32 minimum positive subnormal value greater than zero every returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.401298464324817e-45]);
      const result = arr.every((value: number) => value > 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_1300
     * @tc.name testFloat32ArrayEveryTWO013
     * @tc.desc Verify Float32 minimum positive normal value greater than zero every returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.1754943508222875e-38]);
      const result = arr.every((value: number) => value > 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_1400
     * @tc.name testFloat32ArrayEveryTWO014
     * @tc.desc Verify NaN array using Number.isNaN assertion every returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([NaN]);
      const result = arr.every((value: number) => Number.isNaN(value));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_1500
     * @tc.name testFloat32ArrayEveryTWO015
     * @tc.desc Verify Infinity array strictly equal assertion every returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([Infinity]);
      const result = arr.every((value: number) => value === Infinity);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_1600
     * @tc.name testFloat32ArrayEveryTWO016
     * @tc.desc Verify -Infinity array strictly equal assertion every returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-Infinity]);
      const result = arr.every((value: number) => value === -Infinity);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_1700
     * @tc.name testFloat32ArrayEveryTWO017
     * @tc.desc Verify single positive element array every returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([7.0]);
      const result = arr.every((value: number) => value > 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_1800
     * @tc.name testFloat32ArrayEveryTWO018
     * @tc.desc Verify -0 array using reciprocal method assertion every returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-0.0]);
      const result = arr.every((value: number) => (1 / value) === Number.NEGATIVE_INFINITY);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_1900
     * @tc.name testFloat32ArrayEveryTWO019
     * @tc.desc Verify decimal array less-than-one assertion every returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.1, 0.2]);
      const result = arr.every((value: number) => value < 1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_2000
     * @tc.name testFloat32ArrayEveryTWO020
     * @tc.desc Verify 2^24 and 2^24+1 truncate to equal in float32 every returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([16777216, 16777217]);
      const result = arr.every((value: number) => value === 16777216);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_2100
     * @tc.name testFloat32ArrayEveryTWO021
     * @tc.desc Verify scientific notation value finiteness assertion every returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0e3, 9.0]);
      const result = arr.every((value: number) => value > -Infinity && value < Infinity);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_2200
     * @tc.name testFloat32ArrayEveryTWO022
     * @tc.desc Verify all-negative array less-than-zero assertion every returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-1.0, -2.0, -3.0]);
      const result = arr.every((value: number) => value < 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_2300
     * @tc.name testFloat32ArrayEveryTWO023
     * @tc.desc Verify zero element strictly equal to zero assertion every returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0]);
      const result = arr.every((value: number) => value === 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_2400
     * @tc.name testFloat32ArrayEveryTWO024
     * @tc.desc Verify int maximum value finiteness assertion every returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([2147483647]);
      const result = arr.every((value: number) => value > -Infinity && value < Infinity);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_2500
     * @tc.name testFloat32ArrayEveryTWO025
     * @tc.desc Verify int minimum value finiteness assertion every returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-2147483648]);
      const result = arr.every((value: number) => value > -Infinity && value < Infinity);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_2600
     * @tc.name testFloat32ArrayEveryTWO026
     * @tc.desc Verify combination of maximum and minimum finite values finiteness assertion every returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.4028234663852886e+38, -3.4028234663852886e+38]);
      const result = arr.every((value: number) => value > -Infinity && value < Infinity);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_2700
     * @tc.name testFloat32ArrayEveryTWO027
     * @tc.desc Verify combination of minimum positive subnormal value and minimum positive normal value finiteness assertion every returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.401298464324817e-45, 1.1754943508222875e-38]);
      const result = arr.every((value: number) => value > -Infinity && value < Infinity);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_2800
     * @tc.name testFloat32ArrayEveryTWO028
     * @tc.desc Verify ten-element all-positive array every returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0]);
      const result = arr.every((value: number) => value > 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_2900
     * @tc.name testFloat32ArrayEveryTWO029
     * @tc.desc Verify precision-truncated value greater-than-one assertion every returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.1, 1.0000001]);
      const result = arr.every((value: number) => value > 1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_3000
     * @tc.name testFloat32ArrayEveryTWO030
     * @tc.desc Verify scientific notation value strictly equal assertion every returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0e3]);
      const result = arr.every((value: number) => value === 1000);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_3100
     * @tc.name testFloat32ArrayEveryTWO031
     * @tc.desc Verify floating-point array greater-than-one assertion every returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.5, 2.5, 3.5]);
      const result = arr.every((value: number) => value > 1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_3200
     * @tc.name testFloat32ArrayEveryTWO032
     * @tc.desc Verify all-zero array strictly equal to zero assertion every returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0, 0, 0]);
      const result = arr.every((value: number) => value === 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_3300
     * @tc.name testFloat32ArrayEveryTWO033
     * @tc.desc Verify a first element negative value makes every return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-1.0, 2.0, 3.0]);
      const result = arr.every((value: number) => value > 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_3400
     * @tc.name testFloat32ArrayEveryTWO034
     * @tc.desc Verify a last element negative value makes every return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, -3.0]);
      const result = arr.every((value: number) => value > 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_3500
     * @tc.name testFloat32ArrayEveryTWO035
     * @tc.desc Verify a single zero element greater-than-zero assertion makes every return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0]);
      const result = arr.every((value: number) => value > 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_3600
     * @tc.name testFloat32ArrayEveryTWO036
     * @tc.desc Verify a single-element value mismatch makes every return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5.0]);
      const result = arr.every((value: number) => value === 6);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_3700
     * @tc.name testFloat32ArrayEveryTWO037
     * @tc.desc Verify all elements not satisfying the threshold makes every return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const result = arr.every((value: number) => value > 5);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_3800
     * @tc.name testFloat32ArrayEveryTWO038
     * @tc.desc Verify NaN comparison failure makes every return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([NaN]);
      const result = arr.every((value: number) => value > 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_3900
     * @tc.name testFloat32ArrayEveryTWO039
     * @tc.desc Verify -Infinity greater-than-zero assertion failure makes every return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-Infinity]);
      const result = arr.every((value: number) => value > 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_4000
     * @tc.name testFloat32ArrayEveryTWO040
     * @tc.desc Verify Infinity less-than-threshold assertion failure makes every return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([Infinity]);
      const result = arr.every((value: number) => value < 100);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_4100
     * @tc.name testFloat32ArrayEveryTWO041
     * @tc.desc Verify 1.0e40 overflowing to Infinity finiteness assertion failure makes every return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0e40]);
      const result = arr.every((value: number) => value > -Infinity && value < Infinity);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_4200
     * @tc.name testFloat32ArrayEveryTWO042
     * @tc.desc Verify 0.1 not equaling 0.3 makes every return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.1]);
      const result = arr.every((value: number) => value === 0.3);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_4300
     * @tc.name testFloat32ArrayEveryTWO043
     * @tc.desc Verify first element not equaling the target value makes every return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      const result = arr.every((value: number) => value === 3);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_4400
     * @tc.name testFloat32ArrayEveryTWO044
     * @tc.desc Verify -0 greater-than-zero assertion failure makes every return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-0]);
      const result = arr.every((value: number) => value > 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_4500
     * @tc.name testFloat32ArrayEveryTWO045
     * @tc.desc Verify the minimum positive value not less than zero makes every return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.401298464324817e-45]);
      const result = arr.every((value: number) => value < 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_4600
     * @tc.name testFloat32ArrayEveryTWO046
     * @tc.desc Verify the maximum finite value not equaling Infinity makes every return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.4028234663852886e+38]);
      const result = arr.every((value: number) => value === Infinity);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_4700
     * @tc.name testFloat32ArrayEveryTWO047
     * @tc.desc Verify 2^24+1 after truncation not equaling the original value makes every return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([16777217]);
      const result = arr.every((value: number) => value === 16777217);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_4800
     * @tc.name testFloat32ArrayEveryTWO048
     * @tc.desc Verify last element not satisfying less-than-threshold makes every return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0]);
      const result = arr.every((value: number) => value < 10);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_4900
     * @tc.name testFloat32ArrayEveryTWO049
     * @tc.desc Verify 1.0e-46 underflowing to +0 greater-than-zero assertion failure makes every return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0e-46]);
      const result = arr.every((value: number) => value > 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_5000
     * @tc.name testFloat32ArrayEveryTWO050
     * @tc.desc Verify floating-point array less-than-zero assertion failure makes every return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.5, 2.5]);
      const result = arr.every((value: number) => value < 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_5100
     * @tc.name testFloat32ArrayEveryTWO051
     * @tc.desc Verify after every returns true the original array length is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, 1000000.0);
      const result = arr.every((value: number) => value > 0);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_5200
     * @tc.name testFloat32ArrayEveryTWO052
     * @tc.desc Verify after every returns false the original array length is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, -2.0, 3.0]);
      const result = arr.every((value: number) => value > 0);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_5300
     * @tc.name testFloat32ArrayEveryTWO053
     * @tc.desc Verify empty array after every length is still 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      const result = arr.every((value: number) => value > 0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_5400
     * @tc.name testFloat32ArrayEveryTWO054
     * @tc.desc Verify single-length array after every length is still 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(1);
      const result = arr.every((value: number) => value > 0);
      expect(arr.length).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_5500
     * @tc.name testFloat32ArrayEveryTWO055
     * @tc.desc Verify of constructed array after every length is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, 1000000.0, 32.0, 64.0);
      const result = arr.every((value: number) => value > 0);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_5600
     * @tc.name testFloat32ArrayEveryTWO056
     * @tc.desc Verify from constructed array after every length is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.from([1.0, 2.0, 3.0, 4.0, 5.0, 6.0]);
      const result = arr.every((value: number) => value > 0);
      expect(arr.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_5700
     * @tc.name testFloat32ArrayEveryTWO057
     * @tc.desc Verify three-element array after every byteLength is still 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, 1000000.0);
      const result = arr.every((value: number) => value > 0);
      expect(arr.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_5800
     * @tc.name testFloat32ArrayEveryTWO058
     * @tc.desc Verify predetermined-length four-element array after every byteLength is still 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(4);
      const result = arr.every((value: number) => value >= 0);
      expect(arr.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_5900
     * @tc.name testFloat32ArrayEveryTWO059
     * @tc.desc Verify empty array after every byteLength is still 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      const result = arr.every((value: number) => value > 0);
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_6000
     * @tc.name testFloat32ArrayEveryTWO060
     * @tc.desc Verify of two-element array after every byteLength is still 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0);
      const result = arr.every((value: number) => value > 0);
      expect(arr.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_6100
     * @tc.name testFloat32ArrayEveryTWO061
     * @tc.desc Verify offset 4 view after every byteOffset is still 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(24);
      const view = new Float32Array(buf, 4, 2);
      const result = view.every((value: number) => value >= 0);
      expect(view.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_6200
     * @tc.name testFloat32ArrayEveryTWO062
     * @tc.desc Verify offset 0 view after every byteOffset is still 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new Float32Array(buf, 0, 4);
      const result = view.every((value: number) => value >= 0);
      expect(view.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_6300
     * @tc.name testFloat32ArrayEveryTWO063
     * @tc.desc Verify offset 8 view after every byteOffset is still 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(24);
      const view = new Float32Array(buf, 8, 2);
      const result = view.every((value: number) => value >= 0);
      expect(view.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_6400
     * @tc.name testFloat32ArrayEveryTWO064
     * @tc.desc Verify after every the original array buffer reference is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const buf = arr.buffer;
      const result = arr.every((value: number) => value > 0);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_6500
     * @tc.name testFloat32ArrayEveryTWO065
     * @tc.desc Verify subarray view after every buffer still has the same reference as the parent array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = Float32Array.of(0x10, 0b1010, 1000000.0, 32.0, 64.0);
      const view = parent.subarray(1, 3);
      const result = view.every((value: number) => value > 0);
      expect(view.buffer).assertEqual(parent.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_6600
     * @tc.name testFloat32ArrayEveryTWO066
     * @tc.desc Verify after every returns true each element value is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, 1000000.0);
      const result = arr.every((value: number) => value > 0);
      expect(arr.$_get(0)).assertEqual(16);
      expect(arr.$_get(1)).assertEqual(10);
      expect(arr.$_get(2)).assertEqual(1000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_6700
     * @tc.name testFloat32ArrayEveryTWO067
     * @tc.desc Verify after every returns false each element value is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, -2.0, 3.0]);
      const result = arr.every((value: number) => value > 0);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(-2);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_6800
     * @tc.name testFloat32ArrayEveryTWO068
     * @tc.desc Verify array containing special floating-point values after every element values are unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([NaN, Infinity, -Infinity]);
      const result = arr.every((value: number) => Number.isNaN(value));
      expect(arr.$_get(1)).assertEqual(Infinity);
      expect(arr.$_get(2)).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_6900
     * @tc.name testFloat32ArrayEveryTWO069
     * @tc.desc Verify array containing boundary values after every element values are unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.4028234663852886e+38, 1.401298464324817e-45]);
      const result = arr.every((value: number) => value > 0);
      expect(arr.$_get(0)).assertEqual(3.4028234663852886e+38);
      expect(arr.$_get(1)).assertEqual(1.401298464324817e-45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_7000
     * @tc.name testFloat32ArrayEveryTWO070
     * @tc.desc Verify subarray view after every parent array elements are unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = Float32Array.of(0x10, 0b1010, 1000000.0, 32.0, 64.0);
      const view = parent.subarray(1, 3);
      const result = view.every((value: number) => value > 0);
      expect(parent.$_get(0)).assertEqual(16);
      expect(parent.$_get(4)).assertEqual(64);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_7100
     * @tc.name testFloat32ArrayEveryTWO071
     * @tc.desc Verify subarray view every returns true and parent array length is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const view = parent.subarray(0, 2);
      const result = view.every((value: number) => value > 0);
      expect(result).assertTrue();
      expect(parent.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_7200
     * @tc.name testFloat32ArrayEveryTWO072
     * @tc.desc Verify sibling view one's every does not affect sibling view two's elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const v1 = parent.subarray(0, 2);
      const v2 = parent.subarray(2, 4);
      const result = v1.every((value: number) => value > 0);
      expect(result).assertTrue();
      expect(v2.$_get(0)).assertEqual(3);
      expect(v2.$_get(1)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_7300
     * @tc.name testFloat32ArrayEveryTWO073
     * @tc.desc Verify ArrayBuffer view after every the view byteOffset and length are both unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const view = new Float32Array(buf, 12, 4);
      const result = view.every((value: number) => value >= 0);
      expect(view.byteOffset).assertEqual(12);
      expect(view.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_7400
     * @tc.name testFloat32ArrayEveryTWO074
     * @tc.desc Verify every returns true in an all-true scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([100.0, 200.0, 300.0]);
      const result = arr.every((value: number) => value > 0);
      expect(result).assertTrue();
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_7500
     * @tc.name testFloat32ArrayEveryTWO075
     * @tc.desc Verify every returns false in an all-false scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-5.0, -5.0, -5.0]);
      const result = arr.every((value: number) => value > 0);
      expect(result).assertFalse();
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_7600
     * @tc.name testFloat32ArrayEveryTWO076
     * @tc.desc Verify every returns true for an empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      const result = arr.every((value: number) => value > 0);
      expect(result).assertTrue();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_7700
     * @tc.name testFloat32ArrayEveryTWO077
     * @tc.desc Verify repeatedly calling every on the same all-true array returns consistent values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const r1 = arr.every((value: number) => value > 0);
      const r2 = arr.every((value: number) => value > 0);
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_7800
     * @tc.name testFloat32ArrayEveryTWO078
     * @tc.desc Verify repeatedly calling every on the same array containing false returns consistent values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, -2.0]);
      const r1 = arr.every((value: number) => value > 0);
      const r2 = arr.every((value: number) => value > 0);
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_7900
     * @tc.name testFloat32ArrayEveryTWO079
     * @tc.desc Verify repeatedly calling every on an empty array returns true each time
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      const r1 = arr.every((value: number) => value > 0);
      const r2 = arr.every((value: number) => value > 0);
      expect(r1).assertTrue();
      expect(r2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_8000
     * @tc.name testFloat32ArrayEveryTWO080
     * @tc.desc Verify calling every on an all-true array with different equivalent predicates returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([2.0, 4.0, 6.0]);
      const r1 = arr.every((value: number) => value > 0);
      const r2 = arr.every((value: number) => value >= 2);
      expect(r1).assertTrue();
      expect(r2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_8100
     * @tc.name testFloat32ArrayEveryTWO081
     * @tc.desc Verify twenty-element all-positive array every returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src =
        [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0, 12.0, 13.0, 14.0, 15.0, 16.0, 17.0, 18.0, 19.0, 20.0];
      const arr = Float32Array.from(src);
      const result = arr.every((value: number) => value > 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_8200
     * @tc.name testFloat32ArrayEveryTWO082
     * @tc.desc Verify twenty-element array containing one negative value every returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src =
        [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0, 12.0, 13.0, 14.0, 15.0, 16.0, 17.0, 18.0, -19.0,
          20.0];
      const arr = Float32Array.from(src);
      const result = arr.every((value: number) => value > 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_8300
     * @tc.name testFloat32ArrayEveryTWO083
     * @tc.desc Verify large array every returns true after checking all values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0, 12.0, 13.0, 14.0, 15.0];
      const arr = Float32Array.from(src);
      let count: int = 0;
      const result = arr.every((value: number) => {
        count = count + 1;
        return value > 0;
      });
      expect(result).assertTrue();
      expect(count).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_8400
     * @tc.name testFloat32ArrayEveryTWO084
     * @tc.desc Verify large array after every length and byteLength are both unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0, 12.0];
      const arr = Float32Array.from(src);
      const result = arr.every((value: number) => value > 0);
      expect(arr.length).assertEqual(12);
      expect(arr.byteLength).assertEqual(48);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_8500
     * @tc.name testFloat32ArrayEveryTWO085
     * @tc.desc Verify the callback returning number 1 is coerced to true making every return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const result = arr.every((value: number) => true);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_8600
     * @tc.name testFloat32ArrayEveryTWO086
     * @tc.desc Verify the callback returning number 0 is coerced to false making every return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const result = arr.every((value: number) => false);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_8700
     * @tc.name testFloat32ArrayEveryTWO087
     * @tc.desc Verify the callback returning the element value itself as a truthy value makes every return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5.0, 6.0, 7.0]);
      const result = arr.every((value: number) => value !== 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_8800
     * @tc.name testFloat32ArrayEveryTWO088
     * @tc.desc Verify the callback returning the element value itself containing zero makes every return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5.0, 0, 7.0]);
      const result = arr.every((value: number) => value !== 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_EVERYTWO_8900
     * @tc.name testFloat32ArrayEveryTWO089
     * @tc.desc Verify every short-circuits after the first false predicate result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayEveryTWO089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.0, 1.0, 2.0);
      let calls: int = 0;
      const result = arr.every((value: number): boolean => {
        calls++;
        return value > 0.0;
      });
      expect(result).assertFalse();
      expect(calls).assertEqual(1);
    });

  });
}
