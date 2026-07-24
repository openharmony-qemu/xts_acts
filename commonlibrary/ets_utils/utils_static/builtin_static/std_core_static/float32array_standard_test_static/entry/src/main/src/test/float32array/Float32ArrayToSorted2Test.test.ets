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

export default function Float32ArrayToSorted2Test(): void {
  describe('Float32ArrayToSorted2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDTWO_0100
     * @tc.name testFloat32ArrayToSortedTWO001
     * @tc.desc Verify arity 0 call to toSorted returns sorted content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedTWO001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([3.0, 1.0, 2.0]);
      const r = src.toSorted();
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(2);
      expect(r.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDTWO_0200
     * @tc.name testFloat32ArrayToSortedTWO002
     * @tc.desc Verify arity 0 call to toSorted returns a sorted Float32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedTWO002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([9.0, 2.0, 6.0]);
      const r = src.toSorted();
      expect(r.$_get(0)).assertEqual(2);
      expect(r.$_get(1)).assertEqual(6);
      expect(r.$_get(2)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDTWO_0300
     * @tc.name testFloat32ArrayToSortedTWO003
     * @tc.desc Verify the return value instance BYTES_PER_ELEMENT equals 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedTWO003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([4.0, 1.0, 3.0]);
      const r = src.toSorted();
      expect(r.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDTWO_0400
     * @tc.name testFloat32ArrayToSortedTWO004
     * @tc.desc Verify the return value buffer is an ArrayBuffer instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedTWO004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([6.0, 2.0, 8.0]);
      const r = src.toSorted();
      expect(r.buffer instanceof ArrayBuffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDTWO_0500
     * @tc.name testFloat32ArrayToSortedTWO005
     * @tc.desc Verify the return value byteOffset equals 0 (independent buffer start)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedTWO005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([7.0, 3.0, 5.0]);
      const r = src.toSorted();
      expect(r.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDTWO_0600
     * @tc.name testFloat32ArrayToSortedTWO006
     * @tc.desc Verify empty source array toSorted returns an empty result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedTWO006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([]);
      const r = src.toSorted();
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDTWO_0700
     * @tc.name testFloat32ArrayToSortedTWO007
     * @tc.desc Verify single-element source array toSorted preserves the value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedTWO007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([42.0]);
      const r = src.toSorted();
      expect(r.length).assertEqual(1);
      expect(r.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDTWO_0800
     * @tc.name testFloat32ArrayToSortedTWO008
     * @tc.desc Verify single-element array value is unchanged after sorting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedTWO008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([42.0]);
      const r = src.toSorted();
      expect(r.$_get(0)).assertEqual(42.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDTWO_0900
     * @tc.name testFloat32ArrayToSortedTWO009
     * @tc.desc Verify two-element already ascending order stays unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedTWO009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0]);
      const r = src.toSorted();
      expect(r.$_get(0)).assertEqual(1.0);
      expect(r.$_get(1)).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDTWO_1000
     * @tc.name testFloat32ArrayToSortedTWO010
     * @tc.desc Verify two-element descending order reverses to ascending order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedTWO010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([2.0, 1.0]);
      const r = src.toSorted();
      expect(r.$_get(0)).assertEqual(1.0);
      expect(r.$_get(1)).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDTWO_1100
     * @tc.name testFloat32ArrayToSortedTWO011
     * @tc.desc Verify three-element unordered array sorts to ascending order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedTWO011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([3.0, 1.0, 2.0]);
      const r = src.toSorted();
      expect(r.$_get(0)).assertEqual(1.0);
      expect(r.$_get(1)).assertEqual(2.0);
      expect(r.$_get(2)).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDTWO_1200
     * @tc.name testFloat32ArrayToSortedTWO012
     * @tc.desc Verify all-negative-value array sorts in ascending order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedTWO012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([-1.0, -3.0, -2.0]);
      const r = src.toSorted();
      expect(r.$_get(0)).assertEqual(-3.0);
      expect(r.$_get(1)).assertEqual(-2.0);
      expect(r.$_get(2)).assertEqual(-1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDTWO_1300
     * @tc.name testFloat32ArrayToSortedTWO013
     * @tc.desc Verify mixed positive and negative values sort in ascending order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedTWO013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([5.0, -2.0, 3.0]);
      const r = src.toSorted();
      expect(r.$_get(0)).assertEqual(-2.0);
      expect(r.$_get(1)).assertEqual(3.0);
      expect(r.$_get(2)).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDTWO_1400
     * @tc.name testFloat32ArrayToSortedTWO014
     * @tc.desc Verify all-equal-value array order is unchanged after sorting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedTWO014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([7.0, 7.0, 7.0]);
      const r = src.toSorted();
      expect(r.$_get(0)).assertEqual(7.0);
      expect(r.$_get(1)).assertEqual(7.0);
      expect(r.$_get(2)).assertEqual(7.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDTWO_1500
     * @tc.name testFloat32ArrayToSortedTWO015
     * @tc.desc Verify array with duplicate values stably merges in ascending order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedTWO015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([2.0, 2.0, 1.0, 1.0]);
      const r = src.toSorted();
      expect(r.$_get(0)).assertEqual(1.0);
      expect(r.$_get(1)).assertEqual(1.0);
      expect(r.$_get(2)).assertEqual(2.0);
      expect(r.$_get(3)).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDTWO_1600
     * @tc.name testFloat32ArrayToSortedTWO016
     * @tc.desc Verify array with zero values sorts in ascending order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedTWO016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([0.0, -1.0, 1.0]);
      const r = src.toSorted();
      expect(r.$_get(0)).assertEqual(-1.0);
      expect(r.$_get(1)).assertEqual(0.0);
      expect(r.$_get(2)).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDTWO_1700
     * @tc.name testFloat32ArrayToSortedTWO017
     * @tc.desc Verify already-ascending ten-element first and last values assertion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedTWO017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0]);
      const r = src.toSorted();
      expect(r.$_get(0)).assertEqual(1.0);
      expect(r.$_get(9)).assertEqual(10.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDTWO_1800
     * @tc.name testFloat32ArrayToSortedTWO018
     * @tc.desc Verify fully reversed ten-element array reverses to ascending order first and last values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedTWO018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([10.0, 9.0, 8.0, 7.0, 6.0, 5.0, 4.0, 3.0, 2.0, 1.0]);
      const r = src.toSorted();
      expect(r.$_get(0)).assertEqual(1.0);
      expect(r.$_get(9)).assertEqual(10.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDTWO_1900
     * @tc.name testFloat32ArrayToSortedTWO019
     * @tc.desc Verify exactly representable decimals sort in ascending order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedTWO019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([0.5, 0.25, 0.125]);
      const r = src.toSorted();
      expect(r.$_get(0)).assertEqual(0.125);
      expect(r.$_get(1)).assertEqual(0.25);
      expect(r.$_get(2)).assertEqual(0.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDTWO_2000
     * @tc.name testFloat32ArrayToSortedTWO020
     * @tc.desc Verify large integers sort in ascending order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedTWO020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1000.0, 10.0, 100.0]);
      const r = src.toSorted();
      expect(r.$_get(0)).assertEqual(10.0);
      expect(r.$_get(1)).assertEqual(100.0);
      expect(r.$_get(2)).assertEqual(1000.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDTWO_2100
     * @tc.name testFloat32ArrayToSortedTWO021
     * @tc.desc Verify float32 max exact integer 2^24 boundary ascending order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedTWO021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([16777216.0, 1.0]);
      const r = src.toSorted();
      expect(r.$_get(0)).assertEqual(1.0);
      expect(r.$_get(1)).assertEqual(16777216.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDTWO_2200
     * @tc.name testFloat32ArrayToSortedTWO022
     * @tc.desc Verify negative large integers and zero sort in ascending order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedTWO022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([-1000000.0, -1.0, 0.0]);
      const r = src.toSorted();
      expect(r.$_get(0)).assertEqual(-1000000.0);
      expect(r.$_get(1)).assertEqual(-1.0);
      expect(r.$_get(2)).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDTWO_2300
     * @tc.name testFloat32ArrayToSortedTWO023
     * @tc.desc Verify five-element mixed positive, negative, and zero total order assertion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedTWO023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([4.0, -3.0, 0.0, 9.0, -7.0]);
      const r = src.toSorted();
      expect(r.$_get(0)).assertEqual(-7.0);
      expect(r.$_get(1)).assertEqual(-3.0);
      expect(r.$_get(2)).assertEqual(0.0);
      expect(r.$_get(3)).assertEqual(4.0);
      expect(r.$_get(4)).assertEqual(9.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDTWO_2400
     * @tc.name testFloat32ArrayToSortedTWO024
     * @tc.desc Verify float32 precision values aligned via reference assertion (avoids double-precision error)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedTWO024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([0.1, 0.2]);
      const ref: Float32Array = new Float32Array([0.1]);
      const r = src.toSorted();
      expect(r.$_get(0)).assertEqual(ref.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDTWO_2500
     * @tc.name testFloat32ArrayToSortedTWO025
     * @tc.desc Verify twenty-element unordered array first and last minimum and maximum values assertion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedTWO025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array =
        new Float32Array([20.0, 1.0, 15.0, 3.0, 18.0, 2.0, 17.0, 4.0, 16.0, 5.0, 14.0, 6.0, 13.0, 7.0, 12.0, 8.0, 11.0,
          9.0, 10.0, 19.0]);
      const r = src.toSorted();
      expect(r.$_get(0)).assertEqual(1.0);
      expect(r.$_get(19)).assertEqual(20.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDTWO_2600
     * @tc.name testFloat32ArrayToSortedTWO026
     * @tc.desc Verify NaN sorts to the last position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedTWO026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([3.0, NaN, 1.0]);
      const r = src.toSorted();
      expect(r.$_get(0)).assertEqual(1.0);
      expect(r.$_get(2)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDTWO_2700
     * @tc.name testFloat32ArrayToSortedTWO027
     * @tc.desc Verify multiple NaNs all sort to a contiguous trailing segment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedTWO027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([NaN, 2.0, NaN, 1.0]);
      const r = src.toSorted();
      expect(r.$_get(0)).assertEqual(1.0);
      expect(r.$_get(1)).assertEqual(2.0);
      expect(r.$_get(2)).assertNaN();
      expect(r.$_get(3)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDTWO_2800
     * @tc.name testFloat32ArrayToSortedTWO028
     * @tc.desc Verify all-NaN array is still all NaN after sorting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedTWO028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([NaN, NaN]);
      const r = src.toSorted();
      expect(r.$_get(0)).assertNaN();
      expect(r.$_get(1)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDTWO_2900
     * @tc.name testFloat32ArrayToSortedTWO029
     * @tc.desc Verify positive infinity sorts to the last position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedTWO029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, Infinity, 2.0]);
      const r = src.toSorted();
      expect(r.$_get(0)).assertEqual(1.0);
      expect(r.$_get(1)).assertEqual(2.0);
      expect(r.$_get(2)).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDTWO_3000
     * @tc.name testFloat32ArrayToSortedTWO030
     * @tc.desc Verify negative infinity sorts to the first position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedTWO030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, -Infinity, 2.0]);
      const r = src.toSorted();
      expect(r.$_get(0)).assertEqual(-Infinity);
      expect(r.$_get(1)).assertEqual(1.0);
      expect(r.$_get(2)).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDTWO_3100
     * @tc.name testFloat32ArrayToSortedTWO031
     * @tc.desc Verify positive and negative infinity coexist, distributed at first and last positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedTWO031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([-Infinity, 1.0, Infinity]);
      const r = src.toSorted();
      expect(r.$_get(0)).assertEqual(-Infinity);
      expect(r.$_get(1)).assertEqual(1.0);
      expect(r.$_get(2)).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDTWO_3200
     * @tc.name testFloat32ArrayToSortedTWO032
     * @tc.desc Verify when NaN and positive infinity coexist, Infinity precedes NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedTWO032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, NaN, Infinity]);
      const r = src.toSorted();
      expect(r.$_get(0)).assertEqual(1.0);
      expect(r.$_get(1)).assertEqual(Infinity);
      expect(r.$_get(2)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDTWO_3300
     * @tc.name testFloat32ArrayToSortedTWO033
     * @tc.desc Verify both positive zero and negative zero sort after -1 and equal 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedTWO033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([0.0, -0.0, -1.0]);
      const r = src.toSorted();
      expect(r.$_get(0)).assertEqual(-1.0);
      expect(r.$_get(1)).assertEqual(0.0);
      expect(r.$_get(2)).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDTWO_3400
     * @tc.name testFloat32ArrayToSortedTWO034
     * @tc.desc Verify negative zero preserves the sign as -0 after sorting (1/x detection)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedTWO034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([-0.0, 1.0]);
      const r = src.toSorted();
      expect(1 / r.$_get(0)).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDTWO_3500
     * @tc.name testFloat32ArrayToSortedTWO035
     * @tc.desc Verify positive zero preserves the sign as +0 after sorting (1/x detection)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedTWO035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([0.0, -1.0]);
      const r = src.toSorted();
      expect(1 / r.$_get(1)).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDTWO_3600
     * @tc.name testFloat32ArrayToSortedTWO036
     * @tc.desc Verify positive and negative infinity and NaN three-element total order assertion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedTWO036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([Infinity, -Infinity, NaN]);
      const r = src.toSorted();
      expect(r.$_get(0)).assertEqual(-Infinity);
      expect(r.$_get(1)).assertEqual(Infinity);
      expect(r.$_get(2)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDTWO_3700
     * @tc.name testFloat32ArrayToSortedTWO037
     * @tc.desc Verify five-element array containing NaN last position assertion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedTWO037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([5.0, 3.0, NaN, 1.0, 4.0]);
      const r = src.toSorted();
      expect(r.$_get(0)).assertEqual(1.0);
      expect(r.$_get(1)).assertEqual(3.0);
      expect(r.$_get(2)).assertEqual(4.0);
      expect(r.$_get(3)).assertEqual(5.0);
      expect(r.$_get(4)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDTWO_3800
     * @tc.name testFloat32ArrayToSortedTWO038
     * @tc.desc Verify NaN and negative zero coexist, negative zero sorts to first position and NaN to last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedTWO038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([NaN, -0.0, 1.0]);
      const r = src.toSorted();
      expect(r.$_get(0)).assertEqual(0.0);
      expect(r.$_get(1)).assertEqual(1.0);
      expect(r.$_get(2)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDTWO_3900
     * @tc.name testFloat32ArrayToSortedTWO039
     * @tc.desc Verify toSorted return value is not the source array reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedTWO039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([3.0, 1.0, 2.0]);
      const r = src.toSorted();
      expect(r === src).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDTWO_4000
     * @tc.name testFloat32ArrayToSortedTWO040
     * @tc.desc Verify empty source array return value byteLength equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedTWO040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([]);
      const r = src.toSorted();
      expect(r.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDTWO_4100
     * @tc.name testFloat32ArrayToSortedTWO041
     * @tc.desc Verify three-element return value byteLength equals 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedTWO041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([3.0, 1.0, 2.0]);
      const r = src.toSorted();
      expect(r.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDTWO_4200
     * @tc.name testFloat32ArrayToSortedTWO042
     * @tc.desc Verify return value length and source length are both 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedTWO042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([6.0, 5.0, 4.0, 3.0, 2.0, 1.0]);
      const r = src.toSorted();
      expect(r.length).assertEqual(6);
      expect(src.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDTWO_4300
     * @tc.name testFloat32ArrayToSortedTWO043
     * @tc.desc Verify sixteen-element return value byteLength equals 64
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedTWO043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array =
        new Float32Array([16.0, 1.0, 15.0, 2.0, 14.0, 3.0, 13.0, 4.0, 12.0, 5.0, 11.0, 6.0, 10.0, 7.0, 9.0, 8.0]);
      const r = src.toSorted();
      expect(r.byteLength).assertEqual(64);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDTWO_4400
     * @tc.name testFloat32ArrayToSortedTWO044
     * @tc.desc Verify original array length unchanged after sorting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedTWO044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([3.0, 1.0, 2.0]);
      const r = src.toSorted();
      expect(src.length).assertEqual(3);
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDTWO_4500
     * @tc.name testFloat32ArrayToSortedTWO045
     * @tc.desc Verify original array byteLength unchanged after sorting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedTWO045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([3.0, 1.0, 2.0]);
      const r = src.toSorted();
      expect(src.byteLength).assertEqual(12);
      expect(r.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDTWO_4600
     * @tc.name testFloat32ArrayToSortedTWO046
     * @tc.desc Verify original array first element unchanged after sorting a reverse-ordered source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedTWO046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([3.0, 2.0, 1.0]);
      const r = src.toSorted();
      expect(src.$_get(0)).assertEqual(3.0);
      expect(r.$_get(0)).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDTWO_4700
     * @tc.name testFloat32ArrayToSortedTWO047
     * @tc.desc Verify original array last element unchanged after sorting an ascending source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedTWO047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      const r = src.toSorted();
      expect(src.at(-1)).assertEqual(-1);
      expect(r.at(-1)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDTWO_4800
     * @tc.name testFloat32ArrayToSortedTWO048
     * @tc.desc Verify original array element-by-element order completely unchanged after sorting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedTWO048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([4.0, 2.0, 5.0, 1.0, 3.0]);
      const expected: Float32Array = new Float32Array([4.0, 2.0, 5.0, 1.0, 3.0]);
      const r = src.toSorted();
      expect(r.$_get(0)).assertEqual(1.0);
      for (let i = 0; i < 5; i++) {
        expect(src.$_get(i)).assertEqual(expected.$_get(i));
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDTWO_4900
     * @tc.name testFloat32ArrayToSortedTWO049
     * @tc.desc Verify original array NaN position unchanged after sorting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedTWO049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([1.0, NaN, 2.0]);
      const r = src.toSorted();
      expect(src.$_get(1)).assertNaN();
      expect(r.$_get(2)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDTWO_5000
     * @tc.name testFloat32ArrayToSortedTWO050
     * @tc.desc Verify original array still unchanged after two consecutive toSorted calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedTWO050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([5.0, 3.0, 1.0]);
      const r1 = src.toSorted();
      const r2 = src.toSorted();
      expect(src.$_get(0)).assertEqual(5.0);
      expect(r1.$_get(0)).assertEqual(1.0);
      expect(r2.$_get(0)).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDTWO_5100
     * @tc.name testFloat32ArrayToSortedTWO051
     * @tc.desc Verify original array buffer.byteLength unchanged after sorting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedTWO051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([2.0, 1.0]);
      const r = src.toSorted();
      expect(src.buffer.byteLength).assertEqual(8);
      expect(r.buffer.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDTWO_5200
     * @tc.name testFloat32ArrayToSortedTWO052
     * @tc.desc Verify original array byteOffset unchanged after sorting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedTWO052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([2.0, 1.0]);
      const r = src.toSorted();
      expect(src.byteOffset).assertEqual(0);
      expect(r.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDTWO_5300
     * @tc.name testFloat32ArrayToSortedTWO053
     * @tc.desc Verify original array element values at each position unchanged after sorting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedTWO053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([9.0, 4.0, 7.0]);
      const r = src.toSorted();
      expect(src.$_get(0)).assertEqual(9.0);
      expect(src.$_get(1)).assertEqual(4.0);
      expect(src.$_get(2)).assertEqual(7.0);
      expect(r.$_get(0)).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDTWO_5400
     * @tc.name testFloat32ArrayToSortedTWO054
     * @tc.desc Verify writing to the return value does not affect the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedTWO054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([2.0, 1.0]);
      const r = src.toSorted();
      r.$_set(0, 777.0);
      expect(src.$_get(0)).assertEqual(2.0);
      expect(r.$_get(0)).assertEqual(777.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDTWO_5500
     * @tc.name testFloat32ArrayToSortedTWO055
     * @tc.desc Verify original array at(-1) still equals the original last element after sorting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedTWO055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([6.0, 4.0, 2.0]);
      const r = src.toSorted();
      expect(src.at(-1)).assertEqual(2.0);
      expect(r.at(-1)).assertEqual(6.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDTWO_5600
     * @tc.name testFloat32ArrayToSortedTWO056
     * @tc.desc Verify toSorted chained with toSorted returns sorted content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedTWO056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([3.0, 1.0, 2.0]);
      const r = src.toSorted().toSorted();
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(2);
      expect(r.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDTWO_5700
     * @tc.name testFloat32ArrayToSortedTWO057
     * @tc.desc Verify toSorted chained with toSorted double-sort result is correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedTWO057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([3.0, 1.0, 2.0]);
      const r = src.toSorted().toSorted();
      expect(r.$_get(0)).assertEqual(1.0);
      expect(r.$_get(2)).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDTWO_5800
     * @tc.name testFloat32ArrayToSortedTWO058
     * @tc.desc Verify toSorted chained length property access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedTWO058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([5.0, 4.0, 3.0, 2.0, 1.0]);
      const r = src.toSorted().length;
      expect(r).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDTWO_5900
     * @tc.name testFloat32ArrayToSortedTWO059
     * @tc.desc Verify toSorted chained $_get index access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedTWO059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([9.0, 2.0, 6.0]);
      const r = src.toSorted().$_get(0);
      expect(r).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDTWO_6000
     * @tc.name testFloat32ArrayToSortedTWO060
     * @tc.desc Verify toSorted chained at last-element access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedTWO060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([9.0, 2.0, 6.0]);
      const r = src.toSorted().at(-1);
      expect(r).assertEqual(9.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDTWO_6100
     * @tc.name testFloat32ArrayToSortedTWO061
     * @tc.desc Verify toSorted triple-chained result is correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedTWO061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([4.0, 1.0, 3.0]);
      const r = src.toSorted().toSorted().toSorted();
      expect(r.$_get(0)).assertEqual(1.0);
      expect(r.$_get(2)).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDTWO_6200
     * @tc.name testFloat32ArrayToSortedTWO062
     * @tc.desc Verify return value buffer and source buffer are independent (writing to source does not affect result)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedTWO062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([2.0, 1.0]);
      const r = src.toSorted();
      src.$_set(0, 888.0);
      expect(r.$_get(0)).assertEqual(1.0);
      expect(src.$_get(0)).assertEqual(888.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDTWO_6300
     * @tc.name testFloat32ArrayToSortedTWO063
     * @tc.desc Verify writing to the return value does not affect the source array (buffer not shared)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedTWO063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([3.0, 1.0, 2.0]);
      const r = src.toSorted();
      r.$_set(1, 555.0);
      expect(src.$_get(1)).assertEqual(1.0);
      expect(r.$_get(1)).assertEqual(555.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDTWO_6400
     * @tc.name testFloat32ArrayToSortedTWO064
     * @tc.desc Verify two toSorted result buffers are not shared with each other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedTWO064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([7.0, 3.0, 5.0]);
      const r1 = src.toSorted();
      const r2 = src.toSorted();
      r1.$_set(0, 111.0);
      expect(r2.$_get(0)).assertEqual(3.0);
      expect(r1.$_get(0)).assertEqual(111.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDTWO_6500
     * @tc.name testFloat32ArrayToSortedTWO065
     * @tc.desc Verify return value buffer.byteLength equals element count times 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedTWO065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([4.0, 2.0, 6.0, 1.0]);
      const r = src.toSorted();
      expect(r.buffer.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDTWO_6600
     * @tc.name testFloat32ArrayToSortedTWO066
     * @tc.desc Verify return value is not a view of the source buffer (byteOffset 0 and writing to source does not affect result)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedTWO066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([5.0, 3.0]);
      const r = src.toSorted();
      expect(r.byteOffset).assertEqual(0);
      src.$_set(0, 999.0);
      expect(r.$_get(0)).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDTWO_6700
     * @tc.name testFloat32ArrayToSortedTWO067
     * @tc.desc Verify return value subarray shares buffer with the return value but is independent of the source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedTWO067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([6.0, 2.0, 4.0]);
      const r = src.toSorted();
      const v = r.subarray(0, 2);
      v.$_set(0, 222.0);
      expect(r.$_get(0)).assertEqual(222.0);
      expect(src.$_get(0)).assertEqual(6.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDTWO_6800
     * @tc.name testFloat32ArrayToSortedTWO068
     * @tc.desc Verify return value unchanged after source fill (buffer not shared)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedTWO068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([5.0, 1.0, 3.0]);
      const r = src.toSorted();
      src.fill(0.0);
      expect(r.$_get(0)).assertEqual(1.0);
      expect(src.$_get(0)).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDTWO_6900
     * @tc.name testFloat32ArrayToSortedTWO069
     * @tc.desc Verify return value keeps original sort order after modifying source elements (buffer independent)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedTWO069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([8.0, 2.0, 5.0]);
      const r = src.toSorted();
      src.$_set(0, 0.0);
      expect(r.$_get(2)).assertEqual(8.0);
      expect(src.$_get(0)).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDTWO_7000
     * @tc.name testFloat32ArrayToSortedTWO070
     * @tc.desc Verify toSorted keeps duplicate values and leaves the source order unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedTWO070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const firstValue: number = 2.0;
      const duplicateValue: number = 1.0;
      const src: Float32Array = new Float32Array([firstValue, duplicateValue, duplicateValue]);
      const sorted = src.toSorted();
      expect(sorted.$_get(0)).assertEqual(duplicateValue);
      expect(sorted.$_get(1)).assertEqual(duplicateValue);
      expect(sorted.$_get(2)).assertEqual(firstValue);
      expect(src.$_get(0)).assertEqual(firstValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDTWO_7100
     * @tc.name testFloat32ArrayToSortedTWO071
     * @tc.desc Verify toSorted result byteLength equals result length times BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedTWO071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array([9.0, 3.0, 6.0]);
      const sorted = src.toSorted();
      const expectLength: int = 3;
      const expectByteLength: int = expectLength * sorted.BYTES_PER_ELEMENT;
      expect(sorted.length).assertEqual(expectLength);
      expect(sorted.byteLength).assertEqual(expectByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDTWO_7200
     * @tc.name testFloat32ArrayToSortedTWO072
     * @tc.desc Verify toSorted on an offset view sorts only the view elements and does not alter the parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedTWO072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent: Float32Array = new Float32Array([9.0, 4.0, 2.0, 8.0]);
      const view: Float32Array = parent.subarray(1, 3);
      const sorted = view.toSorted();
      expect(sorted.$_get(0)).assertEqual(2.0);
      expect(sorted.$_get(1)).assertEqual(4.0);
      expect(parent.$_get(1)).assertEqual(4.0);
      expect(parent.$_get(2)).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDTWO_7300
     * @tc.name testFloat32ArrayToSortedTWO073
     * @tc.desc Verify empty toSorted result has length and byteLength zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedTWO073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Float32Array = new Float32Array(0);
      const sorted = src.toSorted();
      const expectLength: int = 0;
      const expectByteLength: int = 0;
      expect(sorted.length).assertEqual(expectLength);
      expect(sorted.byteLength).assertEqual(expectByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDTWO_7400
     * @tc.name testFloat32ArrayToSortedTWO074
     * @tc.desc Verify single-element toSorted result stays independent after modifying the source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedTWO074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const originalValue: number = 42.0;
      const changedValue: number = 7.0;
      const src: Float32Array = new Float32Array([originalValue]);
      const sorted = src.toSorted();
      src.$_set(0, changedValue);
      expect(sorted.$_get(0)).assertEqual(originalValue);
      expect(src.$_get(0)).assertEqual(changedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_TO_SORTEDTWO_7500
     * @tc.name testFloat32ArrayToSortedTWO075
     * @tc.desc Verify toSorted preserves duplicate values in the returned array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayToSortedTWO075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = Float32Array.of(2.0, 1.0, 2.0);
      const sorted = source.toSorted();
      expect(sorted.$_get(0)).assertEqual(1.0);
      expect(sorted.$_get(1)).assertEqual(2.0);
      expect(sorted.$_get(2)).assertEqual(2.0);
    });

  });
}
