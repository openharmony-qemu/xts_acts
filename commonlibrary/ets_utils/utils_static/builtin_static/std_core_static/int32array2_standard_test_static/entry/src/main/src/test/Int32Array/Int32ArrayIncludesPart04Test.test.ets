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

export default function int32ArrayIncludesPart04Test(): void {
  describe('Int32ArrayIncludesPart04Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_0100
     * @tc.name int32ArrayIncludesPart04TestMindmapTest001
     * @tc.desc Verify includes does not modify array elements when element is not found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 6, 7]);
      arr.includes(999);
      expect(arr.$_get(0)).assertEqual(5);
      expect(arr.$_get(1)).assertEqual(6);
      expect(arr.$_get(2)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_0200
     * @tc.name int32ArrayIncludesPart04TestMindmapTest002
     * @tc.desc Verify includes byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      let before: number = arr.byteLength;
      arr.includes(3);
      expect(arr.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_0300
     * @tc.name int32ArrayIncludesPart04TestMindmapTest003
     * @tc.desc Verify includes ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      let buf: ArrayBuffer = arr.buffer;
      arr.includes(1);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_0400
     * @tc.name int32ArrayIncludesPart04TestMindmapTest004
     * @tc.desc Verify includes Number.NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0]);
      let result: boolean = arr.includes(Number.NaN);
      expect(result).assertFalse();
      expect(arr.$_get(0)).assertEqual(0);
      expect(arr.$_get(1)).assertEqual(0);
      expect(arr.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_0500
     * @tc.name int32ArrayIncludesPart04TestMindmapTest005
     * @tc.desc Verify includes fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30, 40]);
      arr.includes(20, -3);
      expect(arr.$_get(0)).assertEqual(10);
      expect(arr.$_get(3)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_0600
     * @tc.name int32ArrayIncludesPart04TestMindmapTest006
     * @tc.desc Verify $_set includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.$_set(1, 42);
      expect(arr.includes(42)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_0700
     * @tc.name int32ArrayIncludesPart04TestMindmapTest007
     * @tc.desc Verify fill includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(5);
      arr.fill(7);
      expect(arr.includes(7)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_0800
     * @tc.name int32ArrayIncludesPart04TestMindmapTest008
     * @tc.desc Verify fill includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      arr.fill(0);
      expect(arr.includes(2)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_0900
     * @tc.name int32ArrayIncludesPart04TestMindmapTest009
     * @tc.desc Verify set(Array) includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      arr.set([100, 200]);
      expect(arr.includes(100)).assertTrue();
      expect(arr.includes(200)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_1000
     * @tc.name int32ArrayIncludesPart04TestMindmapTest010
     * @tc.desc Verify set(TypedArray) includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      let src: Int32Array = new Int32Array([11, 22, 33]);
      arr.set(src, 1);
      expect(arr.includes(22)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_1100
     * @tc.name int32ArrayIncludesPart04TestMindmapTest011
     * @tc.desc Verify reverse includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      arr.reverse();
      expect(arr.includes(1)).assertTrue();
      expect(arr.includes(2)).assertTrue();
      expect(arr.includes(3)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_1200
     * @tc.name int32ArrayIncludesPart04TestMindmapTest012
     * @tc.desc Verify sort includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 1, 2]);
      arr.sort();
      expect(arr.includes(1)).assertTrue();
      expect(arr.includes(2)).assertTrue();
      expect(arr.includes(3)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_1300
     * @tc.name int32ArrayIncludesPart04TestMindmapTest013
     * @tc.desc Verify INT32_MAX includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, 2147483647);
      expect(arr.includes(2147483647)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_1400
     * @tc.name int32ArrayIncludesPart04TestMindmapTest014
     * @tc.desc Verify INT32_MIN includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, -2147483648);
      expect(arr.includes(-2147483648)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_1500
     * @tc.name int32ArrayIncludesPart04TestMindmapTest015
     * @tc.desc Verify -1 includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      arr.$_set(1, -1);
      expect(arr.includes(-1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_1600
     * @tc.name int32ArrayIncludesPart04TestMindmapTest016
     * @tc.desc Verify includes returns false after element is overwritten with a different value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      expect(arr.includes(2)).assertTrue();
      arr.$_set(1, 99);
      expect(arr.includes(2)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_1700
     * @tc.name int32ArrayIncludesPart04TestMindmapTest017
     * @tc.desc Verify includes returns true after element is inserted via $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 0, 3]);
      expect(arr.includes(2)).assertFalse();
      arr.$_set(1, 2);
      expect(arr.includes(2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_1800
     * @tc.name int32ArrayIncludesPart04TestMindmapTest018
     * @tc.desc Verify includes fill false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 6, 7]);
      expect(arr.includes(6)).assertTrue();
      arr.fill(0);
      expect(arr.includes(6)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_1900
     * @tc.name int32ArrayIncludesPart04TestMindmapTest019
     * @tc.desc Verify includes reflects element absence after element is overwritten via $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20]);
      let r1: boolean = arr.includes(20);
      arr.$_set(1, 30);
      let r2: boolean = arr.includes(20);
      expect(r1).assertTrue();
      expect(r2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_2000
     * @tc.name int32ArrayIncludesPart04TestMindmapTest020
     * @tc.desc Verify includes() true searchElement ToNumber 0 found in [0,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 1]);
      let v: number = 0;
      expect(arr.includes(v)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_2100
     * @tc.name int32ArrayIncludesPart04TestMindmapTest021
     * @tc.desc Verify includes returns consistent result on repeated calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r1: boolean = arr.includes(2);
      let r2: boolean = arr.includes(2);
      expect(r1).assertTrue();
      expect(r2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_2200
     * @tc.name int32ArrayIncludesPart04TestMindmapTest022
     * @tc.desc Verify includes returns true for both the first and last elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      expect(arr.includes(10)).assertTrue();
      expect(arr.includes(30)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_2300
     * @tc.name int32ArrayIncludesPart04TestMindmapTest023
     * @tc.desc Verify combining includes results with AND returns true when both elements exist
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let both: boolean = arr.includes(1) && arr.includes(3);
      expect(both).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_2400
     * @tc.name int32ArrayIncludesPart04TestMindmapTest024
     * @tc.desc Verify combining includes results with OR returns true when at least one element exists
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let either: boolean = arr.includes(99) || arr.includes(2);
      expect(either).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_2500
     * @tc.name int32ArrayIncludesPart04TestMindmapTest025
     * @tc.desc Verify includes fill this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      let r: boolean = arr.fill(5).includes(5);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_2600
     * @tc.name int32ArrayIncludesPart04TestMindmapTest026
     * @tc.desc Verify includes reverse this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      let r: boolean = arr.reverse().includes(1);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_2700
     * @tc.name int32ArrayIncludesPart04TestMindmapTest027
     * @tc.desc Verify includes sort this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 1, 2]);
      let r: boolean = arr.sort().includes(2);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_2800
     * @tc.name int32ArrayIncludesPart04TestMindmapTest028
     * @tc.desc Verify fill-reverse-includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0]);
      let r: boolean = arr.fill(9).reverse().includes(9);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_2900
     * @tc.name int32ArrayIncludesPart04TestMindmapTest029
     * @tc.desc Verify includes does not coerce searchElement 3.7 to 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      expect(arr.includes(3.7)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_3000
     * @tc.name int32ArrayIncludesPart04TestMindmapTest030
     * @tc.desc Verify includes does not coerce searchElement -3.7 to -3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-3, 0, 3]);
      expect(arr.includes(-3.7)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_3100
     * @tc.name int32ArrayIncludesPart04TestMindmapTest031
     * @tc.desc Verify includes() searchElement 3.999 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3]);
      expect(arr.includes(3.999)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_3200
     * @tc.name int32ArrayIncludesPart04TestMindmapTest032
     * @tc.desc Verify includes() Number.NaN does not match a stored zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 0, 2]);
      expect(arr.includes(Number.NaN)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_3300
     * @tc.name int32ArrayIncludesPart04TestMindmapTest033
     * @tc.desc Verify includes() positive infinity does not match a stored zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 1]);
      expect(arr.includes(Number.POSITIVE_INFINITY)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_3400
     * @tc.name int32ArrayIncludesPart04TestMindmapTest034
     * @tc.desc Verify includes does not coerce negative infinity searchElement to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0]);
      expect(arr.includes(-Number.POSITIVE_INFINITY)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_3500
     * @tc.name int32ArrayIncludesPart04TestMindmapTest035
     * @tc.desc Verify includes() searchElement 2147483648 -2147483648 INT32_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2147483648]);
      expect(arr.includes(2147483648)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_3600
     * @tc.name int32ArrayIncludesPart04TestMindmapTest036
     * @tc.desc Verify includes() searchElement 2147483649 -2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2147483647]);
      expect(arr.includes(2147483649)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_3700
     * @tc.name int32ArrayIncludesPart04TestMindmapTest037
     * @tc.desc Verify includes() searchElement -2147483649 2147483647 INT32_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647]);
      expect(arr.includes(-2147483649)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_3800
     * @tc.name int32ArrayIncludesPart04TestMindmapTest038
     * @tc.desc Verify includes() searchElement 4294967295 -1 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1]);
      expect(arr.includes(4294967295)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_3900
     * @tc.name int32ArrayIncludesPart04TestMindmapTest039
     * @tc.desc Verify includes() searchElement 4294967296 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0]);
      expect(arr.includes(4294967296)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_4000
     * @tc.name int32ArrayIncludesPart04TestMindmapTest040
     * @tc.desc Verify includes() searchElement -0 +0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0]);
      expect(arr.includes(-0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_4100
     * @tc.name int32ArrayIncludesPart04TestMindmapTest041
     * @tc.desc Verify includes() searchElement 0.5 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0]);
      expect(arr.includes(0.5)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_4200
     * @tc.name int32ArrayIncludesPart04TestMindmapTest042
     * @tc.desc Verify includes() searchElement -0.5 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0]);
      expect(arr.includes(-0.5)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_4300
     * @tc.name int32ArrayIncludesPart04TestMindmapTest043
     * @tc.desc Verify includes() searchElement 1.9 1 1 1.9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2]);
      expect(arr.includes(1.9)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_4400
     * @tc.name int32ArrayIncludesPart04TestMindmapTest044
     * @tc.desc Verify includes() returns false when searchElement 1 not present in [0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0]);
      expect(arr.includes(1)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_4500
     * @tc.name int32ArrayIncludesPart04TestMindmapTest045
     * @tc.desc Verify includes() 1 true ToNumber 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1]);
      expect(arr.includes(1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_4600
     * @tc.name int32ArrayIncludesPart04TestMindmapTest046
     * @tc.desc Verify subarray includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([1, 2, 3, 4]);
      let child: Int32Array = parent.subarray(1, 3);
      parent.$_set(1, 77);
      expect(child.includes(77)).assertTrue();
      {
        let parent: Int32Array = new Int32Array([1, 2, 3, 4]);
        let child: Int32Array = parent.subarray(1, 3);
        child.$_set(0, 88);
        expect(parent.includes(88)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_4700
     * @tc.name int32ArrayIncludesPart04TestMindmapTest047
     * @tc.desc Verify subarray includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([10, 20, 30, 40]);
      let child: Int32Array = parent.subarray(1, 3);
      expect(child.includes(10)).assertFalse();
      expect(child.includes(40)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_4800
     * @tc.name int32ArrayIncludesPart04TestMindmapTest048
     * @tc.desc Verify subarray includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([10, 20, 30, 40]);
      let child: Int32Array = parent.subarray(1, 3);
      expect(child.includes(20)).assertTrue();
      expect(child.includes(30)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_4900
     * @tc.name int32ArrayIncludesPart04TestMindmapTest049
     * @tc.desc Verify ArrayBuffer Int32Array includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf, 0, 2);
      let b: Int32Array = new Int32Array(buf, 8, 2);
      a.$_set(0, 111);
      expect(b.includes(111)).assertFalse();
      b.$_set(0, 222);
      expect(a.includes(222)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_5000
     * @tc.name int32ArrayIncludesPart04TestMindmapTest050
     * @tc.desc Verify ArrayBuffer includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf, 0, 3);
      let b: Int32Array = new Int32Array(buf, 4, 3);
      a.$_set(1, 555);
      expect(b.includes(555)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_5100
     * @tc.name int32ArrayIncludesPart04TestMindmapTest051
     * @tc.desc Verify slice includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig: Int32Array = new Int32Array([1, 2, 3]);
      let cp: Int32Array = orig.slice();
      orig.$_set(0, 999);
      expect(cp.includes(999)).assertFalse();
      expect(cp.includes(1)).assertTrue();
      {
        let orig: Int32Array = new Int32Array([1, 2, 3]);
        let cp: Int32Array = orig.slice();
        cp.$_set(0, 888);
        expect(orig.includes(888)).assertFalse();
        expect(orig.includes(1)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_5200
     * @tc.name int32ArrayIncludesPart04TestMindmapTest052
     * @tc.desc Verify fill subarray includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array(4);
      let child: Int32Array = parent.subarray(0, 4);
      parent.fill(42);
      expect(child.includes(42)).assertTrue();
      {
        let parent: Int32Array = new Int32Array(4);
        let child: Int32Array = parent.subarray(1, 3);
        child.fill(7);
        expect(parent.includes(7)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_5300
     * @tc.name int32ArrayIncludesPart04TestMindmapTest053
     * @tc.desc Verify ArrayBuffer Int32Array includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let view: Int32Array = new Int32Array(buf);
      let u8: Uint8Array = new Uint8Array(buf);
      u8.$_set(0, 0x78);
      u8.$_set(1, 0x56);
      u8.$_set(2, 0x34);
      u8.$_set(3, 0x12);
      expect(view.includes(0x12345678)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_5400
     * @tc.name int32ArrayIncludesPart04TestMindmapTest054
     * @tc.desc Verify includes returns true for value in offset view when set via overlapping full view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let full: Int32Array = new Int32Array(buf);
      let offset: Int32Array = new Int32Array(buf, 8, 3);
      full.$_set(2, 99);
      expect(offset.includes(99)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_5500
     * @tc.name int32ArrayIncludesPart04TestMindmapTest055
     * @tc.desc Verify includes returns false for value outside the range of an offset view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(20);
      let full: Int32Array = new Int32Array(buf);
      let offset: Int32Array = new Int32Array(buf, 8, 3);
      full.$_set(0, 77);
      expect(offset.includes(77)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_5600
     * @tc.name int32ArrayIncludesPart04TestMindmapTest056
     * @tc.desc Verify includes returns true for values visible through overlapping buffer views
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let a: Int32Array = new Int32Array(buf, 0, 2);
      let b: Int32Array = new Int32Array(buf, 4, 2);
      let c: Int32Array = new Int32Array(buf, 0, 3);
      a.$_set(0, 1);
      b.$_set(1, 2);
      expect(c.includes(1)).assertTrue();
      expect(c.includes(2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_5700
     * @tc.name int32ArrayIncludesPart04TestMindmapTest057
     * @tc.desc Verify fill reverse includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      arr.fill(0, 1, 3).reverse();
      expect(arr.includes(1)).assertTrue();
      expect(arr.includes(0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_5800
     * @tc.name int32ArrayIncludesPart04TestMindmapTest058
     * @tc.desc Verify set sort includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      let src: Int32Array = new Int32Array([30, 10, 20]);
      arr.set(src);
      arr.sort();
      expect(arr.includes(10)).assertTrue();
      expect(arr.includes(20)).assertTrue();
      expect(arr.includes(30)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_5900
     * @tc.name int32ArrayIncludesPart04TestMindmapTest059
     * @tc.desc Verify copyWithin includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 3);
      expect(arr.includes(4)).assertTrue();
      expect(arr.includes(5)).assertTrue();
      expect(arr.includes(1)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_6000
     * @tc.name int32ArrayIncludesPart04TestMindmapTest060
     * @tc.desc Verify subarray fill includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let sub: Int32Array = parent.subarray(1, 4);
      sub.fill(0);
      expect(parent.includes(0)).assertTrue();
      expect(parent.includes(1)).assertTrue();
      expect(parent.includes(5)).assertTrue();
      expect(parent.includes(2)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_6100
     * @tc.name int32ArrayIncludesPart04TestMindmapTest061
     * @tc.desc Verify subarray sort includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([0, 3, 1, 2, 0]);
      let sub: Int32Array = parent.subarray(1, 4);
      sub.sort();
      expect(parent.includes(1)).assertTrue();
      expect(parent.includes(2)).assertTrue();
      expect(parent.includes(3)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_6200
     * @tc.name int32ArrayIncludesPart04TestMindmapTest062
     * @tc.desc Verify subarray reverse includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([0, 1, 2, 3, 0]);
      let sub: Int32Array = parent.subarray(1, 4);
      sub.reverse();
      expect(parent.$_get(1)).assertEqual(3);
      expect(parent.$_get(3)).assertEqual(1);
      expect(parent.includes(1)).assertTrue();
      expect(parent.includes(3)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_6300
     * @tc.name int32ArrayIncludesPart04TestMindmapTest063
     * @tc.desc Verify includes() fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.fill(2147483647);
      expect(arr.includes(2147483647)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_6400
     * @tc.name int32ArrayIncludesPart04TestMindmapTest064
     * @tc.desc Verify includes() fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.fill(-2147483648);
      expect(arr.includes(-2147483648)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_6500
     * @tc.name int32ArrayIncludesPart04TestMindmapTest065
     * @tc.desc Verify includes returns true when all elements are the same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([5, 5, 5, 5]);
      expect(arr.includes(5)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_6600
     * @tc.name int32ArrayIncludesPart04TestMindmapTest066
     * @tc.desc Verify includes returns true for negative elements in a mixed-sign array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, -1, 2, -2, 3]);
      expect(arr.includes(-2)).assertTrue();
      expect(arr.includes(-1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_6700
     * @tc.name int32ArrayIncludesPart04TestMindmapTest067
     * @tc.desc Verify of includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(100, 200, 300);
      expect(arr.includes(200)).assertTrue();
      expect(arr.includes(400)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_6800
     * @tc.name int32ArrayIncludesPart04TestMindmapTest068
     * @tc.desc Verify from includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: int[] = [10, 20, 30];
      let arr: Int32Array = Int32Array.from(src);
      expect(arr.includes(20)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_6900
     * @tc.name int32ArrayIncludesPart04TestMindmapTest069
     * @tc.desc Verify from TypedArray includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([7, 8, 9]);
      let arr: Int32Array = Int32Array.from(src);
      expect(arr.includes(8)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_7000
     * @tc.name int32ArrayIncludesPart04TestMindmapTest070
     * @tc.desc Verify includes() fill fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0, 0, 0, 0]);
      arr.fill(1, 2, 4);
      expect(arr.includes(1, 2)).assertTrue();
      expect(arr.includes(1, 4)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_7100
     * @tc.name int32ArrayIncludesPart04TestMindmapTest071
     * @tc.desc Verify includes() reverse fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      arr.reverse();
      expect(arr.includes(1, -1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_7200
     * @tc.name int32ArrayIncludesPart04TestMindmapTest072
     * @tc.desc Verify includes() subarray fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
      let sub: Int32Array = parent.subarray(1, 5);
      expect(sub.includes(4, 2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_7300
     * @tc.name int32ArrayIncludesPart04TestMindmapTest073
     * @tc.desc Verify includes() fromIndex=length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      arr.$_set(3, 77);
      expect(arr.includes(77, 3)).assertTrue();
      expect(arr.includes(77, 4)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_7400
     * @tc.name int32ArrayIncludesPart04TestMindmapTest074
     * @tc.desc Verify includes() sort fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 1, 2]);
      arr.sort();
      expect(arr.includes(1, 0)).assertTrue();
      expect(arr.includes(3, 2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_7500
     * @tc.name int32ArrayIncludesPart04TestMindmapTest075
     * @tc.desc Verify fill(Number.NaN ToInt32 0 0) includes(0) true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.fill(Number.NaN);
      expect(arr.includes(0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_7600
     * @tc.name int32ArrayIncludesPart04TestMindmapTest076
     * @tc.desc Verify -0 $_set 0 includes(0) includes(-0) true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, -0);
      expect(arr.includes(0)).assertTrue();
      expect(arr.includes(-0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_7700
     * @tc.name int32ArrayIncludesPart04TestMindmapTest077
     * @tc.desc Verify 0 includes(0) ToInt32 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([1, 0, 2]);
      let sub: Int32Array = parent.subarray(0, 3);
      expect(sub.includes(0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_7800
     * @tc.name int32ArrayIncludesPart04TestMindmapTest078
     * @tc.desc Verify buffer 0 includes(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let a: Int32Array = new Int32Array(buf);
      let b: Int32Array = new Int32Array(buf);
      a.$_set(0, 0);
      expect(b.includes(0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_7900
     * @tc.name int32ArrayIncludesPart04TestMindmapTest079
     * @tc.desc Verify includes() returns false for an empty Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      expect(arr.includes(1)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_8000
     * @tc.name int32ArrayIncludesPart04TestMindmapTest080
     * @tc.desc Verify length=1 includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, 42);
      expect(arr.includes(42)).assertTrue();
      expect(arr.includes(42, 0)).assertTrue();
      expect(arr.includes(42, 1)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_8100
     * @tc.name int32ArrayIncludesPart04TestMindmapTest081
     * @tc.desc Verify includes() length=1 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1]);
      expect(arr.includes(-1, -1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_8200
     * @tc.name int32ArrayIncludesPart04TestMindmapTest082
     * @tc.desc Verify includes returns false on empty array and true on non-empty array for the same element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let empty: Int32Array = new Int32Array(0);
      let nonempty: Int32Array = new Int32Array([1]);
      expect(empty.includes(1)).assertFalse();
      expect(nonempty.includes(1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_8300
     * @tc.name int32ArrayIncludesPart04TestMindmapTest083
     * @tc.desc Verify includes fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      expect(arr.includes(10, 0)).assertTrue();
      expect(arr.includes(20, 1)).assertTrue();
      expect(arr.includes(30, 2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_8400
     * @tc.name int32ArrayIncludesPart04TestMindmapTest084
     * @tc.desc Verify includes() fromIndex false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([10, 20, 30]);
      expect(arr.includes(10, 1)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_8500
     * @tc.name int32ArrayIncludesPart04TestMindmapTest085
     * @tc.desc Verify includes() fromIndex false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      arr.$_set(0, 99);
      expect(arr.includes(99, 1000000)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INCLUDES_PART04_TEST_MINDMAP_8600
     * @tc.name int32ArrayIncludesPart04TestMindmapTest086
     * @tc.desc Verify includes() fromIndex<-length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIncludesPart04TestMindmapTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      arr.$_set(0, 99);
      expect(arr.includes(99, -1000000)).assertTrue();
    });
  });
}
