'use static';


/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2
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

export default function int32ArrayLastIndexOfPart03TestMindmapTestTest(): void {
  describe('Int32ArrayLastIndexOfPart03TestMindmapTestTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_0100
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest001
     * @tc.desc Verify fromIndex=length clamps to length-1 and hits tail element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array([11, 22, 33]);
        let r: number = arr.lastIndexOf(33, 3);
        expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_0200
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest002
     * @tc.desc Verify fromIndex=length clamps to length-1 and can still find non-tail element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array([11, 22, 33]);
        let r: number = arr.lastIndexOf(11, 3);
        expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_0300
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest003
     * @tc.desc Verify fromIndex=length+1 clamps to length-1 and searches entire array backward
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array([5, 6, 7]);
        let r: number = arr.lastIndexOf(5, 4);
        expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_0400
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest004
     * @tc.desc Verify fromIndex=1000000 clamps without error and returns rightmost duplicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array([8, 9, 10, 8]);
        let r: number = arr.lastIndexOf(8, 1000000);
        expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_0500
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest005
     * @tc.desc Verify fromIndex=INT_MAX 2147483647 clamps without error and returns correct hit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array([1, 2, 3]);
        let r: number = arr.lastIndexOf(2, 2147483647);
        expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_0600
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest006
     * @tc.desc Verify fromIndex=INT_MAX with nonexistent element still returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array([1, 2, 3]);
        let r: number = arr.lastIndexOf(999, 2147483647);
        expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_0700
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest007
     * @tc.desc Verify single-element array fromIndex=length(1) clamps to 0 and hits unique element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array([42]);
        let r: number = arr.lastIndexOf(42, 1);
        expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_0800
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest008
     * @tc.desc Verify single-element array fromIndex=1000 clamps to 0, mismatch returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array([42]);
        let r: number = arr.lastIndexOf(7, 1000);
        expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_0900
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest009
     * @tc.desc Verify length-2 array fromIndex=2 clamps to 1 and hits tail element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array([-1, -2]);
        let r: number = arr.lastIndexOf(-2, 2);
        expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_1000
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest010
     * @tc.desc Verify fromIndex=length+100 clamps to length-1 and returns rightmost match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array([3, 1, 4, 1, 5]);
        let r: number = arr.lastIndexOf(1, 105);
        expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_1100
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest011
     * @tc.desc Verify fromIndex=-1 resolves to length-1 and hits last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array([10, 20, 30]);
        let r: number = arr.lastIndexOf(30, -1);
        expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_1200
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest012
     * @tc.desc Verify fromIndex=-1 when last element mismatches only checks index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array([10, 20, 30]);
        let r: number = arr.lastIndexOf(20, -1);
        expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_1300
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest013
     * @tc.desc Verify fromIndex=-length resolves to 0 and hits first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array([7, 8, 9]);
        let r: number = arr.lastIndexOf(7, -3);
        expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_1400
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest014
     * @tc.desc Verify fromIndex=-(length+1) computed index < 0 returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array([7, 8, 9]);
        let r: number = arr.lastIndexOf(7, -4);
        expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_1500
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest015
     * @tc.desc Verify fromIndex=-(length+1) returns -1 even for tail element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array([1, 2, 3]);
        let r: number = arr.lastIndexOf(3, -4);
        expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_1600
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest016
     * @tc.desc Verify fromIndex=-1000000 computed index < 0 returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array([1, 2, 3]);
        let r: number = arr.lastIndexOf(2, -1000000);
        expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_1700
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest017
     * @tc.desc Verify fromIndex=INT_MIN -2147483648 computed index < 0 returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array([1, 2, 3]);
        let r: number = arr.lastIndexOf(1, -2147483648);
        expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_1800
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest018
     * @tc.desc Verify single-element array fromIndex=-1 resolves to 0 and hits unique element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array([99]);
        let r: number = arr.lastIndexOf(99, -1);
        expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_1900
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest019
     * @tc.desc Verify single-element array fromIndex=-2 negative overflow returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array([99]);
        let r: number = arr.lastIndexOf(99, -2);
        expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_2000
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest020
     * @tc.desc Verify fromIndex=-2 resolves to length-2 and searches only [0..2] backward
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array([5, 5, 5, 5]);
        let r: number = arr.lastIndexOf(5, -2);
        expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_2100
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest021
     * @tc.desc Verify fromIndex=-2 excludes index length-1 from search range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
        let r: number = arr.lastIndexOf(4, -2);
        expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_2200
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest022
     * @tc.desc Verify fromIndex=0 only checks index 0 and hits first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array([77, 88, 99]);
        let r: number = arr.lastIndexOf(77, 0);
        expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_2300
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest023
     * @tc.desc Verify fromIndex=0 does not search subsequent elements, mismatch returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array([77, 88, 99]);
        let r: number = arr.lastIndexOf(99, 0);
        expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_2400
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest024
     * @tc.desc Verify fromIndex=2.9 truncates to 2 and hits index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array([10, 20, 30]);
        let r: number = arr.lastIndexOf(30, 2);
        expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_2500
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest025
     * @tc.desc Verify fromIndex=+Infinity clamps to length-1 and searches entire array backward
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array([1, 2, 3, 2]);
        let r: number = arr.lastIndexOf(2, arr.length - 1);
        expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_2600
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest026
     * @tc.desc Verify fromIndex=-Infinity computed index < 0 returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array([1, 2, 3]);
        let r: number = arr.lastIndexOf(1, -arr.length - 1);
        expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_2700
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest027
     * @tc.desc Verify searchElement=NaN never matches via strict equality, returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array([0, 1, 2]);
        let r: number = arr.lastIndexOf(Number.NaN);
        expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_2800
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest028
     * @tc.desc Verify searchElement=+Infinity uses strict numeric matching and returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array([0, 1, 0]);
        let r: number = arr.lastIndexOf(Number.POSITIVE_INFINITY);
        expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_2900
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest029
     * @tc.desc Verify searchElement=-Infinity uses strict numeric matching and returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array([1, 0, 2, 0]);
        let r: number = arr.lastIndexOf(Number.NEGATIVE_INFINITY);
        expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_3000
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest030
     * @tc.desc Verify searchElement=0.5 uses strict numeric matching and returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array([1, 0, 2]);
        let r: number = arr.lastIndexOf(0.5);
        expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_3100
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest031
     * @tc.desc Verify searchElement=2147483647.9 uses strict numeric matching and returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array([1, 2147483647, 2]);
        let r: number = arr.lastIndexOf(2147483647.9);
        expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_3200
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest032
     * @tc.desc Verify searchElement=2147483648 uses strict numeric matching and returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array([1, -2147483648, 2]);
        let r: number = arr.lastIndexOf(2147483648.0);
        expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_3300
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest033
     * @tc.desc Verify searchElement=2147483649 uses strict numeric matching and returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array([-2147483647, 5]);
        let r: number = arr.lastIndexOf(2147483649.0);
        expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_3400
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest034
     * @tc.desc Verify searchElement=-2147483649 uses strict numeric matching and returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array([3, 2147483647]);
        let r: number = arr.lastIndexOf(-2147483649.0);
        expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_3500
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest035
     * @tc.desc Verify searchElement=4294967296.0(2^32) uses strict numeric matching and returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array([0, 5, 0]);
        let r: number = arr.lastIndexOf(4294967296.0);
        expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_3600
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest036
     * @tc.desc Verify searchElement=4294967297.0(2^32+1) uses strict numeric matching and returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array([1, 2, 1]);
        let r: number = arr.lastIndexOf(4294967297.0);
        expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_3700
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest037
     * @tc.desc Verify searchElement=INT_MAX 2147483647 exact match returns rightmost index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array([-1, 2147483647, 2147483647]);
        let r: number = arr.lastIndexOf(2147483647);
        expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_3800
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest038
     * @tc.desc Verify searchElement=INT_MIN -2147483648 exact match returns rightmost index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array([-2147483648, 0, -2147483648]);
        let r: number = arr.lastIndexOf(-2147483648);
        expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_3900
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest039
     * @tc.desc Verify searchElement=-1 exact match hits -1 element via ToInt32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array([1, -1, 2]);
        let r: number = arr.lastIndexOf(-1);
        expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_4000
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest040
     * @tc.desc Verify searchElement=+0 hits 0 element under SameValueZero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array([1, 0, 2]);
        let r: number = arr.lastIndexOf(0);
        expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_4100
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest041
     * @tc.desc Verify searchElement=-0.0 strict equality with +0 hits 0 element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array([1, 0, 2]);
        let r: number = arr.lastIndexOf(-0.0);
        expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_4200
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest042
     * @tc.desc Verify empty array with omitted fromIndex returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array(0);
        let r: number = arr.lastIndexOf(0);
        expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_4300
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest043
     * @tc.desc Verify empty array with fromIndex=0 returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array(0);
        let r: number = arr.lastIndexOf(0, 0);
        expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_4400
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest044
     * @tc.desc Verify empty array with fromIndex=-1 returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array(0);
        let r: number = arr.lastIndexOf(0, -1);
        expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_4500
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest045
     * @tc.desc Verify empty array with fromIndex=1000000 returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array(0);
        let r: number = arr.lastIndexOf(0, 1000000);
        expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_4600
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest046
     * @tc.desc Verify empty array with fromIndex=-1000000 returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array(0);
        let r: number = arr.lastIndexOf(0, -1000000);
        expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_4700
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest047
     * @tc.desc Verify empty array search NaN returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array(0);
        let r: number = arr.lastIndexOf(Number.NaN);
        expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_4800
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest048
     * @tc.desc Verify single-element array omit fromIndex, match returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array([42]);
        let r: number = arr.lastIndexOf(42);
        expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_4900
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest049
     * @tc.desc Verify single-element array omit fromIndex, mismatch returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array([42]);
        let r: number = arr.lastIndexOf(7);
        expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_5000
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest050
     * @tc.desc Verify single-element array fromIndex=0, match returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array([-5]);
        let r: number = arr.lastIndexOf(-5, 0);
        expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_5100
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest051
     * @tc.desc Verify single-element array fromIndex=0, mismatch returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array([-5]);
        let r: number = arr.lastIndexOf(5, 0);
        expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_5200
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest052
     * @tc.desc Verify single INT_MIN element array search INT_MIN returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array([-2147483648]);
        let r: number = arr.lastIndexOf(-2147483648);
        expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_5300
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest053
     * @tc.desc Verify single INT_MAX element search INT_MAX+1 overflows to INT_MIN, returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array([2147483647]);
        let r: number = arr.lastIndexOf(2147483648.0);
        expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_5400
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest054
     * @tc.desc Verify all-same positive array omit fromIndex returns length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array([7, 7, 7, 7]);
        let r: number = arr.lastIndexOf(7);
        expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_5500
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest055
     * @tc.desc Verify all-same zero array returns rightmost index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array([0, 0, 0]);
        let r: number = arr.lastIndexOf(0);
        expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_5600
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest056
     * @tc.desc Verify all-same INT_MIN array returns rightmost index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array([-2147483648, -2147483648]);
        let r: number = arr.lastIndexOf(-2147483648);
        expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_5700
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest057
     * @tc.desc Verify all-same -1 array fromIndex=0 limits search to index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array([-1, -1, -1]);
        let r: number = arr.lastIndexOf(-1, 0);
        expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_5800
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest058
     * @tc.desc Verify all-same -1 array fromIndex=1 returns index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array([-1, -1, -1]);
        let r: number = arr.lastIndexOf(-1, 1);
        expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_5900
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest059
     * @tc.desc Verify all-same array with different searchElement returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array([5, 5, 5]);
        let r: number = arr.lastIndexOf(6);
        expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_6000
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest060
     * @tc.desc Verify alternating 0/1 array search 0 returns rightmost index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array([0, 1, 0, 1, 0]);
        let r: number = arr.lastIndexOf(0);
        expect(r).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_6100
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest061
     * @tc.desc Verify alternating 0/1 array fromIndex=3 search 0 returns index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array([0, 1, 0, 1, 0]);
        let r: number = arr.lastIndexOf(0, 3);
        expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_6200
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest062
     * @tc.desc Verify ascending array with duplicate, search middle value returns rightmost
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array([1, 2, 3, 3, 4]);
        let r: number = arr.lastIndexOf(3);
        expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_6300
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest063
     * @tc.desc Verify array with INT_MIN/0/INT_MAX, search INT_MIN returns correct position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array([-2147483648, 0, 2147483647]);
        let r: number = arr.lastIndexOf(-2147483648);
        expect(r).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_6400
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest064
     * @tc.desc Verify array with INT_MIN/0/INT_MAX, search INT_MAX returns correct position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array([-2147483648, 0, 2147483647]);
        let r: number = arr.lastIndexOf(2147483647);
        expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_6500
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest065
     * @tc.desc Verify negative duplicate array fromIndex=length-2 excludes last duplicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array([-10, -20, -10, -20]);
        let r: number = arr.lastIndexOf(-20, 2);
        expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_6600
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest066
     * @tc.desc Verify element only at index 0, fromIndex=-5 < 0 returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array([99, 1, 2, 3]);
        let r: number = arr.lastIndexOf(99, -5);
        expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_6700
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest067
     * @tc.desc Verify element only at last index, fromIndex=-2 excludes tail returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array([1, 2, 3, 88]);
        let r: number = arr.lastIndexOf(88, -2);
        expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_6800
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest068
     * @tc.desc Verify return value type is number and can use === -1 for not-found check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array([1, 2]);
        let r: number = arr.lastIndexOf(3);
        let notFound: boolean = r === -1;
        expect(notFound).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_6900
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest069
     * @tc.desc Verify hit returns non-negative index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array([10, 20, 30]);
        let r: number = arr.lastIndexOf(20);
        expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_7000
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest070
     * @tc.desc Verify lastIndexOf does not modify array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array([1, 2, 3]);
        let len0: number = arr.length;
        arr.lastIndexOf(2);
        let len1: number = arr.length;
        expect(len1).assertEqual(len0);
        expect(arr.$_get(0)).assertEqual(1);
        expect(arr.$_get(1)).assertEqual(2);
        expect(arr.$_get(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_7100
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest071
     * @tc.desc Verify two consecutive lastIndexOf calls with same args return same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array([5, 3, 5, 3]);
        let r1: number = arr.lastIndexOf(5);
        let r2: number = arr.lastIndexOf(5);
        expect(r2).assertEqual(r1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_7200
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest072
     * @tc.desc Verify subarray view lastIndexOf returns index relative to subarray start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array([10, 20, 30, 40, 50]);
        let sub: Int32Array = arr.subarray(2, 5);
        let r: number = sub.lastIndexOf(40);
        expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_7300
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest073
     * @tc.desc Verify subarray empty view lastIndexOf returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array([1, 2, 3]);
        let sub: Int32Array = arr.subarray(2, 2);
        let r: number = sub.lastIndexOf(1);
        expect(r).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_7400
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest074
     * @tc.desc Verify modifying buffer via another view is observable by lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf: ArrayBuffer = new ArrayBuffer(16);
        let a1: Int32Array = new Int32Array(buf);
        a1.$_set(0, 11);
        a1.$_set(1, 22);
        a1.$_set(2, 33);
        a1.$_set(3, 44);
        let a2: Int32Array = new Int32Array(buf);
        a2.$_set(2, 99);
        let r: number = a1.lastIndexOf(99);
        expect(r).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_7500
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest075
     * @tc.desc Verify byteOffset view lastIndexOf index relative to view start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buf: ArrayBuffer = new ArrayBuffer(24);
        let arr: Int32Array = new Int32Array(buf, 8, 3);
        arr.$_set(0, 7);
        arr.$_set(1, 8);
        arr.$_set(2, 9);
        let r: number = arr.lastIndexOf(8);
        expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_7600
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest076
     * @tc.desc Verify Int32Array.of constructed array lastIndexOf works correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = Int32Array.of(100, 200, 300, 200);
        let r: number = arr.lastIndexOf(200);
        expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_7700
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest077
     * @tc.desc Verify Int32Array.from constructed array lastIndexOf works correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let src: int[] = [5, 6, 7, 6];
        let arr: Int32Array = Int32Array.from(src);
        let r: number = arr.lastIndexOf(6);
        expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_7800
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest078
     * @tc.desc Verify fill all then lastIndexOf returns length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array(4);
        arr.fill(7);
        let r: number = arr.lastIndexOf(7);
        expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_7900
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest079
     * @tc.desc Verify reverse then lastIndexOf returns correct position for reversed elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array([1, 2, 3, 4]);
        arr.reverse();
        let r: number = arr.lastIndexOf(1);
        expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_8000
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest080
     * @tc.desc Verify sort then lastIndexOf duplicate returns rightmost index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array([3, 1, 4, 1, 5, 9, 2, 6]);
        arr.sort();
        let r: number = arr.lastIndexOf(1);
        expect(r).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_8100
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest081
     * @tc.desc Verify set batch write then lastIndexOf hits written position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array(5);
        let src: Int32Array = new Int32Array([10, 20]);
        arr.set(src, 2);
        let r: number = arr.lastIndexOf(20);
        expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_8200
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest082
     * @tc.desc Verify copyWithin then lastIndexOf hits copied value rightmost index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array([1, 2, 3, 4, 5]);
        arr.copyWithin(3, 0, 2);
        let r: number = arr.lastIndexOf(1);
        expect(r).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_8300
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest083
     * @tc.desc Verify not found then found on same array returns correct results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array([1, 2, 3]);
        let r1: number = arr.lastIndexOf(99);
        let r2: number = arr.lastIndexOf(2);
        expect(r1).assertEqual(-1);
        expect(r2).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT32ARRAY_LAST_INDEX_OF_PART03_TEST_MINDMAP_8400
     * @tc.name int32ArrayLastIndexOfPart03TestMindmapTest084
     * @tc.desc Verify INT_MAX/INT_MIN adjacent array search INT_MIN returns correct index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int32ArrayLastIndexOfPart03TestMindmapTest084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr: Int32Array = new Int32Array([2147483647, -2147483648]);
        let r: number = arr.lastIndexOf(-2147483648);
        expect(r).assertEqual(1);
    });

  });
}
