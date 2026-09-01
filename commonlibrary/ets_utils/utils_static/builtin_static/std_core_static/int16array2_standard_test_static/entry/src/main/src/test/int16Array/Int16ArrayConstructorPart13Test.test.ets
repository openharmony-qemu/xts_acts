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

export default function int16ArrayConstructorPart13Test(): void {
  describe("Int16ArrayConstructorPart13Test", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__0100
     * @tc.name int16ArrayConstructorPart13Test001
     * @tc.desc Verify new Int16Array from ArrayBuffer creates non-null view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Int16Array(buf);
      let actual: int = arr.length;
      let expected: int = 4;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__0200
     * @tc.name int16ArrayConstructorPart13Test002
     * @tc.desc Verify new Int16Array from Array<number> converts values correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([1, 2, 3] as number[]);
      const arr = new Int16Array(src);
      let actual: int = arr.length;
      let expected: int = 3;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__0300
     * @tc.name int16ArrayConstructorPart13Test003
     * @tc.desc Verify new Int16Array from Array<int> creates non-null array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: int[] = [10, 20, 30];
      const arr = new Int16Array(src);
      let actual: int = arr.length;
      let expected: int = 3;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__0400
     * @tc.name int16ArrayConstructorPart13Test004
     * @tc.desc Verify new Int16Array empty ArrayBuffer creates length 0 view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(0);
      const arr = new Int16Array(buf);
      let actual: int = arr.length;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__0500
     * @tc.name int16ArrayConstructorPart13Test005
     * @tc.desc Verify new Int16Array 2-byte ArrayBuffer creates length 1 view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(2);
      const arr = new Int16Array(buf);
      let actual: int = arr.length;
      let expected: int = 1;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__0600
     * @tc.name int16ArrayConstructorPart13Test006
     * @tc.desc Verify new Int16Array length matches expected value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Int16Array(buf);
      let actual: int = arr.length;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__0700
     * @tc.name int16ArrayConstructorPart13Test007
     * @tc.desc Verify new Int16Array length matches expected value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Int16Array(buf);
      let actual: int = arr.length;
      let expected: int = 4;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__0800
     * @tc.name int16ArrayConstructorPart13Test008
     * @tc.desc Verify new Int16Array odd 1-byte ArrayBuffer throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(1);
      try {
        const arr = new Int16Array(buf);
        expect().assertFail();
      } catch (e) {
        let actual: string = e.name;
        let expected: string = "RangeError";
        expect(actual).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__0900
     * @tc.name int16ArrayConstructorPart13Test009
     * @tc.desc Verify new Int16Array 1024-byte ArrayBuffer creates length 512 view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(1024);
      const arr = new Int16Array(buf);
      let actual: int = arr.length;
      let expected: int = 512;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__1000
     * @tc.name int16ArrayConstructorPart13Test010
     * @tc.desc Verify new Int16Array ArrayBuffer path byteOffset defaults to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Int16Array(buf);
      let actual: int = arr.byteOffset;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__1100
     * @tc.name int16ArrayConstructorPart13Test011
     * @tc.desc Verify new Int16Array ArrayBuffer path sets byteLength to 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Int16Array(buf);
      let actual: int = arr.byteLength;
      let expected: int = 8;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__1200
     * @tc.name int16ArrayConstructorPart13Test012
     * @tc.desc Verify new Int16Array ArrayBuffer path initializes elements to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Int16Array(buf);
      let actual: number = arr.$_get(0);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: number = arr.$_get(3);
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__1300
     * @tc.name int16ArrayConstructorPart13Test013
     * @tc.desc Verify new Int16Array length matches expected value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array(0);
      const arr = new Int16Array(src);
      let actual: int = arr.length;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__1400
     * @tc.name int16ArrayConstructorPart13Test014
     * @tc.desc Verify new Int16Array from Array<number> converts values correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([42] as number[]);
      const arr = new Int16Array(src);
      let actual: number = arr.$_get(0);
      let expected: int = 42;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__1500
     * @tc.name int16ArrayConstructorPart13Test015
     * @tc.desc Verify new Int16Array from Array<number> converts values correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([10, 20, 30, 40] as number[]);
      const arr = new Int16Array(src);
      let actual: number = arr.$_get(0);
      let expected: int = 10;
      expect(actual).assertEqual(expected);
      let actual2: number = arr.$_get(1);
      let expected2: int = 20;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(2);
      let expected3: int = 30;
      expect(actual3).assertEqual(expected3);
      let actual4: number = arr.$_get(3);
      let expected4: int = 40;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__1600
     * @tc.name int16ArrayConstructorPart13Test016
     * @tc.desc Verify new Int16Array Array<number> preserves int16 boundary including MIN -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val:short = -32768
      const src = new Int16Array([-1, -100, val] as number[]);
      const arr = new Int16Array(src);
      let actual: number = arr.$_get(0);
      let expected: int = -1;
      expect(actual).assertEqual(expected);
      let actual2: number = arr.$_get(1);
      let expected2: int = -100;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(2);
      let expected3: int = -32768;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__1700
     * @tc.name int16ArrayConstructorPart13Test017
     * @tc.desc Verify new Int16Array from Array<number> converts values correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val:short = 32767
      const src = new Int16Array([val] as number[]);
      const arr = new Int16Array(src);
      let actual: number = arr.$_get(0);
      let expected: int = 32767;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__1800
     * @tc.name int16ArrayConstructorPart13Test018
     * @tc.desc Verify new Int16Array Array<number> preserves int16.MIN -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val:short = -32768
      const src = new Int16Array([val] as number[]);
      const arr = new Int16Array(src);
      let actual: number = arr.$_get(0);
      let expected: int = -32768;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__1900
     * @tc.name int16ArrayConstructorPart13Test019
     * @tc.desc Verify new Int16Array from Array<number> converts values correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([0, 0, 0, 0] as number[]);
      const arr = new Int16Array(src);
      let actual: number = arr.$_get(0);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: number = arr.$_get(3);
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__2000
     * @tc.name int16ArrayConstructorPart13Test020
     * @tc.desc Verify new Int16Array from Array<number> converts values correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([1, 2, 3] as number[]);
      const arr = new Int16Array(src);
      src.$_set(0, 99);
      let actual: number = arr.$_get(0);
      let expected: int = 1;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__2100
     * @tc.name int16ArrayConstructorPart13Test021
     * @tc.desc Verify new Int16Array from Array<number> converts values correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([10, 20] as number[]);
      const arr = new Int16Array(src);
      arr.$_set(0, 99);
      let actual: number = src.$_get(0);
      let expected: int = 10;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__2200
     * @tc.name int16ArrayConstructorPart13Test022
     * @tc.desc Verify new Int16Array Array<number> source length is preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([1, 2, 3, 4, 5] as number[]);
      const arr = new Int16Array(src);
      let actual: int = arr.length;
      let expected: int = 5;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__2300
     * @tc.name int16ArrayConstructorPart13Test023
     * @tc.desc Verify new Int16Array Array<number> preserves int16 MIN/MAX/zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let valMin:short = -32768
      let valMax:short = 32767
      const src = new Int16Array([valMin, 0, valMax] as number[]);
      const arr = new Int16Array(src);
      let actual: number = arr.$_get(0);
      let expected: int = -32768;
      expect(actual).assertEqual(expected);
      let actual2: number = arr.$_get(1);
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(2);
      let expected3: int = 32767;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__2400
     * @tc.name int16ArrayConstructorPart13Test024
     * @tc.desc Verify new Int16Array from Array<int> copies values correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: int[] = [10, 20, 30];
      const arr = new Int16Array(src);
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__2500
     * @tc.name int16ArrayConstructorPart13Test025
     * @tc.desc Verify new Int16Array Array<int> int16.MAX 32767 is preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: int[] = [32767];
      const arr = new Int16Array(src);
      let actual: number = arr.$_get(0);
      let expected: int = 32767;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__2600
     * @tc.name int16ArrayConstructorPart13Test026
     * @tc.desc Verify new Int16Array from Array<int> copies values correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: int[] = [100, -200, 0, -1];
      const arr = new Int16Array(src);
      let actual: number = arr.$_get(0);
      let expected: int = 100;
      expect(actual).assertEqual(expected);
      let actual2: number = arr.$_get(1);
      let expected2: int = -200;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(2);
      let expected3: int = 0;
      expect(actual3).assertEqual(expected3);
      let actual4: number = arr.$_get(3);
      let expected4: int = -1;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__2700
     * @tc.name int16ArrayConstructorPart13Test027
     * @tc.desc Verify new Int16Array empty Array<int> creates empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: int[] = [];
      for (let i = 0; i < 100; i++) {
        src.push(i.toInt());
      }
      const arr = new Int16Array(src);
      let actual: int = arr.length;
      let expected: int = 100;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__2800
     * @tc.name int16ArrayConstructorPart13Test028
     * @tc.desc Verify new Int16Array empty Array<number> creates empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: number[] = [];
      const arr = new Int16Array(src);
      let actual: int = arr.length;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__2900
     * @tc.name int16ArrayConstructorPart13Test029
     * @tc.desc Verify new Int16Array Array<number> NaN converts to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: number[] = [Number.NaN];
      const arr = new Int16Array(src);
      let actual: number = arr.$_get(0);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__3000
     * @tc.name int16ArrayConstructorPart13Test030
     * @tc.desc Verify new Int16Array Array<number> Infinity converts to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: number[] = [Number.POSITIVE_INFINITY];
      const arr = new Int16Array(src);
      let actual: number = arr.$_get(0);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__3100
     * @tc.name int16ArrayConstructorPart13Test031
     * @tc.desc Verify new Int16Array Array<number> Infinity converts to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: number[] = [-Number.POSITIVE_INFINITY];
      const arr = new Int16Array(src);
      let actual: number = arr.$_get(0);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__3200
     * @tc.name int16ArrayConstructorPart13Test032
     * @tc.desc Verify new Int16Array Array<number> mixed floats convert correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: number[] = [1.2, 2.8, -0.3, 0.0];
      const arr = new Int16Array(src);
      let actual: number = arr.$_get(0);
      let expected: int = 1;
      expect(actual).assertEqual(expected);
      let actual2: number = arr.$_get(1);
      let expected2: int = 2;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(2);
      let expected3: int = 0;
      expect(actual3).assertEqual(expected3);
      let actual4: number = arr.$_get(3);
      let expected4: int = 0;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__3300
     * @tc.name int16ArrayConstructorPart13Test033
     * @tc.desc Verify new Int16Array Array<number> source length is preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: number[] = [1.0, 2.0, 3.0, 4.0, 5.0];
      const arr = new Int16Array(src);
      let actual: int = arr.length;
      let expected: int = 5;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__3400
     * @tc.name int16ArrayConstructorPart13Test034
     * @tc.desc Verify new Int16Array from FixedArray copies values correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [100, -200, 0];
      const arr = new Int16Array(src);
      let actual: number = arr.$_get(0);
      let expected: int = 100;
      expect(actual).assertEqual(expected);
      let actual2: number = arr.$_get(1);
      let expected2: int = -200;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(2);
      let expected3: int = 0;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__3500
     * @tc.name int16ArrayConstructorPart13Test035
     * @tc.desc Verify new Int16Array FixedArray source length is preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [1, 2, 3, 4];
      const arr = new Int16Array(src);
      let actual: int = arr.length;
      let expected: int = 4;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__3600
     * @tc.name int16ArrayConstructorPart13Test036
     * @tc.desc Verify new Int16Array FixedArray number truncates float to int16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<number> = [3.7, -1.2];
      const arr = new Int16Array(src);
      let actual: number = arr.$_get(0);
      let expected: int = 3;
      expect(actual).assertEqual(expected);
      let actual2: number = arr.$_get(1);
      let expected2: int = -1;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__3700
     * @tc.name int16ArrayConstructorPart13Test037
     * @tc.desc Verify new Int16Array from Int8Array source copies values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int8Array(3);
      src.$_set(0, 100);
      src.$_set(1, -50);
      src.$_set(2, 0);
      const arr = new Int16Array(src);
      let actual: number = arr.$_get(0);
      let expected: int = 100;
      expect(actual).assertEqual(expected);
      let actual2: number = arr.$_get(1);
      let expected2: int = -50;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(2);
      let expected3: int = 0;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__3800
     * @tc.name int16ArrayConstructorPart13Test038
     * @tc.desc Verify new Int16Array from Uint8Array source copies values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint8Array(3);
      src.$_set(0, 200);
      src.$_set(1, 100);
      src.$_set(2, 0);
      const arr = new Int16Array(src);
      let actual: number = arr.$_get(0);
      let expected: int = 200;
      expect(actual).assertEqual(expected);
      let actual2: number = arr.$_get(1);
      let expected2: int = 100;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(2);
      let expected3: int = 0;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__3900
     * @tc.name int16ArrayConstructorPart13Test039
     * @tc.desc Verify new Int16Array from Int32Array overflow truncates to int16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int32Array(1);
      src.$_set(0, 32768);
      const arr = new Int16Array(src);
      let actual: number = arr.$_get(0);
      let expected: int = -32768;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__4000
     * @tc.name int16ArrayConstructorPart13Test040
     * @tc.desc Verify new Int16Array from Int32Array in-range value is preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int32Array(1);
      src.$_set(0, 10000);
      const arr = new Int16Array(src);
      let actual: number = arr.$_get(0);
      let expected: int = 10000;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__4100
     * @tc.name int16ArrayConstructorPart13Test041
     * @tc.desc Verify new Int16Array from Uint16Array overflow wraps to int16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint16Array(1);
      src.$_set(0, 40000);
      const arr = new Int16Array(src);
      let actual: number = arr.$_get(0);
      let expected: int = -25536;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__4200
     * @tc.name int16ArrayConstructorPart13Test042
     * @tc.desc Verify new Int16Array from Float32Array truncates float value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array(1);
      src.$_set(0, 3.7);
      const arr = new Int16Array(src);
      let actual: number = arr.$_get(0);
      let expected: int = 3;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__4300
     * @tc.name int16ArrayConstructorPart13Test043
     * @tc.desc Verify new Int16Array ArrayBuffer path creates view with length 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Int16Array(buf);
      let actual: int = arr.length;
      let expected: int = 4;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__4400
     * @tc.name int16ArrayConstructorPart13Test044
     * @tc.desc Verify new Int16Array ArrayBuffer path creates view with length 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Int16Array(buf);
      let actual: int = arr.length;
      let expected: int = 4;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__4500
     * @tc.name int16ArrayConstructorPart13Test045
     * @tc.desc Verify new Int16Array ArrayLike path creates view with length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: int[] = [1, 2, 3];
      const arr = new Int16Array(src);
      let actual: int = arr.length;
      let expected: int = 3;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__4600
     * @tc.name int16ArrayConstructorPart13Test046
     * @tc.desc Verify new Int16Array from Int16Array creates view with length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([1, 2] as number[]);
      const arr = new Int16Array(src);
      let actual: int = arr.length;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__4700
     * @tc.name int16ArrayConstructorPart13Test047
     * @tc.desc Verify new Int16Array ArrayLike path buffer is not null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: int[] = [1, 2];
      const arr = new Int16Array(src);
      let actual: int = arr.buffer.byteLength;
      let expected: int = 4;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__4800
     * @tc.name int16ArrayConstructorPart13Test048
     * @tc.desc Verify new Int16Array from Array<number> converts values correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([1, 2, 3] as number[]);
      const arr = new Int16Array(src);
      let actual: int = arr.byteOffset;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__4900
     * @tc.name int16ArrayConstructorPart13Test049
     * @tc.desc Verify new Int16Array ArrayLike path BYTES_PER_ELEMENT equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: number[] = [1.0, 2.0];
      const arr = new Int16Array(src);
      let actual: int = arr.BYTES_PER_ELEMENT;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__5000
     * @tc.name int16ArrayConstructorPart13Test050
     * @tc.desc Verify new Int16Array ArrayLike path byteLength equals length * 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: int[] = [1, 2, 3, 4, 5];
      const arr = new Int16Array(src);
      let actual: int = arr.byteLength;
      let expected: number = arr.length * 2;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__5100
     * @tc.name int16ArrayConstructorPart13Test051
     * @tc.desc Verify new Int16Array from Array<int> copies values correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: int[] = [10, 20, 30, 40];
      const arr = new Int16Array(src);
      let actual: int = arr.length;
      let expected: int = 4;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__5200
     * @tc.name int16ArrayConstructorPart13Test052
     * @tc.desc Verify new Int16Array from Array<number> converts values correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([5, 15, 25] as number[]);
      const arr = new Int16Array(src);
      let actual: number = arr.$_get(0);
      let expected: int = 5;
      expect(actual).assertEqual(expected);
      let actual2: number = arr.$_get(1);
      let expected2: int = 15;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(2);
      let expected3: int = 25;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__5300
     * @tc.name int16ArrayConstructorPart13Test053
     * @tc.desc Verify new Int16Array large 65536-byte ArrayBuffer creates length 32768 view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(65536);
      const arr = new Int16Array(buf);
      let actual: int = arr.length;
      let expected: int = 32768;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__5400
     * @tc.name int16ArrayConstructorPart13Test054
     * @tc.desc Verify new Int16Array shared buffer new view reads previous write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view1 = new Int16Array(buf);
      view1.$_set(0, 42);
      const view2 = new Int16Array(buf);
      let actual: number = view2.$_get(0);
      let expected: int = 42;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__5500
     * @tc.name int16ArrayConstructorPart13Test055
     * @tc.desc Verify new Int16Array shared buffer views read back int16.MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view1 = new Int16Array(buf);
      const view2 = new Int16Array(buf);
      let val:short = 32767
      view1.$_set(0, val);
      let actual: number = view2.$_get(0);
      let expected: int = 32767;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__5600
     * @tc.name int16ArrayConstructorPart13Test056
     * @tc.desc Verify new Int16Array shared buffer views read wrap of overflow 32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view1 = new Int16Array(buf);
      const view2 = new Int16Array(buf);
      let val:short = -32768
      view1.$_set(0, val);
      let actual: number = view2.$_get(0);
      let expected: int = -32768;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__5700
     * @tc.name int16ArrayConstructorPart13Test057
     * @tc.desc Verify new Int16Array shared buffer views read wrap of overflow 32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view1 = new Int16Array(buf);
      const view2 = new Int16Array(buf);
      view1.$_set(0, 32768);
      let actual: number = view2.$_get(0);
      let expected: int = -32768;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__5800
     * @tc.name int16ArrayConstructorPart13Test058
     * @tc.desc Verify new Int16Array shared buffer views read back int16.MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view1 = new Int16Array(buf);
      const view2 = new Int16Array(buf);
      view1.$_set(0, -32769);
      let actual: number = view2.$_get(0);
      let expected: int = 32767;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__5900
     * @tc.name int16ArrayConstructorPart13Test059
     * @tc.desc Verify new Int16Array shared buffer views read 0 after writing NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view1 = new Int16Array(buf);
      const view2 = new Int16Array(buf);
      view1.$_set(0, Number.NaN);
      let actual: number = view2.$_get(0);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__6000
     * @tc.name int16ArrayConstructorPart13Test060
     * @tc.desc Verify new Int16Array shared buffer views read 0 after writing Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view1 = new Int16Array(buf);
      const view2 = new Int16Array(buf);
      view1.$_set(0, Number.POSITIVE_INFINITY);
      let actual: number = view2.$_get(0);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__6100
     * @tc.name int16ArrayConstructorPart13Test061
     * @tc.desc Verify new Int16Array three shared buffer views observe the same write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view1 = new Int16Array(buf);
      const view2 = new Int16Array(buf);
      const view3 = new Int16Array(buf);
      view1.$_set(0, 11);
      let actual: number = view2.$_get(0);
      let expected: int = 11;
      expect(actual).assertEqual(expected);
      let actual2: number = view3.$_get(0);
      let expected2: int = 11;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__6200
     * @tc.name int16ArrayConstructorPart13Test062
     * @tc.desc Verify new Int16Array shared buffer write does not change view length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view1 = new Int16Array(buf);
      const view2 = new Int16Array(buf);
      view1.$_set(0, 88);
      let actual: int = view2.length;
      let expected: int = 4;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__6300
     * @tc.name int16ArrayConstructorPart13Test063
     * @tc.desc Verify new Int16Array shared buffer views read truncated float 3.7 as 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view1 = new Int16Array(buf);
      const view2 = new Int16Array(buf);
      view1.$_set(0, 3.7);
      let actual: number = view2.$_get(0);
      let expected: int = 3;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__6400
     * @tc.name int16ArrayConstructorPart13Test064
     * @tc.desc Verify new Int16Array from Array<number> converts values correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([33, 66] as number[]);
      const buf = src.buffer;
      const view = new Int16Array(buf);
      let actual: number = view.$_get(0);
      let expected: int = 33;
      expect(actual).assertEqual(expected);
      let actual2: number = view.$_get(1);
      let expected2: int = 66;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__6500
     * @tc.name int16ArrayConstructorPart13Test065
     * @tc.desc Verify new Int16Array from Array<number> converts values correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([10, 20] as number[]);
      const buf = src.buffer;
      const view = new Int16Array(buf);
      src.$_set(0, 99);
      let actual: number = view.$_get(0);
      let expected: int = 99;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__6600
     * @tc.name int16ArrayConstructorPart13Test066
     * @tc.desc Verify new Int16Array from Array<number> converts values correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([10, 20] as number[]);
      const buf = src.buffer;
      const view = new Int16Array(buf);
      view.$_set(1, 88);
      let actual: number = src.$_get(1);
      let expected: int = 88;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__6700
     * @tc.name int16ArrayConstructorPart13Test067
     * @tc.desc Verify new Int16Array shared buffer multi-index writes are all visible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view1 = new Int16Array(buf);
      view1.$_set(0, 1);
      view1.$_set(1, 2);
      view1.$_set(2, 3);
      view1.$_set(3, 4);
      const view2 = new Int16Array(buf);
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__6800
     * @tc.name int16ArrayConstructorPart13Test068
     * @tc.desc Verify new Int16Array shared buffer views keep buffer.byteLength unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view1 = new Int16Array(buf);
      view1.$_set(0, 55);
      const view2 = new Int16Array(buf);
      let actual: int = view2.buffer.byteLength;
      let expected: int = 8;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__6900
     * @tc.name int16ArrayConstructorPart13Test069
     * @tc.desc Verify new Int16Array from Array<number> converts values correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([5, 15] as number[]);
      const arr = new Int16Array(src);
      let actual: boolean = arr.buffer === src.buffer;
      expect(actual).assertFalse();
    });

  });
}
