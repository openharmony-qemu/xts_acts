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
} from "@ohos/hypium-static/src/main/indexStatic";
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
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__0300
     * @tc.name int16ArrayConstructorPart13Test003
     * @tc.desc Verify new Int16Array from Array<int> creates non-null array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
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
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
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
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
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
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
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
     * @tc.desc Verify new Int16Array odd 1-byte ArrayBuffer throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__0800
     * @tc.name int16ArrayConstructorPart13Test008
     * @tc.desc Verify new Int16Array 1024-byte ArrayBuffer creates length 512 view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(1024);
      const arr = new Int16Array(buf);
      let actual: int = arr.length;
      let expected: int = 512;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__1000
     * @tc.name int16ArrayConstructorPart13Test010
     * @tc.desc Verify new Int16Array ArrayBuffer path sets byteLength to 8
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Int16Array(buf);
      let actual: int = arr.byteLength;
      let expected: int = 8;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__1200
     * @tc.name int16ArrayConstructorPart13Test012
     * @tc.desc Verify new Int16Array length matches expected value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array(0);
      const arr = new Int16Array(src);
      let actual: int = arr.length;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__1500
     * @tc.name int16ArrayConstructorPart13Test015
     * @tc.desc Verify new Int16Array Array<number> preserves int16 boundary including MIN -32768
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val:short = -32768;
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
     * @tc.desc Verify new Int16Array Array<number> preserves int16.MIN -32768
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val:short = -32768;
      const src = new Int16Array([val] as number[]);
      const arr = new Int16Array(src);
      let actual: number = arr.$_get(0);
      let expected: int = -32768;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__2100
     * @tc.name int16ArrayConstructorPart13Test021
     * @tc.desc Verify new Int16Array Array<number> source length is preserved
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([1, 2, 3, 4, 5] as number[]);
      const arr = new Int16Array(src);
      let actual: int = arr.length;
      let expected: int = 5;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__2200
     * @tc.name int16ArrayConstructorPart13Test022
     * @tc.desc Verify new Int16Array Array<number> preserves int16 MIN/MAX/zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let valMin:short = -32768;
      let valMax:short = 32767;
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__2300
     * @tc.name int16ArrayConstructorPart13Test023
     * @tc.desc Verify new Int16Array from Array<int> copies values correctly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__2400
     * @tc.name int16ArrayConstructorPart13Test024
     * @tc.desc Verify new Int16Array Array<int> int16.MAX 32767 is preserved
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: int[] = [32767];
      const arr = new Int16Array(src);
      let actual: number = arr.$_get(0);
      let expected: int = 32767;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__2500
     * @tc.name int16ArrayConstructorPart13Test025
     * @tc.desc Verify new Int16Array from Array<int> copies values correctly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__2600
     * @tc.name int16ArrayConstructorPart13Test026
     * @tc.desc Verify new Int16Array empty Array<int> creates empty array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__2700
     * @tc.name int16ArrayConstructorPart13Test027
     * @tc.desc Verify new Int16Array empty Array<number> creates empty array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: number[] = [];
      const arr = new Int16Array(src);
      let actual: int = arr.length;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__3100
     * @tc.name int16ArrayConstructorPart13Test031
     * @tc.desc Verify new Int16Array Array<number> mixed floats convert correctly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__3200
     * @tc.name int16ArrayConstructorPart13Test032
     * @tc.desc Verify new Int16Array Array<number> source length is preserved
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: number[] = [1.0, 2.0, 3.0, 4.0, 5.0];
      const arr = new Int16Array(src);
      let actual: int = arr.length;
      let expected: int = 5;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__3300
     * @tc.name int16ArrayConstructorPart13Test033
     * @tc.desc Verify new Int16Array from FixedArray copies values correctly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__3400
     * @tc.name int16ArrayConstructorPart13Test034
     * @tc.desc Verify new Int16Array FixedArray source length is preserved
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: FixedArray<int> = [1, 2, 3, 4];
      const arr = new Int16Array(src);
      let actual: int = arr.length;
      let expected: int = 4;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__3500
     * @tc.name int16ArrayConstructorPart13Test035
     * @tc.desc Verify new Int16Array FixedArray number truncates float to int16
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__3600
     * @tc.name int16ArrayConstructorPart13Test036
     * @tc.desc Verify new Int16Array from Int8Array source copies values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__3700
     * @tc.name int16ArrayConstructorPart13Test037
     * @tc.desc Verify new Int16Array from Uint8Array source copies values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__3800
     * @tc.name int16ArrayConstructorPart13Test038
     * @tc.desc Verify new Int16Array from Int32Array overflow truncates to int16
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int32Array(1);
      src.$_set(0, 32768);
      const arr = new Int16Array(src);
      let actual: number = arr.$_get(0);
      let expected: int = -32768;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__3900
     * @tc.name int16ArrayConstructorPart13Test039
     * @tc.desc Verify new Int16Array from Int32Array in-range value is preserved
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int32Array(1);
      src.$_set(0, 10000);
      const arr = new Int16Array(src);
      let actual: number = arr.$_get(0);
      let expected: int = 10000;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__4000
     * @tc.name int16ArrayConstructorPart13Test040
     * @tc.desc Verify new Int16Array from Uint16Array overflow wraps to int16
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint16Array(1);
      src.$_set(0, 40000);
      const arr = new Int16Array(src);
      let actual: number = arr.$_get(0);
      let expected: int = -25536;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__4100
     * @tc.name int16ArrayConstructorPart13Test041
     * @tc.desc Verify new Int16Array from Float32Array truncates float value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Float32Array(1);
      src.$_set(0, 3.7);
      const arr = new Int16Array(src);
      let actual: number = arr.$_get(0);
      let expected: int = 3;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__4200
     * @tc.name int16ArrayConstructorPart13Test042
     * @tc.desc Verify new Int16Array ArrayLike path creates view with length 3
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: int[] = [1, 2, 3];
      const arr = new Int16Array(src);
      let actual: int = arr.length;
      let expected: int = 3;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__4300
     * @tc.name int16ArrayConstructorPart13Test043
     * @tc.desc Verify new Int16Array from Int16Array creates view with length 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Int16Array([1, 2] as number[]);
      const arr = new Int16Array(src);
      let actual: int = arr.length;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__4400
     * @tc.name int16ArrayConstructorPart13Test044
     * @tc.desc Verify new Int16Array ArrayLike path buffer is not null
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: int[] = [1, 2];
      const arr = new Int16Array(src);
      let actual: int = arr.buffer.byteLength;
      let expected: int = 4;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__4700
     * @tc.name int16ArrayConstructorPart13Test047
     * @tc.desc Verify new Int16Array ArrayLike path byteLength equals length * 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: int[] = [1, 2, 3, 4, 5];
      const arr = new Int16Array(src);
      let actual: int = arr.byteLength;
      let expected: number = arr.length * 2;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__4800
     * @tc.name int16ArrayConstructorPart13Test048
     * @tc.desc Verify new Int16Array from Array<int> copies values correctly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: int[] = [10, 20, 30, 40];
      const arr = new Int16Array(src);
      let actual: int = arr.length;
      let expected: int = 4;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__4900
     * @tc.name int16ArrayConstructorPart13Test049
     * @tc.desc Verify new Int16Array from Array<number> converts values correctly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART13__5000
     * @tc.name int16ArrayConstructorPart13Test050
     * @tc.desc Verify new Int16Array large 65536-byte ArrayBuffer creates length 32768 view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart13Test050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(65536);
      const arr = new Int16Array(buf);
      let actual: int = arr.length;
      let expected: int = 32768;
      expect(actual).assertEqual(expected);
    });

  });
}
