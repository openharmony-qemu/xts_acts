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
} from "../../../../hypium/index";
import Utils from "../Util.test";

export default function int16ArrayIndexOfPart04Test01Test(): void {
  describe("Int16ArrayIndexOfPart04Test01Test", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART04_01_0100
     * @tc.name int16ArrayIndexOfPart04Test01001
     * @tc.desc Verify indexOf does not mutate array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart04Test01001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30]);
      let result = arr.indexOf(20);
      expect(result).assertEqual(1);
      let actual: number = arr.$_get(0);
      let expected: int = 10;
      expect(actual).assertEqual(expected);
      let actual2: number = arr.$_get(1);
      let expected2: int = 20;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(2);
      let expected3: int = 30;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART04_01_0200
     * @tc.name int16ArrayIndexOfPart04Test01002
     * @tc.desc Verify indexOf returns -1 when missing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart04Test01002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30]);
      let result = arr.indexOf(99);
      expect(result).assertEqual(-1);
      let actual: number = arr.$_get(0);
      let expected: int = 10;
      expect(actual).assertEqual(expected);
      let actual2: number = arr.$_get(1);
      let expected2: int = 20;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(2);
      let expected3: int = 30;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART04_01_0300
     * @tc.name int16ArrayIndexOfPart04Test01003
     * @tc.desc Verify indexOf returns -1 when missing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart04Test01003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([]);
      let result = arr.indexOf(5);
      expect(result).assertEqual(-1);
      let actual: int = arr.length;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART04_01_0400
     * @tc.name int16ArrayIndexOfPart04Test01004
     * @tc.desc Verify indexOf returns -1 when missing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart04Test01004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([]);
      let beforeByteLength: number = arr.byteLength;
      let result = arr.indexOf(0);
      expect(result).assertEqual(-1);
      let actual: int = arr.byteLength;
      let expected: number = beforeByteLength;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART04_01_0500
     * @tc.name int16ArrayIndexOfPart04Test01005
     * @tc.desc Verify indexOf does not mutate array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart04Test01005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val:short = 32767
      let arr = new Int16Array([100, val, 200]);
      let result = arr.indexOf(val);
      expect(result).assertEqual(1);
      let actual: number = arr.$_get(1);
      let expected: int = 32767;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART04_01_0600
     * @tc.name int16ArrayIndexOfPart04Test01006
     * @tc.desc Verify indexOf does not mutate array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart04Test01006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val:short = -32768
      let arr = new Int16Array([100, val, 200]);
      let result = arr.indexOf(val);
      expect(result).assertEqual(1);
      let actual: number = arr.$_get(1);
      let expected: int = -32768;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART04_01_0700
     * @tc.name int16ArrayIndexOfPart04Test01007
     * @tc.desc Verify indexOf does not mutate array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart04Test01007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([7, 8, 7, 9, 7]);
      let result = arr.indexOf(7);
      expect(result).assertEqual(0);
      let actual: number = arr.$_get(0);
      let expected: int = 7;
      expect(actual).assertEqual(expected);
      let actual2: number = arr.$_get(2);
      let expected2: int = 7;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(4);
      let expected3: int = 7;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART04_01_0800
     * @tc.name int16ArrayIndexOfPart04Test01008
     * @tc.desc Verify indexOf using fromIndex does not mutate array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart04Test01008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 2, 3, 4, 5]);
      let result = arr.indexOf(4, -2);
      expect(result).assertEqual(3);
      let actual: int = arr.length;
      let expected: int = 5;
      expect(actual).assertEqual(expected);
      let actual2: number = arr.$_get(0);
      let expected2: int = 1;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART04_01_0900
     * @tc.name int16ArrayIndexOfPart04Test01009
     * @tc.desc Verify indexOf using fromIndex returns -1 when missing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart04Test01009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30]);
      let result = arr.indexOf(10, 100);
      expect(result).assertEqual(-1);
      let actual: number = arr.$_get(1);
      let expected: int = 20;
      expect(actual).assertEqual(expected);
      let actual2: number = arr.$_get(2);
      let expected2: int = 30;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART04_01_1000
     * @tc.name int16ArrayIndexOfPart04Test01010
     * @tc.desc Verify indexOf after $_set with shared ArrayBuffer does not mutate array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart04Test01010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(6);
      let arr = new Int16Array(buf);
      arr.$_set(0, 1);
      arr.$_set(1, 2);
      arr.$_set(2, 3);
      let result = arr.indexOf(2);
      expect(result).assertEqual(1);
      let actual: number = arr.$_get(0);
      let expected: int = 1;
      expect(actual).assertEqual(expected);
      let actual2: number = arr.$_get(2);
      let expected2: int = 3;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART04_01_1100
     * @tc.name int16ArrayIndexOfPart04Test01011
     * @tc.desc Verify indexOf using fromIndex nested/chained calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart04Test01011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([5, 10, 5, 20, 5]);
      let firstIdx: int = arr.indexOf(5);
      let secondIdx: int = arr.indexOf(5, firstIdx + 1);
      expect(secondIdx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART04_01_1200
     * @tc.name int16ArrayIndexOfPart04Test01012
     * @tc.desc Verify indexOf using fromIndex nested/chained calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart04Test01012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 3, 5, 7, 9]);
      let idxOf3: int = arr.indexOf(3);
      let idxOf7: int = arr.indexOf(7, idxOf3);
      expect(idxOf7).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART04_01_1300
     * @tc.name int16ArrayIndexOfPart04Test01013
     * @tc.desc Verify indexOf using fromIndex nested/chained calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart04Test01013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([8, 6, 8, 4, 8]);
      let first: int = arr.indexOf(8);
      let second: int = arr.indexOf(8, first + 1);
      expect(second).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART04_01_1400
     * @tc.name int16ArrayIndexOfPart04Test01014
     * @tc.desc Verify indexOf using fromIndex nested/chained calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart04Test01014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([8, 6, 8, 4, 8]);
      let first: int = arr.indexOf(8);
      let second: int = arr.indexOf(8, first + 1);
      let third: int = arr.indexOf(8, second + 1);
      expect(third).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART04_01_1500
     * @tc.name int16ArrayIndexOfPart04Test01015
     * @tc.desc Verify indexOf using fromIndex nested/chained calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart04Test01015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30]);
      let notFound: int = arr.indexOf(99);
      let result: int = arr.indexOf(10, notFound + 1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART04_01_1600
     * @tc.name int16ArrayIndexOfPart04Test01016
     * @tc.desc Verify indexOf returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart04Test01016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([3, 1, 4, 1, 5]);
      let posOf4: int = arr.indexOf(4);
      expect(posOf4).assertEqual(2);
      let sub = new Int16Array(posOf4);
      let actual: int = sub.length;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART04_01_1700
     * @tc.name int16ArrayIndexOfPart04Test01017
     * @tc.desc Verify indexOf using fromIndex nested/chained calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart04Test01017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([9, 9, 9, 9]);
      let p1: int = arr.indexOf(9);
      let p2: int = arr.indexOf(9, p1 + 1);
      let p3: int = arr.indexOf(9, p2 + 1);
      expect(p1).assertEqual(0);
      expect(p2).assertEqual(1);
      expect(p3).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART04_01_1800
     * @tc.name int16ArrayIndexOfPart04Test01018
     * @tc.desc Verify indexOf using fromIndex nested/chained calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart04Test01018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([7, 8, 9]);
      let missing: int = arr.indexOf(0);
      let result: int = arr.indexOf(7, missing + 1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART04_01_1900
     * @tc.name int16ArrayIndexOfPart04Test01019
     * @tc.desc Verify indexOf using fromIndex nested/chained calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart04Test01019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([6, 1, 6, 2, 6]);
      let secondPos: int = arr.indexOf(6, arr.indexOf(6) + 1);
      expect(secondPos).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART04_01_2000
     * @tc.name int16ArrayIndexOfPart04Test01020
     * @tc.desc Verify indexOf after $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart04Test01020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30]);
      arr.$_set(0, 99);
      let result = arr.indexOf(99);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART04_01_2100
     * @tc.name int16ArrayIndexOfPart04Test01021
     * @tc.desc Verify indexOf after $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart04Test01021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 2, 3]);
      arr.$_set(0, 50);
      arr.$_set(2, 60);
      let result = arr.indexOf(50);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART04_01_2200
     * @tc.name int16ArrayIndexOfPart04Test01022
     * @tc.desc Verify indexOf after $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart04Test01022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 2, 3]);
      arr.$_set(0, 50);
      arr.$_set(2, 60);
      let result = arr.indexOf(60);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART04_01_2300
     * @tc.name int16ArrayIndexOfPart04Test01023
     * @tc.desc Verify indexOf after fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart04Test01023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 2, 3, 4]);
      arr.fill(99);
      let result = arr.indexOf(99);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART04_01_2400
     * @tc.name int16ArrayIndexOfPart04Test01024
     * @tc.desc Verify indexOf after reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart04Test01024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30]);
      arr.reverse();
      let result = arr.indexOf(30);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART04_01_2500
     * @tc.name int16ArrayIndexOfPart04Test01025
     * @tc.desc Verify indexOf after reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart04Test01025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30]);
      arr.reverse();
      let result = arr.indexOf(10);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART04_01_2600
     * @tc.name int16ArrayIndexOfPart04Test01026
     * @tc.desc Verify indexOf after reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart04Test01026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([5, 10, 15, 20]);
      arr.reverse();
      arr.reverse();
      let result = arr.indexOf(15);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART04_01_2700
     * @tc.name int16ArrayIndexOfPart04Test01027
     * @tc.desc Verify indexOf after reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart04Test01027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 5, 9]);
      arr.reverse();
      let result = arr.indexOf(5);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART04_01_2800
     * @tc.name int16ArrayIndexOfPart04Test01028
     * @tc.desc Verify indexOf after sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart04Test01028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([30, 10, 20]);
      arr.sort();
      let result = arr.indexOf(10);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART04_01_2900
     * @tc.name int16ArrayIndexOfPart04Test01029
     * @tc.desc Verify indexOf after sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart04Test01029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([30, 10, 20]);
      arr.sort();
      let result = arr.indexOf(30);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART04_01_3000
     * @tc.name int16ArrayIndexOfPart04Test01030
     * @tc.desc Verify indexOf after sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart04Test01030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([50, 10, 30, 20, 40]);
      arr.sort();
      let result = arr.indexOf(50);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART04_01_3100
     * @tc.name int16ArrayIndexOfPart04Test01031
     * @tc.desc Verify indexOf after sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart04Test01031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([5, -10, 0, 3, -5]);
      arr.sort();
      let result = arr.indexOf(-10);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART04_01_3200
     * @tc.name int16ArrayIndexOfPart04Test01032
     * @tc.desc Verify indexOf after copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart04Test01032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([11, 22, 33, 44, 55]);
      arr.copyWithin(0, 3);
      let result = arr.indexOf(44);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART04_01_3300
     * @tc.name int16ArrayIndexOfPart04Test01033
     * @tc.desc Verify indexOf after copyWithin using fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart04Test01033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([11, 22, 33, 44, 55]);
      arr.copyWithin(0, 3);
      let result = arr.indexOf(44, 3);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART04_01_3400
     * @tc.name int16ArrayIndexOfPart04Test01034
     * @tc.desc Verify indexOf after copyWithin returns -1 when missing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart04Test01034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([11, 22, 33, 44, 55]);
      arr.copyWithin(0, 2);
      let result = arr.indexOf(11);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART04_01_3500
     * @tc.name int16ArrayIndexOfPart04Test01035
     * @tc.desc Verify indexOf after copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart04Test01035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 2, 3);
      let result = arr.indexOf(4);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART04_01_3600
     * @tc.name int16ArrayIndexOfPart04Test01036
     * @tc.desc Verify indexOf after set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart04Test01036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new Int16Array([1, 2, 3, 4]);
      let source = new Int16Array([99, 88]);
      target.set(source);
      let result = target.indexOf(99);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART04_01_3700
     * @tc.name int16ArrayIndexOfPart04Test01037
     * @tc.desc Verify indexOf after set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart04Test01037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new Int16Array([1, 2, 3, 4, 5]);
      let source = new Int16Array([77, 66]);
      target.set(source, 2);
      let result = target.indexOf(77);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART04_01_3800
     * @tc.name int16ArrayIndexOfPart04Test01038
     * @tc.desc Verify indexOf after set returns -1 when missing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart04Test01038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new Int16Array([100, 200, 300]);
      let source = new Int16Array([999]);
      target.set(source);
      let result = target.indexOf(100);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART04_01_3900
     * @tc.name int16ArrayIndexOfPart04Test01039
     * @tc.desc Verify indexOf after set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart04Test01039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new Int16Array([10, 20, 30, 40]);
      let source = new Int16Array([7, 8]);
      target.set(source, 1);
      let result = target.indexOf(40);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART04_01_4000
     * @tc.name int16ArrayIndexOfPart04Test01040
     * @tc.desc Verify indexOf after set with of()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart04Test01040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = new Int16Array(5);
      let source = Int16Array.of(1, 2, 3, 4, 5);
      target.set(source);
      let result = target.indexOf(3);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART04_01_4100
     * @tc.name int16ArrayIndexOfPart04Test01041
     * @tc.desc Verify indexOf after $_set with overflow truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart04Test01041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 2, 3]);
      arr.$_set(1, 98304);
      let result = arr.indexOf(arr.$_get(1));
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART04_01_4200
     * @tc.name int16ArrayIndexOfPart04Test01042
     * @tc.desc Verify indexOf after $_set with shared ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart04Test01042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(6);
      let viewA = new Int16Array(buf);
      let viewB = new Int16Array(buf);
      viewA.$_set(0, 42);
      let result = viewB.indexOf(42);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART04_01_4300
     * @tc.name int16ArrayIndexOfPart04Test01043
     * @tc.desc Verify indexOf after fill with shared ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart04Test01043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(6);
      let viewA = new Int16Array(buf);
      let viewB = new Int16Array(buf);
      viewA.fill(77);
      let result = viewB.indexOf(77);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART04_01_4400
     * @tc.name int16ArrayIndexOfPart04Test01044
     * @tc.desc Verify indexOf after $_set with shared ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart04Test01044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let viewA = new Int16Array(buf);
      let viewB = new Int16Array(buf);
      viewA.$_set(0, 55);
      viewB.$_set(0, 88);
      let result = viewA.indexOf(88);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART04_01_4500
     * @tc.name int16ArrayIndexOfPart04Test01045
     * @tc.desc Verify indexOf after $_set with subarray view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart04Test01045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent = new Int16Array([1, 2, 3, 4, 5]);
      let child = parent.subarray(1, 4);
      child.$_set(0, 99);
      let result = parent.indexOf(99);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART04_01_4600
     * @tc.name int16ArrayIndexOfPart04Test01046
     * @tc.desc Verify indexOf after fill with subarray view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart04Test01046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent = new Int16Array([10, 20, 30, 40, 50]);
      let child = parent.subarray(2, 5);
      child.fill(7);
      let result = parent.indexOf(7);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART04_01_4700
     * @tc.name int16ArrayIndexOfPart04Test01047
     * @tc.desc Verify indexOf after $_set with subarray view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart04Test01047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent = new Int16Array([1, 2, 3, 4, 5]);
      let child = parent.subarray(1, 4);
      parent.$_set(2, 88);
      let result = child.indexOf(88);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART04_01_4800
     * @tc.name int16ArrayIndexOfPart04Test01048
     * @tc.desc Verify indexOf after fill with subarray view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart04Test01048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent = new Int16Array([5, 5, 5, 5, 5]);
      let child = parent.subarray(2, 4);
      parent.fill(33);
      let result = child.indexOf(33);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART04_01_4900
     * @tc.name int16ArrayIndexOfPart04Test01049
     * @tc.desc Verify indexOf after $_set with subarray view using fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart04Test01049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent = new Int16Array([0, 0, 0, 0, 0]);
      let child = parent.subarray(1, 3);
      child.$_set(0, 42);
      let result = parent.indexOf(42, 3);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART04_01_5000
     * @tc.name int16ArrayIndexOfPart04Test01050
     * @tc.desc Verify indexOf after $_set with shared ArrayBuffer nested/chained calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart04Test01050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(12);
      let viewAll = new Int16Array(buf);
      viewAll.$_set(0, 10);
      viewAll.$_set(1, 20);
      viewAll.$_set(2, 30);
      let index0 = viewAll.indexOf(10);
      let index1 = viewAll.indexOf(20);
      let index2 = viewAll.indexOf(30);
      expect(index0).assertEqual(0);
      expect(index1).assertEqual(1);
      expect(index2).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART04_01_5100
     * @tc.name int16ArrayIndexOfPart04Test01051
     * @tc.desc Verify indexOf after $_set with subarray view with shared ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart04Test01051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(10);
      let view1 = new Int16Array(buf);
      let view2 = new Int16Array(buf);
      let v1Child = view1.subarray(1, 3);
      v1Child.$_set(0, 55);
      let result = view2.indexOf(55);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART04_01_5200
     * @tc.name int16ArrayIndexOfPart04Test01052
     * @tc.desc Verify indexOf after $_set using fromIndex nested/chained calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart04Test01052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 2, 3, 4, 5]);
      arr.$_set(3, 99);
      let pos2: int = arr.indexOf(2);
      let result = arr.indexOf(99, pos2 + 1);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART04_01_5300
     * @tc.name int16ArrayIndexOfPart04Test01053
     * @tc.desc Verify indexOf after fill after sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart04Test01053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([9, 1, 5, 3, 7]);
      arr.fill(4, 0, 2);
      arr.sort();
      let result = arr.indexOf(4);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART04_01_5400
     * @tc.name int16ArrayIndexOfPart04Test01054
     * @tc.desc Verify indexOf after fill after reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart04Test01054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 2, 3, 4]);
      arr.reverse();
      arr.fill(0, 2);
      let result = arr.indexOf(0);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART04_01_5500
     * @tc.name int16ArrayIndexOfPart04Test01055
     * @tc.desc Verify indexOf after sort after $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart04Test01055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([50, 10, 30, 20, 40]);
      arr.sort();
      arr.$_set(4, 99);
      let result = arr.indexOf(99);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART04_01_5600
     * @tc.name int16ArrayIndexOfPart04Test01056
     * @tc.desc Verify indexOf after reverse after copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart04Test01056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 2, 3, 4, 5]);
      arr.copyWithin(0, 2, 4);
      arr.reverse();
      let result = arr.indexOf(4);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART04_01_5700
     * @tc.name int16ArrayIndexOfPart04Test01057
     * @tc.desc Verify indexOf after sort after set with of()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart04Test01057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([5, 1, 3]);
      let src = Int16Array.of(2, 4);
      arr.set(src, 1);
      arr.sort();
      let result = arr.indexOf(2);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART04_01_5800
     * @tc.name int16ArrayIndexOfPart04Test01058
     * @tc.desc Verify indexOf after fill after reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart04Test01058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30, 40, 50]);
      arr.fill(7, 2, 4);
      arr.reverse();
      let result = arr.indexOf(7);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_INDEX_OF_PART04_01_5900
     * @tc.name int16ArrayIndexOfPart04Test01059
     * @tc.desc Verify indexOf after $_set with of()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayIndexOfPart04Test01059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(100, 200, 300);
      arr.$_set(1, 250);
      let result = arr.indexOf(250);
      expect(result).assertEqual(1);
    });

  });
}
