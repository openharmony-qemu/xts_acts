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

export default function int16ArrayValueOfPart02Test(): void {
  describe("Int16ArrayValueOfPart02Test", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART02__0100
     * @tc.name int16ArrayValueOfPart02Test001
     * @tc.desc Verify valueOf() on non-empty multi-element Int16Array keeps length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart02Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      let result: Int16Array = arr.valueOf();
      let actual: int = result.length;
      let expected: int = 3;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART02__0200
     * @tc.name int16ArrayValueOfPart02Test002
     * @tc.desc Verify valueOf() on empty Int16Array keeps length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart02Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(0);
      let result: Int16Array = arr.valueOf();
      let actual: int = result.length;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART02__0300
     * @tc.name int16ArrayValueOfPart02Test003
     * @tc.desc Verify valueOf() on single-element Int16Array keeps length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart02Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: short = 32767;
      let arr: Int16Array = Int16Array.of(val);
      let result: Int16Array = arr.valueOf();
      let actual: int = result.length;
      let expected: int = 1;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART02__0400
     * @tc.name int16ArrayValueOfPart02Test004
     * @tc.desc Verify valueOf() length and first element match original on non-empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart02Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let result: Int16Array = arr.valueOf();
      let actual: int = result.length;
      let expected: int = arr.length;
      expect(actual).assertEqual(expected);
      let actual2: number = result.$_get(0);
      let expected2: number = arr.$_get(0);
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART02__0500
     * @tc.name int16ArrayValueOfPart02Test005
     * @tc.desc Verify valueOf() length and element match on single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart02Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(-1);
      let result: Int16Array = arr.valueOf();
      let actual: int = result.length;
      let expected: int = 1;
      expect(actual).assertEqual(expected);
      let actual2: number = result.$_get(0);
      let expected2: int = -1;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART02__0600
     * @tc.name int16ArrayValueOfPart02Test006
     * @tc.desc Verify valueOf() length and first element match on Int16Array.from constructed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart02Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.from([5, 10, 15]);
      let result: Int16Array = arr.valueOf();
      let actual: int = result.length;
      let expected: int = 3;
      expect(actual).assertEqual(expected);
      let actual2: number = result.$_get(0);
      let expected2: int = 5;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART02__0700
     * @tc.name int16ArrayValueOfPart02Test007
     * @tc.desc Verify valueOf() returns same reference as original on multi-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart02Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(100, 200, 300);
      let result: Int16Array = arr.valueOf();
      let actual: boolean = result === arr;
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART02__0800
     * @tc.name int16ArrayValueOfPart02Test008
     * @tc.desc Verify valueOf() returns same reference as original on empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart02Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(0);
      let result: Int16Array = arr.valueOf();
      let actual: boolean = result === arr;
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART02__0900
     * @tc.name int16ArrayValueOfPart02Test009
     * @tc.desc Verify After mutating original with $_set, valueOf() still returns same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart02Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      arr.$_set(0 as int, 99 as int);
      let result: Int16Array = arr.valueOf();
      let actual: boolean = result === arr;
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART02__1000
     * @tc.name int16ArrayValueOfPart02Test010
     * @tc.desc Verify Calling valueOf() twice returns references that are equal to each other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart02Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(7, 8, 9);
      let r1: Int16Array = arr.valueOf();
      let r2: Int16Array = arr.valueOf();
      let actual: boolean = r1 === r2;
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART02__1100
     * @tc.name int16ArrayValueOfPart02Test011
     * @tc.desc Verify valueOf().$_get(0 as int) matches original.$_get(0 as int) on multi-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart02Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(12, 34, 56);
      let result: Int16Array = arr.valueOf();
      let actual: number | undefined = result.$_get(0 as int);
      let expected: number | undefined = arr.$_get(0 as int);
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART02__1200
     * @tc.name int16ArrayValueOfPart02Test012
     * @tc.desc Verify valueOf().$_get(lastIndex) matches original.$_get(lastIndex)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart02Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40);
      let result: Int16Array = arr.valueOf();
      let lastIdx: int = arr.length - 1;
      let actual: number | undefined = result.$_get(lastIdx);
      let expected: number | undefined = arr.$_get(lastIdx);
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART02__1300
     * @tc.name int16ArrayValueOfPart02Test013
     * @tc.desc Verify valueOf().$_get(midIndex) matches original.$_get(midIndex)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart02Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(5, 10, 15, 20, 25);
      let result: Int16Array = arr.valueOf();
      let mid: int = 2;
      let actual: number | undefined = result.$_get(mid);
      let expected: number | undefined = arr.$_get(mid);
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART02__1400
     * @tc.name int16ArrayValueOfPart02Test014
     * @tc.desc Verify valueOf() on empty array: $_get(0 as int) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart02Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(0);
      let result: Int16Array = arr.valueOf();
      try {
        result.$_get(0 as int);
        expect().assertFail();
      } catch (e: Error) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART02__1500
     * @tc.name int16ArrayValueOfPart02Test015
     * @tc.desc Verify valueOf().length assertEqual original.length on multi-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart02Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      let result: Int16Array = arr.valueOf();
      let actual: int = result.length;
      let expected: int = arr.length;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART02__1600
     * @tc.name int16ArrayValueOfPart02Test016
     * @tc.desc Verify valueOf().length assertEqual 5 on zero-filled new Int16Array(5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart02Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(5);
      let result: Int16Array = arr.valueOf();
      let actual: int = result.length;
      let expected: int = 5;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART02__1700
     * @tc.name int16ArrayValueOfPart02Test017
     * @tc.desc Verify valueOf().length on buffer-view array matches construction length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart02Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let arr: Int16Array = new Int16Array(buf, 0, 3);
      let result: Int16Array = arr.valueOf();
      let actual: int = result.length;
      let expected: int = 3;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART02__1800
     * @tc.name int16ArrayValueOfPart02Test018
     * @tc.desc Verify valueOf().byteLength assertEqual original.byteLength on multi-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart02Test018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      let result: Int16Array = arr.valueOf();
      let actual: int = result.byteLength;
      let expected: int = arr.byteLength;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART02__1900
     * @tc.name int16ArrayValueOfPart02Test019
     * @tc.desc Verify valueOf().byteLength assertEqual 0 on empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart02Test019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(0);
      let result: Int16Array = arr.valueOf();
      let actual: int = result.byteLength;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART02__2000
     * @tc.name int16ArrayValueOfPart02Test020
     * @tc.desc Verify valueOf().byteLength assertEqual 2 on single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart02Test020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(100);
      let result: Int16Array = arr.valueOf();
      let actual: int = result.byteLength;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART02__2100
     * @tc.name int16ArrayValueOfPart02Test021
     * @tc.desc Verify valueOf().byteLength equals valueOf().length * BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart02Test021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4);
      let result: Int16Array = arr.valueOf();
      let actual: int = result.byteLength;
      let expected: int = result.length * 2;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART02__2200
     * @tc.name int16ArrayValueOfPart02Test022
     * @tc.desc Verify valueOf().byteLength on buffer-view array assertEqual original.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart02Test022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(10);
      let arr: Int16Array = new Int16Array(buf, 2, 4);
      let result: Int16Array = arr.valueOf();
      let actual: int = result.byteLength;
      let expected: int = arr.byteLength;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART02__2300
     * @tc.name int16ArrayValueOfPart02Test023
     * @tc.desc Verify valueOf().byteOffset assertEqual 0 for Int16Array.of constructed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart02Test023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(7, 14, 21);
      let result: Int16Array = arr.valueOf();
      let actual: int = result.byteOffset;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART02__2400
     * @tc.name int16ArrayValueOfPart02Test024
     * @tc.desc Verify valueOf().byteOffset assertEqual 0 for new Int16Array(N) constructed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart02Test024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(3);
      let result: Int16Array = arr.valueOf();
      let actual: int = result.byteOffset;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART02__2500
     * @tc.name int16ArrayValueOfPart02Test025
     * @tc.desc Verify valueOf().byteOffset assertEqual original.byteOffset for buffer-view with non-zero offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart02Test025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int16Array = new Int16Array(buf, 4, 2);
      let result: Int16Array = arr.valueOf();
      let actual: int = result.byteOffset;
      let expected: int = arr.byteOffset;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART02__2600
     * @tc.name int16ArrayValueOfPart02Test026
     * @tc.desc Verify valueOf().byteOffset assertEqual 2 for buffer-view constructed at offset 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart02Test026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int16Array = new Int16Array(buf, 2, 3);
      let result: Int16Array = arr.valueOf();
      let actual: int = result.byteOffset;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART02__2700
     * @tc.name int16ArrayValueOfPart02Test027
     * @tc.desc Verify After valueOf(), original.length remains unchanged on multi-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart02Test027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      let lenBefore: int = arr.length;
      let actual: int = arr.length;
      let expected: int = lenBefore;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART02__2800
     * @tc.name int16ArrayValueOfPart02Test028
     * @tc.desc Verify After valueOf(), original.$_get(0 as int) element value unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart02Test028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(88, 99, 111);
      let valBefore: number | undefined = arr.$_get(0 as int);
      arr.valueOf();
      let actual: number | undefined = arr.$_get(0 as int);
      let expected: number | undefined = valBefore;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART02__2900
     * @tc.name int16ArrayValueOfPart02Test029
     * @tc.desc Verify After valueOf(), original.byteLength unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart02Test029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(5, 10, 15);
      let blBefore: int = arr.byteLength;
      arr.valueOf();
      let actual: int = arr.byteLength;
      let expected: int = blBefore;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART02__3000
     * @tc.name int16ArrayValueOfPart02Test030
     * @tc.desc Verify After valueOf(), original.byteOffset unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart02Test030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2);
      let boBefore: int = arr.byteOffset;
      arr.valueOf();
      let actual: int = arr.byteOffset;
      let expected: int = boBefore;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART02__3100
     * @tc.name int16ArrayValueOfPart02Test031
     * @tc.desc Verify After valueOf() on empty array, original.length still 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart02Test031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(0);
      arr.valueOf();
      let actual: int = arr.length;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART02__3200
     * @tc.name int16ArrayValueOfPart02Test032
     * @tc.desc Verify After valueOf() on empty array, original.byteLength still 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart02Test032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(0);
      arr.valueOf();
      let actual: int = arr.byteLength;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART02__3300
     * @tc.name int16ArrayValueOfPart02Test033
     * @tc.desc Verify After valueOf() on buffer-view array, original.byteOffset unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart02Test033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int16Array = new Int16Array(buf, 2, 3);
      let boBefore: int = arr.byteOffset;
      arr.valueOf();
      let actual: int = arr.byteOffset;
      let expected: int = boBefore;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART02__3400
     * @tc.name int16ArrayValueOfPart02Test034
     * @tc.desc Verify valueOf().valueOf() === original reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart02Test034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(3, 6, 9);
      let chained: Int16Array = arr.valueOf().valueOf();
      let actual: boolean = chained === arr;
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART02__3500
     * @tc.name int16ArrayValueOfPart02Test035
     * @tc.desc Verify valueOf().valueOf().length assertEqual original.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart02Test035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4);
      let chained: Int16Array = arr.valueOf().valueOf();
      let actual: int = chained.length;
      let expected: int = arr.length;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART02__3600
     * @tc.name int16ArrayValueOfPart02Test036
     * @tc.desc Verify valueOf().valueOf().$_get(0 as int) assertEqual original.$_get(0 as int)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart02Test036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(50, 60, 70);
      let chained: Int16Array = arr.valueOf().valueOf();
      let actual: number | undefined = chained.$_get(0 as int);
      let expected: number | undefined = arr.$_get(0 as int);
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART02__3700
     * @tc.name int16ArrayValueOfPart02Test037
     * @tc.desc Verify valueOf().valueOf().valueOf() triple chain === original reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart02Test037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(2, 4, 8);
      let chained: Int16Array = arr.valueOf().valueOf().valueOf();
      let actual: boolean = chained === arr;
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART02__3800
     * @tc.name int16ArrayValueOfPart02Test038
     * @tc.desc Verify valueOf().valueOf().byteLength assertEqual original.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart02Test038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      let chained: Int16Array = arr.valueOf().valueOf();
      let actual: int = chained.byteLength;
      let expected: int = arr.byteLength;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART02__3900
     * @tc.name int16ArrayValueOfPart02Test039
     * @tc.desc Verify valueOf().fill(0) mutates original array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart02Test039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      arr.valueOf().fill(0);
      let actual: number | undefined = arr.$_get(0 as int);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART02__4000
     * @tc.name int16ArrayValueOfPart02Test040
     * @tc.desc Verify valueOf().reverse() mutates original array element order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart02Test040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let lastBefore: number | undefined = arr.$_get(arr.length - 1);
      arr.valueOf().reverse();
      let actual: number | undefined = arr.$_get(0 as int);
      let expected: number | undefined = lastBefore;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART02__4100
     * @tc.name int16ArrayValueOfPart02Test041
     * @tc.desc Verify After valueOf().$_set(0 as int, targetVal), original.$_get(0 as int) assertEqual targetVal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart02Test041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(5, 6, 7);
      arr.valueOf().$_set(0 as int, 99 as int);
      let actual: number | undefined = arr.$_get(0 as int);
      let expected: int = 99;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART02__4200
     * @tc.name int16ArrayValueOfPart02Test042
     * @tc.desc Verify valueOf().sort() sorts original array elements in place
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart02Test042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(30, 10, 20);
      arr.valueOf().sort();
      let actual: number | undefined = arr.$_get(0 as int);
      let expected: int = 10;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART02__4300
     * @tc.name int16ArrayValueOfPart02Test043
     * @tc.desc Verify Mutate original via $_set before valueOf, then valueOf().$_get reflects current value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart02Test043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      arr.$_set(1 as int, 88 as int);
      let result: Int16Array = arr.valueOf();
      let actual: number | undefined = result.$_get(1 as int);
      let expected: int = 88;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART02__4400
     * @tc.name int16ArrayValueOfPart02Test044
     * @tc.desc Verify valueOf().buffer === original.buffer for plain-constructed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart02Test044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(7, 14, 21);
      let result: Int16Array = arr.valueOf();
      let actual: boolean = result.buffer === arr.buffer;
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART02__4500
     * @tc.name int16ArrayValueOfPart02Test045
     * @tc.desc Verify valueOf().buffer === original.buffer for buffer-view constructed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart02Test045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int16Array = new Int16Array(buf, 2, 3);
      let result: Int16Array = arr.valueOf();
      let actual: boolean = result.buffer === arr.buffer;
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART02__4600
     * @tc.name int16ArrayValueOfPart02Test046
     * @tc.desc Verify valueOf().buffer.byteLength assertEqual original.buffer.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart02Test046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      let result: Int16Array = arr.valueOf();
      let actual: int = result.buffer.byteLength;
      let expected: int = arr.buffer.byteLength;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART02__4700
     * @tc.name int16ArrayValueOfPart02Test047
     * @tc.desc Verify valueOf() length and first element match original on non-empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart02Test047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      let result: Int16Array = arr.valueOf();
      let actual: int = result.length;
      let expected: int = 3;
      expect(actual).assertEqual(expected);
      let actual2: number = result.$_get(0);
      let expected2: int = 1;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART02__4800
     * @tc.name int16ArrayValueOfPart02Test048
     * @tc.desc Verify valueOf() length and buffer.byteLength on buffer-view array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart02Test048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let arr: Int16Array = new Int16Array(buf, 0, 3);
      let result: Int16Array = arr.valueOf();
      let actual: int = result.length;
      let expected: int = 3;
      expect(actual).assertEqual(expected);
      let actual2: int = result.buffer.byteLength;
      let expected2: int = 6;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART02__4900
     * @tc.name int16ArrayValueOfPart02Test049
     * @tc.desc Verify Int16Array.from([1,2,3]).valueOf() === the from-created array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart02Test049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.from([1, 2, 3]);
      let result: Int16Array = arr.valueOf();
      let actual: boolean = result === arr;
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART02__5000
     * @tc.name int16ArrayValueOfPart02Test050
     * @tc.desc Verify Int16Array.of(-1,0,1).valueOf() === the of-created array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart02Test050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(-1, 0, 1);
      let result: Int16Array = arr.valueOf();
      let actual: boolean = result === arr;
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART02__5100
     * @tc.name int16ArrayValueOfPart02Test051
     * @tc.desc Verify valueOf() on array with all MAX values returns same reference, first element still MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart02Test051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: short = 32767;
      let arr: Int16Array = Int16Array.of(val, val, val);
      let result: Int16Array = arr.valueOf();
      let actual: number | undefined = result.$_get(0 as int);
      let expected: int = 32767;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART02__5200
     * @tc.name int16ArrayValueOfPart02Test052
     * @tc.desc Verify valueOf() on array with all MIN values returns same reference, first element still MIN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart02Test052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: short = -32768;
      let arr: Int16Array = Int16Array.of(val, val);
      let result: Int16Array = arr.valueOf();
      let actual: number | undefined = result.$_get(0 as int);
      let expected: int = -32768;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART02__5300
     * @tc.name int16ArrayValueOfPart02Test053
     * @tc.desc Verify valueOf() on array with negative values returns same reference, $_get(0 as int) still negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart02Test053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(-100, -200, -300);
      let result: Int16Array = arr.valueOf();
      let actual: number | undefined = result.$_get(0 as int);
      let expected: int = -100;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART02__5400
     * @tc.name int16ArrayValueOfPart02Test054
     * @tc.desc Verify valueOf() on array with all zero values returns same reference, $_get(0 as int) still 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart02Test054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(0, 0, 0);
      let result: Int16Array = arr.valueOf();
      let actual: number | undefined = result.$_get(0 as int);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART02__5500
     * @tc.name int16ArrayValueOfPart02Test055
     * @tc.desc Verify subarray().valueOf() returns the subarray reference itself, not the original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart02Test055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3, 4, 5);
      let sub: Int16Array = arr.subarray(1, 4);
      let result: Int16Array = sub.valueOf();
      let actual: boolean = result === sub;
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART02__5600
     * @tc.name int16ArrayValueOfPart02Test056
     * @tc.desc Verify subarray().valueOf().length assertEqual subarray.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart02Test056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30, 40, 50);
      let sub: Int16Array = arr.subarray(2, 5);
      let result: Int16Array = sub.valueOf();
      let actual: int = result.length;
      let expected: int = sub.length;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART02__5700
     * @tc.name int16ArrayValueOfPart02Test057
     * @tc.desc Verify subarray().valueOf() still shares buffer with original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart02Test057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(5, 10, 15, 20);
      let sub: Int16Array = arr.subarray(0, 2);
      sub.valueOf().$_set(0 as int, 99 as int);
      let actual: number | undefined = arr.$_get(0 as int);
      let expected: int = 99;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART02__5800
     * @tc.name int16ArrayValueOfPart02Test058
     * @tc.desc Verify arr.copyWithin(0,1).valueOf() === arr after copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart02Test058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      arr.copyWithin(0, 1);
      let result: Int16Array = arr.valueOf();
      let actual: boolean = result === arr;
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART02__5900
     * @tc.name int16ArrayValueOfPart02Test059
     * @tc.desc Verify arr.fill(0).valueOf() === arr after fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart02Test059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      arr.fill(0);
      let result: Int16Array = arr.valueOf();
      let actual: boolean = result === arr;
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART02__6000
     * @tc.name int16ArrayValueOfPart02Test060
     * @tc.desc Verify arr.reverse().valueOf() === arr after reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart02Test060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      arr.reverse();
      let result: Int16Array = arr.valueOf();
      let actual: boolean = result === arr;
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART02__6100
     * @tc.name int16ArrayValueOfPart02Test061
     * @tc.desc Verify valueOf() return has iterable behavior via forEach callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart02Test061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(10, 20, 30);
      let result: Int16Array = arr.valueOf();
      let count: int = 0;
      result.forEach((_value: number, _index: int, _array: Int16Array): void => {
        count = count + 1;
      });
      let actual: int = count;
      let expected: int = 3;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART02__6200
     * @tc.name int16ArrayValueOfPart02Test062
     * @tc.desc Verify valueOf() return supports join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart02Test062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(1, 2, 3);
      let result: Int16Array = arr.valueOf();
      let joined: string = result.join(',');
      let actual: string = joined;
      let expected: string = "1,2,3";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_VALUE_OF_PART02__6300
     * @tc.name int16ArrayValueOfPart02Test063
     * @tc.desc Verify valueOf() return supports includes()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayValueOfPart02Test063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(5, 10, 15);
      let result: Int16Array = arr.valueOf();
      let actual: boolean = result.includes(10);
      expect(actual).assertTrue();
    });

  });
}
