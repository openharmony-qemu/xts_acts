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

export default function Float32ArrayCopyWithin1Test(): void {
  describe('Float32ArrayCopyWithin1Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINONE_0100
     * @tc.name testFloat32ArrayCopyWithinONE001
     * @tc.desc Verify copyWithin single-argument arity copyWithin(0) copies from first to first, unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinONE001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      arr.copyWithin(0);
      expect(arr.$_get(0)).assertEqual(16);
      expect(arr.$_get(4)).assertEqual(1000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINONE_0200
     * @tc.name testFloat32ArrayCopyWithinONE002
     * @tc.desc Verify copyWithin two-argument arity copyWithin(0,2) copies from index 2 to first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinONE002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      arr.copyWithin(0, 2);
      expect(arr.$_get(0)).assertEqual(-1);
      expect(arr.$_get(2)).assertEqual(1000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINONE_0300
     * @tc.name testFloat32ArrayCopyWithinONE003
     * @tc.desc Verify copyWithin three-argument arity copyWithin(0,1,3) copies [1,3) to first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinONE003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      arr.copyWithin(0, 1, 3);
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(1)).assertEqual(-1);
      expect(arr.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINONE_0400
     * @tc.name testFloat32ArrayCopyWithinONE004
     * @tc.desc Verify target=0 copies starting from the first element, result unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinONE004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      arr.copyWithin(0, 0);
      expect(arr.$_get(0)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINONE_0500
     * @tc.name testFloat32ArrayCopyWithinONE005
     * @tc.desc Verify target=2 copies to index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinONE005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      arr.copyWithin(2, 0);
      expect(arr.$_get(2)).assertEqual(16);
      expect(arr.$_get(4)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINONE_0600
     * @tc.name testFloat32ArrayCopyWithinONE006
     * @tc.desc Verify target=length-1(4) copies to the last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinONE006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      arr.copyWithin(4, 0);
      expect(arr.$_get(4)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINONE_0700
     * @tc.name testFloat32ArrayCopyWithinONE007
     * @tc.desc Verify target=length(5) out of bounds clamped to length, no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinONE007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      arr.copyWithin(5, 0);
      expect(arr.$_get(0)).assertEqual(16);
      expect(arr.$_get(4)).assertEqual(1000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINONE_0800
     * @tc.name testFloat32ArrayCopyWithinONE008
     * @tc.desc Verify target=2147483647 int max value out of bounds clamped, no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinONE008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      arr.copyWithin(2147483647, 0);
      expect(arr.$_get(0)).assertEqual(16);
      expect(arr.$_get(4)).assertEqual(1000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINONE_0900
     * @tc.name testFloat32ArrayCopyWithinONE009
     * @tc.desc Verify target=-1 negative index normalizes to length-1(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinONE009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      arr.copyWithin(-1, 0);
      expect(arr.$_get(4)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINONE_1000
     * @tc.name testFloat32ArrayCopyWithinONE010
     * @tc.desc Verify target=-2 negative index normalizes to 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinONE010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      arr.copyWithin(-2, 0);
      expect(arr.$_get(3)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINONE_1100
     * @tc.name testFloat32ArrayCopyWithinONE011
     * @tc.desc Verify target=-3 negative index normalizes to 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinONE011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      arr.copyWithin(-3, 0);
      expect(arr.$_get(2)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINONE_1200
     * @tc.name testFloat32ArrayCopyWithinONE012
     * @tc.desc Verify target=-length(-5) negative index normalizes to 0, unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinONE012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      arr.copyWithin(-5, 0);
      expect(arr.$_get(0)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINONE_1300
     * @tc.name testFloat32ArrayCopyWithinONE013
     * @tc.desc Verify target=-length-1(-6) negative index normalizes to -1, clamped to 0, unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinONE013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      arr.copyWithin(-6, 0);
      expect(arr.$_get(0)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINONE_1400
     * @tc.name testFloat32ArrayCopyWithinONE014
     * @tc.desc Verify target=-2147483648 int min value after normalization clamped to 0, unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinONE014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      arr.copyWithin(-2147483648, 0);
      expect(arr.$_get(0)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINONE_1500
     * @tc.name testFloat32ArrayCopyWithinONE015
     * @tc.desc Verify start=2 copies from index 2 to first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinONE015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      arr.copyWithin(0, 2);
      expect(arr.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINONE_1600
     * @tc.name testFloat32ArrayCopyWithinONE016
     * @tc.desc Verify start=length-1(4) copies from the last element to first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinONE016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      arr.copyWithin(0, 4);
      expect(arr.$_get(0)).assertEqual(1000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINONE_1700
     * @tc.name testFloat32ArrayCopyWithinONE017
     * @tc.desc Verify start=length(5) out of bounds clamped to length, empty copy, unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinONE017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      arr.copyWithin(0, 5);
      expect(arr.$_get(0)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINONE_1800
     * @tc.name testFloat32ArrayCopyWithinONE018
     * @tc.desc Verify start=2147483647 int max value out of bounds clamped, unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinONE018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      arr.copyWithin(0, 2147483647);
      expect(arr.$_get(0)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINONE_1900
     * @tc.name testFloat32ArrayCopyWithinONE019
     * @tc.desc Verify start=-1 negative index normalizes to length-1(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinONE019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      arr.copyWithin(0, -1);
      expect(arr.$_get(0)).assertEqual(1000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINONE_2000
     * @tc.name testFloat32ArrayCopyWithinONE020
     * @tc.desc Verify start=-2 negative index normalizes to 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinONE020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      arr.copyWithin(0, -2);
      expect(arr.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINONE_2100
     * @tc.name testFloat32ArrayCopyWithinONE021
     * @tc.desc Verify start=-length(-5) negative index normalizes to 0, unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinONE021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      arr.copyWithin(0, -5);
      expect(arr.$_get(0)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINONE_2200
     * @tc.name testFloat32ArrayCopyWithinONE022
     * @tc.desc Verify start=-length-1(-6) negative index normalizes to -1, clamped to 0, unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinONE022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      arr.copyWithin(0, -6);
      expect(arr.$_get(0)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINONE_2300
     * @tc.name testFloat32ArrayCopyWithinONE023
     * @tc.desc Verify start=-2147483648 int min value after normalization clamped to 0, unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinONE023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      arr.copyWithin(0, -2147483648);
      expect(arr.$_get(0)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINONE_2400
     * @tc.name testFloat32ArrayCopyWithinONE024
     * @tc.desc Verify end=length(5) explicit end copies [1,5) to first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinONE024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      arr.copyWithin(0, 1, 5);
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(3)).assertEqual(1000000);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINONE_2500
     * @tc.name testFloat32ArrayCopyWithinONE025
     * @tc.desc Verify end=2 truncates to index 2 copying [1,2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinONE025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      arr.copyWithin(0, 1, 2);
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(1)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINONE_2600
     * @tc.name testFloat32ArrayCopyWithinONE026
     * @tc.desc Verify end=1 start==end empty range, unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinONE026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      arr.copyWithin(0, 1, 1);
      expect(arr.$_get(0)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINONE_2700
     * @tc.name testFloat32ArrayCopyWithinONE027
     * @tc.desc Verify end=0 start>end empty range, unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinONE027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      arr.copyWithin(0, 1, 0);
      expect(arr.$_get(0)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINONE_2800
     * @tc.name testFloat32ArrayCopyWithinONE028
     * @tc.desc Verify end=2147483647 int max value out of bounds clamped to length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinONE028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      arr.copyWithin(0, 1, 2147483647);
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(3)).assertEqual(1000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINONE_2900
     * @tc.name testFloat32ArrayCopyWithinONE029
     * @tc.desc Verify end=-1 negative index normalizes to length-1(4) copying [1,4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinONE029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      arr.copyWithin(0, 1, -1);
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINONE_3000
     * @tc.name testFloat32ArrayCopyWithinONE030
     * @tc.desc Verify end=-2 negative index normalizes to 3 copying [1,3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinONE030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      arr.copyWithin(0, 1, -2);
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINONE_3100
     * @tc.name testFloat32ArrayCopyWithinONE031
     * @tc.desc Verify end=-length(-5) negative index normalizes to 0, empty range, unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinONE031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      arr.copyWithin(0, 1, -5);
      expect(arr.$_get(0)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINONE_3200
     * @tc.name testFloat32ArrayCopyWithinONE032
     * @tc.desc Verify end=undefined explicit undefined defaults to end, equivalent to end=5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinONE032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      arr.copyWithin(0, 1, undefined);
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(3)).assertEqual(1000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINONE_3300
     * @tc.name testFloat32ArrayCopyWithinONE033
     * @tc.desc Verify copy NaN preserved at the bit level, asserted as NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinONE033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([NaN, 0.0, 0.0]);
      arr.copyWithin(2, 0);
      expect(arr.$_get(2)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINONE_3400
     * @tc.name testFloat32ArrayCopyWithinONE034
     * @tc.desc Verify copy +Infinity preserved at the bit level
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinONE034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([Infinity, 0.0, 0.0]);
      arr.copyWithin(2, 0);
      expect(arr.$_get(2)).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINONE_3500
     * @tc.name testFloat32ArrayCopyWithinONE035
     * @tc.desc Verify copy -0 preserved at the bit level, distinguished via reciprocal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinONE035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([-0.0, 0.0, 0.0]);
      arr.copyWithin(2, 0);
      expect(1 / arr.$_get(2)).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINONE_3600
     * @tc.name testFloat32ArrayCopyWithinONE036
     * @tc.desc Verify copy 0.1 float32 precision preserved at the bit level
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinONE036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([0.1, 0.0, 0.0]);
      arr.copyWithin(2, 0);
      expect(arr.$_get(2)).assertEqual(0.10000000149011612);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINONE_3700
     * @tc.name testFloat32ArrayCopyWithinONE037
     * @tc.desc Verify copy 1.0e40 overflows to +Infinity on construction, then preserved on copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinONE037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0e40, 0.0, 0.0]);
      arr.copyWithin(2, 0);
      expect(arr.$_get(2)).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINONE_3800
     * @tc.name testFloat32ArrayCopyWithinONE038
     * @tc.desc Verify copy 1.0e-46 underflows to +0 on construction, then preserved on copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinONE038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0e-46, 0.0, 0.0]);
      arr.copyWithin(2, 0);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINONE_3900
     * @tc.name testFloat32ArrayCopyWithinONE039
     * @tc.desc Verify target<start combination target=1 start=3 partial copy not out of bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinONE039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      arr.copyWithin(1, 3);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(1000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINONE_4000
     * @tc.name testFloat32ArrayCopyWithinONE040
     * @tc.desc Verify target>start copies binary and -1 values to the tail when copy is clamped by length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinONE040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 3.4028234663852886e+38);
      arr.copyWithin(3, 1);
      expect(arr.$_get(3)).assertEqual(10);
      expect(arr.$_get(4)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINONE_4100
     * @tc.name testFloat32ArrayCopyWithinONE041
     * @tc.desc Verify target==start no-op preserves NaN, Infinity, and negative zero values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinONE041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(NaN, Infinity, -0.0, 1.401298464324817e-45);
      const result = arr.copyWithin(2, 2);
      expect(result).assertEqual(arr);
      expect(arr.$_get(0)).assertNaN();
      expect(arr.$_get(1)).assertEqual(Infinity);
      expect(1 / arr.$_get(2)).assertEqual(-Infinity);
      expect(arr.$_get(3)).assertEqual(1.401298464324817e-45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINONE_4200
     * @tc.name testFloat32ArrayCopyWithinONE042
     * @tc.desc Verify end truncation on an offset view copies only the first two visible elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinONE042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(24);
      const arr: Float32Array = new Float32Array(buf, 4, 5);
      arr.$_set(0, 0x10);
      arr.$_set(1, 0b1010);
      arr.$_set(2, -1.0);
      arr.$_set(3, 0.0);
      arr.$_set(4, 1000000.0);
      arr.copyWithin(3, 0, 2);
      expect(arr.$_get(3)).assertEqual(16);
      expect(arr.$_get(4)).assertEqual(10);
      expect(arr.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINONE_4300
     * @tc.name testFloat32ArrayCopyWithinONE043
     * @tc.desc Verify negative target/start normalization copies Infinity from the previous visible element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinONE043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0.0, -1.0, 0x10, Infinity, -Infinity);
      arr.copyWithin(-1, -2);
      expect(arr.$_get(4)).assertEqual(Infinity);
      expect(arr.$_get(3)).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINONE_4400
     * @tc.name testFloat32ArrayCopyWithinONE044
     * @tc.desc Verify target=2 start=4 last segment single element copied to the middle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinONE044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      arr.copyWithin(2, 4);
      expect(arr.$_get(2)).assertEqual(1000000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINONE_4500
     * @tc.name testFloat32ArrayCopyWithinONE045
     * @tc.desc Verify target=0 start=0 end=0 empty range leaves the first element unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinONE045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      arr.copyWithin(0, 0, 0);
      expect(arr.$_get(0)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINONE_4600
     * @tc.name testFloat32ArrayCopyWithinONE046
     * @tc.desc Verify target=0 start=2 end=1 start>end empty range, no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinONE046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      arr.copyWithin(0, 2, 1);
      expect(arr.$_get(0)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINONE_4700
     * @tc.name testFloat32ArrayCopyWithinONE047
     * @tc.desc Verify target=0 start=0 end=-2147483648 end extremely small normalizes to 0, empty range, no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinONE047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      arr.copyWithin(0, 0, -2147483648);
      expect(arr.$_get(0)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINONE_4800
     * @tc.name testFloat32ArrayCopyWithinONE048
     * @tc.desc Verify empty array copyWithin(0,0) length remains 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinONE048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([]);
      arr.copyWithin(0, 0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINONE_4900
     * @tc.name testFloat32ArrayCopyWithinONE049
     * @tc.desc Verify single-element array copyWithin(0,0) unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinONE049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([5.0]);
      arr.copyWithin(0, 0);
      expect(arr.$_get(0)).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINONE_5000
     * @tc.name testFloat32ArrayCopyWithinONE050
     * @tc.desc Verify two-element array copyWithin(0,1) last element copied to first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinONE050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0]);
      arr.copyWithin(0, 1);
      expect(arr.$_get(0)).assertEqual(2.0);
      expect(arr.$_get(1)).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINONE_5100
     * @tc.name testFloat32ArrayCopyWithinONE051
     * @tc.desc Verify two-element array copyWithin(1,0) first element copied to last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinONE051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0]);
      arr.copyWithin(1, 0);
      expect(arr.$_get(0)).assertEqual(1.0);
      expect(arr.$_get(1)).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINONE_5200
     * @tc.name testFloat32ArrayCopyWithinONE052
     * @tc.desc Verify three-element static input copyWithin(1,0,2) copies hexadecimal and binary values to the middle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinONE052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = Float32Array.of(0x10, 0b1010, -1.0);
      arr.copyWithin(1, 0, 2);
      expect(arr.$_get(0)).assertEqual(16);
      expect(arr.$_get(1)).assertEqual(16);
      expect(arr.$_get(2)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINONE_5300
     * @tc.name testFloat32ArrayCopyWithinONE053
     * @tc.desc Verify overlapping copy where target starts inside source copies as if through a temporary list
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinONE053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0, 6.0]);
      arr.copyWithin(2, 0, 4);
      expect(arr.$_get(0)).assertEqual(1.0);
      expect(arr.$_get(1)).assertEqual(2.0);
      expect(arr.$_get(2)).assertEqual(1.0);
      expect(arr.$_get(3)).assertEqual(2.0);
      expect(arr.$_get(4)).assertEqual(3.0);
      expect(arr.$_get(5)).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINONE_5400
     * @tc.name testFloat32ArrayCopyWithinONE054
     * @tc.desc Verify overlapping copy where source starts inside target copies forward correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinONE054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Float32Array = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0, 6.0]);
      arr.copyWithin(0, 2, 6);
      expect(arr.$_get(0)).assertEqual(3.0);
      expect(arr.$_get(1)).assertEqual(4.0);
      expect(arr.$_get(2)).assertEqual(5.0);
      expect(arr.$_get(3)).assertEqual(6.0);
      expect(arr.$_get(4)).assertEqual(5.0);
      expect(arr.$_get(5)).assertEqual(6.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_COPY_WITHINONE_5500
     * @tc.name testFloat32ArrayCopyWithinONE055
     * @tc.desc Verify overlapping forward copy preserves source order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayCopyWithinONE055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      arr.copyWithin(1, 0, 4);
      expect(arr.$_get(0)).assertEqual(1.0);
      expect(arr.$_get(1)).assertEqual(1.0);
      expect(arr.$_get(2)).assertEqual(2.0);
      expect(arr.$_get(3)).assertEqual(3.0);
      expect(arr.$_get(4)).assertEqual(4.0);
    });

  });
}
