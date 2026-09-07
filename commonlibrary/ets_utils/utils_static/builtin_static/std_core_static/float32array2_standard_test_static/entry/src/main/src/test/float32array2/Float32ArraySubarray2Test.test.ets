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

export default function Float32ArraySubarray2Test(): void {
  describe('Float32ArraySubarray2Test', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(50);
    });
    afterEach(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_TWO_0100
     * @tc.name testFloat32ArraySubarrayTwo001
     * @tc.desc Verify subarray() Float32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([10.0, 20.0, 30.0, 40.0, 50.0]);
      const v = a.subarray();
      expect(v.length).assertEqual(5);
      expect(v.$_get(0)).assertEqual(10.0);
      expect(v.$_get(4)).assertEqual(50.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_TWO_0200
     * @tc.name testFloat32ArraySubarrayTwo002
     * @tc.desc Verify subarray(0) Float32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([10.0, 20.0, 30.0, 40.0, 50.0]);
      const v = a.subarray(0);
      expect(v.length).assertEqual(5);
      expect(v.$_get(0)).assertEqual(10.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_TWO_0300
     * @tc.name testFloat32ArraySubarrayTwo003
     * @tc.desc Verify subarray(0, 2) Float32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([10.0, 20.0, 30.0, 40.0, 50.0]);
      const v = a.subarray(0, 2);
      expect(v.length).assertEqual(2);
      expect(v.$_get(1)).assertEqual(20.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_TWO_0400
     * @tc.name testFloat32ArraySubarrayTwo004
     * @tc.desc Verify subarray(-1) Float32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([10.0, 20.0, 30.0, 40.0, 50.0]);
      const v = a.subarray(-1);
      expect(v.length).assertEqual(1);
      expect(v.$_get(0)).assertEqual(50.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_TWO_0500
     * @tc.name testFloat32ArraySubarrayTwo005
     * @tc.desc Verify subarray(1, -1) Float32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([10.0, 20.0, 30.0, 40.0, 50.0]);
      const v = a.subarray(1, -1);
      expect(v.length).assertEqual(3);
      expect(v.$_get(0)).assertEqual(20.0);
      expect(v.$_get(1)).assertEqual(30.0);
      expect(v.$_get(2)).assertEqual(40.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_TWO_0600
     * @tc.name testFloat32ArraySubarrayTwo006
     * @tc.desc Verify subarray(2, 4) returns view with length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([10.0, 20.0, 30.0, 40.0, 50.0]);
      const v = a.subarray(2, 4);
      expect(v.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_TWO_0700
     * @tc.name testFloat32ArraySubarrayTwo007
     * @tc.desc Verify subarray(-100) Float32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([10.0, 20.0, 30.0, 40.0, 50.0]);
      const v = a.subarray(-100);
      expect(v.length).assertEqual(5);
      expect(v.$_get(0)).assertEqual(10.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_TWO_0800
     * @tc.name testFloat32ArraySubarrayTwo008
     * @tc.desc Verify subarray(0, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([10.0, 20.0, 30.0, 40.0, 50.0]);
      const v = a.subarray(0, 3);
      const element011 = v.$_get(0);
      expect(element011).assertEqual(10.0);
      const element011Part2 = v.$_get(1);
      expect(element011Part2).assertEqual(20.0);
      const element011Part3 = v.$_get(2);
      expect(element011Part3).assertEqual(30.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_TWO_0900
     * @tc.name testFloat32ArraySubarrayTwo009
     * @tc.desc Verify subarray(1, 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([10.0, 20.0, 30.0, 40.0, 50.0]);
      const v = a.subarray(1, 4);
      const element012 = v.$_get(0);
      expect(element012).assertEqual(20.0);
      const element012Part2 = v.$_get(1);
      expect(element012Part2).assertEqual(30.0);
      const element012Part3 = v.$_get(2);
      expect(element012Part3).assertEqual(40.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_TWO_1000
     * @tc.name testFloat32ArraySubarrayTwo010
     * @tc.desc Verify subarray(2) end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([10.0, 20.0, 30.0, 40.0, 50.0]);
      const v = a.subarray(2);
      const element013 = v.$_get(0);
      expect(element013).assertEqual(30.0);
      const element013Part2 = v.$_get(1);
      expect(element013Part2).assertEqual(40.0);
      const element013Part3 = v.$_get(2);
      expect(element013Part3).assertEqual(50.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_TWO_1100
     * @tc.name testFloat32ArraySubarrayTwo011
     * @tc.desc Verify subarray(-2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([10.0, 20.0, 30.0, 40.0, 50.0]);
      const v = a.subarray(-2);
      const element014 = v.$_get(0);
      expect(element014).assertEqual(40.0);
      const element014Part2 = v.$_get(1);
      expect(element014Part2).assertEqual(50.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_TWO_1200
     * @tc.name testFloat32ArraySubarrayTwo012
     * @tc.desc Verify subarray(4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([10.0, 20.0, 30.0, 40.0, 50.0]);
      const v = a.subarray(4);
      const element017 = v.$_get(0);
      expect(element017).assertEqual(50.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_TWO_1300
     * @tc.name testFloat32ArraySubarrayTwo013
     * @tc.desc Verify subarray(0, 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([10.0, 20.0, 30.0, 40.0, 50.0]);
      const v = a.subarray(0, 1);
      const element018 = v.$_get(0);
      expect(element018).assertEqual(10.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_TWO_1400
     * @tc.name testFloat32ArraySubarrayTwo014
     * @tc.desc Verify subarray NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Float32Array([Number.NaN, Number.POSITIVE_INFINITY, -Number.POSITIVE_INFINITY, -0.0, 0.0]);
      const v = s.subarray(0, 1);
      const element019 = v.$_get(0);
      expect(element019).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_TWO_1500
     * @tc.name testFloat32ArraySubarrayTwo015
     * @tc.desc Verify subarray Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Float32Array([Number.NaN, Number.POSITIVE_INFINITY, -Number.POSITIVE_INFINITY, -0.0, 0.0]);
      const v = s.subarray(1, 2);
      const element020 = v.$_get(0);
      expect(element020).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_TWO_1600
     * @tc.name testFloat32ArraySubarrayTwo016
     * @tc.desc Verify subarray -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Float32Array([Number.NaN, Number.POSITIVE_INFINITY, -Number.POSITIVE_INFINITY, -0.0, 0.0]);
      const v = s.subarray(2, 3);
      const element021 = v.$_get(0);
      expect(element021).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_TWO_1700
     * @tc.name testFloat32ArraySubarrayTwo017
     * @tc.desc Verify subarray -0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Float32Array([Number.NaN, Number.POSITIVE_INFINITY, -Number.POSITIVE_INFINITY, -0.0, 0.0]);
      const v = s.subarray(3, 4);
      const element022 = 1.0 / v.$_get(0);
      expect(element022).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_TWO_1800
     * @tc.name testFloat32ArraySubarrayTwo018
     * @tc.desc Verify subarray +0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Float32Array([Number.NaN, Number.POSITIVE_INFINITY, -Number.POSITIVE_INFINITY, -0.0, 0.0]);
      const v = s.subarray(4, 5);
      const element023 = 1.0 / v.$_get(0);
      expect(element023).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_TWO_1900
     * @tc.name testFloat32ArraySubarrayTwo019
     * @tc.desc Verify subarray(0, 2) preserves NaN and Infinity values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new Float32Array([Number.NaN, Number.POSITIVE_INFINITY, -Number.POSITIVE_INFINITY, -0.0, 0.0]);
      const v = s.subarray(0, 2);
      const element024 = v.$_get(0);
      expect(element024).assertNaN();
      const element024Part2 = v.$_get(1);
      expect(element024Part2).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_TWO_2000
     * @tc.name testFloat32ArraySubarrayTwo020
     * @tc.desc Verify subarray(0, 1) on float32 array returns max float32 value 3.4028234663852886e+38
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Float32Array([3.4028234663852886e+38, 1.1754943508222875e-38, 1.401298464324817e-45, 0.1, 16777216]);
      const v = b.subarray(0, 1);
      const element025 = v.$_get(0);
      expect(element025).assertEqual(3.4028234663852886e+38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_TWO_2100
     * @tc.name testFloat32ArraySubarrayTwo021
     * @tc.desc Verify subarray(1, 2) on float32 array returns min float32 value 1.1754943508222875e-38
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Float32Array([3.4028234663852886e+38, 1.1754943508222875e-38, 1.401298464324817e-45, 0.1, 16777216]);
      const v = b.subarray(1, 2);
      const element026 = v.$_get(0);
      expect(element026).assertEqual(1.1754943508222875e-38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_TWO_2200
     * @tc.name testFloat32ArraySubarrayTwo022
     * @tc.desc Verify subarray(2, 3) on float32 array returns subnormal value 1.401298464324817e-45
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Float32Array([3.4028234663852886e+38, 1.1754943508222875e-38, 1.401298464324817e-45, 0.1, 16777216]);
      const v = b.subarray(2, 3);
      const element027 = v.$_get(0);
      expect(element027).assertEqual(1.401298464324817e-45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_TWO_2300
     * @tc.name testFloat32ArraySubarrayTwo023
     * @tc.desc Verify subarray(3, 4) on float32 array returns 0.1 value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Float32Array([3.4028234663852886e+38, 1.1754943508222875e-38, 1.401298464324817e-45, 0.1, 16777216]);
      const v = b.subarray(3, 4);
      const element028 = v.$_get(0);
      expect(element028).assertEqual(0.10000000149011612);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_TWO_2400
     * @tc.name testFloat32ArraySubarrayTwo024
     * @tc.desc Verify subarray(4, 5) on float32 array returns 16777216 (max consecutive integer in float32)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const b = new Float32Array([3.4028234663852886e+38, 1.1754943508222875e-38, 1.401298464324817e-45, 0.1, 16777216]);
      const v = b.subarray(4, 5);
      const element029 = v.$_get(0);
      expect(element029).assertEqual(16777216);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_TWO_2500
     * @tc.name testFloat32ArraySubarrayTwo025
     * @tc.desc Verify subarray(0, 3) returns view with length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([10.0, 20.0, 30.0, 40.0, 50.0]);
      const v = a.subarray(0, 3);
      expect(v.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_TWO_2600
     * @tc.name testFloat32ArraySubarrayTwo026
     * @tc.desc Verify subarray(1) returns view with elements from index 1 to end (length 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([10.0, 20.0, 30.0, 40.0, 50.0]);
      const v = a.subarray(1);
      expect(v.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_TWO_2700
     * @tc.name testFloat32ArraySubarrayTwo027
     * @tc.desc Verify subarray(-2) returns view with last 2 elements (length 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([10.0, 20.0, 30.0, 40.0, 50.0]);
      const v = a.subarray(-2);
      expect(v.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_SUBARRAY_TWO_2800
     * @tc.name testFloat32ArraySubarrayTwo028
     * @tc.desc Verify subarray(1, -1) returns view with elements from index 1 to second-to-last (length 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArraySubarrayTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new Float32Array([10.0, 20.0, 30.0, 40.0, 50.0]);
      const v = a.subarray(1, -1);
      expect(v.length).assertEqual(3);
    });

  });
}
