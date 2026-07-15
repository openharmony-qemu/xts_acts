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

export default function Float32ArrayAt2Test(): void {
  describe('Float32ArrayAt2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_0100
     * @tc.name testFloat32ArrayAtTWO001
     * @tc.desc Verify at with an int zero index reads a hexadecimal literal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const index: int = 0;
      expect(arr.at(index)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_0200
     * @tc.name testFloat32ArrayAtTWO002
     * @tc.desc Verify at(-1) reads the business special value at the last position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, -1.0]);
      const index: int = -1;
      expect(arr.at(index)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_0300
     * @tc.name testFloat32ArrayAtTWO003
     * @tc.desc Verify at with a binary positive out-of-bounds index returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0]);
      const index: int = 0b101;
      expect(arr.at(index)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_0400
     * @tc.name testFloat32ArrayAtTWO004
     * @tc.desc Verify at with default zero index on an empty array returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(0);
      const index: int = 0;
      expect(arr.at(index)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_0500
     * @tc.name testFloat32ArrayAtTWO005
     * @tc.desc Verify at with an int index reads NaN from a Float32Array.from source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.from([NaN]);
      const index: int = 0;
      expect(arr.at(index)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_0600
     * @tc.name testFloat32ArrayAtTWO006
     * @tc.desc Verify at reads Infinity from an ArrayBuffer offset view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const arr: Float32Array = new Float32Array(buf, 4, 2);
      arr.$_set(0, Infinity);
      const index: int = 0;
      expect(arr.at(index)).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_0700
     * @tc.name testFloat32ArrayAtTWO007
     * @tc.desc Verify at reads -Infinity from a subarray view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base: Float32Array = new Float32Array([1.0, -Infinity, 3.0]);
      const arr: Float32Array = base.subarray(1, 2);
      expect(arr.at(0)).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_0800
     * @tc.name testFloat32ArrayAtTWO008
     * @tc.desc Verify at reads +0 from a Float32Array.of source using an int index variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0.0);
      const index: int = 0;
      expect(arr.at(index)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_0900
     * @tc.name testFloat32ArrayAtTWO009
     * @tc.desc Verify at with a negative int index preserves -0 sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, -0.0]);
      const index: int = -1;
      const result = arr.at(index)!;
      expect(1 / result).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_1000
     * @tc.name testFloat32ArrayAtTWO010
     * @tc.desc Verify at reads Float32.MAX through a typed int index variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([3.4028234663852886e+38]);
      const index: int = 0;
      expect(arr.at(index)).assertEqual(3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_1100
     * @tc.name testFloat32ArrayAtTWO011
     * @tc.desc Verify at reads Float32.MIN_VALUE through a typed int index variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.401298464324817e-45]);
      const index: int = 0;
      expect(arr.at(index)).assertEqual(1.401298464324817e-45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_1200
     * @tc.name testFloat32ArrayAtTWO012
     * @tc.desc Verify at(length) exactly out of bounds returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const index: int = arr.length;
      expect(arr.at(index)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_1300
     * @tc.name testFloat32ArrayAtTWO013
     * @tc.desc Verify at(-length-1) negative-direction exactly out of bounds returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const index: int = -arr.length - 1;
      expect(arr.at(index)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_1400
     * @tc.name testFloat32ArrayAtTWO014
     * @tc.desc Verify at with int maximum positive index returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0]);
      const index: int = 2147483647;
      expect(arr.at(index)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_1500
     * @tc.name testFloat32ArrayAtTWO015
     * @tc.desc Verify at with int minimum negative index returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0]);
      const index: int = -2147483648;
      expect(arr.at(index)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_1600
     * @tc.name testFloat32ArrayAtTWO016
     * @tc.desc Verify at(0) return value is not a Float32Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0]);
      const r = arr.at(0);
      expect(r instanceof Float32Array).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_1700
     * @tc.name testFloat32ArrayAtTWO017
     * @tc.desc Verify at(0) return value is not an ArrayBuffer instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([3.0, 4.0]);
      const r = arr.at(0);
      expect(r instanceof ArrayBuffer).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_1800
     * @tc.name testFloat32ArrayAtTWO018
     * @tc.desc Verify at(-1) return value is not a Float32Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([5.0, 6.0, 7.0]);
      const r = arr.at(-1);
      expect(r instanceof Float32Array).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_1900
     * @tc.name testFloat32ArrayAtTWO019
     * @tc.desc Verify at(1) return value is not a Float32Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([8.0, 9.0]);
      const r = arr.at(1);
      expect(r instanceof Float32Array).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_2000
     * @tc.name testFloat32ArrayAtTWO020
     * @tc.desc Verify at(0) returns the first numeric element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0]);
      const r = arr.at(0);
      expect(r).assertEqual(10.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_2100
     * @tc.name testFloat32ArrayAtTWO021
     * @tc.desc Verify at(-2) return value is not a Float32Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([11.0, 12.0, 13.0]);
      const r = arr.at(-2);
      expect(r instanceof Float32Array).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_2200
     * @tc.name testFloat32ArrayAtTWO022
     * @tc.desc Verify at(0) on a subarray view returns a scalar, not a view instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const view: Float32Array = src.subarray(1, 3);
      const r = view.at(0);
      expect(r instanceof Float32Array).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_2300
     * @tc.name testFloat32ArrayAtTWO023
     * @tc.desc Verify at(0) returns the first scalar element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([14.0, 15.0]);
      const r = arr.at(0);
      expect(r).assertEqual(14.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_2400
     * @tc.name testFloat32ArrayAtTWO024
     * @tc.desc Verify at(-1) returns the last element value matching at(length-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, 99.5]);
      expect(arr.at(-1)).assertEqual(99.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_2500
     * @tc.name testFloat32ArrayAtTWO025
     * @tc.desc Verify at(-2) returns the second-to-last element exact value 20.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, 99.5]);
      expect(arr.at(-2)).assertEqual(20.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_2600
     * @tc.name testFloat32ArrayAtTWO026
     * @tc.desc Verify at(-length) returns the first element value matching at(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, 99.5]);
      expect(arr.at(-3)).assertEqual(10.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_2700
     * @tc.name testFloat32ArrayAtTWO027
     * @tc.desc Verify at(0) reads the NaN element and returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([NaN, 1.0]);
      expect(arr.at(0)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_2800
     * @tc.name testFloat32ArrayAtTWO028
     * @tc.desc Verify at(0) reads the Infinity element and returns Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([Infinity, 1.0]);
      expect(arr.at(0)).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_2900
     * @tc.name testFloat32ArrayAtTWO029
     * @tc.desc Verify at(0) reads the -Infinity element and returns -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([-Infinity, 1.0]);
      expect(arr.at(0)).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_3000
     * @tc.name testFloat32ArrayAtTWO030
     * @tc.desc Verify at(0) reads the +0 element and returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.0, 1.0]);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_3100
     * @tc.name testFloat32ArrayAtTWO031
     * @tc.desc Verify at(0) reads the -0 element and returns negative zero (1/r is -Infinity)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([-0.0, 1.0]);
      const r = arr.at(0)!;
      expect(1 / r).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_3200
     * @tc.name testFloat32ArrayAtTWO032
     * @tc.desc Verify at(0) reads Float32.MAX and returns the exact largest finite value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([3.4028234663852886e+38]);
      expect(arr.at(0)).assertEqual(3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_3300
     * @tc.name testFloat32ArrayAtTWO033
     * @tc.desc Verify at(0) reads -Float32.MAX and returns the exact smallest finite negative value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([-3.4028234663852886e+38]);
      expect(arr.at(0)).assertEqual(-3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_3400
     * @tc.name testFloat32ArrayAtTWO034
     * @tc.desc Verify at(0) reads Float32.MIN_VALUE and returns the exact smallest positive subnormal number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.401298464324817e-45]);
      expect(arr.at(0)).assertEqual(1.401298464324817e-45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_3500
     * @tc.name testFloat32ArrayAtTWO035
     * @tc.desc Verify at(0) reads Float32.MIN_NORMAL and returns the exact smallest positive normalized number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.1754943508222875e-38]);
      expect(arr.at(0)).assertEqual(1.1754943508222875e-38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_3600
     * @tc.name testFloat32ArrayAtTWO036
     * @tc.desc Verify at(0) reads 0.1 and returns the float32 precision-truncated value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.1]);
      expect(arr.at(0)).assertEqual(0.10000000149011612);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_3700
     * @tc.name testFloat32ArrayAtTWO037
     * @tc.desc Verify at(0) reads -7.25 and returns the exact negative value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([-7.25, 1.0]);
      expect(arr.at(0)).assertEqual(-7.25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_3800
     * @tc.name testFloat32ArrayAtTWO038
     * @tc.desc Verify at(0) reads 16777216 (2^24) and returns the exact integer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([16777216]);
      expect(arr.at(0)).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_3900
     * @tc.name testFloat32ArrayAtTWO039
     * @tc.desc Verify at(0) reads scientific notation 1e3 and returns 1000.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1e3]);
      expect(arr.at(0)).assertEqual(1000.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_4000
     * @tc.name testFloat32ArrayAtTWO040
     * @tc.desc Verify at(0) reads hexadecimal float 9.0 and returns 9.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([9.0]);
      expect(arr.at(0)).assertEqual(9.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_4100
     * @tc.name testFloat32ArrayAtTWO041
     * @tc.desc Verify at(0) reads 1e40 after overflow and returns Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1e40]);
      expect(arr.at(0)).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_4200
     * @tc.name testFloat32ArrayAtTWO042
     * @tc.desc Verify at(0) reads 1e-46 after underflow and returns +0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1e-46]);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_4300
     * @tc.name testFloat32ArrayAtTWO043
     * @tc.desc Verify at(-length-10) negative-direction far out of bounds returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([5.0, 6.0, 7.0]);
      expect(arr.at(-13)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_4400
     * @tc.name testFloat32ArrayAtTWO044
     * @tc.desc Verify at(100) on an empty array returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(0);
      expect(arr.at(100)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_4500
     * @tc.name testFloat32ArrayAtTWO045
     * @tc.desc Verify after at(0) length is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const before = arr.length;
      arr.at(0);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_4600
     * @tc.name testFloat32ArrayAtTWO046
     * @tc.desc Verify after at(-1) length is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([4.0, 5.0, 6.0, 7.0]);
      const before = arr.length;
      arr.at(-1);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_4700
     * @tc.name testFloat32ArrayAtTWO047
     * @tc.desc Verify after at positive-direction out of bounds length is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([8.0, 9.0]);
      const before = arr.length;
      arr.at(10);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_4800
     * @tc.name testFloat32ArrayAtTWO048
     * @tc.desc Verify after at on an empty array length is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array(0);
      const before = arr.length;
      arr.at(0);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_4900
     * @tc.name testFloat32ArrayAtTWO049
     * @tc.desc Verify after at(0) byteLength is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.5, 2.5]);
      const before = arr.byteLength;
      arr.at(0);
      expect(arr.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_5000
     * @tc.name testFloat32ArrayAtTWO050
     * @tc.desc Verify after at out of bounds byteLength is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.5, 2.5, 3.5]);
      const before = arr.byteLength;
      arr.at(99);
      expect(arr.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_5100
     * @tc.name testFloat32ArrayAtTWO051
     * @tc.desc Verify after at(0) the underlying ArrayBuffer byteLength is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const arr: Float32Array = new Float32Array(buf);
      const before = buf.byteLength;
      arr.at(0);
      expect(buf.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_5200
     * @tc.name testFloat32ArrayAtTWO052
     * @tc.desc Verify after at(0) the offset view byteOffset is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr: Float32Array = new Float32Array(buf, 8, 2);
      const before = arr.byteOffset;
      arr.at(0);
      expect(arr.byteOffset).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_5300
     * @tc.name testFloat32ArrayAtTWO053
     * @tc.desc Verify after multiple at() calls length is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      const before = arr.length;
      arr.at(0);
      arr.at(2);
      arr.at(-1);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_5400
     * @tc.name testFloat32ArrayAtTWO054
     * @tc.desc Verify after at(-1) the offset view byteLength is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const arr: Float32Array = new Float32Array(buf, 4, 2);
      const before = arr.byteLength;
      arr.at(-1);
      expect(arr.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_5500
     * @tc.name testFloat32ArrayAtTWO055
     * @tc.desc Verify after at(0) arr.$_get(0) is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.5, 2.5, 3.5]);
      const before = arr.$_get(0);
      arr.at(0);
      expect(arr.$_get(0)).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_5600
     * @tc.name testFloat32ArrayAtTWO056
     * @tc.desc Verify after at(0) arr.$_get(1) is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.5, 2.5, 3.5]);
      const before = arr.$_get(1);
      arr.at(0);
      expect(arr.$_get(1)).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_5700
     * @tc.name testFloat32ArrayAtTWO057
     * @tc.desc Verify after at(-1) the last element is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([10.0, 20.0, 30.0]);
      const before = arr.$_get(2);
      arr.at(-1);
      expect(arr.$_get(2)).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_5800
     * @tc.name testFloat32ArrayAtTWO058
     * @tc.desc Verify after at positive-direction out of bounds arr.$_get(0) is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([5.0, 6.0]);
      const before = arr.$_get(0);
      arr.at(100);
      expect(arr.$_get(0)).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_5900
     * @tc.name testFloat32ArrayAtTWO059
     * @tc.desc Verify after at(0) all elements match the snapshot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const snap: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      arr.at(0);
      for (let i = 0; i < arr.length; i++) {
        expect(arr.$_get(i)).assertEqual(snap.$_get(i));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_6000
     * @tc.name testFloat32ArrayAtTWO060
     * @tc.desc Verify after at(-2) arr.$_get(1) is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([7.0, 8.0, 9.0]);
      const before = arr.$_get(1);
      arr.at(-2);
      expect(arr.$_get(1)).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_6100
     * @tc.name testFloat32ArrayAtTWO061
     * @tc.desc Verify after at(0) the underlying buffer byte content is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr: Float32Array = new Float32Array(buf);
      arr.$_set(0, 1.5);
      arr.$_set(1, 2.5);
      const dv = new DataView(buf);
      const before = dv.getFloat32(0);
      arr.at(0);
      expect(dv.getFloat32(0)).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_6200
     * @tc.name testFloat32ArrayAtTWO062
     * @tc.desc Verify after multiple at() calls the array content matches the snapshot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const snap: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      arr.at(0);
      arr.at(1);
      arr.at(-1);
      expect(arr.$_get(0)).assertEqual(16);
      expect(arr.$_get(1)).assertEqual(10);
      expect(arr.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_6300
     * @tc.name testFloat32ArrayAtTWO063
     * @tc.desc Verify after at(0) the middle element arr.$_get(2) is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      const before = arr.$_get(2);
      arr.at(0);
      expect(arr.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_6400
     * @tc.name testFloat32ArrayAtTWO064
     * @tc.desc Verify after at the last index the first element arr.$_get(0) is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([11.0, 22.0, 33.0]);
      const before = arr.$_get(0);
      arr.at(2);
      expect(arr.$_get(0)).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_6500
     * @tc.name testFloat32ArrayAtTWO065
     * @tc.desc Verify after at(0) the NaN element is still NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([NaN, 1.0]);
      arr.at(0);
      expect(arr.$_get(0)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_6600
     * @tc.name testFloat32ArrayAtTWO066
     * @tc.desc Verify after at(0) the Infinity element is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([Infinity, 1.0]);
      const before = arr.$_get(0);
      arr.at(0);
      expect(arr.$_get(0)).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_6700
     * @tc.name testFloat32ArrayAtTWO067
     * @tc.desc Verify after at(1) the view element is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view: Float32Array = new Float32Array(buf, 0, 2);
      view.$_set(0, 3.0);
      view.$_set(1, 4.0);
      const before = view.$_get(1);
      view.at(0);
      expect(view.$_get(1)).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_6800
     * @tc.name testFloat32ArrayAtTWO068
     * @tc.desc Verify after at(-length) arr.$_get(0) is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const before = arr.$_get(0);
      arr.at(-4);
      expect(arr.$_get(0)).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_6900
     * @tc.name testFloat32ArrayAtTWO069
     * @tc.desc Verify after at negative-direction far out of bounds arr.$_get(1) is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const before = arr.$_get(1);
      arr.at(-10);
      expect(arr.$_get(1)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_7000
     * @tc.name testFloat32ArrayAtTWO070
     * @tc.desc Verify at(0) on a subarray view returns the view-relative first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([10.0, 20.0, 30.0, 40.0]);
      const view: Float32Array = src.subarray(1, 3);
      expect(view.at(0)).assertEqual(20.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_7100
     * @tc.name testFloat32ArrayAtTWO071
     * @tc.desc Verify at(-1) on a subarray view returns the view's last element, not the source array's last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([10.0, 20.0, 30.0, 40.0]);
      const view: Float32Array = src.subarray(1, 3);
      expect(view.at(-1)).assertEqual(30.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_7200
     * @tc.name testFloat32ArrayAtTWO072
     * @tc.desc Verify after at(0) the offset view byteOffset is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view: Float32Array = new Float32Array(buf, 4, 3);
      const before = view.byteOffset;
      view.at(0);
      expect(view.byteOffset).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_7300
     * @tc.name testFloat32ArrayAtTWO073
     * @tc.desc Verify after at(0) the view length is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view: Float32Array = new Float32Array(buf, 4, 3);
      const before = view.length;
      view.at(0);
      expect(view.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_7400
     * @tc.name testFloat32ArrayAtTWO074
     * @tc.desc Verify at(0) on a view reads the value written to the source buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const src: Float32Array = new Float32Array(buf);
      const view: Float32Array = new Float32Array(buf, 4, 2);
      src.$_set(1, 42.0);
      expect(view.at(0)).assertEqual(42.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_7500
     * @tc.name testFloat32ArrayAtTWO075
     * @tc.desc Verify after at(0) the array still shares the same ArrayBuffer reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr: Float32Array = new Float32Array(buf);
      arr.$_set(0, 5.0);
      arr.at(0);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_7600
     * @tc.name testFloat32ArrayAtTWO076
     * @tc.desc Verify at(0) on two views sharing a buffer returns each view's relative value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const v1: Float32Array = new Float32Array(buf, 0, 2);
      const v2: Float32Array = new Float32Array(buf, 8, 2);
      v1.$_set(0, 1.0);
      v2.$_set(0, 9.0);
      expect(v1.at(0)).assertEqual(1.0);
      expect(v2.at(0)).assertEqual(9.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_7700
     * @tc.name testFloat32ArrayAtTWO077
     * @tc.desc Verify at(0) on a view reads without modifying the source buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const src: Float32Array = new Float32Array(buf);
      src.$_set(0, 1.0);
      src.$_set(1, 2.0);
      const view: Float32Array = new Float32Array(buf, 4, 1);
      view.at(0);
      expect(src.$_get(1)).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_7800
     * @tc.name testFloat32ArrayAtTWO078
     * @tc.desc Verify at(0) on a byteOffset=8 view returns the corresponding element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const src: Float32Array = new Float32Array(buf);
      src.$_set(0, 1.0);
      src.$_set(1, 2.0);
      src.$_set(2, 3.0);
      src.$_set(3, 4.0);
      const view: Float32Array = new Float32Array(buf, 8, 2);
      expect(view.at(0)).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_7900
     * @tc.name testFloat32ArrayAtTWO079
     * @tc.desc Verify after at(-1) the offset view byteOffset is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const view: Float32Array = new Float32Array(buf, 4, 2);
      const before = view.byteOffset;
      view.at(-1);
      expect(view.byteOffset).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_8000
     * @tc.name testFloat32ArrayAtTWO080
     * @tc.desc Verify at(0) on a subarray view reads without modifying the source array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([10.0, 20.0, 30.0, 40.0]);
      const view: Float32Array = src.subarray(1, 3);
      view.at(0);
      expect(src.$_get(1)).assertEqual(20.0);
      expect(src.$_get(2)).assertEqual(30.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_8100
     * @tc.name testFloat32ArrayAtTWO081
     * @tc.desc Verify after at(0) the view byteLength is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const view: Float32Array = new Float32Array(buf, 4, 2);
      const before = view.byteLength;
      view.at(0);
      expect(view.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_8200
     * @tc.name testFloat32ArrayAtTWO082
     * @tc.desc Verify at(-0) reads the first element and keeps length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const firstValue: number = 24.0;
      const secondValue: number = 48.0;
      const arr: Float32Array = Float32Array.of(firstValue, secondValue);
      const beforeLength: int = arr.length;
      const actualValue = arr.at(-0);
      const expectValue: number = firstValue;
      expect(actualValue).assertEqual(expectValue);
      expect(arr.length).assertEqual(beforeLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_8300
     * @tc.name testFloat32ArrayAtTWO083
     * @tc.desc Verify at(index less than negative length) returns undefined without changing byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const firstValue: number = 1.0;
      const secondValue: number = 2.0;
      const arr: Float32Array = Float32Array.of(firstValue, secondValue);
      const beforeByteLength: int = arr.byteLength;
      const indexValue: int = -3;
      const actualValue = arr.at(indexValue);
      expect(actualValue).assertUndefined();
      expect(arr.byteLength).assertEqual(beforeByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_8400
     * @tc.name testFloat32ArrayAtTWO084
     * @tc.desc Verify at(length) returns undefined and keeps the first element unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const firstValue: number = 7.0;
      const secondValue: number = 14.0;
      const arr: Float32Array = Float32Array.of(firstValue, secondValue);
      const indexValue: int = arr.length;
      const actualValue = arr.at(indexValue);
      const expectFirst: number = firstValue;
      expect(actualValue).assertUndefined();
      expect(arr.$_get(0)).assertEqual(expectFirst);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_8500
     * @tc.name testFloat32ArrayAtTWO085
     * @tc.desc Verify offset view at(0) observes a backing array update made before the call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const byteLengthValue: number = 16;
      const buf: ArrayBuffer = new ArrayBuffer(byteLengthValue);
      const base: Float32Array = new Float32Array(buf);
      const view: Float32Array = new Float32Array(buf, 4, 2);
      const expectValue: number = 33.0;
      base.$_set(1, expectValue);
      const actualValue = view.at(0);
      expect(actualValue).assertEqual(expectValue);
      expect(view.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_8600
     * @tc.name testFloat32ArrayAtTWO086
     * @tc.desc Verify huge positive index returns undefined and keeps the backing buffer length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const byteLengthValue: number = 12;
      const arr: Float32Array = new Float32Array(new ArrayBuffer(byteLengthValue));
      const hugeIndex: int = 2147483647;
      const expectByteLength: number = byteLengthValue;
      const actualValue = arr.at(hugeIndex);
      expect(actualValue).assertUndefined();
      expect(arr.buffer.byteLength).assertEqual(expectByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_ATTWO_8700
     * @tc.name testFloat32ArrayAtTWO087
     * @tc.desc Verify negative indexes on an offset view are resolved relative to the view length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayAtTWO087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const view = parent.subarray(1, 4);
      const firstIndex: int = -view.length;
      expect(view.at(-1)).assertEqual(4.0);
      expect(view.at(firstIndex)).assertEqual(2.0);
    });

  });
}
