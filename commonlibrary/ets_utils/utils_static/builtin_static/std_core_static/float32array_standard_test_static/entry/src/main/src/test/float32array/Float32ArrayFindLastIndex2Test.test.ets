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

export default function Float32ArrayFindLastIndex2Test(): void {
  describe('Float32ArrayFindLastIndex2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_0100
     * @tc.name testFloat32ArrayFindLastIndexTWO001
     * @tc.desc Verify a match returns the rightmost matching index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(4.0, 5.0, 6.0);
      const result = arr.findLastIndex((value: number) => value > 4);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_0200
     * @tc.name testFloat32ArrayFindLastIndexTWO002
     * @tc.desc Verify no match returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(4.0, 5.0, 6.0);
      const result = arr.findLastIndex((value: number) => value > 2000000);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_0300
     * @tc.name testFloat32ArrayFindLastIndexTWO003
     * @tc.desc Verify an empty array returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      const result = arr.findLastIndex((value: number) => value > -2);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_0400
     * @tc.name testFloat32ArrayFindLastIndexTWO004
     * @tc.desc Verify a single-element match returns index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(7.0);
      const result = arr.findLastIndex((value: number) => value === 7);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_0500
     * @tc.name testFloat32ArrayFindLastIndexTWO005
     * @tc.desc Verify all matching elements return the last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const result = arr.findLastIndex((value: number) => value > -2);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_0600
     * @tc.name testFloat32ArrayFindLastIndexTWO006
     * @tc.desc Verify a multi-element no-match returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const result = arr.findLastIndex((value: number) => value > 2000000);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_0700
     * @tc.name testFloat32ArrayFindLastIndexTWO007
     * @tc.desc Verify a middle-element match returns index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0, 20.0, 30.0);
      const result = arr.findLastIndex((value: number) => value === 0b10100);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_0800
     * @tc.name testFloat32ArrayFindLastIndexTWO008
     * @tc.desc Verify a no-match predicate returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0, 20.0, 30.0);
      const result = arr.findLastIndex((value: number) => value === 999);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_0900
     * @tc.name testFloat32ArrayFindLastIndexTWO009
     * @tc.desc Verify a last-element match returns index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const result = arr.findLastIndex((value: number) => value === -1.0);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_1000
     * @tc.name testFloat32ArrayFindLastIndexTWO010
     * @tc.desc Verify a middle match index is a non-negative number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const result = arr.findLastIndex((value: number) => value === 0b1010);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_1100
     * @tc.name testFloat32ArrayFindLastIndexTWO011
     * @tc.desc Verify single-element no match returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(7.0);
      const result = arr.findLastIndex((value: number) => value > 7);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_1200
     * @tc.name testFloat32ArrayFindLastIndexTWO012
     * @tc.desc Verify multi-element all no match returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const result = arr.findLastIndex((value: number) => value === 1000000.0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_1300
     * @tc.name testFloat32ArrayFindLastIndexTWO013
     * @tc.desc Verify always-false predicate returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const result = arr.findLastIndex((value: number) => false);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_1400
     * @tc.name testFloat32ArrayFindLastIndexTWO014
     * @tc.desc Verify array containing NaN using equality comparison for NaN returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, NaN, 3.0);
      const result = arr.findLastIndex((value: number) => value === NaN);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_1500
     * @tc.name testFloat32ArrayFindLastIndexTWO015
     * @tc.desc Verify all Infinity array finding finite value returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(Infinity, Infinity);
      const result = arr.findLastIndex((value: number) => value === 5);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_1600
     * @tc.name testFloat32ArrayFindLastIndexTWO016
     * @tc.desc Verify all-zero array finding greater than zero returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.0, 0.0, 0.0);
      const result = arr.findLastIndex((value: number) => value > 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_1700
     * @tc.name testFloat32ArrayFindLastIndexTWO017
     * @tc.desc Verify all-negative-value array finding greater than zero returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-1.0, -2.0, -3.0);
      const result = arr.findLastIndex((value: number) => value > 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_1800
     * @tc.name testFloat32ArrayFindLastIndexTWO018
     * @tc.desc Verify predicate checking index equals length cannot match returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const result = arr.findLastIndex((value: number, index: int) => index === 3);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_1900
     * @tc.name testFloat32ArrayFindLastIndexTWO019
     * @tc.desc Verify predicate checking array.length equals 999 returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const result = arr.findLastIndex((value: number, index: int, array: Float32Array) => array.length === 999);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_2000
     * @tc.name testFloat32ArrayFindLastIndexTWO020
     * @tc.desc Verify Float32.MAX array finding a larger value returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.4028234663852886e+38);
      const result = arr.findLastIndex((value: number) => value === Infinity);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_2100
     * @tc.name testFloat32ArrayFindLastIndexTWO021
     * @tc.desc Verify 0.1 after float32 truncation using equality comparison returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.1);
      const result = arr.findLastIndex((value: number) => value === 0.1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_2200
     * @tc.name testFloat32ArrayFindLastIndexTWO022
     * @tc.desc Verify no match return value strictly equals -1 literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(2.0, 4.0, 6.0);
      const result = arr.findLastIndex((value: number) => value === 5);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_2300
     * @tc.name testFloat32ArrayFindLastIndexTWO023
     * @tc.desc Verify single-element match returns index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(9.0);
      const result = arr.findLastIndex((value: number) => value === 9);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_2400
     * @tc.name testFloat32ArrayFindLastIndexTWO024
     * @tc.desc Verify only first element matches returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(9.0, 1.0, 1.0);
      const result = arr.findLastIndex((value: number) => value > 5);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_2500
     * @tc.name testFloat32ArrayFindLastIndexTWO025
     * @tc.desc Verify only last element matches returns length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 1.0, 9.0);
      const result = arr.findLastIndex((value: number) => value > 5);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_2600
     * @tc.name testFloat32ArrayFindLastIndexTWO026
     * @tc.desc Verify only middle element matches returns middle index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 9.0, 1.0);
      const result = arr.findLastIndex((value: number) => value > 5);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_2700
     * @tc.name testFloat32ArrayFindLastIndexTWO027
     * @tc.desc Verify multiple matches returns last matching index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(9.0, 1.0, 9.0, 1.0, 9.0);
      const result = arr.findLastIndex((value: number) => value > 5);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_2800
     * @tc.name testFloat32ArrayFindLastIndexTWO028
     * @tc.desc Verify duplicate value lookup returns last occurrence index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(5.0, 5.0, 5.0);
      const result = arr.findLastIndex((value: number) => value === 5);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_2900
     * @tc.name testFloat32ArrayFindLastIndexTWO029
     * @tc.desc Verify ascending array finding greater than threshold returns last satisfying index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      const result = arr.findLastIndex((value: number) => value === 1000000.0);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_3000
     * @tc.name testFloat32ArrayFindLastIndexTWO030
     * @tc.desc Verify ascending array finding super-large threshold returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      const result = arr.findLastIndex((value: number) => value > 2000000);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_3100
     * @tc.name testFloat32ArrayFindLastIndexTWO031
     * @tc.desc Verify descending array finding less than threshold returns last satisfying index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(5.0, 4.0, 3.0, 2.0, 1.0);
      const result = arr.findLastIndex((value: number) => value < 3);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_3200
     * @tc.name testFloat32ArrayFindLastIndexTWO032
     * @tc.desc Verify negative value array finding less than zero returns last satisfying index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-1.0, -2.0, -3.0);
      const result = arr.findLastIndex((value: number) => value < 0);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_3300
     * @tc.name testFloat32ArrayFindLastIndexTWO033
     * @tc.desc Verify middle-only matching value returns that index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.0, 0.0, 1.0, 0.0);
      const result = arr.findLastIndex((value: number) => value === 1);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_3400
     * @tc.name testFloat32ArrayFindLastIndexTWO034
     * @tc.desc Verify first-element-only matching value returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 0.0, 0.0, 0.0);
      const result = arr.findLastIndex((value: number) => value === 1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_3500
     * @tc.name testFloat32ArrayFindLastIndexTWO035
     * @tc.desc Verify last-element-only matching value returns last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.0, 0.0, 0.0, 1.0);
      const result = arr.findLastIndex((value: number) => value === 1);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_3600
     * @tc.name testFloat32ArrayFindLastIndexTWO036
     * @tc.desc Verify array containing NaN using Number.isNaN match returns last NaN index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, NaN, 3.0, NaN);
      const result = arr.findLastIndex((value: number) => Number.isNaN(value));
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_3700
     * @tc.name testFloat32ArrayFindLastIndexTWO037
     * @tc.desc Verify array containing Infinity using negated isFinite match returns last non-finite index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(Infinity, 1.0, -Infinity);
      const result = arr.findLastIndex((value: number) => !Number.isFinite(value));
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_3800
     * @tc.name testFloat32ArrayFindLastIndexTWO038
     * @tc.desc Verify array containing -0 and +0 using equality comparison for 0 returns last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.0, -0.0, 0.0);
      const result = arr.findLastIndex((value: number) => value === 0);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_3900
     * @tc.name testFloat32ArrayFindLastIndexTWO039
     * @tc.desc Verify Float32.MAX first element match returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.4028234663852886e+38, 1.0);
      const result = arr.findLastIndex((value: number) => value === 3.4028234663852886e+38);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_4000
     * @tc.name testFloat32ArrayFindLastIndexTWO040
     * @tc.desc Verify Float32.MAX last element match returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 3.4028234663852886e+38);
      const result = arr.findLastIndex((value: number) => value === 3.4028234663852886e+38);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_4100
     * @tc.name testFloat32ArrayFindLastIndexTWO041
     * @tc.desc Verify 1.0e40 overflows to Infinity, finding finite value returns last finite index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0e40, 1.0);
      const result = arr.findLastIndex((value: number) => Number.isFinite(value));
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_4200
     * @tc.name testFloat32ArrayFindLastIndexTWO042
     * @tc.desc Verify 16777217 truncated to 16777216 using equality comparison matches last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(16777216.0, 16777217.0);
      const result = arr.findLastIndex((value: number) => value === 16777216);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_4300
     * @tc.name testFloat32ArrayFindLastIndexTWO043
     * @tc.desc Verify minimum positive subnormal number match returns index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 1.401298464324817e-45);
      const result = arr.findLastIndex((value: number) => value === 1.401298464324817e-45);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_4400
     * @tc.name testFloat32ArrayFindLastIndexTWO044
     * @tc.desc Verify minimum positive normal number match returns index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.1754943508222875e-38, 1.0);
      const result = arr.findLastIndex((value: number) => value === 1.1754943508222875e-38);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_4500
     * @tc.name testFloat32ArrayFindLastIndexTWO045
     * @tc.desc Verify minimum finite negative value match returns index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-3.4028234663852886e+38, 0.0);
      const result = arr.findLastIndex((value: number) => value === -3.4028234663852886e+38);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_4600
     * @tc.name testFloat32ArrayFindLastIndexTWO046
     * @tc.desc Verify predicate checking index is even returns last even index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.0, 0.0, 0.0, 0.0, 0.0);
      const result = arr.findLastIndex((value: number, index: int) => index % 2 === 0);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_4700
     * @tc.name testFloat32ArrayFindLastIndexTWO047
     * @tc.desc Verify predicate checking index equals value returns last satisfying index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.0, 1.0, 2.0, 5.0, 4.0);
      const result = arr.findLastIndex((value: number, index: int) => value === index);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_4800
     * @tc.name testFloat32ArrayFindLastIndexTWO048
     * @tc.desc Verify predicate checking array reference equals original array returns last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const result = arr.findLastIndex((value: number, index: int, array: Float32Array) => array === arr);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_4900
     * @tc.name testFloat32ArrayFindLastIndexTWO049
     * @tc.desc Verify predicate checking array.length equals 3 returns last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const result = arr.findLastIndex((value: number, index: int, array: Float32Array) => array.length === 3);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_5000
     * @tc.name testFloat32ArrayFindLastIndexTWO050
     * @tc.desc Verify predicate checking value greater than index returns last satisfying index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(5.0, 1.0, 5.0, 1.0, 5.0);
      const result = arr.findLastIndex((value: number, index: int) => value > index);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_5100
     * @tc.name testFloat32ArrayFindLastIndexTWO051
     * @tc.desc Verify predicate checking index greater than 0 returns last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const result = arr.findLastIndex((value: number, index: int) => index > 0);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_5200
     * @tc.name testFloat32ArrayFindLastIndexTWO052
     * @tc.desc Verify predicate checking index equals 0 returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const result = arr.findLastIndex((value: number, index: int) => index === 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_5300
     * @tc.name testFloat32ArrayFindLastIndexTWO053
     * @tc.desc Verify predicate checking index equals length-1 returns last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const result = arr.findLastIndex((value: number, index: int, array: Float32Array) => index === array.length - 1);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_5400
     * @tc.name testFloat32ArrayFindLastIndexTWO054
     * @tc.desc Verify length unchanged after a match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const before = arr.length;
      arr.findLastIndex((value: number) => value > 1);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_5500
     * @tc.name testFloat32ArrayFindLastIndexTWO055
     * @tc.desc Verify length unchanged after no match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const before = arr.length;
      arr.findLastIndex((value: number) => value > 2000000);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_5600
     * @tc.name testFloat32ArrayFindLastIndexTWO056
     * @tc.desc Verify length unchanged after empty array call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      const before = arr.length;
      arr.findLastIndex((value: number) => value > -2);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_5700
     * @tc.name testFloat32ArrayFindLastIndexTWO057
     * @tc.desc Verify byteLength unchanged after a match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const before = arr.byteLength;
      arr.findLastIndex((value: number) => value === 0b1010);
      expect(arr.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_5800
     * @tc.name testFloat32ArrayFindLastIndexTWO058
     * @tc.desc Verify byteLength unchanged after no match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const before = arr.byteLength;
      arr.findLastIndex((value: number) => value === 99);
      expect(arr.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_5900
     * @tc.name testFloat32ArrayFindLastIndexTWO059
     * @tc.desc Verify five-element byteLength equals 20, unchanged after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0, 0.0, 1000000.0);
      arr.findLastIndex((value: number) => value === 1000000.0);
      expect(arr.byteLength).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_6000
     * @tc.name testFloat32ArrayFindLastIndexTWO060
     * @tc.desc Verify BYTES_PER_ELEMENT still 4 after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      arr.findLastIndex((value: number) => value > -2);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_6100
     * @tc.name testFloat32ArrayFindLastIndexTWO061
     * @tc.desc Verify length unchanged after predicate throws and is caught
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const before = arr.length;
      try {
        arr.findLastIndex((value: number) => {
          throw new Error('boom');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_6200
     * @tc.name testFloat32ArrayFindLastIndexTWO062
     * @tc.desc Verify byteLength unchanged after predicate throws and is caught
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const before = arr.byteLength;
      try {
        arr.findLastIndex((value: number) => {
          throw new Error('boom');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(arr.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_6300
     * @tc.name testFloat32ArrayFindLastIndexTWO063
     * @tc.desc Verify single-element array length unchanged after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(7.0);
      const before = arr.length;
      arr.findLastIndex((value: number) => value === 7);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_6400
     * @tc.name testFloat32ArrayFindLastIndexTWO064
     * @tc.desc Verify byteLength equals length times 4 holds after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      arr.findLastIndex((value: number) => value > -2);
      expect(arr.byteLength).assertEqual(arr.length * 4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_6500
     * @tc.name testFloat32ArrayFindLastIndexTWO065
     * @tc.desc Verify first element unchanged after a match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      arr.findLastIndex((value: number) => value > 1);
      expect(arr.$_get(0)).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_6600
     * @tc.name testFloat32ArrayFindLastIndexTWO066
     * @tc.desc Verify last element unchanged after a match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      arr.findLastIndex((value: number) => value > 1);
      expect(arr.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_6700
     * @tc.name testFloat32ArrayFindLastIndexTWO067
     * @tc.desc Verify all elements unchanged after no match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      arr.findLastIndex((value: number) => value > 2000000);
      expect(arr.$_get(0)).assertEqual(16);
      expect(arr.$_get(1)).assertEqual(10);
      expect(arr.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_6800
     * @tc.name testFloat32ArrayFindLastIndexTWO068
     * @tc.desc Verify element unchanged after single-element match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(7.0);
      arr.findLastIndex((value: number) => value === 7);
      expect(arr.$_get(0)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_6900
     * @tc.name testFloat32ArrayFindLastIndexTWO069
     * @tc.desc Verify elements unchanged after predicate reads value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0, 20.0, 30.0);
      arr.findLastIndex((value: number) => value > 15);
      expect(arr.$_get(1)).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_7000
     * @tc.name testFloat32ArrayFindLastIndexTWO070
     * @tc.desc Verify elements unchanged after predicate reads index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0, 20.0, 30.0);
      arr.findLastIndex((value: number, index: int) => index > 0);
      expect(arr.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_7100
     * @tc.name testFloat32ArrayFindLastIndexTWO071
     * @tc.desc Verify elements unchanged after predicate reads array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0, 20.0, 30.0);
      arr.findLastIndex((value: number, index: int, array: Float32Array) => array.length > 0);
      expect(arr.$_get(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_7200
     * @tc.name testFloat32ArrayFindLastIndexTWO072
     * @tc.desc Verify array containing NaN element still NaN after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, NaN, 3.0);
      arr.findLastIndex((value: number) => Number.isNaN(value));
      expect(arr.$_get(1)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_7300
     * @tc.name testFloat32ArrayFindLastIndexTWO073
     * @tc.desc Verify array containing Infinity element still Infinity after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(Infinity, 1.0);
      arr.findLastIndex((value: number) => Number.isFinite(value));
      expect(arr.$_get(0)).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_7400
     * @tc.name testFloat32ArrayFindLastIndexTWO074
     * @tc.desc Verify array containing -0 element still -0 after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.0, -0.0, 0.0);
      arr.findLastIndex((value: number) => value === 0);
      expect(1 / arr.$_get(1)).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_7500
     * @tc.name testFloat32ArrayFindLastIndexTWO075
     * @tc.desc Verify Float32.MAX element unchanged after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.4028234663852886e+38, 1.0);
      arr.findLastIndex((value: number) => value === 1);
      expect(arr.$_get(0)).assertEqual(3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_7600
     * @tc.name testFloat32ArrayFindLastIndexTWO076
     * @tc.desc Verify array reference unchanged after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const refBefore = arr;
      arr.findLastIndex((value: number) => value > -2);
      expect(refBefore.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_7700
     * @tc.name testFloat32ArrayFindLastIndexTWO077
     * @tc.desc Verify duplicate value array elements unchanged after match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(5.0, 5.0, 5.0);
      arr.findLastIndex((value: number) => value === 5);
      expect(arr.$_get(2)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_7800
     * @tc.name testFloat32ArrayFindLastIndexTWO078
     * @tc.desc Verify each element unchanged after middle index match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 9.0, 1.0);
      arr.findLastIndex((value: number) => value > 5);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(9);
      expect(arr.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_7900
     * @tc.name testFloat32ArrayFindLastIndexTWO079
     * @tc.desc Verify elements unchanged after predicate throws and is caught
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      try {
        arr.findLastIndex((value: number) => {
          throw new Error('boom');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(arr.$_get(1)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_8000
     * @tc.name testFloat32ArrayFindLastIndexTWO080
     * @tc.desc Verify negative value array elements unchanged after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-1.0, -2.0, -3.0);
      arr.findLastIndex((value: number) => value < 0);
      expect(arr.$_get(2)).assertEqual(-3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_8100
     * @tc.name testFloat32ArrayFindLastIndexTWO081
     * @tc.desc Verify buffer.byteLength unchanged after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const before = arr.buffer.byteLength;
      arr.findLastIndex((value: number) => value > 1);
      expect(arr.buffer.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_8200
     * @tc.name testFloat32ArrayFindLastIndexTWO082
     * @tc.desc Verify zero-offset view byteOffset unchanged after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const before = arr.byteOffset;
      arr.findLastIndex((value: number) => value > 1);
      expect(arr.byteOffset).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_8300
     * @tc.name testFloat32ArrayFindLastIndexTWO083
     * @tc.desc Verify non-zero-offset view byteOffset unchanged after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const tmp = new Float32Array(buf);
      tmp.$_set(0, 1);
      tmp.$_set(1, 2);
      tmp.$_set(2, 3);
      tmp.$_set(3, 4);
      const view = new Float32Array(buf, 4, 2);
      const before = view.byteOffset;
      view.findLastIndex((value: number) => value > 1);
      expect(view.byteOffset).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_8400
     * @tc.name testFloat32ArrayFindLastIndexTWO084
     * @tc.desc Verify non-zero-offset view byteOffset equals 4 after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const tmp = new Float32Array(buf);
      tmp.$_set(0, 1);
      tmp.$_set(1, 2);
      tmp.$_set(2, 3);
      tmp.$_set(3, 4);
      const view = new Float32Array(buf, 4, 2);
      view.findLastIndex((value: number) => value > 2000000);
      expect(view.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_8500
     * @tc.name testFloat32ArrayFindLastIndexTWO085
     * @tc.desc Verify subarray view byteOffset unchanged after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = Float32Array.of(10.0, 20.0, 30.0, 40.0);
      const view = parent.subarray(1, 3);
      const before = view.byteOffset;
      view.findLastIndex((value: number) => value > 15);
      expect(view.byteOffset).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_8600
     * @tc.name testFloat32ArrayFindLastIndexTWO086
     * @tc.desc Verify subarray view byteOffset equals 4 after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = Float32Array.of(10.0, 20.0, 30.0, 40.0);
      const view = parent.subarray(1, 3);
      view.findLastIndex((value: number) => value > 2000000);
      expect(view.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_8700
     * @tc.name testFloat32ArrayFindLastIndexTWO087
     * @tc.desc Verify underlying buffer content unchanged after view call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const tmp = new Float32Array(buf);
      tmp.$_set(0, 1);
      tmp.$_set(1, 2);
      tmp.$_set(2, 3);
      tmp.$_set(3, 4);
      const view = new Float32Array(buf, 4, 2);
      view.findLastIndex((value: number) => value > 1);
      expect(tmp.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_8800
     * @tc.name testFloat32ArrayFindLastIndexTWO088
     * @tc.desc Verify two views sharing buffer, calling one leaves the other view's elements unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const tmp = new Float32Array(buf);
      tmp.$_set(0, 1);
      tmp.$_set(1, 2);
      tmp.$_set(2, 3);
      tmp.$_set(3, 4);
      const viewA = new Float32Array(buf, 0, 2);
      const viewB = new Float32Array(buf, 8, 2);
      viewA.findLastIndex((value: number) => value > -2);
      expect(viewB.$_get(0)).assertEqual(3);
      expect(viewB.$_get(1)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_8900
     * @tc.name testFloat32ArrayFindLastIndexTWO089
     * @tc.desc Verify subarray view and parent array sharing buffer, parent elements unchanged after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = Float32Array.of(10.0, 20.0, 30.0, 40.0);
      const view = parent.subarray(1, 3);
      view.findLastIndex((value: number) => value > 15);
      expect(parent.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_9000
     * @tc.name testFloat32ArrayFindLastIndexTWO090
     * @tc.desc Verify subarray view byteLength unchanged after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = Float32Array.of(10.0, 20.0, 30.0, 40.0);
      const view = parent.subarray(1, 3);
      const before = view.byteLength;
      view.findLastIndex((value: number) => value > 15);
      expect(view.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_9100
     * @tc.name testFloat32ArrayFindLastIndexTWO091
     * @tc.desc Verify subarray view byteLength equals 8 after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = Float32Array.of(10.0, 20.0, 30.0, 40.0);
      const view = parent.subarray(1, 3);
      view.findLastIndex((value: number) => value > 2000000);
      expect(view.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_9200
     * @tc.name testFloat32ArrayFindLastIndexTWO092
     * @tc.desc Verify view length unchanged after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const tmp = new Float32Array(buf);
      tmp.$_set(0, 1);
      tmp.$_set(1, 2);
      tmp.$_set(2, 3);
      tmp.$_set(3, 4);
      const view = new Float32Array(buf, 4, 2);
      const before = view.length;
      view.findLastIndex((value: number) => value > 1);
      expect(view.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_9300
     * @tc.name testFloat32ArrayFindLastIndexTWO093
     * @tc.desc Verify ArrayBuffer.isView still true after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      arr.findLastIndex((value: number) => value > 1);
      expect(ArrayBuffer.isView(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_9400
     * @tc.name testFloat32ArrayFindLastIndexTWO094
     * @tc.desc Verify parent array byteOffset unchanged after subarray view calls findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = Float32Array.of(10.0, 20.0, 30.0, 40.0);
      const view = parent.subarray(1, 3);
      const before = parent.byteOffset;
      view.findLastIndex((value: number) => value > 15);
      expect(parent.byteOffset).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_9500
     * @tc.name testFloat32ArrayFindLastIndexTWO095
     * @tc.desc Verify view BYTES_PER_ELEMENT still 4 after call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const tmp = new Float32Array(buf);
      tmp.$_set(0, 1);
      tmp.$_set(1, 2);
      tmp.$_set(2, 3);
      tmp.$_set(3, 4);
      const view = new Float32Array(buf, 4, 2);
      view.findLastIndex((value: number) => value > 1);
      expect(view.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_9600
     * @tc.name testFloat32ArrayFindLastIndexTWO096
     * @tc.desc Verify can still correctly write to underlying buffer after view call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const tmp = new Float32Array(buf);
      tmp.$_set(0, 1);
      tmp.$_set(1, 2);
      tmp.$_set(2, 3);
      tmp.$_set(3, 4);
      const view = new Float32Array(buf, 4, 2);
      view.findLastIndex((value: number) => value > 1);
      view.$_set(0, 99);
      expect(tmp.$_get(1)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_9700
     * @tc.name testFloat32ArrayFindLastIndexTWO097
     * @tc.desc Verify parent array length unchanged after subarray view call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = Float32Array.of(10.0, 20.0, 30.0, 40.0);
      const view = parent.subarray(1, 3);
      const before = parent.length;
      view.findLastIndex((value: number) => value > 15);
      expect(parent.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FIND_LAST_INDEXTWO_9800
     * @tc.name testFloat32ArrayFindLastIndexTWO098
     * @tc.desc Verify findLastIndex on an offset view returns the view-local index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayFindLastIndexTWO098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = Float32Array.of(1.0, 2.0, 3.0, 2.0);
      const view = parent.subarray(1, 4);
      const index = view.findLastIndex((value: number): boolean => value === 2.0);
      expect(index).assertEqual(2);
    });

  });
}
