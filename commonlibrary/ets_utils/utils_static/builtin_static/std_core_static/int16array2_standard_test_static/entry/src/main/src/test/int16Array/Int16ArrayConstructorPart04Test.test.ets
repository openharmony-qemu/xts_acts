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

export default function int16ArrayConstructorPart04Test(): void {
  describe("Int16ArrayConstructorPart04Test", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART04__0100
     * @tc.name int16ArrayConstructorPart04Test001
     * @tc.desc Verify new Int16Array(other: Int16Array) source length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart04Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = new Int16Array(3);
      let copy: Int16Array = new Int16Array(src);
      let actual: int = copy.length;
      let expected: int = 3;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART04__0200
     * @tc.name int16ArrayConstructorPart04Test002
     * @tc.desc Verify new Int16Array(other: Int16Array) from empty source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart04Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = new Int16Array();
      let copy: Int16Array = new Int16Array(src);
      let actual: int = copy.length;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART04__0300
     * @tc.name int16ArrayConstructorPart04Test003
     * @tc.desc Verify new Int16Array(other: Int16Array) source length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart04Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = new Int16Array(0);
      let copy: Int16Array = new Int16Array(src);
      let actual: int = copy.length;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART04__0400
     * @tc.name int16ArrayConstructorPart04Test004
     * @tc.desc Verify new Int16Array(other: Int16Array) source elements [0] element values via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart04Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = new Int16Array([0] as Array<int>);
      let copy: Int16Array = new Int16Array(src);
      let actual: number = copy.$_get(0);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART04__0500
     * @tc.name int16ArrayConstructorPart04Test005
     * @tc.desc Verify new Int16Array(other: Int16Array) source elements [1] element values via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart04Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = new Int16Array([1] as Array<int>);
      let copy: Int16Array = new Int16Array(src);
      let actual: number = copy.$_get(0);
      let expected: int = 1;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART04__0600
     * @tc.name int16ArrayConstructorPart04Test006
     * @tc.desc Verify new Int16Array(other: Int16Array) source elements [-1] element values via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart04Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = new Int16Array([-1] as Array<int>);
      let copy: Int16Array = new Int16Array(src);
      let actual: number = copy.$_get(0);
      let expected: int = -1;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART04__0700
     * @tc.name int16ArrayConstructorPart04Test007
     * @tc.desc Verify new Int16Array(other: Int16Array) source elements [32767] element values via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart04Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val:short = 32767
      let src: Int16Array = new Int16Array([val] as Array<int>);
      let copy: Int16Array = new Int16Array(src);
      let actual: number = copy.$_get(0);
      let expected: int = 32767;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART04__0800
     * @tc.name int16ArrayConstructorPart04Test008
     * @tc.desc Verify new Int16Array(other: Int16Array) source elements [-32768] element values via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart04Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val:short = -32768
      let src: Int16Array = new Int16Array([val] as Array<int>);
      let copy: Int16Array = new Int16Array(src);
      let actual: number = copy.$_get(0);
      let expected: int = -32768;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART04__0900
     * @tc.name int16ArrayConstructorPart04Test009
     * @tc.desc Verify new Int16Array(other: Int16Array) source elements [0, 0] element values via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart04Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = new Int16Array([0, 0] as Array<int>);
      let copy: Int16Array = new Int16Array(src);
      let actual: number = copy.$_get(0);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: number = copy.$_get(1);
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART04__1000
     * @tc.name int16ArrayConstructorPart04Test010
     * @tc.desc Verify new Int16Array(other: Int16Array) source elements [1, 2, 3] element values via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart04Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = new Int16Array([1, 2, 3] as Array<int>);
      let copy: Int16Array = new Int16Array(src);
      let actual: number = copy.$_get(0);
      let expected: int = 1;
      expect(actual).assertEqual(expected);
      let actual2: number = copy.$_get(1);
      let expected2: int = 2;
      expect(actual2).assertEqual(expected2);
      let actual3: number = copy.$_get(2);
      let expected3: int = 3;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART04__1100
     * @tc.name int16ArrayConstructorPart04Test011
     * @tc.desc Verify new Int16Array(other: Int16Array) source elements [-1, -2, -3] element values via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart04Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = new Int16Array([-1, -2, -3] as Array<int>);
      let copy: Int16Array = new Int16Array(src);
      let actual: number = copy.$_get(0);
      let expected: int = -1;
      expect(actual).assertEqual(expected);
      let actual2: number = copy.$_get(1);
      let expected2: int = -2;
      expect(actual2).assertEqual(expected2);
      let actual3: number = copy.$_get(2);
      let expected3: int = -3;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART04__1200
     * @tc.name int16ArrayConstructorPart04Test012
     * @tc.desc Verify new Int16Array(other: Int16Array) source elements [32767, -32768, 32767, -32768, 32767] element values via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart04Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let valMax:short = 32767
      let valMin:short = -32768
      let src: Int16Array = new Int16Array([valMax, valMin, valMax, valMin, valMax] as Array<int>);
      let copy: Int16Array = new Int16Array(src);
      let actual: number = copy.$_get(0);
      let expected: int = 32767;
      expect(actual).assertEqual(expected);
      let actual2: number = copy.$_get(1);
      let expected2: int = -32768;
      expect(actual2).assertEqual(expected2);
      let actual3: number = copy.$_get(4);
      let expected3: int = 32767;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART04__1300
     * @tc.name int16ArrayConstructorPart04Test013
     * @tc.desc Verify new Int16Array(other: Int16Array) source length 3 after source $_set element values via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart04Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = new Int16Array(3);
      src.$_set(0, 10);
      src.$_set(1, 20);
      src.$_set(2, 30);
      let copy: Int16Array = new Int16Array(src);
      let actual: number = copy.$_get(0);
      let expected: int = 10;
      expect(actual).assertEqual(expected);
      let actual2: number = copy.$_get(2);
      let expected2: int = 30;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART04__1400
     * @tc.name int16ArrayConstructorPart04Test014
     * @tc.desc Verify new Int16Array(other: Int16Array) source from ArrayBuffer view after source $_set element values via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart04Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let src: Int16Array = new Int16Array(buf);
      src.$_set(0, 42);
      src.$_set(1, -99);
      let copy: Int16Array = new Int16Array(src);
      let actual: number = copy.$_get(0);
      let expected: int = 42;
      expect(actual).assertEqual(expected);
      let actual2: number = copy.$_get(1);
      let expected2: int = -99;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART04__1500
     * @tc.name int16ArrayConstructorPart04Test015
     * @tc.desc Verify new Int16Array(other: Int16Array) source from ArrayBuffer view byteOffset=2 length=3 after source $_set element values via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart04Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(10);
      let src: Int16Array = new Int16Array(buf, 2, 3);
      src.$_set(0, 11);
      src.$_set(2, 33);
      let copy: Int16Array = new Int16Array(src);
      let actual: int = copy.length;
      let expected: int = 3;
      expect(actual).assertEqual(expected);
      let actual2: number = copy.$_get(0);
      let expected2: int = 11;
      expect(actual2).assertEqual(expected2);
      let actual3: number = copy.$_get(2);
      let expected3: int = 33;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART04__1600
     * @tc.name int16ArrayConstructorPart04Test016
     * @tc.desc Verify new Int16Array(other: Int16Array) source length 10 after source $_set element values via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart04Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = new Int16Array(10);
      src.$_set(0, 1);
      src.$_set(9, -1);
      let copy: Int16Array = new Int16Array(src);
      let actual: int = copy.length;
      let expected: int = 10;
      expect(actual).assertEqual(expected);
      let actual2: number = copy.$_get(0);
      let expected2: int = 1;
      expect(actual2).assertEqual(expected2);
      let actual3: number = copy.$_get(9);
      let expected3: int = -1;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART04__1700
     * @tc.name int16ArrayConstructorPart04Test017
     * @tc.desc Verify new Int16Array(other: Int16Array) source length 100 after source $_set element values via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart04Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = new Int16Array(100);
      let valMax:short = 32767
      let valMin:short = -32768
      src.$_set(0, valMax);
      src.$_set(99, valMin);
      let copy: Int16Array = new Int16Array(src);
      let actual: int = copy.length;
      let expected: int = 100;
      expect(actual).assertEqual(expected);
      let actual2: number = copy.$_get(0);
      let expected2: int = 32767;
      expect(actual2).assertEqual(expected2);
      let actual3: number = copy.$_get(99);
      let expected3: int = -32768;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART04__1800
     * @tc.name int16ArrayConstructorPart04Test018
     * @tc.desc Verify new Int16Array(other: Int16Array) source elements [42, 42, 42] element values via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart04Test018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = new Int16Array([42, 42, 42] as Array<int>);
      let copy: Int16Array = new Int16Array(src);
      let actual: number = copy.$_get(0);
      let expected: int = 42;
      expect(actual).assertEqual(expected);
      let actual2: number = copy.$_get(1);
      let expected2: int = 42;
      expect(actual2).assertEqual(expected2);
      let actual3: number = copy.$_get(2);
      let expected3: int = 42;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART04__1900
     * @tc.name int16ArrayConstructorPart04Test019
     * @tc.desc Verify new Int16Array(other: Int16Array) source elements [99] element values via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart04Test019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = new Int16Array([99] as Array<int>);
      let copy: Int16Array = new Int16Array(src);
      let actual2: number = copy.$_get(0);
      let expected2: int = 99;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART04__2000
     * @tc.name int16ArrayConstructorPart04Test020
     * @tc.desc Verify new Int16Array(other: Int16Array) source length 1 copy length equals 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart04Test020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = new Int16Array(1);
      let copy: Int16Array = new Int16Array(src);
      let actual: int = copy.length;
      let expected: int = 1;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART04__2100
     * @tc.name int16ArrayConstructorPart04Test021
     * @tc.desc Verify new Int16Array(other: Int16Array) source length 1 copy length equals 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart04Test021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = new Int16Array(1);
      let copy: Int16Array = new Int16Array(src);
      let actual: int = copy.length;
      let expected: int = 1;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART04__2200
     * @tc.name int16ArrayConstructorPart04Test022
     * @tc.desc Verify new Int16Array(other: Int16Array) copy is not Int8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart04Test022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = new Int16Array(1);
      let copy: Any = new Int16Array(src);
      let actual: boolean = copy instanceof Int8Array;
      expect(actual).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART04__2300
     * @tc.name int16ArrayConstructorPart04Test023
     * @tc.desc Verify new Int16Array(other: Int16Array) copy is not Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart04Test023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = new Int16Array(1);
      let copy: Any = new Int16Array(src);
      let actual: boolean = copy instanceof Uint16Array;
      expect(actual).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART04__2400
     * @tc.name int16ArrayConstructorPart04Test024
     * @tc.desc Verify new Int16Array(other: Int16Array) source elements [42]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart04Test024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = new Int16Array([42] as Array<int>);
      let copy: Int16Array = new Int16Array(src);
      let actual: int = copy.length;
      let expected: int = 1;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART04__2500
     * @tc.name int16ArrayConstructorPart04Test025
     * @tc.desc Verify new Int16Array(other: Int16Array) source elements [1, 2, 3, 4, 5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart04Test025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = new Int16Array([1, 2, 3, 4, 5] as Array<int>);
      let copy: Int16Array = new Int16Array(src);
      let actual: int = copy.length;
      let expected: int = 5;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART04__2600
     * @tc.name int16ArrayConstructorPart04Test026
     * @tc.desc Verify new Int16Array(other: Int16Array) source length 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart04Test026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = new Int16Array(100);
      let copy: Int16Array = new Int16Array(src);
      let actual: int = copy.length;
      let expected: int = 100;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART04__2700
     * @tc.name int16ArrayConstructorPart04Test027
     * @tc.desc Verify new Int16Array(other: Int16Array) source elements [1, 2, 3] byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart04Test027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = new Int16Array([1, 2, 3] as Array<int>);
      let copy: Int16Array = new Int16Array(src);
      let actual: int = copy.byteLength;
      let expected: number = src.byteLength;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART04__2800
     * @tc.name int16ArrayConstructorPart04Test028
     * @tc.desc Verify new Int16Array(other: Int16Array) source elements [1, 2, 3, 4] byteLength BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart04Test028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = new Int16Array([1, 2, 3, 4] as Array<int>);
      let copy: Int16Array = new Int16Array(src);
      let actual: int = copy.byteLength;
      let expected: number = copy.length * Int16Array.BYTES_PER_ELEMENT;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART04__2900
     * @tc.name int16ArrayConstructorPart04Test029
     * @tc.desc Verify new Int16Array(other: Int16Array) source elements [1, 2] BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart04Test029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = new Int16Array([1, 2] as Array<int>);
      let copy: Int16Array = new Int16Array(src);
      let actual: int = copy.BYTES_PER_ELEMENT;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART04__3000
     * @tc.name int16ArrayConstructorPart04Test030
     * @tc.desc Verify new Int16Array(other: Int16Array) source elements [1, 2, 3] byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart04Test030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = new Int16Array([1, 2, 3] as Array<int>);
      let copy: Int16Array = new Int16Array(src);
      let actual: int = copy.byteOffset;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART04__3100
     * @tc.name int16ArrayConstructorPart04Test031
     * @tc.desc Verify new Int16Array(other: Int16Array) source elements [77, 88, 99] element values via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart04Test031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = new Int16Array([77, 88, 99] as Array<int>);
      let copy: Int16Array = new Int16Array(src);
      let actual: number = copy.$_get(0);
      let expected: number = src.$_get(0);
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART04__3200
     * @tc.name int16ArrayConstructorPart04Test032
     * @tc.desc Verify new Int16Array(other: Int16Array) source elements [11, 22, 33, 44] element values via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart04Test032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = new Int16Array([11, 22, 33, 44] as Array<int>);
      let copy: Int16Array = new Int16Array(src);
      let actual: number = copy.$_get(3);
      let expected: number = src.$_get(3);
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART04__3300
     * @tc.name int16ArrayConstructorPart04Test033
     * @tc.desc Verify new Int16Array(other: Int16Array) source elements [10, 20, 30, 40, 50] element values via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart04Test033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = new Int16Array([10, 20, 30, 40, 50] as Array<int>);
      let copy: Int16Array = new Int16Array(src);
      let actual: number = copy.$_get(2);
      let expected: number = src.$_get(2);
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART04__3400
     * @tc.name int16ArrayConstructorPart04Test034
     * @tc.desc Verify new Int16Array(other: Int16Array) source elements [5, -3, 32767, -32768, 0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart04Test034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let valMax:short = 32767
      let valMin:short = -32768
      let src: Int16Array = new Int16Array([5, -3, valMax, valMin, 0] as Array<int>);
      let copy: Int16Array = new Int16Array(src);
      let allMatch: boolean = true;
      for (let i: int = 0; i < copy.length; i++) {
        if (copy.$_get(i) !== src.$_get(i)) {
          allMatch = false;
        }
      }
      expect(allMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART04__3500
     * @tc.name int16ArrayConstructorPart04Test035
     * @tc.desc Verify new Int16Array(other: Int16Array) from empty source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart04Test035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = new Int16Array();
      let lenBefore: number = src.length;
      let copy: Int16Array = new Int16Array(src);
      let actual: int = src.length;
      let expected: number = lenBefore;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART04__3600
     * @tc.name int16ArrayConstructorPart04Test036
     * @tc.desc Verify new Int16Array(other: Int16Array) source elements [1, 2, 3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart04Test036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = new Int16Array([1, 2, 3] as Array<int>);
      let lenBefore: number = src.length;
      let copy: Int16Array = new Int16Array(src);
      let actual: int = src.length;
      let expected: number = lenBefore;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART04__3700
     * @tc.name int16ArrayConstructorPart04Test037
     * @tc.desc Verify new Int16Array(other: Int16Array) source elements [10, 20, 30] byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart04Test037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = new Int16Array([10, 20, 30] as Array<int>);
      let byteLenBefore: number = src.byteLength;
      let copy: Int16Array = new Int16Array(src);
      let actual: int = src.byteLength;
      let expected: number = byteLenBefore;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART04__3800
     * @tc.name int16ArrayConstructorPart04Test038
     * @tc.desc Verify new Int16Array(other: Int16Array) source elements [55, 66, 77] element values via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart04Test038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = new Int16Array([55, 66, 77] as Array<int>);
      let firstBefore: number = src.$_get(0);
      let copy: Int16Array = new Int16Array(src);
      let actual: number = src.$_get(0);
      let expected: number = firstBefore;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART04__3900
     * @tc.name int16ArrayConstructorPart04Test039
     * @tc.desc Verify new Int16Array(other: Int16Array) source elements [11, 22, 33, 44, 55]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart04Test039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = new Int16Array([11, 22, 33, 44, 55] as Array<int>);
      let lastIdx: int = src.length - 1;
      let lastBefore: number = src.$_get(lastIdx);
      let copy: Int16Array = new Int16Array(src);
      let actual: number = src.$_get(lastIdx);
      let expected: number = lastBefore;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART04__4000
     * @tc.name int16ArrayConstructorPart04Test040
     * @tc.desc Verify new Int16Array(other: Int16Array) source from ArrayBuffer view byteOffset=2 length=3 byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart04Test040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(10);
      let src: Int16Array = new Int16Array(buf, 2, 3);
      let offsetBefore: number = src.byteOffset;
      let copy: Int16Array = new Int16Array(src);
      let actual: int = src.byteOffset;
      let expected: number = offsetBefore;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART04__4100
     * @tc.name int16ArrayConstructorPart04Test041
     * @tc.desc Verify new Int16Array(other: Int16Array) source elements [1, 2, 3] independent buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart04Test041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = new Int16Array([1, 2, 3] as Array<int>);
      let copy: Int16Array = new Int16Array(src);
      let actual: boolean = copy.buffer === src.buffer;
      expect(actual).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART04__4200
     * @tc.name int16ArrayConstructorPart04Test042
     * @tc.desc Verify new Int16Array(other: Int16Array) source elements [100, 200] copy isolation after $_set element values via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart04Test042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = new Int16Array([100, 200] as Array<int>);
      let copy: Int16Array = new Int16Array(src);
      copy.$_set(0, 999);
      let actual: number = src.$_get(0);
      let expected: int = 100;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART04__4300
     * @tc.name int16ArrayConstructorPart04Test043
     * @tc.desc Verify new Int16Array(other: Int16Array) source elements [1, 2, 3, 4] copy isolation after $_set element values via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart04Test043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = new Int16Array([1, 2, 3, 4] as Array<int>);
      let copy: Int16Array = new Int16Array(src);
      copy.$_set(3, 888);
      let actual: number = src.$_get(3);
      let expected: int = 4;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART04__4400
     * @tc.name int16ArrayConstructorPart04Test044
     * @tc.desc Verify new Int16Array(other: Int16Array) source elements [50, 60, 70] after source $_set element values via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart04Test044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = new Int16Array([50, 60, 70] as Array<int>);
      let copy: Int16Array = new Int16Array(src);
      src.$_set(0, 999);
      let actual: number = copy.$_get(0);
      let expected: int = 50;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART04__4500
     * @tc.name int16ArrayConstructorPart04Test045
     * @tc.desc Verify new Int16Array(other: Int16Array) source elements [5, 10, 15, 20] after source $_set element values via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart04Test045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = new Int16Array([5, 10, 15, 20] as Array<int>);
      let copy: Int16Array = new Int16Array(src);
      src.$_set(3, 777);
      let actual: number = copy.$_get(3);
      let expected: int = 20;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART04__4600
     * @tc.name int16ArrayConstructorPart04Test046
     * @tc.desc Verify new Int16Array(other: Int16Array) source elements [11, 22, 33, 44] element values via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart04Test046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = new Int16Array([11, 22, 33, 44] as Array<int>);
      let copy: Int16Array = new Int16Array(src);
      let i: int = 0;
      while (i < copy.length) {
        copy.$_set(i, 0);
        i = i + 1;
      }
      let actual: number = src.$_get(0);
      let expected: int = 11;
      expect(actual).assertEqual(expected);
      let actual2: number = src.$_get(3);
      let expected2: int = 44;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART04__4700
     * @tc.name int16ArrayConstructorPart04Test047
     * @tc.desc Verify new Int16Array(other: Int16Array) source elements [1, 2, 3, 4, 5] element values via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart04Test047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = new Int16Array([1, 2, 3, 4, 5] as Array<int>);
      let copy: Int16Array = new Int16Array(src);
      let left: int = 0;
      let right: int = copy.length - 1;
      while (left < right) {
        let tmp: number = copy.$_get(left);
        copy.$_set(left, copy.$_get(right));
        copy.$_set(right, tmp);
        left = left + 1;
        right = right - 1;
      }
      let actual: number = src.$_get(0);
      let expected: int = 1;
      expect(actual).assertEqual(expected);
      let actual2: number = src.$_get(4);
      let expected2: int = 5;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART04__4800
     * @tc.name int16ArrayConstructorPart04Test048
     * @tc.desc Verify new Int16Array(other: Int16Array) source elements [10, 20, 30, 40] element values via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart04Test048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = new Int16Array([10, 20, 30, 40] as Array<int>);
      let copy: Int16Array = new Int16Array(src);
      let left: int = 0;
      let right: int = src.length - 1;
      while (left < right) {
        let tmp: number = src.$_get(left);
        src.$_set(left, src.$_get(right));
        src.$_set(right, tmp);
        left = left + 1;
        right = right - 1;
      }
      let actual: number = copy.$_get(0);
      let expected: int = 10;
      expect(actual).assertEqual(expected);
      let actual2: number = copy.$_get(3);
      let expected2: int = 40;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART04__4900
     * @tc.name int16ArrayConstructorPart04Test049
     * @tc.desc Verify new Int16Array(other: Int16Array) source elements [5, 3, 1, 4, 2] element values via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart04Test049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = new Int16Array([9, 7, 8, 6] as Array<int>);
      let copy: Int16Array = new Int16Array(src);
      let i: int = 0;
      while (i < copy.length) {
        let j: int = i + 1;
        while (j < copy.length) {
          if (copy.$_get(j) < copy.$_get(i)) {
            let tmp: number = copy.$_get(i);
            copy.$_set(i, copy.$_get(j));
            copy.$_set(j, tmp);
          }
          j = j + 1;
        }
        i = i + 1;
      }
      let actual: number = src.$_get(0);
      let expected: int = 9;
      expect(actual).assertEqual(expected);
      let actual2: number = src.$_get(3);
      let expected2: int = 6;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART04__5000
     * @tc.name int16ArrayConstructorPart04Test050
     * @tc.desc Verify new Int16Array(other: Int16Array) source elements [1, 2, 3, 4] element values via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart04Test050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = new Int16Array([1, 2, 3, 4] as Array<int>);
      let copy: Int16Array = new Int16Array(src);
      copy.$_set(0, 99);
      copy.$_set(1, 99);
      let actual: number = src.$_get(0);
      let expected: int = 1;
      expect(actual).assertEqual(expected);
      let actual2: number = src.$_get(1);
      let expected2: int = 2;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART04__5100
     * @tc.name int16ArrayConstructorPart04Test051
     * @tc.desc Verify new Int16Array(other: Int16Array) source elements [10, 20, 30, 40] element values via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart04Test051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = new Int16Array([10, 20, 30, 40] as Array<int>);
      let copy: Int16Array = new Int16Array(src);
      src.$_set(0, 88);
      src.$_set(1, 88);
      let actual: number = copy.$_get(0);
      let expected: int = 10;
      expect(actual).assertEqual(expected);
      let actual2: number = copy.$_get(1);
      let expected2: int = 20;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART04__5200
     * @tc.name int16ArrayConstructorPart04Test052
     * @tc.desc Verify new Int16Array(other: Int16Array) source elements [1, 2, 3, 4, 5] element values via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart04Test052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = new Int16Array([1, 2, 3, 4, 5] as Array<int>);
      let copy: Int16Array = new Int16Array(src);
      copy.$_set(0, copy.$_get(2));
      copy.$_set(1, copy.$_get(3));
      let actual: number = src.$_get(0);
      let expected: int = 1;
      expect(actual).assertEqual(expected);
      let actual2: number = src.$_get(1);
      let expected2: int = 2;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART04__5300
     * @tc.name int16ArrayConstructorPart04Test053
     * @tc.desc Verify new Int16Array(other: Int16Array) source elements [10, 20, 30, 40, 50] element values via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart04Test053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = new Int16Array([10, 20, 30, 40, 50] as Array<int>);
      let copy: Int16Array = new Int16Array(src);
      src.$_set(0, src.$_get(2));
      src.$_set(1, src.$_get(3));
      let actual: number = copy.$_get(0);
      let expected: int = 10;
      expect(actual).assertEqual(expected);
      let actual2: number = copy.$_get(1);
      let expected2: int = 20;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART04__5400
     * @tc.name int16ArrayConstructorPart04Test054
     * @tc.desc Verify new Int16Array(other: Int16Array) source from ArrayBuffer view after source $_set element values via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart04Test054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let src: Int16Array = new Int16Array(buf);
      src.$_set(0, 123);
      src.$_set(1, 456);
      let copy: Int16Array = new Int16Array(src);
      src.$_set(0, 999);
      let actual: number = copy.$_get(0);
      let expected: int = 123;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART04__5500
     * @tc.name int16ArrayConstructorPart04Test055
     * @tc.desc Verify new Int16Array(other: Int16Array) source elements [200, 300] copy isolation after $_set element values via $_get independent buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart04Test055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = new Int16Array([200, 300] as Array<int>);
      let copy: Int16Array = new Int16Array(src);
      copy.$_set(0, 777);
      let srcView: Int16Array = new Int16Array(src.buffer);
      let actual: number = srcView.$_get(0);
      let expected: int = 200;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART04__5600
     * @tc.name int16ArrayConstructorPart04Test056
     * @tc.desc Verify new Int16Array(other: Int16Array) source elements [1, 2, 3] element values via $_get double copy chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart04Test056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = new Int16Array([1, 2, 3] as Array<int>);
      let copy1: Int16Array = new Int16Array(src);
      let copy2: Int16Array = new Int16Array(copy1);
      copy2.$_set(0, 999);
      let actual: number = copy1.$_get(0);
      let expected: int = 1;
      expect(actual).assertEqual(expected);
      let actual2: number = src.$_get(0);
      let expected2: int = 1;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART04__5700
     * @tc.name int16ArrayConstructorPart04Test057
     * @tc.desc Verify new Int16Array(other: Int16Array) source elements [7, 14, 21] element values via $_get double copy chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart04Test057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = new Int16Array([7, 14, 21] as Array<int>);
      let copy1: Int16Array = new Int16Array(src);
      let copy2: Int16Array = new Int16Array(copy1);
      let actual: number = copy2.$_get(0);
      let expected: int = 7;
      expect(actual).assertEqual(expected);
      let actual2: number = copy2.$_get(1);
      let expected2: int = 14;
      expect(actual2).assertEqual(expected2);
      let actual3: number = copy2.$_get(2);
      let expected3: int = 21;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART04__5800
     * @tc.name int16ArrayConstructorPart04Test058
     * @tc.desc Verify new Int16Array(other: Int16Array) source elements [10, 20, 30, 40] copy isolation after $_set element values via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart04Test058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = new Int16Array([10, 20, 30, 40] as Array<int>);
      let copy: Int16Array = new Int16Array(src);
      copy.$_set(1, 999);
      let actual: number = src.$_get(1);
      let expected: int = 20;
      expect(actual).assertEqual(expected);
      let actual2: number = copy.$_get(1);
      let expected2: int = 999;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART04__5900
     * @tc.name int16ArrayConstructorPart04Test059
     * @tc.desc Verify new Int16Array(other: Int16Array) source elements [1, 2, 3] manual sum equals 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart04Test059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = new Int16Array([1, 2, 3] as Array<int>);
      let copy: Int16Array = new Int16Array(src);
      let sum: number = 0;
      let i: int = 0;
      while (i < copy.length) {
        sum = sum + copy.$_get(i);
        i = i + 1;
      }
      let actual: number = sum;
      let expected: int = 6;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART04__6000
     * @tc.name int16ArrayConstructorPart04Test060
     * @tc.desc Verify new Int16Array(other: Int16Array) source elements [1, 2, 3] element values via $_get mapped values independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart04Test060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = new Int16Array([1, 2, 3] as Array<int>);
      let copy: Int16Array = new Int16Array(src);
      let mapped: Int16Array = new Int16Array(copy.length);
      let i: int = 0;
      while (i < copy.length) {
        mapped.$_set(i, copy.$_get(i) * 2);
        i = i + 1;
      }
      let actual: number = copy.$_get(0);
      let expected: int = 1;
      expect(actual).assertEqual(expected);
      let actual2: number = mapped.$_get(0);
      let expected2: int = 2;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART04__6100
     * @tc.name int16ArrayConstructorPart04Test061
     * @tc.desc Verify new Int16Array(other: Int16Array) source elements [1, -2, 3, -4] positive count without filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart04Test061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = new Int16Array([1, -2, 3, -4] as Array<int>);
      let copy: Int16Array = new Int16Array(src);
      let posCount: int = 0;
      let i: int = 0;
      while (i < copy.length) {
        if (copy.$_get(i) > 0) {
          posCount = posCount + 1;
        }
        i = i + 1;
      }
      let actual: int = posCount;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
      let actual2: int = copy.length;
      let expected2: int = 4;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART04__6200
     * @tc.name int16ArrayConstructorPart04Test062
     * @tc.desc Verify new Int16Array(other: Int16Array) source elements [10, 20]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart04Test062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = new Int16Array([10, 20] as Array<int>);
      let copy: Int16Array = new Int16Array(src);
      let count: int = 0;
      let i: int = 0;
      while (i < copy.length) {
        let item: number = copy.$_get(i);
        if (!isNaN(item)) {
          count = count + 1;
        }
        i = i + 1;
      }
      let actual: int = count;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART04__6300
     * @tc.name int16ArrayConstructorPart04Test063
     * @tc.desc Verify new Int16Array(other: Int16Array) source elements [1, 2, 3] manual join string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart04Test063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = new Int16Array([1, 2, 3] as Array<int>);
      let copy: Int16Array = new Int16Array(src);
      let result: string = '';
      let i: int = 0;
      while (i < copy.length) {
        if (i > 0) {
          result = result + ',';
        }
        result = result + String(copy.$_get(i));
        i = i + 1;
      }
      let actual: string = result;
      let expected: string = "1,2,3";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART04__6400
     * @tc.name int16ArrayConstructorPart04Test064
     * @tc.desc Verify new Int16Array(other: Int16Array) source from ArrayBuffer view byteOffset=2 length=3 byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart04Test064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(10);
      let src: Int16Array = new Int16Array(buf, 2, 3);
      let copy: Int16Array = new Int16Array(src);
      let actual: int = copy.byteOffset;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: int = copy.length;
      let expected2: int = 3;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART04__6500
     * @tc.name int16ArrayConstructorPart04Test065
     * @tc.desc Verify new Int16Array(other: Int16Array) source elements [1, 2, 3, 4] copy isolation after $_set element values via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart04Test065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = new Int16Array([1, 2, 3, 4] as Array<int>);
      let copy: Int16Array = new Int16Array(src);
      copy.$_set(0, 0);
      copy.$_set(1, 0);
      let actual: number = copy.$_get(0);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: number = copy.$_get(3);
      let expected2: int = 4;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART04__6600
     * @tc.name int16ArrayConstructorPart04Test066
     * @tc.desc Verify new Int16Array(other: Int16Array) source elements [100, 200] element values via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart04Test066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = new Int16Array([100, 200] as Array<int>);
      let copy: Int16Array = new Int16Array(src);
      let diff: number = copy.$_get(1) - copy.$_get(0);
      expect(diff).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART04__6700
     * @tc.name int16ArrayConstructorPart04Test067
     * @tc.desc Verify new Int16Array(other: Int16Array) source elements [5, 10, 15] copy isolation after $_set element values via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart04Test067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Int16Array = new Int16Array([5, 10, 15] as Array<int>);
      let copyA: Int16Array = new Int16Array(src);
      let copyB: Int16Array = new Int16Array(src);
      copyA.$_set(0, 999);
      let actual: number = copyB.$_get(0);
      let expected: int = 5;
      expect(actual).assertEqual(expected);
    });

  });
}
