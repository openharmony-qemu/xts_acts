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

export default function int16ArrayEntriesPart03Test(): void {
  describe("Int16ArrayEntriesPart03Test", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__0100
     * @tc.name int16ArrayEntriesPart03Test001
     * @tc.desc Verify Int16Array of(1,2,3) entries() first next index 0 value 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let r: IteratorResult<[int, Number]> = iter.next();
      let actual: boolean = r.done;
      expect(actual).assertFalse();
      let _i: int;
      let _v: Number;
      [_i, _v] = r.value!;
      let actualIdx: number = _i;
      let expectedIdx: int = 0;
      expect(actualIdx).assertEqual(expectedIdx);
      let actualVal: number = _v;
      let expectedVal: int = 1;
      expect(actualVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__0200
     * @tc.name int16ArrayEntriesPart03Test002
     * @tc.desc Verify Int16Array entries() next().done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array();
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let result: IteratorResult<[int, Number]> = iter.next();
      let actual: boolean = result.done;
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__0300
     * @tc.name int16ArrayEntriesPart03Test003
     * @tc.desc Verify Int16Array entries() next().value undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array();
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let result: IteratorResult<[int, Number]> = iter.next();
      expect(result.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__0400
     * @tc.name int16ArrayEntriesPart03Test004
     * @tc.desc Verify new Int16Array() entries iteration count 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array();
      let count: number = 0;
      for (let entry of arr.entries()) {
        count = count + 1;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__0500
     * @tc.name int16ArrayEntriesPart03Test005
     * @tc.desc Verify new Int16Array() two entries iterators next done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array();
      let iter1: IterableIterator<[int, Number]> = arr.entries();
      let iter2: IterableIterator<[int, Number]> = arr.entries();
      let r1: IteratorResult<[int, Number]> = iter1.next();
      let r2: IteratorResult<[int, Number]> = iter2.next();
      let actual: boolean = r1.done;
      expect(actual).assertTrue();
      let actual2: boolean = r2.done;
      expect(actual2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__0600
     * @tc.name int16ArrayEntriesPart03Test006
     * @tc.desc Verify new Int16Array() entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array();
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let actual: boolean = iter.next().done;
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__0700
     * @tc.name int16ArrayEntriesPart03Test007
     * @tc.desc Verify new Int16Array((0).toInt()) entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array((0).toInt());
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let actual: boolean = iter.next().done;
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__0800
     * @tc.name int16ArrayEntriesPart03Test008
     * @tc.desc Verify Int16Array.of() entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of();
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let actual: boolean = iter.next().done;
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__0900
     * @tc.name int16ArrayEntriesPart03Test009
     * @tc.desc Verify Int16Array.from Array entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let empty: Number[] = [];
      let arr: Int16Array = Int16Array.from(empty);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let actual: boolean = iter.next().done;
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__1000
     * @tc.name int16ArrayEntriesPart03Test010
     * @tc.desc Verify ArrayBuffer Int16Array entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(0);
      let arr: Int16Array = new Int16Array(buf);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let actual: boolean = iter.next().done;
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__1100
     * @tc.name int16ArrayEntriesPart03Test011
     * @tc.desc Verify Int16Array of(0) entries() next value [0,0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let result: IteratorResult<[int, Number]> = iter.next();
      let _i: int;
      let _v: Number;
      [_i, _v] = result.value!;
      let actual: number = _i;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: number = _v;
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__1200
     * @tc.name int16ArrayEntriesPart03Test012
     * @tc.desc Verify MAX(32767) entries [0, 32767]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val:short = 32767
      let arr: Int16Array = Int16Array.of(val);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let result: IteratorResult<[int, Number]> = iter.next();
      let _i: int;
      let _v: Number;
      [_i, _v] = result.value!;
      let actual: number = _i;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: number = _v;
      let expected2: int = 32767;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__1300
     * @tc.name int16ArrayEntriesPart03Test013
     * @tc.desc Verify MIN(-32768) entries [0, -32768]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val:short = -32768
      let arr: Int16Array = Int16Array.of(val);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let result: IteratorResult<[int, Number]> = iter.next();
      let _i: int;
      let _v: Number;
      [_i, _v] = result.value!;
      let actual: number = _i;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: number = _v;
      let expected2: int = -32768;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__1400
     * @tc.name int16ArrayEntriesPart03Test014
     * @tc.desc Verify -1 entries [0, -1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(-1);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let result: IteratorResult<[int, Number]> = iter.next();
      let _i: int;
      let _v: Number;
      [_i, _v] = result.value!;
      let actual: number = _i;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: number = _v;
      let expected2: int = -1;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__1500
     * @tc.name int16ArrayEntriesPart03Test015
     * @tc.desc Verify NaN entries [0, 0] NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(Number.NaN);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let result: IteratorResult<[int, Number]> = iter.next();
      let _i: int;
      let _v: Number;
      [_i, _v] = result.value!;
      let actual: number = _v;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__1600
     * @tc.name int16ArrayEntriesPart03Test016
     * @tc.desc Verify Infinity entries [0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(Number.POSITIVE_INFINITY);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let result: IteratorResult<[int, Number]> = iter.next();
      let _i: int;
      let _v: Number;
      [_i, _v] = result.value!;
      let actual: number = _v;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__1700
     * @tc.name int16ArrayEntriesPart03Test017
     * @tc.desc Verify -Infinity entries [0, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(-Number.POSITIVE_INFINITY);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let result: IteratorResult<[int, Number]> = iter.next();
      let _i: int;
      let _v: Number;
      [_i, _v] = result.value!;
      let actual: number = _v;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__1800
     * @tc.name int16ArrayEntriesPart03Test018
     * @tc.desc Verify Int16Array of(42) entries() second next done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(42);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      iter.next();
      let result: IteratorResult<[int, Number]> = iter.next();
      let actual: boolean = result.done;
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__1900
     * @tc.name int16ArrayEntriesPart03Test019
     * @tc.desc Verify Int16Array of(99) entries() first next done false second done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(99);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let first: IteratorResult<[int, Number]> = iter.next();
      let second: IteratorResult<[int, Number]> = iter.next();
      let actual: boolean = first.done;
      expect(actual).assertFalse();
      let actual2: boolean = second.done;
      expect(actual2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__2000
     * @tc.name int16ArrayEntriesPart03Test020
     * @tc.desc Verify Int16Array of(-32768) entries() next value index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val:short = -32768
      let arr: Int16Array = Int16Array.of(val);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let result: IteratorResult<[int, Number]> = iter.next();
      let _i: int;
      let _v: Number;
      [_i, _v] = result.value!;
      let actual: number = _i;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__2100
     * @tc.name int16ArrayEntriesPart03Test021
     * @tc.desc Verify Int16Array of(0,0,0) entries() next indices 0 1 2 values 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0, 0);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let r0: IteratorResult<[int, Number]> = iter.next();
      let r1: IteratorResult<[int, Number]> = iter.next();
      let r2: IteratorResult<[int, Number]> = iter.next();
      let _i0: int;
      let _v0: Number;
      [_i0, _v0] = r0.value!;
      let actual: number = _i0;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: number = _v0;
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
      let _i1: int;
      let _v1: Number;
      [_i1, _v1] = r1.value!;
      let actual3: number = _i1;
      let expected3: int = 1;
      expect(actual3).assertEqual(expected3);
      let actual4: number = _v1;
      let expected4: int = 0;
      expect(actual4).assertEqual(expected4);
      let _i2: int;
      let _v2: Number;
      [_i2, _v2] = r2.value!;
      let actual5: number = _i2;
      let expected5: int = 2;
      expect(actual5).assertEqual(expected5);
      let actual6: number = _v2;
      let expected6: int = 0;
      expect(actual6).assertEqual(expected6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__2200
     * @tc.name int16ArrayEntriesPart03Test022
     * @tc.desc Verify MAX [32767,32767] entries 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val:short = 32767
      let arr: Int16Array = Int16Array.of(val, val);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let r0: IteratorResult<[int, Number]> = iter.next();
      let r1: IteratorResult<[int, Number]> = iter.next();
      let _i0: int;
      let _v0: Number;
      [_i0, _v0] = r0.value!;
      let actual: number = _v0;
      let expected: int = 32767;
      expect(actual).assertEqual(expected);
      let _i1: int;
      let _v1: Number;
      [_i1, _v1] = r1.value!;
      let actual2: number = _v1;
      let expected2: int = 32767;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__2300
     * @tc.name int16ArrayEntriesPart03Test023
     * @tc.desc Verify Int16Array of(-32768,-32768,-32768) entries() next values -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val:short = -32768
      let arr: Int16Array = Int16Array.of(val, val, val);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let r0: IteratorResult<[int, Number]> = iter.next();
      let r1: IteratorResult<[int, Number]> = iter.next();
      let r2: IteratorResult<[int, Number]> = iter.next();
      let _i0: int;
      let _v0: Number;
      [_i0, _v0] = r0.value!;
      let actual: number = _v0;
      let expected: int = -32768;
      expect(actual).assertEqual(expected);
      let _i1: int;
      let _v1: Number;
      [_i1, _v1] = r1.value!;
      let actual2: number = _v1;
      let expected2: int = -32768;
      expect(actual2).assertEqual(expected2);
      let _i2: int;
      let _v2: Number;
      [_i2, _v2] = r2.value!;
      let actual3: number = _v2;
      let expected3: int = -32768;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__2400
     * @tc.name int16ArrayEntriesPart03Test024
     * @tc.desc Verify -1 [-1,-1] entries -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(-1, -1);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let r0: IteratorResult<[int, Number]> = iter.next();
      let r1: IteratorResult<[int, Number]> = iter.next();
      let _i0: int;
      let _v0: Number;
      [_i0, _v0] = r0.value!;
      let actual: number = _v0;
      let expected: int = -1;
      expect(actual).assertEqual(expected);
      let _i1: int;
      let _v1: Number;
      [_i1, _v1] = r1.value!;
      let actual2: number = _v1;
      let expected2: int = -1;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__2500
     * @tc.name int16ArrayEntriesPart03Test025
     * @tc.desc Verify 1 3 entries index 0,1,2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 1, 1);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let _i1: int;
      let _v1: Number;
      [_i1, _v1] = iter.next().value!;
      let actual: number = _i1;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let _i2: int;
      let _v2: Number;
      [_i2, _v2] = iter.next().value!;
      let actual2: number = _i2;
      let expected2: int = 1;
      expect(actual2).assertEqual(expected2);
      let _i3: int;
      let _v3: Number;
      [_i3, _v3] = iter.next().value!;
      let actual3: number = _i3;
      let expected3: int = 2;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__2600
     * @tc.name int16ArrayEntriesPart03Test026
     * @tc.desc Verify Int16Array of(0,0,0,0,0) entries() iteration count 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0, 0, 0, 0);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let count: number = 0;
      let result: IteratorResult<[int, Number]> = iter.next();
      while (!result.done) {
        count = count + 1;
        result = iter.next();
      }
      expect(count).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__2700
     * @tc.name int16ArrayEntriesPart03Test027
     * @tc.desc Verify Int16Array of(32767,32767,32767,32767) entries() next indices 0 1 2 value 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val:short = 32767
      let arr: Int16Array = Int16Array.of(val, val, val, val);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let r: IteratorResult<[int, Number]> = iter.next();
      let _i1: int;
      let _v1: Number;
      [_i1, _v1] = r.value!;
      let actual: number = _i1;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: number = _v1;
      let expected2: int = 32767;
      expect(actual2).assertEqual(expected2);
      r = iter.next();
      let _i2: int;
      let _v2: Number;
      [_i2, _v2] = r.value!;
      let actual3: number = _i2;
      let expected3: int = 1;
      expect(actual3).assertEqual(expected3);
      r = iter.next();
      let _i3: int;
      let _v3: Number;
      [_i3, _v3] = r.value!;
      let actual4: number = _i3;
      let expected4: int = 2;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__2800
     * @tc.name int16ArrayEntriesPart03Test028
     * @tc.desc Verify Int16Array of(NaN,NaN) entries() next values 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(Number.NaN, Number.NaN);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let r0: IteratorResult<[int, Number]> = iter.next();
      let r1: IteratorResult<[int, Number]> = iter.next();
      let _i0: int;
      let _v0: Number;
      [_i0, _v0] = r0.value!;
      let actual: number = _v0;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let _i1: int;
      let _v1: Number;
      [_i1, _v1] = r1.value!;
      let actual2: number = _v1;
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__2900
     * @tc.name int16ArrayEntriesPart03Test029
     * @tc.desc Verify Infinity entries 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(Number.POSITIVE_INFINITY, Number.POSITIVE_INFINITY);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let r0: IteratorResult<[int, Number]> = iter.next();
      let _i: int;
      let _v: Number;
      [_i, _v] = r0.value!;
      let actual: number = _v;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__3000
     * @tc.name int16ArrayEntriesPart03Test030
     * @tc.desc Verify NaN/Infinity/-Infinity entries 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(Number.NaN, Number.POSITIVE_INFINITY, -Number.POSITIVE_INFINITY);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let _i1: int;
      let _v1: Number;
      [_i1, _v1] = iter.next().value!;
      let actual: number = _v1;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let _i2: int;
      let _v2: Number;
      [_i2, _v2] = iter.next().value!;
      let actual2: number = _v2;
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
      let _i3: int;
      let _v3: Number;
      [_i3, _v3] = iter.next().value!;
      let actual3: number = _v3;
      let expected3: int = 0;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__3100
     * @tc.name int16ArrayEntriesPart03Test031
     * @tc.desc Verify Int16Array of(3.7) entries() next value 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(3.7);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let _i: int;
      let _v: Number;
      [_i, _v] = iter.next().value!;
      let actual: number = _v;
      let expected: int = 3;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__3200
     * @tc.name int16ArrayEntriesPart03Test032
     * @tc.desc Verify Int16Array of(-3.7) entries() next value -3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(-3.7);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let _i: int;
      let _v: Number;
      [_i, _v] = iter.next().value!;
      let actual: number = _v;
      let expected: int = -3;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__3300
     * @tc.name int16ArrayEntriesPart03Test033
     * @tc.desc Verify 32768 entries -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(32768);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let _i: int;
      let _v: Number;
      [_i, _v] = iter.next().value!;
      let actual: number = _v;
      let expected: int = -32768;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__3400
     * @tc.name int16ArrayEntriesPart03Test034
     * @tc.desc Verify -32769 entries 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(-32769);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let _i: int;
      let _v: Number;
      [_i, _v] = iter.next().value!;
      let actual: number = _v;
      let expected: int = 32767;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__3500
     * @tc.name int16ArrayEntriesPart03Test035
     * @tc.desc Verify [MIN,MAX,0,-1] entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let valMin:short = -32768
      let valMax:short = 32767
      let arr: Int16Array = Int16Array.of(valMin, valMax, 0, -1);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let _i1: int;
      let _v1: Number;
      [_i1, _v1] = iter.next().value!;
      let actual: number = _v1;
      let expected: int = -32768;
      expect(actual).assertEqual(expected);
      let _i2: int;
      let _v2: Number;
      [_i2, _v2] = iter.next().value!;
      let actual2: number = _v2;
      let expected2: int = 32767;
      expect(actual2).assertEqual(expected2);
      let _i3: int;
      let _v3: Number;
      [_i3, _v3] = iter.next().value!;
      let actual3: number = _v3;
      let expected3: int = 0;
      expect(actual3).assertEqual(expected3);
      let _i4: int;
      let _v4: Number;
      [_i4, _v4] = iter.next().value!;
      let actual4: number = _v4;
      let expected4: int = -1;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__3600
     * @tc.name int16ArrayEntriesPart03Test036
     * @tc.desc Verify entries() next().value undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      iter.next();
      let result: IteratorResult<[int, Number]> = iter.next();
      expect(result.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__3700
     * @tc.name int16ArrayEntriesPart03Test037
     * @tc.desc Verify Int16Array of(1,2) entries() after two next for-of count 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      iter.next();
      iter.next();
      let count: number = 0;
      for (let entry of iter) {
        count = count + 1;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__3800
     * @tc.name int16ArrayEntriesPart03Test038
     * @tc.desc Verify Int16Array of(10,20,30) entries() fourth and fifth next done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      iter.next();
      iter.next();
      iter.next();
      let actual: boolean = iter.next().done;
      expect(actual).assertTrue();
      let actual2: boolean = iter.next().done;
      expect(actual2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__3900
     * @tc.name int16ArrayEntriesPart03Test039
     * @tc.desc Verify Int16Array of(8) entries() $_iterator after next yields done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(8);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      iter.next();
      let sameIter: IterableIterator<[int, Number]> = iter.$_iterator();
      let actual: boolean = sameIter.next().done;
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__4000
     * @tc.name int16ArrayEntriesPart03Test040
     * @tc.desc Verify Int16Array of(1) entries() next value index 0 value 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let r: IteratorResult<[int, Number]> = iter.next();
      let _i: int;
      let _v: Number;
      [_i, _v] = r.value!;
      let actualIdx: number = _i;
      let expectedIdx: int = 0;
      expect(actualIdx).assertEqual(expectedIdx);
      let actualVal: number = _v;
      let expectedVal: int = 1;
      expect(actualVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__4100
     * @tc.name int16ArrayEntriesPart03Test041
     * @tc.desc Verify Int16Array of(2) entries() next done false value index 0 value 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(2);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let result: IteratorResult<[int, Number]> = iter.next();
      let actualDone: boolean = result.done;
      expect(actualDone).assertFalse();
      let _i: int;
      let _v: Number;
      [_i, _v] = result.value!;
      let actualIdx: number = _i;
      let expectedIdx: int = 0;
      expect(actualIdx).assertEqual(expectedIdx);
      let actualVal: number = _v;
      let expectedVal: int = 2;
      expect(actualVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__4200
     * @tc.name int16ArrayEntriesPart03Test042
     * @tc.desc Verify Int16Array of(3,4) entries() first next done false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(3, 4);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let result: IteratorResult<[int, Number]> = iter.next();
      let actual: boolean = result.done;
      expect(actual).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__4300
     * @tc.name int16ArrayEntriesPart03Test043
     * @tc.desc Verify Int16Array of(6) entries() next done false value index 0 value 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(6);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let result: IteratorResult<[int, Number]> = iter.next();
      let actualDone: boolean = result.done;
      expect(actualDone).assertFalse();
      let _i: int;
      let _v: Number;
      [_i, _v] = result.value!;
      let actualIdx: number = _i;
      let expectedIdx: int = 0;
      expect(actualIdx).assertEqual(expectedIdx);
      let actualVal: number = _v;
      let expectedVal: int = 6;
      expect(actualVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__4400
     * @tc.name int16ArrayEntriesPart03Test044
     * @tc.desc Verify Int16Array of(9) entries() next value tuple index 0 value 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(9);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let result: IteratorResult<[int, Number]> = iter.next();
      let tup: [int, Number] = result.value!;
      let _i: int;
      let _v: Number;
      [_i, _v] = tup;
      let actualIdx: number = _i;
      let expectedIdx: int = 0;
      expect(actualIdx).assertEqual(expectedIdx);
      let actualVal: number = _v;
      let expectedVal: int = 9;
      expect(actualVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__4500
     * @tc.name int16ArrayEntriesPart03Test045
     * @tc.desc Verify Int16Array of(11) entries() next value index 0 value 11
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(11);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let result: IteratorResult<[int, Number]> = iter.next();
      let _i: int;
      let _v: Number;
      [_i, _v] = result.value!;
      let actualIdx: number = _i;
      let expectedIdx: int = 0;
      expect(actualIdx).assertEqual(expectedIdx);
      let actualVal: number = _v;
      let expectedVal: int = 11;
      expect(actualVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__4600
     * @tc.name int16ArrayEntriesPart03Test046
     * @tc.desc Verify Int16Array of(13) entries() next done false value index 0 value 13
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(13);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let result: IteratorResult<[int, Number]> = iter.next();
      let actualDone: boolean = result.done;
      expect(actualDone).assertFalse();
      let _i: int;
      let _v: Number;
      [_i, _v] = result.value!;
      let actualIdx: number = _i;
      let expectedIdx: int = 0;
      expect(actualIdx).assertEqual(expectedIdx);
      let actualVal: number = _v;
      let expectedVal: int = 13;
      expect(actualVal).assertEqual(expectedVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__4700
     * @tc.name int16ArrayEntriesPart03Test047
     * @tc.desc Verify Int16Array of(1,2) entries() $_iterator shares state indices 0 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let self: IterableIterator<[int, Number]> = iter.$_iterator();
      let r1: IteratorResult<[int, Number]> = iter.next();
      let r2: IteratorResult<[int, Number]> = self.next();
      let _i1: int;
      let _v1: Number;
      [_i1, _v1] = r1.value!;
      let actual: number = _i1;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let _i2: int;
      let _v2: Number;
      [_i2, _v2] = r2.value!;
      let actual2: number = _i2;
      let expected2: int = 1;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__4800
     * @tc.name int16ArrayEntriesPart03Test048
     * @tc.desc Verify Int16Array of(5) entries() two $_iterator calls next done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(5);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let s1: IterableIterator<[int, Number]> = iter.$_iterator();
      let s2: IterableIterator<[int, Number]> = iter.$_iterator();
      s1.next();
      let r: IteratorResult<[int, Number]> = s2.next();
      let actual: boolean = r.done;
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__4900
     * @tc.name int16ArrayEntriesPart03Test049
     * @tc.desc Verify Int16Array of(7,8) two entries iterators independent index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(7, 8);
      let iter1: IterableIterator<[int, Number]> = arr.entries();
      let iter2: IterableIterator<[int, Number]> = arr.entries();
      iter1.next();
      let r: IteratorResult<[int, Number]> = iter2.next();
      let _i: int;
      let _v: Number;
      [_i, _v] = r.value!;
      let actual: number = _i;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__5000
     * @tc.name int16ArrayEntriesPart03Test050
     * @tc.desc Verify Int16Array of(3) entries() for-of iteration count 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(3);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let count: number = 0;
      for (let entry of iter) {
        count = count + 1;
      }
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__5100
     * @tc.name int16ArrayEntriesPart03Test051
     * @tc.desc Verify Int16Array of(1,2,3) entries() for-of throw Error name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      try {
        for (let entry of arr.entries()) {
          throw new Error("consumer throw");
        }
        expect().assertFail();
      } catch (e) {
        let actualError: string = e.name;
        let expectedError: string = "Error";
        expect(actualError).assertEqual(expectedError);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__5200
     * @tc.name int16ArrayEntriesPart03Test052
     * @tc.desc Verify Int16Array of(100,200,300) entries throw then $_get 100 200 300
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(100, 200, 300);
      try {
        for (let entry of arr.entries()) {
          throw new Error("mid-iteration throw");
        }
      } catch (e) {
        let actualError: string = e.name;
        let expectedError: string = "Error";
        expect(actualError).assertEqual(expectedError);
      }
      let actual: number = arr.$_get(0);
      let expected: int = 100;
      expect(actual).assertEqual(expected);
      let actual2: number = arr.$_get(1);
      let expected2: int = 200;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(2);
      let expected3: int = 300;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__5300
     * @tc.name int16ArrayEntriesPart03Test053
     * @tc.desc Verify Int16Array of(4,5,6) entries throw then new entries index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(4, 5, 6);
      try {
        for (let entry of arr.entries()) {
          throw new Error("abort");
        }
      } catch (e) {
        let actualError: string = e.name;
        let expectedError: string = "Error";
        expect(actualError).assertEqual(expectedError);
      }
      let newIter: IterableIterator<[int, Number]> = arr.entries();
      let _i: int;
      let _v: Number;
      [_i, _v] = newIter.next().value!;
      let actual: number = _i;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__5400
     * @tc.name int16ArrayEntriesPart03Test054
     * @tc.desc Verify Int16Array of(10,20,30,40) entries throw then next index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      iter.next();
      try {
        throw new Error("simulated error");
      } catch (e) {
        let actualError: string = e.name;
        let expectedError: string = "Error";
        expect(actualError).assertEqual(expectedError);
      }
      let r: IteratorResult<[int, Number]> = iter.next();
      let _i: int;
      let _v: Number;
      [_i, _v] = r.value!;
      let actual: number = _i;
      let expected: int = 1;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__5500
     * @tc.name int16ArrayEntriesPart03Test055
     * @tc.desc Verify Int16Array of(1,2,3) entries() does not change length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      let lenBefore: number = arr.length;
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let actual: int = arr.length;
      let expected: number = lenBefore;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__5600
     * @tc.name int16ArrayEntriesPart03Test056
     * @tc.desc Verify Int16Array of(7,14,21) entries() drain then $_get 7 14 21
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(7, 14, 21);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      while (!iter.next().done) {
      }
      let actual: number = arr.$_get(0);
      let expected: int = 7;
      expect(actual).assertEqual(expected);
      let actual2: number = arr.$_get(1);
      let expected2: int = 14;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(2);
      let expected3: int = 21;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__5700
     * @tc.name int16ArrayEntriesPart03Test057
     * @tc.desc Verify Int16Array of(1,2,3) entries() next value 1 after $_set 1 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let r0: IteratorResult<[int, Number]> = iter.next();
      arr.$_set(1, 99);
      let _i: int;
      let _v: Number;
      [_i, _v] = r0.value!;
      let actual: number = _v;
      let expected: int = 1;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__5800
     * @tc.name int16ArrayEntriesPart03Test058
     * @tc.desc Verify Int16Array of(5,10,15) entries() second next value 999 after $_set 1 999
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(5, 10, 15);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      iter.next();
      arr.$_set(1, 999);
      let r: IteratorResult<[int, Number]> = iter.next();
      let _i: int;
      let _v: Number;
      [_i, _v] = r.value!;
      let actual: number = _v;
      let expected: int = 999;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__5900
     * @tc.name int16ArrayEntriesPart03Test059
     * @tc.desc Verify Int16Array of(2,4,6) entries() next index 0 value 888 after $_set 0 888
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(2, 4, 6);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      arr.$_set(0, 888);
      let r: IteratorResult<[int, Number]> = iter.next();
      let _i: int;
      let _v: Number;
      [_i, _v] = r.value!;
      let actual: number = _i;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: number = _v;
      let expected2: int = 888;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__6000
     * @tc.name int16ArrayEntriesPart03Test060
     * @tc.desc Verify ArrayBuffer entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view: DataView = new DataView(buf);
      view.setInt16(0, 100, true);
      view.setInt16(2, 200, true);
      let arr: Int16Array = new Int16Array(buf);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let _i1: int;
      let _v1: Number;
      [_i1, _v1] = iter.next().value!;
      let actual: number = _v1;
      let expected: int = 100;
      expect(actual).assertEqual(expected);
      let _i2: int;
      let _v2: Number;
      [_i2, _v2] = iter.next().value!;
      let actual2: number = _v2;
      let expected2: int = 200;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__6100
     * @tc.name int16ArrayEntriesPart03Test061
     * @tc.desc Verify ArrayBuffer byteOffset entries() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let full: Int16Array = new Int16Array(buf);
      full.$_set(2, 55);
      let view: Int16Array = new Int16Array(buf, (4).toInt());
      let iter: IterableIterator<[int, Number]> = view.entries();
      let r: IteratorResult<[int, Number]> = iter.next();
      let _i: int;
      let _v: Number;
      [_i, _v] = r.value!;
      let actual: number = _i;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: number = _v;
      let expected2: int = 55;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__6200
     * @tc.name int16ArrayEntriesPart03Test062
     * @tc.desc Verify ArrayBuffer entries() length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let full: Int16Array = new Int16Array(buf);
      full.$_set(0, 1);
      full.$_set(1, 2);
      full.$_set(2, 3);
      full.$_set(3, 4);
      full.$_set(4, 5);
      full.$_set(5, 6);
      let view: Int16Array = new Int16Array(buf, (4).toInt(), (2).toInt());
      let iter: IterableIterator<[int, Number]> = view.entries();
      let count: number = 0;
      let result: IteratorResult<[int, Number]> = iter.next();
      while (!result.done) {
        count = count + 1;
        result = iter.next();
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__6300
     * @tc.name int16ArrayEntriesPart03Test063
     * @tc.desc Verify ArrayBuffer entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let a1: Int16Array = new Int16Array(buf, (0).toInt(), (2).toInt());
      let a2: Int16Array = new Int16Array(buf, (4).toInt(), (2).toInt());
      a1.$_set(0, 10);
      a2.$_set(0, 20);
      let iter1: IterableIterator<[int, Number]> = a1.entries();
      let iter2: IterableIterator<[int, Number]> = a2.entries();
      let _i1: int;
      let _v1: Number;
      [_i1, _v1] = iter1.next().value!;
      let actual: number = _v1;
      let expected: int = 10;
      expect(actual).assertEqual(expected);
      let _i2: int;
      let _v2: Number;
      [_i2, _v2] = iter2.next().value!;
      let actual2: number = _v2;
      let expected2: int = 20;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__6400
     * @tc.name int16ArrayEntriesPart03Test064
     * @tc.desc Verify Int16Array of(42) entries() next done false value index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(42);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let r: IteratorResult<[int, Number]> = iter.next();
      let actualDone: boolean = r.done;
      expect(actualDone).assertFalse();
      let _i: int;
      let _v: Number;
      [_i, _v] = r.value!;
      let actualIdx: number = _i;
      let expectedIdx: int = 0;
      expect(actualIdx).assertEqual(expectedIdx);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__6500
     * @tc.name int16ArrayEntriesPart03Test065
     * @tc.desc Verify Int16Array of(1) entries() next IteratorResult done false value index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let r: IteratorResult<[int, Number]> = iter.next();
      let actualDone: boolean = r.done;
      expect(actualDone).assertFalse();
      let _i: int;
      let _v: Number;
      [_i, _v] = r.value!;
      let actualIdx: number = _i;
      let expectedIdx: int = 0;
      expect(actualIdx).assertEqual(expectedIdx);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__6600
     * @tc.name int16ArrayEntriesPart03Test066
     * @tc.desc Verify IteratorResult.value![0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(3, 4, 5);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let _i1: int;
      let _v1: Number;
      [_i1, _v1] = iter.next().value!;
      let actual: boolean = _i1 >= 0;
      expect(actual).assertTrue();
      let _i2: int;
      let _v2: Number;
      [_i2, _v2] = iter.next().value!;
      let actual2: boolean = _i2 >= 0;
      expect(actual2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__6700
     * @tc.name int16ArrayEntriesPart03Test067
     * @tc.desc Verify IteratorResult.value![0] 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let _i0: int;
      let _v0: Number;
      [_i0, _v0] = iter.next().value!;
      let i0: number = _i0;
      let _i1: int;
      let _v1: Number;
      [_i1, _v1] = iter.next().value!;
      let i1: number = _i1;
      let _i2: int;
      let _v2: Number;
      [_i2, _v2] = iter.next().value!;
      let i2: number = _i2;
      let actual: number = i1 - i0;
      let expected: int = 1;
      expect(actual).assertEqual(expected);
      let actual2: number = i2 - i1;
      let expected2: int = 1;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__6800
     * @tc.name int16ArrayEntriesPart03Test068
     * @tc.desc Verify entries() entry index length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      let lastIdx: number = 0;
      for (let entry of arr.entries()) {
        let _i: int;
        let _v: Number;
        [_i, _v] = entry;
        lastIdx = _i;
      }
      expect(lastIdx).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__6900
     * @tc.name int16ArrayEntriesPart03Test069
     * @tc.desc Verify Int16Array of(99) entries() next value index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(99);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let _i: int;
      let _v: Number;
      [_i, _v] = iter.next().value!;
      let actual: number = _i;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__7000
     * @tc.name int16ArrayEntriesPart03Test070
     * @tc.desc Verify Int16Array of(7,8) two entries iterators next value 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(7, 8);
      let iter1: IterableIterator<[int, Number]> = arr.entries();
      let _i1: int;
      let _v1: Number;
      [_i1, _v1] = iter1.next().value!;
      let actual: number = _v1;
      let expected: int = 7;
      expect(actual).assertEqual(expected);
      let iter2: IterableIterator<[int, Number]> = arr.entries();
      let _i2: int;
      let _v2: Number;
      [_i2, _v2] = iter2.next().value!;
      let actual2: number = _v2;
      let expected2: int = 7;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__7100
     * @tc.name int16ArrayEntriesPart03Test071
     * @tc.desc Verify entries() value[1] $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(100, 200, 300);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let r0: IteratorResult<[int, Number]> = iter.next();
      let r1: IteratorResult<[int, Number]> = iter.next();
      let _i0: int;
      let _v0: Number;
      [_i0, _v0] = r0.value!;
      let actual: number = _v0;
      let expected: number = arr.$_get(0);
      expect(actual).assertEqual(expected);
      let _i1: int;
      let _v1: Number;
      [_i1, _v1] = r1.value!;
      let actual2: number = _v1;
      let expected2: number = arr.$_get(1);
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__7200
     * @tc.name int16ArrayEntriesPart03Test072
     * @tc.desc Verify Int16Array of(1,2,3) two entries iterators next index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      let iterA: IterableIterator<[int, Number]> = arr.entries();
      let iterB: IterableIterator<[int, Number]> = arr.entries();
      let _iA: int;
      let _vA: Number;
      [_iA, _vA] = iterA.next().value!;
      let actual: number = _iA;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let _iB: int;
      let _vB: Number;
      [_iB, _vB] = iterB.next().value!;
      let actual2: number = _iB;
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__7300
     * @tc.name int16ArrayEntriesPart03Test073
     * @tc.desc Verify Int16Array of(10,20,30) two entries iterators next indices 0 0 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let iterA: IterableIterator<[int, Number]> = arr.entries();
      let iterB: IterableIterator<[int, Number]> = arr.entries();
      let a1: IteratorResult<[int, Number]> = iterA.next();
      let b1: IteratorResult<[int, Number]> = iterB.next();
      let a2: IteratorResult<[int, Number]> = iterA.next();
      let _iA1: int;
      let _vA1: Number;
      [_iA1, _vA1] = a1.value!;
      let actual: number = _iA1;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let _iB1: int;
      let _vB1: Number;
      [_iB1, _vB1] = b1.value!;
      let actual2: number = _iB1;
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
      let _iA2: int;
      let _vA2: Number;
      [_iA2, _vA2] = a2.value!;
      let actual3: number = _iA2;
      let expected3: int = 1;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__7400
     * @tc.name int16ArrayEntriesPart03Test074
     * @tc.desc Verify independent entries() iterators do not share iteration state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(5, 6);
      let iterA: IterableIterator<[int, Number]> = arr.entries();
      let iterB: IterableIterator<[int, Number]> = arr.entries();
      iterA.next();
      iterA.next();
      let _i: int;
      let _v: Number;
      [_i, _v] = iterB.next().value!;
      let actual: number = _i;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__7500
     * @tc.name int16ArrayEntriesPart03Test075
     * @tc.desc Verify three independent entries() iterators each traverse all 3 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(7, 8, 9);
      let countA: number = 0;
      let countB: number = 0;
      let countC: number = 0;
      let iterA: IterableIterator<[int, Number]> = arr.entries();
      let iterB: IterableIterator<[int, Number]> = arr.entries();
      let iterC: IterableIterator<[int, Number]> = arr.entries();
      let r: IteratorResult<[int, Number]> = iterA.next();
      while (!r.done) { countA = countA + 1; r = iterA.next(); }
      r = iterB.next();
      while (!r.done) { countB = countB + 1; r = iterB.next(); }
      r = iterC.next();
      while (!r.done) { countC = countC + 1; r = iterC.next(); }
      expect(countA).assertEqual(3);
      expect(countB).assertEqual(3);
      expect(countC).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART03__7600
     * @tc.name int16ArrayEntriesPart03Test076
     * @tc.desc Verify two independent entries() iterators each traverse 50 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart03Test076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let size: number = 50;
      let values: number[] = [];
      for (let i: number = 0; i < size; i = i + 1) {
        values.push(i);
      }
      let arr: Int16Array = Int16Array.from(values);
      let iter1: IterableIterator<[int, Number]> = arr.entries();
      let iter2: IterableIterator<[int, Number]> = arr.entries();
      let c1: number = 0;
      let c2: number = 0;
      let r1: IteratorResult<[int, Number]> = iter1.next();
      while (!r1.done) { c1 = c1 + 1; r1 = iter1.next(); }
      let r2: IteratorResult<[int, Number]> = iter2.next();
      while (!r2.done) { c2 = c2 + 1; r2 = iter2.next(); }
      expect(c1).assertEqual(50);
      expect(c2).assertEqual(50);
    });

  });
}
