'use static';


/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http:
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

export default function int32ArrayValueOfPart01TestMindmapTest(): void {
  describe('int32ArrayValueOfPart01TestMindmapTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART01_TEST_MINDMAP_0100
     * @tc.name int32ArrayValueOfPart01TestMindmapTest001
     * @tc.desc Verify 0 valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart01TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array();
      let r: Int32Array = arr.valueOf();
      expect(r).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART01_TEST_MINDMAP_0200
     * @tc.name int32ArrayValueOfPart01TestMindmapTest002
     * @tc.desc Verify 0 valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart01TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(1, 2, 3);
      let r: Int32Array = arr.valueOf();
      expect(r).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART01_TEST_MINDMAP_0300
     * @tc.name int32ArrayValueOfPart01TestMindmapTest003
     * @tc.desc Verify 0 valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart01TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(42);
      let r: Int32Array = arr.valueOf();
      expect(r).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART01_TEST_MINDMAP_0400
     * @tc.name int32ArrayValueOfPart01TestMindmapTest004
     * @tc.desc Verify new Int32Array() valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart01TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let empty: Int32Array = new Int32Array();
      expect(empty.valueOf()).assertEqual(empty);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART01_TEST_MINDMAP_0500
     * @tc.name int32ArrayValueOfPart01TestMindmapTest005
     * @tc.desc Verify valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart01TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let empty: Int32Array = new Int32Array();
      let first: Int32Array = empty.valueOf();
      let second: Int32Array = first.valueOf();
      expect(second).assertEqual(empty);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART01_TEST_MINDMAP_0600
     * @tc.name int32ArrayValueOfPart01TestMindmapTest006
     * @tc.desc Verify int 0 valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart01TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(0);
      expect(a.valueOf()).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART01_TEST_MINDMAP_0700
     * @tc.name int32ArrayValueOfPart01TestMindmapTest007
     * @tc.desc Verify int 1 valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart01TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(1);
      expect(a.valueOf()).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART01_TEST_MINDMAP_0800
     * @tc.name int32ArrayValueOfPart01TestMindmapTest008
     * @tc.desc Verify Int32Array valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart01TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.of(5);
      let a: Int32Array = new Int32Array(src);
      expect(a.valueOf()).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART01_TEST_MINDMAP_0900
     * @tc.name int32ArrayValueOfPart01TestMindmapTest009
     * @tc.desc Verify Int32Array valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart01TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.of(1, 2, 3, 4);
      let a: Int32Array = new Int32Array(src);
      expect(a.valueOf()).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART01_TEST_MINDMAP_1000
     * @tc.name int32ArrayValueOfPart01TestMindmapTest010
     * @tc.desc Verify INT_MAX Int32Array valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart01TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.of(2147483647);
      let a: Int32Array = new Int32Array(src);
      expect(a.valueOf()).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART01_TEST_MINDMAP_1100
     * @tc.name int32ArrayValueOfPart01TestMindmapTest011
     * @tc.desc Verify INT_MIN Int32Array valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart01TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.of(-2147483648);
      let a: Int32Array = new Int32Array(src);
      expect(a.valueOf()).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART01_TEST_MINDMAP_1200
     * @tc.name int32ArrayValueOfPart01TestMindmapTest012
     * @tc.desc Verify 0 Int32Array valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart01TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.of(0);
      let a: Int32Array = new Int32Array(src);
      expect(a.valueOf()).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART01_TEST_MINDMAP_1300
     * @tc.name int32ArrayValueOfPart01TestMindmapTest013
     * @tc.desc Verify Int32Array valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart01TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.of(-1, -2, -3);
      let a: Int32Array = new Int32Array(src);
      expect(a.valueOf()).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART01_TEST_MINDMAP_1400
     * @tc.name int32ArrayValueOfPart01TestMindmapTest014
     * @tc.desc Verify subarray valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart01TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.of(10, 20, 30);
      let sub: Int32Array = src.subarray(1);
      let a: Int32Array = new Int32Array(sub);
      expect(a.valueOf()).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART01_TEST_MINDMAP_1500
     * @tc.name int32ArrayValueOfPart01TestMindmapTest015
     * @tc.desc Verify byteOffset valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart01TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let view: Int32Array = new Int32Array(buf, 4, 2);
      let a: Int32Array = new Int32Array(view);
      expect(a.valueOf()).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART01_TEST_MINDMAP_1600
     * @tc.name int32ArrayValueOfPart01TestMindmapTest016
     * @tc.desc Verify FixedArray valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart01TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let empty: FixedArray<number> = [];
      let a: Int32Array = new Int32Array(empty);
      expect(a.valueOf()).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART01_TEST_MINDMAP_1700
     * @tc.name int32ArrayValueOfPart01TestMindmapTest017
     * @tc.desc Verify FixedArray[1.0] valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart01TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1.0]);
      expect(a.valueOf()).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART01_TEST_MINDMAP_1800
     * @tc.name int32ArrayValueOfPart01TestMindmapTest018
     * @tc.desc Verify FixedArray valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart01TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1.0, 2.0, 3.0]);
      expect(a.valueOf()).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART01_TEST_MINDMAP_1900
     * @tc.name int32ArrayValueOfPart01TestMindmapTest019
     * @tc.desc Verify 0.0 FixedArray valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart01TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([0.0]);
      expect(a.valueOf()).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART01_TEST_MINDMAP_2000
     * @tc.name int32ArrayValueOfPart01TestMindmapTest020
     * @tc.desc Verify -1.0 FixedArray valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart01TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([-1.0]);
      expect(a.valueOf()).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART01_TEST_MINDMAP_2100
     * @tc.name int32ArrayValueOfPart01TestMindmapTest021
     * @tc.desc Verify INT_MAXnumber FixedArray valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart01TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([2147483647.0]);
      expect(a.valueOf()).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART01_TEST_MINDMAP_2200
     * @tc.name int32ArrayValueOfPart01TestMindmapTest022
     * @tc.desc Verify INT_MINnumber FixedArray valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart01TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([-2147483648.0]);
      expect(a.valueOf()).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART01_TEST_MINDMAP_2300
     * @tc.name int32ArrayValueOfPart01TestMindmapTest023
     * @tc.desc Verify Number.NaN FixedArray valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart01TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([Number.NaN]);
      expect(a.valueOf()).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART01_TEST_MINDMAP_2400
     * @tc.name int32ArrayValueOfPart01TestMindmapTest024
     * @tc.desc Verify 0.5 FixedArray valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart01TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([0.5]);
      expect(a.valueOf()).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART01_TEST_MINDMAP_2500
     * @tc.name int32ArrayValueOfPart01TestMindmapTest025
     * @tc.desc Verify -0.9 FixedArray valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart01TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([-0.9]);
      expect(a.valueOf()).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART01_TEST_MINDMAP_2600
     * @tc.name int32ArrayValueOfPart01TestMindmapTest026
     * @tc.desc Verify 2147483647.9 FixedArray valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart01TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([2147483647.9]);
      expect(a.valueOf()).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART01_TEST_MINDMAP_2700
     * @tc.name int32ArrayValueOfPart01TestMindmapTest027
     * @tc.desc Verify FixedArray valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart01TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([1.0, -1.0, 2.0, -2.0]);
      expect(a.valueOf()).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART01_TEST_MINDMAP_2800
     * @tc.name int32ArrayValueOfPart01TestMindmapTest028
     * @tc.desc Verify 0FixedArray valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart01TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([0.0, 0.0, 0.0]);
      expect(a.valueOf()).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART01_TEST_MINDMAP_2900
     * @tc.name int32ArrayValueOfPart01TestMindmapTest029
     * @tc.desc Verify 0 ArrayBuffer valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart01TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(new ArrayBuffer(0));
      expect(a.valueOf()).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART01_TEST_MINDMAP_3000
     * @tc.name int32ArrayValueOfPart01TestMindmapTest030
     * @tc.desc Verify 4 ArrayBuffer valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart01TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(new ArrayBuffer(4));
      expect(a.valueOf()).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART01_TEST_MINDMAP_3100
     * @tc.name int32ArrayValueOfPart01TestMindmapTest031
     * @tc.desc Verify 8 ArrayBuffer valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart01TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(new ArrayBuffer(8));
      expect(a.valueOf()).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART01_TEST_MINDMAP_3200
     * @tc.name int32ArrayValueOfPart01TestMindmapTest032
     * @tc.desc Verify 12 ArrayBuffer valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart01TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(new ArrayBuffer(12));
      expect(a.valueOf()).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART01_TEST_MINDMAP_3300
     * @tc.name int32ArrayValueOfPart01TestMindmapTest033
     * @tc.desc Verify ArrayBuffer byteOffset4 valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart01TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf, 4);
      expect(a.valueOf()).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART01_TEST_MINDMAP_3400
     * @tc.name int32ArrayValueOfPart01TestMindmapTest034
     * @tc.desc Verify ArrayBuffer byteOffset4 1 valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart01TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf, 4, 1);
      expect(a.valueOf()).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART01_TEST_MINDMAP_3500
     * @tc.name int32ArrayValueOfPart01TestMindmapTest035
     * @tc.desc Verify ArrayBuffer byteOffset8 2 valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart01TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(24);
      let a: Int32Array = new Int32Array(buf, 8, 2);
      expect(a.valueOf()).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART01_TEST_MINDMAP_3600
     * @tc.name int32ArrayValueOfPart01TestMindmapTest036
     * @tc.desc Verify Int32Array.of() valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart01TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of();
      expect(a.valueOf()).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART01_TEST_MINDMAP_3700
     * @tc.name int32ArrayValueOfPart01TestMindmapTest037
     * @tc.desc Verify Int32Array.of(1) valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart01TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1);
      expect(a.valueOf()).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART01_TEST_MINDMAP_3800
     * @tc.name int32ArrayValueOfPart01TestMindmapTest038
     * @tc.desc Verify Int32Array.of(1,2,3) valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart01TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      expect(a.valueOf()).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART01_TEST_MINDMAP_3900
     * @tc.name int32ArrayValueOfPart01TestMindmapTest039
     * @tc.desc Verify Int32Array.of(-1) valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart01TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(-1);
      expect(a.valueOf()).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART01_TEST_MINDMAP_4000
     * @tc.name int32ArrayValueOfPart01TestMindmapTest040
     * @tc.desc Verify Int32Array.of(0) valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart01TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(0);
      expect(a.valueOf()).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART01_TEST_MINDMAP_4100
     * @tc.name int32ArrayValueOfPart01TestMindmapTest041
     * @tc.desc Verify Int32Array.of(2147483647)INT_MAX valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart01TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(2147483647);
      expect(a.valueOf()).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART01_TEST_MINDMAP_4200
     * @tc.name int32ArrayValueOfPart01TestMindmapTest042
     * @tc.desc Verify Int32Array.of(-2147483648)INT_MIN valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart01TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(-2147483648);
      expect(a.valueOf()).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART01_TEST_MINDMAP_4300
     * @tc.name int32ArrayValueOfPart01TestMindmapTest043
     * @tc.desc Verify Int32Array.of(1,-1) valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart01TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, -1);
      expect(a.valueOf()).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART01_TEST_MINDMAP_4400
     * @tc.name int32ArrayValueOfPart01TestMindmapTest044
     * @tc.desc Verify Int32Array.from FixedArray valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart01TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.from([]);
      expect(a.valueOf()).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART01_TEST_MINDMAP_4500
     * @tc.name int32ArrayValueOfPart01TestMindmapTest045
     * @tc.desc Verify Int32Array.from FixedArray valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart01TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.from([5.0, 5.0, 5.0]);
      expect(a.valueOf()).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART01_TEST_MINDMAP_4600
     * @tc.name int32ArrayValueOfPart01TestMindmapTest046
     * @tc.desc Verify Int32Array.from mapfn valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart01TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.from([1.0, 2.0], (v: number, _i: number) => v + 1.0);
      expect(a.valueOf()).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART01_TEST_MINDMAP_4700
     * @tc.name int32ArrayValueOfPart01TestMindmapTest047
     * @tc.desc Verify Int32Array.from mapfn valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart01TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.from([1.0, 2.0], (v: number, _i: number) => -v);
      expect(a.valueOf()).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART01_TEST_MINDMAP_4800
     * @tc.name int32ArrayValueOfPart01TestMindmapTest048
     * @tc.desc Verify fill(0) valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart01TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      a.fill(0);
      expect(a.valueOf()).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART01_TEST_MINDMAP_4900
     * @tc.name int32ArrayValueOfPart01TestMindmapTest049
     * @tc.desc Verify fill(-1) valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart01TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      a.fill(-1);
      expect(a.valueOf()).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART01_TEST_MINDMAP_5000
     * @tc.name int32ArrayValueOfPart01TestMindmapTest050
     * @tc.desc Verify fill(INT_MAX) valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart01TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(2);
      a.fill(2147483647);
      expect(a.valueOf()).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART01_TEST_MINDMAP_5100
     * @tc.name int32ArrayValueOfPart01TestMindmapTest051
     * @tc.desc Verify reverse valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart01TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      a.reverse();
      expect(a.valueOf()).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART01_TEST_MINDMAP_5200
     * @tc.name int32ArrayValueOfPart01TestMindmapTest052
     * @tc.desc Verify sort valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart01TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(3, 1, 2);
      a.sort();
      expect(a.valueOf()).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART01_TEST_MINDMAP_5300
     * @tc.name int32ArrayValueOfPart01TestMindmapTest053
     * @tc.desc Verify $_set valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart01TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(2);
      a.$_set(0, 42);
      expect(a.valueOf()).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART01_TEST_MINDMAP_5400
     * @tc.name int32ArrayValueOfPart01TestMindmapTest054
     * @tc.desc Verify $_set valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart01TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      a.$_set(2, -99);
      expect(a.valueOf()).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART01_TEST_MINDMAP_5500
     * @tc.name int32ArrayValueOfPart01TestMindmapTest055
     * @tc.desc Verify set valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart01TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(4);
      let src: Int32Array = Int32Array.of(10, 20);
      a.set(src, 1);
      expect(a.valueOf()).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART01_TEST_MINDMAP_5600
     * @tc.name int32ArrayValueOfPart01TestMindmapTest056
     * @tc.desc Verify copyWithin valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart01TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3, 4);
      a.copyWithin(2, 0);
      expect(a.valueOf()).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART01_TEST_MINDMAP_5700
     * @tc.name int32ArrayValueOfPart01TestMindmapTest057
     * @tc.desc Verify subarray(0) valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart01TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.of(1, 2, 3);
      let sub: Int32Array = src.subarray(0);
      expect(sub.valueOf()).assertEqual(sub);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART01_TEST_MINDMAP_5800
     * @tc.name int32ArrayValueOfPart01TestMindmapTest058
     * @tc.desc Verify subarray(1) valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart01TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.of(10, 20, 30);
      let sub: Int32Array = src.subarray(1);
      expect(sub.valueOf()).assertEqual(sub);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART01_TEST_MINDMAP_5900
     * @tc.name int32ArrayValueOfPart01TestMindmapTest059
     * @tc.desc Verify subarray(-1) valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart01TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.of(10, 20, 30);
      let sub: Int32Array = src.subarray(-1);
      expect(sub.valueOf()).assertEqual(sub);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART01_TEST_MINDMAP_6000
     * @tc.name int32ArrayValueOfPart01TestMindmapTest060
     * @tc.desc Verify subarray(0,1) valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart01TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.of(10, 20, 30);
      let sub: Int32Array = src.subarray(0, 1);
      expect(sub.valueOf()).assertEqual(sub);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART01_TEST_MINDMAP_6100
     * @tc.name int32ArrayValueOfPart01TestMindmapTest061
     * @tc.desc Verify subarray() valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart01TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.of(1, 2);
      let sub: Int32Array = src.subarray();
      expect(sub.valueOf()).assertEqual(sub);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART01_TEST_MINDMAP_6200
     * @tc.name int32ArrayValueOfPart01TestMindmapTest062
     * @tc.desc Verify map valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart01TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.of(1, 2, 3);
      let mapped: Int32Array = src.map((v: number, _i: int) => v * 2);
      expect(mapped.valueOf()).assertEqual(mapped);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART01_TEST_MINDMAP_6300
     * @tc.name int32ArrayValueOfPart01TestMindmapTest063
     * @tc.desc Verify filter valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart01TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.of(1, -2, 3);
      let filtered: Int32Array = src.filter((v: number, _i: int) => v > 0);
      expect(filtered.valueOf()).assertEqual(filtered);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART01_TEST_MINDMAP_6400
     * @tc.name int32ArrayValueOfPart01TestMindmapTest064
     * @tc.desc Verify filter valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart01TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.of(-1, -2, -3);
      let filtered: Int32Array = src.filter((v: number, _i: int) => v > 0);
      expect(filtered.valueOf()).assertEqual(filtered);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART01_TEST_MINDMAP_6500
     * @tc.name int32ArrayValueOfPart01TestMindmapTest065
     * @tc.desc Verify slice valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart01TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.of(1, 2, 3, 4);
      let sliced: Int32Array = src.slice(1, 3);
      expect(sliced.valueOf()).assertEqual(sliced);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART01_TEST_MINDMAP_6600
     * @tc.name int32ArrayValueOfPart01TestMindmapTest066
     * @tc.desc Verify with valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart01TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.of(1, 2, 3);
      let replaced: Int32Array = src.with(1, 99);
      expect(replaced.valueOf()).assertEqual(replaced);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART01_TEST_MINDMAP_6700
     * @tc.name int32ArrayValueOfPart01TestMindmapTest067
     * @tc.desc Verify toReversed valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart01TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.of(1, 2, 3);
      let rev: Int32Array = src.toReversed();
      expect(rev.valueOf()).assertEqual(rev);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART01_TEST_MINDMAP_6800
     * @tc.name int32ArrayValueOfPart01TestMindmapTest068
     * @tc.desc Verify toSorted valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart01TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.of(3, 1, 2);
      let sorted: Int32Array = src.toSorted();
      expect(sorted.valueOf()).assertEqual(sorted);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART01_TEST_MINDMAP_6900
     * @tc.name int32ArrayValueOfPart01TestMindmapTest069
     * @tc.desc Verify ArrayBuffer valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart01TestMindmapTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let firstVal: Int32Array = new Int32Array(buf, 0, 1);
      new Int32Array(buf, 4, 1);
      expect(firstVal.valueOf()).assertEqual(firstVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART01_TEST_MINDMAP_7000
     * @tc.name int32ArrayValueOfPart01TestMindmapTest070
     * @tc.desc Verify valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart01TestMindmapTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let firstVal: Int32Array = new Int32Array(buf, 0, 2);
      let secondVal: Int32Array = new Int32Array(buf, 0, 2);
      secondVal.$_set(0, 77);
      expect(firstVal.valueOf()).assertEqual(firstVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART01_TEST_MINDMAP_7100
     * @tc.name int32ArrayValueOfPart01TestMindmapTest071
     * @tc.desc Verify valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart01TestMindmapTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = Int32Array.of(1, 2, 3, 4);
      let sub1: Int32Array = src.subarray(1);
      let sub2: Int32Array = sub1.subarray(1);
      expect(sub2.valueOf()).assertEqual(sub2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART01_TEST_MINDMAP_7200
     * @tc.name int32ArrayValueOfPart01TestMindmapTest072
     * @tc.desc Verify INT_MAX valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart01TestMindmapTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      a.fill(2147483647);
      expect(a.valueOf()).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART01_TEST_MINDMAP_7300
     * @tc.name int32ArrayValueOfPart01TestMindmapTest073
     * @tc.desc Verify INT_MIN valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart01TestMindmapTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array(3);
      a.fill(-2147483648);
      expect(a.valueOf()).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART01_TEST_MINDMAP_7400
     * @tc.name int32ArrayValueOfPart01TestMindmapTest074
     * @tc.desc Verify 4294967296.0 2^32 0 valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart01TestMindmapTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([4294967296.0]);
      expect(a.valueOf()).assertEqual(a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_VALUE_OF_PART01_TEST_MINDMAP_7500
     * @tc.name int32ArrayValueOfPart01TestMindmapTest075
     * @tc.desc Verify -0 +0 valueOf this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayValueOfPart01TestMindmapTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = new Int32Array([-0.0]);
      expect(a.valueOf()).assertEqual(a);
    });
  });
}
