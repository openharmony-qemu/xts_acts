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

export default function Float32ArrayFindLast2Test(): void {
  describe('Float32ArrayFindLast2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_0100
     * @tc.name testFloat32ArrayFindLastTWO001
     * @tc.desc Verify selects the exact positive integer element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const result = arr.findLast((value: number) => value === -1.0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_0200
     * @tc.name testFloat32ArrayFindLastTWO002
     * @tc.desc Verify selects the rightmost negative element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-1.0, -5.0, 3.0]);
      const result = arr.findLast((value: number) => value < 0);
      expect(result).assertEqual(-5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_0300
     * @tc.name testFloat32ArrayFindLastTWO003
     * @tc.desc Verify selects a NaN element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, NaN]);
      const result = arr.findLast((value: number) => Number.isNaN(value));
      expect(result).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_0400
     * @tc.name testFloat32ArrayFindLastTWO004
     * @tc.desc Verify selects positive Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, Infinity]);
      const result = arr.findLast((value: number) => value === Infinity);
      expect(result).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_0500
     * @tc.name testFloat32ArrayFindLastTWO005
     * @tc.desc Verify selects negative Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-Infinity, 1.0]);
      const result = arr.findLast((value: number) => value === -Infinity);
      expect(result).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_0600
     * @tc.name testFloat32ArrayFindLastTWO006
     * @tc.desc Verify selects positive zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 0.0]);
      const result = arr.findLast((value: number) => value === 0);
      expect(result).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_0700
     * @tc.name testFloat32ArrayFindLastTWO007
     * @tc.desc Verify selects negative zero and preserves its sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, -0.0]);
      const result = arr.findLast((value: number) => value === 0);
      expect(1.0 / result).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_0800
     * @tc.name testFloat32ArrayFindLastTWO008
     * @tc.desc Verify selects the largest finite float32 value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 3.4028234663852886e+38]);
      const result = arr.findLast((value: number) => value > 1e38);
      expect(result).assertEqual(3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_0900
     * @tc.name testFloat32ArrayFindLastTWO009
     * @tc.desc Verify selects the smallest positive subnormal float32 value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.401298464324817e-45, 1.0]);
      const result = arr.findLast((value: number) => value > 0 && value < 1e-40);
      expect(result).assertEqual(1.401298464324817e-45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_1000
     * @tc.name testFloat32ArrayFindLastTWO010
     * @tc.desc Verify selects the exactly representable integer 2^24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([16777216, 1.0]);
      const result = arr.findLast((value: number) => value > 1000000);
      expect(result).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_1100
     * @tc.name testFloat32ArrayFindLastTWO011
     * @tc.desc Verify selects the float32 representation of 0.1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.1, 1.0]);
      const result = arr.findLast((value: number) => value < 0.5);
      expect(result).assertEqual(0.10000000149011612);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_1200
     * @tc.name testFloat32ArrayFindLastTWO012
     * @tc.desc Verify a single-element array returns its matching value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([42.0]);
      const result = arr.findLast((value: number) => value > 0);
      expect(result).assertEqual(42.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_1300
     * @tc.name testFloat32ArrayFindLastTWO013
     * @tc.desc Verify all matches return the rightmost value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([2.0, 4.0, 6.0]);
      const result = arr.findLast((value: number) => value >= 1);
      expect(result).assertEqual(6.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_1400
     * @tc.name testFloat32ArrayFindLastTWO014
     * @tc.desc Verify selects the large positive value 1e10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 1.0e10]);
      const result = arr.findLast((value: number) => value > 1e9);
      expect(result).assertEqual(1.0e10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_1500
     * @tc.name testFloat32ArrayFindLastTWO015
     * @tc.desc Verify empty array findLast throws Error when not found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([]);
      try {
        arr.findLast((value: number) => value > 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_1600
     * @tc.name testFloat32ArrayFindLastTWO016
     * @tc.desc Verify non-empty array no match throws Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      try {
        arr.findLast((value: number) => value > 100);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_1700
     * @tc.name testFloat32ArrayFindLastTWO017
     * @tc.desc Verify all-negative array querying positive value no match throws Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-1.0, -2.0, -3.0]);
      try {
        arr.findLast((value: number) => value > 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_1800
     * @tc.name testFloat32ArrayFindLastTWO018
     * @tc.desc Verify single element does not satisfy predicate, throws Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5.0]);
      try {
        arr.findLast((value: number) => value > 10);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_1900
     * @tc.name testFloat32ArrayFindLastTWO019
     * @tc.desc Verify selected return value is not Float32Array instance (returns scalar)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const result = arr.findLast((value: number) => value > 1);
      expect(result instanceof Float32Array).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_2000
     * @tc.name testFloat32ArrayFindLastTWO020
     * @tc.desc Verify multiple matches return the rightmost exact value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([7.0, 8.0]);
      const result = arr.findLast((value: number) => value > 5);
      expect(result).assertEqual(8.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_2100
     * @tc.name testFloat32ArrayFindLastTWO021
     * @tc.desc Verify multiple matches take the rightmost value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 5.0, 2.0, 8.0, 3.0]);
      const result = arr.findLast((value: number) => value > 4);
      expect(result).assertEqual(8.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_2200
     * @tc.name testFloat32ArrayFindLastTWO022
     * @tc.desc Verify ascending array takes the rightmost value satisfying the condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 20.0, 30.0, 40.0, 50.0]);
      const result = arr.findLast((value: number) => value > 25);
      expect(result).assertEqual(50.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_2300
     * @tc.name testFloat32ArrayFindLastTWO023
     * @tc.desc Verify when only first element matches returns first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([99.0, 1.0, 2.0, 3.0]);
      const result = arr.findLast((value: number) => value > 50);
      expect(result).assertEqual(99.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_2400
     * @tc.name testFloat32ArrayFindLastTWO024
     * @tc.desc Verify when only last element matches returns last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 99.0]);
      const result = arr.findLast((value: number) => value > 50);
      expect(result).assertEqual(99.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_2500
     * @tc.name testFloat32ArrayFindLastTWO025
     * @tc.desc Verify when all match returns last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const result = arr.findLast((value: number) => value >= -1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_2600
     * @tc.name testFloat32ArrayFindLastTWO026
     * @tc.desc Verify when both first and last match returns the end value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5.0, 1.0, 1.0, 6.0]);
      const result = arr.findLast((value: number) => value > 4);
      expect(result).assertEqual(6.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_2700
     * @tc.name testFloat32ArrayFindLastTWO027
     * @tc.desc Verify alternating pattern takes the rightmost value satisfying the condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 10.0, 1.0, 10.0, 1.0]);
      const result = arr.findLast((value: number) => value > 5);
      expect(result).assertEqual(10.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_2800
     * @tc.name testFloat32ArrayFindLastTWO028
     * @tc.desc Verify middle single point match returns that point value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 99.0, 4.0, 5.0]);
      const result = arr.findLast((value: number) => value > 50);
      expect(result).assertEqual(99.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_2900
     * @tc.name testFloat32ArrayFindLastTWO029
     * @tc.desc Verify rightmost match is boundary value Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, Infinity]);
      const result = arr.findLast((value: number) => value > 100);
      expect(result).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_3000
     * @tc.name testFloat32ArrayFindLastTWO030
     * @tc.desc Verify two different values match, takes the value at the larger index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([7.0, 1.0, 8.0, 1.0, 9.0]);
      const result = arr.findLast((value: number) => value > 5);
      expect(result).assertEqual(9.0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_3100
     * @tc.name testFloat32ArrayFindLastTWO031
     * @tc.desc Verify both elements match, returns the right element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.0, 7.0]);
      const result = arr.findLast((value: number) => value > 1);
      expect(result).assertEqual(7.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_3200
     * @tc.name testFloat32ArrayFindLastTWO032
     * @tc.desc Verify returns float32 smallest finite negative value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-3.4028234663852886e+38, 1.0]);
      const result = arr.findLast((value: number) => value < -1e38);
      expect(result).assertEqual(-3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_3300
     * @tc.name testFloat32ArrayFindLastTWO033
     * @tc.desc Verify returns float32 smallest positive normalized number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.1754943508222875e-38, 1.0]);
      const result = arr.findLast((value: number) => value > 0 && value < 1e-30);
      expect(result).assertEqual(1.1754943508222875e-38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_3400
     * @tc.name testFloat32ArrayFindLastTWO034
     * @tc.desc Verify returns +0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 0.0]);
      const result = arr.findLast((value: number) => value === 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_3500
     * @tc.name testFloat32ArrayFindLastTWO035
     * @tc.desc Verify returns -0 (distinguish positive and negative zero by reciprocal sign)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, -0.0]);
      const result = arr.findLast((value: number) => value === 0);
      expect(1 / result).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_3600
     * @tc.name testFloat32ArrayFindLastTWO036
     * @tc.desc Verify returns 0.1 under float32 precision (tolerance assertion)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.1, 1.0]);
      const result = arr.findLast((value: number) => value < 0.5);
      expect(Math.abs(result - 0.1) < 1e-6).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_3700
     * @tc.name testFloat32ArrayFindLastTWO037
     * @tc.desc Verify returns 0.2 under float32 precision (tolerance assertion)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.2, 1.0]);
      const result = arr.findLast((value: number) => value < 0.5);
      expect(Math.abs(result - 0.2) < 1e-6).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_3800
     * @tc.name testFloat32ArrayFindLastTWO038
     * @tc.desc Verify returns truncated stored value 16777216 of 2^24+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([16777217, 1.0]);
      const result = arr.findLast((value: number) => value > 1000000);
      expect(result).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_3900
     * @tc.name testFloat32ArrayFindLastTWO039
     * @tc.desc Verify 1.0e40 overflows to +Infinity then returns Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0e40, 1.0]);
      const result = arr.findLast((value: number) => value === Infinity);
      expect(result).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_4000
     * @tc.name testFloat32ArrayFindLastTWO040
     * @tc.desc Verify -1.0e40 overflows to -Infinity then returns -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-1.0e40, 1.0]);
      const result = arr.findLast((value: number) => value === -Infinity);
      expect(result).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_4100
     * @tc.name testFloat32ArrayFindLastTWO041
     * @tc.desc Verify 1.0e-46 underflows to +0 then returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0e-46, 1.0]);
      const result = arr.findLast((value: number) => value === 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_4200
     * @tc.name testFloat32ArrayFindLastTWO042
     * @tc.desc Verify hex integer literal 0x10 selects, returns 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0x10, 1.0]);
      const result = arr.findLast((value: number) => value > 10);
      expect(result).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_4300
     * @tc.name testFloat32ArrayFindLastTWO043
     * @tc.desc Verify octal literal 0o17 selects, returns 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0o17, 1.0]);
      const result = arr.findLast((value: number) => value > 10);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_4400
     * @tc.name testFloat32ArrayFindLastTWO044
     * @tc.desc Verify binary literal 0b1010 selects, returns 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0b1010, 1.0]);
      const result = arr.findLast((value: number) => value > 5);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_4500
     * @tc.name testFloat32ArrayFindLastTWO045
     * @tc.desc Verify scientific notation 1.0e3 selects, returns 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0e3, 1.0]);
      const result = arr.findLast((value: number) => value > 500);
      expect(result).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_4600
     * @tc.name testFloat32ArrayFindLastTWO046
     * @tc.desc Verify scientific notation 1.0e-3 selects, returns 0.001 (tolerance)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0e-3, 1.0]);
      const result = arr.findLast((value: number) => value > 0 && value < 0.5);
      expect(Math.abs(result - 0.001) < 1e-7).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_4700
     * @tc.name testFloat32ArrayFindLastTWO047
     * @tc.desc Verify negative hex -0x10 selects, returns -16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-0x10, 1.0]);
      const result = arr.findLast((value: number) => value < 0);
      expect(result).assertEqual(-16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_4800
     * @tc.name testFloat32ArrayFindLastTWO048
     * @tc.desc Verify hex 0xff selects, returns 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0xff, 1.0]);
      const result = arr.findLast((value: number) => value > 200);
      expect(result).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_4900
     * @tc.name testFloat32ArrayFindLastTWO049
     * @tc.desc Verify after selecting, length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      arr.findLast((value: number) => value > 1);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_5000
     * @tc.name testFloat32ArrayFindLastTWO050
     * @tc.desc Verify after no match throws Error, length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      try {
        arr.findLast((value: number) => value > 100);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_5100
     * @tc.name testFloat32ArrayFindLastTWO051
     * @tc.desc Verify after selecting, byteLength unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      arr.findLast((value: number) => value > 1);
      expect(arr.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_5200
     * @tc.name testFloat32ArrayFindLastTWO052
     * @tc.desc Verify after no match throws Error, byteLength unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([4.0, 5.0]);
      try {
        arr.findLast((value: number) => value > 10);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(arr.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_5300
     * @tc.name testFloat32ArrayFindLastTWO053
     * @tc.desc Verify after empty array findLast throws Error, length is still 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([]);
      try {
        arr.findLast((value: number) => value > 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_5400
     * @tc.name testFloat32ArrayFindLastTWO054
     * @tc.desc Verify after single-element array findLast, length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([7.0]);
      arr.findLast((value: number) => value > 5);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_5500
     * @tc.name testFloat32ArrayFindLastTWO055
     * @tc.desc Verify after view findLast, byteOffset unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(20);
      const view = new Float32Array(buf, 4, 4);
      view.$_set(0, 1.0);
      view.$_set(1, 2.0);
      view.$_set(2, 3.0);
      view.$_set(3, 4.0);
      view.findLast((value: number) => value > 2);
      expect(view.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_5600
     * @tc.name testFloat32ArrayFindLastTWO056
     * @tc.desc Verify after view findLast, byteLength unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(24);
      const view = new Float32Array(buf, 8, 3);
      view.$_set(0, 1.0);
      view.$_set(1, 2.0);
      view.$_set(2, 3.0);
      view.findLast((value: number) => value > 1);
      expect(view.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_5700
     * @tc.name testFloat32ArrayFindLastTWO057
     * @tc.desc Verify after view findLast, length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new Float32Array(buf, 0, 4);
      view.$_set(0, 5.0);
      view.$_set(1, 6.0);
      view.$_set(2, 7.0);
      view.$_set(3, 8.0);
      view.findLast((value: number) => value > 6);
      expect(view.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_5800
     * @tc.name testFloat32ArrayFindLastTWO058
     * @tc.desc Verify underlying ArrayBuffer capacity unchanged after findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      arr.findLast((value: number) => value > 1);
      expect(arr.buffer.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_5900
     * @tc.name testFloat32ArrayFindLastTWO059
     * @tc.desc Verify after findLast, first element remains unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 20.0, 30.0]);
      const snap = arr.$_get(0);
      arr.findLast((value: number) => value > 15);
      expect(arr.$_get(0)).assertEqual(snap);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_6000
     * @tc.name testFloat32ArrayFindLastTWO060
     * @tc.desc Verify after findLast, last element remains unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 20.0, 30.0]);
      const snap = arr.$_get(2);
      arr.findLast((value: number) => value > 15);
      expect(arr.$_get(2)).assertEqual(snap);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_6100
     * @tc.name testFloat32ArrayFindLastTWO061
     * @tc.desc Verify after findLast, all elements remain unchanged (compared one by one)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const s0 = arr.$_get(0);
      const s1 = arr.$_get(1);
      const s2 = arr.$_get(2);
      const s3 = arr.$_get(3);
      arr.findLast((value: number) => value > 1);
      expect(arr.$_get(0)).assertEqual(s0);
      expect(arr.$_get(1)).assertEqual(s1);
      expect(arr.$_get(2)).assertEqual(s2);
      expect(arr.$_get(3)).assertEqual(s3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_6200
     * @tc.name testFloat32ArrayFindLastTWO062
     * @tc.desc Verify two consecutive findLast return same value (idempotent)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 5.0, 2.0, 5.0, 3.0]);
      const r1 = arr.findLast((value: number) => value > 4);
      const r2 = arr.findLast((value: number) => value > 4);
      expect(r2).assertEqual(r1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_6300
     * @tc.name testFloat32ArrayFindLastTWO063
     * @tc.desc Verify after findLast, original array can still write via $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      arr.findLast((value: number) => value > 1);
      arr.$_set(0, 99.0);
      expect(arr.$_get(0)).assertEqual(99.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_6400
     * @tc.name testFloat32ArrayFindLastTWO064
     * @tc.desc Verify after no match findLast throws Error, original array content unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const snap = arr.$_get(1);
      try {
        arr.findLast((value: number) => value > 100);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(arr.$_get(1)).assertEqual(snap);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_6500
     * @tc.name testFloat32ArrayFindLastTWO065
     * @tc.desc Verify after selecting boundary value, original array boundary element retained
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, Infinity]);
      const snap = arr.$_get(1);
      arr.findLast((value: number) => value === Infinity);
      expect(arr.$_get(1)).assertEqual(snap);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_6600
     * @tc.name testFloat32ArrayFindLastTWO066
     * @tc.desc Verify after selecting NaN, original array NaN element position retained
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, NaN]);
      arr.findLast((value: number) => Number.isNaN(value));
      expect(arr.$_get(1)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_6700
     * @tc.name testFloat32ArrayFindLastTWO067
     * @tc.desc Verify three consecutive findLast results are consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.0, 1.0, 4.0, 1.0, 5.0]);
      const r1 = arr.findLast((value: number) => value > 2);
      const r2 = arr.findLast((value: number) => value > 2);
      const r3 = arr.findLast((value: number) => value > 2);
      expect(r2).assertEqual(r1);
      expect(r3).assertEqual(r1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_6800
     * @tc.name testFloat32ArrayFindLastTWO068
     * @tc.desc Verify after predicate reads multiple elements, original array last element still unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0, 6.0]);
      const snap = arr.$_get(5);
      arr.findLast((value: number) => value > 2);
      expect(arr.$_get(5)).assertEqual(snap);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_6900
     * @tc.name testFloat32ArrayFindLastTWO069
     * @tc.desc Verify findLast does not modify existing elements in buffer (cross-check with second view)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Float32Array(buf);
      arr.$_set(0, 1.0);
      arr.$_set(1, 2.0);
      const mirror = new Float32Array(buf);
      const before = mirror.$_get(1);
      arr.findLast((value: number) => value > 1);
      expect(mirror.$_get(1)).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_7000
     * @tc.name testFloat32ArrayFindLastTWO070
     * @tc.desc Verify shared buffer: after writing another view, findLast reflects new value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const a = new Float32Array(buf, 0, 2);
      const b = new Float32Array(buf, 0, 2);
      a.$_set(0, 1.0);
      a.$_set(1, 2.0);
      b.$_set(1, 9.0);
      const result = a.findLast((value: number) => value > 5);
      expect(result).assertEqual(9.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_7100
     * @tc.name testFloat32ArrayFindLastTWO071
     * @tc.desc Verify after findLast, view buffer reference unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view = new Float32Array(buf, 0, 2);
      view.$_set(0, 1.0);
      view.$_set(1, 2.0);
      view.findLast((value: number) => value > 1);
      expect(view.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_7200
     * @tc.name testFloat32ArrayFindLastTWO072
     * @tc.desc Verify after findLast, isView is still true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      arr.findLast((value: number) => value > 1);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_7300
     * @tc.name testFloat32ArrayFindLastTWO073
     * @tc.desc Verify subarray view findLast returns correct value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      const sub = base.subarray(1, 4);
      const result = sub.findLast((value: number) => value === 0.0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_7400
     * @tc.name testFloat32ArrayFindLastTWO074
     * @tc.desc Verify after subarray view findLast, byteOffset retained
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      const sub = base.subarray(1, 4);
      sub.findLast((value: number) => value === 0.0);
      expect(sub.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_7500
     * @tc.name testFloat32ArrayFindLastTWO075
     * @tc.desc Verify two non-overlapping views share buffer, each findLast does not affect each other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const v1 = new Float32Array(buf, 0, 2);
      const v2 = new Float32Array(buf, 8, 2);
      v1.$_set(0, 1.0);
      v1.$_set(1, 2.0);
      v2.$_set(0, 10.0);
      v2.$_set(1, 20.0);
      const r1 = v1.findLast((value: number) => value > 1);
      const r2 = v2.findLast((value: number) => value > 1);
      expect(r1).assertEqual(2.0);
      expect(r2).assertEqual(20.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_7600
     * @tc.name testFloat32ArrayFindLastTWO076
     * @tc.desc Verify offset view findLast reads view-local index correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(24);
      const view = new Float32Array(buf, 8, 3);
      view.$_set(0, 11.0);
      view.$_set(1, 22.0);
      view.$_set(2, 33.0);
      const result = view.findLast((value: number) => value > 15);
      expect(result).assertEqual(33.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_7700
     * @tc.name testFloat32ArrayFindLastTWO077
     * @tc.desc Verify shared buffer write parent read child: findLast in child view reflects parent write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const child = parent.subarray(1, 3);
      parent.$_set(2, 99.0);
      const result = child.findLast((value: number) => value > 50);
      expect(result).assertEqual(99.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_7800
     * @tc.name testFloat32ArrayFindLastTWO078
     * @tc.desc Verify whole-buffer view (offset 0) findLast returns correct value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const view = new Float32Array(buf, 0, 3);
      view.$_set(0, 5.0);
      view.$_set(1, 6.0);
      view.$_set(2, 7.0);
      const result = view.findLast((value: number) => value > 6);
      expect(result).assertEqual(7.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_7900
     * @tc.name testFloat32ArrayFindLastTWO079
     * @tc.desc Verify after findLast, view underlying buffer capacity retained
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new Float32Array(buf, 4, 3);
      view.$_set(0, 1.0);
      view.$_set(1, 2.0);
      view.$_set(2, 3.0);
      view.findLast((value: number) => value > 1);
      expect(view.buffer.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_8000
     * @tc.name testFloat32ArrayFindLastTWO080
     * @tc.desc Verify findLast returns the last matching scalar value, distinguishing from filter returning Float32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const last = arr.findLast((value: number) => value !== 0x10);
      const filtered = arr.filter((value: number) => value !== 0x10);
      expect(last).assertEqual(-1);
      expect(filtered instanceof Float32Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_8100
     * @tc.name testFloat32ArrayFindLastTWO081
     * @tc.desc Verify findLast return value equals direct index read (value is element not index)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 99.0, 4.0]);
      const result = arr.findLast((value: number) => value > 50);
      expect(result).assertEqual(arr.$_get(2));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_8200
     * @tc.name testFloat32ArrayFindLastTWO082
     * @tc.desc Verify findLast return value equals at() read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 99.0]);
      const result = arr.findLast((value: number) => value > 50);
      expect(result).assertEqual(arr.at(3));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_8300
     * @tc.name testFloat32ArrayFindLastTWO083
     * @tc.desc Verify findLast return value used to construct new array (value can be propagated)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const result = arr.findLast((value: number) => value === -1.0);
      const next = new Float32Array([result, 4.0]);
      expect(next.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_8400
     * @tc.name testFloat32ArrayFindLastTWO084
     * @tc.desc Verify after findLast select, return value participates in arithmetic getting expected result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const result = arr.findLast((value: number) => value === -1.0);
      expect(result + 1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_8500
     * @tc.name testFloat32ArrayFindLastTWO085
     * @tc.desc Verify findLast return value can serve as comparison basis for another array findLast predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 5.0, 2.0]);
      const threshold = arr.findLast((value: number) => value > 4);
      const arr2 = new Float32Array([1.0, 6.0, 7.0]);
      const result = arr2.findLast((value: number) => value > threshold);
      expect(result).assertEqual(7.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LASTTWO_8600
     * @tc.name testFloat32ArrayFindLastTWO086
     * @tc.desc Verify findLast on an offset view only searches elements inside the view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastTWO086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = Float32Array.of(1.0, 8.0, 3.0, 9.0);
      const view = parent.subarray(0, 3);
      const result = view.findLast((value: number): boolean => value > 5.0);
      expect(result).assertEqual(8.0);
    });

  });
}
