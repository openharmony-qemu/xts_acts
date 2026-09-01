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

export default function int16ArrayValueOfPart03Test(): void {
  describe("Int16ArrayValueOfPart03Test", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART03__0100
     * @tc.name int16ArrayValueOfPart03Test001
     * @tc.desc Verify valueOf reference $_get(-1) throws RangeError for OOB negative index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart03Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30]);
      let result = arr.valueOf();
      try {
        result.$_get(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART03__0200
     * @tc.name int16ArrayValueOfPart03Test002
     * @tc.desc Verify valueOf reference $_get(3) throws RangeError at length index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart03Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30]);
      let result = arr.valueOf();
      try {
        result.$_get(3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART03__0300
     * @tc.name int16ArrayValueOfPart03Test003
     * @tc.desc Verify empty Int16Array valueOf reference $_get(0) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart03Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array(0);
      let result = arr.valueOf();
      try {
        result.$_get(0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART03__0400
     * @tc.name int16ArrayValueOfPart03Test004
     * @tc.desc Verify empty Int16Array valueOf reference $_get(-1) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart03Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array(0);
      let result = arr.valueOf();
      try {
        result.$_get(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART03__0500
     * @tc.name int16ArrayValueOfPart03Test005
     * @tc.desc Verify single-element valueOf reference $_get(1) throws RangeError at length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart03Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([5]);
      let result = arr.valueOf();
      try {
        result.$_get(1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART03__0600
     * @tc.name int16ArrayValueOfPart03Test006
     * @tc.desc Verify single-element valueOf reference $_get(-2) throws RangeError for -length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart03Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([5]);
      let result = arr.valueOf();
      try {
        result.$_get(-2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART03__0700
     * @tc.name int16ArrayValueOfPart03Test007
     * @tc.desc Verify valueOf reference $_set(-1, 99) throws RangeError and arr[0] unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart03Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30]);
      let result = arr.valueOf();
      try {
        result.$_set(-1, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
      let actual: number = arr.$_get(0);
      let expected: int = 10;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART03__0800
     * @tc.name int16ArrayValueOfPart03Test008
     * @tc.desc Verify valueOf reference $_set(3, 99) at length throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart03Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30]);
      let result = arr.valueOf();
      try {
        result.$_set(3, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
      let actual: number = arr.$_get(2);
      let expected: int = 30;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART03__0900
     * @tc.name int16ArrayValueOfPart03Test009
     * @tc.desc Verify empty valueOf reference $_set(0, 99) throws RangeError and same ref
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart03Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array(0);
      let result = arr.valueOf();
      try {
        result.$_set(0, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART03__1000
     * @tc.name int16ArrayValueOfPart03Test010
     * @tc.desc Verify empty valueOf reference $_set(-1, 99) throws RangeError and same ref
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart03Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array(0);
      let result = arr.valueOf();
      try {
        result.$_set(-1, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART03__1100
     * @tc.name int16ArrayValueOfPart03Test011
     * @tc.desc Verify single-element valueOf $_set(1, 99) at length throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart03Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([7]);
      let result = arr.valueOf();
      try {
        result.$_set(1, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
      let actual: number = arr.$_get(0);
      let expected: int = 7;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART03__1200
     * @tc.name int16ArrayValueOfPart03Test012
     * @tc.desc Verify single-element valueOf $_set(-2, 99) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart03Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([7]);
      let result = arr.valueOf();
      try {
        result.$_set(-2, 99);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
      let actual: number = arr.$_get(0);
      let expected: int = 7;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART03__1300
     * @tc.name int16ArrayValueOfPart03Test013
     * @tc.desc Verify valueOf reference $_set(0, 32768) wraps to -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart03Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([0]);
      let result = arr.valueOf();
      result.$_set(0, 32768);
      let actual: number = arr.$_get(0);
      let expected: int = -32768;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART03__1400
     * @tc.name int16ArrayValueOfPart03Test014
     * @tc.desc Verify valueOf reference $_set(0, Double.NaN) coerces to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart03Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1]);
      let result = arr.valueOf();
      result.$_set(0, Double.NaN);
      let actual: number = arr.$_get(0);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART03__1500
     * @tc.name int16ArrayValueOfPart03Test015
     * @tc.desc Verify valueOf reference $_set(0, Double.POSITIVE_INFINITY) coerces to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart03Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1]);
      let result = arr.valueOf();
      result.$_set(0, Double.POSITIVE_INFINITY);
      let actual: number = arr.$_get(0);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART03__1600
     * @tc.name int16ArrayValueOfPart03Test016
     * @tc.desc Verify valueOf reference $_set(0, Double.NEGATIVE_INFINITY) coerces to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart03Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1]);
      let result = arr.valueOf();
      result.$_set(0, Double.NEGATIVE_INFINITY);
      let actual: number = arr.$_get(0);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART03__1700
     * @tc.name int16ArrayValueOfPart03Test017
     * @tc.desc Verify fill(32768) wrap then valueOf shared reference mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart03Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 2, 3]);
      arr.fill(32768);
      let result = arr.valueOf();
      result.$_set(0, 0);
      let actual: number = arr.$_get(0);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART03__1800
     * @tc.name int16ArrayValueOfPart03Test018
     * @tc.desc Verify fill(-32769) wrap then valueOf shared reference mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart03Test018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 2, 3]);
      arr.fill(-32769);
      let result = arr.valueOf();
      result.$_set(2, -1);
      let actual: number = arr.$_get(2);
      let expected: int = -1;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART03__1900
     * @tc.name int16ArrayValueOfPart03Test019
     * @tc.desc Verify fill(Double.NaN) then valueOf shared reference mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart03Test019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([5, 5, 5]);
      arr.fill(Double.NaN);
      let result = arr.valueOf();
      result.$_set(1, 10);
      let actual: number = arr.$_get(1);
      let expected: int = 10;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART03__2000
     * @tc.name int16ArrayValueOfPart03Test020
     * @tc.desc Verify fill(Double.POSITIVE_INFINITY) then valueOf shared reference mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart03Test020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([-3, -3, -3]);
      arr.fill(Double.POSITIVE_INFINITY);
      let result = arr.valueOf();
      let val: short = 32767;
      result.$_set(0, val);
      let actual: number = arr.$_get(0);
      let expected: int = 32767;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART03__2100
     * @tc.name int16ArrayValueOfPart03Test021
     * @tc.desc Verify fill(-Infinity) then valueOf shared reference mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart03Test021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([100, 200]);
      arr.fill(Double.NEGATIVE_INFINITY);
      let result = arr.valueOf();
      let val: short = -32768;
      result.$_set(0, val);
      let actual: number = arr.$_get(0);
      let expected: int = -32768;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART03__2200
     * @tc.name int16ArrayValueOfPart03Test022
     * @tc.desc Verify fill(0x8000) wrap then valueOf shared reference mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart03Test022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([0, 0]);
      arr.fill(0x8000);
      let result = arr.valueOf();
      result.$_set(1, 42);
      let actual: number = arr.$_get(1);
      let expected: int = 42;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART03__2300
     * @tc.name int16ArrayValueOfPart03Test023
     * @tc.desc Verify subarray(0, 0) empty view valueOf returns same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart03Test023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30]);
      let view = arr.subarray(0, 0);
      let result = view.valueOf();
      expect(result).assertEqual(view);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART03__2400
     * @tc.name int16ArrayValueOfPart03Test024
     * @tc.desc Verify subarray(0, 1) valueOf returns same view and mutation reflects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart03Test024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30]);
      let view = arr.subarray(0, 1);
      let result = view.valueOf();
      result.$_set(0, 99);
      let actual: number = view.$_get(0);
      let expected: int = 99;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART03__2500
     * @tc.name int16ArrayValueOfPart03Test025
     * @tc.desc Verify subarray end clamp valueOf returns same view and mutation reflects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart03Test025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30]);
      let view = arr.subarray(1, 100);
      let result = view.valueOf();
      result.$_set(1, 55);
      let actual: number = view.$_get(1);
      let expected: int = 55;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART03__2600
     * @tc.name int16ArrayValueOfPart03Test026
     * @tc.desc Verify with(0, 99) new array is not valueOf self-reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart03Test026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 2, 3]);
      let same = arr.valueOf();
      let changed = arr.with(0, 99);
      let isSameChangedSame: boolean = (changed === same);
      expect(isSameChangedSame).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART03__2700
     * @tc.name int16ArrayValueOfPart03Test027
     * @tc.desc Verify with(1, MIN) returns new array and original unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart03Test027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30]);
      let val: short = -32768;
      let changed = arr.with(1, val);
      let actual: number = arr.$_get(1);
      let expected: int = 20;
      expect(actual).assertEqual(expected);
      let actual2: number = changed.$_get(1);
      let expected2: int = -32768;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART03__2800
     * @tc.name int16ArrayValueOfPart03Test028
     * @tc.desc Verify with(-1, MAX) returns new array and original unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart03Test028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30]);
      let val: short = 32767;
      let changed = arr.with(-1, val);
      let actual: number = arr.$_get(2);
      let expected: int = 30;
      expect(actual).assertEqual(expected);
      let actual2: number = changed.$_get(2);
      let expected2: int = 32767;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART03__2900
     * @tc.name int16ArrayValueOfPart03Test029
     * @tc.desc Verify after with mutation original valueOf still returns self-reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart03Test029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 2, 3]);
      let same = arr.valueOf();
      expect(same).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART03__3000
     * @tc.name int16ArrayValueOfPart03Test030
     * @tc.desc Verify shared buffer view1 write visible via view2 valueOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart03Test030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let view1 = new Int16Array(buf, 0, 2);
      let view2 = new Int16Array(buf, 0, 2);
      view1.$_set(0, 999);
      let result = view2.valueOf();
      let actual: number = result.$_get(0);
      let expected: int = 999;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART03__3100
     * @tc.name int16ArrayValueOfPart03Test031
     * @tc.desc Verify offset views and valueOf reference mutation on view2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart03Test031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(6);
      let view1 = new Int16Array(buf, 0, 1);
      let view2 = new Int16Array(buf, 2, 2);
      view1.$_set(0, 555);
      let result = view2.valueOf();
      result.$_set(0, -1);
      let actual: number = view2.$_get(0);
      let expected: int = -1;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART03__3200
     * @tc.name int16ArrayValueOfPart03Test032
     * @tc.desc Verify parent write visible on subarray valueOf shared view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart03Test032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30, 40]);
      let view = arr.subarray(1, 3);
      arr.$_set(1, 999);
      let result = view.valueOf();
      let actual: number = result.$_get(0);
      let expected: int = 999;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART03__3300
     * @tc.name int16ArrayValueOfPart03Test033
     * @tc.desc Verify subarray valueOf mutation reflects on parent array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart03Test033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30, 40]);
      let view = arr.subarray(1, 3);
      let result = view.valueOf();
      result.$_set(1, 777);
      let actual: number = arr.$_get(2);
      let expected: int = 777;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART03__3400
     * @tc.name int16ArrayValueOfPart03Test034
     * @tc.desc Verify nested subarray valueOf returns innermost view reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart03Test034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 2, 3, 4, 5, 6, 7, 8]);
      let s1 = arr.subarray(0, 6);
      let s2 = s1.subarray(1, 5);
      let s3 = s2.subarray(1, 3);
      let result = s3.valueOf();
      result.$_set(0, 99);
      let actual: number = s3.$_get(0);
      let expected: int = 99;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART03__3500
     * @tc.name int16ArrayValueOfPart03Test035
     * @tc.desc Verify parent and child valueOf refs share buffer mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart03Test035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([10, 20, 30]);
      let view = arr.subarray(0, 2);
      let parentResult = arr.valueOf();
      let childResult = view.valueOf();
      childResult.$_set(0, 88);
      let actual: number = parentResult.$_get(0);
      let expected: int = 88;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART03__3600
     * @tc.name int16ArrayValueOfPart03Test036
     * @tc.desc Verify empty Int16Array valueOf returns self-reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart03Test036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array(0);
      let result = arr.valueOf();
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART03__3700
     * @tc.name int16ArrayValueOfPart03Test037
     * @tc.desc Verify valueOf reference fill reverse sort chain mutates original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart03Test037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([3, -5, 0, 100]);
      let result = arr.valueOf();
      result.fill(0).reverse().sort();
      let actual: number = arr.$_get(0);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART03__3800
     * @tc.name int16ArrayValueOfPart03Test038
     * @tc.desc Verify valueOf reference set then $_set both mutate original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart03Test038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([0, 0, 0, 0]);
      let result = arr.valueOf();
      result.set(Int16Array.of(10, 20));
      result.$_set(2, 30);
      let actual: number = arr.$_get(2);
      let expected: int = 30;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART03__3900
     * @tc.name int16ArrayValueOfPart03Test039
     * @tc.desc Verify valueOf reference copyWithin mutates original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart03Test039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array([1, 2, 3, 4, 5]);
      let result = arr.valueOf();
      result.copyWithin(0, 3);
      let actual: number = arr.$_get(0);
      let expected: int = 4;
      expect(actual).assertEqual(expected);
    });

  });
}
