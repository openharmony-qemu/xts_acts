'use static';

/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
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

export default function int32ArrayIncludesPart03Test(): void {
  describe('Int32ArrayIncludesPart03Test', () => {
    beforeAll((): void => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {
    });

    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART03_TEST_MINDMAP_0100
     * @tc.name int32ArrayIncludesPart03TestMindmapTest001
     * @tc.desc Verify includes() returns false when fromIndex is at or beyond length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart03TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      expect(arr.includes(30, arr.length)).assertFalse();
      expect(arr.includes(30, arr.length + 1)).assertFalse();
      expect(arr.includes(10, 1000000)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART03_TEST_MINDMAP_0200
     * @tc.name int32ArrayIncludesPart03TestMindmapTest002
     * @tc.desc Verify includes() fromIndex=-1 searches only the final element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart03TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      expect(arr.includes(50, -1)).assertTrue();
      expect(arr.includes(30, -1)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART03_TEST_MINDMAP_0300
     * @tc.name int32ArrayIncludesPart03TestMindmapTest003
     * @tc.desc Verify includes() fromIndex=-length searches from index zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart03TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      expect(arr.includes(10, -arr.length)).assertTrue();
      expect(arr.includes(30, -arr.length)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART03_TEST_MINDMAP_0400
     * @tc.name int32ArrayIncludesPart03TestMindmapTest004
     * @tc.desc Verify includes() clamps fromIndex below negative length to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart03TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      expect(arr.includes(10, -(arr.length + 1))).assertTrue();
      expect(arr.includes(10, -10)).assertTrue();
      expect(arr.includes(10, -999999)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART03_TEST_MINDMAP_0500
     * @tc.name int32ArrayIncludesPart03TestMindmapTest005
     * @tc.desc Verify includes() fromIndex=length-1(=4) 50 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart03TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let result: boolean = arr.includes(50, 4);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART03_TEST_MINDMAP_0600
     * @tc.name int32ArrayIncludesPart03TestMindmapTest006
     * @tc.desc Verify includes() fromIndex=-0 +0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart03TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, 8, 9]);
      let result: boolean = arr.includes(7, -0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART03_TEST_MINDMAP_0700
     * @tc.name int32ArrayIncludesPart03TestMindmapTest007
     * @tc.desc Verify includes() returns false for an empty array with any fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart03TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      expect(arr.includes(0, 0)).assertFalse();
      expect(arr.includes(0, -1)).assertFalse();
      expect(arr.includes(0, 100)).assertFalse();
      expect(arr.includes(0, -100)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART03_TEST_MINDMAP_0800
     * @tc.name int32ArrayIncludesPart03TestMindmapTest008
     * @tc.desc Verify includes() INT32_MIN false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart03TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let result: boolean = arr.includes(-2147483648);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART03_TEST_MINDMAP_0900
     * @tc.name int32ArrayIncludesPart03TestMindmapTest009
     * @tc.desc Verify includes() fromIndex=-1 0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart03TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      let result: boolean = arr.includes(42, -1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART03_TEST_MINDMAP_1000
     * @tc.name int32ArrayIncludesPart03TestMindmapTest010
     * @tc.desc Verify includes() fromIndex=1(=length) false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart03TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      let result: boolean = arr.includes(42, 1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART03_TEST_MINDMAP_1100
     * @tc.name int32ArrayIncludesPart03TestMindmapTest011
     * @tc.desc Verify includes() INT32_MAX true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart03TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647]);
      let result: boolean = arr.includes(2147483647);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART03_TEST_MINDMAP_1200
     * @tc.name int32ArrayIncludesPart03TestMindmapTest012
     * @tc.desc Verify includes() INT32_MIN true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart03TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2147483648]);
      let result: boolean = arr.includes(-2147483648);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART03_TEST_MINDMAP_1300
     * @tc.name int32ArrayIncludesPart03TestMindmapTest013
     * @tc.desc Verify includes() returns false for Number.NaN in an array containing zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart03TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 0, 3]);
      let result: boolean = arr.includes(Number.NaN);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART03_TEST_MINDMAP_1400
     * @tc.name int32ArrayIncludesPart03TestMindmapTest014
     * @tc.desc Verify includes() NaN coerced to 0 in Int32Array, includes(0) returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart03TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, Number.NaN, 3]);
      let result: boolean = arr.includes(0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART03_TEST_MINDMAP_1500
     * @tc.name int32ArrayIncludesPart03TestMindmapTest015
     * @tc.desc Verify includes() returns false for Number.NaN in a zero-filled array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart03TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0]);
      let result: boolean = arr.includes(Number.NaN);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART03_TEST_MINDMAP_1600
     * @tc.name int32ArrayIncludesPart03TestMindmapTest016
     * @tc.desc Verify includes() 0 Number.NaN fromIndex=1 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart03TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 1, 2]);
      let result: boolean = arr.includes(Number.NaN, 1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART03_TEST_MINDMAP_1700
     * @tc.name int32ArrayIncludesPart03TestMindmapTest017
     * @tc.desc Verify includes() 0 Number.NaN fromIndex=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart03TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0]);
      let result: boolean = arr.includes(Number.NaN, 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART03_TEST_MINDMAP_1800
     * @tc.name int32ArrayIncludesPart03TestMindmapTest018
     * @tc.desc Verify Int32Array.of Number.NaN 0 includes(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart03TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, Number.NaN, 3);
      let result: boolean = arr.includes(0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART03_TEST_MINDMAP_1900
     * @tc.name int32ArrayIncludesPart03TestMindmapTest019
     * @tc.desc Verify includes() 0 -0.0 SameValueZero +0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart03TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 0, 2]);
      let result: boolean = arr.includes(-0.0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART03_TEST_MINDMAP_2000
     * @tc.name int32ArrayIncludesPart03TestMindmapTest020
     * @tc.desc Verify -0.0 ToInt32 0 includes(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart03TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, -0.0, 2]);
      let result: boolean = arr.includes(0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART03_TEST_MINDMAP_2100
     * @tc.name int32ArrayIncludesPart03TestMindmapTest021
     * @tc.desc Verify includes() -0.0 -0.0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart03TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, -0.0, 2]);
      let result: boolean = arr.includes(-0.0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART03_TEST_MINDMAP_2200
     * @tc.name int32ArrayIncludesPart03TestMindmapTest022
     * @tc.desc Verify includes() 0 -1 -0.0 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart03TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, -2]);
      let result: boolean = arr.includes(-0.0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART03_TEST_MINDMAP_2300
     * @tc.name int32ArrayIncludesPart03TestMindmapTest023
     * @tc.desc Verify includes() [0,0] -0.0 fromIndex=1 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart03TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0]);
      let result: boolean = arr.includes(-0.0, 1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART03_TEST_MINDMAP_2400
     * @tc.name int32ArrayIncludesPart03TestMindmapTest024
     * @tc.desc Verify includes() +0.0 0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart03TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 1]);
      let result: boolean = arr.includes(+0.0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART03_TEST_MINDMAP_2500
     * @tc.name int32ArrayIncludesPart03TestMindmapTest025
     * @tc.desc Verify includes() does not implicitly convert searchElement=2147483648.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart03TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2147483648, 1]);
      let result: boolean = arr.includes(2147483648.0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART03_TEST_MINDMAP_2600
     * @tc.name int32ArrayIncludesPart03TestMindmapTest026
     * @tc.desc Verify includes() does not implicitly convert searchElement=-2147483649.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart03TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2147483647]);
      let result: boolean = arr.includes(-2147483649.0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART03_TEST_MINDMAP_2700
     * @tc.name int32ArrayIncludesPart03TestMindmapTest027
     * @tc.desc Verify includes() searchElement=4294967296.0 2^32 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart03TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 1]);
      let result: boolean = arr.includes(4294967296.0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART03_TEST_MINDMAP_2800
     * @tc.name int32ArrayIncludesPart03TestMindmapTest028
     * @tc.desc Verify includes() searchElement=4294967297.0 2^32+1 1 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart03TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 1]);
      let result: boolean = arr.includes(4294967297.0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART03_TEST_MINDMAP_2900
     * @tc.name int32ArrayIncludesPart03TestMindmapTest029
     * @tc.desc Verify includes() searchElement=2147483647.9 2147483647 INT_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart03TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647]);
      let result: boolean = arr.includes(2147483647.9);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART03_TEST_MINDMAP_3000
     * @tc.name int32ArrayIncludesPart03TestMindmapTest030
     * @tc.desc Verify includes() searchElement=0.5 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart03TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0]);
      let result: boolean = arr.includes(0.5);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART03_TEST_MINDMAP_3100
     * @tc.name int32ArrayIncludesPart03TestMindmapTest031
     * @tc.desc Verify includes() searchElement=-0.9 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart03TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0]);
      let result: boolean = arr.includes(-0.9);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART03_TEST_MINDMAP_3200
     * @tc.name int32ArrayIncludesPart03TestMindmapTest032
     * @tc.desc Verify includes() searchElement=-3.5 -3 -3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart03TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-3, -2]);
      let result: boolean = arr.includes(-3.5);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART03_TEST_MINDMAP_3300
     * @tc.name int32ArrayIncludesPart03TestMindmapTest033
     * @tc.desc Verify includes() searchElement=3.0 3 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart03TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let result: boolean = arr.includes(3.0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART03_TEST_MINDMAP_3400
     * @tc.name int32ArrayIncludesPart03TestMindmapTest034
     * @tc.desc Verify includes() searchElement 0 found in [0] returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart03TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0]);
      let result: boolean = arr.includes(0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART03_TEST_MINDMAP_3500
     * @tc.name int32ArrayIncludesPart03TestMindmapTest035
     * @tc.desc Verify includes does not coerce negative infinity searchElement to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart03TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0]);
      let result: boolean = arr.includes(-Number.POSITIVE_INFINITY);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART03_TEST_MINDMAP_3600
     * @tc.name int32ArrayIncludesPart03TestMindmapTest036
     * @tc.desc Verify includes() searchElement=3.5 3 fromIndex 3 fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart03TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 4, 5]);
      let result: boolean = arr.includes(3.5, 1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART03_TEST_MINDMAP_3700
     * @tc.name int32ArrayIncludesPart03TestMindmapTest037
     * @tc.desc Verify includes() INT32_MAX(2147483647) true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart03TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647, 0, -1]);
      let result: boolean = arr.includes(2147483647);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART03_TEST_MINDMAP_3800
     * @tc.name int32ArrayIncludesPart03TestMindmapTest038
     * @tc.desc Verify includes() INT32_MAX true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart03TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, 0, 2147483647]);
      let result: boolean = arr.includes(2147483647);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART03_TEST_MINDMAP_3900
     * @tc.name int32ArrayIncludesPart03TestMindmapTest039
     * @tc.desc Verify includes() INT32_MIN(-2147483648) true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart03TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2147483648, 0, 1]);
      let result: boolean = arr.includes(-2147483648);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART03_TEST_MINDMAP_4000
     * @tc.name int32ArrayIncludesPart03TestMindmapTest040
     * @tc.desc Verify includes() INT32_MIN true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart03TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 0, -2147483648]);
      let result: boolean = arr.includes(-2147483648);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART03_TEST_MINDMAP_4100
     * @tc.name int32ArrayIncludesPart03TestMindmapTest041
     * @tc.desc Verify includes() INT32_MAX INT32_MIN false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart03TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647, 0]);
      let result: boolean = arr.includes(-2147483648);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART03_TEST_MINDMAP_4200
     * @tc.name int32ArrayIncludesPart03TestMindmapTest042
     * @tc.desc Verify includes() INT32_MIN INT32_MAX false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart03TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2147483648, 0]);
      let result: boolean = arr.includes(2147483647);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART03_TEST_MINDMAP_4300
     * @tc.name int32ArrayIncludesPart03TestMindmapTest043
     * @tc.desc Verify includes() INT32_MAX fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart03TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 2147483647, -1]);
      let result: boolean = arr.includes(2147483647, 1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART03_TEST_MINDMAP_4400
     * @tc.name int32ArrayIncludesPart03TestMindmapTest044
     * @tc.desc Verify includes() INT32_MIN fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart03TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, -2147483648, 1]);
      let result: boolean = arr.includes(-2147483648, 1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART03_TEST_MINDMAP_4500
     * @tc.name int32ArrayIncludesPart03TestMindmapTest045
     * @tc.desc Verify [5,5,5,5] includes(5) true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart03TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 5, 5, 5]);
      let result: boolean = arr.includes(5);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART03_TEST_MINDMAP_4600
     * @tc.name int32ArrayIncludesPart03TestMindmapTest046
     * @tc.desc Verify includes(5,2) 2 5 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart03TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 5, 5, 5]);
      let result: boolean = arr.includes(5, 2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART03_TEST_MINDMAP_4700
     * @tc.name int32ArrayIncludesPart03TestMindmapTest047
     * @tc.desc Verify includes(5,4) fromIndex=length false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart03TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 5, 5, 5]);
      let result: boolean = arr.includes(5, 4);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART03_TEST_MINDMAP_4800
     * @tc.name int32ArrayIncludesPart03TestMindmapTest048
     * @tc.desc Verify includes(6) false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart03TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 5, 5, 5]);
      let result: boolean = arr.includes(6);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART03_TEST_MINDMAP_4900
     * @tc.name int32ArrayIncludesPart03TestMindmapTest049
     * @tc.desc Verify 0 [0,0,0] includes(0,-1) 0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart03TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0]);
      let result: boolean = arr.includes(0, -1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART03_TEST_MINDMAP_5000
     * @tc.name int32ArrayIncludesPart03TestMindmapTest050
     * @tc.desc Verify -1 [-1,-1,-1] includes(-1,0) true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart03TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, -1, -1]);
      let result: boolean = arr.includes(-1, 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART03_TEST_MINDMAP_5100
     * @tc.name int32ArrayIncludesPart03TestMindmapTest051
     * @tc.desc Verify [7,7] includes(7,1) 1 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart03TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, 7]);
      let result: boolean = arr.includes(7, 1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART03_TEST_MINDMAP_5200
     * @tc.name int32ArrayIncludesPart03TestMindmapTest052
     * @tc.desc Verify includes(7,2) false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart03TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, 7]);
      let result: boolean = arr.includes(7, 2);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART03_TEST_MINDMAP_5300
     * @tc.name int32ArrayIncludesPart03TestMindmapTest053
     * @tc.desc Verify [1,2,1,2,1] includes(1,0) 1 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart03TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 1, 2, 1]);
      let result: boolean = arr.includes(1, 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART03_TEST_MINDMAP_5400
     * @tc.name int32ArrayIncludesPart03TestMindmapTest054
     * @tc.desc Verify [1,2,1,2,1] includes(1,1) 0 1 2 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart03TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 1, 2, 1]);
      let result: boolean = arr.includes(1, 1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART03_TEST_MINDMAP_5500
     * @tc.name int32ArrayIncludesPart03TestMindmapTest055
     * @tc.desc Verify includes(1,3) 1 4 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart03TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 1, 2, 1]);
      let result: boolean = arr.includes(1, 3);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART03_TEST_MINDMAP_5600
     * @tc.name int32ArrayIncludesPart03TestMindmapTest056
     * @tc.desc Verify includes(1,5) false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart03TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 1, 2, 1]);
      let result: boolean = arr.includes(1, 5);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART03_TEST_MINDMAP_5700
     * @tc.name int32ArrayIncludesPart03TestMindmapTest057
     * @tc.desc Verify includes(2,2) 2 3 2 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart03TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 1, 2, 1]);
      let result: boolean = arr.includes(2, 2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART03_TEST_MINDMAP_5800
     * @tc.name int32ArrayIncludesPart03TestMindmapTest058
     * @tc.desc Verify includes(2,4) 4 2 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart03TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 1, 2, 1]);
      let result: boolean = arr.includes(2, 4);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART03_TEST_MINDMAP_5900
     * @tc.name int32ArrayIncludesPart03TestMindmapTest059
     * @tc.desc Verify [-1,-2,-3,-4] includes(-3) true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart03TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, -2, -3, -4]);
      let result: boolean = arr.includes(-3);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART03_TEST_MINDMAP_6000
     * @tc.name int32ArrayIncludesPart03TestMindmapTest060
     * @tc.desc Verify includes(-5) false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart03TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, -2, -3, -4]);
      let result: boolean = arr.includes(-5);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART03_TEST_MINDMAP_6100
     * @tc.name int32ArrayIncludesPart03TestMindmapTest061
     * @tc.desc Verify includes() fromIndex=-1 -4 -4 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart03TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, -2, -3, -4]);
      let result: boolean = arr.includes(-4, -1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART03_TEST_MINDMAP_6200
     * @tc.name int32ArrayIncludesPart03TestMindmapTest062
     * @tc.desc Verify includes() length=2 [-5, 10] fromIndex=-2 0 -5 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart03TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-5, 10]);
      let result: boolean = arr.includes(-5, -2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART03_TEST_MINDMAP_6300
     * @tc.name int32ArrayIncludesPart03TestMindmapTest063
     * @tc.desc Verify includes() length=2 fromIndex=-3 -1(<0) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart03TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-5, 10]);
      let result: boolean = arr.includes(-5, -3);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART03_TEST_MINDMAP_6400
     * @tc.name int32ArrayIncludesPart03TestMindmapTest064
     * @tc.desc Verify includes() length=3 [100,200,300] fromIndex=-4 <0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart03TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([100, 200, 300]);
      let result: boolean = arr.includes(100, -4);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART03_TEST_MINDMAP_6500
     * @tc.name int32ArrayIncludesPart03TestMindmapTest065
     * @tc.desc Verify ArrayBuffer Int32Array includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart03TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf, 0, 4);
      arr.$_set(0, 11);
      arr.$_set(1, 22);
      arr.$_set(2, 33);
      arr.$_set(3, 44);
      let result: boolean = arr.includes(33);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART03_TEST_MINDMAP_6600
     * @tc.name int32ArrayIncludesPart03TestMindmapTest066
     * @tc.desc Verify includes() byteOffset 4 1 int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart03TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let full: Int32Array = new Int32Array(buf);
      full.$_set(0, 11);
      full.$_set(1, 22);
      full.$_set(2, 33);
      full.$_set(3, 44);
      let view: Int32Array = new Int32Array(buf, 4, 3);
      let result: boolean = view.includes(22);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART03_TEST_MINDMAP_6700
     * @tc.name int32ArrayIncludesPart03TestMindmapTest067
     * @tc.desc Verify includes() buffer false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart03TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let full: Int32Array = new Int32Array(buf);
      full.$_set(0, 11);
      full.$_set(1, 22);
      full.$_set(2, 33);
      full.$_set(3, 44);
      let view: Int32Array = new Int32Array(buf, 4, 3);
      let result: boolean = view.includes(11);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART03_TEST_MINDMAP_6800
     * @tc.name int32ArrayIncludesPart03TestMindmapTest068
     * @tc.desc Verify subarray buffer subarray includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart03TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let sub: Int32Array = arr.subarray(1, 4);
      let result: boolean = sub.includes(30);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART03_TEST_MINDMAP_6900
     * @tc.name int32ArrayIncludesPart03TestMindmapTest069
     * @tc.desc Verify subarray begin>=end includes false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart03TestMindmapTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let sub: Int32Array = arr.subarray(2, 1);
      let result: boolean = sub.includes(20);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART03_TEST_MINDMAP_7000
     * @tc.name int32ArrayIncludesPart03TestMindmapTest070
     * @tc.desc Verify subarray includes fromIndex false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart03TestMindmapTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let sub: Int32Array = arr.subarray(3, 3);
      let result: boolean = sub.includes(1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART03_TEST_MINDMAP_7100
     * @tc.name int32ArrayIncludesPart03TestMindmapTest071
     * @tc.desc Verify includes() fromIndex false boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart03TestMindmapTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let r: boolean = arr.includes(1, 10);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART03_TEST_MINDMAP_7200
     * @tc.name int32ArrayIncludesPart03TestMindmapTest072
     * @tc.desc Verify includes on empty array does not modify array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart03TestMindmapTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      arr.includes(0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART03_TEST_MINDMAP_7300
     * @tc.name int32ArrayIncludesPart03TestMindmapTest073
     * @tc.desc Verify includes() 0 fromIndex 0 fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart03TestMindmapTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 0, 1]);
      let result: boolean = arr.includes(0, -2);
      expect(result).assertTrue();
    });


  });
}
