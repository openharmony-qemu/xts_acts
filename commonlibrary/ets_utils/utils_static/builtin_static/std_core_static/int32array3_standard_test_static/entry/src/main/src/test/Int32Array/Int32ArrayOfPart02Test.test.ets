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

export default function int32ArrayOfPart02Test(): void {
  describe('Int32ArrayOfPart02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_0100
     * @tc.name int32ArrayOfPart02TestMindmapTest001
     * @tc.desc Verify Int32Array.of(7, 13) length=2 and both elements stored in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(7, 13);
      expect(a.length).assertEqual(2);
      expect(a.$_get(0)).assertEqual(7);
      expect(a.$_get(1)).assertEqual(13);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_0200
     * @tc.name int32ArrayOfPart02TestMindmapTest002
     * @tc.desc Verify Int32Array.of(9, -4, 0) length=3 and three elements in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(9, -4, 0);
      expect(a.length).assertEqual(3);
      expect(a.$_get(0)).assertEqual(9);
      expect(a.$_get(1)).assertEqual(-4);
      expect(a.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_0300
     * @tc.name int32ArrayOfPart02TestMindmapTest003
     * @tc.desc Verify Int32Array.of with 6 elements (non-power-of-2, non-7 odd count), length=6, byteLength=24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(101, 102, 103, 104, 105, 106);
      expect(a.length).assertEqual(6);
      expect(a.byteLength).assertEqual(24);
      expect(a.$_get(5)).assertEqual(106);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_0400
     * @tc.name int32ArrayOfPart02TestMindmapTest004
     * @tc.desc Verify Int32Array.of with 9 elements (3 squared), first and last elements and length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3, 4, 5, 6, 7, 8, 9);
      expect(a.length).assertEqual(9);
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(8)).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_0500
     * @tc.name int32ArrayOfPart02TestMindmapTest005
     * @tc.desc Verify Int32Array.of(-50, 50) signs preserved independently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(-50, 50);
      expect(a.$_get(0)).assertEqual(-50);
      expect(a.$_get(1)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_0600
     * @tc.name int32ArrayOfPart02TestMindmapTest006
     * @tc.desc Verify Int32Array.of(0.999999) truncates toward zero to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(0.999999);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_0700
     * @tc.name int32ArrayOfPart02TestMindmapTest007
     * @tc.desc Verify Int32Array.of(-0.999999) truncates toward zero to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(-0.999999);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_0800
     * @tc.name int32ArrayOfPart02TestMindmapTest008
     * @tc.desc Verify Int32Array.of(1.0) stores as 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1.0);
      expect(a.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_0900
     * @tc.name int32ArrayOfPart02TestMindmapTest009
     * @tc.desc Verify Int32Array.of(-1.0) stores as -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(-1.0);
      expect(a.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_1000
     * @tc.name int32ArrayOfPart02TestMindmapTest010
     * @tc.desc Verify Int32Array.of(100.9) truncates to 100 not 101
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(100.9);
      expect(a.$_get(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_1100
     * @tc.name int32ArrayOfPart02TestMindmapTest011
     * @tc.desc Verify Int32Array.of(3.141592653589793) truncates to 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(3.141592653589793);
      expect(a.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_1200
     * @tc.name int32ArrayOfPart02TestMindmapTest012
     * @tc.desc Verify Int32Array.of(2147483647.9) truncates then ToInt32 keeps MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(2147483647.9);
      expect(a.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_1300
     * @tc.name int32ArrayOfPart02TestMindmapTest013
     * @tc.desc Verify Int32Array.of(2147483648.5) wraps around to -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(2147483648.5);
      expect(a.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_1400
     * @tc.name int32ArrayOfPart02TestMindmapTest014
     * @tc.desc Verify Int32Array.of(-2147483648.5) truncates toward zero to MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(-2147483648.5);
      expect(a.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_1500
     * @tc.name int32ArrayOfPart02TestMindmapTest015
     * @tc.desc Verify Int32Array.of(-1e0) equals -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(-1e0);
      expect(a.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_1600
     * @tc.name int32ArrayOfPart02TestMindmapTest016
     * @tc.desc Verify Int32Array.of(-1e-6) truncates to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(-1e-6);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_1700
     * @tc.name int32ArrayOfPart02TestMindmapTest017
     * @tc.desc Verify Int32Array.of(-2.5e9) wraps around to 1794967296
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(-2.5e9);
      expect(a.$_get(0)).assertEqual(1794967296);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_1800
     * @tc.name int32ArrayOfPart02TestMindmapTest018
     * @tc.desc Verify Int32Array.of(0x80000000) wraps around to -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(0x80000000);
      expect(a.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_1900
     * @tc.name int32ArrayOfPart02TestMindmapTest019
     * @tc.desc Verify Int32Array.of(-0x1) equals -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(-0x1);
      expect(a.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_2000
     * @tc.name int32ArrayOfPart02TestMindmapTest020
     * @tc.desc Verify Int32Array.of(0x7FFFFFFE) equals 2147483646
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(0x7FFFFFFE);
      expect(a.$_get(0)).assertEqual(2147483646);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_2100
     * @tc.name int32ArrayOfPart02TestMindmapTest021
     * @tc.desc Verify Int32Array.of(-0x7FFFFFFF) equals -2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(-0x7FFFFFFF);
      expect(a.$_get(0)).assertEqual(-2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_2200
     * @tc.name int32ArrayOfPart02TestMindmapTest022
     * @tc.desc Verify Int32Array.of(0o0) equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(0o0);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_2300
     * @tc.name int32ArrayOfPart02TestMindmapTest023
     * @tc.desc Verify Int32Array.of(0b1) equals 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(0b1);
      expect(a.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_2400
     * @tc.name int32ArrayOfPart02TestMindmapTest024
     * @tc.desc Verify Int32Array.of(31-bit all-1 binary) equals MAX 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(0b1111111111111111111111111111111);
      expect(a.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_2500
     * @tc.name int32ArrayOfPart02TestMindmapTest025
     * @tc.desc Verify Int32Array.of(10, 0xA) mixed decimal and hex both equal 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 0xA);
      expect(a.$_get(0)).assertEqual(10);
      expect(a.$_get(1)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_2600
     * @tc.name int32ArrayOfPart02TestMindmapTest026
     * @tc.desc Verify Int32Array.of(2147483650) wraps around to -2147483646
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(2147483650);
      expect(a.$_get(0)).assertEqual(-2147483646);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_2700
     * @tc.name int32ArrayOfPart02TestMindmapTest027
     * @tc.desc Verify Int32Array.of(-2147483650) wraps around to 2147483646
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(-2147483650);
      expect(a.$_get(0)).assertEqual(2147483646);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_2800
     * @tc.name int32ArrayOfPart02TestMindmapTest028
     * @tc.desc Verify Int32Array.of(-4294967297) wraps around to -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(-4294967297);
      expect(a.$_get(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_2900
     * @tc.name int32ArrayOfPart02TestMindmapTest029
     * @tc.desc Verify Int32Array.of(8589934592) wraps around to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(8589934592);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_3000
     * @tc.name int32ArrayOfPart02TestMindmapTest030
     * @tc.desc Verify Int32Array.of(65536) within int32 range preserves 65536
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(65536);
      expect(a.$_get(0)).assertEqual(65536);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_3100
     * @tc.name int32ArrayOfPart02TestMindmapTest031
     * @tc.desc Verify Int32Array.of(-65536) within int32 range preserves -65536
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(-65536);
      expect(a.$_get(0)).assertEqual(-65536);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_3200
     * @tc.name int32ArrayOfPart02TestMindmapTest032
     * @tc.desc Verify Int32Array.of(NaN, NaN) both converted to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(Number.NaN, Number.NaN);
      expect(a.$_get(0)).assertEqual(0);
      expect(a.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_3300
     * @tc.name int32ArrayOfPart02TestMindmapTest033
     * @tc.desc Verify Int32Array.of(Infinity, 5, -Infinity) ends as 0, 5, 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(Number.POSITIVE_INFINITY, 5, Number.NEGATIVE_INFINITY);
      expect(a.length).assertEqual(3);
      expect(a.$_get(0)).assertEqual(0);
      expect(a.$_get(1)).assertEqual(5);
      expect(a.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_3400
     * @tc.name int32ArrayOfPart02TestMindmapTest034
     * @tc.desc Verify Int32Array.of(NaN, 2, 3) first position becomes 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(Number.NaN, 2, 3);
      expect(a.$_get(0)).assertEqual(0);
      expect(a.$_get(1)).assertEqual(2);
      expect(a.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_3500
     * @tc.name int32ArrayOfPart02TestMindmapTest035
     * @tc.desc Verify Int32Array.of(1, 2, NaN) last position becomes 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, Number.NaN);
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(1)).assertEqual(2);
      expect(a.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_3600
     * @tc.name int32ArrayOfPart02TestMindmapTest036
     * @tc.desc Verify Int32Array.of(5, -0, 7) elements are 5, 0, 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(5, -0, 7);
      expect(a.$_get(0)).assertEqual(5);
      expect(a.$_get(1)).assertEqual(0);
      expect(a.$_get(2)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_3700
     * @tc.name int32ArrayOfPart02TestMindmapTest037
     * @tc.desc Verify Int32Array.of(1.9, 2, 3.1) truncates to 1, 2, 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1.9, 2, 3.1);
      expect(a.$_get(0)).assertEqual(1);
      expect(a.$_get(1)).assertEqual(2);
      expect(a.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_3800
     * @tc.name int32ArrayOfPart02TestMindmapTest038
     * @tc.desc Verify Int32Array.of all negatives with boundaries each independently correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(-1, -2147483648, -2, -2147483647);
      expect(a.length).assertEqual(4);
      expect(a.$_get(0)).assertEqual(-1);
      expect(a.$_get(1)).assertEqual(-2147483648);
      expect(a.$_get(2)).assertEqual(-2);
      expect(a.$_get(3)).assertEqual(-2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_3900
     * @tc.name int32ArrayOfPart02TestMindmapTest039
     * @tc.desc Verify Array.isArray on of result is false; Also verify verify ArrayBuffer.isView on of result is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2);
      expect(Array.isArray(a)).assertFalse();

      {
      let a: Int32Array = Int32Array.of(1, 2);
      expect(ArrayBuffer.isView(a)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_4000
     * @tc.name int32ArrayOfPart02TestMindmapTest040
     * @tc.desc Verify BYTES_PER_ELEMENT still 4 for single-element of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(42);
      expect(a.BYTES_PER_ELEMENT).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_4100
     * @tc.name int32ArrayOfPart02TestMindmapTest041
     * @tc.desc Verify toString produces non-empty string and length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2);
      let s: string = a.toString();
      expect(s.length).assertEqual(3);
      expect(a.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_4200
     * @tc.name int32ArrayOfPart02TestMindmapTest042
     * @tc.desc Verify buffer viewed through Int8Array has length*4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2);
      let i8: Int8Array = new Int8Array(a.buffer);
      expect(i8.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_4300
     * @tc.name int32ArrayOfPart02TestMindmapTest043
     * @tc.desc Verify Uint32Array shared view reads 0x12345678 correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(0x12345678);
      let u32: Uint32Array = new Uint32Array(a.buffer);
      expect(u32.$_get(0)).assertEqual(0x12345678);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_4400
     * @tc.name int32ArrayOfPart02TestMindmapTest044
     * @tc.desc Verify -1 through Uint32Array view reads as 4294967295 (0xFFFFFFFF)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(-1);
      let u32: Uint32Array = new Uint32Array(a.buffer);
      expect(u32.$_get(0)).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_4500
     * @tc.name int32ArrayOfPart02TestMindmapTest045
     * @tc.desc Verify MIN through Uint32Array view reads as 2147483648 (0x80000000)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(-2147483648);
      let u32: Uint32Array = new Uint32Array(a.buffer);
      expect(u32.$_get(0)).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_4600
     * @tc.name int32ArrayOfPart02TestMindmapTest046
     * @tc.desc Verify buffer property is not null and byteLength equals 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2);
      let buf: ArrayBuffer = a.buffer;
      expect(buf.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_4700
     * @tc.name int32ArrayOfPart02TestMindmapTest047
     * @tc.desc Verify forEach callback indices increment 0,1,2,...,length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      let idxs: Array<number> = [];
      a.forEach((_v: number, i: int, _arr: Int32Array): void => { idxs.push(i); });
      expect(idxs.length).assertEqual(3);
      expect(idxs[0]).assertEqual(0);
      expect(idxs[1]).assertEqual(1);
      expect(idxs[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_4800
     * @tc.name int32ArrayOfPart02TestMindmapTest048
     * @tc.desc Verify keys iterator produces 0,1,2,...,length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      let ks = a.keys();
      let first: number = ks.next().value!;
      let second: number = ks.next().value!;
      let third: number = ks.next().value!;
      expect(first).assertEqual(0);
      expect(second).assertEqual(1);
      expect(third).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_4900
     * @tc.name int32ArrayOfPart02TestMindmapTest049
     * @tc.desc Verify values iterator produces elements in argument order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(100, 200);
      let vs = a.values();
      expect(vs.next().value as number).assertEqual(100);
      expect(vs.next().value as number).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_5000
     * @tc.name int32ArrayOfPart02TestMindmapTest050
     * @tc.desc Verify entries iterator produces [index, value] pairs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(77);
      let es = a.entries();
      let first = es.next().value!;
      expect(first[0]).assertEqual(0);
      expect(first[1]).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_5100
     * @tc.name int32ArrayOfPart02TestMindmapTest051
     * @tc.desc Verify forEach callback self parameter equals the array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(5);
      a.forEach((v: number, i: int, self: Int32Array): void => {
        expect(self).assertEqual(a);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_5200
     * @tc.name int32ArrayOfPart02TestMindmapTest052
     * @tc.desc Verify find returns first even number 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3, 4, 5);
      let r: number | undefined = a.find((v: number, _i: int, _self: Int32Array): boolean => v % 2 === 0);
      expect(r!).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_5300
     * @tc.name int32ArrayOfPart02TestMindmapTest053
     * @tc.desc Verify findIndex returns 2 for element greater than 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      let idx: number = a.findIndex((v: number, _i: int, _self: Int32Array): boolean => v > 2);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_5400
     * @tc.name int32ArrayOfPart02TestMindmapTest054
     * @tc.desc Verify every returns true when all elements are even
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(2, 4, 6);
      let r: boolean = a.every((v: number, _i: int, _self: Int32Array): boolean => v % 2 === 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_5500
     * @tc.name int32ArrayOfPart02TestMindmapTest055
     * @tc.desc Verify every returns false when element 3 is odd
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(2, 3, 4);
      let r: boolean = a.every((v: number, _i: int, _self: Int32Array): boolean => v % 2 === 0);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_5600
     * @tc.name int32ArrayOfPart02TestMindmapTest056
     * @tc.desc Verify some returns false when all elements are odd
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 3, 5);
      let r: boolean = a.some((v: number, _i: int, _self: Int32Array): boolean => v % 2 === 0);
      expect(r).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_5700
     * @tc.name int32ArrayOfPart02TestMindmapTest057
     * @tc.desc Verify some returns true when element 2 is even
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      let r: boolean = a.some((v: number, _i: int, _self: Int32Array): boolean => v % 2 === 0);
      expect(r).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_5800
     * @tc.name int32ArrayOfPart02TestMindmapTest058
     * @tc.desc Verify includes(2) true, includes(99) false; Also verify verify join() default comma separator produces '1,2,3'; Also verify verify join('-') dash separator produces '1-2-3'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      expect(a.includes(2)).assertTrue();
      expect(a.includes(99)).assertFalse();

      {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      expect(a.join()).assertEqual('1,2,3');
      }

      {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      expect(a.join('-')).assertEqual('1-2-3');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_5900
     * @tc.name int32ArrayOfPart02TestMindmapTest059
     * @tc.desc Verify lastIndexOf(2) returns 3 from tail search
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3, 2, 1);
      expect(a.lastIndexOf(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_6000
     * @tc.name int32ArrayOfPart02TestMindmapTest060
     * @tc.desc Verify reduce sums to 10 with initialValue 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3, 4);
      let sum: number = a.reduce((acc: number, v: number, _i: int, _self: Int32Array): number => acc + v, 0);
      expect(sum).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_6100
     * @tc.name int32ArrayOfPart02TestMindmapTest061
     * @tc.desc Verify reduceRight joins in reverse order producing '321'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      let s: string = a.reduceRight((acc: string, v: number, _i: int, _self: Int32Array): string => acc + v.toString(), '');
      expect(s).assertEqual('321');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_6200
     * @tc.name int32ArrayOfPart02TestMindmapTest062
     * @tc.desc Verify map +10 returns Int32Array with correct elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      let b: Int32Array = a.map((v: number, _i: int, _self: Int32Array): number => v + 10);
      expect(b.$_get(0)).assertEqual(11);
      expect(b.$_get(2)).assertEqual(13);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_6300
     * @tc.name int32ArrayOfPart02TestMindmapTest063
     * @tc.desc Verify filter even returns [2, 4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3, 4);
      let b: Int32Array = a.filter((v: number, _i: int, _self: Int32Array): boolean => v % 2 === 0);
      expect(b.length).assertEqual(2);
      expect(b.$_get(0)).assertEqual(2);
      expect(b.$_get(1)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_6400
     * @tc.name int32ArrayOfPart02TestMindmapTest064
     * @tc.desc Verify reduce on single element without initialValue returns 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(5);
      let r: number = a.reduce((acc: number, v: number, _i: int, _self: Int32Array): number => acc + v);
      expect(r).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_6500
     * @tc.name int32ArrayOfPart02TestMindmapTest065
     * @tc.desc Verify subarray(1,3) returns [2,3] sharing underlying buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3, 4);
      let sub: Int32Array = a.subarray(1, 3);
      expect(sub.length).assertEqual(2);
      expect(sub.$_get(0)).assertEqual(2);
      expect(sub.$_get(1)).assertEqual(3);
      expect(sub.buffer).assertEqual(a.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_6600
     * @tc.name int32ArrayOfPart02TestMindmapTest066
     * @tc.desc Verify slice(0) returns equal-length copy with independent buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      let cp: Int32Array = a.slice(0);
      expect(cp.length).assertEqual(3);
      expect(cp.$_get(0)).assertEqual(1);
      expect(cp.buffer).not().assertEqual(a.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_6700
     * @tc.name int32ArrayOfPart02TestMindmapTest067
     * @tc.desc Verify reverse returns same instance with elements reversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      let r: Int32Array = a.reverse();
      expect(r).assertEqual(a);
      expect(a.$_get(0)).assertEqual(3);
      expect(a.$_get(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_6800
     * @tc.name int32ArrayOfPart02TestMindmapTest068
     * @tc.desc Verify fill(0) sets all elements to 0, length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      a.fill(0);
      expect(a.$_get(0)).assertEqual(0);
      expect(a.$_get(1)).assertEqual(0);
      expect(a.$_get(2)).assertEqual(0);
      expect(a.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_6900
     * @tc.name int32ArrayOfPart02TestMindmapTest069
     * @tc.desc Verify copyWithin(0, 2) moves element at index 2 to index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      a.copyWithin(0, 2);
      expect(a.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_7000
     * @tc.name int32ArrayOfPart02TestMindmapTest070
     * @tc.desc Verify at(-1) returns last element 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      expect(a.at(-1)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_7100
     * @tc.name int32ArrayOfPart02TestMindmapTest071
     * @tc.desc Verify at(3) out of bounds returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      let v: number | undefined = a.at(3);
      expect(v).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_7200
     * @tc.name int32ArrayOfPart02TestMindmapTest072
     * @tc.desc Verify at(-4) below negative length returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(10, 20, 30);
      let v: number | undefined = a.at(-4);
      expect(v).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_7300
     * @tc.name int32ArrayOfPart02TestMindmapTest073
     * @tc.desc Verify join() on empty of returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of();
      expect(a.join()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_7400
     * @tc.name int32ArrayOfPart02TestMindmapTest074
     * @tc.desc Verify forEach callback throw propagates Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      try {
        a.forEach((v: number, _i: int, _self: Int32Array): void => {
          expect(v).assertEqual(1);
          throw new Error('callback boom');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_7500
     * @tc.name int32ArrayOfPart02TestMindmapTest075
     * @tc.desc Verify map callback throw propagates Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      try {
        a.map((v: number, _i: int, _self: Int32Array): number => {
          expect(v).assertEqual(1);
          throw new Error('map boom');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_7600
     * @tc.name int32ArrayOfPart02TestMindmapTest076
     * @tc.desc Verify $_set with out-of-bounds index throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      try {
        a.$_set(99, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_7700
     * @tc.name int32ArrayOfPart02TestMindmapTest077
     * @tc.desc Verify $_set writes MAX and reads back 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3);
      a.$_set(0, 2147483647);
      expect(a.$_get(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_7800
     * @tc.name int32ArrayOfPart02TestMindmapTest078
     * @tc.desc Verify $_set writes MAX+1 wraps around to -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(0);
      a.$_set(0, 2147483648);
      expect(a.$_get(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_7900
     * @tc.name int32ArrayOfPart02TestMindmapTest079
     * @tc.desc Verify $_set writes NaN becomes 0 via ToInt32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(0);
      a.$_set(0, Number.NaN);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_8000
     * @tc.name int32ArrayOfPart02TestMindmapTest080
     * @tc.desc Verify $_set writes Infinity becomes 0 via ToInt32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(0);
      a.$_set(0, Number.POSITIVE_INFINITY);
      expect(a.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_8100
     * @tc.name int32ArrayOfPart02TestMindmapTest081
     * @tc.desc Verify $_set writes 3.7 truncates to 3 via ToInt32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(5);
      a.$_set(0, 3.7);
      expect(a.$_get(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_8200
     * @tc.name int32ArrayOfPart02TestMindmapTest082
     * @tc.desc Verify shared buffer Int32Array view mutation visible in original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(100, 200);
      let b: Int32Array = new Int32Array(a.buffer, 0, 2);
      b.$_set(0, 999);
      expect(a.$_get(0)).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_8300
     * @tc.name int32ArrayOfPart02TestMindmapTest083
     * @tc.desc Verify sub Int32Array view from byteOffset=4 has first element 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2, 3, 4);
      let b: Int32Array = new Int32Array(a.buffer, 4, 2);
      expect(b.length).assertEqual(2);
      expect(b.$_get(0)).assertEqual(2);
      expect(b.$_get(1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_8400
     * @tc.name int32ArrayOfPart02TestMindmapTest084
     * @tc.desc Verify Float32Array shared buffer view has length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2);
      let f32: Float32Array = new Float32Array(a.buffer);
      expect(f32.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_8500
     * @tc.name int32ArrayOfPart02TestMindmapTest085
     * @tc.desc Verify non-4-aligned byteOffset=1 throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1);
      try {
        new Int32Array(a.buffer, 1, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_OF_PART02_TEST_MINDMAP_8600
     * @tc.name int32ArrayOfPart02TestMindmapTest086
     * @tc.desc Verify offset=4 length=2 exceeds buffer remaining capacity throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayOfPart02TestMindmapTest086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Int32Array = Int32Array.of(1, 2);
      try {
        new Int32Array(a.buffer, 4, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });
  });
}
