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
  beforeEach,
  afterEach,
  afterAll,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function int16ArrayLastIndexOfTestFourTest(): void {
  describe('Int16ArrayLastIndexOfTestFourTest', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_FOUR_0100
     * @tc.name testInt16ArrayLastIndexOfTestFour001
     * @tc.desc Verify lastIndexOf(20) leaves plain array unchanged after finding element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestFour001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30]);
      let result = arr.lastIndexOf(20);
      expect(result).assertEqual(1);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(10);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(20);
      let actual3: number = arr.$_get(2);
      expect(actual3).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_FOUR_0200
     * @tc.name testInt16ArrayLastIndexOfTestFour002
     * @tc.desc Verify lastIndexOf(99) leaves array unchanged when element not found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestFour002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30]);
      let result = arr.lastIndexOf(99);
      expect(result).assertEqual(-1);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(10);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(20);
      let actual3: number = arr.$_get(2);
      expect(actual3).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_FOUR_0300
     * @tc.name testInt16ArrayLastIndexOfTestFour003
     * @tc.desc Verify lastIndexOf(5) on empty array keeps length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestFour003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([]);
      let result = arr.lastIndexOf(5);
      expect(result).assertEqual(-1);
      let actual1: int = arr.length;
      expect(actual1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_FOUR_0400
     * @tc.name testInt16ArrayLastIndexOfTestFour004
     * @tc.desc Verify lastIndexOf(0) on empty array keeps byteLength unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestFour004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([]);
      let beforeByteLength: int = arr.byteLength;
      let result = arr.lastIndexOf(0);
      expect(result).assertEqual(-1);
      let actual1: int = arr.byteLength;
      let expected1: int = beforeByteLength;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_FOUR_0500
     * @tc.name testInt16ArrayLastIndexOfTestFour005
     * @tc.desc Verify lastIndexOf(32767) leaves max boundary element unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestFour005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([100, 32767, 200]);
      let result = arr.lastIndexOf(32767);
      expect(result).assertEqual(1);
      let actual1: number = arr.$_get(1);
      expect(actual1).assertEqual(32767);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_FOUR_0600
     * @tc.name testInt16ArrayLastIndexOfTestFour006
     * @tc.desc Verify lastIndexOf(-32768) leaves min boundary element unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestFour006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([100, -32768, 200]);
      let result = arr.lastIndexOf(-32768);
      expect(result).assertEqual(1);
      let actual1: number = arr.$_get(1);
      expect(actual1).assertEqual(-32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_FOUR_0700
     * @tc.name testInt16ArrayLastIndexOfTestFour007
     * @tc.desc Verify lastIndexOf(7) on array with duplicates leaves element order unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestFour007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([7, 8, 7, 9, 7]);
      let result = arr.lastIndexOf(7);
      expect(result).assertEqual(4);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(7);
      let actual2: number = arr.$_get(2);
      expect(actual2).assertEqual(7);
      let actual3: number = arr.$_get(4);
      expect(actual3).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_FOUR_0800
     * @tc.name testInt16ArrayLastIndexOfTestFour008
     * @tc.desc Verify lastIndexOf(4, -2) with negative fromIndex leaves array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestFour008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 2, 3, 4, 5]);
      let result = arr.lastIndexOf(4, -2);
      expect(result).assertEqual(3);
      let actual1: int = arr.length;
      expect(actual1).assertEqual(5);
      let actual2: number = arr.$_get(0);
      expect(actual2).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_FOUR_0900
     * @tc.name testInt16ArrayLastIndexOfTestFour009
     * @tc.desc Verify lastIndexOf(5, 0) with fromIndex 0 leaves array unchanged (searches index 0 only)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestFour009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([5, 10, 15]);
      let result = arr.lastIndexOf(5, 0);
      expect(result).assertEqual(0);
      let actual1: number = arr.$_get(1);
      expect(actual1).assertEqual(10);
      let actual2: number = arr.$_get(2);
      expect(actual2).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_FOUR_1000
     * @tc.name testInt16ArrayLastIndexOfTestFour010
     * @tc.desc Verify lastIndexOf(30, 100) with fromIndex beyond length leaves array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestFour010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30]);
      let result = arr.lastIndexOf(30, 100);
      expect(result).assertEqual(2);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(10);
      let actual2: number = arr.$_get(1);
      expect(actual2).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_FOUR_1100
     * @tc.name testInt16ArrayLastIndexOfTestFour011
     * @tc.desc Verify lastIndexOf(2) on ArrayBuffer-backed view leaves buffer bytes unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestFour011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(6);
      let arr = new Int16Array(buf);
      arr.$_set(0, 1);
      arr.$_set(1, 2);
      arr.$_set(2, 3);
      let result = arr.lastIndexOf(2);
      expect(result).assertEqual(1);
      let actual1: number = arr.$_get(0);
      expect(actual1).assertEqual(1);
      let actual2: number = arr.$_get(2);
      expect(actual2).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_FOUR_1200
     * @tc.name testInt16ArrayLastIndexOfTestFour012
     * @tc.desc Verify lastIndexOf(22) keeps length property unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestFour012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([11, 22, 33, 44]);
      let beforeLen: number = arr.length;
      let result = arr.lastIndexOf(22);
      expect(result).assertEqual(1);
      let actual1: int = arr.length;
      let expected1: number = beforeLen;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_FOUR_1300
     * @tc.name testInt16ArrayLastIndexOfTestFour013
     * @tc.desc Verify arr.lastIndexOf(0) returns 2 on zero-filled buffer view and byteOffset unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestFour013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(10);
      let arr = new Int16Array(buf, 2, 3);
      let beforeOffset: int = arr.byteOffset;
      let result = arr.lastIndexOf(0);
      expect(result).assertEqual(2);
      let actual1: int = arr.byteOffset;
      let expected1: int = beforeOffset;
      expect(actual1).assertEqual(expected1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_FOUR_1400
     * @tc.name testInt16ArrayLastIndexOfTestFour014
     * @tc.desc Verify using lastIndexOf result -1 as fromIndex finds previous duplicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestFour014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([5, 10, 5, 20, 5]);
      let lastIdx: int = arr.lastIndexOf(5);
      let prevIdx: int = arr.lastIndexOf(5, lastIdx - 1);
      expect(prevIdx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_FOUR_1500
     * @tc.name testInt16ArrayLastIndexOfTestFour015
     * @tc.desc Verify chained lastIndexOf finds three positions of duplicate from right to left
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestFour015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([9, 9, 9, 9]);
      let p1: int = arr.lastIndexOf(9);
      let p2: int = arr.lastIndexOf(9, p1 - 1);
      let p3: int = arr.lastIndexOf(9, p2 - 1);
      expect(p1).assertEqual(3);
      expect(p2).assertEqual(2);
      expect(p3).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_FOUR_1600
     * @tc.name testInt16ArrayLastIndexOfTestFour016
     * @tc.desc Verify arr.lastIndexOf(10, -2) returns 0 when fromIndex is notFound - 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestFour016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30]);
      let notFound: int = arr.lastIndexOf(99);
      let result: int = arr.lastIndexOf(10, notFound - 1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_FOUR_1700
     * @tc.name testInt16ArrayLastIndexOfTestFour017
     * @tc.desc Verify lastIndexOf result used as length argument of new Int16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestFour017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([3, 1, 4, 1, 5]);
      let posOf4: int = arr.lastIndexOf(4);
      expect(posOf4).assertEqual(2);
      let sub = new Int16Array(posOf4);
      let actual1: int = sub.length;
      expect(actual1).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_FOUR_1800
     * @tc.name testInt16ArrayLastIndexOfTestFour018
     * @tc.desc Verify lastIndexOf result used as target index of set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestFour018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 2, 3, 2, 5]);
      let lastPosOf2: int = arr.lastIndexOf(2);
      arr.$_set(lastPosOf2, 99);
      let actual1: number = arr.$_get(3);
      expect(actual1).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_FOUR_1900
     * @tc.name testInt16ArrayLastIndexOfTestFour019
     * @tc.desc Verify nested lastIndexOf(x, lastIndexOf(x) - 1) syntax
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestFour019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([6, 1, 6, 2, 6]);
      let secondLastPos: int = arr.lastIndexOf(6, arr.lastIndexOf(6) - 1);
      expect(secondLastPos).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_FOUR_2000
     * @tc.name testInt16ArrayLastIndexOfTestFour020
     * @tc.desc Verify lastIndexOf and indexOf return first and last positions of same element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestFour020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([8, 3, 8, 7, 8]);
      let firstPos: int = arr.indexOf(8);
      let lastPos: int = arr.lastIndexOf(8);
      expect(firstPos).assertEqual(0);
      expect(lastPos).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_FOUR_2100
     * @tc.name testInt16ArrayLastIndexOfTestFour021
     * @tc.desc Verify lastIndexOf(A) used as fromIndex of lastIndexOf(B)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestFour021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 5, 20, 5, 30]);
      let lastPosOf20: int = arr.lastIndexOf(20);
      let lastPosOf5Before20: int = arr.lastIndexOf(5, lastPosOf20);
      expect(lastPosOf5Before20).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_FOUR_2200
     * @tc.name testInt16ArrayLastIndexOfTestFour022
     * @tc.desc Verify arr.lastIndexOf(7, -1) returns 3 (chained p0 - 1 restarts full backward search)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestFour022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([7, 7, 7, 7]);
      let p3: int = arr.lastIndexOf(7);
      let p2: int = arr.lastIndexOf(7, p3 - 1);
      let p1: int = arr.lastIndexOf(7, p2 - 1);
      let p0: int = arr.lastIndexOf(7, p1 - 1);
      let none: int = arr.lastIndexOf(7, p0 - 1);
      expect(p3).assertEqual(3);
      expect(p0).assertEqual(0);
      expect(none).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_FOUR_2300
     * @tc.name testInt16ArrayLastIndexOfTestFour023
     * @tc.desc Verify lastIndexOf result -1 used to compute fromIndex from end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestFour023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 2, 3, 4]);
      let missing: int = arr.lastIndexOf(0);
      let result: int = arr.lastIndexOf(4, arr.length + missing);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_FOUR_2400
     * @tc.name testInt16ArrayLastIndexOfTestFour024
     * @tc.desc Verify lastIndexOf result passed directly as fromIndex to another lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestFour024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([11, 22, 11, 33, 11]);
      let lastPos: int = arr.lastIndexOf(11);
      let earlierPos: int = arr.lastIndexOf(11, lastPos - 1);
      expect(earlierPos).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_FOUR_2500
     * @tc.name testInt16ArrayLastIndexOfTestFour025
     * @tc.desc Verify lastIndexOf result as indexOf fromIndex confirms element not after that range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestFour025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([3, 7, 3, 7, 3]);
      let lastOf7: int = arr.lastIndexOf(7);
      let indexOf7After: int = arr.indexOf(7, lastOf7 + 1);
      expect(indexOf7After).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_FOUR_2600
     * @tc.name testInt16ArrayLastIndexOfTestFour026
     * @tc.desc Verify after set changes last element, lastIndexOf finds new value at last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestFour026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30]);
      arr.$_set(2, 99);
      let result = arr.lastIndexOf(99);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_FOUR_2700
     * @tc.name testInt16ArrayLastIndexOfTestFour027
     * @tc.desc Verify after set changes last element, lastIndexOf cannot find old value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestFour027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30]);
      arr.$_set(2, 99);
      let result = arr.lastIndexOf(30);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_FOUR_2800
     * @tc.name testInt16ArrayLastIndexOfTestFour028
     * @tc.desc Verify lastIndexOf(88, 1) with fromIndex before modified position does not find new value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestFour028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30]);
      arr.$_set(2, 88);
      let result = arr.lastIndexOf(88, 1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_FOUR_2900
     * @tc.name testInt16ArrayLastIndexOfTestFour029
     * @tc.desc Verify lastIndexOf(77, 1) with fromIndex at modified position finds new value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestFour029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30]);
      arr.$_set(1, 77);
      let result = arr.lastIndexOf(77, 1);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_FOUR_3000
     * @tc.name testInt16ArrayLastIndexOfTestFour030
     * @tc.desc Verify after two set writes, lastIndexOf finds value at first write position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestFour030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 2, 3]);
      arr.$_set(0, 50);
      arr.$_set(2, 60);
      let result = arr.lastIndexOf(50);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_FOUR_3100
     * @tc.name testInt16ArrayLastIndexOfTestFour031
     * @tc.desc Verify after two set writes, lastIndexOf finds value at second write position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestFour031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 2, 3]);
      arr.$_set(0, 50);
      arr.$_set(2, 60);
      let result = arr.lastIndexOf(60);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_FOUR_3200
     * @tc.name testInt16ArrayLastIndexOfTestFour032
     * @tc.desc Verify after set writes same value to all elements, lastIndexOf returns length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestFour032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 2, 3, 4]);
      arr.$_set(0, 7);
      arr.$_set(1, 7);
      arr.$_set(2, 7);
      arr.$_set(3, 7);
      let result = arr.lastIndexOf(7);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_FOUR_3300
     * @tc.name testInt16ArrayLastIndexOfTestFour033
     * @tc.desc Verify consecutive lastIndexOf calls return same result after set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestFour033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30]);
      arr.$_set(1, 55);
      let r1: int = arr.lastIndexOf(55);
      let r2: int = arr.lastIndexOf(55);
      expect(r1).assertEqual(1);
      expect(r2).assertEqual(r1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_FOUR_3400
     * @tc.name testInt16ArrayLastIndexOfTestFour034
     * @tc.desc Verify fill all elements then lastIndexOf returns length-1 for fill value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestFour034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 2, 3, 4]);
      arr.fill(99);
      let result = arr.lastIndexOf(99);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_FOUR_3500
     * @tc.name testInt16ArrayLastIndexOfTestFour035
     * @tc.desc Verify after partial fill [start,end), lastIndexOf finds fill value last occurrence inside range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestFour035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30, 40, 50]);
      arr.fill(7, 1, 3);
      let result = arr.lastIndexOf(7);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_FOUR_3600
     * @tc.name testInt16ArrayLastIndexOfTestFour036
     * @tc.desc Verify lastIndexOf(7, 1) with fromIndex before fill range does not find fill value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestFour036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30, 40, 50]);
      arr.fill(7, 2, 4);
      let result = arr.lastIndexOf(7, 1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_FOUR_3700
     * @tc.name testInt16ArrayLastIndexOfTestFour037
     * @tc.desc Verify after partial fill, lastIndexOf finds original value in unfilled range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestFour037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30, 40, 50]);
      arr.fill(7, 1, 3);
      let result = arr.lastIndexOf(40);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_FOUR_3800
     * @tc.name testInt16ArrayLastIndexOfTestFour038
     * @tc.desc Verify fill(int16.MAX) all elements then lastIndexOf returns length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestFour038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 2, 3]);
      arr.fill(32767);
      let result = arr.lastIndexOf(32767);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_FOUR_3900
     * @tc.name testInt16ArrayLastIndexOfTestFour039
     * @tc.desc Verify after reverse, lastIndexOf confirms original first element becomes last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestFour039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30]);
      arr.reverse();
      let result = arr.lastIndexOf(10);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_FOUR_4000
     * @tc.name testInt16ArrayLastIndexOfTestFour040
     * @tc.desc Verify after reverse, lastIndexOf confirms original last element becomes first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestFour040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30]);
      arr.reverse();
      let result = arr.lastIndexOf(30);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_FOUR_4100
     * @tc.name testInt16ArrayLastIndexOfTestFour041
     * @tc.desc Verify after reverse twice, lastIndexOf matches original array result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestFour041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([5, 10, 15, 20]);
      arr.reverse();
      arr.reverse();
      let result = arr.lastIndexOf(15);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_FOUR_4200
     * @tc.name testInt16ArrayLastIndexOfTestFour042
     * @tc.desc Verify after reverse, lastIndexOf position of middle value changes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestFour042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 5, 9]);
      arr.reverse();
      let result = arr.lastIndexOf(5);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_FOUR_4300
     * @tc.name testInt16ArrayLastIndexOfTestFour043
     * @tc.desc Verify arr.lastIndexOf(7) returns 3 after reverse of palindrome [3, 7, 3, 7, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestFour043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([3, 7, 3, 7, 3]);
      arr.reverse();
      let result = arr.lastIndexOf(7);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_FOUR_4400
     * @tc.name testInt16ArrayLastIndexOfTestFour044
     * @tc.desc Verify after sort, lastIndexOf finds element that moved from first position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestFour044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([50, 10, 30, 20, 40]);
      arr.sort();
      let result = arr.lastIndexOf(50);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_FOUR_4500
     * @tc.name testInt16ArrayLastIndexOfTestFour045
     * @tc.desc Verify arr.lastIndexOf(44) returns 3 after copyWithin(0, 3) (44 remains at index 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestFour045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([11, 22, 33, 44, 55]);
      arr.copyWithin(0, 3);
      let result = arr.lastIndexOf(44);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_FOUR_4600
     * @tc.name testInt16ArrayLastIndexOfTestFour046
     * @tc.desc Verify after copyWithin, lastIndexOf(44, 3) finds copied value at uncovered original position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestFour046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([11, 22, 33, 44, 55]);
      arr.copyWithin(0, 3);
      let result = arr.lastIndexOf(44, 3);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_FOUR_4700
     * @tc.name testInt16ArrayLastIndexOfTestFour047
     * @tc.desc Verify after copyWithin, lastIndexOf cannot find overwritten original value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestFour047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([11, 22, 33, 44, 55]);
      arr.copyWithin(0, 2);
      let result = arr.lastIndexOf(11);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_FOUR_4800
     * @tc.name testInt16ArrayLastIndexOfTestFour048
     * @tc.desc Verify after copyWithin, lastIndexOf finds value in unaffected region
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestFour048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 2, 3);
      let result = arr.lastIndexOf(4);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_FOUR_4900
     * @tc.name testInt16ArrayLastIndexOfTestFour049
     * @tc.desc Verify set(source) writes at offset 0 and lastIndexOf finds source value in target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestFour049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new Int16Array([1, 2, 3, 4]);
      let source = new Int16Array([99, 88]);
      target.set(source);
      let result = target.lastIndexOf(88);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_FOUR_5000
     * @tc.name testInt16ArrayLastIndexOfTestFour050
     * @tc.desc Verify set(source, offset) writes at non-zero offset and lastIndexOf finds new value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestFour050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new Int16Array([1, 2, 3, 4, 5]);
      let source = new Int16Array([77, 66]);
      target.set(source, 2);
      let result = target.lastIndexOf(66);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_FOUR_5100
     * @tc.name testInt16ArrayLastIndexOfTestFour051
     * @tc.desc Verify after set, lastIndexOf finds original value in uncovered region
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestFour051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new Int16Array([10, 20, 30, 40]);
      let source = new Int16Array([7, 8]);
      target.set(source, 1);
      let result = target.lastIndexOf(40);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_FOUR_5200
     * @tc.name testInt16ArrayLastIndexOfTestFour052
     * @tc.desc Verify set writes 98304 (wraps multiple times) and lastIndexOf finds wrapped stored value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestFour052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 2, 3]);
      arr.$_set(1, 98304);
      let result = arr.lastIndexOf(arr.$_get(1));
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_FOUR_5300
     * @tc.name testInt16ArrayLastIndexOfTestFour053
     * @tc.desc Verify set writes 32768 at multiple positions (overflow to -32768) and lastIndexOf returns rightmost
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestFour053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([0, 0, 0, 0, 0]);
      arr.$_set(0, 32768);
      arr.$_set(3, 32768);
      let result = arr.lastIndexOf(-32768);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_FOUR_5400
     * @tc.name testInt16ArrayLastIndexOfTestFour054
     * @tc.desc Verify lastIndexOf(-32768, 2) fromIndex before left overflow position returns earlier occurrence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestFour054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([0, 0, 0, 0, 0]);
      arr.$_set(1, 32768);
      arr.$_set(3, 32768);
      let result = arr.lastIndexOf(-32768, 2);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_FOUR_5500
     * @tc.name testInt16ArrayLastIndexOfTestFour055
     * @tc.desc Verify fill(-32769) then lastIndexOf finds 32767 (overflow on fill write)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestFour055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([0, 0, 0]);
      arr.fill(-32769);
      let result = arr.lastIndexOf(32767);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_FOUR_5600
     * @tc.name testInt16ArrayLastIndexOfTestFour056
     * @tc.desc Verify set source contains overflow value and lastIndexOf still finds non-overflow middle value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestFour056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new Int16Array([0, 0, 0]);
      let source = new Int16Array([32768, 42, 32768]);
      target.set(source);
      let result = target.lastIndexOf(42);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_FOUR_5700
     * @tc.name testInt16ArrayLastIndexOfTestFour057
     * @tc.desc Verify viewA.fill modifies shared buffer and viewB.lastIndexOf confirms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestFour057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(6);
      let viewA = new Int16Array(buf);
      let viewB = new Int16Array(buf);
      viewA.fill(77);
      let result = viewB.lastIndexOf(77);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_FOUR_5800
     * @tc.name testInt16ArrayLastIndexOfTestFour058
     * @tc.desc Verify viewA rewrites middle element and viewB.lastIndexOf finds new value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestFour058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(6);
      let viewA = new Int16Array(buf);
      let viewB = new Int16Array(buf);
      viewA.$_set(1, 55);
      let result = viewB.lastIndexOf(55);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_FOUR_5900
     * @tc.name testInt16ArrayLastIndexOfTestFour059
     * @tc.desc Verify cross-view writes and viewA.lastIndexOf finds value written by viewB
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestFour059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let viewA = new Int16Array(buf);
      let viewB = new Int16Array(buf);
      viewA.$_set(0, 11);
      viewB.$_set(1, 88);
      let result = viewA.lastIndexOf(88);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_FOUR_6000
     * @tc.name testInt16ArrayLastIndexOfTestFour060
     * @tc.desc Verify viewA writes then viewB.lastIndexOf(66, 2) with fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestFour060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(10);
      let viewA = new Int16Array(buf);
      let viewB = new Int16Array(buf);
      viewA.$_set(2, 66);
      let result = viewB.lastIndexOf(66, 2);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_FOUR_6100
     * @tc.name testInt16ArrayLastIndexOfTestFour061
     * @tc.desc Verify viewB with non-zero byteOffset writes and viewA.lastIndexOf finds at offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestFour061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(12);
      let viewA = new Int16Array(buf);
      let viewB = new Int16Array(buf, 4, 2);
      viewB.$_set(0, 99);
      let result = viewA.lastIndexOf(99);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_FOUR_6200
     * @tc.name testInt16ArrayLastIndexOfTestFour062
     * @tc.desc Verify viewA.lastIndexOf(77, 2) fromIndex before viewB write position cannot find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestFour062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(12);
      let viewA = new Int16Array(buf);
      let viewB = new Int16Array(buf, 4, 2);
      viewB.$_set(1, 77);
      let result = viewA.lastIndexOf(77, 2);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_FOUR_6300
     * @tc.name testInt16ArrayLastIndexOfTestFour063
     * @tc.desc Verify two views share middle region and B.lastIndexOf finds write of A
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestFour063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let viewA = new Int16Array(buf, 2, 3);
      let viewB = new Int16Array(buf, 4, 2);
      viewA.$_set(1, 55);
      let result = viewB.lastIndexOf(55);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_FOUR_6400
     * @tc.name testInt16ArrayLastIndexOfTestFour064
     * @tc.desc Verify viewA writes non-overlapping region and viewB.lastIndexOf cannot find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestFour064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let viewA = new Int16Array(buf, 0, 4);
      let viewB = new Int16Array(buf, 6, 2);
      viewA.$_set(1, 88);
      let result = viewB.lastIndexOf(88);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_FOUR_6500
     * @tc.name testInt16ArrayLastIndexOfTestFour065
     * @tc.desc Verify child.lastIndexOf(44) returns 1 (offset view maps parent[2] to child[1])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestFour065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(10);
      let parent = new Int16Array(buf);
      let child = new Int16Array(buf, 2, 3);
      parent.$_set(1, 33);
      parent.$_set(2, 44);
      let result = child.lastIndexOf(44);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_FOUR_6600
     * @tc.name testInt16ArrayLastIndexOfTestFour066
     * @tc.desc Verify child view writes and parent.lastIndexOf(19, 4) fromIndex within child range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestFour066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(14);
      let parent = new Int16Array(buf);
      let child = new Int16Array(buf, 4, 3);
      child.$_set(0, 19);
      child.$_set(2, 19);
      let result = parent.lastIndexOf(19, 4);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_FOUR_6700
     * @tc.name testInt16ArrayLastIndexOfTestFour067
     * @tc.desc Verify subarray set modifies and parent.lastIndexOf reflects change
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestFour067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent = new Int16Array([1, 2, 3, 4, 5]);
      let child = parent.subarray(1, 4);
      child.$_set(0, 99);
      let result = parent.lastIndexOf(99);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_FOUR_6800
     * @tc.name testInt16ArrayLastIndexOfTestFour068
     * @tc.desc Verify parent set modifies and child.lastIndexOf reflects change
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestFour068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent = new Int16Array([1, 2, 3, 4, 5]);
      let child = parent.subarray(1, 4);
      parent.$_set(2, 88);
      let result = child.lastIndexOf(88);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_FOUR_6900
     * @tc.name testInt16ArrayLastIndexOfTestFour069
     * @tc.desc Verify parent fill modifies and child.lastIndexOf confirms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestFour069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent = new Int16Array([5, 5, 5, 5, 5]);
      let child = parent.subarray(2, 4);
      parent.fill(33);
      let result = child.lastIndexOf(33);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_FOUR_7000
     * @tc.name testInt16ArrayLastIndexOfTestFour070
     * @tc.desc Verify subarray view modifies then parent.lastIndexOf(42, 0) fromIndex outside child range cannot find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestFour070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent = new Int16Array([0, 0, 0, 0, 0]);
      let child = parent.subarray(1, 3);
      child.$_set(0, 42);
      let result = parent.lastIndexOf(42, 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_LAST_INDEX_OF_FOUR_7100
     * @tc.name testInt16ArrayLastIndexOfTestFour071
     * @tc.desc Verify parent modifies then child.lastIndexOf(77, 0) fromIndex before first child element cannot find
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayLastIndexOfTestFour071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent = new Int16Array([1, 2, 3, 4, 5]);
      let child = parent.subarray(2, 5);
      parent.$_set(3, 77);
      let result = child.lastIndexOf(77, 0);
      expect(result).assertEqual(-1);
    });
  });
}
