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

export default function int16ArrayConstructorPart16Test(): void {
  describe("Int16ArrayConstructorPart16Test", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART16__0100
     * @tc.name int16ArrayConstructorPart16Test001
     * @tc.desc Verify new Int16Array(ArrayBuffer 6, 2) sets length to 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart16Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(6);
      const arr = new Int16Array(buf, 2);
      let actual: int = arr.length;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART16__0200
     * @tc.name int16ArrayConstructorPart16Test002
     * @tc.desc Verify new Int16Array constructor byteOffset=0 offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart16Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Int16Array(buf, 0);
      let actual: int = arr.byteOffset;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART16__0300
     * @tc.name int16ArrayConstructorPart16Test003
     * @tc.desc Verify new Int16Array constructor byteOffset=3 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart16Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      try {
        const arr = new Int16Array(buf, 3);
        expect().assertFail();
      } catch (e) {
        let actual: string = e.name;
        let expected: string = "RangeError";
        expect(actual).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART16__0400
     * @tc.name int16ArrayConstructorPart16Test004
     * @tc.desc Verify new Int16Array constructor byteLength buf.byteLength byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart16Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const arr = new Int16Array(buf, 4);
      let actual: int = arr.byteLength;
      let expected: int = 8;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART16__0500
     * @tc.name int16ArrayConstructorPart16Test005
     * @tc.desc Verify new Int16Array constructor buffer ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart16Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Int16Array(buf, 0);
      let actual: ArrayBuffer = arr.buffer;
      let expected: ArrayBuffer = buf;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART16__0600
     * @tc.name int16ArrayConstructorPart16Test006
     * @tc.desc Verify new Int16Array constructor BYTES_PER_ELEMENT 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart16Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Int16Array(buf, 0);
      let actual: int = arr.BYTES_PER_ELEMENT;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART16__0700
     * @tc.name int16ArrayConstructorPart16Test007
     * @tc.desc Verify new Int16Array constructor element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart16Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(6);
      const arr = new Int16Array(buf, 0);
      let actual: number = arr.$_get(0);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: number = arr.$_get(2);
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART16__0800
     * @tc.name int16ArrayConstructorPart16Test008
     * @tc.desc Verify new Int16Array constructor element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart16Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Int16Array(buf, 2);
      let actual: number = arr.$_get(0);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: number = arr.$_get(2);
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART16__0900
     * @tc.name int16ArrayConstructorPart16Test009
     * @tc.desc Verify new Int16Array(ArrayBuffer 4, NaN) creates length 2 view at byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart16Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const offset: number = Number.NaN;
      const arr = new Int16Array(buf, offset);
      let actual: int = arr.byteOffset;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: int = arr.length;
      let expected2: int = 2;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART16__1000
     * @tc.name int16ArrayConstructorPart16Test010
     * @tc.desc Verify new Int16Array constructor byteOffset=Infinity throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart16Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const offset: number = Number.POSITIVE_INFINITY;
      try {
        const arr = new Int16Array(buf, offset);
        expect().assertFail();
      } catch (e) {
        let actual: string = e.name;
        let expected: string = "RangeError";
        expect(actual).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART16__1100
     * @tc.name int16ArrayConstructorPart16Test011
     * @tc.desc Verify new Int16Array constructor byteOffset -Infinity throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart16Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const offset: number = -Number.POSITIVE_INFINITY;
      try {
        const arr = new Int16Array(buf, offset);
        expect().assertFail();
      } catch (e) {
        let actual: string = e.name;
        let expected: string = "RangeError";
        expect(actual).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART16__1200
     * @tc.name int16ArrayConstructorPart16Test012
     * @tc.desc Verify new Int16Array constructor float byteOffset byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart16Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(10);
      const offset: number = 2.7;
      const arr = new Int16Array(buf, offset);
      let actual: int = arr.byteLength;
      let expected: int = 8;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART16__1300
     * @tc.name int16ArrayConstructorPart16Test013
     * @tc.desc Verify new Int16Array constructor float byteOffset buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart16Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(6);
      const offset: number = 2.0;
      const arr = new Int16Array(buf, offset);
      let actual: ArrayBuffer = arr.buffer;
      let expected: ArrayBuffer = buf;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART16__1400
     * @tc.name int16ArrayConstructorPart16Test014
     * @tc.desc Verify new Int16Array constructor float byteOffset=NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart16Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const offset: number = Number.NaN;
      const arr = new Int16Array(buf, offset);
      let actual: number = arr.$_get(0);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: number = arr.$_get(1);
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART16__1500
     * @tc.name int16ArrayConstructorPart16Test015
     * @tc.desc Verify new Int16Array constructor 3 buf+ 0intOffset+intLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart16Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const arr = new Int16Array(buf, 4, 2);
      let actual: int = arr.length;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
      let actual2: int = arr.byteOffset;
      let expected2: int = 4;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART16__1600
     * @tc.name int16ArrayConstructorPart16Test016
     * @tc.desc Verify new Int16Array constructor length=0 byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart16Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Int16Array(buf, 2, 0);
      let actual: int = arr.length;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: int = arr.byteOffset;
      let expected2: int = 2;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART16__1700
     * @tc.name int16ArrayConstructorPart16Test017
     * @tc.desc Verify new Int16Array(ArrayBuffer 8, 2, 3) sets length to 3 and byteLength to 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart16Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Int16Array(buf, 2, 3);
      let actual: int = arr.length;
      let expected: int = 3;
      expect(actual).assertEqual(expected);
      let actual2: int = arr.byteLength;
      let expected2: int = 6;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART16__1800
     * @tc.name int16ArrayConstructorPart16Test018
     * @tc.desc Verify new Int16Array constructor byteOffset=0 length buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart16Test018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(10);
      const arr = new Int16Array(buf, 0, 5);
      let actual: int = arr.length;
      let expected: int = 5;
      expect(actual).assertEqual(expected);
      let actual2: int = arr.byteLength;
      let expected2: int = 10;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART16__1900
     * @tc.name int16ArrayConstructorPart16Test019
     * @tc.desc Verify new Int16Array constructor byteOffset=4 length=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart16Test019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Int16Array(buf, 4, 1);
      let actual: number = arr.$_get(0);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART16__2000
     * @tc.name int16ArrayConstructorPart16Test020
     * @tc.desc Verify new Int16Array constructor byteOffset=0 length buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart16Test020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Int16Array(buf, 0, 2);
      let actual: int = arr.byteLength;
      let expected: int = 4;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART16__2100
     * @tc.name int16ArrayConstructorPart16Test021
     * @tc.desc Verify new Int16Array constructor byteOffset=0 length=0 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart16Test021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(6);
      const arr = new Int16Array(buf, 0, 0);
      let actual: int = arr.length;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: int = arr.byteOffset;
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART16__2200
     * @tc.name int16ArrayConstructorPart16Test022
     * @tc.desc Verify new Int16Array constructor byteLength length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart16Test022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Int16Array(buf, 0, 5);
      let actual: int = arr.byteLength;
      let expected: int = 10;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART16__2300
     * @tc.name int16ArrayConstructorPart16Test023
     * @tc.desc Verify new Int16Array(ArrayBuffer 12, 2, 3) shares the underlying buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart16Test023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const arr = new Int16Array(buf, 2, 3);
      let actual: ArrayBuffer = arr.buffer;
      let expected: ArrayBuffer = buf;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART16__2400
     * @tc.name int16ArrayConstructorPart16Test024
     * @tc.desc Verify new Int16Array constructor BYTES_PER_ELEMENT 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart16Test024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Int16Array(buf, 0, 2);
      let actual: int = arr.BYTES_PER_ELEMENT;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART16__2500
     * @tc.name int16ArrayConstructorPart16Test025
     * @tc.desc Verify new Int16Array constructor length=0 byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart16Test025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Int16Array(buf, 0, 0);
      let actual: int = arr.byteLength;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART16__2600
     * @tc.name int16ArrayConstructorPart16Test026
     * @tc.desc Verify new Int16Array constructor element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart16Test026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Int16Array(buf, 0, 4);
      let actual: number = arr.$_get(0);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: number = arr.$_get(3);
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART16__2700
     * @tc.name int16ArrayConstructorPart16Test027
     * @tc.desc Verify new Int16Array constructor byteOffset=undefined+length=Number(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart16Test027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(10);
      const len: Number = 2 as Number;
      const arr = new Int16Array(buf, undefined, len);
      let actual: int = arr.length;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
      let actual2: int = arr.byteOffset;
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART16__2800
     * @tc.name int16ArrayConstructorPart16Test028
     * @tc.desc Verify new Int16Array constructor byteOffset=Number(2)+length=undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart16Test028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(10);
      const offset: Number = 2 as Number;
      const arr = new Int16Array(buf, offset, undefined);
      let actual: int = arr.length;
      let expected: int = 4;
      expect(actual).assertEqual(expected);
      let actual2: int = arr.byteOffset;
      let expected2: int = 2;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART16__2900
     * @tc.name int16ArrayConstructorPart16Test029
     * @tc.desc Verify new Int16Array constructor byteOffset=Number(2)+length=Number(2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart16Test029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const offset: Number = 2 as Number;
      const len: Number = 2 as Number;
      const arr = new Int16Array(buf, offset, len);
      let actual: int = arr.length;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
      let actual2: int = arr.byteOffset;
      let expected2: int = 2;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART16__3000
     * @tc.name int16ArrayConstructorPart16Test030
     * @tc.desc Verify new Int16Array constructor byteOffset=Number(4)+length=Number(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart16Test030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const offset: Number = 4 as Number;
      const len: Number = 0 as Number;
      const arr = new Int16Array(buf, offset, len);
      let actual: int = arr.length;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: int = arr.byteOffset;
      let expected2: int = 4;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART16__3100
     * @tc.name int16ArrayConstructorPart16Test031
     * @tc.desc Verify new Int16Array constructor undefined byteLength buf.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart16Test031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(10);
      const arr = new Int16Array(buf, undefined, undefined);
      let actual: int = arr.byteLength;
      let expected: int = 10;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART16__3200
     * @tc.name int16ArrayConstructorPart16Test032
     * @tc.desc Verify new Int16Array constructor undefined buffer buf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart16Test032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Int16Array(buf, undefined, undefined);
      let actual: ArrayBuffer = arr.buffer;
      let expected: ArrayBuffer = buf;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART16__3300
     * @tc.name int16ArrayConstructorPart16Test033
     * @tc.desc Verify new Int16Array constructor undefined BYTES_PER_ELEMENT 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart16Test033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Int16Array(buf, undefined, undefined);
      let actual: int = arr.BYTES_PER_ELEMENT;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART16__3400
     * @tc.name int16ArrayConstructorPart16Test034
     * @tc.desc Verify new Int16Array constructor element values with undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart16Test034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(6);
      const arr = new Int16Array(buf, undefined, undefined);
      let actual: number = arr.$_get(0);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: number = arr.$_get(2);
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART16__3500
     * @tc.name int16ArrayConstructorPart16Test035
     * @tc.desc Verify new Int16Array constructor Number length byteLength length*2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart16Test035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const len: Number = 3 as Number;
      const arr = new Int16Array(buf, undefined, len);
      let actual: int = arr.byteLength;
      let expected: int = 6;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART16__3600
     * @tc.name int16ArrayConstructorPart16Test036
     * @tc.desc Verify new Int16Array constructor buffer offset0 offset2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart16Test036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view1 = new Int16Array(buf, 0);
      const view2 = new Int16Array(buf, 2);
      view1.$_set(0, 42);
      let actual: number = view2.$_get(0);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: ArrayBuffer = view1.buffer;
      let expected2: ArrayBuffer = view2.buffer;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART16__3700
     * @tc.name int16ArrayConstructorPart16Test037
     * @tc.desc Verify new Int16Array view offset(2) $_set(0, 99) is visible at base $_get(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart16Test037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const base = new Int16Array(buf, 0);
      const offsetView = new Int16Array(buf, 2);
      offsetView.$_set(0, 99);
      let actual: number = base.$_get(1);
      let expected: int = 99;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART16__3800
     * @tc.name int16ArrayConstructorPart16Test038
     * @tc.desc Verify new Int16Array overlapping views base and offset(2) share storage via $_set/$_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart16Test038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const base = new Int16Array(buf, 0);
      const overlap = new Int16Array(buf, 2);
      base.$_set(1, 44);
      let actual: number = overlap.$_get(0);
      let expected: int = 44;
      expect(actual).assertEqual(expected);
      overlap.$_set(1, 66);
      let actual2: number = base.$_get(2);
      let expected2: int = 66;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART16__3900
     * @tc.name int16ArrayConstructorPart16Test039
     * @tc.desc Verify new Int16Array view0 $_set(1, 111) is visible at view2 $_get(0) and view4 shares buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart16Test039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const view0 = new Int16Array(buf, 0);
      const view2 = new Int16Array(buf, 2);
      const view4 = new Int16Array(buf, 4);
      view0.$_set(1, 111);
      let actual: number = view2.$_get(0);
      let expected: int = 111;
      expect(actual).assertEqual(expected);
      let actual2: ArrayBuffer = view4.buffer;
      let expected2: ArrayBuffer = buf;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART16__4000
     * @tc.name int16ArrayConstructorPart16Test040
     * @tc.desc Verify new Int16Array view direct $_set writes into shared buffer visible at arr $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart16Test040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Int16Array(buf, 2);
      const directView = new Int16Array(buf, 0);
      directView.$_set(0, 88);
      let actual: number = arr.$_get(0);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      directView.$_set(1, 77);
      let actual2: number = arr.$_get(0);
      let expected2: int = 77;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART16__4100
     * @tc.name int16ArrayConstructorPart16Test041
     * @tc.desc Verify new Int16Array constructor offset buffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart16Test041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const base = new Int16Array(buf, 0);
      const offsetView = new Int16Array(buf, 2);
      let actual: ArrayBuffer = base.buffer;
      let expected: ArrayBuffer = offsetView.buffer;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART16__4200
     * @tc.name int16ArrayConstructorPart16Test042
     * @tc.desc Verify new Int16Array(ArrayBuffer 12, 0) and (ArrayBuffer 12, 4) set byteOffset to 0 and 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart16Test042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const view0 = new Int16Array(buf, 0);
      const view4 = new Int16Array(buf, 4);
      let actual: int = view0.byteOffset;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: int = view4.byteOffset;
      let expected2: int = 4;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART16__4300
     * @tc.name int16ArrayConstructorPart16Test043
     * @tc.desc Verify new Int16Array(ArrayBuffer 12, 0) and (ArrayBuffer 12, 4) set byteLength to 12 and 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart16Test043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const view0 = new Int16Array(buf, 0);
      const view4 = new Int16Array(buf, 4);
      let actual: int = view0.byteLength;
      let expected: int = 12;
      expect(actual).assertEqual(expected);
      let actual2: int = view4.byteLength;
      let expected2: int = 8;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART16__4400
     * @tc.name int16ArrayConstructorPart16Test044
     * @tc.desc Verify new Int16Array(ArrayBuffer 12, 0) and (ArrayBuffer 12, 4) set length to 6 and 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart16Test044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const view0 = new Int16Array(buf, 0);
      const view4 = new Int16Array(buf, 4);
      let actual: int = view0.length;
      let expected: int = 6;
      expect(actual).assertEqual(expected);
      let actual2: int = view4.length;
      let expected2: int = 4;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART16__4500
     * @tc.name int16ArrayConstructorPart16Test045
     * @tc.desc Verify new Int16Array view offset(2) $_set(0, NaN) writes 0 at base $_get(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart16Test045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const offsetView = new Int16Array(buf, 2);
      const base = new Int16Array(buf, 0);
      offsetView.$_set(0, Number.NaN);
      let actual: number = base.$_get(1);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART16__4600
     * @tc.name int16ArrayConstructorPart16Test046
     * @tc.desc Verify new Int16Array views (ArrayBuffer 12, 0, 1), (2, 1), (4, 1) keep independent $_set values via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart16Test046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const view0 = new Int16Array(buf, 0, 1);
      const view2 = new Int16Array(buf, 2, 1);
      const view4 = new Int16Array(buf, 4, 1);
      view0.$_set(0, 10);
      view2.$_set(0, 20);
      view4.$_set(0, 30);
      let actual: number = view0.$_get(0);
      let expected: int = 10;
      expect(actual).assertEqual(expected);
      let actual2: number = view2.$_get(0);
      let expected2: int = 20;
      expect(actual2).assertEqual(expected2);
      let actual3: number = view4.$_get(0);
      let expected3: int = 30;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART16__4700
     * @tc.name int16ArrayConstructorPart16Test047
     * @tc.desc Verify new Int16Array views view1 and view2 $_set(0, 0) read back 0 via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart16Test047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view1 = new Int16Array(buf, 0);
      const view2 = new Int16Array(buf, 2);
      view1.$_set(0, 0);
      view2.$_set(0, 0);
      let actual: number = view1.$_get(0);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: number = view2.$_get(0);
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART16__4800
     * @tc.name int16ArrayConstructorPart16Test048
     * @tc.desc Verify new Int16Array constructor offset buffer.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart16Test048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const view1 = new Int16Array(buf, 0);
      const view2 = new Int16Array(buf, 2);
      const view3 = new Int16Array(buf, 4);
      let actual: int = buf.byteLength;
      let expected: int = 8;
      expect(actual).assertEqual(expected);
    });

  });
}
