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

export default function int32ArrayIncludesPart01Test(): void {
  describe('Int32ArrayIncludesPart01Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART01_TEST_MINDMAP_0100
     * @tc.name int32ArrayIncludesPart01TestMindmapTest001
     * @tc.desc Verify includes() 1 searchElement true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart01TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let result: boolean = arr.includes(3);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART01_TEST_MINDMAP_0200
     * @tc.name int32ArrayIncludesPart01TestMindmapTest002
     * @tc.desc Verify includes() 1 searchElement false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart01TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let result: boolean = arr.includes(99);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART01_TEST_MINDMAP_0300
     * @tc.name int32ArrayIncludesPart01TestMindmapTest003
     * @tc.desc Verify includes() 1 fromIndex 0 0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart01TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42, 1, 2]);
      let result: boolean = arr.includes(42);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART01_TEST_MINDMAP_0400
     * @tc.name int32ArrayIncludesPart01TestMindmapTest004
     * @tc.desc Verify includes() 2 searchElement fromIndex fromIndex true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart01TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let result: boolean = arr.includes(30, 2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART01_TEST_MINDMAP_0500
     * @tc.name int32ArrayIncludesPart01TestMindmapTest005
     * @tc.desc Verify includes() 2 fromIndex false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart01TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let result: boolean = arr.includes(10, 2);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART01_TEST_MINDMAP_0600
     * @tc.name int32ArrayIncludesPart01TestMindmapTest006
     * @tc.desc Verify includes() 2 fromIndex undefined fromIndex 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart01TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, 8, 9]);
      let result: boolean = arr.includes(7, undefined);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART01_TEST_MINDMAP_0700
     * @tc.name int32ArrayIncludesPart01TestMindmapTest007
     * @tc.desc Verify includes() 2 fromIndex false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart01TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let result: boolean = arr.includes(999, 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART01_TEST_MINDMAP_0800
     * @tc.name int32ArrayIncludesPart01TestMindmapTest008
     * @tc.desc Verify includes() 2 fromIndex 0 fromIndex 0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart01TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([100, 200, 300]);
      let result: boolean = arr.includes(100, 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART01_TEST_MINDMAP_0900
     * @tc.name int32ArrayIncludesPart01TestMindmapTest009
     * @tc.desc Verify includes() searchElement 0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart01TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33]);
      let result: boolean = arr.includes(11);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART01_TEST_MINDMAP_1000
     * @tc.name int32ArrayIncludesPart01TestMindmapTest010
     * @tc.desc Verify includes() searchElement length-1 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart01TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([11, 22, 33]);
      let result: boolean = arr.includes(33);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART01_TEST_MINDMAP_1100
     * @tc.name int32ArrayIncludesPart01TestMindmapTest011
     * @tc.desc Verify includes() searchElement true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart01TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7]);
      let result: boolean = arr.includes(7);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART01_TEST_MINDMAP_1200
     * @tc.name int32ArrayIncludesPart01TestMindmapTest012
     * @tc.desc Verify includes() searchElement false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart01TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7]);
      let result: boolean = arr.includes(8);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART01_TEST_MINDMAP_1300
     * @tc.name int32ArrayIncludesPart01TestMindmapTest013
     * @tc.desc Verify includes() searchElement 1 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart01TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 1, 2]);
      let result: boolean = arr.includes(1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART01_TEST_MINDMAP_1400
     * @tc.name int32ArrayIncludesPart01TestMindmapTest014
     * @tc.desc Verify includes() searchElement -1 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart01TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2, -1, 0]);
      let result: boolean = arr.includes(-1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART01_TEST_MINDMAP_1500
     * @tc.name int32ArrayIncludesPart01TestMindmapTest015
     * @tc.desc Verify includes() searchElement 0 0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart01TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, 0, 1]);
      let result: boolean = arr.includes(0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART01_TEST_MINDMAP_1600
     * @tc.name int32ArrayIncludesPart01TestMindmapTest016
     * @tc.desc Verify includes() searchElement -0.0 number 0 SameValueZero +0 -0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart01TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 1, 2]);
      let result: boolean = arr.includes(-0.0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART01_TEST_MINDMAP_1700
     * @tc.name int32ArrayIncludesPart01TestMindmapTest017
     * @tc.desc Verify includes() searchElement +0.0 number 0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart01TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 1, 2]);
      let result: boolean = arr.includes(0.0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART01_TEST_MINDMAP_1800
     * @tc.name int32ArrayIncludesPart01TestMindmapTest018
     * @tc.desc Verify includes() $_set -0.0 ToInt32 0 searchElement 0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart01TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.$_set(0, -0.0);
      let result: boolean = arr.includes(0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART01_TEST_MINDMAP_1900
     * @tc.name int32ArrayIncludesPart01TestMindmapTest019
     * @tc.desc Verify includes() searchElement 0 0 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart01TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let result: boolean = arr.includes(0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART01_TEST_MINDMAP_2000
     * @tc.name int32ArrayIncludesPart01TestMindmapTest020
     * @tc.desc Verify includes() searchElement INT_MAX 2147483647 INT_MAX true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart01TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647, -1, 0]);
      let result: boolean = arr.includes(2147483647);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART01_TEST_MINDMAP_2100
     * @tc.name int32ArrayIncludesPart01TestMindmapTest021
     * @tc.desc Verify includes() searchElement INT_MAX 2147483647 INT_MAX false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart01TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483646, 0, -1]);
      let result: boolean = arr.includes(2147483647);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART01_TEST_MINDMAP_2200
     * @tc.name int32ArrayIncludesPart01TestMindmapTest022
     * @tc.desc Verify includes() searchElement INT_MIN -2147483648 INT_MIN true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart01TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 1, -2147483648]);
      let result: boolean = arr.includes(-2147483648);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART01_TEST_MINDMAP_2300
     * @tc.name int32ArrayIncludesPart01TestMindmapTest023
     * @tc.desc Verify includes() searchElement INT_MIN -2147483648 INT_MIN false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart01TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2147483647, 0, 1]);
      let result: boolean = arr.includes(-2147483648);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART01_TEST_MINDMAP_2400
     * @tc.name int32ArrayIncludesPart01TestMindmapTest024
     * @tc.desc Verify includes() does not implicitly convert searchElement 2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart01TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, -2147483648, 1]);
      let result: boolean = arr.includes(2147483648);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART01_TEST_MINDMAP_2500
     * @tc.name int32ArrayIncludesPart01TestMindmapTest025
     * @tc.desc Verify includes() does not implicitly convert searchElement -2147483649
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart01TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 2147483647, 1]);
      let result: boolean = arr.includes(-2147483649);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART01_TEST_MINDMAP_2600
     * @tc.name int32ArrayIncludesPart01TestMindmapTest026
     * @tc.desc Verify includes() searchElement 0 found in [0,1,2] returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart01TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 1, 2]);
      let result: boolean = arr.includes(0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART01_TEST_MINDMAP_2700
     * @tc.name int32ArrayIncludesPart01TestMindmapTest027
     * @tc.desc Verify includes() searchElement 0 found in [0,1,2147483647] returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart01TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 1, 2147483647]);
      let result: boolean = arr.includes(0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART01_TEST_MINDMAP_2800
     * @tc.name int32ArrayIncludesPart01TestMindmapTest028
     * @tc.desc Verify includes() searchElement -Number.POSITIVE_INFINITY number -Number.POSITIVE_INFINITY int32 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart01TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2147483648, 0, 1]);
      let result: boolean = arr.includes(-Number.POSITIVE_INFINITY);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART01_TEST_MINDMAP_2900
     * @tc.name int32ArrayIncludesPart01TestMindmapTest029
     * @tc.desc Verify includes() searchElement 0 found in [0,0,0] returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart01TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0]);
      let result: boolean = arr.includes(0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART01_TEST_MINDMAP_3000
     * @tc.name int32ArrayIncludesPart01TestMindmapTest030
     * @tc.desc Verify includes() searchElement -0.9 number -0.9 int32 0 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart01TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 1, 2]);
      let result: boolean = arr.includes(-0.9);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART01_TEST_MINDMAP_3100
     * @tc.name int32ArrayIncludesPart01TestMindmapTest031
     * @tc.desc Verify includes() searchElement 3.7 number 3.7 !== 3 3 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart01TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let result: boolean = arr.includes(3.7);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART01_TEST_MINDMAP_3200
     * @tc.name int32ArrayIncludesPart01TestMindmapTest032
     * @tc.desc Verify includes() searchElement 2147483647.9 number INT_MAX+1 2147483647 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart01TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647, -1, 0]);
      let result: boolean = arr.includes(2147483647.9);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART01_TEST_MINDMAP_3300
     * @tc.name int32ArrayIncludesPart01TestMindmapTest033
     * @tc.desc Verify includes() searchElement -2147483648.1 number INT_MIN -2147483648 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart01TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2147483648, 0, 1]);
      let result: boolean = arr.includes(-2147483648.1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART01_TEST_MINDMAP_3400
     * @tc.name int32ArrayIncludesPart01TestMindmapTest034
     * @tc.desc Verify includes() searchElement 1.0 number 1 true 1.0 === 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart01TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 1, 2]);
      let result: boolean = arr.includes(1.0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART01_TEST_MINDMAP_3500
     * @tc.name int32ArrayIncludesPart01TestMindmapTest035
     * @tc.desc Verify includes does not coerce searchElement 4294967296 to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart01TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 1, 2]);
      let result: boolean = arr.includes(4294967296.0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART01_TEST_MINDMAP_3600
     * @tc.name int32ArrayIncludesPart01TestMindmapTest036
     * @tc.desc Verify includes does not coerce searchElement 4294967297 to 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart01TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 1, 2]);
      let result: boolean = arr.includes(4294967297.0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART01_TEST_MINDMAP_3700
     * @tc.name int32ArrayIncludesPart01TestMindmapTest037
     * @tc.desc Verify includes does not coerce searchElement 2147483649 to -2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart01TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, -2147483647, 1]);
      let result: boolean = arr.includes(2147483649.0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART01_TEST_MINDMAP_3800
     * @tc.name int32ArrayIncludesPart01TestMindmapTest038
     * @tc.desc Verify includes does not coerce searchElement -4294967296 to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart01TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 1, 2]);
      let result: boolean = arr.includes(-4294967296.0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART01_TEST_MINDMAP_3900
     * @tc.name int32ArrayIncludesPart01TestMindmapTest039
     * @tc.desc Verify includes() searchElement INT_MAX 0x7FFFFFFF 2147483647 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart01TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 2147483647, -1]);
      let result: boolean = arr.includes(0x7FFFFFFF);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART01_TEST_MINDMAP_4000
     * @tc.name int32ArrayIncludesPart01TestMindmapTest040
     * @tc.desc Verify includes returns true when all elements have the same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart01TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 5, 5]);
      let result: boolean = arr.includes(5);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART01_TEST_MINDMAP_4100
     * @tc.name int32ArrayIncludesPart01TestMindmapTest041
     * @tc.desc Verify includes returns true when duplicate element is found at first occurrence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart01TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, 8, 7, 9]);
      let result: boolean = arr.includes(7);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART01_TEST_MINDMAP_4200
     * @tc.name int32ArrayIncludesPart01TestMindmapTest042
     * @tc.desc Verify includes() searchElement -100 -100 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart01TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, -100, 100]);
      let result: boolean = arr.includes(-100);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART01_TEST_MINDMAP_4300
     * @tc.name int32ArrayIncludesPart01TestMindmapTest043
     * @tc.desc Verify includes returns false when element does not exist in array of identical elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart01TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 3, 3]);
      let result: boolean = arr.includes(4);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART01_TEST_MINDMAP_4400
     * @tc.name int32ArrayIncludesPart01TestMindmapTest044
     * @tc.desc Verify includes INT_MAX false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart01TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let result: boolean = arr.includes(2147483647);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART01_TEST_MINDMAP_4500
     * @tc.name int32ArrayIncludesPart01TestMindmapTest045
     * @tc.desc Verify includes returns true when searching for zero in an all-zeros array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart01TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0, 0]);
      let result: boolean = arr.includes(0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART01_TEST_MINDMAP_4600
     * @tc.name int32ArrayIncludesPart01TestMindmapTest046
     * @tc.desc Verify includes returns false when searching for non-existent element in all-zeros array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart01TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0, 0]);
      let result: boolean = arr.includes(1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART01_TEST_MINDMAP_4700
     * @tc.name int32ArrayIncludesPart01TestMindmapTest047
     * @tc.desc Verify includes() INT_MAX INT_MIN INT_MAX true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart01TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647, -2147483648]);
      let result: boolean = arr.includes(2147483647);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART01_TEST_MINDMAP_4800
     * @tc.name int32ArrayIncludesPart01TestMindmapTest048
     * @tc.desc Verify includes() INT_MAX INT_MIN INT_MIN true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart01TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647, -2147483648]);
      let result: boolean = arr.includes(-2147483648);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART01_TEST_MINDMAP_4900
     * @tc.name int32ArrayIncludesPart01TestMindmapTest049
     * @tc.desc Verify includes() INT_MAX INT_MIN 0 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart01TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647, -2147483648]);
      let result: boolean = arr.includes(0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART01_TEST_MINDMAP_5000
     * @tc.name int32ArrayIncludesPart01TestMindmapTest050
     * @tc.desc Verify includes() searchElement int 2 2 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart01TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let result: boolean = arr.includes(2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART01_TEST_MINDMAP_5100
     * @tc.name int32ArrayIncludesPart01TestMindmapTest051
     * @tc.desc Verify includes does not coerce searchElement 1e21 to an Int32 value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart01TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 1, -1]);
      let result: boolean = arr.includes(1e21);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART01_TEST_MINDMAP_5200
     * @tc.name int32ArrayIncludesPart01TestMindmapTest052
     * @tc.desc Verify includes() fromIndex 0 0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart01TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let result: boolean = arr.includes(10, 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART01_TEST_MINDMAP_5300
     * @tc.name int32ArrayIncludesPart01TestMindmapTest053
     * @tc.desc Verify includes() fromIndex length-1 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart01TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let result: boolean = arr.includes(30, 2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART01_TEST_MINDMAP_5400
     * @tc.name int32ArrayIncludesPart01TestMindmapTest054
     * @tc.desc Verify includes() fromIndex length-1 fromIndex false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart01TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let result: boolean = arr.includes(20, 2);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART01_TEST_MINDMAP_5500
     * @tc.name int32ArrayIncludesPart01TestMindmapTest055
     * @tc.desc Verify includes() fromIndex 1 fromIndex true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart01TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
      let result: boolean = arr.includes(30, 1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART01_TEST_MINDMAP_5600
     * @tc.name int32ArrayIncludesPart01TestMindmapTest056
     * @tc.desc Verify includes() fromIndex 1 fromIndex false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart01TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
      let result: boolean = arr.includes(10, 1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART01_TEST_MINDMAP_5700
     * @tc.name int32ArrayIncludesPart01TestMindmapTest057
     * @tc.desc Verify includes() fromIndex 0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart01TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      let result: boolean = arr.includes(42, 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART01_TEST_MINDMAP_5800
     * @tc.name int32ArrayIncludesPart01TestMindmapTest058
     * @tc.desc Verify includes() fromIndex 0 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart01TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([42]);
      let result: boolean = arr.includes(99, 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART01_TEST_MINDMAP_5900
     * @tc.name int32ArrayIncludesPart01TestMindmapTest059
     * @tc.desc Verify includes returns false when called on empty array without fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart01TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let result: boolean = arr.includes(1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART01_TEST_MINDMAP_6000
     * @tc.name int32ArrayIncludesPart01TestMindmapTest060
     * @tc.desc Verify includes returns false when called on empty array with fromIndex=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart01TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      let result: boolean = arr.includes(1, 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART01_TEST_MINDMAP_6100
     * @tc.name int32ArrayIncludesPart01TestMindmapTest061
     * @tc.desc Verify includes() searchElement fromIndex true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart01TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 6, 7, 8]);
      let result: boolean = arr.includes(7, 2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART01_TEST_MINDMAP_6200
     * @tc.name int32ArrayIncludesPart01TestMindmapTest062
     * @tc.desc Verify includes() searchElement fromIndex fromIndex true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart01TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let result: boolean = arr.includes(4, 1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART01_TEST_MINDMAP_6300
     * @tc.name int32ArrayIncludesPart01TestMindmapTest063
     * @tc.desc Verify includes() fromIndex -1 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart01TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let result: boolean = arr.includes(30, -1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART01_TEST_MINDMAP_6400
     * @tc.name int32ArrayIncludesPart01TestMindmapTest064
     * @tc.desc Verify includes() fromIndex -1 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart01TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let result: boolean = arr.includes(20, -1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART01_TEST_MINDMAP_6500
     * @tc.name int32ArrayIncludesPart01TestMindmapTest065
     * @tc.desc Verify includes() fromIndex -length 0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart01TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let result: boolean = arr.includes(10, -3);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART01_TEST_MINDMAP_6600
     * @tc.name int32ArrayIncludesPart01TestMindmapTest066
     * @tc.desc Verify includes() fromIndex -2 length=5 3 3 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart01TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
      let result: boolean = arr.includes(40, -2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART01_TEST_MINDMAP_6700
     * @tc.name int32ArrayIncludesPart01TestMindmapTest067
     * @tc.desc Verify includes() fromIndex -(length+1) <0 0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart01TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let result: boolean = arr.includes(10, -4);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART01_TEST_MINDMAP_6800
     * @tc.name int32ArrayIncludesPart01TestMindmapTest068
     * @tc.desc Verify includes() fromIndex length false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart01TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let result: boolean = arr.includes(30, 3);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART01_TEST_MINDMAP_6900
     * @tc.name int32ArrayIncludesPart01TestMindmapTest069
     * @tc.desc Verify includes() fromIndex length false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart01TestMindmapTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      let result: boolean = arr.includes(10, 100);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART01_TEST_MINDMAP_7000
     * @tc.name int32ArrayIncludesPart01TestMindmapTest070
     * @tc.desc Verify includes() fromIndex length searchElement false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart01TestMindmapTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let result: boolean = arr.includes(1, 5);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART01_TEST_MINDMAP_7100
     * @tc.name int32ArrayIncludesPart01TestMindmapTest071
     * @tc.desc Verify includes() fromIndex length false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart01TestMindmapTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let result: boolean = arr.includes(2, 2147483647);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART01_TEST_MINDMAP_7200
     * @tc.name int32ArrayIncludesPart01TestMindmapTest072
     * @tc.desc Verify includes returns false when searching for absent value 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart01TestMindmapTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let result: boolean = arr.includes(99);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART01_TEST_MINDMAP_7300
     * @tc.name int32ArrayIncludesPart01TestMindmapTest073
     * @tc.desc Verify includes does not modify the array elements after invocation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart01TestMindmapTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      arr.includes(2);
      expect(arr.$_get(0)).assertEqual(1);
      expect(arr.$_get(1)).assertEqual(2);
      expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART01_TEST_MINDMAP_7400
     * @tc.name int32ArrayIncludesPart01TestMindmapTest074
     * @tc.desc Verify includes does not modify array length after invocation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart01TestMindmapTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let before: int = arr.length;
      arr.includes(3);
      expect(arr.length).assertEqual(before);
    });


  });
}
