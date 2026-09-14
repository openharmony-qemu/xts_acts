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

export default function Float32ArrayLastIndexOf1Test(): void {
  describe('Float32ArrayLastIndexOf1Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_ONE_0100
     * @tc.name testFloat32ArrayLastIndexOfOne001
     * @tc.desc Verify lastIndexOf(2.0) on [1,2,3,2,1] returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 2.0, 1.0]);
      const idx = arr.lastIndexOf(2.0);
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_ONE_0200
     * @tc.name testFloat32ArrayLastIndexOfOne002
     * @tc.desc Verify lastIndexOf(2.0, 3) on [1,2,3,2,1] returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 2.0, 1.0]);
      const idx = arr.lastIndexOf(2.0, 3);
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_ONE_0300
     * @tc.name testFloat32ArrayLastIndexOfOne003
     * @tc.desc Verify lastIndexOf(2.0, 0) on [2,1,2] returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([2.0, 1.0, 2.0]);
      const idx = arr.lastIndexOf(2.0, 0);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_ONE_0400
     * @tc.name testFloat32ArrayLastIndexOfOne004
     * @tc.desc Verify lastIndexOf(0.0) on [1,0,2,0] returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 0.0, 2.0, 0.0]);
      const idx = arr.lastIndexOf(0.0);
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_ONE_0500
     * @tc.name testFloat32ArrayLastIndexOfOne005
     * @tc.desc Verify lastIndexOf(-0.0) on [1,0,2] returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 0.0, 2.0]);
      const idx = arr.lastIndexOf(-0.0);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_ONE_0600
     * @tc.name testFloat32ArrayLastIndexOfOne006
     * @tc.desc Verify lastIndexOf(0.0) on [1,-0,2] returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, -0.0, 2.0]);
      const idx = arr.lastIndexOf(0.0);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_ONE_0700
     * @tc.name testFloat32ArrayLastIndexOfOne007
     * @tc.desc Verify lastIndexOf(3.4028234663852886e+38) on [1.0, 3.4028234663852886e+38, 2.0] returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 3.4028234663852886e+38, 2.0]);
      const idx = arr.lastIndexOf(3.4028234663852886e+38);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_ONE_0800
     * @tc.name testFloat32ArrayLastIndexOfOne008
     * @tc.desc Verify lastIndexOf(-3.4028234663852886e+38) on [1.0, -3.4028234663852886e+38, 2.0] returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, -3.4028234663852886e+38, 2.0]);
      const idx = arr.lastIndexOf(-3.4028234663852886e+38);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_ONE_0900
     * @tc.name testFloat32ArrayLastIndexOfOne009
     * @tc.desc Verify lastIndexOf(1.1754943508222875e-38) on [0.0, 1.1754943508222875e-38, 1.0] returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.0, 1.1754943508222875e-38, 1.0]);
      const idx = arr.lastIndexOf(1.1754943508222875e-38);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_ONE_1000
     * @tc.name testFloat32ArrayLastIndexOfOne010
     * @tc.desc Verify lastIndexOf(1.401298464324817e-45) on [0.0, 1.401298464324817e-45, 1.0] returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.0, 1.401298464324817e-45, 1.0]);
      const idx = arr.lastIndexOf(1.401298464324817e-45);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_ONE_1100
     * @tc.name testFloat32ArrayLastIndexOfOne011
     * @tc.desc Verify lastIndexOf(NaN) on [1,2,3] returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const idx = arr.lastIndexOf(Number.NaN);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_ONE_1200
     * @tc.name testFloat32ArrayLastIndexOfOne012
     * @tc.desc Verify lastIndexOf(NaN) on [1,NaN,3] returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, Number.NaN, 3.0]);
      const idx = arr.lastIndexOf(Number.NaN);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_ONE_1300
     * @tc.name testFloat32ArrayLastIndexOfOne013
     * @tc.desc Verify lastIndexOf(Infinity) on [1,Infinity,2] returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, Number.POSITIVE_INFINITY, 2.0]);
      const idx = arr.lastIndexOf(Number.POSITIVE_INFINITY);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_ONE_1400
     * @tc.name testFloat32ArrayLastIndexOfOne014
     * @tc.desc Verify lastIndexOf(-Infinity) on [1,-Infinity,2] returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, -Number.POSITIVE_INFINITY, 2.0]);
      const idx = arr.lastIndexOf(-Number.POSITIVE_INFINITY);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_ONE_1500
     * @tc.name testFloat32ArrayLastIndexOfOne015
     * @tc.desc Verify lastIndexOf(arr.$_get(1)) on [0,0.1,0.2] returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.0, 0.1, 0.2]);
      const idx = arr.lastIndexOf(arr.$_get(1));
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_ONE_1600
     * @tc.name testFloat32ArrayLastIndexOfOne016
     * @tc.desc Verify lastIndexOf(arr.$_get(2)) on [0.2,0.1,0.2] returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.2, 0.1, 0.2]);
      const idx = arr.lastIndexOf(arr.$_get(2));
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_ONE_1700
     * @tc.name testFloat32ArrayLastIndexOfOne017
     * @tc.desc Verify lastIndexOf(0.3) on [0.1,0.2] returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.1, 0.2]);
      const idx = arr.lastIndexOf(0.3);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_ONE_1800
     * @tc.name testFloat32ArrayLastIndexOfOne018
     * @tc.desc Verify lastIndexOf(arr.$_get(1)) on [1,1.1,2] returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 1.1, 2.0]);
      const idx = arr.lastIndexOf(arr.$_get(1));
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_ONE_1900
     * @tc.name testFloat32ArrayLastIndexOfOne019
     * @tc.desc Verify lastIndexOf(arr.$_get(1)) on [1,1.0000001,2] returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 1.0000001, 2.0]);
      const idx = arr.lastIndexOf(arr.$_get(1));
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_ONE_2000
     * @tc.name testFloat32ArrayLastIndexOfOne020
     * @tc.desc Verify lastIndexOf(16777216) on [1.0, 16777216, 2.0] returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 16777216, 2.0]);
      const idx = arr.lastIndexOf(16777216);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_ONE_2100
     * @tc.name testFloat32ArrayLastIndexOfOne021
     * @tc.desc Verify lastIndexOf(16777216) on [16777217] returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([16777217]);
      const idx = arr.lastIndexOf(16777216);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_ONE_2200
     * @tc.name testFloat32ArrayLastIndexOfOne022
     * @tc.desc Verify lastIndexOf(16777217) on [16777217] returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([16777217]);
      const idx = arr.lastIndexOf(16777217);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_ONE_2300
     * @tc.name testFloat32ArrayLastIndexOfOne023
     * @tc.desc Verify lastIndexOf(Infinity) on [1.0e40, 1.0] returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0e40, 1.0]);
      const idx = arr.lastIndexOf(Number.POSITIVE_INFINITY);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_ONE_2400
     * @tc.name testFloat32ArrayLastIndexOfOne024
     * @tc.desc Verify lastIndexOf(1.0e40) on [1.0e40, 1.0] returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0e40, 1.0]);
      const idx = arr.lastIndexOf(1.0e40);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_ONE_2500
     * @tc.name testFloat32ArrayLastIndexOfOne025
     * @tc.desc Verify lastIndexOf(-Infinity) on [1.0, -1.0e40] returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, -1.0e40]);
      const idx = arr.lastIndexOf(-Number.POSITIVE_INFINITY);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_ONE_2600
     * @tc.name testFloat32ArrayLastIndexOfOne026
     * @tc.desc Verify lastIndexOf(0.0) on [1.0e-46, 1.0] returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0e-46, 1.0]);
      const idx = arr.lastIndexOf(0.0);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_ONE_2700
     * @tc.name testFloat32ArrayLastIndexOfOne027
     * @tc.desc Verify lastIndexOf(2147483648) on [2147483647, 1.0] returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([2147483647, 1.0]);
      const idx = arr.lastIndexOf(2147483648);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_ONE_2800
     * @tc.name testFloat32ArrayLastIndexOfOne028
     * @tc.desc Verify lastIndexOf(2147483647) on [2147483647, 1.0] returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([2147483647, 1.0]);
      const idx = arr.lastIndexOf(2147483647);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_ONE_2900
     * @tc.name testFloat32ArrayLastIndexOfOne029
     * @tc.desc Verify lastIndexOf(-2147483648) on [1.0, -2147483648, 2.0] returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, -2147483648, 2.0]);
      const idx = arr.lastIndexOf(-2147483648);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_ONE_3000
     * @tc.name testFloat32ArrayLastIndexOfOne030
     * @tc.desc Verify lastIndexOf(-1) on [1,-1,2] returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, -1.0, 2.0]);
      const idx = arr.lastIndexOf(-1);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_ONE_3100
     * @tc.name testFloat32ArrayLastIndexOfOne031
     * @tc.desc Verify lastIndexOf(0x10) on [10.0, 16.0, 20.0] returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 16.0, 20.0]);
      const idx = arr.lastIndexOf(0x10);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_ONE_3200
     * @tc.name testFloat32ArrayLastIndexOfOne032
     * @tc.desc Verify lastIndexOf(0o17) on [10.0, 15.0, 20.0] returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 15.0, 20.0]);
      const idx = arr.lastIndexOf(0o17);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_ONE_3300
     * @tc.name testFloat32ArrayLastIndexOfOne033
     * @tc.desc Verify lastIndexOf(0b1010) on [5.0, 10.0, 20.0] returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5.0, 10.0, 20.0]);
      const idx = arr.lastIndexOf(0b1010);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_ONE_3400
     * @tc.name testFloat32ArrayLastIndexOfOne034
     * @tc.desc Verify lastIndexOf(1e10) on [1.0, 1e10, 2.0] returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 1e10, 2.0]);
      const idx = arr.lastIndexOf(1e10);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_ONE_3500
     * @tc.name testFloat32ArrayLastIndexOfOne035
     * @tc.desc Verify lastIndexOf(9.0) on [1.0, 9.0, 2.0] returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 9.0, 2.0]);
      const idx = arr.lastIndexOf(9.0);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_ONE_3600
     * @tc.name testFloat32ArrayLastIndexOfOne036
     * @tc.desc Verify lastIndexOf(99.0) on [1,2,3] returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const idx = arr.lastIndexOf(99.0);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_ONE_3700
     * @tc.name testFloat32ArrayLastIndexOfOne037
     * @tc.desc Verify lastIndexOf(5.0) on [5.0, 5.0, 5.0, 5.0] returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5.0, 5.0, 5.0, 5.0]);
      const idx = arr.lastIndexOf(5.0);
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_ONE_3800
     * @tc.name testFloat32ArrayLastIndexOfOne038
     * @tc.desc Verify lastIndexOf(9.0) on [1.0, 2.0, 3.0, 4.0, 9.0] returns 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 9.0]);
      const idx = arr.lastIndexOf(9.0);
      expect(idx).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_ONE_3900
     * @tc.name testFloat32ArrayLastIndexOfOne039
     * @tc.desc Verify lastIndexOf(9.0) on [9.0, 2.0, 3.0, 4.0] returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([9.0, 2.0, 3.0, 4.0]);
      const idx = arr.lastIndexOf(9.0);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_ONE_4000
     * @tc.name testFloat32ArrayLastIndexOfOne040
     * @tc.desc Verify lastIndexOf(7.0) on [7.0, 7.0, 7.0] returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([7.0, 7.0, 7.0]);
      const idx = arr.lastIndexOf(7.0);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_ONE_4100
     * @tc.name testFloat32ArrayLastIndexOfOne041
     * @tc.desc Verify lastIndexOf(42.0) on [42.0] returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([42.0]);
      const idx = arr.lastIndexOf(42.0);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_ONE_4200
     * @tc.name testFloat32ArrayLastIndexOfOne042
     * @tc.desc Verify lastIndexOf(7.0) on [42.0] returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([42.0]);
      const idx = arr.lastIndexOf(7.0);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_ONE_4300
     * @tc.name testFloat32ArrayLastIndexOfOne043
     * @tc.desc Verify lastIndexOf(1.0) on empty array returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([]);
      const idx = arr.lastIndexOf(1.0);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_ONE_4400
     * @tc.name testFloat32ArrayLastIndexOfOne044
     * @tc.desc Verify lastIndexOf(0.5) on [0,0.5,1] returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.0, 0.5, 1.0]);
      const idx = arr.lastIndexOf(0.5);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_ONE_4500
     * @tc.name testFloat32ArrayLastIndexOfOne045
     * @tc.desc Verify lastIndexOf(-0.5) on [0,-0.5,1] returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.0, -0.5, 1.0]);
      const idx = arr.lastIndexOf(-0.5);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_ONE_4600
     * @tc.name testFloat32ArrayLastIndexOfOne046
     * @tc.desc Verify lastIndexOf(100.0) on [100,1,100] returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([100.0, 1.0, 100.0]);
      const idx = arr.lastIndexOf(100.0);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_ONE_4700
     * @tc.name testFloat32ArrayLastIndexOfOne047
     * @tc.desc Verify lastIndexOf(-100.0) on [1,-100,2] returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, -100.0, 2.0]);
      const idx = arr.lastIndexOf(-100.0);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_ONE_4800
     * @tc.name testFloat32ArrayLastIndexOfOne048
     * @tc.desc Verify lastIndexOf(1.5) on [1,1.5,2] returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 1.5, 2.0]);
      const idx = arr.lastIndexOf(1.5);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_ONE_4900
     * @tc.name testFloat32ArrayLastIndexOfOne049
     * @tc.desc Verify lastIndexOf(arr.$_get(1) on [1.0, 123456.789, 2.0] returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 123456.789, 2.0]);
      const idx = arr.lastIndexOf(arr.$_get(1));
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_ONE_5000
     * @tc.name testFloat32ArrayLastIndexOfOne050
     * @tc.desc Verify lastIndexOf(arr.$_get(1) on [1.0, -123456.789, 2.0] returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, -123456.789, 2.0]);
      const idx = arr.lastIndexOf(arr.$_get(1));
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_ONE_5100
     * @tc.name testFloat32ArrayLastIndexOfOne051
     * @tc.desc Verify lastIndexOf(arr.$_get(1) on [0.0, 1e-10, 1.0] returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.0, 1e-10, 1.0]);
      const idx = arr.lastIndexOf(arr.$_get(1));
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_ONE_5200
     * @tc.name testFloat32ArrayLastIndexOfOne052
     * @tc.desc Verify lastIndexOf(arr.$_get(1) on [0.0, -1e-10, 1.0] returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.0, -1e-10, 1.0]);
      const idx = arr.lastIndexOf(arr.$_get(1));
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_ONE_5300
     * @tc.name testFloat32ArrayLastIndexOfOne053
     * @tc.desc Verify lastIndexOf(arr.$_get(1) on [1.0, 1e20, 2.0] returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 1e20, 2.0]);
      const idx = arr.lastIndexOf(arr.$_get(1));
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_ONE_5400
     * @tc.name testFloat32ArrayLastIndexOfOne054
     * @tc.desc Verify lastIndexOf(arr.$_get(1) on [1.0, -1e20, 2.0] returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, -1e20, 2.0]);
      const idx = arr.lastIndexOf(arr.$_get(1));
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_ONE_5500
     * @tc.name testFloat32ArrayLastIndexOfOne055
     * @tc.desc Verify lastIndexOf(1024.0) on [1.0, 1024.0, 2.0] returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 1024.0, 2.0]);
      const idx = arr.lastIndexOf(1024.0);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_ONE_5600
     * @tc.name testFloat32ArrayLastIndexOfOne056
     * @tc.desc Verify lastIndexOf(arr.$_get(1) on [1.0, 3.141592653589793, 2.0] returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 3.141592653589793, 2.0]);
      const idx = arr.lastIndexOf(arr.$_get(1));
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_ONE_5700
     * @tc.name testFloat32ArrayLastIndexOfOne057
     * @tc.desc Verify lastIndexOf(5.0) on [-1.0, 5.0, -3.0, 5.0, -7.0] returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-1.0, 5.0, -3.0, 5.0, -7.0]);
      const idx = arr.lastIndexOf(5.0);
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_ONE_5800
     * @tc.name testFloat32ArrayLastIndexOfOne058
     * @tc.desc Verify lastIndexOf(0.0) on [0.0, 0.0, 0.0, 0.0] returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.0, 0.0, 0.0, 0.0]);
      const idx = arr.lastIndexOf(0.0);
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_ONE_5900
     * @tc.name testFloat32ArrayLastIndexOfOne059
     * @tc.desc Verify lastIndexOf(2.0) on [1,2] returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      const idx = arr.lastIndexOf(2.0);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_ONE_6000
     * @tc.name testFloat32ArrayLastIndexOfOne060
     * @tc.desc Verify lastIndexOf(99.0) on 100-element array [0..99] returns 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const data: number[] = [];
      for (let i = 0; i < 100; i++) {
        data.push(i * 1.0);
      }
      const arr = new Float32Array(data);
      const idx = arr.lastIndexOf(99.0);
      expect(idx).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_ONE_6100
     * @tc.name testFloat32ArrayLastIndexOfOne061
     * @tc.desc Verify lastIndexOf(2.0) on [2.0, 1.0, 2.0, 1.0, 2.0] returns 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([2.0, 1.0, 2.0, 1.0, 2.0]);
      const idx = arr.lastIndexOf(2.0);
      expect(idx).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_ONE_6200
     * @tc.name testFloat32ArrayLastIndexOfOne062
     * @tc.desc Verify lastIndexOf(0.0009765625) on [0.0, 0.0009765625, 1.0] returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.0, 0.0009765625, 1.0]);
      const idx = arr.lastIndexOf(0.0009765625);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_ONE_6300
     * @tc.name testFloat32ArrayLastIndexOfOne063
     * @tc.desc Verify lastIndexOf(1.0e3) on [1.0, 1000.0, 2.0] returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 1000.0, 2.0]);
      const idx = arr.lastIndexOf(1.0e3);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_ONE_6400
     * @tc.name testFloat32ArrayLastIndexOfOne064
     * @tc.desc Verify lastIndexOf(0o77) on [1.0, 63.0, 2.0] returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 63.0, 2.0]);
      const idx = arr.lastIndexOf(0o77);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_ONE_6500
     * @tc.name testFloat32ArrayLastIndexOfOne065
     * @tc.desc Verify lastIndexOf(0b11111111) on [1.0, 255.0, 2.0] returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 255.0, 2.0]);
      const idx = arr.lastIndexOf(0b11111111);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_ONE_6600
     * @tc.name testFloat32ArrayLastIndexOfOne066
     * @tc.desc Verify lastIndexOf(0x7F) on [1.0, 127.0, 2.0] returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 127.0, 2.0]);
      const idx = arr.lastIndexOf(0x7F);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_ONE_6700
     * @tc.name testFloat32ArrayLastIndexOfOne067
     * @tc.desc Verify lastIndexOf(1.401298464324817e-45) on [1.401298464324817e-45, 1.0, 1.401298464324817e-45] returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.401298464324817e-45, 1.0, 1.401298464324817e-45]);
      const idx = arr.lastIndexOf(1.401298464324817e-45);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_ONE_6800
     * @tc.name testFloat32ArrayLastIndexOfOne068
     * @tc.desc Verify lastIndexOf(3.0) on [1.0, 2.0, 3.0, 2.0, 1.0] returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 2.0, 1.0]);
      const idx = arr.lastIndexOf(3.0);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_ONE_6900
     * @tc.name testFloat32ArrayLastIndexOfOne069
     * @tc.desc Verify lastIndexOf(2.0, 0) on [1.0, 2.0, 3.0, 2.0, 1.0] returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 2.0, 1.0]);
      const idx = arr.lastIndexOf(2.0, 0);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_ONE_7000
     * @tc.name testFloat32ArrayLastIndexOfOne070
     * @tc.desc Verify lastIndexOf(2.0, 1) on [1.0, 2.0, 3.0, 2.0, 1.0] returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 2.0, 1.0]);
      const idx = arr.lastIndexOf(2.0, 1);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_ONE_7100
     * @tc.name testFloat32ArrayLastIndexOfOne071
     * @tc.desc Verify lastIndexOf(2.0, 2) on [1.0, 2.0, 3.0, 2.0, 1.0] returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 2.0, 1.0]);
      const idx = arr.lastIndexOf(2.0, 2);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_ONE_7200
     * @tc.name testFloat32ArrayLastIndexOfOne072
     * @tc.desc Verify lastIndexOf(2.0, -1) on [1.0, 2.0, 3.0, 2.0, 1.0] returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 2.0, 1.0]);
      const idx = arr.lastIndexOf(2.0, -1);
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_ONE_7300
     * @tc.name testFloat32ArrayLastIndexOfOne073
     * @tc.desc Verify lastIndexOf(2.0, 4) on [1.0, 2.0, 3.0, 2.0, 1.0] returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 2.0, 1.0]);
      const idx = arr.lastIndexOf(2.0, 4);
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_ONE_7400
     * @tc.name testFloat32ArrayLastIndexOfOne074
     * @tc.desc Verify lastIndexOf(2.0, 5) on [1.0, 2.0, 3.0, 2.0, 1.0] returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfOne074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 2.0, 1.0]);
      const idx = arr.lastIndexOf(2.0, 5);
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_LAST_INDEX_OF_ONE_7500
     * @tc.name testFloat32ArrayLastIndexOfOne075
     * @tc.desc Verify lastIndexOf(2.0, 6) on [1.0, 2.0, 3.0, 2.0, 1.0] returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayLastIndexOfOne075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 2.0, 1.0]);
      const idx = arr.lastIndexOf(2.0, 6);
      expect(idx).assertEqual(3);
    });

  });
}
