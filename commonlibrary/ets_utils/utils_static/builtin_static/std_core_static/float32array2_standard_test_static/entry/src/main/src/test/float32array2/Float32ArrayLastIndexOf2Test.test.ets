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
  beforeAll,
  afterEach,
  beforeEach,
  afterAll,
  describe,
  it,
  expect,
  TestType,
  Size,
  Level
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function Float32ArrayLastIndexOf2Test(): void {
  describe('Float32ArrayLastIndexOf2Test', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(45);
    });
    afterEach(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0100
     * @tc.name testFloat32ArrayLastIndexOfTwo001
     * @tc.desc Verify lastIndexOf finds the last matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(4.0, 5.0, 6.0, 5.0);
      const r = arr.lastIndexOf(5);
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0200
     * @tc.name testFloat32ArrayLastIndexOfTwo002
     * @tc.desc Verify lastIndexOf(9) on [4,5,6] returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(4.0, 5.0, 6.0);
      const r = arr.lastIndexOf(9);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0300
     * @tc.name testFloat32ArrayLastIndexOfTwo003
     * @tc.desc Verify lastIndexOf(NaN) on [NaN,1,2] returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(Number.NaN, 1.0, 2.0);
      const r = arr.lastIndexOf(Number.NaN);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0400
     * @tc.name testFloat32ArrayLastIndexOfTwo004
     * @tc.desc Verify lastIndexOf(1) on empty Float32Array returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of();
      const r = arr.lastIndexOf(1);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0500
     * @tc.name testFloat32ArrayLastIndexOfTwo005
     * @tc.desc Verify lastIndexOf(7) on single-element [7] returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(7.0);
      const r = arr.lastIndexOf(7);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0600
     * @tc.name testFloat32ArrayLastIndexOfTwo006
     * @tc.desc Verify lastIndexOf(5,1) on [4,5,6,5] returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(4.0, 5.0, 6.0, 5.0);
      const r = arr.lastIndexOf(5, 1);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0700
     * @tc.name testFloat32ArrayLastIndexOfTwo007
     * @tc.desc Verify lastIndexOf(Infinity) on [1,Infinity] returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, Number.POSITIVE_INFINITY);
      const r = arr.lastIndexOf(Number.POSITIVE_INFINITY);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0800
     * @tc.name testFloat32ArrayLastIndexOfTwo008
     * @tc.desc Verify lastIndexOf(-Infinity) on [-Infinity,2] returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-Number.POSITIVE_INFINITY, 2.0);
      const r = arr.lastIndexOf(-Number.POSITIVE_INFINITY);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0900
     * @tc.name testFloat32ArrayLastIndexOfTwo009
     * @tc.desc Verify lastIndexOf(5) on ArrayBuffer-based view returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new Float32Array(buf, 0, 4);
      view.$_set(2, 5);
      const r = view.lastIndexOf(5);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_1000
     * @tc.name testFloat32ArrayLastIndexOfTwo010
     * @tc.desc Verify lastIndexOf(6) on [4,5,6,5] returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(4.0, 5.0, 6.0, 5.0);
      const r = arr.lastIndexOf(6.0);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_1100
     * @tc.name testFloat32ArrayLastIndexOfTwo011
     * @tc.desc Verify lastIndexOf(4) on [4,5,6,5] returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(4.0, 5.0, 6.0, 5.0);
      const r = arr.lastIndexOf(4);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_1200
     * @tc.name testFloat32ArrayLastIndexOfTwo012
     * @tc.desc Verify lastIndexOf(6) on [4,5,6,5] returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(4.0, 5.0, 6.0, 5.0);
      const r = arr.lastIndexOf(6);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_1300
     * @tc.name testFloat32ArrayLastIndexOfTwo013
     * @tc.desc Verify lastIndexOf(5) on [5,1,5,2,5] returns last index 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(5.0, 1.0, 5.0, 2.0, 5.0);
      const r = arr.lastIndexOf(5);
      expect(r).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_1400
     * @tc.name testFloat32ArrayLastIndexOfTwo014
     * @tc.desc Verify lastIndexOf(8) on [8,8] returns last index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(8.0, 8.0);
      const r = arr.lastIndexOf(8);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_1500
     * @tc.name testFloat32ArrayLastIndexOfTwo015
     * @tc.desc Verify lastIndexOf(9) on single element [9] returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(9.0);
      const r = arr.lastIndexOf(9);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_1600
     * @tc.name testFloat32ArrayLastIndexOfTwo016
     * @tc.desc Verify lastIndexOf(5,3) on [4,5,6,5] returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(4.0, 5.0, 6.0, 5.0);
      const r = arr.lastIndexOf(5, 3);
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_1700
     * @tc.name testFloat32ArrayLastIndexOfTwo017
     * @tc.desc Verify fromIndex=0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(5.0, 4.0, 6.0, 5.0);
      const r = arr.lastIndexOf(5, 0);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_1800
     * @tc.name testFloat32ArrayLastIndexOfTwo018
     * @tc.desc Verify lastIndexOf(-2) on [-3,-1,-2] returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-3.0, -1.0, -2.0);
      const r = arr.lastIndexOf(-2);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_1900
     * @tc.name testFloat32ArrayLastIndexOfTwo019
     * @tc.desc Verify lastIndexOf(0.5) on [0.5,1.0,0.5] returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.5, 1.0, 0.5);
      const r = arr.lastIndexOf(0.5);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_2000
     * @tc.name testFloat32ArrayLastIndexOfTwo020
     * @tc.desc Verify lastIndexOf(2.5) on [2.5,1.0,2.5] returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(2.5, 1.0, 2.5);
      const r = arr.lastIndexOf(2.5);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_2100
     * @tc.name testFloat32ArrayLastIndexOfTwo021
     * @tc.desc Verify lastIndexOf(1.25) on [1.25,3.0] returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.25, 3.0);
      const r = arr.lastIndexOf(1.25);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_2200
     * @tc.name testFloat32ArrayLastIndexOfTwo022
     * @tc.desc Verify lastIndexOf(-0.5) on [-0.5,1.0,-0.5] returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-0.5, 1.0, -0.5);
      const r = arr.lastIndexOf(-0.5);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_2300
     * @tc.name testFloat32ArrayLastIndexOfTwo023
     * @tc.desc Verify lastIndexOf(0) on [1,0,2] returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 0.0, 2.0);
      const r = arr.lastIndexOf(0);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_2400
     * @tc.name testFloat32ArrayLastIndexOfTwo024
     * @tc.desc Verify +0  -0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.0, -0.0);
      const r = arr.lastIndexOf(0);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_2500
     * @tc.name testFloat32ArrayLastIndexOfTwo025
     * @tc.desc Verify -0 +0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.0, -0.0);
      const r = arr.lastIndexOf(-0);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_2600
     * @tc.name testFloat32ArrayLastIndexOfTwo026
     * @tc.desc Verify Float32.MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 3.4028234663852886e+38);
      const r = arr.lastIndexOf(3.4028234663852886e+38);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_2700
     * @tc.name testFloat32ArrayLastIndexOfTwo027
     * @tc.desc Verify 2^24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(16777216.0, 1.0);
      const r = arr.lastIndexOf(16777216);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_2800
     * @tc.name testFloat32ArrayLastIndexOfTwo028
     * @tc.desc Verify Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, Number.POSITIVE_INFINITY, 2.0);
      const r = arr.lastIndexOf(Number.POSITIVE_INFINITY);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_2900
     * @tc.name testFloat32ArrayLastIndexOfTwo029
     * @tc.desc Verify -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-Number.POSITIVE_INFINITY, 2.0, -Number.POSITIVE_INFINITY);
      const r = arr.lastIndexOf(-Number.POSITIVE_INFINITY);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_3000
     * @tc.name testFloat32ArrayLastIndexOfTwo030
     * @tc.desc Verify lastIndexOf(stored 0.1) on [1,0.1] returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 0.1);
      const stored = arr.$_get(1);
      const r = arr.lastIndexOf(stored);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_3100
     * @tc.name testFloat32ArrayLastIndexOfTwo031
     * @tc.desc Verify lastIndexOf(stored 1.1) on [1.1,2] returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.1, 2.0);
      const stored = arr.$_get(0);
      const r = arr.lastIndexOf(stored);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_3200
     * @tc.name testFloat32ArrayLastIndexOfTwo032
     * @tc.desc Verify lastIndexOf(stored MIN_VALUE) on [1.4e-45,2] returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.401298464324817e-45, 2.0);
      const stored = arr.$_get(0);
      const r = arr.lastIndexOf(stored);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_3300
     * @tc.name testFloat32ArrayLastIndexOfTwo033
     * @tc.desc Verify lastIndexOf(stored 2^24+1) on [16777217,1] returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(16777217.0, 1.0);
      const stored = arr.$_get(0);
      const r = arr.lastIndexOf(stored);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_3400
     * @tc.name testFloat32ArrayLastIndexOfTwo034
     * @tc.desc Verify lastIndexOf(stored -2^24+1) on [-16777217,1] returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-16777217.0, 1.0);
      const stored = arr.$_get(0);
      const r = arr.lastIndexOf(stored);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_3500
     * @tc.name testFloat32ArrayLastIndexOfTwo035
     * @tc.desc Verify lastIndexOf(4.0) on [4,5,6] returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(4.0, 5.0, 6.0);
      const r = arr.lastIndexOf(4.0);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_3600
     * @tc.name testFloat32ArrayLastIndexOfTwo036
     * @tc.desc Verify lastIndexOf(100) on [1,2,3] returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const r = arr.lastIndexOf(100);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_3700
     * @tc.name testFloat32ArrayLastIndexOfTwo037
     * @tc.desc Verify lastIndexOf(-100) on [1,2,3] returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const r = arr.lastIndexOf(-100);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_3800
     * @tc.name testFloat32ArrayLastIndexOfTwo038
     * @tc.desc Verify lastIndexOf(2) on [Infinity,1] returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(Number.POSITIVE_INFINITY, 1.0);
      const r = arr.lastIndexOf(2);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_3900
     * @tc.name testFloat32ArrayLastIndexOfTwo039
     * @tc.desc Verify lastIndexOf(Infinity) on [1,2,3] returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const r = arr.lastIndexOf(Number.POSITIVE_INFINITY);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_4000
     * @tc.name testFloat32ArrayLastIndexOfTwo040
     * @tc.desc Verify fromIndex=0  -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(4.0, 5.0, 6.0, 5.0);
      const r = arr.lastIndexOf(5, 0);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_4100
     * @tc.name testFloat32ArrayLastIndexOfTwo041
     * @tc.desc Verify fromIndex=-1 searches from the last element and returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(4.0, 5.0, 6.0, 7.0);
      const r = arr.lastIndexOf(5, -1);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_4200
     * @tc.name testFloat32ArrayLastIndexOfTwo042
     * @tc.desc Verify fromIndex=-2 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 5.0);
      const r = arr.lastIndexOf(5, -2);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_4300
     * @tc.name testFloat32ArrayLastIndexOfTwo043
     * @tc.desc lastIndexOf(2.0) on [NaN,1,2] returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(Number.NaN, 1.0, 2.0);
      const r = arr.lastIndexOf(2.0);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_4400
     * @tc.name testFloat32ArrayLastIndexOfTwo044
     * @tc.desc Verify NaN NaN  -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(Number.NaN, Number.NaN, 1.0);
      const r = arr.lastIndexOf(Number.NaN);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_4500
     * @tc.name testFloat32ArrayLastIndexOfTwo045
     * @tc.desc Verify  NaN NaN -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, Number.NaN);
      const r = arr.lastIndexOf(Number.NaN);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_4600
     * @tc.name testFloat32ArrayLastIndexOfTwo046
     * @tc.desc Verify  fromIndex NaN -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(Number.NaN, 1.0, 2.0);
      const r = arr.lastIndexOf(Number.NaN, 2);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_4700
     * @tc.name testFloat32ArrayLastIndexOfTwo047
     * @tc.desc Verify  NaN -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of();
      const r = arr.lastIndexOf(Number.NaN);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_4800
     * @tc.name testFloat32ArrayLastIndexOfTwo048
     * @tc.desc Verify  NaN NaN -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(Number.NaN);
      const r = arr.lastIndexOf(Number.NaN);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_4900
     * @tc.name testFloat32ArrayLastIndexOfTwo049
     * @tc.desc Verify fromIndex=-1  length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(4.0, 5.0, 6.0, 5.0);
      const r = arr.lastIndexOf(5, -1);
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_5000
     * @tc.name testFloat32ArrayLastIndexOfTwo050
     * @tc.desc Verify fromIndex=-2  length-2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(4.0, 5.0, 6.0, 5.0);
      const r = arr.lastIndexOf(6, -2);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_5100
     * @tc.name testFloat32ArrayLastIndexOfTwo051
     * @tc.desc Verify lastIndexOf(4,-4) on [4,5,6,5] returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(4.0, 5.0, 6.0, 5.0);
      const r = arr.lastIndexOf(4, -4);
      expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_5200
     * @tc.name testFloat32ArrayLastIndexOfTwo052
     * @tc.desc Verify fromIndex=-(length+1) returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(4.0, 5.0, 6.0, 5.0);
      const r = arr.lastIndexOf(5, -5);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_5300
     * @tc.name testFloat32ArrayLastIndexOfTwo053
     * @tc.desc Verify lastIndexOf(5,-3) on [4,5,6,5] returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(4.0, 5.0, 6.0, 5.0);
      const r = arr.lastIndexOf(5, -3);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_5400
     * @tc.name testFloat32ArrayLastIndexOfTwo054
     * @tc.desc Verify lastIndexOf(5,10) with fromIndex>=length returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(4.0, 5.0, 6.0, 5.0);
      const r = arr.lastIndexOf(5, 10);
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_5500
     * @tc.name testFloat32ArrayLastIndexOfTwo055
     * @tc.desc Verify lastIndexOf(5,4) with fromIndex=length returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(4.0, 5.0, 6.0, 5.0);
      const r = arr.lastIndexOf(5, 4);
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_5600
     * @tc.name testFloat32ArrayLastIndexOfTwo056
     * @tc.desc Verify lastIndexOf(5,5) with fromIndex=length+1 returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(4.0, 5.0, 6.0, 5.0);
      const r = arr.lastIndexOf(5, 5);
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_5700
     * @tc.name testFloat32ArrayLastIndexOfTwo057
     * @tc.desc Verify lastIndexOf(5.0, 2) on [4,5,6,5] returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(4.0, 5.0, 6.0, 5.0);
      const r = arr.lastIndexOf(5.0, 2);
      expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_5800
     * @tc.name testFloat32ArrayLastIndexOfTwo058
     * @tc.desc Verify lastIndexOf(6,2) on [4,5,6,5] returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(4.0, 5.0, 6.0, 5.0);
      const r = arr.lastIndexOf(6, 2);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_5900
     * @tc.name testFloat32ArrayLastIndexOfTwo059
     * @tc.desc Verify lastIndexOf(5,999) on [5,1,5,2] returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(5.0, 1.0, 5.0, 2.0);
      const r = arr.lastIndexOf(5, 999);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_6000
     * @tc.name testFloat32ArrayLastIndexOfTwo060
     * @tc.desc Verify lastIndexOf(2,3) on [5,1,5,2] returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(5.0, 1.0, 5.0, 2.0);
      const r = arr.lastIndexOf(2, 3);
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_6100
     * @tc.name testFloat32ArrayLastIndexOfTwo061
     * @tc.desc Verify lastIndexOf(2,-1) on [5,1,5,2] returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(5.0, 1.0, 5.0, 2.0);
      const r = arr.lastIndexOf(2, -1);
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_6200
     * @tc.name testFloat32ArrayLastIndexOfTwo062
     * @tc.desc Verify lastIndexOf(5) on [5,1,5,2] returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(5.0, 1.0, 5.0, 2.0);
      const r = arr.lastIndexOf(5);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_6300
     * @tc.name testFloat32ArrayLastIndexOfTwo063
     * @tc.desc Verify lastIndexOf fromIndex keeps source length and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(5.0, 1.0, 5.0, 2.0, 5.0);
      const r = arr.lastIndexOf(5, 2);
      expect(r).assertEqual(2);
      expect(arr.length).assertEqual(5);
      expect(arr.$_get(4)).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_6400
     * @tc.name testFloat32ArrayLastIndexOfTwo064
     * @tc.desc Verify lastIndexOf oversized fromIndex keeps source contents
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(4.0, 5.0, 6.0, 5.0);
      const r = arr.lastIndexOf(5, 999);
      expect(r).assertEqual(3);
      expect(arr.length).assertEqual(4);
      expect(arr.$_get(0)).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_6500
     * @tc.name testFloat32ArrayLastIndexOfTwo065
     * @tc.desc Verify byteLength 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(5.0, 1.0, 5.0, 2.0, 5.0);
      const lastIndex = arr.lastIndexOf(5);
      expect(lastIndex).assertEqual(4);
      expect(arr.byteLength).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_6600
     * @tc.name testFloat32ArrayLastIndexOfTwo066
     * @tc.desc Verify byteOffset 8 after lastIndexOf(5) on typed view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const view = new Float32Array(buf, 8, 4);
      view.$_set(0, 5);
      view.$_set(3, 5);
      const lastIndex = view.lastIndexOf(5);
      expect(lastIndex).assertEqual(3);
      expect(view.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_6700
     * @tc.name testFloat32ArrayLastIndexOfTwo067
     * @tc.desc Verify byteOffset 8 after lastIndexOf(9) on typed view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const view = new Float32Array(buf, 8, 4);
      view.$_set(0, 1);
      const lastIndex = view.lastIndexOf(9);
      expect(lastIndex).assertEqual(-1);
      expect(view.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_6800
     * @tc.name testFloat32ArrayLastIndexOfTwo068
     * @tc.desc Verify buffer unchanged after lastIndexOf(5) on ArrayBuffer view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new Float32Array(buf, 0, 4);
      view.$_set(1, 5);
      const lastIndex = view.lastIndexOf(5);
      expect(lastIndex).assertEqual(1);
      expect(view.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_6900
     * @tc.name testFloat32ArrayLastIndexOfTwo069
     * @tc.desc Verify buffer unchanged after lastIndexOf(5,2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(4.0, 5.0, 6.0, 5.0);
      const buf = arr.buffer;
      const lastIndex = arr.lastIndexOf(5, 2);
      expect(lastIndex).assertEqual(1);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_7000
     * @tc.name testFloat32ArrayLastIndexOfTwo070
     * @tc.desc Verify $_get(1) is 5 after lastIndexOf(5,1) on [4,5,6,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(4.0, 5.0, 6.0, 5.0);
      const lastIndex = arr.lastIndexOf(5, 1);
      expect(lastIndex).assertEqual(1);
      const element096 = arr.$_get(1);
      expect(element096).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_7100
     * @tc.name testFloat32ArrayLastIndexOfTwo071
     * @tc.desc Verify name is Float32Array after lastIndexOf(9)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(4.0, 5.0, 6.0);
      arr.lastIndexOf(9);
      expect(arr.name).assertEqual('Float32Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_7200
     * @tc.name testFloat32ArrayLastIndexOfTwo072
     * @tc.desc Verify BYTES_PER_ELEMENT is 4 after lastIndexOf(5) on ArrayBuffer view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new Float32Array(buf, 0, 4);
      view.$_set(0, 5);
      const r = view.lastIndexOf(5);
      expect(r).assertEqual(0);
      expect(view.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_7300
     * @tc.name testFloat32ArrayLastIndexOfTwo073
     * @tc.desc Verify lastIndexOf(5) on ArrayBuffer view with offset returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const view = new Float32Array(buf, 8, 4);
      view.$_set(0, 4);
      view.$_set(1, 5);
      view.$_set(2, 6);
      view.$_set(3, 5);
      const r = view.lastIndexOf(5);
      expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_7400
     * @tc.name testFloat32ArrayLastIndexOfTwo074
     * @tc.desc Verify lastIndexOf(9) on ArrayBuffer view returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const view = new Float32Array(buf, 8, 4);
      view.$_set(0, 4);
      view.$_set(1, 5);
      const r = view.lastIndexOf(9);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_7500
     * @tc.name testFloat32ArrayLastIndexOfTwo075
     * @tc.desc Verify length 4 after lastIndexOf(5) on ArrayBuffer view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const view = new Float32Array(buf, 8, 4);
      view.$_set(0, 5);
      const lastIndex = view.lastIndexOf(5);
      expect(lastIndex).assertEqual(0);
      expect(view.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_7600
     * @tc.name testFloat32ArrayLastIndexOfTwo076
     * @tc.desc Verify byteLength 16 after lastIndexOf(5) on ArrayBuffer view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const view = new Float32Array(buf, 8, 4);
      view.$_set(0, 5);
      const lastIndex = view.lastIndexOf(5);
      expect(lastIndex).assertEqual(0);
      expect(view.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_7700
     * @tc.name testFloat32ArrayLastIndexOfTwo077
     * @tc.desc Verify buffer.byteLength is 32 after lastIndexOf(5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const view = new Float32Array(buf, 8, 4);
      view.$_set(0, 5);
      const lastIndex = view.lastIndexOf(5);
      expect(lastIndex).assertEqual(0);
      expect(buf.byteLength).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_7800
     * @tc.name testFloat32ArrayLastIndexOfTwo078
     * @tc.desc Verify $_get(0) is 4 after lastIndexOf(5) on ArrayBuffer view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const view = new Float32Array(buf, 8, 4);
      view.$_set(0, 4);
      view.$_set(3, 5);
      const lastIndex = view.lastIndexOf(5);
      expect(lastIndex).assertEqual(3);
      const element110 = view.$_get(0);
      expect(element110).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_7900
     * @tc.name testFloat32ArrayLastIndexOfTwo079
     * @tc.desc Verify lastIndexOf(5) on subarray [5,6,5,7] returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(1.0, 2.0, 5.0, 6.0, 5.0, 7.0);
      const view = base.subarray(2, 6);
      const r = view.lastIndexOf(5);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_8000
     * @tc.name testFloat32ArrayLastIndexOfTwo080
     * @tc.desc Verify lastIndexOf(9) on subarray [5,6,5,7] returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(1.0, 2.0, 5.0, 6.0, 5.0, 7.0);
      const view = base.subarray(2, 6);
      const r = view.lastIndexOf(9);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_8100
     * @tc.name testFloat32ArrayLastIndexOfTwo081
     * @tc.desc Verify subarray byteOffset 8 after lastIndexOf(5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(1.0, 2.0, 5.0, 6.0, 5.0, 7.0);
      const view = base.subarray(2, 6);
      const lastIndex = view.lastIndexOf(5);
      expect(lastIndex).assertEqual(2);
      expect(view.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_8200
     * @tc.name testFloat32ArrayLastIndexOfTwo082
     * @tc.desc Verify subarray length 4 after lastIndexOf(5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(1.0, 2.0, 5.0, 6.0, 5.0, 7.0);
      const view = base.subarray(2, 6);
      const lastIndex = view.lastIndexOf(5);
      expect(lastIndex).assertEqual(2);
      expect(view.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_8300
     * @tc.name testFloat32ArrayLastIndexOfTwo083
     * @tc.desc Verify subarray buffer matches base buffer after lastIndexOf(5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(1.0, 2.0, 5.0, 6.0, 5.0, 7.0);
      const view = base.subarray(2, 6);
      const lastIndex = view.lastIndexOf(5);
      expect(lastIndex).assertEqual(2);
      expect(view.buffer).assertEqual(base.buffer);
    });

  });
}
