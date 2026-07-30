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

export default function Float32ArraySlice2Test(): void {
  describe('Float32ArraySlice2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0010
     * @tc.name testFloat32ArraySliceTwo001
     * @tc.desc Verify slice() Float32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const r = arr.slice();
      expect(r.length).assertEqual(3);
      expect(r.at(0)).assertEqual(1.0);
      expect(r.at(2)).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0020
     * @tc.name testFloat32ArraySliceTwo002
     * @tc.desc Verify slice(0) Float32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5.0, 6.0, 7.0, 8.0]);
      const r = arr.slice(0);
      expect(r.length).assertEqual(4);
      expect(r.at(0)).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0030
     * @tc.name testFloat32ArraySliceTwo003
     * @tc.desc Verify slice(1,3) Float32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 20.0, 30.0, 40.0, 50.0]);
      const r = arr.slice(1, 3);
      expect(r.length).assertEqual(2);
      expect(r.at(0)).assertEqual(20.0);
      expect(r.at(1)).assertEqual(30.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0040
     * @tc.name testFloat32ArraySliceTwo004
     * @tc.desc Verify slice(-2) Float32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.5, 2.5, 3.5, 4.5]);
      const r = arr.slice(-2);
      expect(r.length).assertEqual(2);
      expect(r.at(0)).assertEqual(3.5);
      expect(r.at(1)).assertEqual(4.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0050
     * @tc.name testFloat32ArraySliceTwo005
     * @tc.desc Verify slice(0,-1) Float32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const r = arr.slice(0, -1);
      expect(r.length).assertEqual(3);
      expect(r.at(2)).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0060
     * @tc.name testFloat32ArraySliceTwo006
     * @tc.desc Verify slice(0,1) on [1.0,2.0] returns an independent copy with length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      const r = arr.slice(0, 1);
      expect(r.length).assertEqual(1);
      expect(r.at(0)).assertEqual(1.0);
      r.$_set(0, 9.0);
      expect(arr.$_get(0)).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0070
     * @tc.name testFloat32ArraySliceTwo007
     * @tc.desc Verify slice() Float32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      const r = arr.slice();
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0080
     * @tc.name testFloat32ArraySliceTwo008
     * @tc.desc Verify slice buffer ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const r = arr.slice(0, 2);
      expect(r.buffer.byteLength).assertEqual(8);
      expect(r.at(1)).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0090
     * @tc.name testFloat32ArraySliceTwo009
     * @tc.desc Verify slice(0,1) Float32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([9.0, 8.0, 7.0]);
      const r = arr.slice(0, 1);
      expect(r.length).assertEqual(1);
      expect(r.at(0)).assertEqual(9.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0100
     * @tc.name testFloat32ArraySliceTwo010
     * @tc.desc Verify slice(2,2) Float32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const r = arr.slice(2, 2);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0110
     * @tc.name testFloat32ArraySliceTwo011
     * @tc.desc Verify slice BYTES_PER_ELEMENT 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const r = arr.slice(0, 2);
      expect(r.BYTES_PER_ELEMENT).assertEqual(4);
      expect(r.length).assertEqual(2);
      expect(r.at(0)).assertEqual(1.0);
      expect(r.at(1)).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0120
     * @tc.name testFloat32ArraySliceTwo012
     * @tc.desc Verify slice(10) Float32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const r = arr.slice(10);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0130
     * @tc.name testFloat32ArraySliceTwo013
     * @tc.desc Verify slice NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([Number.NaN]);
      const r = arr.slice(0, 1);
      const atValue013 = r.at(0);
      expect(atValue013).assertNaN();
      expect(r.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0140
     * @tc.name testFloat32ArraySliceTwo014
     * @tc.desc Verify slice Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([Number.POSITIVE_INFINITY]);
      const r = arr.slice(0);
      const atValue014 = r.at(0);
      expect(atValue014).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0150
     * @tc.name testFloat32ArraySliceTwo015
     * @tc.desc Verify slice -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-Number.POSITIVE_INFINITY]);
      const r = arr.slice(0, 1);
      const atValue015 = r.at(0);
      expect(atValue015).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0160
     * @tc.name testFloat32ArraySliceTwo016
     * @tc.desc Verify slice +0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.0]);
      const r = arr.slice(0, 1);
      const element016 = 1 / r.$_get(0);
      expect(element016).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0170
     * @tc.name testFloat32ArraySliceTwo017
     * @tc.desc Verify slice -0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-0.0]);
      const r = arr.slice(0, 1);
      const element017 = 1 / r.$_get(0);
      expect(element017).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0180
     * @tc.name testFloat32ArraySliceTwo018
     * @tc.desc Verify slice Float32 3.4028234663852886e+38
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.4028234663852886e+38]);
      const r = arr.slice(0);
      const atValue018 = r.at(0);
      expect(atValue018).assertEqual(3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0190
     * @tc.name testFloat32ArraySliceTwo019
     * @tc.desc Verify slice -3.4028234663852886e+38
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-3.4028234663852886e+38]);
      const r = arr.slice(0, 1);
      const atValue019 = r.at(0);
      expect(atValue019).assertEqual(-3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0200
     * @tc.name testFloat32ArraySliceTwo020
     * @tc.desc Verify slice 1.1754943508222875e-38
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.1754943508222875e-38]);
      const r = arr.slice(0, 1);
      const atValue020 = r.at(0);
      expect(atValue020).assertEqual(1.1754943508222875e-38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0210
     * @tc.name testFloat32ArraySliceTwo021
     * @tc.desc Verify slice 1.401298464324817e-45
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.401298464324817e-45]);
      const r = arr.slice(0, 1);
      const atValue021 = r.at(0);
      expect(atValue021).assertEqual(1.401298464324817e-45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0220
     * @tc.name testFloat32ArraySliceTwo022
     * @tc.desc Verify slice 0.1 float32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.1]);
      const r = arr.slice(0, 1);
      const atValue022 = r.at(0);
      expect(atValue022).assertEqual(0.10000000149011612);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0230
     * @tc.name testFloat32ArraySliceTwo023
     * @tc.desc Verify slice 0.2 float32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.2]);
      const r = arr.slice(0, 1);
      const atValue023 = r.at(0);
      expect(atValue023).assertEqual(0.20000000298023224);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0240
     * @tc.name testFloat32ArraySliceTwo024
     * @tc.desc Verify slice 0.3 float32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.3]);
      const r = arr.slice(0, 1);
      const atValue024 = r.at(0);
      expect(atValue024).assertEqual(0.30000001192092896);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0250
     * @tc.name testFloat32ArraySliceTwo025
     * @tc.desc Verify slice 2^24 16777216
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([16777216.0]);
      const r = arr.slice(0, 1);
      const atValue025 = r.at(0);
      expect(atValue025).assertEqual(16777216.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0260
     * @tc.name testFloat32ArraySliceTwo026
     * @tc.desc Verify slice 16777217 16777216
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([16777217.0]);
      const r = arr.slice(0, 1);
      const atValue026 = r.at(0);
      expect(atValue026).assertEqual(16777216.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0270
     * @tc.name testFloat32ArraySliceTwo027
     * @tc.desc Verify slice 1.0e40 Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0e40]);
      const r = arr.slice(0, 1);
      const atValue027 = r.at(0);
      expect(atValue027).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0280
     * @tc.name testFloat32ArraySliceTwo028
     * @tc.desc Verify slice -1.0e40 -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-1.0e40]);
      const r = arr.slice(0, 1);
      const atValue028 = r.at(0);
      expect(atValue028).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0290
     * @tc.name testFloat32ArraySliceTwo029
     * @tc.desc Verify slice 1.0e-46 +0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0e-46]);
      const r = arr.slice(0, 1);
      const element029 = 1 / r.$_get(0);
      expect(element029).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0300
     * @tc.name testFloat32ArraySliceTwo030
     * @tc.desc Verify slice 1.0000001 float32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0000001]);
      const r = arr.slice(0, 1);
      const atValue030 = r.at(0);
      expect(atValue030).assertEqual(1.0000001192092896);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0310
     * @tc.name testFloat32ArraySliceTwo031
     * @tc.desc Verify slice -1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-1.0]);
      const r = arr.slice(0, 1);
      const atValue031 = r.at(0);
      expect(atValue031).assertEqual(-1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0320
     * @tc.name testFloat32ArraySliceTwo032
     * @tc.desc Verify slice int 2147483647 2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([2147483647.0]);
      const r = arr.slice(0, 1);
      const atValue032 = r.at(0);
      expect(atValue032).assertEqual(2147483648.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0330
     * @tc.name testFloat32ArraySliceTwo033
     * @tc.desc Verify slice int -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-2147483648.0]);
      const r = arr.slice(0, 1);
      const atValue033 = r.at(0);
      expect(atValue033).assertEqual(-2147483648.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0340
     * @tc.name testFloat32ArraySliceTwo034
     * @tc.desc Verify slice 9.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([9.0]);
      const r = arr.slice(0, 1);
      const atValue034 = r.at(0);
      expect(atValue034).assertEqual(9.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0350
     * @tc.name testFloat32ArraySliceTwo035
     * @tc.desc Verify slice 1.0e3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0e3]);
      const r = arr.slice(0, 1);
      const atValue035 = r.at(0);
      expect(atValue035).assertEqual(1000.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0360
     * @tc.name testFloat32ArraySliceTwo036
     * @tc.desc Verify slice(1,4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 20.0, 30.0, 40.0]);
      const r = arr.slice(1, 4);
      const atValue036 = r.at(0);
      expect(atValue036).assertEqual(20.0);
      const atValue036Part2 = r.at(2);
      expect(atValue036Part2).assertEqual(40.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0370
     * @tc.name testFloat32ArraySliceTwo037
     * @tc.desc Verify slice(-2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const r = arr.slice(-2);
      const atValue037 = r.at(0);
      expect(atValue037).assertEqual(4.0);
      const atValue037Part2 = r.at(1);
      expect(atValue037Part2).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0380
     * @tc.name testFloat32ArraySliceTwo038
     * @tc.desc Verify slice(1,-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 20.0, 30.0, 40.0, 50.0]);
      const r = arr.slice(1, -1);
      const atValue038 = r.at(1);
      expect(atValue038).assertEqual(30.0);
      expect(r.$_get(0)).assertEqual(20.0);
      expect(r.$_get(2)).assertEqual(40.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0390
     * @tc.name testFloat32ArraySliceTwo039
     * @tc.desc Verify slice(0,0) at(0) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const r = arr.slice(0, 0);
      const atValue039 = r.at(0);
      expect(atValue039).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0400
     * @tc.name testFloat32ArraySliceTwo040
     * @tc.desc Verify slice(2,1) begin end at(0) undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const r = arr.slice(2, 1);
      const atValue040 = r.at(0);
      expect(atValue040).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0410
     * @tc.name testFloat32ArraySliceTwo041
     * @tc.desc Verify slice(0,length)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const r = arr.slice(0, arr.length);
      const atValue041 = r.at(4);
      expect(atValue041).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0420
     * @tc.name testFloat32ArraySliceTwo042
     * @tc.desc Verify slice(2) length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const r = arr.slice(2);
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0430
     * @tc.name testFloat32ArraySliceTwo043
     * @tc.desc Verify slice(-2) length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const r = arr.slice(-2);
      expect(r.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0440
     * @tc.name testFloat32ArraySliceTwo044
     * @tc.desc Verify slice(1,1) length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const r = arr.slice(1, 1);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0450
     * @tc.name testFloat32ArraySliceTwo045
     * @tc.desc Verify slice(0,100) end length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const r = arr.slice(0, 100);
      expect(r.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0460
     * @tc.name testFloat32ArraySliceTwo046
     * @tc.desc Verify slice(-100) begin length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const r = arr.slice(-100);
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0470
     * @tc.name testFloat32ArraySliceTwo047
     * @tc.desc Verify slice(0,-100) end length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const r = arr.slice(0, -100);
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0480
     * @tc.name testFloat32ArraySliceTwo048
     * @tc.desc Verify slice(0,3) byteLength 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const r = arr.slice(0, 3);
      expect(r.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0490
     * @tc.name testFloat32ArraySliceTwo049
     * @tc.desc Verify slice(0,0) byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const r = arr.slice(0, 0);
      expect(r.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0500
     * @tc.name testFloat32ArraySliceTwo050
     * @tc.desc Verify slice(-2) byteLength 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const r = arr.slice(-2);
      expect(r.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0510
     * @tc.name testFloat32ArraySliceTwo051
     * @tc.desc Verify slice(1,3) byteLength 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 20.0, 30.0, 40.0]);
      const r = arr.slice(1, 3);
      expect(r.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0520
     * @tc.name testFloat32ArraySliceTwo052
     * @tc.desc Verify slice byteOffset 0 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const r = arr.slice(1, 3);
      expect(r.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0530
     * @tc.name testFloat32ArraySliceTwo053
     * @tc.desc Verify slice byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(20);
      const arr = new Float32Array(buf, 8, 3);
      arr.$_set(0, 1.0);
      arr.$_set(1, 2.0);
      arr.$_set(2, 3.0);
      const r = arr.slice(0, 2);
      expect(r.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0540
     * @tc.name testFloat32ArraySliceTwo054
     * @tc.desc Verify slice buffer.byteLength length 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0, 6.0]);
      const r = arr.slice(1, 4);
      expect(r.buffer.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0550
     * @tc.name testFloat32ArraySliceTwo055
     * @tc.desc Verify slice(2,6) length end begin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0]);
      const r = arr.slice(2, 6);
      expect(r.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0560
     * @tc.name testFloat32ArraySliceTwo056
     * @tc.desc Verify slice() length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const r = arr.slice();
      expect(r.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0570
     * @tc.name testFloat32ArraySliceTwo057
     * @tc.desc Verify slice(1,2) length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const r = arr.slice(1, 2);
      expect(r.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0580
     * @tc.name testFloat32ArraySliceTwo058
     * @tc.desc Verify slice length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const result = arr.slice(0, 2);
      expect(arr.length).assertEqual(5);
      expect(result.length).assertEqual(2);
      expect(result.$_get(0)).assertEqual(1.0);
      expect(result.$_get(1)).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0590
     * @tc.name testFloat32ArraySliceTwo059
     * @tc.desc Verify slice byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const result = arr.slice(1, 3);
      expect(arr.byteLength).assertEqual(16);
      expect(result.byteLength).assertEqual(8);
      expect(result.$_get(0)).assertEqual(2.0);
      expect(result.$_get(1)).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0600
     * @tc.name testFloat32ArraySliceTwo060
     * @tc.desc Verify slice byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(24);
      const arr = new Float32Array(buf, 4, 5);
      arr.$_set(0, 11.0);
      arr.$_set(1, 22.0);
      const result = arr.slice(0, 2);
      expect(arr.byteOffset).assertEqual(4);
      expect(result.byteOffset).assertEqual(0);
      expect(result.length).assertEqual(2);
      expect(result.$_get(0)).assertEqual(11.0);
      expect(result.$_get(1)).assertEqual(22.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0610
     * @tc.name testFloat32ArraySliceTwo061
     * @tc.desc Verify slice(0,2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const result = arr.slice(0, 2);
      const atValue061 = result.at(0);
      expect(atValue061).assertEqual(1.0);
      expect(result.at(1)).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0620
     * @tc.name testFloat32ArraySliceTwo062
     * @tc.desc Verify slice(0,2) returns a copy; modifying the copy does not affect the original array element at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const r = arr.slice(0, 2);
      r.$_set(0, 99.0);
      const atValue065 = arr.at(0);
      expect(atValue065).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0630
     * @tc.name testFloat32ArraySliceTwo063
     * @tc.desc Verify slice(0,2) returns a copy; modifying the copy element at index 1 does not affect original array element at index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const r = arr.slice(0, 2);
      r.$_set(1, 88.0);
      const atValue066 = arr.at(1);
      expect(atValue066).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0640
     * @tc.name testFloat32ArraySliceTwo064
     * @tc.desc Verify $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5.0, 6.0, 7.0]);
      const r = arr.slice(0, 3);
      r.$_set(0, 100.0);
      const atValue067 = arr.at(0);
      expect(atValue067).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0650
     * @tc.name testFloat32ArraySliceTwo065
     * @tc.desc Verify fill on slice does not mutate original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const r = arr.slice(0, 3);
      r.fill(0.0);
      const atValue068 = arr.at(2);
      expect(atValue068).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0660
     * @tc.name testFloat32ArraySliceTwo066
     * @tc.desc Verify reverse on slice does not mutate original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const r = arr.slice(0, 5);
      r.reverse();
      const atValue069 = arr.at(0);
      expect(atValue069).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0670
     * @tc.name testFloat32ArraySliceTwo067
     * @tc.desc Verify sort on slice does not mutate original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([5.0, 3.0, 1.0, 4.0, 2.0]);
      const r = arr.slice(0, 5);
      r.sort();
      const atValue070 = arr.at(0);
      expect(atValue070).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0680
     * @tc.name testFloat32ArraySliceTwo068
     * @tc.desc Verify copyWithin on slice does not mutate original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 20.0, 30.0, 40.0, 50.0]);
      const r = arr.slice(0, 5);
      r.copyWithin(0, 3, 5);
      const atValue071 = arr.at(0);
      expect(atValue071).assertEqual(10.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0690
     * @tc.name testFloat32ArraySliceTwo069
     * @tc.desc Verify set on slice does not mutate original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const r = arr.slice(0, 2);
      r.set([99.0, 88.0]);
      const atValue072 = arr.at(1);
      expect(atValue072).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0700
     * @tc.name testFloat32ArraySliceTwo070
     * @tc.desc Verify two slices share no buffer (deep copy)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const r1 = arr.slice(0, 2);
      const r2 = arr.slice(0, 2);
      r1.$_set(0, 99.0);
      const atValue073 = r2.at(0);
      expect(atValue073).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0710
     * @tc.name testFloat32ArraySliceTwo071
     * @tc.desc Verify slice at(-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 20.0, 30.0, 40.0]);
      const result = arr.slice(1, 3);
      const atValue074 = result.at(-1);
      expect(atValue074).assertEqual(30.0);
      expect(result.at(0)).assertEqual(20.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0720
     * @tc.name testFloat32ArraySliceTwo072
     * @tc.desc Verify fill on slice does not affect original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const r = arr.slice(0, 4);
      r.fill(0.0);
      const atValue075 = arr.at(3);
      expect(atValue075).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0730
     * @tc.name testFloat32ArraySliceTwo073
     * @tc.desc Verify byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const r = arr.slice(0, 2);
      r.$_set(0, 99.0);
      expect(arr.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0740
     * @tc.name testFloat32ArraySliceTwo074
     * @tc.desc Verify length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const r = arr.slice(0, 2);
      r.$_set(0, 99.0);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0750
     * @tc.name testFloat32ArraySliceTwo075
     * @tc.desc Verify slice Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([Number.POSITIVE_INFINITY, 2.0]);
      const result = arr.slice(0, 1);
      const atValue078 = result.at(0);
      expect(atValue078).assertEqual(Number.POSITIVE_INFINITY);
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0760
     * @tc.name testFloat32ArraySliceTwo076
     * @tc.desc Verify slice -0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-0.0, 2.0]);
      const result = arr.slice(0, 1);
      const element079 = 1 / result.$_get(0);
      expect(element079).assertEqual(-Number.POSITIVE_INFINITY);
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0770
     * @tc.name testFloat32ArraySliceTwo077
     * @tc.desc Verify slice slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const r = arr.slice(0, 3).slice(1);
      const atValue080 = r.at(0);
      expect(atValue080).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0780
     * @tc.name testFloat32ArraySliceTwo078
     * @tc.desc Verify chain slice().slice() copies elements correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const r = arr.slice().slice();
      const atValue081 = r.at(2);
      expect(atValue081).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0790
     * @tc.name testFloat32ArraySliceTwo079
     * @tc.desc Verify slice length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 20.0, 30.0, 40.0]);
      const r = arr.slice(0, 4).slice(1, 3);
      expect(r.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0800
     * @tc.name testFloat32ArraySliceTwo080
     * @tc.desc Verify slice Float32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const r = arr.slice(0, 3).slice(0, 2);
      expect(r.length).assertEqual(2);
      expect(r.at(0)).assertEqual(1.0);
      expect(r.at(1)).assertEqual(2.0);
      arr.$_set(0, 9.0);
      expect(r.$_get(0)).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0810
     * @tc.name testFloat32ArraySliceTwo081
     * @tc.desc Verify fill on full slice does not affect original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([7.0, 8.0, 9.0]);
      const r = arr.slice(0, arr.length);
      r.fill(0.0);
      const atValue084 = arr.at(0);
      expect(atValue084).assertEqual(7.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0820
     * @tc.name testFloat32ArraySliceTwo082
     * @tc.desc Verify slice(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const r = arr.slice(0);
      r.$_set(1, 55.0);
      const atValue085 = arr.at(1);
      expect(atValue085).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0830
     * @tc.name testFloat32ArraySliceTwo083
     * @tc.desc Verify triple chain slice() returns correct element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0, 6.0]);
      const r = arr.slice(0, 6).slice(1, 5).slice(1, 3);
      const atValue086 = r.at(0);
      expect(atValue086).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0840
     * @tc.name testFloat32ArraySliceTwo084
     * @tc.desc Verify slice(-1) on subarray returns last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const r = arr.slice(0, 4).slice(-1);
      const atValue087 = r.at(0);
      expect(atValue087).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0850
     * @tc.name testFloat32ArraySliceTwo085
     * @tc.desc Verify slice(0, 2) returns an independent copy with length 2 and elements 1.0, 2.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const r = arr.slice(0, 2);
      expect(r.length).assertEqual(2);
      expect(r.at(0)).assertEqual(1.0);
      expect(r.at(1)).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0860
     * @tc.name testFloat32ArraySliceTwo086
     * @tc.desc Verify buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const r = arr.slice(0, 3);
      r.$_set(0, 99.0);
      const atValue089 = arr.at(0);
      expect(atValue089).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0870
     * @tc.name testFloat32ArraySliceTwo087
     * @tc.desc Verify slice buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const r1 = arr.slice(0, 3);
      const r2 = arr.slice(0, 3);
      r1.$_set(0, 99.0);
      const atValue091 = r2.at(0);
      expect(atValue091).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0880
     * @tc.name testFloat32ArraySliceTwo088
     * @tc.desc Verify slice byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Float32Array(buf, 4, 3);
      arr.$_set(0, 1.0);
      arr.$_set(1, 2.0);
      arr.$_set(2, 3.0);
      const r = arr.slice(0, 2);
      expect(r.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0890
     * @tc.name testFloat32ArraySliceTwo089
     * @tc.desc Verify slice ArrayBuffer byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const r = arr.slice(1, 4);
      expect(r.buffer.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0900
     * @tc.name testFloat32ArraySliceTwo090
     * @tc.desc Verify buffer slice buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const r = arr.slice(0, 4);
      const view = new Float32Array(arr.buffer);
      view.$_set(0, 77.0);
      const atValue094 = r.at(0);
      expect(atValue094).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0910
     * @tc.name testFloat32ArraySliceTwo091
     * @tc.desc Verify buffer.byteLength buffer.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const arr = new Float32Array(buf, 0, 8);
      const r = arr.slice(0, 2);
      expect(r.buffer.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0920
     * @tc.name testFloat32ArraySliceTwo092
     * @tc.desc Verify buffer slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const r = arr.slice(0, 2);
      const v = new Float32Array(arr.buffer);
      v.$_set(1, 55.0);
      const atValue097 = r.at(1);
      expect(atValue097).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0930
     * @tc.name testFloat32ArraySliceTwo093
     * @tc.desc Verify fill buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const r = arr.slice(0, 4);
      r.fill(0.0);
      const v = new Float32Array(arr.buffer);
      const atValue098 = v.at(0);
      expect(atValue098).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0940
     * @tc.name testFloat32ArraySliceTwo094
     * @tc.desc Verify slice byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const r = arr.slice(-2);
      expect(r.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0950
     * @tc.name testFloat32ArraySliceTwo095
     * @tc.desc Verify slice byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0, 6.0]);
      const r = arr.slice(2, 5);
      expect(r.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0960
     * @tc.name testFloat32ArraySliceTwo096
     * @tc.desc Verify buffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const r = arr.slice(0, 3);
      const rv = new Float32Array(r.buffer);
      rv.$_set(0, 42.0);
      const atValue102 = arr.at(0);
      expect(atValue102).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0970
     * @tc.name testFloat32ArraySliceTwo097
     * @tc.desc Verify buffer.byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const r = arr.slice(0, 0);
      expect(r.buffer.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0980
     * @tc.name testFloat32ArraySliceTwo098
     * @tc.desc Verify slice() creates independent copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const r = arr.slice();
      arr.$_set(2, 99.0);
      const atValue104 = r.at(2);
      expect(atValue104).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_0990
     * @tc.name testFloat32ArraySliceTwo099
     * @tc.desc Verify buffer.byteLength 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const r = arr.slice(1, 2);
      expect(r.buffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_1000
     * @tc.name testFloat32ArraySliceTwo100
     * @tc.desc Verify set buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const r = arr.slice(0, 4);
      r.set([99.0, 99.0, 99.0, 99.0]);
      const atValue106 = arr.at(3);
      expect(atValue106).assertEqual(4.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_1010
     * @tc.name testFloat32ArraySliceTwo101
     * @tc.desc Verify copyWithin on slice does not mutate original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0]);
      const r = arr.slice(0, 5);
      r.copyWithin(0, 4, 5);
      const atValue107 = arr.at(4);
      expect(atValue107).assertEqual(5.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_1020
     * @tc.name testFloat32ArraySliceTwo102
     * @tc.desc Verify reverse buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const r = arr.slice(0, 4);
      r.reverse();
      const v = new Float32Array(arr.buffer);
      const atValue108 = v.at(0);
      expect(atValue108).assertEqual(1.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SLICE_TWO_1030
     * @tc.name testFloat32ArraySliceTwo103
     * @tc.desc Verify sort buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySliceTwo103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.0, 1.0, 2.0]);
      const r = arr.slice(0, 3);
      r.sort();
      const v = new Float32Array(arr.buffer);
      const atValue109 = v.at(0);
      expect(atValue109).assertEqual(3.0);
    });

  });
}
