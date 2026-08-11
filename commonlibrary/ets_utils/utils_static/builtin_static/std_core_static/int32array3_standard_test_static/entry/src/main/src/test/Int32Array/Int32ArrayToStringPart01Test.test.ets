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

export default function int32ArrayToStringPart01TestMindmapTestTest(): void {
  describe('Int32ArrayToStringPart01TestMindmapTestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART01_TEST_MINDMAP_0100
     * @tc.name int32ArrayToStringPart01TestMindmapTest001
     * @tc.desc Verify toString() ,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart01TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array();
      expect(arr.toString()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART01_TEST_MINDMAP_0200
     * @tc.name int32ArrayToStringPart01TestMindmapTest002
     * @tc.desc Verify toString() , length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart01TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(0);
      expect(arr.toString()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART01_TEST_MINDMAP_0300
     * @tc.name int32ArrayToStringPart01TestMindmapTest003
     * @tc.desc Verify toString() ,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart01TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3]);
      expect(arr.toString()).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART01_TEST_MINDMAP_0400
     * @tc.name int32ArrayToStringPart01TestMindmapTest004
     * @tc.desc Verify toString() ,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart01TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([4, 5, 6]);
      expect(arr.toString()).assertEqual('4,5,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART01_TEST_MINDMAP_0500
     * @tc.name int32ArrayToStringPart01TestMindmapTest005
     * @tc.desc Verify toString() ,Int32Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart01TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = Int32Array.of(7, 8);
      expect(arr.toString()).assertEqual('7,8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART01_TEST_MINDMAP_0600
     * @tc.name int32ArrayToStringPart01TestMindmapTest006
     * @tc.desc Verify toString() , ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart01TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int32Array = new Int32Array(buf, 0, 2);
      arr.$_set(0, 11);
      arr.$_set(1, 22);
      expect(arr.toString()).assertEqual('11,22');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART01_TEST_MINDMAP_0700
     * @tc.name int32ArrayToStringPart01TestMindmapTest007
     * @tc.desc Verify [100] ( ) toString "100"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart01TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([100]);
      expect(arr.toString()).assertEqual('100');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART01_TEST_MINDMAP_0800
     * @tc.name int32ArrayToStringPart01TestMindmapTest008
     * @tc.desc Verify [1000000] ( ) toString "1000000"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart01TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1000000]);
      expect(arr.toString()).assertEqual('1000000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART01_TEST_MINDMAP_0900
     * @tc.name int32ArrayToStringPart01TestMindmapTest009
     * @tc.desc Verify [-1] toString "-1"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart01TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1]);
      expect(arr.toString()).assertEqual('-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART01_TEST_MINDMAP_1000
     * @tc.name int32ArrayToStringPart01TestMindmapTest010
     * @tc.desc Verify [-2] toString "-2"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart01TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2]);
      expect(arr.toString()).assertEqual('-2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART01_TEST_MINDMAP_1100
     * @tc.name int32ArrayToStringPart01TestMindmapTest011
     * @tc.desc Verify [-9] ( ) toString "-9"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart01TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-9]);
      expect(arr.toString()).assertEqual('-9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART01_TEST_MINDMAP_1200
     * @tc.name int32ArrayToStringPart01TestMindmapTest012
     * @tc.desc Verify [-10] ( ) toString "-10"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart01TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-10]);
      expect(arr.toString()).assertEqual('-10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART01_TEST_MINDMAP_1300
     * @tc.name int32ArrayToStringPart01TestMindmapTest013
     * @tc.desc Verify [-100] ( ) toString "-100"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart01TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-100]);
      expect(arr.toString()).assertEqual('-100');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART01_TEST_MINDMAP_1400
     * @tc.name int32ArrayToStringPart01TestMindmapTest014
     * @tc.desc Verify [-1000000] ( ) toString "-1000000"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart01TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1000000]);
      expect(arr.toString()).assertEqual('-1000000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART01_TEST_MINDMAP_1500
     * @tc.name int32ArrayToStringPart01TestMindmapTest015
     * @tc.desc Verify [INT_MAX=2147483647] toString "2147483647"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart01TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647]);
      expect(arr.toString()).assertEqual('2147483647');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART01_TEST_MINDMAP_1600
     * @tc.name int32ArrayToStringPart01TestMindmapTest016
     * @tc.desc Verify [INT_MIN=-2147483648] toString "-2147483648"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart01TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2147483648]);
      expect(arr.toString()).assertEqual('-2147483648');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART01_TEST_MINDMAP_1700
     * @tc.name int32ArrayToStringPart01TestMindmapTest017
     * @tc.desc Verify [MAX-1=2147483646] toString "2147483646"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart01TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483646]);
      expect(arr.toString()).assertEqual('2147483646');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART01_TEST_MINDMAP_1800
     * @tc.name int32ArrayToStringPart01TestMindmapTest018
     * @tc.desc Verify [MIN+1=-2147483647] toString "-2147483647"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart01TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2147483647]);
      expect(arr.toString()).assertEqual('-2147483647');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART01_TEST_MINDMAP_1900
     * @tc.name int32ArrayToStringPart01TestMindmapTest019
     * @tc.desc Verify [MAX-1,MAX] toString "2147483646,2147483647"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart01TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483646, 2147483647]);
      expect(arr.toString()).assertEqual('2147483646,2147483647');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART01_TEST_MINDMAP_2000
     * @tc.name int32ArrayToStringPart01TestMindmapTest020
     * @tc.desc Verify [MIN,MIN+1] toString "-2147483648,-2147483647"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart01TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-2147483648, -2147483647]);
      expect(arr.toString()).assertEqual('-2147483648,-2147483647');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART01_TEST_MINDMAP_2100
     * @tc.name int32ArrayToStringPart01TestMindmapTest021
     * @tc.desc Verify 4294967296 (2^32) 0, toString "0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart01TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, 4294967296);
      expect(arr.toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART01_TEST_MINDMAP_2200
     * @tc.name int32ArrayToStringPart01TestMindmapTest022
     * @tc.desc Verify 4294967297 (2^32+1) 1, toString "1"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart01TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, 4294967297);
      expect(arr.toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART01_TEST_MINDMAP_2300
     * @tc.name int32ArrayToStringPart01TestMindmapTest023
     * @tc.desc Verify 4294967294 (0xFFFFFFFE) -2, toString "-2"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart01TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, 4294967294);
      expect(arr.toString()).assertEqual('-2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART01_TEST_MINDMAP_2400
     * @tc.name int32ArrayToStringPart01TestMindmapTest024
     * @tc.desc Verify -4294967295 1, toString "1"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart01TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, -4294967295);
      expect(arr.toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART01_TEST_MINDMAP_2500
     * @tc.name int32ArrayToStringPart01TestMindmapTest025
     * @tc.desc Verify 0.5 0, toString "0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart01TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, 0.5);
      expect(arr.toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART01_TEST_MINDMAP_2600
     * @tc.name int32ArrayToStringPart01TestMindmapTest026
     * @tc.desc Verify -0.5 0, toString "0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart01TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, -0.5);
      expect(arr.toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART01_TEST_MINDMAP_2700
     * @tc.name int32ArrayToStringPart01TestMindmapTest027
     * @tc.desc Verify 0.9 0, toString "0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart01TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, 0.9);
      expect(arr.toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART01_TEST_MINDMAP_2800
     * @tc.name int32ArrayToStringPart01TestMindmapTest028
     * @tc.desc Verify -0.9 0, toString "0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart01TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, -0.9);
      expect(arr.toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART01_TEST_MINDMAP_2900
     * @tc.name int32ArrayToStringPart01TestMindmapTest029
     * @tc.desc Verify 0.1 0, toString "0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart01TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, 0.1);
      expect(arr.toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART01_TEST_MINDMAP_3000
     * @tc.name int32ArrayToStringPart01TestMindmapTest030
     * @tc.desc Verify 2147483647.999 MAX, toString "2147483647"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart01TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, 2147483647.999);
      expect(arr.toString()).assertEqual('2147483647');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART01_TEST_MINDMAP_3100
     * @tc.name int32ArrayToStringPart01TestMindmapTest031
     * @tc.desc Verify -2147483648.999 MIN, toString "-2147483648"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart01TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, -2147483648.999);
      expect(arr.toString()).assertEqual('-2147483648');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART01_TEST_MINDMAP_3200
     * @tc.name int32ArrayToStringPart01TestMindmapTest032
     * @tc.desc Verify 99.99 99, toString "99"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart01TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, 99.99);
      expect(arr.toString()).assertEqual('99');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART01_TEST_MINDMAP_3300
     * @tc.name int32ArrayToStringPart01TestMindmapTest033
     * @tc.desc Verify -99.99 -99, toString "-99"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart01TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, -99.99);
      expect(arr.toString()).assertEqual('-99');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART01_TEST_MINDMAP_3400
     * @tc.name int32ArrayToStringPart01TestMindmapTest034
     * @tc.desc Verify Number.NaN ToInt32(Number.NaN)=0, toString "0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart01TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      arr.$_set(0, Number.NaN);
      expect(arr.toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART01_TEST_MINDMAP_3500
     * @tc.name int32ArrayToStringPart01TestMindmapTest035
     * @tc.desc Verify [0,0] toString "0,0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart01TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, 0]);
      expect(arr.toString()).assertEqual('0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART01_TEST_MINDMAP_3600
     * @tc.name int32ArrayToStringPart01TestMindmapTest036
     * @tc.desc Verify [1,0] ( ) toString "1,0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart01TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 0]);
      expect(arr.toString()).assertEqual('1,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART01_TEST_MINDMAP_3700
     * @tc.name int32ArrayToStringPart01TestMindmapTest037
     * @tc.desc Verify [0,-1] ( ) toString "0,-1"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart01TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([0, -1]);
      expect(arr.toString()).assertEqual('0,-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART01_TEST_MINDMAP_3800
     * @tc.name int32ArrayToStringPart01TestMindmapTest038
     * @tc.desc Verify [MAX,MIN] toString "2147483647,-2147483648"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart01TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647, -2147483648]);
      expect(arr.toString()).assertEqual('2147483647,-2147483648');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART01_TEST_MINDMAP_3900
     * @tc.name int32ArrayToStringPart01TestMindmapTest039
     * @tc.desc Verify [100,-100] ( ) toString "100,-100"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart01TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([100, -100]);
      expect(arr.toString()).assertEqual('100,-100');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART01_TEST_MINDMAP_4000
     * @tc.name int32ArrayToStringPart01TestMindmapTest040
     * @tc.desc Verify [1,1] ( ) toString "1,1"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart01TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 1]);
      expect(arr.toString()).assertEqual('1,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART01_TEST_MINDMAP_4100
     * @tc.name int32ArrayToStringPart01TestMindmapTest041
     * @tc.desc Verify [-1,-1] ( ) toString "-1,-1"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart01TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-1, -1]);
      expect(arr.toString()).assertEqual('-1,-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART01_TEST_MINDMAP_4200
     * @tc.name int32ArrayToStringPart01TestMindmapTest042
     * @tc.desc Verify [1,0,-1] ( ) toString "1,0,-1"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart01TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 0, -1]);
      expect(arr.toString()).assertEqual('1,0,-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART01_TEST_MINDMAP_4300
     * @tc.name int32ArrayToStringPart01TestMindmapTest043
     * @tc.desc Verify [1,-1,1] ( ) toString "1,-1,1"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart01TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, -1, 1]);
      expect(arr.toString()).assertEqual('1,-1,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART01_TEST_MINDMAP_4400
     * @tc.name int32ArrayToStringPart01TestMindmapTest044
     * @tc.desc Verify [MAX,0,MIN] ( ) toString "2147483647,0,-2147483648"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart01TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([2147483647, 0, -2147483648]);
      expect(arr.toString()).assertEqual('2147483647,0,-2147483648');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART01_TEST_MINDMAP_4500
     * @tc.name int32ArrayToStringPart01TestMindmapTest045
     * @tc.desc Verify [1,2,3,4] ( ) toString "1,2,3,4"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart01TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
      expect(arr.toString()).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART01_TEST_MINDMAP_4600
     * @tc.name int32ArrayToStringPart01TestMindmapTest046
     * @tc.desc Verify [-4,-3,-2,-1] ( ) toString "-4,-3,-2,-1"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart01TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([-4, -3, -2, -1]);
      expect(arr.toString()).assertEqual('-4,-3,-2,-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART01_TEST_MINDMAP_4700
     * @tc.name int32ArrayToStringPart01TestMindmapTest047
     * @tc.desc Verify [9,99,999,9999,99999] ( ) toString "9,99,999,9999,99999"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart01TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([9, 99, 999, 9999, 99999]);
      expect(arr.toString()).assertEqual('9,99,999,9999,99999');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART01_TEST_MINDMAP_4800
     * @tc.name int32ArrayToStringPart01TestMindmapTest048
     * @tc.desc Verify [7,7,7,7,7] toString "7,7,7,7,7"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart01TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([7, 7, 7, 7, 7]);
      expect(arr.toString()).assertEqual('7,7,7,7,7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART01_TEST_MINDMAP_4900
     * @tc.name int32ArrayToStringPart01TestMindmapTest049
     * @tc.desc Verify [1,-2,3,-4,5,-6] toString "1,-2,3,-4,5,-6"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart01TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, -2, 3, -4, 5, -6]);
      expect(arr.toString()).assertEqual('1,-2,3,-4,5,-6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART01_TEST_MINDMAP_5000
     * @tc.name int32ArrayToStringPart01TestMindmapTest050
     * @tc.desc Verify new Int32Array(1) toString "0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart01TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(1);
      expect(arr.toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART01_TEST_MINDMAP_5100
     * @tc.name int32ArrayToStringPart01TestMindmapTest051
     * @tc.desc Verify new Int32Array(4) toString "0,0,0,0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart01TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(4);
      expect(arr.toString()).assertEqual('0,0,0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART01_TEST_MINDMAP_5200
     * @tc.name int32ArrayToStringPart01TestMindmapTest052
     * @tc.desc Verify fill(0) toString "0,0,0"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart01TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.fill(0);
      expect(arr.toString()).assertEqual('0,0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART01_TEST_MINDMAP_5300
     * @tc.name int32ArrayToStringPart01TestMindmapTest053
     * @tc.desc Verify fill(MAX) toString "2147483647,2147483647"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart01TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(2);
      arr.fill(2147483647);
      expect(arr.toString()).assertEqual('2147483647,2147483647');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART01_TEST_MINDMAP_5400
     * @tc.name int32ArrayToStringPart01TestMindmapTest054
     * @tc.desc Verify fill(-1) toString "-1,-1,-1"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart01TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array(3);
      arr.fill(-1);
      expect(arr.toString()).assertEqual('-1,-1,-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART01_TEST_MINDMAP_5500
     * @tc.name int32ArrayToStringPart01TestMindmapTest055
     * @tc.desc Verify reverse toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart01TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([1, 2, 3]);
      arr.reverse();
      expect(arr.toString()).assertEqual('3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART01_TEST_MINDMAP_5600
     * @tc.name int32ArrayToStringPart01TestMindmapTest056
     * @tc.desc Verify sort toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart01TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int32Array = new Int32Array([3, 1, 2]);
      arr.sort();
      expect(arr.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART01_TEST_MINDMAP_5700
     * @tc.name int32ArrayToStringPart01TestMindmapTest057
     * @tc.desc Verify subarray 1 toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart01TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([10, 20, 30]);
      let child: Int32Array = parent.subarray(1, 2);
      expect(child.toString()).assertEqual('20');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART01_TEST_MINDMAP_5800
     * @tc.name int32ArrayToStringPart01TestMindmapTest058
     * @tc.desc Verify subarray toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart01TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int32Array = new Int32Array([1, 2, 3]);
      let child: Int32Array = parent.subarray(2, 2);
      expect(child.toString()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART01_TEST_MINDMAP_5900
     * @tc.name int32ArrayToStringPart01TestMindmapTest059
     * @tc.desc Verify Int32Array.from number[] ToInt32 toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart01TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [1.5, 2.7, -3.1];
      let arr: Int32Array = Int32Array.from(src);
      expect(arr.toString()).assertEqual('1,2,-3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART01_TEST_MINDMAP_6000
     * @tc.name int32ArrayToStringPart01TestMindmapTest060
     * @tc.desc Verify ArrayBuffer (byteOffset=4) toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart01TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let arr: Int32Array = new Int32Array(buf, 4, 2);
      arr.$_set(0, -5);
      arr.$_set(1, 5);
      expect(arr.toString()).assertEqual('-5,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART01_TEST_MINDMAP_6100
     * @tc.name int32ArrayToStringPart01TestMindmapTest061
     * @tc.desc Verify buffer toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart01TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(16);
      let a: Int32Array = new Int32Array(buf, 0, 2);
      let b: Int32Array = new Int32Array(buf, 8, 2);
      a.$_set(0, 1);
      a.$_set(1, 2);
      b.$_set(0, 3);
      b.$_set(1, 4);
      expect(a.toString()).assertEqual('1,2');
      expect(b.toString()).assertEqual('3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_TO_STRING_PART01_TEST_MINDMAP_6200
     * @tc.name int32ArrayToStringPart01TestMindmapTest062
     * @tc.desc Verify Int32Array ( buffer), toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayToStringPart01TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int32Array = new Int32Array([-10, 0, 10]);
      let dst: Int32Array = new Int32Array(src);
      expect(dst.toString()).assertEqual('-10,0,10');
      expect(dst.buffer).not().assertEqual(src.buffer);
    });

  });
}
