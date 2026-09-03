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

export default function int16ArrayEntriesPart01Test(): void {
  describe("Int16ArrayEntriesPart01Test", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART01__0100
     * @tc.name int16ArrayEntriesPart01Test001
     * @tc.desc Verify entries() over [1, 2] first next() not done with index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart01Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2]);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let r: IteratorResult<[int, Number]> = iter.next();
      let actual: boolean = r.done;
      expect(actual).assertFalse();
      let _i: int;
      let _v: Number;
      [_i, _v] = r.value!;
      let actual2: int = _i;
      let expected: int = 0;
      expect(actual2).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART01__0200
     * @tc.name int16ArrayEntriesPart01Test002
     * @tc.desc Verify entries() next().done === true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart01Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([]);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let r: IteratorResult<[int, Number]> = iter.next();
      let actual: boolean = r.done;
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART01__0300
     * @tc.name int16ArrayEntriesPart01Test003
     * @tc.desc Verify entries() done === true value undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart01Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([]);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let r: IteratorResult<[int, Number]> = iter.next();
      expect(r.value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART01__0400
     * @tc.name int16ArrayEntriesPart01Test004
     * @tc.desc Verify entries() next() [0, value]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart01Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([42]);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let r: IteratorResult<[int, Number]> = iter.next();
      let actual: boolean = r.done;
      expect(actual).assertFalse();
      let _i: int;
      let _v: Number;
      [_i, _v] = r.value!;
      let actual2: number = _i;
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
      let actual3: number = _v;
      let expected3: int = 42;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART01__0500
     * @tc.name int16ArrayEntriesPart01Test005
     * @tc.desc Verify entries() next().done === true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart01Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([7]);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      iter.next();
      let r: IteratorResult<[int, Number]> = iter.next();
      let actual: boolean = r.done;
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART01__0600
     * @tc.name int16ArrayEntriesPart01Test006
     * @tc.desc Verify entries() next() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart01Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20]);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let r: IteratorResult<[int, Number]> = iter.next();
      let _i: int;
      let _v: Number;
      [_i, _v] = r.value!;
      let actual: number = _i;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART01__0700
     * @tc.name int16ArrayEntriesPart01Test007
     * @tc.desc Verify entries() next() 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart01Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20]);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      iter.next();
      let r: IteratorResult<[int, Number]> = iter.next();
      let _i: int;
      let _v: Number;
      [_i, _v] = r.value!;
      let actual: number = _i;
      let expected: int = 1;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART01__0800
     * @tc.name int16ArrayEntriesPart01Test008
     * @tc.desc Verify entries() next().done === true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart01Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20]);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      iter.next();
      iter.next();
      let r: IteratorResult<[int, Number]> = iter.next();
      let actual: boolean = r.done;
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART01__0900
     * @tc.name int16ArrayEntriesPart01Test009
     * @tc.desc Verify entries() over [100, 200] yields 100 then 200
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart01Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([100, 200]);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let r1: IteratorResult<[int, Number]> = iter.next();
      let r2: IteratorResult<[int, Number]> = iter.next();
      let _i1: int;
      let _v1: Number;
      [_i1, _v1] = r1.value!;
      let actual: number = _v1;
      let expected: int = 100;
      expect(actual).assertEqual(expected);
      let _i2: int;
      let _v2: Number;
      [_i2, _v2] = r2.value!;
      let actual2: number = _v2;
      let expected2: int = 200;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART01__1000
     * @tc.name int16ArrayEntriesPart01Test010
     * @tc.desc Verify entries() [index, value]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart01Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([5, 10, 15]);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let r1: IteratorResult<[int, Number]> = iter.next();
      let r2: IteratorResult<[int, Number]> = iter.next();
      let r3: IteratorResult<[int, Number]> = iter.next();
      let _i1: int;
      let _v1: Number;
      [_i1, _v1] = r1.value!;
      let actual: number = _i1;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: number = _v1;
      let expected2: int = 5;
      expect(actual2).assertEqual(expected2);
      let _i2: int;
      let _v2: Number;
      [_i2, _v2] = r2.value!;
      let actual3: number = _i2;
      let expected3: int = 1;
      expect(actual3).assertEqual(expected3);
      let actual4: number = _v2;
      let expected4: int = 10;
      expect(actual4).assertEqual(expected4);
      let _i3: int;
      let _v3: Number;
      [_i3, _v3] = r3.value!;
      let actual5: number = _i3;
      let expected5: int = 2;
      expect(actual5).assertEqual(expected5);
      let actual6: number = _v3;
      let expected6: int = 15;
      expect(actual6).assertEqual(expected6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART01__1100
     * @tc.name int16ArrayEntriesPart01Test011
     * @tc.desc Verify entries() over [1, 2, 3, 4, 5] yields index=value-1 per step and count 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart01Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let count: int = 0;
      let r: IteratorResult<[int, Number]> = iter.next();
      while (!r.done) {
        let _i: int;
        let _v: Number;
        [_i, _v] = r.value!;
        let actual: number = _i;
        let expected: number = count;
        expect(actual).assertEqual(expected);
        let actual2: number = _v;
        let expected2: number = count + 1;
        expect(actual2).assertEqual(expected2);
        count++;
        r = iter.next();
      }
      expect(count).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART01__1200
     * @tc.name int16ArrayEntriesPart01Test012
     * @tc.desc Verify entries() over Int16Array(100) with $_set(0, 1) and $_set(99, 100) yields first pair [0, 1] and last pair [99, 100]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart01Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(100);
      arr.$_set(0, 1);
      arr.$_set(99, 100);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let rFirst: IteratorResult<[int, Number]> = iter.next();
      let _i1: int;
      let _v1: Number;
      [_i1, _v1] = rFirst.value!;
      let actual: number = _i1;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: number = _v1;
      let expected2: int = 1;
      expect(actual2).assertEqual(expected2);
      for (let i = 1; i < 99; i++) {
        iter.next();
      }
      let rLast: IteratorResult<[int, Number]> = iter.next();
      let _i2: int;
      let _v2: Number;
      [_i2, _v2] = rLast.value!;
      let actual3: number = _i2;
      let expected3: int = 99;
      expect(actual3).assertEqual(expected3);
      let actual4: number = _v2;
      let expected4: int = 100;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART01__1300
     * @tc.name int16ArrayEntriesPart01Test013
     * @tc.desc Verify 0 entries() value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart01Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0]);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let r: IteratorResult<[int, Number]> = iter.next();
      let _i: int;
      let _v: Number;
      [_i, _v] = r.value!;
      let actual: number = _v;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART01__1400
     * @tc.name int16ArrayEntriesPart01Test014
     * @tc.desc Verify 3 entries() value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart01Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0, 0, 0]);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let r1: IteratorResult<[int, Number]> = iter.next();
      let r2: IteratorResult<[int, Number]> = iter.next();
      let r3: IteratorResult<[int, Number]> = iter.next();
      let _i1: int;
      let _v1: Number;
      [_i1, _v1] = r1.value!;
      let actual: number = _v1;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let _i2: int;
      let _v2: Number;
      [_i2, _v2] = r2.value!;
      let actual2: number = _v2;
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
      let _i3: int;
      let _v3: Number;
      [_i3, _v3] = r3.value!;
      let actual3: number = _v3;
      let expected3: int = 0;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART01__1500
     * @tc.name int16ArrayEntriesPart01Test015
     * @tc.desc Verify 1 entries() value 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart01Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1]);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let r: IteratorResult<[int, Number]> = iter.next();
      let _i: int;
      let _v: Number;
      [_i, _v] = r.value!;
      let actual: number = _v;
      let expected: int = 1;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART01__1600
     * @tc.name int16ArrayEntriesPart01Test016
     * @tc.desc Verify int16.MAX(32767) entries() value 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart01Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val:short = 32767
      let arr: Int16Array = new Int16Array([val]);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let r: IteratorResult<[int, Number]> = iter.next();
      let _i: int;
      let _v: Number;
      [_i, _v] = r.value!;
      let actual: number = _v;
      let expected: int = 32767;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART01__1700
     * @tc.name int16ArrayEntriesPart01Test017
     * @tc.desc Verify 0x7FFF entries() value 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart01Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0x7FFF]);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let r: IteratorResult<[int, Number]> = iter.next();
      let _i: int;
      let _v: Number;
      [_i, _v] = r.value!;
      let actual: number = _v;
      let expected: int = 32767;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART01__1800
     * @tc.name int16ArrayEntriesPart01Test018
     * @tc.desc Verify -1 entries() value -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart01Test018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([-1]);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let r: IteratorResult<[int, Number]> = iter.next();
      let _i: int;
      let _v: Number;
      [_i, _v] = r.value!;
      let actual: number = _v;
      let expected: int = -1;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART01__1900
     * @tc.name int16ArrayEntriesPart01Test019
     * @tc.desc Verify int16.MIN(-32768) entries() value -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart01Test019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val:short = -32768
      let arr: Int16Array = new Int16Array([val]);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let r: IteratorResult<[int, Number]> = iter.next();
      let _i: int;
      let _v: Number;
      [_i, _v] = r.value!;
      let actual: number = _v;
      let expected: int = -32768;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART01__2000
     * @tc.name int16ArrayEntriesPart01Test020
     * @tc.desc Verify entries() over [-10, -100] yields -10 then -100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart01Test020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([-10, -100]);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let r1: IteratorResult<[int, Number]> = iter.next();
      let r2: IteratorResult<[int, Number]> = iter.next();
      let _i1: int;
      let _v1: Number;
      [_i1, _v1] = r1.value!;
      let actual: number = _v1;
      let expected: int = -10;
      expect(actual).assertEqual(expected);
      let _i2: int;
      let _v2: Number;
      [_i2, _v2] = r2.value!;
      let actual2: number = _v2;
      let expected2: int = -100;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART01__2100
     * @tc.name int16ArrayEntriesPart01Test021
     * @tc.desc Verify entries() over [32767, -32768] yields MAX then MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart01Test021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let valMax:short = 32767
      let valMin:short = -32768
      let arr: Int16Array = new Int16Array([valMax, valMin]);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let r1: IteratorResult<[int, Number]> = iter.next();
      let r2: IteratorResult<[int, Number]> = iter.next();
      let _i1: int;
      let _v1: Number;
      [_i1, _v1] = r1.value!;
      let actual: number = _v1;
      let expected: int = 32767;
      expect(actual).assertEqual(expected);
      let _i2: int;
      let _v2: Number;
      [_i2, _v2] = r2.value!;
      let actual2: number = _v2;
      let expected2: int = -32768;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART01__2200
     * @tc.name int16ArrayEntriesPart01Test022
     * @tc.desc Verify entries() over [-32768, 32767] yields MIN then MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart01Test022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let valMin:short = -32768
      let valMax:short = 32767
      let arr: Int16Array = new Int16Array([valMin, valMax]);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let r1: IteratorResult<[int, Number]> = iter.next();
      let r2: IteratorResult<[int, Number]> = iter.next();
      let _i1: int;
      let _v1: Number;
      [_i1, _v1] = r1.value!;
      let actual: number = _v1;
      let expected: int = -32768;
      expect(actual).assertEqual(expected);
      let _i2: int;
      let _v2: Number;
      [_i2, _v2] = r2.value!;
      let actual2: number = _v2;
      let expected2: int = 32767;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART01__2300
     * @tc.name int16ArrayEntriesPart01Test023
     * @tc.desc Verify entries() over [1, -1, 2, -2] yields 1 then -1 then 2 then -2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart01Test023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, -1, 2, -2]);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let r1: IteratorResult<[int, Number]> = iter.next();
      let r2: IteratorResult<[int, Number]> = iter.next();
      let r3: IteratorResult<[int, Number]> = iter.next();
      let r4: IteratorResult<[int, Number]> = iter.next();
      let _i1: int;
      let _v1: Number;
      [_i1, _v1] = r1.value!;
      let actual: number = _v1;
      let expected: int = 1;
      expect(actual).assertEqual(expected);
      let _i2: int;
      let _v2: Number;
      [_i2, _v2] = r2.value!;
      let actual2: number = _v2;
      let expected2: int = -1;
      expect(actual2).assertEqual(expected2);
      let _i3: int;
      let _v3: Number;
      [_i3, _v3] = r3.value!;
      let actual3: number = _v3;
      let expected3: int = 2;
      expect(actual3).assertEqual(expected3);
      let _i4: int;
      let _v4: Number;
      [_i4, _v4] = r4.value!;
      let actual4: number = _v4;
      let expected4: int = -2;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART01__2400
     * @tc.name int16ArrayEntriesPart01Test024
     * @tc.desc Verify entries() over [10, 20, 30, 40] yields values in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart01Test024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40]);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let r1: IteratorResult<[int, Number]> = iter.next();
      let r2: IteratorResult<[int, Number]> = iter.next();
      let r3: IteratorResult<[int, Number]> = iter.next();
      let r4: IteratorResult<[int, Number]> = iter.next();
      let _i1: int;
      let _v1: Number;
      [_i1, _v1] = r1.value!;
      let actual: number = _v1;
      let expected: int = 10;
      expect(actual).assertEqual(expected);
      let _i2: int;
      let _v2: Number;
      [_i2, _v2] = r2.value!;
      let actual2: number = _v2;
      let expected2: int = 20;
      expect(actual2).assertEqual(expected2);
      let _i3: int;
      let _v3: Number;
      [_i3, _v3] = r3.value!;
      let actual3: number = _v3;
      let expected3: int = 30;
      expect(actual3).assertEqual(expected3);
      let _i4: int;
      let _v4: Number;
      [_i4, _v4] = r4.value!;
      let actual4: number = _v4;
      let expected4: int = 40;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART01__2500
     * @tc.name int16ArrayEntriesPart01Test025
     * @tc.desc Verify entries() over [50, 40, 30, 20] yields descending values in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart01Test025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([50, 40, 30, 20]);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let r1: IteratorResult<[int, Number]> = iter.next();
      let r2: IteratorResult<[int, Number]> = iter.next();
      let r3: IteratorResult<[int, Number]> = iter.next();
      let r4: IteratorResult<[int, Number]> = iter.next();
      let _i1: int;
      let _v1: Number;
      [_i1, _v1] = r1.value!;
      let actual: number = _v1;
      let expected: int = 50;
      expect(actual).assertEqual(expected);
      let _i2: int;
      let _v2: Number;
      [_i2, _v2] = r2.value!;
      let actual2: number = _v2;
      let expected2: int = 40;
      expect(actual2).assertEqual(expected2);
      let _i3: int;
      let _v3: Number;
      [_i3, _v3] = r3.value!;
      let actual3: number = _v3;
      let expected3: int = 30;
      expect(actual3).assertEqual(expected3);
      let _i4: int;
      let _v4: Number;
      [_i4, _v4] = r4.value!;
      let actual4: number = _v4;
      let expected4: int = 20;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART01__2600
     * @tc.name int16ArrayEntriesPart01Test026
     * @tc.desc Verify entries() over [-3, -1, 0, 2] yields values in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart01Test026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([-3, -1, 0, 2]);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let r1: IteratorResult<[int, Number]> = iter.next();
      let r2: IteratorResult<[int, Number]> = iter.next();
      let r3: IteratorResult<[int, Number]> = iter.next();
      let r4: IteratorResult<[int, Number]> = iter.next();
      let _i1: int;
      let _v1: Number;
      [_i1, _v1] = r1.value!;
      let actual: number = _v1;
      let expected: int = -3;
      expect(actual).assertEqual(expected);
      let _i2: int;
      let _v2: Number;
      [_i2, _v2] = r2.value!;
      let actual2: number = _v2;
      let expected2: int = -1;
      expect(actual2).assertEqual(expected2);
      let _i3: int;
      let _v3: Number;
      [_i3, _v3] = r3.value!;
      let actual3: number = _v3;
      let expected3: int = 0;
      expect(actual3).assertEqual(expected3);
      let _i4: int;
      let _v4: Number;
      [_i4, _v4] = r4.value!;
      let actual4: number = _v4;
      let expected4: int = 2;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART01__2700
     * @tc.name int16ArrayEntriesPart01Test027
     * @tc.desc Verify entries() over new Int16Array(3) with $_set yields first value 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart01Test027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(3);
      arr.$_set(0, 8);
      arr.$_set(1, 16);
      arr.$_set(2, 32);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let r: IteratorResult<[int, Number]> = iter.next();
      let _i: int;
      let _v: Number;
      [_i, _v] = r.value!;
      let actual: number = _v;
      let expected: int = 8;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART01__2800
     * @tc.name int16ArrayEntriesPart01Test028
     * @tc.desc Verify new Int16Array( TypedArray) entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart01Test028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = new Int16Array([9, 18, 27]);
      let arr: Int16Array = new Int16Array(src);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let r1: IteratorResult<[int, Number]> = iter.next();
      let _i: int;
      let _v: Number;
      [_i, _v] = r1.value!;
      let actual: number = _v;
      let expected: int = 9;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART01__2900
     * @tc.name int16ArrayEntriesPart01Test029
     * @tc.desc Verify Int16Array.of() entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart01Test029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(12, 24, 36);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let r1: IteratorResult<[int, Number]> = iter.next();
      let r2: IteratorResult<[int, Number]> = iter.next();
      let r3: IteratorResult<[int, Number]> = iter.next();
      let _i1: int;
      let _v1: Number;
      [_i1, _v1] = r1.value!;
      let actual: number = _v1;
      let expected: int = 12;
      expect(actual).assertEqual(expected);
      let _i2: int;
      let _v2: Number;
      [_i2, _v2] = r2.value!;
      let actual2: number = _v2;
      let expected2: int = 24;
      expect(actual2).assertEqual(expected2);
      let _i3: int;
      let _v3: Number;
      [_i3, _v3] = r3.value!;
      let actual3: number = _v3;
      let expected3: int = 36;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART01__3000
     * @tc.name int16ArrayEntriesPart01Test030
     * @tc.desc Verify Int16Array.of() entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart01Test030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(99);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let r1: IteratorResult<[int, Number]> = iter.next();
      let _i: int;
      let _v: Number;
      [_i, _v] = r1.value!;
      let actual: number = _v;
      let expected: int = 99;
      expect(actual).assertEqual(expected);
      let r2: IteratorResult<[int, Number]> = iter.next();
      let actual2: boolean = r2.done;
      expect(actual2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART01__3100
     * @tc.name int16ArrayEntriesPart01Test031
     * @tc.desc Verify Int16Array.of() entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart01Test031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let valMax:short = 32767
      let valMin:short = -32768
      let arr: Int16Array = Int16Array.of(valMax, valMin);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let r1: IteratorResult<[int, Number]> = iter.next();
      let r2: IteratorResult<[int, Number]> = iter.next();
      let _i1: int;
      let _v1: Number;
      [_i1, _v1] = r1.value!;
      let actual: number = _v1;
      let expected: int = 32767;
      expect(actual).assertEqual(expected);
      let _i2: int;
      let _v2: Number;
      [_i2, _v2] = r2.value!;
      let actual2: number = _v2;
      let expected2: int = -32768;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART01__3200
     * @tc.name int16ArrayEntriesPart01Test032
     * @tc.desc Verify Int16Array.from( ) entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart01Test032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.from([4, 8, 12]);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let r1: IteratorResult<[int, Number]> = iter.next();
      let r2: IteratorResult<[int, Number]> = iter.next();
      let r3: IteratorResult<[int, Number]> = iter.next();
      let _i1: int;
      let _v1: Number;
      [_i1, _v1] = r1.value!;
      let actual: number = _v1;
      let expected: int = 4;
      expect(actual).assertEqual(expected);
      let _i2: int;
      let _v2: Number;
      [_i2, _v2] = r2.value!;
      let actual2: number = _v2;
      let expected2: int = 8;
      expect(actual2).assertEqual(expected2);
      let _i3: int;
      let _v3: Number;
      [_i3, _v3] = r3.value!;
      let actual3: number = _v3;
      let expected3: int = 12;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART01__3300
     * @tc.name int16ArrayEntriesPart01Test033
     * @tc.desc Verify Int16Array.from( mapFn) entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart01Test033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: number[] = [1, 2, 3];
      let arr: Int16Array = Int16Array.from(source, (v: number, _k: number): number => v * 3);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let r1: IteratorResult<[int, Number]> = iter.next();
      let r2: IteratorResult<[int, Number]> = iter.next();
      let r3: IteratorResult<[int, Number]> = iter.next();
      let _i1: int;
      let _v1: Number;
      [_i1, _v1] = r1.value!;
      let actual: number = _v1;
      let expected: int = 3;
      expect(actual).assertEqual(expected);
      let _i2: int;
      let _v2: Number;
      [_i2, _v2] = r2.value!;
      let actual2: number = _v2;
      let expected2: int = 6;
      expect(actual2).assertEqual(expected2);
      let _i3: int;
      let _v3: Number;
      [_i3, _v3] = r3.value!;
      let actual3: number = _v3;
      let expected3: int = 9;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART01__3400
     * @tc.name int16ArrayEntriesPart01Test034
     * @tc.desc Verify Int16Array.from( TypedArray) entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart01Test034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int8Array = new Int8Array([2, 4, 6]);
      let arr: Int16Array = Int16Array.from(src);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let r1: IteratorResult<[int, Number]> = iter.next();
      let _i: int;
      let _v: Number;
      [_i, _v] = r1.value!;
      let actual: number = _v;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART01__3500
     * @tc.name int16ArrayEntriesPart01Test035
     * @tc.desc Verify Int16Array.from(Set) entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart01Test035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(11);
      s.add(22);
      s.add(33);
      let arr: Int16Array = Int16Array.from(s.values());
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let actual: boolean = iter.next().done;
      expect(actual).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART01__3600
     * @tc.name int16ArrayEntriesPart01Test036
     * @tc.desc Verify entries() over new Int16Array(4) after fill(0) yields 0 for first two elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart01Test036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(4);
      arr.fill(0);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let r1: IteratorResult<[int, Number]> = iter.next();
      let r2: IteratorResult<[int, Number]> = iter.next();
      let _i1: int;
      let _v1: Number;
      [_i1, _v1] = r1.value!;
      let actual: number = _v1;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let _i2: int;
      let _v2: Number;
      [_i2, _v2] = r2.value!;
      let actual2: number = _v2;
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART01__3700
     * @tc.name int16ArrayEntriesPart01Test037
     * @tc.desc Verify fill(MAX) entries() 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart01Test037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(3);
      let val:short = 32767
      arr.fill(val);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let r1: IteratorResult<[int, Number]> = iter.next();
      let _i: int;
      let _v: Number;
      [_i, _v] = r1.value!;
      let actual: number = _v;
      let expected: int = 32767;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART01__3800
     * @tc.name int16ArrayEntriesPart01Test038
     * @tc.desc Verify fill(MIN) entries() -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart01Test038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(3);
      let val:short = -32768
      arr.fill(val);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let r1: IteratorResult<[int, Number]> = iter.next();
      let _i: int;
      let _v: Number;
      [_i, _v] = r1.value!;
      let actual: number = _v;
      let expected: int = -32768;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART01__3900
     * @tc.name int16ArrayEntriesPart01Test039
     * @tc.desc Verify fill(-1) entries() -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart01Test039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(3);
      arr.fill(-1);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let r1: IteratorResult<[int, Number]> = iter.next();
      let _i: int;
      let _v: Number;
      [_i, _v] = r1.value!;
      let actual: number = _v;
      let expected: int = -1;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART01__4000
     * @tc.name int16ArrayEntriesPart01Test040
     * @tc.desc Verify ArrayBuffer Int16Array entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart01Test040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let arr: Int16Array = new Int16Array(buf);
      arr.$_set(0, 17);
      arr.$_set(1, 34);
      arr.$_set(2, 51);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let r1: IteratorResult<[int, Number]> = iter.next();
      let _i: int;
      let _v: Number;
      [_i, _v] = r1.value!;
      let actual: number = _v;
      let expected: int = 17;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART01__4100
     * @tc.name int16ArrayEntriesPart01Test041
     * @tc.desc Verify ArrayBuffer + byteOffset=2 entries() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart01Test041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let full: Int16Array = new Int16Array(buf);
      full.$_set(0, 100);
      full.$_set(1, 200);
      full.$_set(2, 300);
      let arr: Int16Array = new Int16Array(buf, 2);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let r1: IteratorResult<[int, Number]> = iter.next();
      let _i: int;
      let _v: Number;
      [_i, _v] = r1.value!;
      let actual: number = _i;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: number = _v;
      let expected2: int = 200;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART01__4200
     * @tc.name int16ArrayEntriesPart01Test042
     * @tc.desc Verify ArrayBuffer + byteOffset=4 entries() 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart01Test042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let full: Int16Array = new Int16Array(buf);
      full.$_set(0, 111);
      full.$_set(1, 222);
      full.$_set(2, 333);
      let arr: Int16Array = new Int16Array(buf, 4);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let r1: IteratorResult<[int, Number]> = iter.next();
      let _i: int;
      let _v: Number;
      [_i, _v] = r1.value!;
      let actual: number = _i;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: number = _v;
      let expected2: int = 333;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART01__4300
     * @tc.name int16ArrayEntriesPart01Test043
     * @tc.desc Verify entries() over ArrayBuffer view (offset 2, length 2) yields values 2 then 3 and third next() done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart01Test043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(10);
      let full: Int16Array = new Int16Array(buf);
      full.$_set(0, 1);
      full.$_set(1, 2);
      full.$_set(2, 3);
      full.$_set(3, 4);
      full.$_set(4, 5);
      let arr: Int16Array = new Int16Array(buf, 2, 2);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let r1: IteratorResult<[int, Number]> = iter.next();
      let r2: IteratorResult<[int, Number]> = iter.next();
      let r3: IteratorResult<[int, Number]> = iter.next();
      let _i1: int;
      let _v1: Number;
      [_i1, _v1] = r1.value!;
      let actual: number = _v1;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
      let _i2: int;
      let _v2: Number;
      [_i2, _v2] = r2.value!;
      let actual2: number = _v2;
      let expected2: int = 3;
      expect(actual2).assertEqual(expected2);
      let actual3: boolean = r3.done;
      expect(actual3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART01__4400
     * @tc.name int16ArrayEntriesPart01Test044
     * @tc.desc Verify ArrayBuffer entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart01Test044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr1: Int16Array = new Int16Array(buf, 0, 1);
      let arr2: Int16Array = new Int16Array(buf, 2, 1);
      arr1.$_set(0, 55);
      arr2.$_set(0, 66);
      let iter1: IterableIterator<[int, Number]> = arr1.entries();
      let iter2: IterableIterator<[int, Number]> = arr2.entries();
      let r1: IteratorResult<[int, Number]> = iter1.next();
      let r2: IteratorResult<[int, Number]> = iter2.next();
      let _i1: int;
      let _v1: Number;
      [_i1, _v1] = r1.value!;
      let actual: number = _v1;
      let expected: int = 55;
      expect(actual).assertEqual(expected);
      let _i2: int;
      let _v2: Number;
      [_i2, _v2] = r2.value!;
      let actual2: number = _v2;
      let expected2: int = 66;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART01__4500
     * @tc.name int16ArrayEntriesPart01Test045
     * @tc.desc Verify ArrayBuffer entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart01Test045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr1: Int16Array = new Int16Array(buf);
      let arr2: Int16Array = new Int16Array(buf);
      arr1.$_set(0, 77);
      let iter = arr2.entries();
      let r: IteratorResult<[int, Number]> = iter.next();
      let _i: int;
      let _v: Number;
      [_i, _v] = r.value!;
      let actual: number = _v;
      let expected: int = 77;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART01__4600
     * @tc.name int16ArrayEntriesPart01Test046
     * @tc.desc Verify entries() after $_set(1, 999) yields 999 at second next()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart01Test046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      arr.$_set(1, 999);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      iter.next();
      let r: IteratorResult<[int, Number]> = iter.next();
      let _i: int;
      let _v: Number;
      [_i, _v] = r.value!;
      let actual: number = _v;
      let expected: int = 999;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART01__4700
     * @tc.name int16ArrayEntriesPart01Test047
     * @tc.desc Verify entries() after $_set(0, 100) then $_set(0, 200) yields 200 at first next()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart01Test047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2]);
      arr.$_set(0, 100);
      arr.$_set(0, 200);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let r: IteratorResult<[int, Number]> = iter.next();
      let _i: int;
      let _v: Number;
      [_i, _v] = r.value!;
      let actual: number = _v;
      let expected: int = 200;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART01__4800
     * @tc.name int16ArrayEntriesPart01Test048
     * @tc.desc Verify entries() over [1, 2, 3] after fill(88) yields 88 for all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart01Test048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      arr.fill(88);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let r1: IteratorResult<[int, Number]> = iter.next();
      let r2: IteratorResult<[int, Number]> = iter.next();
      let _i1: int;
      let _v1: Number;
      [_i1, _v1] = r1.value!;
      let actual: number = _v1;
      let expected: int = 88;
      expect(actual).assertEqual(expected);
      let _i2: int;
      let _v2: Number;
      [_i2, _v2] = r2.value!;
      let actual2: number = _v2;
      let expected2: int = 88;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART01__4900
     * @tc.name int16ArrayEntriesPart01Test049
     * @tc.desc Verify reverse() entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart01Test049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      arr.reverse();
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let r1: IteratorResult<[int, Number]> = iter.next();
      let _i: int;
      let _v: Number;
      [_i, _v] = r1.value!;
      let actual: number = _v;
      let expected: int = 3;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART01__5000
     * @tc.name int16ArrayEntriesPart01Test050
     * @tc.desc Verify copyWithin() entries()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart01Test050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4]);
      arr.copyWithin(0, 2);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let r1: IteratorResult<[int, Number]> = iter.next();
      let _i: int;
      let _v: Number;
      [_i, _v] = r1.value!;
      let actual: number = _v;
      let expected: int = 3;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART01__5100
     * @tc.name int16ArrayEntriesPart01Test051
     * @tc.desc Verify two independent entries() iterators over [1, 2, 3] each start at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart01Test051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      let iterA: IterableIterator<[int, Number]> = arr.entries();
      let iterB: IterableIterator<[int, Number]> = arr.entries();
      let rA: IteratorResult<[int, Number]> = iterA.next();
      let rB: IteratorResult<[int, Number]> = iterB.next();
      let _iA: int;
      let _vA: Number;
      [_iA, _vA] = rA.value!;
      let actual: number = _iA;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let _iB: int;
      let _vB: Number;
      [_iB, _vB] = rB.value!;
      let actual2: number = _iB;
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART01__5200
     * @tc.name int16ArrayEntriesPart01Test052
     * @tc.desc Verify two independent entries() iterators over [10, 20, 30] advance separately
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart01Test052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30]);
      let iterA: IterableIterator<[int, Number]> = arr.entries();
      let iterB: IterableIterator<[int, Number]> = arr.entries();
      iterA.next();
      iterA.next();
      let rB: IteratorResult<[int, Number]> = iterB.next();
      let _iB: int;
      let _vB: Number;
      [_iB, _vB] = rB.value!;
      let actual: number = _iB;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: number = _vB;
      let expected2: int = 10;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART01__5300
     * @tc.name int16ArrayEntriesPart01Test053
     * @tc.desc Verify two independent entries() iterators over [1, 2, 3, 4] advance separately
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart01Test053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4]);
      let iterA: IterableIterator<[int, Number]> = arr.entries();
      let iterB: IterableIterator<[int, Number]> = arr.entries();
      iterA.next();
      let rA: IteratorResult<[int, Number]> = iterA.next();
      let rB: IteratorResult<[int, Number]> = iterB.next();
      let _iA: int;
      let _vA: Number;
      [_iA, _vA] = rA.value!;
      let actual: number = _iA;
      let expected: int = 1;
      expect(actual).assertEqual(expected);
      let _iB: int;
      let _vB: Number;
      [_iB, _vB] = rB.value!;
      let actual2: number = _iB;
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART01__5400
     * @tc.name int16ArrayEntriesPart01Test054
     * @tc.desc Verify entries() over [5, 10] exhausts after two next() and new iterator first next() not done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart01Test054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([5, 10]);
      let iter1: IterableIterator<[int, Number]> = arr.entries();
      iter1.next();
      iter1.next();
      let actual: boolean = iter1.next().done;
      expect(actual).assertTrue();
      let iter2: IterableIterator<[int, Number]> = arr.entries();
      let actual2: boolean = iter2.next().done;
      expect(actual2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART01__5500
     * @tc.name int16ArrayEntriesPart01Test055
     * @tc.desc Verify entries() over [1] first next() not done with index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart01Test055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1]);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let r: IteratorResult<[int, Number]> = iter.next();
      let actual: boolean = r.done;
      expect(actual).assertFalse();
      let _i: int;
      let _v: Number;
      [_i, _v] = r.value!;
      let actual2: int = _i;
      let expected: int = 0;
      expect(actual2).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART01__5600
     * @tc.name int16ArrayEntriesPart01Test056
     * @tc.desc Verify entries() over [10, 20, 30, 40] counts 4 pairs via while loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart01Test056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40]);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let pairCount: int = 0;
      let r: IteratorResult<[int, Number]> = iter.next();
      while (!r.done) {
        pairCount++;
        r = iter.next();
      }
      expect(pairCount).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART01__5700
     * @tc.name int16ArrayEntriesPart01Test057
     * @tc.desc Verify entries() over [42] first next() not done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart01Test057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([42]);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let r: IteratorResult<[int, Number]> = iter.next();
      let actual: boolean = r.done;
      expect(actual).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART01__5800
     * @tc.name int16ArrayEntriesPart01Test058
     * @tc.desc Verify for...of entries() on empty array yields zero iterations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart01Test058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([]);
      let count: int = 0;
      for (let entry: [int, Number] of arr.entries()) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART01__5900
     * @tc.name int16ArrayEntriesPart01Test059
     * @tc.desc Verify for...of entries() over [99] yields entry [0, 99]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart01Test059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([99]);
      let count: int = 0;
      let firstIdx: int = -1;
      let firstVal: number = 0;
      for (let entry: [int, Number] of arr.entries()) {
        let _i: int;
        let _v: Number;
        [_i, _v] = entry;
        firstIdx = _i;
        firstVal = _v;
        count++;
      }
      expect(count).assertEqual(1);
      expect(firstIdx).assertEqual(0);
      expect(firstVal).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART01__6000
     * @tc.name int16ArrayEntriesPart01Test060
     * @tc.desc Verify for...of entries() over five elements yields 5 iterations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart01Test060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      let count: int = 0;
      for (let entry: [int, Number] of arr.entries()) {
        count++;
      }
      expect(count).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART01__6100
     * @tc.name int16ArrayEntriesPart01Test061
     * @tc.desc Verify for...of entries() yields ascending entry indices 0, 1, 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart01Test061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([7, 14, 21]);
      let idx: int = 0;
      for (let entry: [int, Number] of arr.entries()) {
        let _i: int;
        let _v: Number;
        [_i, _v] = entry;
        let actual: number = _i;
        let expected: int = idx;
        expect(actual).assertEqual(expected);
        idx++;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART01__6200
     * @tc.name int16ArrayEntriesPart01Test062
     * @tc.desc Verify for...of entries() over [32767, -32768] yields values in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart01Test062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let valMax:short = 32767
      let valMin:short = -32768
      let arr: Int16Array = new Int16Array([valMax, valMin]);
      let values: number[] = [];
      for (let entry: [int, Number] of arr.entries()) {
        let _i: int;
        let _v: Number;
        [_i, _v] = entry;
        values.push(_v);
      }
      let actual: number = values[0];
      let expected: int = 32767;
      expect(actual).assertEqual(expected);
      let actual2: number = values[1];
      let expected2: int = -32768;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART01__6300
     * @tc.name int16ArrayEntriesPart01Test063
     * @tc.desc Verify entries() after $_set(0, 999) yields 999 for first next()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart01Test063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      arr.$_set(0, 999);
      let r: IteratorResult<[int, Number]> = iter.next();
      let _i: int;
      let _v: Number;
      [_i, _v] = r.value!;
      let actual: number = _v;
      let expected: int = 999;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART01__6400
     * @tc.name int16ArrayEntriesPart01Test064
     * @tc.desc Verify entries() after $_set(2, 777) yields 777 at third next()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart01Test064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      iter.next();
      arr.$_set(2, 777);
      iter.next();
      let r: IteratorResult<[int, Number]> = iter.next();
      let _i: int;
      let _v: Number;
      [_i, _v] = r.value!;
      let actual: number = _v;
      let expected: int = 777;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART01__6500
     * @tc.name int16ArrayEntriesPart01Test065
     * @tc.desc Verify entries() over [1, 2, 3] after $_set(0, 999) still yields 1 then 2 in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart01Test065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      let r1: IteratorResult<[int, Number]> = iter.next();
      arr.$_set(0, 999);
      let r2: IteratorResult<[int, Number]> = iter.next();
      let _i1: int;
      let _v1: Number;
      [_i1, _v1] = r1.value!;
      let actual: number = _v1;
      let expected: int = 1;
      expect(actual).assertEqual(expected);
      let _i2: int;
      let _v2: Number;
      [_i2, _v2] = r2.value!;
      let actual2: number = _v2;
      let expected2: int = 2;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART01__6600
     * @tc.name int16ArrayEntriesPart01Test066
     * @tc.desc Verify entries() done true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart01Test066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      iter.next();
      iter.next();
      iter.next();
      let actual: boolean = iter.next().done;
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART01__6700
     * @tc.name int16ArrayEntriesPart01Test067
     * @tc.desc Verify entries() over [1, 2, 3] second next() not done
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart01Test067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      iter.next();
      let r: IteratorResult<[int, Number]> = iter.next();
      let actual: boolean = r.done;
      expect(actual).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_ENTRIES_PART01__6800
     * @tc.name int16ArrayEntriesPart01Test068
     * @tc.desc Verify entries() over [1] second next() value is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayEntriesPart01Test068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1]);
      let iter: IterableIterator<[int, Number]> = arr.entries();
      iter.next();
      let r: IteratorResult<[int, Number]> = iter.next();
      expect(r.value).assertUndefined();
    });

  });
}
