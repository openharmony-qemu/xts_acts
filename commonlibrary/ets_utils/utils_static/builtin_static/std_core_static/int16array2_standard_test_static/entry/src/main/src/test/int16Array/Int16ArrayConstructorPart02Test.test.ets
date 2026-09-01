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

export default function int16ArrayConstructorPart02Test(): void {
  describe("Int16ArrayConstructorPart02Test", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART02__0100
     * @tc.name int16ArrayConstructorPart02Test001
     * @tc.desc Verify new Int16Array(len=5) length equals 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart02Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: int = 5;
      let arr: Int16Array = new Int16Array(len);
      let actual: int = arr.length;
      let expected: int = 5;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART02__0200
     * @tc.name int16ArrayConstructorPart02Test002
     * @tc.desc Verify new Int16Array(length=-1) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart02Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len: int = -1;
      try {
        new Int16Array(len);
        expect().assertFail();
      } catch (e) {
        let actual: string = e.name;
        let expected: string = "RangeError";
        expect(actual).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART02__0300
     * @tc.name int16ArrayConstructorPart02Test003
     * @tc.desc Verify new Int16Array(0) length equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart02Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(0);
      let actual: int = arr.length;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART02__0400
     * @tc.name int16ArrayConstructorPart02Test004
     * @tc.desc Verify new Int16Array(0) byteLength equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart02Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(0);
      let actual: int = arr.byteLength;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART02__0500
     * @tc.name int16ArrayConstructorPart02Test005
     * @tc.desc Verify new Int16Array(0) byteOffset equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart02Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(0);
      let actual: int = arr.byteOffset;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART02__0600
     * @tc.name int16ArrayConstructorPart02Test006
     * @tc.desc Verify new Int16Array(0) buffer byteLength equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart02Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(0);
      let buf: ArrayBuffer = arr.buffer;
      let actual: int = buf.byteLength;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART02__0700
     * @tc.name int16ArrayConstructorPart02Test007
     * @tc.desc Verify new Int16Array(0) buffer.byteLength relation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart02Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(0);
      let actual: boolean = arr.buffer.byteLength >= 0;
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART02__0800
     * @tc.name int16ArrayConstructorPart02Test008
     * @tc.desc Verify new Int16Array(0) name equals Int16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart02Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(0);
      let actual: string = arr.name;
      let expected: string = "Int16Array";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART02__0900
     * @tc.name int16ArrayConstructorPart02Test009
     * @tc.desc Verify new Int16Array(0) BYTES_PER_ELEMENT equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart02Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(0);
      let actual: int = arr.BYTES_PER_ELEMENT;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART02__1000
     * @tc.name int16ArrayConstructorPart02Test010
     * @tc.desc Verify new Int16Array(0) $_get out of range throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart02Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(0);
      try {
        arr.$_get(0);
        expect().assertFail();
      } catch (e) {
        let actual: string = e.name;
        let expected: string = "RangeError";
        expect(actual).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART02__1100
     * @tc.name int16ArrayConstructorPart02Test011
     * @tc.desc Verify new Int16Array(0) $_set out of range throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart02Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(0);
      try {
        arr.$_set(0, 99);
        expect().assertFail();
      } catch (e) {
        let actual: string = e.name;
        let expected: string = "RangeError";
        expect(actual).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART02__1200
     * @tc.name int16ArrayConstructorPart02Test012
     * @tc.desc Verify new Int16Array(1) byteLength equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart02Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(1);
      let actual: int = arr.byteLength;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART02__1300
     * @tc.name int16ArrayConstructorPart02Test013
     * @tc.desc Verify new Int16Array(1) buffer.byteLength relation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart02Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(1);
      let actual: boolean = arr.buffer.byteLength >= 2;
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART02__1400
     * @tc.name int16ArrayConstructorPart02Test014
     * @tc.desc Verify new Int16Array(1) $_get out of range throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart02Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(1);
      try {
        arr.$_get(-1);
        expect().assertFail();
      } catch (e) {
        let actual: string = e.name;
        let expected: string = "RangeError";
        expect(actual).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART02__1500
     * @tc.name int16ArrayConstructorPart02Test015
     * @tc.desc Verify new Int16Array(1) $_set/$_get truncation semantics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart02Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(1);
      arr.$_set(0, 42);
      let actual: number = arr.$_get(0);
      let expected: int = 42;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART02__1600
     * @tc.name int16ArrayConstructorPart02Test016
     * @tc.desc Verify new Int16Array(1) $_set out of range throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart02Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(1);
      try {
        arr.$_set(1, 99);
        expect().assertFail();
      } catch (e) {
        let actual: string = e.name;
        let expected: string = "RangeError";
        expect(actual).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART02__1700
     * @tc.name int16ArrayConstructorPart02Test017
     * @tc.desc Verify new Int16Array(5) $_set/$_get truncation semantics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart02Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(5);
      let val:short = 32767
      arr.$_set(0, val);
      let actual: number = arr.$_get(0);
      let expected: short = 32767;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART02__1800
     * @tc.name int16ArrayConstructorPart02Test018
     * @tc.desc Verify new Int16Array(5) $_set/$_get truncation semantics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart02Test018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(5);
      let val:short = -32768
      arr.$_set(4, val);
      let actual: number = arr.$_get(4);
      let expected: short = -32768;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART02__1900
     * @tc.name int16ArrayConstructorPart02Test019
     * @tc.desc Verify new Int16Array(5) $_set/$_get truncation semantics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart02Test019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(5);
      arr.$_set(0, 32768);
      let actual: number = arr.$_get(0);
      let expected: short = -32768;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART02__2000
     * @tc.name int16ArrayConstructorPart02Test020
     * @tc.desc Verify new Int16Array(5) $_set/$_get truncation semantics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart02Test020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(5);
      arr.$_set(0, -32769);
      let actual: number = arr.$_get(0);
      let expected: short = 32767;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART02__2100
     * @tc.name int16ArrayConstructorPart02Test021
     * @tc.desc Verify new Int16Array(1000) length equals 1000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart02Test021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(1000);
      let actual: int = arr.length;
      let expected: int = 1000;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART02__2200
     * @tc.name int16ArrayConstructorPart02Test022
     * @tc.desc Verify new Int16Array(1000) byteLength equals 2000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart02Test022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(1000);
      let actual: int = arr.byteLength;
      let expected: int = 2000;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART02__2300
     * @tc.name int16ArrayConstructorPart02Test023
     * @tc.desc Verify new Int16Array(1000) $_set/$_get truncation semantics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart02Test023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(1000);
      arr.$_set(0, 1);
      arr.$_set(999, -1);
      let actual: number = arr.$_get(0);
      let expected: int = 1;
      expect(actual).assertEqual(expected);
      let actual2: number = arr.$_get(999);
      let expected2: int = -1;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART02__2400
     * @tc.name int16ArrayConstructorPart02Test024
     * @tc.desc Verify new Int16Array(1000) $_set out of range throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart02Test024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(1000);
      try {
        arr.$_set(1000, 99);
        expect().assertFail();
      } catch (e) {
        let actual: string = e.name;
        let expected: string = "RangeError";
        expect(actual).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART02__2500
     * @tc.name int16ArrayConstructorPart02Test025
     * @tc.desc Verify new Int16Array(32768) length equals 32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart02Test025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(32768);
      let actual: int = arr.length;
      let expected: int = 32768;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART02__2600
     * @tc.name int16ArrayConstructorPart02Test026
     * @tc.desc Verify new Int16Array(32768) byteLength equals 65536
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart02Test026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(32768);
      let actual: int = arr.byteLength;
      let expected: int = 65536;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART02__2700
     * @tc.name int16ArrayConstructorPart02Test027
     * @tc.desc Verify new Int16Array(32768) $_get equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart02Test027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(32768);
      let actual: number = arr.$_get(0);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: number = arr.$_get(16384);
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
      let val:short = 32767
      let actual3: number = arr.$_get(val);
      let expected3: int = 0;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART02__2800
     * @tc.name int16ArrayConstructorPart02Test028
     * @tc.desc Verify new Int16Array(0x10) length equals 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart02Test028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(0x10);
      let actual: int = arr.length;
      let expected: int = 16;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART02__2900
     * @tc.name int16ArrayConstructorPart02Test029
     * @tc.desc Verify new Int16Array(10) $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart02Test029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(10);
      let allZero: boolean = true;
      for (let i: int = 0; i < 10; i++) {
        if (arr.$_get(i) !== 0) {
          allZero = false;
          break;
        }
      }
      expect(allZero).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART02__3000
     * @tc.name int16ArrayConstructorPart02Test030
     * @tc.desc Verify new Int16Array(1) length equals 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart02Test030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(1);
      let actual: int = arr.length;
      let expected: int = 1;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART02__3100
     * @tc.name int16ArrayConstructorPart02Test031
     * @tc.desc Verify new Int16Array(1) BYTES_PER_ELEMENT equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart02Test031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(1);
      let actual: int = arr.BYTES_PER_ELEMENT;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART02__3200
     * @tc.name int16ArrayConstructorPart02Test032
     * @tc.desc Verify new Int16Array(4) shared buffer view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart02Test032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(4);
      let buf: ArrayBuffer = arr.buffer;
      let view: Int16Array = new Int16Array(buf, 0);
      let actual: boolean = view.length >= 4;
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART02__3300
     * @tc.name int16ArrayConstructorPart02Test033
     * @tc.desc Verify new Int16Array(4) byteOffset equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart02Test033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(4);
      let buf: ArrayBuffer = arr.buffer;
      let view: Int16Array = new Int16Array(buf, 0);
      let actual: int = view.byteOffset;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART02__3400
     * @tc.name int16ArrayConstructorPart02Test034
     * @tc.desc Verify new Int16Array(4) shared buffer view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart02Test034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(4);
      let buf: ArrayBuffer = arr.buffer;
      let view: Int16Array = new Int16Array(buf, 0);
      arr.$_set(0, 12345);
      let actual: number = view.$_get(0);
      let expected: int = 12345;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART02__3500
     * @tc.name int16ArrayConstructorPart02Test035
     * @tc.desc Verify new Int16Array(4) shared buffer view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart02Test035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(4);
      let buf: ArrayBuffer = arr.buffer;
      let view: Int16Array = new Int16Array(buf, 0);
      view.$_set(1, -12345);
      let actual: number = arr.$_get(1);
      let expected: int = -12345;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART02__3600
     * @tc.name int16ArrayConstructorPart02Test036
     * @tc.desc Verify new Int16Array(4) shared buffer view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart02Test036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(4);
      let buf: ArrayBuffer = arr.buffer;
      let view: Int16Array = new Int16Array(buf, 0);
      arr.$_set(0, 32768);
      let actual: number = view.$_get(0);
      let expected: int = -32768;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART02__3700
     * @tc.name int16ArrayConstructorPart02Test037
     * @tc.desc Verify new Int16Array(4) shared buffer view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart02Test037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(4);
      let buf: ArrayBuffer = arr.buffer;
      let view1: Int16Array = new Int16Array(buf, 0, 2);
      let view2: Int16Array = new Int16Array(buf, 4, 2);
      view1.$_set(0, 100);
      view2.$_set(0, 200);
      let actual: number = view1.$_get(0);
      let expected: int = 100;
      expect(actual).assertEqual(expected);
      let actual2: number = view2.$_get(0);
      let expected2: int = 200;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART02__3800
     * @tc.name int16ArrayConstructorPart02Test038
     * @tc.desc Verify new Int16Array(4) $_set/$_get truncation semantics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart02Test038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1: Int16Array = new Int16Array(4);
      let arr2: Int16Array = new Int16Array(4);
      arr1.$_set(0, 777);
      let actual: number = arr2.$_get(0);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART02__3900
     * @tc.name int16ArrayConstructorPart02Test039
     * @tc.desc Verify new Int16Array(4) $_set/$_get truncation semantics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart02Test039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1: Int16Array = new Int16Array(4);
      let arr2: Int16Array = new Int16Array(4);
      arr1.$_set(0, 555);
      arr2.$_set(0, 999);
      let actual: number = arr1.$_get(0);
      let expected: int = 555;
      expect(actual).assertEqual(expected);
      let actual2: number = arr2.$_get(0);
      let expected2: int = 999;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART02__4000
     * @tc.name int16ArrayConstructorPart02Test040
     * @tc.desc Verify new Int16Array(4) shared buffer view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart02Test040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(4);
      let buf: ArrayBuffer = arr.buffer;
      arr.$_set(0, 10);
      arr.$_set(1, 20);
      let subView: Int16Array = new Int16Array(buf, 2, 2);
      let actual: number = subView.$_get(0);
      let expected: int = 20;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART02__4100
     * @tc.name int16ArrayConstructorPart02Test041
     * @tc.desc Verify new Int16Array(3) $_set/$_get truncation semantics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart02Test041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(3);
      arr.$_set(2, 0xFFFF);
      let actual: number = arr.$_get(2);
      let expected: int = -1;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART02__4200
     * @tc.name int16ArrayConstructorPart02Test042
     * @tc.desc Verify new Int16Array(3) $_set/$_get truncation semantics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart02Test042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array(3);
      arr.$_set(0, 0x10000);
      let actual: number = arr.$_get(0);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

  });
}
