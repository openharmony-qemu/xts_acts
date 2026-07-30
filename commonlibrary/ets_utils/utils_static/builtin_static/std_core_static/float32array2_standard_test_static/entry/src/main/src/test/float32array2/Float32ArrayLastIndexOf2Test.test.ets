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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0010
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0020
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0030
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0040
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0050
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0060
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0070
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0080
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0090
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0100
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0110
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0120
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0130
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0140
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0150
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0160
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0170
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0180
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0190
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0200
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0210
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0220
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0230
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0240
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0250
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0260
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0270
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0280
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0290
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0300
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0310
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0320
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0330
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0340
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0350
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0360
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0370
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0380
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0390
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0400
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0410
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0420
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0430
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0440
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0450
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0460
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0470
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0480
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0490
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0500
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0510
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0520
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0530
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0540
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0550
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0560
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0570
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0580
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0590
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0600
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0610
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0620
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0630
     * @tc.name testFloat32ArrayLastIndexOfTwo063
     * @tc.desc Verify lastIndexOf keeps source length after finding a match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(4.0, 5.0, 6.0, 5.0);
      const r = arr.lastIndexOf(5);
      expect(r).assertEqual(3);
      expect(arr.length).assertEqual(4);
      expect(arr.$_get(3)).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0640
     * @tc.name testFloat32ArrayLastIndexOfTwo064
     * @tc.desc Verify lastIndexOf keeps source length when no match is found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(4.0, 5.0, 6.0);
      const r = arr.lastIndexOf(9);
      expect(r).assertEqual(-1);
      expect(arr.length).assertEqual(3);
      expect(arr.$_get(1)).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0650
     * @tc.name testFloat32ArrayLastIndexOfTwo065
     * @tc.desc Verify lastIndexOf NaN keeps source contents unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(Number.NaN, 1.0, 2.0);
      const r = arr.lastIndexOf(Number.NaN);
      expect(r).assertEqual(-1);
      expect(arr.length).assertEqual(3);
      expect(arr.$_get(0)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0660
     * @tc.name testFloat32ArrayLastIndexOfTwo066
     * @tc.desc Verify lastIndexOf on empty array returns not found and keeps length zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of();
      const r = arr.lastIndexOf(1);
      expect(r).assertEqual(-1);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0670
     * @tc.name testFloat32ArrayLastIndexOfTwo067
     * @tc.desc Verify lastIndexOf fromIndex keeps source length and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(5.0, 1.0, 5.0, 2.0, 5.0);
      const r = arr.lastIndexOf(5, 2);
      expect(r).assertEqual(2);
      expect(arr.length).assertEqual(5);
      expect(arr.$_get(4)).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0680
     * @tc.name testFloat32ArrayLastIndexOfTwo068
     * @tc.desc Verify lastIndexOf single-element source remains unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(7.0);
      const r = arr.lastIndexOf(7);
      expect(r).assertEqual(0);
      expect(arr.length).assertEqual(1);
      expect(arr.$_get(0)).assertEqual(7.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0690
     * @tc.name testFloat32ArrayLastIndexOfTwo069
     * @tc.desc Verify lastIndexOf negative fromIndex keeps source contents
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(4.0, 5.0, 6.0, 5.0);
      const r = arr.lastIndexOf(5, -3);
      expect(r).assertEqual(1);
      expect(arr.length).assertEqual(4);
      expect(arr.$_get(3)).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0700
     * @tc.name testFloat32ArrayLastIndexOfTwo070
     * @tc.desc Verify lastIndexOf oversized fromIndex keeps source contents
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(4.0, 5.0, 6.0, 5.0);
      const r = arr.lastIndexOf(5, 999);
      expect(r).assertEqual(3);
      expect(arr.length).assertEqual(4);
      expect(arr.$_get(0)).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0710
     * @tc.name testFloat32ArrayLastIndexOfTwo071
     * @tc.desc Verify byteLength 16 after lastIndexOf(5) on [4,5,6,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(4.0, 5.0, 6.0, 5.0);
      const lastIndex = arr.lastIndexOf(5);
      expect(lastIndex).assertEqual(3);
      expect(arr.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0720
     * @tc.name testFloat32ArrayLastIndexOfTwo072
     * @tc.desc Verify byteLength 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(4.0, 5.0, 6.0);
      const lastIndex = arr.lastIndexOf(9);
      expect(lastIndex).assertEqual(-1);
      expect(arr.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0730
     * @tc.name testFloat32ArrayLastIndexOfTwo073
     * @tc.desc Verify byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of();
      const lastIndex = arr.lastIndexOf(1);
      expect(lastIndex).assertEqual(-1);
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0740
     * @tc.name testFloat32ArrayLastIndexOfTwo074
     * @tc.desc Verify byteLength 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(7.0);
      const lastIndex = arr.lastIndexOf(7);
      expect(lastIndex).assertEqual(0);
      expect(arr.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0750
     * @tc.name testFloat32ArrayLastIndexOfTwo075
     * @tc.desc Verify NaN  byteLength 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(Number.NaN, 1.0, 2.0);
      const lastIndex = arr.lastIndexOf(Number.NaN);
      expect(lastIndex).assertEqual(-1);
      expect(arr.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0760
     * @tc.name testFloat32ArrayLastIndexOfTwo076
     * @tc.desc Verify byteLength 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(5.0, 1.0, 5.0, 2.0, 5.0);
      const lastIndex = arr.lastIndexOf(5);
      expect(lastIndex).assertEqual(4);
      expect(arr.byteLength).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0770
     * @tc.name testFloat32ArrayLastIndexOfTwo077
     * @tc.desc Verify byteLength equals length*4 after lastIndexOf(5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(4.0, 5.0, 6.0, 5.0);
      const r = arr.lastIndexOf(5);
      expect(r).assertEqual(3);
      expect(arr.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0780
     * @tc.name testFloat32ArrayLastIndexOfTwo078
     * @tc.desc Verify byteLength equals length*4 after lastIndexOf(9)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(4.0, 5.0, 6.0);
      const r = arr.lastIndexOf(9);
      expect(r).assertEqual(-1);
      expect(arr.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0790
     * @tc.name testFloat32ArrayLastIndexOfTwo079
     * @tc.desc Verify byteOffset 0 after lastIndexOf(5) on [4,5,6,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(4.0, 5.0, 6.0, 5.0);
      const lastIndex = arr.lastIndexOf(5);
      expect(lastIndex).assertEqual(3);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0800
     * @tc.name testFloat32ArrayLastIndexOfTwo080
     * @tc.desc Verify byteOffset 0 after lastIndexOf(9) on [4,5,6]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(4.0, 5.0, 6.0);
      const lastIndex = arr.lastIndexOf(9);
      expect(lastIndex).assertEqual(-1);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0810
     * @tc.name testFloat32ArrayLastIndexOfTwo081
     * @tc.desc Verify NaN  byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(Number.NaN, 1.0, 2.0);
      const lastIndex = arr.lastIndexOf(Number.NaN);
      expect(lastIndex).assertEqual(-1);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0820
     * @tc.name testFloat32ArrayLastIndexOfTwo082
     * @tc.desc Verify byteOffset 8 after lastIndexOf(5) on typed view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const view = new Float32Array(buf, 8, 4);
      view.$_set(0, 5);
      view.$_set(3, 5);
      const lastIndex = view.lastIndexOf(5);
      expect(lastIndex).assertEqual(3);
      expect(view.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0830
     * @tc.name testFloat32ArrayLastIndexOfTwo083
     * @tc.desc Verify byteOffset 8 after lastIndexOf(9) on typed view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const view = new Float32Array(buf, 8, 4);
      view.$_set(0, 1);
      const lastIndex = view.lastIndexOf(9);
      expect(lastIndex).assertEqual(-1);
      expect(view.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0840
     * @tc.name testFloat32ArrayLastIndexOfTwo084
     * @tc.desc Verify buffer unchanged after lastIndexOf(5) on [4,5,6,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(4.0, 5.0, 6.0, 5.0);
      const buf = arr.buffer;
      const lastIndex = arr.lastIndexOf(5);
      expect(lastIndex).assertEqual(3);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0850
     * @tc.name testFloat32ArrayLastIndexOfTwo085
     * @tc.desc Verify buffer unchanged after lastIndexOf(9) on [4,5,6]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(4.0, 5.0, 6.0);
      const buf = arr.buffer;
      const lastIndex = arr.lastIndexOf(9);
      expect(lastIndex).assertEqual(-1);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0860
     * @tc.name testFloat32ArrayLastIndexOfTwo086
     * @tc.desc Verify buffer unchanged after lastIndexOf(NaN) on [NaN,1,2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(Number.NaN, 1.0, 2.0);
      const buf = arr.buffer;
      const lastIndex = arr.lastIndexOf(Number.NaN);
      expect(lastIndex).assertEqual(-1);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0870
     * @tc.name testFloat32ArrayLastIndexOfTwo087
     * @tc.desc Verify buffer unchanged after lastIndexOf(5) on ArrayBuffer view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new Float32Array(buf, 0, 4);
      view.$_set(1, 5);
      const lastIndex = view.lastIndexOf(5);
      expect(lastIndex).assertEqual(1);
      expect(view.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0880
     * @tc.name testFloat32ArrayLastIndexOfTwo088
     * @tc.desc Verify buffer unchanged after lastIndexOf(5,2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(4.0, 5.0, 6.0, 5.0);
      const buf = arr.buffer;
      const lastIndex = arr.lastIndexOf(5, 2);
      expect(lastIndex).assertEqual(1);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0890
     * @tc.name testFloat32ArrayLastIndexOfTwo089
     * @tc.desc Verify $_get(0) is 4 after lastIndexOf(5) on [4,5,6,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(4.0, 5.0, 6.0, 5.0);
      const lastIndex = arr.lastIndexOf(5);
      expect(lastIndex).assertEqual(3);
      const element089 = arr.$_get(0);
      expect(element089).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0900
     * @tc.name testFloat32ArrayLastIndexOfTwo090
     * @tc.desc Verify $_get(1) is 5 after lastIndexOf(5) on [4,5,6,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(4.0, 5.0, 6.0, 5.0);
      const lastIndex = arr.lastIndexOf(5);
      expect(lastIndex).assertEqual(3);
      const element090 = arr.$_get(1);
      expect(element090).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0910
     * @tc.name testFloat32ArrayLastIndexOfTwo091
     * @tc.desc Verify $_get(2) is 6 after lastIndexOf(5) on [4,5,6,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(4.0, 5.0, 6.0, 5.0);
      const lastIndex = arr.lastIndexOf(5);
      expect(lastIndex).assertEqual(3);
      const element091 = arr.$_get(2);
      expect(element091).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0920
     * @tc.name testFloat32ArrayLastIndexOfTwo092
     * @tc.desc Verify $_get(3) is 5 after lastIndexOf(5) on [4,5,6,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(4.0, 5.0, 6.0, 5.0);
      const lastIndex = arr.lastIndexOf(5);
      expect(lastIndex).assertEqual(3);
      const element092 = arr.$_get(3);
      expect(element092).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0930
     * @tc.name testFloat32ArrayLastIndexOfTwo093
     * @tc.desc Verify $_get(0) is 4 after lastIndexOf(9) on [4,5,6]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(4.0, 5.0, 6.0);
      const lastIndex = arr.lastIndexOf(9);
      expect(lastIndex).assertEqual(-1);
      const element093 = arr.$_get(0);
      expect(element093).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0940
     * @tc.name testFloat32ArrayLastIndexOfTwo094
     * @tc.desc Verify $_get(2) is 6 after lastIndexOf(9) on [4,5,6]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(4.0, 5.0, 6.0);
      const lastIndex = arr.lastIndexOf(9);
      expect(lastIndex).assertEqual(-1);
      const element094 = arr.$_get(2);
      expect(element094).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0950
     * @tc.name testFloat32ArrayLastIndexOfTwo095
     * @tc.desc Verify $_get(1) is 1 after lastIndexOf(NaN) on [NaN,1,2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(Number.NaN, 1.0, 2.0);
      const lastIndex = arr.lastIndexOf(Number.NaN);
      expect(lastIndex).assertEqual(-1);
      const element095 = arr.$_get(1);
      expect(element095).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0960
     * @tc.name testFloat32ArrayLastIndexOfTwo096
     * @tc.desc Verify $_get(1) is 5 after lastIndexOf(5,1) on [4,5,6,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(4.0, 5.0, 6.0, 5.0);
      const lastIndex = arr.lastIndexOf(5, 1);
      expect(lastIndex).assertEqual(1);
      const element096 = arr.$_get(1);
      expect(element096).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0970
     * @tc.name testFloat32ArrayLastIndexOfTwo097
     * @tc.desc Verify at(-1) is 5 after lastIndexOf(5) on [4,5,6,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(4.0, 5.0, 6.0, 5.0);
      const lastIndex = arr.lastIndexOf(5);
      expect(lastIndex).assertEqual(3);
      const atValue097 = arr.at(-1);
      expect(atValue097).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0980
     * @tc.name testFloat32ArrayLastIndexOfTwo098
     * @tc.desc Verify at(0) is 4 after lastIndexOf(5) on [4,5,6,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(4.0, 5.0, 6.0, 5.0);
      const lastIndex = arr.lastIndexOf(5);
      expect(lastIndex).assertEqual(3);
      const atValue098 = arr.at(0);
      expect(atValue098).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_0990
     * @tc.name testFloat32ArrayLastIndexOfTwo099
     * @tc.desc Verify element sum is 20 after lastIndexOf(5) on [4,5,6,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(4.0, 5.0, 6.0, 5.0);
      const lastIndex = arr.lastIndexOf(5);
      expect(lastIndex).assertEqual(3);
      let sum: number = 0;
      for (let __f32i = 0; __f32i < arr.length; __f32i++) {
        const v = arr.$_get(__f32i);
        sum = sum + v;
      }
      expect(sum).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_1000
     * @tc.name testFloat32ArrayLastIndexOfTwo100
     * @tc.desc Verify name is Float32Array after lastIndexOf(5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(4.0, 5.0, 6.0, 5.0);
      const lastIndex = arr.lastIndexOf(5);
      expect(lastIndex).assertEqual(3);
      expect(arr.name).assertEqual('Float32Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_1010
     * @tc.name testFloat32ArrayLastIndexOfTwo101
     * @tc.desc Verify BYTES_PER_ELEMENT is 4 after lastIndexOf(5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(4.0, 5.0, 6.0, 5.0);
      const r = arr.lastIndexOf(5);
      expect(r).assertEqual(3);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_1020
     * @tc.name testFloat32ArrayLastIndexOfTwo102
     * @tc.desc Verify name is Float32Array after lastIndexOf(9)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(4.0, 5.0, 6.0);
      arr.lastIndexOf(9);
      expect(arr.name).assertEqual('Float32Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_1030
     * @tc.name testFloat32ArrayLastIndexOfTwo103
     * @tc.desc Verify BYTES_PER_ELEMENT is 4 after lastIndexOf(5) on ArrayBuffer view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const view = new Float32Array(buf, 0, 4);
      view.$_set(0, 5);
      const r = view.lastIndexOf(5);
      expect(r).assertEqual(0);
      expect(view.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_1040
     * @tc.name testFloat32ArrayLastIndexOfTwo104
     * @tc.desc Verify lastIndexOf(5) on ArrayBuffer view with offset returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_1050
     * @tc.name testFloat32ArrayLastIndexOfTwo105
     * @tc.desc Verify lastIndexOf(9) on ArrayBuffer view returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const view = new Float32Array(buf, 8, 4);
      view.$_set(0, 4);
      view.$_set(1, 5);
      const r = view.lastIndexOf(9);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_1060
     * @tc.name testFloat32ArrayLastIndexOfTwo106
     * @tc.desc Verify length 4 after lastIndexOf(5) on ArrayBuffer view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const view = new Float32Array(buf, 8, 4);
      view.$_set(0, 5);
      const lastIndex = view.lastIndexOf(5);
      expect(lastIndex).assertEqual(0);
      expect(view.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_1070
     * @tc.name testFloat32ArrayLastIndexOfTwo107
     * @tc.desc Verify byteLength 16 after lastIndexOf(5) on ArrayBuffer view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const view = new Float32Array(buf, 8, 4);
      view.$_set(0, 5);
      const lastIndex = view.lastIndexOf(5);
      expect(lastIndex).assertEqual(0);
      expect(view.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_1080
     * @tc.name testFloat32ArrayLastIndexOfTwo108
     * @tc.desc Verify buffer.byteLength is 32 after lastIndexOf(5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const view = new Float32Array(buf, 8, 4);
      view.$_set(0, 5);
      const lastIndex = view.lastIndexOf(5);
      expect(lastIndex).assertEqual(0);
      expect(buf.byteLength).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_1090
     * @tc.name testFloat32ArrayLastIndexOfTwo109
     * @tc.desc Verify $_get(0) is 4 after lastIndexOf(5) on ArrayBuffer view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_1100
     * @tc.name testFloat32ArrayLastIndexOfTwo110
     * @tc.desc Verify lastIndexOf(5) on subarray [5,6,5,7] returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(1.0, 2.0, 5.0, 6.0, 5.0, 7.0);
      const view = base.subarray(2, 6);
      const r = view.lastIndexOf(5);
      expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_1110
     * @tc.name testFloat32ArrayLastIndexOfTwo111
     * @tc.desc Verify lastIndexOf(9) on subarray [5,6,5,7] returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(1.0, 2.0, 5.0, 6.0, 5.0, 7.0);
      const view = base.subarray(2, 6);
      const r = view.lastIndexOf(9);
      expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_1120
     * @tc.name testFloat32ArrayLastIndexOfTwo112
     * @tc.desc Verify subarray byteOffset 8 after lastIndexOf(5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(1.0, 2.0, 5.0, 6.0, 5.0, 7.0);
      const view = base.subarray(2, 6);
      const lastIndex = view.lastIndexOf(5);
      expect(lastIndex).assertEqual(2);
      expect(view.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_1130
     * @tc.name testFloat32ArrayLastIndexOfTwo113
     * @tc.desc Verify subarray length 4 after lastIndexOf(5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(1.0, 2.0, 5.0, 6.0, 5.0, 7.0);
      const view = base.subarray(2, 6);
      const lastIndex = view.lastIndexOf(5);
      expect(lastIndex).assertEqual(2);
      expect(view.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_TWO_1140
     * @tc.name testFloat32ArrayLastIndexOfTwo114
     * @tc.desc Verify subarray buffer matches base buffer after lastIndexOf(5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfTwo114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Float32Array.of(1.0, 2.0, 5.0, 6.0, 5.0, 7.0);
      const view = base.subarray(2, 6);
      const lastIndex = view.lastIndexOf(5);
      expect(lastIndex).assertEqual(2);
      expect(view.buffer).assertEqual(base.buffer);
    });

  });
}
