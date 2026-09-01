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

export default function int16ArrayConstructorPart12Test(): void {
  describe("Int16ArrayConstructorPart12Test", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART12__0100
     * @tc.name int16ArrayConstructorPart12Test001
     * @tc.desc Verify new Int16Array ArrayBuffer view yields length=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart12Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int16Array = new Int16Array(buf, 0 as Number, 2 as Number);
      let actual: int = arr.length;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART12__0200
     * @tc.name int16ArrayConstructorPart12Test002
     * @tc.desc Verify new Int16Array ArrayBuffer view yields length=2, byteOffset=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart12Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int16Array = new Int16Array(buf, undefined, 2 as Number);
      let actual: int = arr.length;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
      let actual2: int = arr.byteOffset;
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART12__0300
     * @tc.name int16ArrayConstructorPart12Test003
     * @tc.desc Verify new Int16Array ArrayBuffer view yields length=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart12Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int16Array = new Int16Array(buf, 0 as Number, undefined);
      let actual: int = arr.length;
      let expected: int = 4;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART12__0400
     * @tc.name int16ArrayConstructorPart12Test004
     * @tc.desc Verify new Int16Array ArrayBuffer view yields byteOffset=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart12Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int16Array = new Int16Array(buf, undefined, 2 as Number);
      let actual: int = arr.byteOffset;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART12__0500
     * @tc.name int16ArrayConstructorPart12Test005
     * @tc.desc Verify new Int16Array ArrayBuffer view yields byteOffset=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart12Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int16Array = new Int16Array(buf, 0 as Number, 2 as Number);
      let actual: int = arr.byteOffset;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART12__0600
     * @tc.name int16ArrayConstructorPart12Test006
     * @tc.desc Verify new Int16Array ArrayBuffer view yields byteOffset=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart12Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int16Array = new Int16Array(buf, 2 as Number, 1 as Number);
      let actual: int = arr.byteOffset;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART12__0700
     * @tc.name int16ArrayConstructorPart12Test007
     * @tc.desc Verify new Int16Array ArrayBuffer view yields byteOffset=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart12Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int16Array = new Int16Array(buf, 4 as Number, 2 as Number);
      let actual: int = arr.byteOffset;
      let expected: int = 4;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART12__0800
     * @tc.name int16ArrayConstructorPart12Test008
     * @tc.desc Verify new Int16Array ArrayBuffer view yields byteOffset=6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart12Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int16Array = new Int16Array(buf, 6 as Number, 1 as Number);
      let actual: int = arr.byteOffset;
      let expected: int = 6;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART12__0900
     * @tc.name int16ArrayConstructorPart12Test009
     * @tc.desc Verify new Int16Array with non-aligned byteOffset throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart12Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      try {
        let arr: Int16Array = new Int16Array(buf, 1 as Number, undefined);
        expect().assertFail();
      } catch (e) {
        let actual: string = e.name;
        let expected: string = "RangeError";
        expect(actual).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART12__1000
     * @tc.name int16ArrayConstructorPart12Test010
     * @tc.desc Verify new Int16Array with float byteOffset 2.0 aligned yielding byteOffset=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart12Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int16Array = new Int16Array(buf, 2.0 as Number, 2 as Number);
      let actual: int = arr.byteOffset;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART12__1100
     * @tc.name int16ArrayConstructorPart12Test011
     * @tc.desc Verify new Int16Array with NaN byteOffset yields byteOffset=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart12Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int16Array = new Int16Array(buf, Number.NaN as Number, 2 as Number);
      let actual: int = arr.byteOffset;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART12__1200
     * @tc.name int16ArrayConstructorPart12Test012
     * @tc.desc Verify new Int16Array ArrayBuffer view yields byteOffset=8, length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart12Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int16Array = new Int16Array(buf, 8 as Number, 0 as Number);
      let actual: int = arr.byteOffset;
      let expected: int = 8;
      expect(actual).assertEqual(expected);
      let actual2: int = arr.length;
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART12__1300
     * @tc.name int16ArrayConstructorPart12Test013
     * @tc.desc Verify new Int16Array with float byteOffset 0.5 truncates yielding byteOffset=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart12Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int16Array = new Int16Array(buf, 0.5 as Number, 2 as Number);
      let actual: int = arr.byteOffset;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART12__1400
     * @tc.name int16ArrayConstructorPart12Test014
     * @tc.desc Verify new Int16Array ArrayBuffer view yields length=6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart12Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let arr: Int16Array = new Int16Array(buf, 0 as Number, undefined);
      let actual: int = arr.length;
      let expected: int = 6;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART12__1500
     * @tc.name int16ArrayConstructorPart12Test015
     * @tc.desc Verify new Int16Array ArrayBuffer view yields length=0, byteLength=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart12Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int16Array = new Int16Array(buf, 0 as Number, 0 as Number);
      let actual: int = arr.length;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: int = arr.byteLength;
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART12__1600
     * @tc.name int16ArrayConstructorPart12Test016
     * @tc.desc Verify new Int16Array with float length 0.3 truncates yielding length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart12Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int16Array = new Int16Array(buf, 0 as Number, 0.3 as Number);
      let actual: int = arr.length;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART12__1700
     * @tc.name int16ArrayConstructorPart12Test017
     * @tc.desc Verify new Int16Array with NaN byteOffset yields length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart12Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int16Array = new Int16Array(buf, 0 as Number, Number.NaN as Number);
      let actual: int = arr.length;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART12__1800
     * @tc.name int16ArrayConstructorPart12Test018
     * @tc.desc Verify new Int16Array with negative float length -0.5 truncates to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart12Test018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int16Array = new Int16Array(buf, 0 as Number, (-0.5) as Number);
      let actual: int = arr.length;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: int = arr.byteOffset;
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART12__1900
     * @tc.name int16ArrayConstructorPart12Test019
     * @tc.desc Verify new Int16Array ArrayBuffer view yields byteOffset=0, length=5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart12Test019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(10);
      let arr: Int16Array = new Int16Array(buf, undefined, undefined);
      let actual: int = arr.byteOffset;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: int = arr.length;
      let expected2: int = 5;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART12__2000
     * @tc.name int16ArrayConstructorPart12Test020
     * @tc.desc Verify new Int16Array ArrayBuffer view yields byteOffset=0, length=5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart12Test020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(10);
      let arr: Int16Array = new Int16Array(buf, 0 as Number, undefined);
      let actual: int = arr.byteOffset;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: int = arr.length;
      let expected2: int = 5;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART12__2100
     * @tc.name int16ArrayConstructorPart12Test021
     * @tc.desc Verify new Int16Array ArrayBuffer view yields byteOffset=2, length=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart12Test021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int16Array = new Int16Array(buf, 2 as Number, undefined);
      let actual: int = arr.byteOffset;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
      let actual2: int = arr.length;
      let expected2: int = 3;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART12__2200
     * @tc.name int16ArrayConstructorPart12Test022
     * @tc.desc Verify new Int16Array ArrayBuffer view yields byteOffset=0, length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart12Test022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int16Array = new Int16Array(buf, undefined, 0 as Number);
      let actual: int = arr.byteOffset;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: int = arr.length;
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART12__2300
     * @tc.name int16ArrayConstructorPart12Test023
     * @tc.desc Verify new Int16Array ArrayBuffer view yields byteOffset=2, length=1, byteLength=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart12Test023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int16Array = new Int16Array(buf, 2 as Number, 1 as Number);
      let actual: int = arr.byteOffset;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
      let actual2: int = arr.length;
      let expected2: int = 1;
      expect(actual2).assertEqual(expected2);
      let actual3: int = arr.byteLength;
      let expected3: int = 2;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART12__2400
     * @tc.name int16ArrayConstructorPart12Test024
     * @tc.desc Verify new Int16Array ArrayBuffer view yields byteOffset=4, length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart12Test024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int16Array = new Int16Array(buf, 4 as Number, 0 as Number);
      let actual: int = arr.byteOffset;
      let expected: int = 4;
      expect(actual).assertEqual(expected);
      let actual2: int = arr.length;
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART12__2500
     * @tc.name int16ArrayConstructorPart12Test025
     * @tc.desc Verify new Int16Array ArrayBuffer view yields byteOffset=6, length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart12Test025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int16Array = new Int16Array(buf, 6 as Number, 1 as Number);
      let actual: int = arr.byteOffset;
      let expected: int = 6;
      expect(actual).assertEqual(expected);
      let actual2: int = arr.length;
      let expected2: int = 1;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART12__2600
     * @tc.name int16ArrayConstructorPart12Test026
     * @tc.desc Verify new Int16Array ArrayBuffer view yields length=1, byteOffset=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart12Test026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int16Array = new Int16Array(buf, undefined, 1 as Number);
      let actual: int = arr.length;
      let expected: int = 1;
      expect(actual).assertEqual(expected);
      let actual2: int = arr.byteOffset;
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART12__2700
     * @tc.name int16ArrayConstructorPart12Test027
     * @tc.desc Verify new Int16Array ArrayBuffer view yields length=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart12Test027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let arr: Int16Array = new Int16Array(buf, 2 as Number, 3 as Number);
      let actual: int = arr.length;
      let expected: int = 3;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART12__2800
     * @tc.name int16ArrayConstructorPart12Test028
     * @tc.desc Verify new Int16Array ArrayBuffer view yields byteLength=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart12Test028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(10);
      let arr: Int16Array = new Int16Array(buf, 2 as Number, 2 as Number);
      let actual: int = arr.byteLength;
      let expected: int = 4;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART12__2900
     * @tc.name int16ArrayConstructorPart12Test029
     * @tc.desc Verify new Int16Array ArrayBuffer view yields byteOffset=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart12Test029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int16Array = new Int16Array(buf, 4 as Number, 1 as Number);
      let actual: int = arr.byteOffset;
      let expected: int = 4;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART12__3000
     * @tc.name int16ArrayConstructorPart12Test030
     * @tc.desc Verify new Int16Array buffer property returns same ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart12Test030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int16Array = new Int16Array(buf, 0 as Number, 2 as Number);
      let actual: boolean = arr.buffer === buf;
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART12__3100
     * @tc.name int16ArrayConstructorPart12Test031
     * @tc.desc Verify new Int16Array BYTES_PER_ELEMENT equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart12Test031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Int16Array = new Int16Array(buf, undefined, undefined);
      let actual: int = arr.BYTES_PER_ELEMENT;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART12__3200
     * @tc.name int16ArrayConstructorPart12Test032
     * @tc.desc Verify new Int16Array ArrayBuffer view yields length=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart12Test032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Int16Array = new Int16Array(buf, undefined, undefined);
      let actual: int = arr.length;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART12__3300
     * @tc.name int16ArrayConstructorPart12Test033
     * @tc.desc Verify new Int16Array elements default to 0 at first index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart12Test033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int16Array = new Int16Array(buf, 0 as Number, 4 as Number);
      let actual: number = arr.$_get(0);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART12__3400
     * @tc.name int16ArrayConstructorPart12Test034
     * @tc.desc Verify new Int16Array elements default to 0 at last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart12Test034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int16Array = new Int16Array(buf, 0 as Number, 4 as Number);
      let actual: number = arr.$_get(3);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART12__3500
     * @tc.name int16ArrayConstructorPart12Test035
     * @tc.desc Verify new Int16Array byteLength equals length times BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart12Test035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let arr: Int16Array = new Int16Array(buf, 2 as Number, 4 as Number);
      let actual: int = arr.byteLength;
      let expected: number = arr.length * arr.BYTES_PER_ELEMENT;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART12__3600
     * @tc.name int16ArrayConstructorPart12Test036
     * @tc.desc Verify new Int16Array ArrayBuffer view yields length=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart12Test036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(10);
      let arr: Int16Array = new Int16Array(buf, 2 as Number, undefined);
      let actual: int = arr.length;
      let expected: int = 4;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART12__3700
     * @tc.name int16ArrayConstructorPart12Test037
     * @tc.desc Verify new Int16Array buffer capacity covers view byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart12Test037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let arr: Int16Array = new Int16Array(buf, 2 as Number, 3 as Number);
      let actual: string = (arr.buffer.byteLength >= arr.byteLength).toString();
      let expected: string = "true";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART12__3800
     * @tc.name int16ArrayConstructorPart12Test038
     * @tc.desc Verify new Int16Array overlapping view1 write visible in view2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart12Test038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let view1: Int16Array = new Int16Array(buf, 0 as Number, 4 as Number);
      let view2: Int16Array = new Int16Array(buf, 2 as Number, 2 as Number);
      view1.$_set(1, 42);
      let actual: number = view2.$_get(0);
      let expected: int = 42;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART12__3900
     * @tc.name int16ArrayConstructorPart12Test039
     * @tc.desc Verify new Int16Array overlapping view2 write visible in view1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart12Test039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let view1: Int16Array = new Int16Array(buf, 0 as Number, 4 as Number);
      let view2: Int16Array = new Int16Array(buf, 2 as Number, 2 as Number);
      view2.$_set(0, 99);
      let actual: number = view1.$_get(1);
      let expected: int = 99;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART12__4000
     * @tc.name int16ArrayConstructorPart12Test040
     * @tc.desc Verify new Int16Array identical views share writes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart12Test040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let view1: Int16Array = new Int16Array(buf, 0 as Number, 2 as Number);
      let view2: Int16Array = new Int16Array(buf, 0 as Number, 2 as Number);
      view1.$_set(0, 77);
      let actual: number = view2.$_get(0);
      let expected: int = 77;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART12__4100
     * @tc.name int16ArrayConstructorPart12Test041
     * @tc.desc Verify new Int16Array non-overlapping views do not share writes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart12Test041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let view1: Int16Array = new Int16Array(buf, 0 as Number, 2 as Number);
      let view2: Int16Array = new Int16Array(buf, 4 as Number, 2 as Number);
      view1.$_set(0, 55);
      let actual: number = view2.$_get(0);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART12__4200
     * @tc.name int16ArrayConstructorPart12Test042
     * @tc.desc Verify new Int16Array overlapping views share int16 max value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart12Test042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let view1: Int16Array = new Int16Array(buf, 0 as Number, 4 as Number);
      let view2: Int16Array = new Int16Array(buf, 2 as Number, 2 as Number);
      let val:short = 32767
      view1.$_set(1, val);
      let actual: number = view2.$_get(0);
      let expected: int = 32767;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART12__4300
     * @tc.name int16ArrayConstructorPart12Test043
     * @tc.desc Verify new Int16Array overlapping views share overflow wrap value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart12Test043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let view1: Int16Array = new Int16Array(buf, 0 as Number, 4 as Number);
      let view2: Int16Array = new Int16Array(buf, 2 as Number, 2 as Number);
      let val:short = -32768
      view1.$_set(1, val);
      let actual: number = view2.$_get(0);
      let expected: int = -32768;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART12__4400
     * @tc.name int16ArrayConstructorPart12Test044
     * @tc.desc Verify new Int16Array overlapping views share overflow wrap value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart12Test044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let view1: Int16Array = new Int16Array(buf, 0 as Number, 4 as Number);
      let view2: Int16Array = new Int16Array(buf, 2 as Number, 2 as Number);
      view1.$_set(1, 32768);
      let actual: number = view2.$_get(0);
      let expected: int = -32768;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART12__4500
     * @tc.name int16ArrayConstructorPart12Test045
     * @tc.desc Verify new Int16Array view byteOffset unchanged after shared write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart12Test045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let view1: Int16Array = new Int16Array(buf, 2 as Number, 2 as Number);
      let view2: Int16Array = new Int16Array(buf, 0 as Number, 4 as Number);
      view2.$_set(0, 100);
      let actual: int = view1.byteOffset;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART12__4600
     * @tc.name int16ArrayConstructorPart12Test046
     * @tc.desc Verify new Int16Array views share same ArrayBuffer reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart12Test046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let view1: Int16Array = new Int16Array(buf, 0 as Number, 2 as Number);
      let view2: Int16Array = new Int16Array(buf, 4 as Number, 2 as Number);
      let actual: boolean = view1.buffer === view2.buffer;
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART12__4700
     * @tc.name int16ArrayConstructorPart12Test047
     * @tc.desc Verify new Int16Array constructed later reads prior shared buffer write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart12Test047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let src: Int16Array = new Int16Array(buf, 0 as Number, 4 as Number);
      src.$_set(2, 123);
      let view: Int16Array = new Int16Array(buf, 4 as Number, 1 as Number);
      let actual: number = view.$_get(0);
      let expected: int = 123;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART12__4800
     * @tc.name int16ArrayConstructorPart12Test048
     * @tc.desc Verify new Int16Array on 2-byte buffer yields length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart12Test048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(2);
      let arr: Int16Array = new Int16Array(buf, 0 as Number, 1 as Number);
      let actual: int = arr.length;
      let expected: int = 1;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART12__4900
     * @tc.name int16ArrayConstructorPart12Test049
     * @tc.desc Verify new Int16Array with float length 3.9 after offset 2 truncates to 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart12Test049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int16Array = new Int16Array(buf, 2.0 as Number, 3.9 as Number);
      let actual: int = arr.length;
      let expected: int = 3;
      expect(actual).assertEqual(expected);
      let actual2: int = arr.byteOffset;
      let expected2: int = 2;
      expect(actual2).assertEqual(expected2);
    });

  });
}
