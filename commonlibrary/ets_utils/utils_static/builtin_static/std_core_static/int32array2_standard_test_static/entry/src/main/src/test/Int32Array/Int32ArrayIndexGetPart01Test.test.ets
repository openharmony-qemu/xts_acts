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

export default function int32ArrayIndexGetPart01Test(): void {
  describe('Int32ArrayIndexGetPart01Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART01_TEST_MINDMAP_0100
     * @tc.name int32ArrayIndexGetPart01TestMindmapTest001
     * @tc.desc Verify arity - of $_get(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart01TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(10, 20);
      let v: number = values.$_get(0);
      expect(v).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART01_TEST_MINDMAP_0200
     * @tc.name int32ArrayIndexGetPart01TestMindmapTest002
     * @tc.desc Verify - new Int32Array(length) $_get 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart01TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = new Int32Array(3);
      expect(values.$_get(0)).assertEqual(0);
      expect(values.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART01_TEST_MINDMAP_0300
     * @tc.name int32ArrayIndexGetPart01TestMindmapTest003
     * @tc.desc Verify $_get() index=0 - 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart01TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(42);
      expect(values.$_get(0)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART01_TEST_MINDMAP_0400
     * @tc.name int32ArrayIndexGetPart01TestMindmapTest004
     * @tc.desc Verify $_get() index=0 -
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart01TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(7, 8, 9);
      expect(values.$_get(0)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART01_TEST_MINDMAP_0500
     * @tc.name int32ArrayIndexGetPart01TestMindmapTest005
     * @tc.desc Verify $_get() index=0 - ArrayBuffer offset=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart01TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(12);
      const values: Int32Array = new Int32Array(buf, 0, 3);
      values.$_set(0, 111);
      expect(values.$_get(0)).assertEqual(111);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART01_TEST_MINDMAP_0600
     * @tc.name int32ArrayIndexGetPart01TestMindmapTest006
     * @tc.desc Verify $_get() index=0 - ArrayBuffer byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart01TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const values: Int32Array = new Int32Array(buf, 4, 2);
      values.$_set(0, 222);
      expect(values.$_get(0)).assertEqual(222);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART01_TEST_MINDMAP_0700
     * @tc.name int32ArrayIndexGetPart01TestMindmapTest007
     * @tc.desc Verify $_get() index=0 - from([...])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart01TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.from([5, 6, 7]);
      expect(values.$_get(0)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART01_TEST_MINDMAP_0800
     * @tc.name int32ArrayIndexGetPart01TestMindmapTest008
     * @tc.desc Verify $_get() index=1 -
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart01TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(-5, -6);
      expect(values.$_get(1)).assertEqual(-6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART01_TEST_MINDMAP_0900
     * @tc.name int32ArrayIndexGetPart01TestMindmapTest009
     * @tc.desc Verify $_get() index=2 -
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart01TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(100, 200, 300, 400);
      expect(values.$_get(2)).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART01_TEST_MINDMAP_1000
     * @tc.name int32ArrayIndexGetPart01TestMindmapTest010
     * @tc.desc Verify $_get() index=1 - ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart01TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const values: Int32Array = new Int32Array(buf, 4, 3);
      values.$_set(1, 777);
      expect(values.$_get(1)).assertEqual(777);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART01_TEST_MINDMAP_1100
     * @tc.name int32ArrayIndexGetPart01TestMindmapTest011
     * @tc.desc Verify $_get() index=length-1 - length-1=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart01TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(99);
      expect(values.$_get(values.length - 1)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART01_TEST_MINDMAP_1200
     * @tc.name int32ArrayIndexGetPart01TestMindmapTest012
     * @tc.desc Verify $_get() index=length-1 -
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart01TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(1, 2);
      expect(values.$_get(values.length - 1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART01_TEST_MINDMAP_1300
     * @tc.name int32ArrayIndexGetPart01TestMindmapTest013
     * @tc.desc Verify $_get() index=length-1 -
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart01TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(10, 20, 30, -999);
      expect(values.$_get(values.length - 1)).assertEqual(-999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART01_TEST_MINDMAP_1400
     * @tc.name int32ArrayIndexGetPart01TestMindmapTest014
     * @tc.desc Verify $_get() index=length-1 - ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart01TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(20);
      const values: Int32Array = new Int32Array(buf, 0, 5);
      values.$_set(values.length - 1, 555);
      expect(values.$_get(values.length - 1)).assertEqual(555);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART01_TEST_MINDMAP_1500
     * @tc.name int32ArrayIndexGetPart01TestMindmapTest015
     * @tc.desc Verify $_get() index=length-1 - from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart01TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: int[] = [3, 6, 9, 12, 15];
      const values: Int32Array = Int32Array.from(src);
      expect(values.$_get(values.length - 1)).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART01_TEST_MINDMAP_1600
     * @tc.name int32ArrayIndexGetPart01TestMindmapTest016
     * @tc.desc Verify $_get() index=length-1 - of INT_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart01TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(0, 2147483647);
      expect(values.$_get(values.length - 1)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART01_TEST_MINDMAP_1700
     * @tc.name int32ArrayIndexGetPart01TestMindmapTest017
     * @tc.desc Verify $_get() new Int32Array(length) - 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart01TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = new Int32Array(4);
      expect(values.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART01_TEST_MINDMAP_1800
     * @tc.name int32ArrayIndexGetPart01TestMindmapTest018
     * @tc.desc Verify $_get() Int32Array.of( ) -
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart01TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(-7);
      expect(values.$_get(0)).assertEqual(-7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART01_TEST_MINDMAP_1900
     * @tc.name int32ArrayIndexGetPart01TestMindmapTest019
     * @tc.desc Verify $_get() Int32Array.of( ) -
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart01TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(11, 22, 33, 44);
      expect(values.$_get(2)).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART01_TEST_MINDMAP_2000
     * @tc.name int32ArrayIndexGetPart01TestMindmapTest020
     * @tc.desc Verify $_get() Int32Array.from(FixedArray<int>) -
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart01TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: int[] = [7, 14, 21];
      const values: Int32Array = Int32Array.from(src);
      expect(values.$_get(0)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART01_TEST_MINDMAP_2100
     * @tc.name int32ArrayIndexGetPart01TestMindmapTest021
     * @tc.desc Verify $_get() new Int32Array(ArrayBuffer, byteOffset, length) -
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart01TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(24);
      const values: Int32Array = new Int32Array(buf, 8, 3);
      values.$_set(0, 301);
      values.$_set(2, 303);
      expect(values.$_get(0)).assertEqual(301);
      expect(values.$_get(2)).assertEqual(303);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART01_TEST_MINDMAP_2200
     * @tc.name int32ArrayIndexGetPart01TestMindmapTest022
     * @tc.desc Verify $_get() new Int32Array(ArrayBuffer) buffer -
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart01TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const values: Int32Array = new Int32Array(buf);
      values.$_set(1, 66);
      expect(values.$_get(1)).assertEqual(66);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART01_TEST_MINDMAP_2300
     * @tc.name int32ArrayIndexGetPart01TestMindmapTest023
     * @tc.desc Verify $_get() new Int32Array(ArrayBuffer, byteOffset) length -
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart01TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      const values: Int32Array = new Int32Array(buf, 4);
      values.$_set(0, 888);
      expect(values.$_get(0)).assertEqual(888);
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART01_TEST_MINDMAP_2400
     * @tc.name int32ArrayIndexGetPart01TestMindmapTest024
     * @tc.desc Verify $_get() new Int32Array(TypedArray) Int32Array -
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart01TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Int32Array = Int32Array.of(55, 66, 77);
      const values: Int32Array = new Int32Array(src);
      expect(values.$_get(1)).assertEqual(66);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART01_TEST_MINDMAP_2500
     * @tc.name int32ArrayIndexGetPart01TestMindmapTest025
     * @tc.desc Verify $_get() index=0 INT_MIN INT_MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart01TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(-2147483648, 0);
      expect(values.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART01_TEST_MINDMAP_2600
     * @tc.name int32ArrayIndexGetPart01TestMindmapTest026
     * @tc.desc Verify $_get() index=1 INT_MAX INT_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart01TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(0, 2147483647);
      expect(values.$_get(1)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART01_TEST_MINDMAP_2700
     * @tc.name int32ArrayIndexGetPart01TestMindmapTest027
     * @tc.desc Verify $_get() index=0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart01TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = new Int32Array(1);
      expect(values.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART01_TEST_MINDMAP_2800
     * @tc.name int32ArrayIndexGetPart01TestMindmapTest028
     * @tc.desc Verify $_get() index=0 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart01TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(-1);
      expect(values.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART01_TEST_MINDMAP_2900
     * @tc.name int32ArrayIndexGetPart01TestMindmapTest029
     * @tc.desc Verify $_get() index=0 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart01TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(1);
      expect(values.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART01_TEST_MINDMAP_3000
     * @tc.name int32ArrayIndexGetPart01TestMindmapTest030
     * @tc.desc Verify $_get returns each element from Int32Array.of in sequential order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart01TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(10, 20, 30, 40);
      expect(values.$_get(0)).assertEqual(10);
      expect(values.$_get(1)).assertEqual(20);
      expect(values.$_get(2)).assertEqual(30);
      expect(values.$_get(3)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART01_TEST_MINDMAP_3100
     * @tc.name int32ArrayIndexGetPart01TestMindmapTest031
     * @tc.desc Verify $_get() index=0 -42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart01TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(-42);
      expect(values.$_get(0)).assertEqual(-42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART01_TEST_MINDMAP_3200
     * @tc.name int32ArrayIndexGetPart01TestMindmapTest032
     * @tc.desc Verify $_get() index=0 INT_MAX-1 = 2147483646
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart01TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(2147483646);
      expect(values.$_get(0)).assertEqual(2147483646);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART01_TEST_MINDMAP_3300
     * @tc.name int32ArrayIndexGetPart01TestMindmapTest033
     * @tc.desc Verify $_get() index=0 INT_MIN+1 = -2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart01TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(-2147483647);
      expect(values.$_get(0)).assertEqual(-2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART01_TEST_MINDMAP_3400
     * @tc.name int32ArrayIndexGetPart01TestMindmapTest034
     * @tc.desc Verify $_set(0,v) $_get(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart01TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = new Int32Array(2);
      values.$_set(0, 123);
      expect(values.$_get(0)).assertEqual(123);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART01_TEST_MINDMAP_3500
     * @tc.name int32ArrayIndexGetPart01TestMindmapTest035
     * @tc.desc Verify $_set(1,v) $_get(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart01TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = new Int32Array(2);
      values.$_set(0, 11);
      values.$_set(1, 22);
      expect(values.$_get(0)).assertEqual(11);
      expect(values.$_get(1)).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART01_TEST_MINDMAP_3600
     * @tc.name int32ArrayIndexGetPart01TestMindmapTest036
     * @tc.desc Verify $_set(length-1, v) $_get(length-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart01TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = new Int32Array(4);
      values.$_set(values.length - 1, 7777);
      expect(values.$_get(values.length - 1)).assertEqual(7777);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART01_TEST_MINDMAP_3700
     * @tc.name int32ArrayIndexGetPart01TestMindmapTest037
     * @tc.desc Verify $_get returns updated value after $_set mutation at same index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart01TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(1, 2, 3);
      values.$_set(1, 999);
      expect(values.$_get(1)).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART01_TEST_MINDMAP_3800
     * @tc.name int32ArrayIndexGetPart01TestMindmapTest038
     * @tc.desc Verify $_set(number) Number.NaN ToInt32 0 $_get 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart01TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = new Int32Array(1);
      values.$_set(0, Number.NaN);
      expect(values.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART01_TEST_MINDMAP_3900
     * @tc.name int32ArrayIndexGetPart01TestMindmapTest039
     * @tc.desc Verify $_set(number) +Number.POSITIVE_INFINITY ToInt32 0 $_get 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart01TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = new Int32Array(1);
      values.$_set(0, Number.POSITIVE_INFINITY);
      expect(values.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART01_TEST_MINDMAP_4000
     * @tc.name int32ArrayIndexGetPart01TestMindmapTest040
     * @tc.desc Verify $_set(number) -Number.POSITIVE_INFINITY ToInt32 0 $_get 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart01TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = new Int32Array(1);
      values.$_set(0, -Number.POSITIVE_INFINITY);
      expect(values.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART01_TEST_MINDMAP_4100
     * @tc.name int32ArrayIndexGetPart01TestMindmapTest041
     * @tc.desc Verify $_set(number) 0.5 0 $_get 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart01TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = new Int32Array(1);
      values.$_set(0, 0.5);
      expect(values.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART01_TEST_MINDMAP_4200
     * @tc.name int32ArrayIndexGetPart01TestMindmapTest042
     * @tc.desc Verify $_set(number) -0.9 0 $_get 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart01TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = new Int32Array(1);
      values.$_set(0, -0.9);
      expect(values.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART01_TEST_MINDMAP_4300
     * @tc.name int32ArrayIndexGetPart01TestMindmapTest043
     * @tc.desc Verify $_set(number) 2147483647.9 2147483647 $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart01TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = new Int32Array(1);
      values.$_set(0, 2147483647.9);
      expect(values.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART01_TEST_MINDMAP_4400
     * @tc.name int32ArrayIndexGetPart01TestMindmapTest044
     * @tc.desc Verify $_set(number) 2147483648 -2147483648 $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart01TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = new Int32Array(1);
      values.$_set(0, 2147483648.0);
      expect(values.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART01_TEST_MINDMAP_4500
     * @tc.name int32ArrayIndexGetPart01TestMindmapTest045
     * @tc.desc Verify $_set(number) -2147483649 2147483647 $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart01TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = new Int32Array(1);
      values.$_set(0, -2147483649.0);
      expect(values.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART01_TEST_MINDMAP_4600
     * @tc.name int32ArrayIndexGetPart01TestMindmapTest046
     * @tc.desc Verify Int32Array.from(array, mapfn) $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart01TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: number[] = [1, 2, 3];
      const values: Int32Array = Int32Array.from(src, (v: number): number => v * 10);
      expect(values.$_get(0)).assertEqual(10);
      expect(values.$_get(1)).assertEqual(20);
      expect(values.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART01_TEST_MINDMAP_4700
     * @tc.name int32ArrayIndexGetPart01TestMindmapTest047
     * @tc.desc Verify $_get() index 0x0 =0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart01TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(77, 88);
      expect(values.$_get(0x0)).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART01_TEST_MINDMAP_4800
     * @tc.name int32ArrayIndexGetPart01TestMindmapTest048
     * @tc.desc Verify $_get() index 0x1 =1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart01TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(11, 22, 33);
      expect(values.$_get(0x1)).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART01_TEST_MINDMAP_4900
     * @tc.name int32ArrayIndexGetPart01TestMindmapTest049
     * @tc.desc Verify $_get() index 0b10 =2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart01TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = Int32Array.of(-1, -2, -3);
      expect(values.$_get(0b10)).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART01_TEST_MINDMAP_5000
     * @tc.name int32ArrayIndexGetPart01TestMindmapTest050
     * @tc.desc Verify $_get returns value at index 7 after $_set in 16-element Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart01TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = new Int32Array(16);
      values.$_set(7, 700);
      expect(values.$_get(7)).assertEqual(700);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART01_TEST_MINDMAP_5100
     * @tc.name int32ArrayIndexGetPart01TestMindmapTest051
     * @tc.desc Verify $_get returns value at index 15 after $_set in 16-element Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart01TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = new Int32Array(16);
      values.$_set(15, 1500);
      expect(values.$_get(15)).assertEqual(1500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_INDEX_GET_PART01_TEST_MINDMAP_5200
     * @tc.name int32ArrayIndexGetPart01TestMindmapTest052
     * @tc.desc Verify $_get returns value at mid-index 50 after $_set in 100-element Int32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayIndexGetPart01TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Int32Array = new Int32Array(100);
      values.$_set(50, 5050);
      expect(values.$_get(50)).assertEqual(5050);
    });
  });
}
