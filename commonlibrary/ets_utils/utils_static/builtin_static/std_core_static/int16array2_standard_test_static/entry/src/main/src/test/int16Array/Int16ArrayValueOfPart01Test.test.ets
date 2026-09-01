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

export default function int16ArrayValueOfPart01Test(): void {
  describe("Int16ArrayValueOfPart01Test", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART01__0100
     * @tc.name int16ArrayValueOfPart01Test001
     * @tc.desc Verify new Int16Array(arrayLike) valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart01Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([5, 10, 15]);
      let result: Object = arr.valueOf();
      result.$_set(1 as int, 88);
      let actual: number = arr.$_get(1 as int);
      let expected: int = 88;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART01__0200
     * @tc.name int16ArrayValueOfPart01Test002
     * @tc.desc Verify Int16Array.of(3, 6, 9) valueOf result $_set(0, 77) reflects $_get(0) assertEqual 77
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart01Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(3, 6, 9);
      let result: Object = arr.valueOf();
      result.$_set(0 as int, 77);
      let actual: number = arr.$_get(0 as int);
      let expected: int = 77;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART01__0300
     * @tc.name int16ArrayValueOfPart01Test003
     * @tc.desc Verify Int16Array.from([7, 14, 21]) valueOf result $_set(2, 55) reflects $_get(2) assertEqual 55
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart01Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.from([7, 14, 21]);
      let result: Object = arr.valueOf();
      result.$_set(2 as int, 55);
      let actual: number = arr.$_get(2 as int);
      let expected: int = 55;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART01__0400
     * @tc.name int16ArrayValueOfPart01Test004
     * @tc.desc Verify new Int16Array(buf) ArrayBuffer byteOffset=0 valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart01Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let arr: Int16Array = new Int16Array(buf);
      let result: Object = arr.valueOf();
      result.$_set(0 as int, 33);
      let actual: number = arr.$_get(0 as int);
      let expected: int = 33;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART01__0500
     * @tc.name int16ArrayValueOfPart01Test005
     * @tc.desc Verify new Int16Array(buf, byteOffset) ArrayBuffer valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart01Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int16Array = new Int16Array(buf, 2 as int);
      let result: Object = arr.valueOf();
      result.$_set(0 as int, 44);
      let actual: number = arr.$_get(0 as int);
      let expected: int = 44;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART01__0600
     * @tc.name int16ArrayValueOfPart01Test006
     * @tc.desc Verify new Int16Array(buf, byteOffset, length) ArrayBuffer valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart01Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(10);
      let arr: Int16Array = new Int16Array(buf, 2 as int, 2 as int);
      let result: Object = arr.valueOf();
      result.$_set(1 as int, 66);
      let actual: number = arr.$_get(1 as int);
      let expected: int = 66;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART01__0700
     * @tc.name int16ArrayValueOfPart01Test007
     * @tc.desc Verify new Int16Array(typedArray) Int16Array valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart01Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = new Int16Array([10, 20, 30]);
      let arr: Int16Array = new Int16Array(src);
      let result: Object = arr.valueOf();
      result.$_set(0 as int, 99);
      let actual: number = arr.$_get(0 as int);
      let expected: int = 99;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART01__0800
     * @tc.name int16ArrayValueOfPart01Test008
     * @tc.desc Verify Int16Array.from(setObject) Set valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart01Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      s.add(100);
      s.add(200);
      let arr: Int16Array = Int16Array.from(s);
      let result: Object = arr.valueOf();
      result.$_set(0 as int, 50);
      let actual: number = arr.$_get(0 as int);
      let expected: int = 50;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART01__0900
     * @tc.name int16ArrayValueOfPart01Test009
     * @tc.desc Verify Int16Array.from(arrayLike, mapFn) valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart01Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: Array<number> = [1, 2, 3];
      let arr: Int16Array = Int16Array.from(source, (v: number, k: number): number => {
        return v * 10;
      });
      let result: Object = arr.valueOf();
      result.$_set(1 as int, 255);
      let actual: number = arr.$_get(1 as int);
      let expected: int = 255;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART01__1000
     * @tc.name int16ArrayValueOfPart01Test010
     * @tc.desc Verify Int16Array length=0 valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart01Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(0);
      let result: Object = arr.valueOf();
      let actual: Object = result;
      let expected: Object = arr;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART01__1100
     * @tc.name int16ArrayValueOfPart01Test011
     * @tc.desc Verify +Infinity 0 valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart01Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([Double.POSITIVE_INFINITY]);
      let result: Object = arr.valueOf();
      result.$_set(0 as int, 7);
      let actual: number = arr.$_get(0 as int);
      let expected: int = 7;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART01__1200
     * @tc.name int16ArrayValueOfPart01Test012
     * @tc.desc Verify -Infinity 0 valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart01Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([-Double.POSITIVE_INFINITY]);
      let result: Object = arr.valueOf();
      result.$_set(0 as int, -3);
      let actual: number = arr.$_get(0 as int);
      let expected: int = -3;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART01__1300
     * @tc.name int16ArrayValueOfPart01Test013
     * @tc.desc Verify new Int16Array([NaN]) valueOf result $_set(0, 42) reflects $_get(0) assertEqual 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart01Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([Double.NaN]);
      let result: Object = arr.valueOf();
      result.$_set(0 as int, 42);
      let actual: number = arr.$_get(0 as int);
      let expected: int = 42;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART01__1400
     * @tc.name int16ArrayValueOfPart01Test014
     * @tc.desc Verify fill(0) Int16Array valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart01Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      arr.fill(0);
      let result: Object = arr.valueOf();
      result.$_set(1 as int, 99);
      let actual: number = arr.$_get(1 as int);
      let expected: int = 99;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART01__1500
     * @tc.name int16ArrayValueOfPart01Test015
     * @tc.desc Verify fill(MAX) Int16Array valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart01Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0, 0, 0]);
      let val: short = 32767;
      arr.fill(val);
      let result: Object = arr.valueOf();
      result.$_set(2 as int, 0);
      let actual: number = arr.$_get(2 as int);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART01__1600
     * @tc.name int16ArrayValueOfPart01Test016
     * @tc.desc Verify fill(MIN) Int16Array valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart01Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0, 0, 0]);
      let val: short = -32768;
      arr.fill(val);
      let result: Object = arr.valueOf();
      result.$_set(0 as int, 1);
      let actual: number = arr.$_get(0 as int);
      let expected: int = 1;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART01__1700
     * @tc.name int16ArrayValueOfPart01Test017
     * @tc.desc Verify reverse() Int16Array valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart01Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      arr.reverse();
      let result: Object = arr.valueOf();
      result.$_set(0 as int, -1);
      let actual: number = arr.$_get(0 as int);
      let expected: int = -1;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART01__1800
     * @tc.name int16ArrayValueOfPart01Test018
     * @tc.desc Verify sort() Int16Array valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart01Test018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([5, -10, 3, 0, 8]);
      arr.sort();
      let result: Object = arr.valueOf();
      result.$_set(4 as int, 255);
      let actual: number = arr.$_get(4 as int);
      let expected: int = 255;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART01__1900
     * @tc.name int16ArrayValueOfPart01Test019
     * @tc.desc Verify set(src) Int16Array valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart01Test019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0, 0, 0, 0]);
      arr.set(Int16Array.of(10, 20));
      let result: Object = arr.valueOf();
      result.$_set(1 as int, 77);
      let actual: number = arr.$_get(1 as int);
      let expected: int = 77;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART01__2000
     * @tc.name int16ArrayValueOfPart01Test020
     * @tc.desc Verify copyWithin Int16Array valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart01Test020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5]);
      arr.copyWithin(0 as int, 3 as int);
      let result: Object = arr.valueOf();
      result.$_set(0 as int, -99);
      let actual: number = arr.$_get(0 as int);
      let expected: int = -99;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART01__2100
     * @tc.name int16ArrayValueOfPart01Test021
     * @tc.desc Verify $_set Int16Array valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart01Test021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30]);
      arr.$_set(1 as int, 555);
      let result: Object = arr.valueOf();
      result.$_set(2 as int, 888);
      let actual: number = arr.$_get(2 as int);
      let expected: int = 888;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART01__2200
     * @tc.name int16ArrayValueOfPart01Test022
     * @tc.desc Verify valueOf valueOf valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart01Test022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([7, 14, 21]);
      let secondValue: Object = arr.valueOf();
      let thirdValue: Object = secondValue.valueOf();
      thirdValue.$_set(0 as int, 333);
      let actual: number = arr.$_get(0 as int);
      let expected: int = 333;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART01__2300
     * @tc.name int16ArrayValueOfPart01Test023
     * @tc.desc Verify fill/reverse valueOf result $_set(4, -1) reflects $_get(4) assertEqual -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart01Test023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([9, 8, 7, 6, 5]);
      arr.fill(0);
      arr.$_set(0 as int, 100);
      arr.reverse();
      let result: Object = arr.valueOf();
      result.$_set(4 as int, -1);
      let actual: number = arr.$_get(4 as int);
      let expected: int = -1;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART01__2400
     * @tc.name int16ArrayValueOfPart01Test024
     * @tc.desc Verify subarray() view valueOf result $_set(0, 55) reflects $_get(0) assertEqual 55
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart01Test024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40]);
      let view: Int16Array = arr.subarray();
      let result: Object = view.valueOf();
      result.$_set(0 as int, 55);
      let actual: number = view.$_get(0 as int);
      let expected: int = 55;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART01__2500
     * @tc.name int16ArrayValueOfPart01Test025
     * @tc.desc Verify subarray(2) view valueOf result $_set(0, 99) reflects $_get(0) assertEqual 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart01Test025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40, 50]);
      let view: Int16Array = arr.subarray(2 as int);
      let result: Object = view.valueOf();
      result.$_set(0 as int, 99);
      let actual: number = view.$_get(0 as int);
      let expected: int = 99;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART01__2600
     * @tc.name int16ArrayValueOfPart01Test026
     * @tc.desc Verify subarray(begin, end) valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart01Test026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0, 1, 2, 3, 4, 5]);
      let view: Int16Array = arr.subarray(1 as int, 4 as int);
      let result: Object = view.valueOf();
      result.$_set(2 as int, 127);
      let actual: number = view.$_get(2 as int);
      let expected: int = 127;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART01__2700
     * @tc.name int16ArrayValueOfPart01Test027
     * @tc.desc Verify subarray subarray subarray valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart01Test027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3, 4, 5, 6, 7, 8]);
      let view1: Int16Array = arr.subarray(1 as int, 7 as int);
      let view2: Int16Array = view1.subarray(1 as int, 4 as int);
      let result: Object = view2.valueOf();
      result.$_set(0 as int, -1);
      let actual: number = view2.$_get(0 as int);
      let expected: int = -1;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART01__2800
     * @tc.name int16ArrayValueOfPart01Test028
     * @tc.desc Verify new Int16Array(buf, 2, 2) valueOf result $_set(0, 32767) reflects $_get(0) assertEqual 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart01Test028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let child: Int16Array = new Int16Array(buf, 2 as int, 2 as int);
      let result: Object = child.valueOf();
      let val: short = 32767;
      result.$_set(0 as int, val);
      let actual: number = child.$_get(0 as int);
      let expected: int = 32767;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART01__2900
     * @tc.name int16ArrayValueOfPart01Test029
     * @tc.desc Verify new Int16Array(2) valueOf result $_set(0, -32768) and $_set(1, 32767) reflects $_get(0) assertEqual -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart01Test029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(2);
      let result: Object = arr.valueOf();
      let valMin:short = -32768
      let valMax:short = 32767
      result.$_set(0 as int, valMin);
      result.$_set(1 as int, valMax);
      let actual: number = arr.$_get(0 as int);
      let expected: int = -32768;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART01__3000
     * @tc.name int16ArrayValueOfPart01Test030
     * @tc.desc Verify new Int16Array(10) fill(5) valueOf result $_set(9, -1) reflects $_get(9) assertEqual -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart01Test030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(10);
      arr.fill(5);
      let result: Object = arr.valueOf();
      result.$_set(9 as int, -1);
      let actual: number = arr.$_get(9 as int);
      let expected: int = -1;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART01__3100
     * @tc.name int16ArrayValueOfPart01Test031
     * @tc.desc Verify [] Int16Array valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart01Test031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let empty: number[] = [];
      let arr: Int16Array = new Int16Array(empty);
      let result: Object = arr.valueOf();
      let actual: Object = result;
      let expected: Object = arr;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART01__3200
     * @tc.name int16ArrayValueOfPart01Test032
     * @tc.desc Verify Int16Array.from Set valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart01Test032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: Set<number> = new Set<number>();
      let arr: Int16Array = Int16Array.from(s);
      let result: Object = arr.valueOf();
      let actual: Object = result;
      let expected: Object = arr;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART01__3300
     * @tc.name int16ArrayValueOfPart01Test033
     * @tc.desc Verify new Int16Array(ArrayBuffer(0)) valueOf result equals original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart01Test033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(0);
      let arr: Int16Array = new Int16Array(buf);
      let result: Object = arr.valueOf();
      let actual: Object = result;
      let expected: Object = arr;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART01__3400
     * @tc.name int16ArrayValueOfPart01Test034
     * @tc.desc Verify new Int16Array(0) valueOf called twice assertEqual r1 and r2 same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart01Test034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(0);
      let r1: Object = arr.valueOf();
      let r2: Object = arr.valueOf();
      let actual: Object = r1;
      let expected: Object = r2;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART01__3500
     * @tc.name int16ArrayValueOfPart01Test035
     * @tc.desc Verify set TypedArray valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart01Test035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 1, 1, 1, 1]);
      arr.set(Int16Array.of(9, 9), 2 as int);
      let result: Object = arr.valueOf();
      result.$_set(4 as int, 0);
      let actual: number = arr.$_get(4 as int);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART01__3600
     * @tc.name int16ArrayValueOfPart01Test036
     * @tc.desc Verify new Int16Array([5, 10, 15]) $_set(2, 999) valueOf $_set(2, -999) reflects $_get(2) assertEqual -999
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart01Test036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([5, 10, 15]);
      arr.$_set(2 as int, 999);
      let result: Object = arr.valueOf();
      result.$_set(2 as int, -999);
      let actual: number = arr.$_get(2 as int);
      let expected: int = -999;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART01__3700
     * @tc.name int16ArrayValueOfPart01Test037
     * @tc.desc Verify $_set 0 int16.MAX valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart01Test037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0, 0]);
      let valMax:short = 32767
      arr.$_set(0 as int, valMax);
      let result: Object = arr.valueOf();
      let valMin:short = -32768
      result.$_set(0 as int, valMin);
      let actual: number = arr.$_get(0 as int);
      let expected: int = -32768;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART01__3800
     * @tc.name int16ArrayValueOfPart01Test038
     * @tc.desc Verify new Int16Array([3, -5, 0, 100, -1]) sort() valueOf result $_set(0, 200) reflects $_get(0) assertEqual 200
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart01Test038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([3, -5, 0, 100, -1]);
      arr.sort();
      let result: Object = arr.valueOf();
      result.$_set(0 as int, 200);
      let actual: number = arr.$_get(0 as int);
      let expected: int = 200;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART01__3900
     * @tc.name int16ArrayValueOfPart01Test039
     * @tc.desc Verify copyWithin(target, start) end valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart01Test039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40, 50]);
      arr.copyWithin(0 as int, 2 as int);
      let result: Object = arr.valueOf();
      result.$_set(1 as int, 77);
      let actual: number = arr.$_get(1 as int);
      let expected: int = 77;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART01__4000
     * @tc.name int16ArrayValueOfPart01Test040
     * @tc.desc Verify subarray(0, 1) valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart01Test040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([100, 200, 300]);
      let view: Int16Array = arr.subarray(0 as int, 1 as int);
      let result: Object = view.valueOf();
      result.$_set(0 as int, -1);
      let actual: number = view.$_get(0 as int);
      let expected: int = -1;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART01__4100
     * @tc.name int16ArrayValueOfPart01Test041
     * @tc.desc Verify Int16Array.from([-100, -200, -300]) valueOf result $_set(1, 0) reflects $_get(1) assertEqual 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart01Test041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.from([-100, -200, -300]);
      let result: Object = arr.valueOf();
      result.$_set(1 as int, 0);
      let actual: number = arr.$_get(1 as int);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART01__4200
     * @tc.name int16ArrayValueOfPart01Test042
     * @tc.desc Verify ArrayBuffer byteLength 1 valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart01Test042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(2);
      let arr: Int16Array = new Int16Array(buf);
      let result: Object = arr.valueOf();
      result.$_set(0 as int, 16384);
      let actual: number = arr.$_get(0 as int);
      let expected: int = 16384;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART01__4300
     * @tc.name int16ArrayValueOfPart01Test043
     * @tc.desc Verify ArrayBuffer byteLength valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart01Test043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int16Array = new Int16Array(buf);
      let result: Object = arr.valueOf();
      result.$_set(3 as int, -1);
      let actual: number = arr.$_get(3 as int);
      let expected: int = -1;
      expect(actual).assertEqual(expected);
    });

  });
}
