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

export default function Float32ArrayCopyWithin3Test(): void {
  describe('Float32ArrayCopyWithin3Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINTHREE_0100
     * @tc.name testFloat32ArrayCopyWithinTHREE001
     * @tc.desc Verify target=-1 normalizes to length-1, copies the first element to the last position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinTHREE001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0, 6.0]);
      arr.copyWithin(-1, 0, 1);
      expect(arr.$_get(5)).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINTHREE_0200
     * @tc.name testFloat32ArrayCopyWithinTHREE002
     * @tc.desc Verify target=-2 normalizes to length-2, copies the interval elements to the second-to-last position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinTHREE002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 20.0, 30.0, 40.0, 50.0, 60.0]);
      arr.copyWithin(-2, 1, 3);
      expect(arr.$_get(4)).assertEqual(20.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINTHREE_0300
     * @tc.name testFloat32ArrayCopyWithinTHREE003
     * @tc.desc Verify target=-length exactly normalizes to 0, copies the last segment to the front
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinTHREE003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0, 6.0]);
      arr.copyWithin(-6, 4, 6);
      expect(arr.$_get(0)).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINTHREE_0400
     * @tc.name testFloat32ArrayCopyWithinTHREE004
     * @tc.desc Verify target=-length-1 normalizes to negative then clamps to 0, copies the middle segment to the front
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinTHREE004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0, 6.0]);
      arr.copyWithin(-7, 2, 4);
      expect(arr.$_get(0)).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINTHREE_0500
     * @tc.name testFloat32ArrayCopyWithinTHREE005
     * @tc.desc Verify target=INT_MIN normalizes then clamps to 0, copies the rear segment to the front
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinTHREE005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([7.0, 8.0, 9.0]);
      arr.copyWithin(-2147483648, 1, 3);
      expect(arr.$_get(0)).assertEqual(8.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINTHREE_0600
     * @tc.name testFloat32ArrayCopyWithinTHREE006
     * @tc.desc Verify target=length exactly out of bounds, no remaining space, array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinTHREE006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0, 6.0]);
      arr.copyWithin(6, 0, 1);
      expect(arr.$_get(0)).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINTHREE_0700
     * @tc.name testFloat32ArrayCopyWithinTHREE007
     * @tc.desc Verify target=INT_MAX extremely large out of bounds, array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinTHREE007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      arr.copyWithin(2147483647, 0, 1);
      expect(arr.$_get(0)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINTHREE_0800
     * @tc.name testFloat32ArrayCopyWithinTHREE008
     * @tc.desc Verify start=-1 normalizes to length-1, copies the last element to the front
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinTHREE008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0, 6.0]);
      arr.copyWithin(0, -1, 6);
      expect(arr.$_get(0)).assertEqual(6.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINTHREE_0900
     * @tc.name testFloat32ArrayCopyWithinTHREE009
     * @tc.desc Verify start=-2 normalizes to length-2, copies the last two elements to the front
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinTHREE009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 20.0, 30.0, 40.0, 50.0, 60.0]);
      arr.copyWithin(0, -2, 6);
      expect(arr.$_get(0)).assertEqual(50.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINTHREE_1000
     * @tc.name testFloat32ArrayCopyWithinTHREE010
     * @tc.desc Verify start=-4 normalizes to 2 in length-6, copies the rear segment overwriting the tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinTHREE010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0, 6.0]);
      arr.copyWithin(3, -4, 6);
      expect(arr.$_get(3)).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINTHREE_1100
     * @tc.name testFloat32ArrayCopyWithinTHREE011
     * @tc.desc Verify start=-length exactly normalizes to 0, copies the front segment overwriting the tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinTHREE011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0, 6.0]);
      arr.copyWithin(4, -6, 6);
      expect(arr.$_get(4)).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINTHREE_1200
     * @tc.name testFloat32ArrayCopyWithinTHREE012
     * @tc.desc Verify start=-length-1 normalizes to negative then clamps to 0, copies the front segment overwriting the tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinTHREE012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      arr.copyWithin(3, -6, 5);
      expect(arr.$_get(3)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINTHREE_1300
     * @tc.name testFloat32ArrayCopyWithinTHREE013
     * @tc.desc Verify start=INT_MIN normalizes then clamps to 0, copies the front segment overwriting the tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinTHREE013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([7.0, 8.0, 9.0]);
      arr.copyWithin(1, -2147483648, 3);
      expect(arr.$_get(1)).assertEqual(7.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINTHREE_1400
     * @tc.name testFloat32ArrayCopyWithinTHREE014
     * @tc.desc Verify start=length exactly out of bounds, source interval is empty, array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinTHREE014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0, 6.0]);
      arr.copyWithin(0, 6, 6);
      expect(arr.$_get(0)).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINTHREE_1500
     * @tc.name testFloat32ArrayCopyWithinTHREE015
     * @tc.desc Verify start=INT_MAX extremely large out of bounds, array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinTHREE015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      arr.copyWithin(0, 2147483647, 2147483647);
      expect(arr.$_get(0)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINTHREE_1600
     * @tc.name testFloat32ArrayCopyWithinTHREE016
     * @tc.desc Verify end=-1 normalizes to length-1, copies the front segment excluding the last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinTHREE016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0, 6.0]);
      arr.copyWithin(0, 0, -1);
      expect(arr.$_get(4)).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINTHREE_1700
     * @tc.name testFloat32ArrayCopyWithinTHREE017
     * @tc.desc Verify end=-2 normalizes to length-2, copies the front segment excluding the last two elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinTHREE017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 20.0, 30.0, 40.0, 50.0, 60.0]);
      arr.copyWithin(0, 0, -2);
      expect(arr.$_get(3)).assertEqual(40.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINTHREE_1800
     * @tc.name testFloat32ArrayCopyWithinTHREE018
     * @tc.desc Verify end=-2 normalizes to length-2, copies the front segment to the middle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinTHREE018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0, 6.0]);
      arr.copyWithin(2, 0, -2);
      expect(arr.$_get(2)).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINTHREE_1900
     * @tc.name testFloat32ArrayCopyWithinTHREE019
     * @tc.desc Verify end=-length normalizes to 0, start>=end no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinTHREE019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0, 6.0]);
      arr.copyWithin(0, 0, -6);
      expect(arr.$_get(0)).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINTHREE_2000
     * @tc.name testFloat32ArrayCopyWithinTHREE020
     * @tc.desc Verify end=INT_MIN normalizes then clamps to 0, start>=end no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinTHREE020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([7.0, 8.0, 9.0]);
      arr.copyWithin(0, 0, -2147483648);
      expect(arr.$_get(0)).assertEqual(7.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINTHREE_2100
     * @tc.name testFloat32ArrayCopyWithinTHREE021
     * @tc.desc Verify end=length exactly covers all, self-copies the first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinTHREE021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0, 6.0]);
      arr.copyWithin(0, 0, 6);
      expect(arr.$_get(5)).assertEqual(6.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINTHREE_2200
     * @tc.name testFloat32ArrayCopyWithinTHREE022
     * @tc.desc Verify end=INT_MAX extremely large out of bounds clamps to length, full copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinTHREE022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([100.0, 200.0, 300.0, 400.0]);
      arr.copyWithin(0, 0, 2147483647);
      expect(arr.$_get(3)).assertEqual(400.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINTHREE_2300
     * @tc.name testFloat32ArrayCopyWithinTHREE023
     * @tc.desc Verify end omitted defaults to length, copies the first segment to the middle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinTHREE023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0, 6.0]);
      arr.copyWithin(2, 0);
      expect(arr.$_get(2)).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINTHREE_2400
     * @tc.name testFloat32ArrayCopyWithinTHREE024
     * @tc.desc Verify end explicit undefined equivalent to defaulting to length, copies the rear segment to the front
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinTHREE024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0, 6.0]);
      arr.copyWithin(0, 1, undefined);
      expect(arr.$_get(0)).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINTHREE_2500
     * @tc.name testFloat32ArrayCopyWithinTHREE025
     * @tc.desc Verify all three arguments negative target=-3 start=-5 end=-1, after normalization copies multiple elements to the middle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinTHREE025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0, 6.0]);
      arr.copyWithin(-3, -5, -1);
      expect(arr.$_get(3)).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINTHREE_2600
     * @tc.name testFloat32ArrayCopyWithinTHREE026
     * @tc.desc Verify start negative normalization combined with end positive out of bounds, copies the rear segment to the front
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinTHREE026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0, 6.0]);
      arr.copyWithin(0, -3, 100);
      expect(arr.$_get(0)).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINTHREE_2700
     * @tc.name testFloat32ArrayCopyWithinTHREE027
     * @tc.desc Verify target=INT_MAX combined with start=INT_MIN is a no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinTHREE027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      arr.copyWithin(2147483647, -2147483648, 4);
      expect(arr.$_get(0)).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINTHREE_2800
     * @tc.name testFloat32ArrayCopyWithinTHREE028
     * @tc.desc Verify empty array target=-1 start=-1 no-op after normalization and clamping, byte length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinTHREE028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      arr.copyWithin(-1, -1);
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINTHREE_2900
     * @tc.name testFloat32ArrayCopyWithinTHREE029
     * @tc.desc Verify single-element target=-1 start=-1 normalizes to 0 self-copy, value unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinTHREE029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([7.0]);
      arr.copyWithin(-1, -1);
      expect(arr.$_get(0)).assertEqual(7.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINTHREE_3000
     * @tc.name testFloat32ArrayCopyWithinTHREE030
     * @tc.desc Verify single-element target=1 start=0 out of bounds no-op, value unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinTHREE030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([7.0]);
      arr.copyWithin(1, 0);
      expect(arr.$_get(0)).assertEqual(7.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINTHREE_3100
     * @tc.name testFloat32ArrayCopyWithinTHREE031
     * @tc.desc Verify two-element target=-1 start=-2 end=-1 all-negative normalization copies the first element to the last position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinTHREE031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      arr.copyWithin(-1, -2, -1);
      expect(arr.$_get(1)).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINTHREE_3200
     * @tc.name testFloat32ArrayCopyWithinTHREE032
     * @tc.desc Verify copyWithin returns this, modifying the return value affects the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinTHREE032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const result = arr.copyWithin(0, 1, 2);
      result.$_set(0, 99.0);
      expect(arr.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINTHREE_3300
     * @tc.name testFloat32ArrayCopyWithinTHREE033
     * @tc.desc Verify out of bounds no-op still returns this, modifying the return value affects the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinTHREE033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const result = arr.copyWithin(100, 0, 1);
      result.$_set(2, 77.0);
      expect(arr.$_get(2)).assertEqual(77);
    });

  });
}
