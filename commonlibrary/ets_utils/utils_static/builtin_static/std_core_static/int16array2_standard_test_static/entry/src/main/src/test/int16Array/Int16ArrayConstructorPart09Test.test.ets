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

export default function int16ArrayConstructorPart09Test(): void {
  describe("Int16ArrayConstructorPart09Test", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART09__0100
     * @tc.name int16ArrayConstructorPart09Test001
     * @tc.desc Verify new Int16Array(buf, 0) creates view with length 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart09Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Int16Array(buf, 0);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART09__0200
     * @tc.name int16ArrayConstructorPart09Test002
     * @tc.desc Verify new Int16Array(1-byte ArrayBuffer, 0) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("int16ArrayConstructorPart09Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(1);
      try {
        const arr = new Int16Array(buf, 0);
        expect().assertFail();
      } catch (e) {
        let actual: string = e.name;
        let expected: string = 'RangeError';
        expect(actual).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART09__0300
     * @tc.name int16ArrayConstructorPart09Test003
     * @tc.desc Verify new Int16Array from another Int16Array.buffer shares underlying data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart09Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array(4);
      src.$_set(0, 42);
      const buf = src.buffer;
      const arr = new Int16Array(buf, 0);
      let actual: number = arr.$_get(0);
      let expected: int = 42;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART09__0400
     * @tc.name int16ArrayConstructorPart09Test004
     * @tc.desc Verify new Int16Array(buf, 0) buffer property is same ArrayBuffer reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart09Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Int16Array(buf, 0);
      let actual: boolean = arr.buffer === buf;
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART09__0500
     * @tc.name int16ArrayConstructorPart09Test005
     * @tc.desc Verify new Int16Array(buf, 2) byteLength equals buf.byteLength minus offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart09Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Int16Array(buf, 2);
      let actual: int = arr.byteLength;
      let expected: int = 6;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART09__0600
     * @tc.name int16ArrayConstructorPart09Test006
     * @tc.desc Verify new Int16Array(buf, 0) satisfies byteLength equals length times 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart09Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Int16Array(buf, 0);
      let actual: int = arr.byteLength;
      let expected: number = arr.length * 2;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART09__0700
     * @tc.name int16ArrayConstructorPart09Test007
     * @tc.desc Verify new Int16Array(buf, 0) all elements default to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart09Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Int16Array(buf, 0);
      let actual: number = arr.$_get(0);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: number = arr.$_get(1);
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(2);
      let expected3: int = 0;
      expect(actual3).assertEqual(expected3);
      let actual4: number = arr.$_get(3);
      let expected4: int = 0;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART09__0800
     * @tc.name int16ArrayConstructorPart09Test008
     * @tc.desc Verify new Int16Array(buf, byteLength) length and byteLength are both 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart09Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Int16Array(buf, 8);
      let actual: int = arr.length;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: int = arr.byteLength;
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART09__0900
     * @tc.name int16ArrayConstructorPart09Test009
     * @tc.desc Verify new Int16Array(buf, 0) buffer.byteLength equals 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart09Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Int16Array(buf, 0);
      expect(arr.buffer.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART09__1000
     * @tc.name int16ArrayConstructorPart09Test010
     * @tc.desc Verify new Int16Array(buf, 2) buffer.byteLength equals original buf.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart09Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Int16Array(buf, 2);
      let actual: int = arr.buffer.byteLength;
      let expected: int = 8;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART09__1100
     * @tc.name int16ArrayConstructorPart09Test011
     * @tc.desc Verify new Int16Array(buf, 0) $_get(0) returns default value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart09Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Int16Array(buf, 0);
      let actual: int = arr.$_get(0);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART09__1200
     * @tc.name int16ArrayConstructorPart09Test012
     * @tc.desc Verify new Int16Array(10-byte buf, 2) byteOffset is 2 and length is 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart09Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(10);
      const arr = new Int16Array(buf, 2);
      let actual: int = arr.byteOffset;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
      let actual2: int = arr.length;
      let expected2: int = 4;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART09__1300
     * @tc.name int16ArrayConstructorPart09Test013
     * @tc.desc Verify new Int16Array shared buffer write is visible on second view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart09Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view1 = new Int16Array(buf, 0);
      view1.$_set(0, 42);
      const view2 = new Int16Array(buf, 0);
      let actual: number = view2.$_get(0);
      let expected: int = 42;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART09__1400
     * @tc.name int16ArrayConstructorPart09Test014
     * @tc.desc Verify new Int16Array shared buffer write does not change view length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart09Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view1 = new Int16Array(buf, 0);
      const view2 = new Int16Array(buf, 0);
      view1.$_set(0, 88);
      let actual: int = view2.length;
      let expected: int = 4;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART09__1500
     * @tc.name int16ArrayConstructorPart09Test015
     * @tc.desc Verify new Int16Array non-overlapping offset writes do not affect each other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart09Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view1 = new Int16Array(buf, 0);
      const view2 = new Int16Array(buf, 4);
      view1.$_set(0, 55);
      view2.$_set(1, 66);
      let actual: number = view1.$_get(0);
      let expected: int = 55;
      expect(actual).assertEqual(expected);
      let actual2: number = view2.$_get(1);
      let expected2: int = 66;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART09__1600
     * @tc.name int16ArrayConstructorPart09Test016
     * @tc.desc Verify new Int16Array from Int16Array.buffer shares data values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart09Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array(4);
      src.$_set(0, 33);
      const buf = src.buffer;
      const view = new Int16Array(buf, 0);
      let actual: number = view.$_get(0);
      let expected: int = 33;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART09__1700
     * @tc.name int16ArrayConstructorPart09Test017
     * @tc.desc Verify new Int16Array buffer-sharing view observes source array mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart09Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array(4);
      src.$_set(0, 33);
      const buf = src.buffer;
      const view = new Int16Array(buf, 0);
      src.$_set(0, 77);
      let actual: number = view.$_get(0);
      let expected: int = 77;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART09__1800
     * @tc.name int16ArrayConstructorPart09Test018
     * @tc.desc Verify new Int16Array view mutation is observed by source array via buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart09Test018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array(4);
      src.$_set(0, 33);
      const buf = src.buffer;
      const view = new Int16Array(buf, 0);
      view.$_set(0, 99);
      let actual: number = src.$_get(0);
      let expected: int = 99;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART09__1900
     * @tc.name int16ArrayConstructorPart09Test019
     * @tc.desc Verify new Int16Array three views chain-propagate write on shared buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart09Test019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view1 = new Int16Array(buf, 0);
      const view2 = new Int16Array(buf, 0);
      const view3 = new Int16Array(buf, 0);
      view1.$_set(0, 11);
      let actual: number = view2.$_get(0);
      let expected: int = 11;
      expect(actual).assertEqual(expected);
      let actual2: number = view3.$_get(0);
      let expected2: int = 11;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART09__2000
     * @tc.name int16ArrayConstructorPart09Test020
     * @tc.desc Verify new Int16Array after shared write buffer.byteLength remains unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart09Test020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view1 = new Int16Array(buf, 0);
      view1.$_set(0, 55);
      const view2 = new Int16Array(buf, 0);
      let actual: int = view2.buffer.byteLength;
      let expected: int = 8;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART09__2100
     * @tc.name int16ArrayConstructorPart09Test021
     * @tc.desc Verify new Int16Array after write other view byteOffset remains unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart09Test021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view1 = new Int16Array(buf, 2);
      const view2 = new Int16Array(buf, 2);
      view1.$_set(0, 42);
      let actual: int = view2.byteOffset;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART09__2200
     * @tc.name int16ArrayConstructorPart09Test022
     * @tc.desc Verify new Int16Array overlapping write leaves independent region intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart09Test022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const view1 = new Int16Array(buf, 0);
      const view2 = new Int16Array(buf, 6);
      view1.$_set(0, 10);
      view1.$_set(1, 20);
      view1.$_set(2, 30);
      view2.$_set(0, 99);
      let actual: number = view1.$_get(0);
      let expected: int = 10;
      expect(actual).assertEqual(expected);
      let actual2: number = view1.$_get(1);
      let expected2: int = 20;
      expect(actual2).assertEqual(expected2);
      let actual3: number = view1.$_get(2);
      let expected3: int = 30;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART09__2300
     * @tc.name int16ArrayConstructorPart09Test023
     * @tc.desc Verify new Int16Array shared write of NaN converts to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart09Test023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view1 = new Int16Array(buf, 0);
      const view2 = new Int16Array(buf, 0);
      view1.$_set(0, Double.NaN);
      let actual: number = view2.$_get(0);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART09__2400
     * @tc.name int16ArrayConstructorPart09Test024
     * @tc.desc Verify new Int16Array shared write of Infinity converts to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart09Test024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view1 = new Int16Array(buf, 0);
      const view2 = new Int16Array(buf, 0);
      view1.$_set(0, Double.POSITIVE_INFINITY);
      let actual: number = view2.$_get(0);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART09__2500
     * @tc.name int16ArrayConstructorPart09Test025
     * @tc.desc Verify new Int16Array multi-index write is fully visible on second view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart09Test025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view1 = new Int16Array(buf, 0);
      view1.$_set(0, 1);
      view1.$_set(1, 2);
      view1.$_set(2, 3);
      view1.$_set(3, 4);
      const view2 = new Int16Array(buf, 0);
      let actual: number = view2.$_get(0);
      let expected: int = 1;
      expect(actual).assertEqual(expected);
      let actual2: number = view2.$_get(1);
      let expected2: int = 2;
      expect(actual2).assertEqual(expected2);
      let actual3: number = view2.$_get(2);
      let expected3: int = 3;
      expect(actual3).assertEqual(expected3);
      let actual4: number = view2.$_get(3);
      let expected4: int = 4;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART09__2600
     * @tc.name int16ArrayConstructorPart09Test026
     * @tc.desc Verify new Int16Array different offsets write produce correct buffer data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart09Test026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view1 = new Int16Array(buf, 0);
      const view2 = new Int16Array(buf, 2);
      view1.$_set(0, 100);
      view2.$_set(0, 200);
      const view3 = new Int16Array(buf, 0);
      let actual: number = view3.$_get(0);
      let expected: int = 100;
      expect(actual).assertEqual(expected);
      let actual2: number = view3.$_get(1);
      let expected2: int = 200;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART09__2700
     * @tc.name int16ArrayConstructorPart09Test027
     * @tc.desc Verify new Int16Array $_get out of bounds throws RangeError without buffer change
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart09Test027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view1 = new Int16Array(buf, 0);
      view1.$_set(0, 99);
      try {
        view1.$_get(10);
        expect().assertFail();
      } catch (e) {
        let actual: string = e.name;
        let expected: string = "RangeError";
        expect(actual).assertEqual(expected);
      }
      const view2 = new Int16Array(buf, 0);
      let actual2: number = view2.$_get(0);
      let expected2: int = 99;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART09__2800
     * @tc.name int16ArrayConstructorPart09Test028
     * @tc.desc Verify new Int16Array $_set out of bounds throws RangeError without buffer change
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart09Test028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const view1 = new Int16Array(buf, 0);
      view1.$_set(0, 42);
      try {
        view1.$_set(5, 999);
        expect().assertFail();
      } catch (e) {
        let actual: string = e.name;
        let expected: string = "RangeError";
        expect(actual).assertEqual(expected);
      }
      const view2 = new Int16Array(buf, 0);
      let actual2: number = view2.$_get(0);
      let expected2: int = 42;
      expect(actual2).assertEqual(expected2);
      let actual3: number = view2.$_get(1);
      let expected3: int = 0;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART09__2900
     * @tc.name int16ArrayConstructorPart09Test029
     * @tc.desc Verify new Int16Array from populated buffer offset 0 reads all data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart09Test029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nums: Array<int> = [10, 20, 30, 40];
      const src = new Int16Array(nums);
      const buf = src.buffer;
      const view = new Int16Array(buf, 0);
      let actual: number = view.$_get(0);
      let expected: int = 10;
      expect(actual).assertEqual(expected);
      let actual2: number = view.$_get(3);
      let expected2: int = 40;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART09__3000
     * @tc.name int16ArrayConstructorPart09Test030
     * @tc.desc Verify new Int16Array from populated buffer offset 2 reads partial data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart09Test030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nums: Array<int> = [10, 20, 30, 40];
      const src = new Int16Array(nums);
      const buf = src.buffer;
      const view = new Int16Array(buf, 2);
      let actual: number = view.$_get(0);
      let expected: int = 20;
      expect(actual).assertEqual(expected);
      let actual2: number = view.$_get(2);
      let expected2: int = 40;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART09__3100
     * @tc.name int16ArrayConstructorPart09Test031
     * @tc.desc Verify new Int16Array(empty buffer, 0) length and byteLength are both 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart09Test031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(0);
      const arr = new Int16Array(buf, 0);
      let actual: int = arr.length;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: int = arr.byteLength;
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART09__3200
     * @tc.name int16ArrayConstructorPart09Test032
     * @tc.desc Verify new Int16Array(2B buf, 0) byteLength is 2 and length is 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart09Test032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(2);
      const arr = new Int16Array(buf, 0);
      let actual: int = arr.byteLength;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
      let actual2: int = arr.length;
      let expected2: int = 1;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART09__3300
     * @tc.name int16ArrayConstructorPart09Test033
     * @tc.desc Verify new Int16Array(6B buf, 2) byteLength is 4 and length is 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart09Test033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(6);
      const arr = new Int16Array(buf, 2);
      let actual: int = arr.byteLength;
      let expected: int = 4;
      expect(actual).assertEqual(expected);
      let actual2: int = arr.length;
      let expected2: int = 2;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART09__3400
     * @tc.name int16ArrayConstructorPart09Test034
     * @tc.desc Verify new Int16Array buffer, byteOffset and length relationship consistency
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart09Test034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(14);
      const arr = new Int16Array(buf, 6);
      let actual: int = arr.byteOffset;
      let expected: int = 6;
      expect(actual).assertEqual(expected);
      let actual2: int = arr.byteLength;
      let expected2: int = 8;
      expect(actual2).assertEqual(expected2);
      let actual3: int = arr.length;
      let expected3: int = 4;
      expect(actual3).assertEqual(expected3);
      let actual4: int = arr.buffer.byteLength;
      let expected4: int = 14;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART09__3500
     * @tc.name int16ArrayConstructorPart09Test035
     * @tc.desc Verify new Int16Array after writes new views from same buffer see consistent data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart09Test035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view1 = new Int16Array(buf, 0);
      view1.$_set(0, 55);
      view1.$_set(1, 66);
      const view2 = new Int16Array(buf, 0);
      const view3 = new Int16Array(buf, 2);
      let actual: number = view2.$_get(0);
      let expected: int = 55;
      expect(actual).assertEqual(expected);
      let actual2: number = view3.$_get(0);
      let expected2: int = 66;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART09__3600
     * @tc.name int16ArrayConstructorPart09Test036
     * @tc.desc Verify new Int16Array(buf, 0) can store full int16 range and read back
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart09Test036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Int16Array(buf, 0);
      let valMin:short = -32768
      let valMax:short = 32767
      arr.$_set(0, valMin);
      arr.$_set(1, -1);
      arr.$_set(2, 0);
      arr.$_set(3, valMax);
      let actual: number = arr.$_get(0);
      let expected: int = -32768;
      expect(actual).assertEqual(expected);
      let actual2: number = arr.$_get(1);
      let expected2: int = -1;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(2);
      let expected3: int = 0;
      expect(actual3).assertEqual(expected3);
      let actual4: number = arr.$_get(3);
      let expected4: int = 32767;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART09__3700
     * @tc.name int16ArrayConstructorPart09Test037
     * @tc.desc Verify new Int16Array operations do not change original buffer.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart09Test037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Int16Array(buf, 2);
      const origLen = buf.byteLength;
      arr.$_set(0, 99);
      let actual: int = buf.byteLength;
      let expected: number = origLen;
      expect(actual).assertEqual(expected);
    });

  });
}
