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

export default function int16ArrayEntriesPart02Test(): void {
  describe("Int16ArrayEntriesPart02Test", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART02__0100
     * @tc.name int16ArrayEntriesPart02Test001
     * @tc.desc Verify entries() over [10,20] first next() value equals 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart02Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20);
      let iter = arr.entries();
      let entry = iter.next().value!;
      let actual: number = entry[1];
      let expected: int = 10;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART02__0200
     * @tc.name int16ArrayEntriesPart02Test002
     * @tc.desc Verify entries() over [5,10] first next() index equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart02Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([5, 10]);
      let iter = arr.entries();
      let entry = iter.next().value!;
      let actual: number = entry[0];
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART02__0300
     * @tc.name int16ArrayEntriesPart02Test003
     * @tc.desc Verify entries() over [100] first next() done is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart02Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(100);
      let iter = arr.entries();
      let result = iter.next();
      let actual: boolean = result.done!;
      expect(actual).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART02__0400
     * @tc.name int16ArrayEntriesPart02Test004
     * @tc.desc Verify entries() over [10,20,30,40] second next() index equals 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart02Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40);
      let iter = arr.entries();
      iter.next();
      let entry = iter.next().value!;
      let actual: number = entry[0];
      let expected: int = 1;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART02__0500
     * @tc.name int16ArrayEntriesPart02Test005
     * @tc.desc Verify entries() over [5,15,25,35] second next() value equals 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart02Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(5, 15, 25, 35);
      let iter = arr.entries();
      iter.next();
      let entry = iter.next().value!;
      let actual: number = entry[1];
      let expected: int = 15;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART02__0600
     * @tc.name int16ArrayEntriesPart02Test006
     * @tc.desc Verify entries() next().done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart02Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(0);
      let iter = arr.entries();
      let result = iter.next();
      let actual: boolean = result.done!;
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART02__0700
     * @tc.name int16ArrayEntriesPart02Test007
     * @tc.desc Verify entries() next().value done true undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart02Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(0);
      let iter = arr.entries();
      let result = iter.next();
      expect(result.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART02__0800
     * @tc.name int16ArrayEntriesPart02Test008
     * @tc.desc Verify entries() next() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart02Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(0);
      let iter = arr.entries();
      iter.next();
      let result = iter.next();
      let actual: boolean = result.done!;
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART02__0900
     * @tc.name int16ArrayEntriesPart02Test009
     * @tc.desc Verify entries next().done false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart02Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(99);
      let iter = arr.entries();
      let result = iter.next();
      let actual: boolean = result.done!;
      expect(actual).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART02__1000
     * @tc.name int16ArrayEntriesPart02Test010
     * @tc.desc Verify entries() over [88] second next() done is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart02Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(88);
      let iter = arr.entries();
      iter.next();
      let result = iter.next();
      let actual: boolean = result.done!;
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART02__1100
     * @tc.name int16ArrayEntriesPart02Test011
     * @tc.desc Verify entries() over [41,52,63] first next() value equals $_get(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart02Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(41, 52, 63);
      let iter = arr.entries();
      let entry = iter.next().value!;
      let actual: number = entry[1];
      let expected: number = arr.$_get(0);
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART02__1200
     * @tc.name int16ArrayEntriesPart02Test012
     * @tc.desc Verify entries() over [17,28,39] second next() index equals 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart02Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(17, 28, 39);
      let iter = arr.entries();
      iter.next();
      let entry = iter.next().value!;
      let actual: number = entry[0];
      let expected: int = 1;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART02__1300
     * @tc.name int16ArrayEntriesPart02Test013
     * @tc.desc Verify entries() over [71,82,93] second next() value equals $_get(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart02Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(71, 82, 93);
      let iter = arr.entries();
      iter.next();
      let entry = iter.next().value!;
      let actual: number = entry[1];
      let expected: number = arr.$_get(1);
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART02__1400
     * @tc.name int16ArrayEntriesPart02Test014
     * @tc.desc Verify entries() over [14,25,36] third next() index equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart02Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(14, 25, 36);
      let iter = arr.entries();
      iter.next();
      iter.next();
      let entry = iter.next().value!;
      let actual: number = entry[0];
      let expected: int = 2;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART02__1500
     * @tc.name int16ArrayEntriesPart02Test015
     * @tc.desc Verify entries() over [64,75,86] third next() value equals $_get(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart02Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(64, 75, 86);
      let iter = arr.entries();
      iter.next();
      iter.next();
      let entry = iter.next().value!;
      let actual: number = entry[1];
      let expected: number = arr.$_get(2);
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART02__1600
     * @tc.name int16ArrayEntriesPart02Test016
     * @tc.desc Verify entries() over [19,28,37] after full iteration next() done is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart02Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(19, 28, 37);
      let iter = arr.entries();
      iter.next();
      iter.next();
      iter.next();
      let result = iter.next();
      let actual: boolean = result.done!;
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART02__1700
     * @tc.name int16ArrayEntriesPart02Test017
     * @tc.desc Verify entries next() length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart02Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(2, 4, 6, 8);
      let iter = arr.entries();
      let count: int = 0;
      let result = iter.next();
      while (!result.done) {
        count++;
        result = iter.next();
      }
      let actual: number = count;
      let expected: number = arr.length;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART02__1800
     * @tc.name int16ArrayEntriesPart02Test018
     * @tc.desc Verify entries() entry index length - 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart02Test018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(9, 18, 27, 36, 45);
      let iter = arr.entries();
      let lastEntry: [int, Number] | undefined = undefined;
      let result = iter.next();
      while (!result.done) {
        lastEntry = result.value;
        result = iter.next();
      }
      let actual: number = lastEntry![0];
      let expected: number = arr.length - 1;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART02__1900
     * @tc.name int16ArrayEntriesPart02Test019
     * @tc.desc Verify entries() over [300,-1,400] second next() value equals -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart02Test019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(300, -1, 400);
      let iter = arr.entries();
      iter.next();
      let entry = iter.next().value!;
      let actual: number = entry[1];
      let expected: int = -1;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART02__2000
     * @tc.name int16ArrayEntriesPart02Test020
     * @tc.desc Verify new Int16Array(length) entries entry 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart02Test020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(3);
      let iter = arr.entries();
      let entry = iter.next().value!;
      let actual: number = entry[1];
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART02__2100
     * @tc.name int16ArrayEntriesPart02Test021
     * @tc.desc Verify Int16Array.from entries entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart02Test021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.from([44, 55]);
      let iter = arr.entries();
      let entry = iter.next().value!;
      let actual: number = entry[1];
      let expected: int = 44;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART02__2200
     * @tc.name int16ArrayEntriesPart02Test022
     * @tc.desc Verify new Int16Array(src) entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart02Test022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = Int16Array.of(66, 77);
      let arr: Int16Array = new Int16Array(src);
      let iter = arr.entries();
      let entry = iter.next().value!;
      let actual: number = entry[1];
      let expected: int = 66;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART02__2300
     * @tc.name int16ArrayEntriesPart02Test023
     * @tc.desc Verify fill MAX entries value MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart02Test023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(2);
      let val:short = 32767
      arr.fill(val);
      let iter = arr.entries();
      let entry = iter.next().value!;
      let actual: number = entry[1];
      let expected: int = 32767;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART02__2400
     * @tc.name int16ArrayEntriesPart02Test024
     * @tc.desc Verify $_set MIN entries value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart02Test024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(2);
      let val:short = -32768
      arr.$_set(0, val);
      let iter = arr.entries();
      let entry = iter.next().value!;
      let actual: number = entry[1];
      let expected: int = -32768;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART02__2500
     * @tc.name int16ArrayEntriesPart02Test025
     * @tc.desc Verify entries() source array length equals 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart02Test025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      let actual: int = arr.length;
      let expected: int = 3;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART02__2600
     * @tc.name int16ArrayEntriesPart02Test026
     * @tc.desc Verify entries() source array byteLength equals 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart02Test026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(5, 10);
      let actual: int = arr.byteLength;
      let expected: int = 4;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART02__2700
     * @tc.name int16ArrayEntriesPart02Test027
     * @tc.desc Verify entries() source array byteOffset equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart02Test027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([7, 14]);
      let actual: int = arr.byteOffset;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART02__2800
     * @tc.name int16ArrayEntriesPart02Test028
     * @tc.desc Verify entries() source array BYTES_PER_ELEMENT equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart02Test028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(3, 6);
      let actual: int = arr.BYTES_PER_ELEMENT;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART02__2900
     * @tc.name int16ArrayEntriesPart02Test029
     * @tc.desc Verify entries() source array name equals Int16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart02Test029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(100);
      let actual: string = arr.name;
      let expected: string = "Int16Array";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART02__3000
     * @tc.name int16ArrayEntriesPart02Test030
     * @tc.desc Verify entries() source array length equals 3 over [20,40,60]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart02Test030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(20, 40, 60);
      let actual: int = arr.length;
      let expected: int = 3;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART02__3100
     * @tc.name int16ArrayEntriesPart02Test031
     * @tc.desc Verify entries() related byteLength length BYTES_PER_ELEMENT(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart02Test031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(8, 16, 24, 32);
      let actual: int = arr.byteLength;
      let expected: number = arr.length * 2;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART02__3200
     * @tc.name int16ArrayEntriesPart02Test032
     * @tc.desc Verify entries() Buffer byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart02Test032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(50, 100);
      let actual: int = arr.byteOffset;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART02__3300
     * @tc.name int16ArrayEntriesPart02Test033
     * @tc.desc Verify entries() BYTES_PER_ELEMENT 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart02Test033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(9, 18);
      let actual: int = arr.BYTES_PER_ELEMENT;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART02__3400
     * @tc.name int16ArrayEntriesPart02Test034
     * @tc.desc Verify entries() source array name equals Int16Array over [1,2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart02Test034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2);
      let actual: string = arr.name;
      let expected: string = "Int16Array";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART02__3500
     * @tc.name int16ArrayEntriesPart02Test035
     * @tc.desc Verify entries() source array buffer byteLength equals 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart02Test035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(25, 50);
      let buf = arr.buffer;
      let actual: number = buf.byteLength;
      let expected: int = 4;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART02__3600
     * @tc.name int16ArrayEntriesPart02Test036
     * @tc.desc Verify source array after entries() .buffer.byteLength .byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart02Test036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(11, 22, 33);
      let bufByteLen: number = arr.buffer.byteLength;
      let viewByteLen: number = arr.byteLength;
      let actual: boolean = bufByteLen >= viewByteLen;
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART02__3700
     * @tc.name int16ArrayEntriesPart02Test037
     * @tc.desc Verify entries() related buffer.byteLength >= 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart02Test037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(60, 70, 80);
      let actual: boolean = arr.buffer.byteLength >= 6;
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART02__3800
     * @tc.name int16ArrayEntriesPart02Test038
     * @tc.desc Verify entries() source array length equals 1 over [42]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart02Test038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(42);
      let actual: int = arr.length;
      let expected: int = 1;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART02__3900
     * @tc.name int16ArrayEntriesPart02Test039
     * @tc.desc Verify entries() source array byteLength equals 2 over [77]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart02Test039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(77);
      let actual: int = arr.byteLength;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART02__4000
     * @tc.name int16ArrayEntriesPart02Test040
     * @tc.desc Verify entries() source array length equals 5 over [1,2,3,4,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart02Test040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      let actual: int = arr.length;
      let expected: int = 5;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART02__4100
     * @tc.name int16ArrayEntriesPart02Test041
     * @tc.desc Verify entries() source array byteLength equals 10 over [10,20,30,40,50]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart02Test041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let actual: int = arr.byteLength;
      let expected: int = 10;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART02__4200
     * @tc.name int16ArrayEntriesPart02Test042
     * @tc.desc Verify entries() does not change array length over [3,6,9]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart02Test042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(3, 6, 9);
      let lenBefore: number = arr.length;
      arr.entries();
      let actual: int = arr.length;
      let expected: number = lenBefore;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART02__4300
     * @tc.name int16ArrayEntriesPart02Test043
     * @tc.desc Verify entries() full iteration preserves array length over [4,8,12]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart02Test043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(4, 8, 12);
      let lenBefore: number = arr.length;
      let iter = arr.entries();
      while (!iter.next().done) {}
      let actual: int = arr.length;
      let expected: number = lenBefore;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART02__4400
     * @tc.name int16ArrayEntriesPart02Test044
     * @tc.desc Verify entries() byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart02Test044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(5, 10, 15);
      let blBefore: number = arr.byteLength;
      arr.entries();
      let actual: int = arr.byteLength;
      let expected: number = blBefore;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART02__4500
     * @tc.name int16ArrayEntriesPart02Test045
     * @tc.desc Verify entries byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart02Test045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(2, 4, 6, 8);
      let blBefore: number = arr.byteLength;
      let iter = arr.entries();
      while (!iter.next().done) {}
      let actual: int = arr.byteLength;
      let expected: number = blBefore;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART02__4600
     * @tc.name int16ArrayEntriesPart02Test046
     * @tc.desc Verify entries() byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart02Test046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(7, 14);
      let boBefore: number = arr.byteOffset;
      arr.entries();
      let actual: int = arr.byteOffset;
      let expected: number = boBefore;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART02__4700
     * @tc.name int16ArrayEntriesPart02Test047
     * @tc.desc Verify entries() BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart02Test047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 3, 5);
      let bpeBefore: number = arr.BYTES_PER_ELEMENT;
      arr.entries();
      let actual: int = arr.BYTES_PER_ELEMENT;
      let expected: number = bpeBefore;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART02__4800
     * @tc.name int16ArrayEntriesPart02Test048
     * @tc.desc Verify entries() preserves array name over [12,34]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart02Test048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(12, 34);
      let nameBefore: string = arr.name;
      arr.entries();
      let actual: string = arr.name;
      let expected: string = nameBefore;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART02__4900
     * @tc.name int16ArrayEntriesPart02Test049
     * @tc.desc Verify entries() full iteration preserves $_get(0) over [23,45,67]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart02Test049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(23, 45, 67);
      let valBefore: number = arr.$_get(0);
      let iter = arr.entries();
      while (!iter.next().done) {}
      let actual: number = arr.$_get(0);
      let expected: number = valBefore;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART02__5000
     * @tc.name int16ArrayEntriesPart02Test050
     * @tc.desc Verify entries $_get(length-1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart02Test050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(31, 62, 93);
      let idx: int = arr.length - 1;
      let valBefore: number = arr.$_get(idx);
      let iter = arr.entries();
      while (!iter.next().done) {}
      let actual: number = arr.$_get(idx);
      let expected: number = valBefore;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART02__5100
     * @tc.name int16ArrayEntriesPart02Test051
     * @tc.desc Verify entries() partial iteration preserves $_get(2) over [10,20,30,40,50]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart02Test051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let valBefore: number = arr.$_get(2);
      let iter = arr.entries();
      iter.next();
      iter.next();
      let actual: number = arr.$_get(2);
      let expected: number = valBefore;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART02__5200
     * @tc.name int16ArrayEntriesPart02Test052
     * @tc.desc Verify entries() full iteration preserves $_get(0) with MAX value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart02Test052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val:short = 32767
      let arr: Int16Array = Int16Array.of(val, 100, 200);
      let valBefore: number = arr.$_get(0);
      let iter = arr.entries();
      while (!iter.next().done) {}
      let actual: number = arr.$_get(0);
      let expected: number = valBefore;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART02__5300
     * @tc.name int16ArrayEntriesPart02Test053
     * @tc.desc Verify entries() full iteration preserves $_get(1) with MIN value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart02Test053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val:short = -32768
      let arr: Int16Array = Int16Array.of(50, val, 70);
      let valBefore: number = arr.$_get(1);
      let iter = arr.entries();
      while (!iter.next().done) {}
      let actual: number = arr.$_get(1);
      let expected: number = valBefore;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART02__5400
     * @tc.name int16ArrayEntriesPart02Test054
     * @tc.desc Verify entries() preserves array buffer over [13,26]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart02Test054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(13, 26);
      let bufBefore: ArrayBuffer = arr.buffer;
      arr.entries();
      let actual: ArrayBuffer = arr.buffer;
      let expected: ArrayBuffer = bufBefore;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART02__5500
     * @tc.name int16ArrayEntriesPart02Test055
     * @tc.desc Verify entries buffer.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart02Test055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(8, 16);
      let blBefore: number = arr.buffer.byteLength;
      let iter = arr.entries();
      while (!iter.next().done) {}
      let actual: int = arr.buffer.byteLength;
      let expected: number = blBefore;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART02__5600
     * @tc.name int16ArrayEntriesPart02Test056
     * @tc.desc Verify entries() second iterator first next() index equals 0 over [1,3,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart02Test056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 3, 5);
      let iterA = arr.entries();
      let iterB = arr.entries();
      iterA.next();
      let entryB = iterB.next().value!;
      let actual: number = entryB[0];
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART02__5700
     * @tc.name int16ArrayEntriesPart02Test057
     * @tc.desc Verify entries() restart iterator first next() yields [0,9] over [9,18,27]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart02Test057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(9, 18, 27);
      let iterA = arr.entries();
      while (!iterA.next().done) {}
      let iterB = arr.entries();
      let firstEntryB = iterB.next().value!;
      let actual: number = firstEntryB[0];
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: number = firstEntryB[1];
      let expected2: int = 9;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART02__5800
     * @tc.name int16ArrayEntriesPart02Test058
     * @tc.desc Verify entries() second iterator first next() yields [0,12] over [12,24,36,48]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart02Test058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(12, 24, 36, 48);
      let iterA = arr.entries();
      iterA.next();
      iterA.next();
      let iterB = arr.entries();
      let firstEntryB = iterB.next().value!;
      let actual: number = firstEntryB[0];
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: number = firstEntryB[1];
      let expected2: int = 12;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART02__5900
     * @tc.name int16ArrayEntriesPart02Test059
     * @tc.desc Verify entries() two iterators first next() yield same [0,2] over [2,4,6]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart02Test059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(2, 4, 6);
      let iterA = arr.entries();
      let iterB = arr.entries();
      let aResult = iterA.next();
      let bResult = iterB.next();
      let actual: number = aResult.value![0];
      let expected: number = bResult.value![0];
      expect(actual).assertEqual(expected);
      let actual2: number = aResult.value![1];
      let expected2: number = bResult.value![1];
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART02__6000
     * @tc.name int16ArrayEntriesPart02Test060
     * @tc.desc Verify for...of entries() count equals array length 4 over [5,15,25,35]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart02Test060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(5, 15, 25, 35);
      let count: int = 0;
      for (let entry of arr.entries()) {
        count++;
      }
      let actual: number = count;
      let expected: number = arr.length;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART02__6100
     * @tc.name int16ArrayEntriesPart02Test061
     * @tc.desc Verify for...of entries() over [10,20,30] yields indices 0,1,2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart02Test061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let indexSeq: int[] = [];
      for (let entry of arr.entries()) {
        indexSeq.push(entry[0]);
      }
      let actual: number = indexSeq[0];
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: number = indexSeq[1];
      let expected2: int = 1;
      expect(actual2).assertEqual(expected2);
      let actual3: number = indexSeq[2];
      let expected3: int = 2;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART02__6200
     * @tc.name int16ArrayEntriesPart02Test062
     * @tc.desc Verify for...of entries() first value equals manual next() value 17 over [17,34,51]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart02Test062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(17, 34, 51);
      let manualIter = arr.entries();
      let manualRes = manualIter.next();
      let manualVal: Number = manualRes.value![1];
      let forOfVal: Number | undefined = undefined;
      for (let entry of arr.entries()) {
        forOfVal = entry[1];
        break;
      }
      let actual: Number | undefined = forOfVal;
      let expected: Number = manualVal;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART02__6300
     * @tc.name int16ArrayEntriesPart02Test063
     * @tc.desc Verify for...of entries() on empty array does not iterate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart02Test063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(0);
      let executed: boolean = false;
      for (let entry of arr.entries()) {
        executed = true;
      }
      expect(executed).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART02__6400
     * @tc.name int16ArrayEntriesPart02Test064
     * @tc.desc Verify for...of entries entry[0] 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart02Test064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(123);
      let entryIdx: int = -1;
      for (let entry of arr.entries()) {
        entryIdx = entry[0];
      }
      let actual: number = entryIdx;
      let expected: number = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART02__6500
     * @tc.name int16ArrayEntriesPart02Test065
     * @tc.desc Verify fill entries value fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart02Test065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(3);
      arr.fill(99);
      let iter = arr.entries();
      let entry = iter.next().value!;
      let actual: number = entry[1];
      let expected: int = 99;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART02__6600
     * @tc.name int16ArrayEntriesPart02Test066
     * @tc.desc Verify entries() after reverse() first next() yields value 300
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart02Test066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(100, 200, 300);
      arr.reverse();
      let iter = arr.entries();
      let entry = iter.next().value!;
      let actual: number = entry[1];
      let expected: int = 300;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART02__6700
     * @tc.name int16ArrayEntriesPart02Test067
     * @tc.desc Verify entries() after sort() first next() yields value 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart02Test067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(50, 10, 30);
      arr.sort();
      let iter = arr.entries();
      let entry = iter.next().value!;
      let actual: number = entry[1];
      let expected: int = 10;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART02__6800
     * @tc.name int16ArrayEntriesPart02Test068
     * @tc.desc Verify subarray entries index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart02Test068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40);
      let sub: Int16Array = arr.subarray(1, 3);
      let iter = sub.entries();
      let entry = iter.next().value!;
      let actual: number = entry[0];
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART02__6900
     * @tc.name int16ArrayEntriesPart02Test069
     * @tc.desc Verify subarray entries count subarray.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart02Test069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      let sub: Int16Array = arr.subarray(2, 5);
      let count: int = 0;
      let iter = sub.entries();
      let result = iter.next();
      while (!result.done) {
        count++;
        result = iter.next();
      }
      let actual: number = count;
      let expected: number = sub.length;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART02__7000
     * @tc.name int16ArrayEntriesPart02Test070
     * @tc.desc Verify subarray entries value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart02Test070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(7, 14, 21, 28);
      let sub: Int16Array = arr.subarray(1, 4);
      let iter = sub.entries();
      let entry = iter.next().value!;
      let actual: number = entry[1];
      let expected: number = sub.$_get(0);
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART02__7100
     * @tc.name int16ArrayEntriesPart02Test071
     * @tc.desc Verify entries() subarray source.buffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart02Test071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(33, 66, 99);
      let sub: Int16Array = arr.subarray(0, 2);
      let actual: ArrayBuffer = sub.buffer;
      let expected: ArrayBuffer = arr.buffer;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART02__7200
     * @tc.name int16ArrayEntriesPart02Test072
     * @tc.desc Verify ArrayBuffer entries index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart02Test072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let view: Int16Array = new Int16Array(buf, 0, 3);
      let iter = view.entries();
      let entry = iter.next().value!;
      let actual: number = entry[0];
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART02__7300
     * @tc.name int16ArrayEntriesPart02Test073
     * @tc.desc Verify ArrayBuffer byteOffset entries index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart02Test073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let view: Int16Array = new Int16Array(buf, 4, 2);
      let iter = view.entries();
      let entry = iter.next().value!;
      let actual: number = entry[0];
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART02__7400
     * @tc.name int16ArrayEntriesPart02Test074
     * @tc.desc Verify entries() ArrayBuffer byteOffset source.byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart02Test074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let view: Int16Array = new Int16Array(buf, 4, 2);
      let actual: int = view.byteOffset;
      let expected: int = 4;
      expect(actual).assertEqual(expected);
    });

  });
}
