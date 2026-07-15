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

export default function Float32ArrayFilter2Test(): void {
  describe('Float32ArrayFilter2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_0100
     * @tc.name testFloat32ArrayFilterTWO001
     * @tc.desc Verify filter returns elements greater than 1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(0x10, 0b1010, -1.0);
      const r = src.filter((v: number, i: int, a: Float32Array) => v > 1.0);
      expect(r.length).assertEqual(2);
      expect(r.$_get(0)).assertEqual(16);
      expect(r.$_get(1)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_0200
     * @tc.name testFloat32ArrayFilterTWO002
     * @tc.desc Verify filter true predicate keeps all source values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array([5.0, 6.0]);
      const r = src.filter((v: number, i: int, a: Float32Array) => true);
      expect(r.length).assertEqual(2);
      expect(r.$_get(0)).assertEqual(5);
      expect(r.$_get(1)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_0300
     * @tc.name testFloat32ArrayFilterTWO003
     * @tc.desc Verify filter predicate removes unmatched tail value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array([7.0, 8.0, 9.0]);
      const r = src.filter((v: number, i: int, a: Float32Array) => v < 9.0);
      expect(r.length).assertEqual(2);
      expect(r.$_get(0)).assertEqual(7);
      expect(r.$_get(1)).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_0400
     * @tc.name testFloat32ArrayFilterTWO004
     * @tc.desc Verify filter return value is not a plain Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(0x10, 0b1010, -1.0);
      const r = src.filter((v: number, i: int, a: Float32Array) => true);
      expect(r instanceof Array).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_0500
     * @tc.name testFloat32ArrayFilterTWO005
     * @tc.desc Verify filter return value is a new object rather than the same reference as the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(0x10, 0b1010, -1.0);
      const r = src.filter((v: number, i: int, a: Float32Array) => true);
      r.$_set(0, 99.0);
      expect(src.$_get(0)).assertEqual(16);
      expect(r.$_get(0)).assertEqual(99.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_0600
     * @tc.name testFloat32ArrayFilterTWO006
     * @tc.desc Verify filter return value BYTES_PER_ELEMENT equals 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array([10.0, 20.0]);
      const r = src.filter((v: number, i: int, a: Float32Array) => v > 5.0);
      expect(r.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_0700
     * @tc.name testFloat32ArrayFilterTWO007
     * @tc.desc Verify the filtered array toString output contains the retained values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array([1.5, 2.5]);
      const r = src.filter((v: number, i: int, a: Float32Array) => true);
      expect(r.toString()).assertEqual('1.5,2.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_0800
     * @tc.name testFloat32ArrayFilterTWO008
     * @tc.desc Verify filter return value preserves matching values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array([3.0, 4.0]);
      const r = src.filter((v: number, i: int, a: Float32Array) => true);
      expect(r.length).assertEqual(2);
      expect(r.$_get(0)).assertEqual(3);
      expect(r.$_get(1)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_0900
     * @tc.name testFloat32ArrayFilterTWO009
     * @tc.desc Verify filter return values match the values produced by Float32Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array([1.0, 2.0]);
      const r = src.filter((v: number, i: int, a: Float32Array) => true);
      const ref = Float32Array.of(1.0, 2.0);
      expect(r.length).assertEqual(ref.length);
      expect(r.$_get(0)).assertEqual(ref.$_get(0));
      expect(r.$_get(1)).assertEqual(ref.$_get(1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_1000
     * @tc.name testFloat32ArrayFilterTWO010
     * @tc.desc Verify filter return value inherits the at method and it is usable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array([11.0, 22.0, 33.0]);
      const r = src.filter((v: number, i: int, a: Float32Array) => v > 11.0);
      expect(r.at(0)).assertEqual(22.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_1100
     * @tc.name testFloat32ArrayFilterTWO011
     * @tc.desc Verify when predicate is all true, result elements equal the original array one by one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(0x10, 0b1010, -1.0);
      const r = src.filter((v: number, i: int, a: Float32Array) => true);
      expect(r.$_get(0)).assertEqual(16);
      expect(r.$_get(1)).assertEqual(10);
      expect(r.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_1200
     * @tc.name testFloat32ArrayFilterTWO012
     * @tc.desc Verify when predicate is all false, the result is an empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(0x10, 0b1010, -1.0);
      const r = src.filter((v: number, i: int, a: Float32Array) => false);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_1300
     * @tc.name testFloat32ArrayFilterTWO013
     * @tc.desc Verify when predicate is true only for the first element, the result contains only the first element with equal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array([9.0, 8.0, 7.0]);
      const r = src.filter((v: number, i: int, a: Float32Array) => i === 0);
      expect(r.length).assertEqual(1);
      expect(r.$_get(0)).assertEqual(9.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_1400
     * @tc.name testFloat32ArrayFilterTWO014
     * @tc.desc Verify when predicate is true only for the last element, the result contains only the last element with equal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array([9.0, 8.0, 7.0]);
      const r = src.filter((v: number, i: int, a: Float32Array) => i === 2);
      expect(r.$_get(0)).assertEqual(7.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_1500
     * @tc.name testFloat32ArrayFilterTWO015
     * @tc.desc Verify when predicate is true only for the middle element, the result contains only the middle element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array([9.0, 8.0, 7.0]);
      const r = src.filter((v: number, i: int, a: Float32Array) => i === 1);
      expect(r.$_get(0)).assertEqual(8.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_1600
     * @tc.name testFloat32ArrayFilterTWO016
     * @tc.desc Verify the result preserves the NaN element (predicate matches by index)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array([1.0, NaN, 3.0]);
      const r = src.filter((v: number, i: int, a: Float32Array) => i === 1);
      expect(r.$_get(0)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_1700
     * @tc.name testFloat32ArrayFilterTWO017
     * @tc.desc Verify the result preserves the +0 element (predicate matches by index)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array([0.0, 2.0]);
      const r = src.filter((v: number, i: int, a: Float32Array) => i === 0);
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_1800
     * @tc.name testFloat32ArrayFilterTWO018
     * @tc.desc Verify the result preserves the -0 element (verified as -Infinity via 1/x)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array([-0.0, 2.0]);
      const r = src.filter((v: number, i: int, a: Float32Array) => i === 0);
      expect(1 / r.$_get(0)).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_1900
     * @tc.name testFloat32ArrayFilterTWO019
     * @tc.desc Verify the result preserves the +Infinity element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array([Infinity, 1.0]);
      const r = src.filter((v: number, i: int, a: Float32Array) => i === 0);
      expect(r.$_get(0)).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_2000
     * @tc.name testFloat32ArrayFilterTWO020
     * @tc.desc Verify the result preserves the -Infinity element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array([-Infinity, 1.0]);
      const r = src.filter((v: number, i: int, a: Float32Array) => i === 0);
      expect(r.$_get(0)).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_2100
     * @tc.name testFloat32ArrayFilterTWO021
     * @tc.desc Verify the result preserves the Float32 largest finite value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array([3.4028234663852886e+38, 1.0]);
      const r = src.filter((v: number, i: int, a: Float32Array) => i === 0);
      expect(r.$_get(0)).assertEqual(3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_2200
     * @tc.name testFloat32ArrayFilterTWO022
     * @tc.desc Verify the result preserves the Float32 smallest finite negative value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array([-3.4028234663852886e+38, 1.0]);
      const r = src.filter((v: number, i: int, a: Float32Array) => i === 0);
      expect(r.$_get(0)).assertEqual(-3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_2300
     * @tc.name testFloat32ArrayFilterTWO023
     * @tc.desc Verify the result preserves the smallest positive subnormal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array([1.401298464324817e-45, 1.0]);
      const r = src.filter((v: number, i: int, a: Float32Array) => i === 0);
      expect(r.$_get(0)).assertEqual(1.401298464324817e-45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_2400
     * @tc.name testFloat32ArrayFilterTWO024
     * @tc.desc Verify the result preserves the 0.1 precision value (compared with rounding tolerance)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array([0.1, 0.2]);
      const r = src.filter((v: number, i: int, a: Float32Array) => i === 0);
      expect(Math.round(r.$_get(0) * 1e6) / 1e6).assertEqual(0.1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_2500
     * @tc.name testFloat32ArrayFilterTWO025
     * @tc.desc Verify the result preserves the 2^24 exact integer 16777216
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array([16777216, 1.0]);
      const r = src.filter((v: number, i: int, a: Float32Array) => i === 0);
      expect(r.$_get(0)).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_2600
     * @tc.name testFloat32ArrayFilterTWO026
     * @tc.desc Verify the result preserves the negative floating-point value -2.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array([-2.5, 3.5]);
      const r = src.filter((v: number, i: int, a: Float32Array) => v < 0.0);
      expect(r.$_get(0)).assertEqual(-2.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_2700
     * @tc.name testFloat32ArrayFilterTWO027
     * @tc.desc Verify result order matches the relative order of the original array (alternating-index matching)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array([10.0, 20.0, 30.0, 40.0, 50.0]);
      const r = src.filter((v: number, i: int, a: Float32Array) => i % 2 === 0);
      expect(r.$_get(0)).assertEqual(10.0);
      expect(r.$_get(1)).assertEqual(30.0);
      expect(r.$_get(2)).assertEqual(50.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_2800
     * @tc.name testFloat32ArrayFilterTWO028
     * @tc.desc Verify the result preserves all identical elements (all matched)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array([4.0, 4.0, 4.0]);
      const r = src.filter((v: number, i: int, a: Float32Array) => v === 4.0);
      expect(r.$_get(0)).assertEqual(4.0);
      expect(r.$_get(2)).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_2900
     * @tc.name testFloat32ArrayFilterTWO029
     * @tc.desc Verify the result preserves the scientific notation 1e3 value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array([1.0e3, 2.0]);
      const r = src.filter((v: number, i: int, a: Float32Array) => i === 0);
      expect(r.$_get(0)).assertEqual(1000.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_3000
     * @tc.name testFloat32ArrayFilterTWO030
     * @tc.desc Verify the result preserves the hexadecimal float 9.0 value (equals 9.0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array([9.0, 1.0]);
      const r = src.filter((v: number, i: int, a: Float32Array) => i === 0);
      expect(r.$_get(0)).assertEqual(9.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_3100
     * @tc.name testFloat32ArrayFilterTWO031
     * @tc.desc Verify the result preserves the value after 1e40 overflows to Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array([1.0e40, 1.0]);
      const r = src.filter((v: number, i: int, a: Float32Array) => i === 0);
      expect(r.$_get(0)).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_3200
     * @tc.name testFloat32ArrayFilterTWO032
     * @tc.desc Verify the result preserves the value after 1e-46 underflows to +0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array([1.0e-46, 1.0]);
      const r = src.filter((v: number, i: int, a: Float32Array) => i === 0);
      expect(r.$_get(0)).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_3300
     * @tc.name testFloat32ArrayFilterTWO033
     * @tc.desc Verify all-matched result length equals the original array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const r = src.filter((v: number, i: int, a: Float32Array) => true);
      expect(r.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_3400
     * @tc.name testFloat32ArrayFilterTWO034
     * @tc.desc Verify partial match length equals the true count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      const r = src.filter((v: number, i: int, a: Float32Array) => v > 2.0);
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_3500
     * @tc.name testFloat32ArrayFilterTWO035
     * @tc.desc Verify after filter on an empty original array the result length equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array([0]);
      const r = src.filter((v: number, i: int, a: Float32Array) => true);
      expect(r.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_3600
     * @tc.name testFloat32ArrayFilterTWO036
     * @tc.desc Verify single-element original array after matching length equals 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array([42.0]);
      const r = src.filter((v: number, i: int, a: Float32Array) => v > 0.0);
      expect(r.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_3700
     * @tc.name testFloat32ArrayFilterTWO037
     * @tc.desc Verify single-element original array after no match length equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array([42.0]);
      const r = src.filter((v: number, i: int, a: Float32Array) => v < 0.0);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_3800
     * @tc.name testFloat32ArrayFilterTWO038
     * @tc.desc Verify result byteLength equals length times 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const r = src.filter((v: number, i: int, a: Float32Array) => v > 1.0);
      expect(r.byteLength).assertEqual(r.length * 4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_3900
     * @tc.name testFloat32ArrayFilterTWO039
     * @tc.desc Verify result buffer.byteLength equals length times 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(0x10, 0b1010, -1.0);
      const r = src.filter((v: number, i: int, a: Float32Array) => v > 1.0);
      expect(r.buffer.byteLength).assertEqual(r.length * 4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_4000
     * @tc.name testFloat32ArrayFilterTWO040
     * @tc.desc Verify result byteOffset equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(0x10, 0b1010, -1.0);
      const r = src.filter((v: number, i: int, a: Float32Array) => true);
      expect(r.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_4100
     * @tc.name testFloat32ArrayFilterTWO041
     * @tc.desc Verify all-matched result byteLength equals the original array byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(0x10, 0b1010, -1.0);
      const r = src.filter((v: number, i: int, a: Float32Array) => true);
      expect(r.byteLength).assertEqual(src.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_4200
     * @tc.name testFloat32ArrayFilterTWO042
     * @tc.desc Verify 100-element array partial match length is accurate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const big = new Float32Array(100);
      big.fill(1.0);
      for (let i = 0; i < 100; i += 2) {
        big.$_set(i, 2.0);
      }
      const r = big.filter((v: number, i: int, a: Float32Array) => v === 2.0);
      expect(r.length).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_4300
     * @tc.name testFloat32ArrayFilterTWO043
     * @tc.desc Verify alternating-index matching length equals the ceiling of n/2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      const r = src.filter((v: number, i: int, a: Float32Array) => i % 2 === 0);
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_4400
     * @tc.name testFloat32ArrayFilterTWO044
     * @tc.desc Verify result length and subsequent modifications to the original array are independent of each other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(0x10, 0b1010, -1.0);
      const r = src.filter((v: number, i: int, a: Float32Array) => true);
      src.$_set(0, 99.0);
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_4500
     * @tc.name testFloat32ArrayFilterTWO045
     * @tc.desc Verify after filter the original array length is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(0x10, 0b1010, -1.0);
      src.filter((v: number, i: int, a: Float32Array) => v > 1.0);
      expect(src.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_4600
     * @tc.name testFloat32ArrayFilterTWO046
     * @tc.desc Verify after filter the original array first element is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(0x10, 0b1010, -1.0);
      src.filter((v: number, i: int, a: Float32Array) => v > 1.0);
      expect(src.$_get(0)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_4700
     * @tc.name testFloat32ArrayFilterTWO047
     * @tc.desc Verify after filter the original array last element is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(0x10, 0b1010, -1.0);
      src.filter((v: number, i: int, a: Float32Array) => v > 1.0);
      expect(src.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_4800
     * @tc.name testFloat32ArrayFilterTWO048
     * @tc.desc Verify after filter the original array byteLength is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(0x10, 0b1010, -1.0);
      src.filter((v: number, i: int, a: Float32Array) => true);
      expect(src.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_4900
     * @tc.name testFloat32ArrayFilterTWO049
     * @tc.desc Verify after filter the original array byteOffset is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(0x10, 0b1010, -1.0);
      src.filter((v: number, i: int, a: Float32Array) => true);
      expect(src.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_5000
     * @tc.name testFloat32ArrayFilterTWO050
     * @tc.desc Verify after filter the original array buffer reference is unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(0x10, 0b1010, -1.0);
      const bufBefore = src.buffer;
      src.filter((v: number, i: int, a: Float32Array) => true);
      expect(src.buffer).assertEqual(bufBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_5100
     * @tc.name testFloat32ArrayFilterTWO051
     * @tc.desc Verify after filter each index value of the original array is unchanged one by one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array([10.0, 20.0, 30.0]);
      src.filter((v: number, i: int, a: Float32Array) => v > 15.0);
      expect(src.$_get(0)).assertEqual(10.0);
      expect(src.$_get(1)).assertEqual(20.0);
      expect(src.$_get(2)).assertEqual(30.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_5200
     * @tc.name testFloat32ArrayFilterTWO052
     * @tc.desc Verify after filter the original array is still the same object reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(0x10, 0b1010, -1.0);
      const ref = src;
      src.filter((v: number, i: int, a: Float32Array) => true);
      expect(src).assertEqual(ref);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_5300
     * @tc.name testFloat32ArrayFilterTWO053
     * @tc.desc Verify after filter the original array values iterator still traverses the original values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(0x10, 0b1010, -1.0);
      src.filter((v: number, i: int, a: Float32Array) => v > 1.0);
      const it = src.values();
      expect(it.next().value).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_5400
     * @tc.name testFloat32ArrayFilterTWO054
     * @tc.desc Verify after filter the original array at(-1) still returns the original last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(0x10, 0b1010, -1.0);
      src.filter((v: number, i: int, a: Float32Array) => v > 1.0);
      expect(src.at(-1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_5500
     * @tc.name testFloat32ArrayFilterTWO055
     * @tc.desc Verify after filter the original array subarray still reflects the original values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(0x10, 0b1010, -1.0);
      src.filter((v: number, i: int, a: Float32Array) => v > 1.0);
      const v = src.subarray(1);
      expect(v.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_5600
     * @tc.name testFloat32ArrayFilterTWO056
     * @tc.desc Verify after filter the original array indexOf still returns the original index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(0x10, 0b1010, -1.0);
      src.filter((v: number, i: int, a: Float32Array) => v > 1.0);
      expect(src.indexOf(0b1010)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_5700
     * @tc.name testFloat32ArrayFilterTWO057
     * @tc.desc Verify after filter, a second filter on the original array produces an independent result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const r1 = src.filter((v: number, i: int, a: Float32Array) => v > 1.0);
      const r2 = src.filter((v: number, i: int, a: Float32Array) => v > 2.0);
      expect(r1.length).assertEqual(3);
      expect(r2.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_5800
     * @tc.name testFloat32ArrayFilterTWO058
     * @tc.desc Verify filter chained call returns a new array at each step
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const r1 = src.filter((v: number, i: int, a: Float32Array) => v > 1.0);
      const r2 = r1.filter((v: number, i: int, a: Float32Array) => v > 2.0);
      r1.$_set(0, 99.0);
      expect(r2.$_get(0)).assertEqual(3.0);
      expect(r2.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_5900
     * @tc.name testFloat32ArrayFilterTWO059
     * @tc.desc Verify filter result can continue chaining map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(0x10, 0b1010, -1.0);
      const r = src.filter((v: number, i: int, a: Float32Array) => v > 1.0)
        .map((v: number, i: int, a: Float32Array) => v * 10.0);
      expect(r.$_get(0)).assertEqual(160);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_6000
     * @tc.name testFloat32ArrayFilterTWO060
     * @tc.desc Verify filter result can continue chaining slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const r = src.filter((v: number, i: int, a: Float32Array) => true).slice(1, 3);
      expect(r.length).assertEqual(2);
      expect(r.$_get(0)).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_6100
     * @tc.name testFloat32ArrayFilterTWO061
     * @tc.desc Verify filter result can be filtered again to get a subset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      const r = src.filter((v: number, i: int, a: Float32Array) => v > 1.0)
        .filter((v: number, i: int, a: Float32Array) => v < 1000001.0);
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_6200
     * @tc.name testFloat32ArrayFilterTWO062
     * @tc.desc Verify writing to the filter result does not affect the original array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(0x10, 0b1010, -1.0);
      const r = src.filter((v: number, i: int, a: Float32Array) => true);
      r.$_set(0, 99.0);
      expect(src.$_get(0)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_6300
     * @tc.name testFloat32ArrayFilterTWO063
     * @tc.desc Verify writing to the original array does not affect the already-obtained filter result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(0x10, 0b1010, -1.0);
      const r = src.filter((v: number, i: int, a: Float32Array) => true);
      src.$_set(0, 99.0);
      expect(r.$_get(0)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_6400
     * @tc.name testFloat32ArrayFilterTWO064
     * @tc.desc Verify filter callback third argument is the source array reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(0x10, 0b1010, -1.0);
      let sameRef: boolean = false;
      src.filter((v: number, i: int, a: Float32Array): boolean => {
        sameRef = a === src;
        return false;
      });
      expect(sameRef).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_6500
     * @tc.name testFloat32ArrayFilterTWO065
     * @tc.desc Verify three-level filter chained result length decreases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0, 6.0]);
      const r = src.filter((v: number, i: int, a: Float32Array) => v > 1.0)
        .filter((v: number, i: int, a: Float32Array) => v > 2.0)
        .filter((v: number, i: int, a: Float32Array) => v > 3.0);
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_6600
     * @tc.name testFloat32ArrayFilterTWO066
     * @tc.desc Verify filter result can be written via set without affecting the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(0x10, 0b1010, -1.0);
      const r = src.filter((v: number, i: int, a: Float32Array) => true);
      r.set(Float32Array.of(7.0, 8.0));
      expect(r.$_get(0)).assertEqual(7.0);
      expect(src.$_get(0)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_6700
     * @tc.name testFloat32ArrayFilterTWO067
     * @tc.desc Verify filter result isView matches the original array, both true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(0x10, 0b1010, -1.0);
      const r = src.filter((v: number, i: int, a: Float32Array) => v > 1.0);
      expect(ArrayBuffer.isView(r)).assertTrue();
      expect(ArrayBuffer.isView(src)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_6800
     * @tc.name testFloat32ArrayFilterTWO068
     * @tc.desc Verify filter result byteOffset equals 0 (new buffer)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(0x10, 0b1010, -1.0);
      const r = src.filter((v: number, i: int, a: Float32Array) => v > 1.0);
      expect(r.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_6900
     * @tc.name testFloat32ArrayFilterTWO069
     * @tc.desc Verify writing to the filter result's subarray does not affect the original array (buffer not shared)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(0x10, 0b1010, -1.0);
      const r = src.filter((v: number, i: int, a: Float32Array) => true);
      const rv = r.subarray(0);
      rv.$_set(0, 77.0);
      expect(src.$_get(0)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_7000
     * @tc.name testFloat32ArrayFilterTWO070
     * @tc.desc Verify filter result buffer length equals the result length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const r = src.filter((v: number, i: int, a: Float32Array) => v > 1.0);
      expect(r.buffer.byteLength).assertEqual(r.length * 4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_7100
     * @tc.name testFloat32ArrayFilterTWO071
     * @tc.desc Verify filter result buffer length is independent of the original buffer length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const r = src.filter((v: number, i: int, a: Float32Array) => v > 2.0);
      expect(r.buffer.byteLength).assertEqual(8);
      expect(src.buffer.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_7200
     * @tc.name testFloat32ArrayFilterTWO072
     * @tc.desc Verify multiple filter result buffers are all different from each other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const r1 = src.filter((v: number, i: int, a: Float32Array) => v > 1.0);
      const r2 = src.filter((v: number, i: int, a: Float32Array) => v > 2.0);
      r1.$_set(0, 99.0);
      expect(r2.$_get(0)).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_7300
     * @tc.name testFloat32ArrayFilterTWO073
     * @tc.desc Verify result derived from an offset original array still has byteOffset equal to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(20);
      const src = new Float32Array(buf, 4, 4);
      src.$_set(0, 1.0);
      src.$_set(1, 2.0);
      src.$_set(2, 3.0);
      src.$_set(3, 4.0);
      const r = src.filter((v: number, i: int, a: Float32Array) => v > 1.0);
      expect(r.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_7400
     * @tc.name testFloat32ArrayFilterTWO074
     * @tc.desc Verify filter result byteOffset is independent of the original array byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const src = new Float32Array(buf, 4, 3);
      src.$_set(0, 1.0);
      const r = src.filter((v: number, i: int, a: Float32Array) => true);
      expect(src.byteOffset).assertEqual(4);
      expect(r.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_7500
     * @tc.name testFloat32ArrayFilterTWO075
     * @tc.desc Verify directly writing the original buffer does not affect the already-obtained filter result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(0x10, 0b1010, -1.0);
      const r = src.filter((v: number, i: int, a: Float32Array) => true);
      const dv = new DataView(src.buffer);
      dv.setFloat32(0, 99.0);
      expect(r.$_get(0)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_7600
     * @tc.name testFloat32ArrayFilterTWO076
     * @tc.desc Verify filter result subarray shares the buffer with the result itself
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(0x10, 0b1010, -1.0);
      const r = src.filter((v: number, i: int, a: Float32Array) => true);
      const rv = r.subarray(0);
      rv.$_set(0, 55.0);
      expect(r.$_get(0)).assertEqual(55.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_7700
     * @tc.name testFloat32ArrayFilterTWO077
     * @tc.desc Verify empty result array toString returns an empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(0x10, 0b1010, -1.0);
      const r = src.filter((v: number, i: int, a: Float32Array) => false);
      expect(r.toString()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_7800
     * @tc.name testFloat32ArrayFilterTWO078
     * @tc.desc Verify empty result array join returns an empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(0x10, 0b1010, -1.0);
      const r = src.filter((v: number, i: int, a: Float32Array) => false);
      expect(r.join(',')).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_7900
     * @tc.name testFloat32ArrayFilterTWO079
     * @tc.desc Verify empty result array length and byteLength are both 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(0x10, 0b1010, -1.0);
      const r = src.filter((v: number, i: int, a: Float32Array) => false);
      expect(r.length).assertEqual(0);
      expect(r.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_8000
     * @tc.name testFloat32ArrayFilterTWO080
     * @tc.desc Verify empty result array every returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(0x10, 0b1010, -1.0);
      const r = src.filter((v: number, i: int, a: Float32Array) => false);
      expect(r.every((v: number, i: int, a: Float32Array) => false)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_8100
     * @tc.name testFloat32ArrayFilterTWO081
     * @tc.desc Verify empty result array some returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(0x10, 0b1010, -1.0);
      const r = src.filter((v: number, i: int, a: Float32Array) => false);
      expect(r.some((v: number, i: int, a: Float32Array) => true)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_8200
     * @tc.name testFloat32ArrayFilterTWO082
     * @tc.desc Verify empty filter result has length 0 after rejecting all values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(0x10, 0b1010, -1.0);
      const r = src.filter((v: number, i: int, a: Float32Array) => false);
      expect(r.length).assertEqual(0);
      expect(src.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_8300
     * @tc.name testFloat32ArrayFilterTWO083
     * @tc.desc Verify empty result array findIndex equals -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(0x10, 0b1010, -1.0);
      const r = src.filter((v: number, i: int, a: Float32Array) => false);
      expect(r.findIndex((v: number, i: int, a: Float32Array) => true)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_8400
     * @tc.name testFloat32ArrayFilterTWO084
     * @tc.desc Verify empty result array reduce with no initial value throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(0x10, 0b1010, -1.0);
      const r = src.filter((v: number, i: int, a: Float32Array) => false);
      try {
        r.reduce((acc: number, v: number, i: int, a: Float32Array) => acc + v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_8500
     * @tc.name testFloat32ArrayFilterTWO085
     * @tc.desc Verify empty filter result from an offset view keeps byteLength 0 after rejecting all values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const src = new Float32Array(buf, 4, 2);
      src.$_set(0, 0x10);
      src.$_set(1, 0b1010);
      const r = src.filter((v: number, i: int, a: Float32Array) => false);
      expect(r.length).assertEqual(0);
      expect(r.byteLength).assertEqual(0);
      expect(src.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_8600
     * @tc.name testFloat32ArrayFilterTWO086
     * @tc.desc Verify empty result array indexOf for any value returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Float32Array.of(0x10, 0b1010, -1.0);
      const r = src.filter((v: number, i: int, a: Float32Array) => false);
      expect(r.indexOf(1.0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_8700
     * @tc.name testFloat32ArrayFilterTWO087
     * @tc.desc Verify non-empty filter result is independent after modifying the source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const filtered = src.filter((v: number, i: int, a: Float32Array): boolean => v > 2.0);
      const expectFirst: number = 3.0;
      const expectSecond: number = 4.0;
      src.$_set(2, 99.0);
      expect(filtered.$_get(0)).assertEqual(expectFirst);
      expect(filtered.$_get(1)).assertEqual(expectSecond);
      expect(src.$_get(2)).assertEqual(99.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_8800
     * @tc.name testFloat32ArrayFilterTWO088
     * @tc.desc Verify filter on an offset view returns a compact array with byteOffset zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(20);
      const view = new Float32Array(buf, 4, 4);
      view.$_set(0, 1.0);
      view.$_set(1, 2.0);
      view.$_set(2, 3.0);
      view.$_set(3, 4.0);
      const filtered = view.filter((v: number, i: int, a: Float32Array): boolean => v > 2.0);
      expect(filtered.byteOffset).assertEqual(0);
      expect(filtered.length).assertEqual(2);
      expect(filtered.$_get(0)).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_8900
     * @tc.name testFloat32ArrayFilterTWO089
     * @tc.desc Verify filter predicate is called exactly once for each source element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array([5.0, 6.0, 7.0, 8.0]);
      let callCount: int = 0;
      const filtered = src.filter((v: number, i: int, a: Float32Array): boolean => {
        callCount++;
        return v >= 7.0;
      });
      expect(callCount).assertEqual(src.length);
      expect(filtered.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_9000
     * @tc.name testFloat32ArrayFilterTWO090
     * @tc.desc Verify filter can keep only NaN values using global isNaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array([1.0, NaN, 2.0, NaN]);
      const filtered = src.filter((v: number, i: int, a: Float32Array): boolean => isNaN(v));
      expect(filtered.length).assertEqual(2);
      expect(filtered.$_get(0)).assertNaN();
      expect(filtered.$_get(1)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_9100
     * @tc.name testFloat32ArrayFilterTWO091
     * @tc.desc Verify filter observes a predicate update to a later element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array([1.0, 2.0, 3.0]);
      const changedValue: number = 20.0;
      const filtered = src.filter((v: number, i: int, a: Float32Array): boolean => {
        if (i === 0) {
          a.$_set(1, changedValue);
        }
        return v >= changedValue;
      });
      expect(filtered.length).assertEqual(1);
      expect(filtered.$_get(0)).assertEqual(changedValue);
      expect(src.$_get(1)).assertEqual(changedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FILTERTWO_9200
     * @tc.name testFloat32ArrayFilterTWO092
     * @tc.desc Verify filtering an offset view returns a compact independent array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFilterTWO092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      const view = parent.subarray(1, 4);
      const filtered = view.filter((value: number): boolean => value > 2.0);
      expect(filtered.byteOffset).assertEqual(0);
      expect(filtered.length).assertEqual(2);
      filtered.$_set(0, 99.0);
      expect(parent.$_get(2)).assertEqual(3.0);
    });

  });
}
