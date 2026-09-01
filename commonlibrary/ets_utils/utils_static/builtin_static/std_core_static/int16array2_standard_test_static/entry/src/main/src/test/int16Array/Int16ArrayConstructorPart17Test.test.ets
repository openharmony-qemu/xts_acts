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

export default function int16ArrayConstructorPart17Test(): void {
  describe("Int16ArrayConstructorPart17Test", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__0100
     * @tc.name int16ArrayConstructorPart17Test001
     * @tc.desc Verify new Int16Array 0 int number constructor(length: int)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array(0);
      let actual: int = arr.length;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: int = arr.byteLength;
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__0200
     * @tc.name int16ArrayConstructorPart17Test002
     * @tc.desc Verify new Int16Array(3) length is 3 and byteLength is 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array(3);
      let actual: int = arr.length;
      let expected: int = 3;
      expect(actual).assertEqual(expected);
      let actual2: int = arr.byteLength;
      let expected2: int = 6;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__0300
     * @tc.name int16ArrayConstructorPart17Test003
     * @tc.desc Verify new Int16Array int length constructor(length: int)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = 2;
      const arr = new Int16Array(len);
      let actual: int = arr.length;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__0400
     * @tc.name int16ArrayConstructorPart17Test004
     * @tc.desc Verify new Int16Array number length constructor(length: number)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: number = 2.0;
      const arr = new Int16Array(len);
      let actual: int = arr.length;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__0500
     * @tc.name int16ArrayConstructorPart17Test005
     * @tc.desc Verify new Int16Array 3.7 length constructor(length: number)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array(3.7);
      let actual: int = arr.length;
      let expected: int = 3;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__0600
     * @tc.name int16ArrayConstructorPart17Test006
     * @tc.desc Verify new Int16Array Int16Array constructor(other: Int16Array)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Int16Array.of(10, 20);
      const arr = new Int16Array(src);
      let actual: int = arr.length;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
      let actual2: number = arr.$_get(0);
      let expected2: int = 10;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__0700
     * @tc.name int16ArrayConstructorPart17Test007
     * @tc.desc Verify new Int16Array Array<int> constructor(numbers: Array<int>)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: int[] = [100, 200];
      const arr = new Int16Array(src);
      let actual: int = arr.length;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__0800
     * @tc.name int16ArrayConstructorPart17Test008
     * @tc.desc Verify new Int16Array Int16Array ArrayBuffer Int16Array Int16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Int16Array.of(5, 10, 15);
      const arr = new Int16Array(src);
      let actual: number = arr.$_get(1);
      let expected: int = 10;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__0900
     * @tc.name int16ArrayConstructorPart17Test009
     * @tc.desc Verify new Int16Array FixedArray<E> constructor(numbers: FixedArray<E>)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<int> = [100, 200];
      const arr = new Int16Array(src);
      let actual: int = arr.length;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__1000
     * @tc.name int16ArrayConstructorPart17Test010
     * @tc.desc Verify new Int16Array length=0 byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Int16Array();
      const arr2 = new Int16Array(0);
      let actual: int = arr1.byteOffset;
      let expected: int = arr2.byteOffset;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__1100
     * @tc.name int16ArrayConstructorPart17Test011
     * @tc.desc Verify new Int16Array length=0 byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Int16Array();
      const arr2 = new Int16Array(0);
      let actual: int = arr1.byteLength;
      let expected: int = arr2.byteLength;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__1200
     * @tc.name int16ArrayConstructorPart17Test012
     * @tc.desc Verify new Int16Array ArrayBuffer(0) length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Int16Array();
      const buf = new ArrayBuffer(0);
      const arr2 = new Int16Array(buf);
      let actual: int = arr1.length;
      let expected: int = arr2.length;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__1300
     * @tc.name int16ArrayConstructorPart17Test013
     * @tc.desc Verify new Int16Array ArrayBuffer (byteOffset) (byteOffset+length) undefined offset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr1 = new Int16Array(buf, undefined, undefined);
      const arr2 = new Int16Array(buf, 0, 2);
      let actual: int = arr1.byteOffset;
      let expected: int = arr2.byteOffset;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__1400
     * @tc.name int16ArrayConstructorPart17Test014
     * @tc.desc Verify new Int16Array ArrayBuffer undefined length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(6);
      const arr = new Int16Array(buf, 2, undefined);
      let actual: int = arr.length;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__1500
     * @tc.name int16ArrayConstructorPart17Test015
     * @tc.desc Verify new Int16Array BYTES_PER_ELEMENT 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Int16Array();
      const arr2 = new Int16Array(3);
      const arr3 = Int16Array.of(1, 2);
      let actual: int = arr1.BYTES_PER_ELEMENT;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
      let actual2: int = arr2.BYTES_PER_ELEMENT;
      let expected2: int = 2;
      expect(actual2).assertEqual(expected2);
      let actual3: int = arr3.BYTES_PER_ELEMENT;
      let expected3: int = 2;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__1600
     * @tc.name int16ArrayConstructorPart17Test016
     * @tc.desc Verify new Int16Array ArrayBuffer RangeError ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(3);
      let caught: boolean = false;
      try {
        const arr = new Int16Array(buf, 1);
        expect().assertFail();
      } catch (e) {
        caught = true;
        let actual: string = e.name;
        let expected: string = "RangeError";
        expect(actual).assertEqual(expected);
      }
      expect(caught).assertTrue();
      let actual2: int = buf.byteLength;
      let expected2: int = 3;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__1700
     * @tc.name int16ArrayConstructorPart17Test017
     * @tc.desc Verify new Int16Array(-1) throws RangeError and new Int16Array(1) length is 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let caught: boolean = false;
      try {
        const arr = new Int16Array(-1);
        expect().assertFail();
      } catch (e) {
        caught = true;
        let actual: string = e.name;
        let expected: string = "RangeError";
        expect(actual).assertEqual(expected);
      }
      const arr2 = new Int16Array(1);
      let actual2: int = arr2.length;
      let expected2: int = 1;
      expect(actual2).assertEqual(expected2);
      expect(caught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__1800
     * @tc.name int16ArrayConstructorPart17Test018
     * @tc.desc Verify new Int16Array ArrayBuffer RangeError ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(2);
      const view = new DataView(buf);
      view.setInt16(0, 999, true);
      let caught: boolean = false;
      try {
        const arr = new Int16Array(buf, 0, 2);
        expect().assertFail();
      } catch (e) {
        caught = true;
        let actual: string = e.name;
        let expected: string = "RangeError";
        expect(actual).assertEqual(expected);
      }
      const arrOk = new Int16Array(buf, 0, 1);
      let actual2: number = arrOk.$_get(0);
      let expected2: int = 999;
      expect(actual2).assertEqual(expected2);
      expect(caught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__1900
     * @tc.name int16ArrayConstructorPart17Test019
     * @tc.desc Verify new Int16Array(-5) throws RangeError and new Int16Array(5) length is 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let success: boolean = false;
      try {
        const arr = new Int16Array(-5);
        expect().assertFail();
      } catch (e) {
        success = true;
        let actual2: string = e.name;
        let expected2: string = "RangeError";
        expect(actual2).assertEqual(expected2);
      }
      const arr2 = new Int16Array(5);
      let actual: int = arr2.length;
      let expected: int = 5;
      expect(actual).assertEqual(expected);
      expect(success).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__2000
     * @tc.name int16ArrayConstructorPart17Test020
     * @tc.desc Verify new Int16Array() and new Int16Array(0) toString() returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Int16Array();
      const arr2 = new Int16Array(0);
      const s1: string = arr1.toString();
      const s2: string = arr2.toString();
      let actual: string = s1;
      let expected: string = "";
      expect(actual).assertEqual(expected);
      let actual2: string = s2;
      let expected2: string = "";
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__2100
     * @tc.name int16ArrayConstructorPart17Test021
     * @tc.desc Verify new Int16Array(Int16Array.of(1,2)) copy toString() length equals source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = Int16Array.of(1, 2);
      const arr2 = new Int16Array(arr1);
      const s1: string = arr1.toString();
      const s2: string = arr2.toString();
      let actual: int = s1.length;
      let expected: int = s2.length;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__2200
     * @tc.name int16ArrayConstructorPart17Test022
     * @tc.desc Verify new Int16Array ArrayBuffer Array byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: int[] = [10, 20];
      const arr1 = new Int16Array(src);
      const buf = new ArrayBuffer(4);
      const arr2 = new Int16Array(buf);
      let actual: int = arr1.byteOffset;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: int = arr2.byteOffset;
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__2300
     * @tc.name int16ArrayConstructorPart17Test023
     * @tc.desc Verify new Int16Array ArrayBuffer byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr1 = new Int16Array(buf);
      const arr2 = new Int16Array(buf, 2);
      let actual: int = arr1.byteOffset;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: int = arr2.byteOffset;
      let expected2: int = 2;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__2400
     * @tc.name int16ArrayConstructorPart17Test024
     * @tc.desc Verify new Int16Array buffer ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Int16Array(buf);
      let actual: boolean = arr.buffer === buf;
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__2500
     * @tc.name int16ArrayConstructorPart17Test025
     * @tc.desc Verify new Int16Array buffer ArrayLike ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Int16Array.of(1, 2, 3);
      const buf = new ArrayBuffer(6);
      const view = new DataView(buf);
      view.setInt16(0, 1, true);
      view.setInt16(2, 2, true);
      view.setInt16(4, 3, true);
      const arr = new Int16Array(src);
      let actual: int = arr.buffer.byteLength;
      let expected: int = 6;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__2600
     * @tc.name int16ArrayConstructorPart17Test026
     * @tc.desc Verify new Int16Array copy $_set(0,999) does not affect source $_get(0) equals 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Int16Array.of(100, 200, 300);
      const copy = new Int16Array(src);
      copy.$_set(0, 999);
      let actual: number = src.$_get(0);
      let expected: int = 100;
      expect(actual).assertEqual(expected);
      let actual2: number = copy.$_get(0);
      let expected2: int = 999;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__2700
     * @tc.name int16ArrayConstructorPart17Test027
     * @tc.desc Verify new Int16Array ArrayBuffer $_set(0,777) reflects in DataView getInt16(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const dv = new DataView(buf);
      dv.setInt16(0, 42, true);
      const arr = new Int16Array(buf);
      arr.$_set(0, 777);
      const newVal: number = dv.getInt16(0, true);
      expect(newVal).assertEqual(777);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__2800
     * @tc.name int16ArrayConstructorPart17Test028
     * @tc.desc Verify new Int16Array ArrayBuffer DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Int16Array(buf);
      const dv = new DataView(buf);
      arr.$_set(0, 12345);
      let actual: number = dv.getInt16(0, true);
      let expected: int = 12345;
      expect(actual).assertEqual(expected);
      dv.setInt16(2, -4567, true);
      let actual2: number = arr.$_get(1);
      let expected2: int = -4567;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__2900
     * @tc.name int16ArrayConstructorPart17Test029
     * @tc.desc Verify new Int16Array overlapping views $_set(1,555) and $_set(1,666) share buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(6);
      const arr1 = new Int16Array(buf, 0, 3);
      const arr2 = new Int16Array(buf, 2, 2);
      arr1.$_set(1, 555);
      let actual: number = arr2.$_get(0);
      let expected: int = 555;
      expect(actual).assertEqual(expected);
      arr2.$_set(1, 666);
      let actual2: number = arr1.$_get(2);
      let expected2: int = 666;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__3000
     * @tc.name int16ArrayConstructorPart17Test030
     * @tc.desc Verify new Int16Array copy buffer is not the same reference as source buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Int16Array.of(1, 2, 3);
      const copy = new Int16Array(src);
      let actual: boolean = src.buffer === copy.buffer;
      expect(actual).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__3100
     * @tc.name int16ArrayConstructorPart17Test031
     * @tc.desc Verify new Int16Array ArrayBuffer byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(10);
      const arr = new Int16Array(buf, 2);
      let actual: int = arr.byteLength;
      let expected: int = 8;
      expect(actual).assertEqual(expected);
      let actual2: int = arr.length;
      let expected2: int = 4;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__3200
     * @tc.name int16ArrayConstructorPart17Test032
     * @tc.desc Verify new Int16Array ArrayBuffer byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr0 = new Int16Array(buf);
      const arr2 = new Int16Array(buf, 2);
      const arr4 = new Int16Array(buf, 4);
      let actual: int = arr0.byteOffset;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: int = arr2.byteOffset;
      let expected2: int = 2;
      expect(actual2).assertEqual(expected2);
      let actual3: int = arr4.byteOffset;
      let expected3: int = 4;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__3300
     * @tc.name int16ArrayConstructorPart17Test033
     * @tc.desc Verify new Int16Array buffer ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(6);
      const arr1 = new Int16Array(buf);
      const arr2 = new Int16Array(arr1.buffer);
      arr2.$_set(0, 999);
      let actual: number = arr1.$_get(0);
      let expected: int = 999;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__3400
     * @tc.name int16ArrayConstructorPart17Test034
     * @tc.desc Verify new Int16Array(arr1.buffer) byteOffset is 0 and length is 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr1 = new Int16Array(buf, 4, 2);
      const arr2 = new Int16Array(arr1.buffer);
      let actual: int = arr2.byteOffset;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: int = arr2.length;
      let expected2: int = 4;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__3500
     * @tc.name int16ArrayConstructorPart17Test035
     * @tc.desc Verify new Int16Array shared ArrayBuffer $_set(0,123) visible via other view $_get(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr1 = new Int16Array(buf);
      const arr2 = new Int16Array(buf);
      arr1.$_set(0, 123);
      let actual: number = arr2.$_get(0);
      let expected: int = 123;
      expect(actual).assertEqual(expected);
      arr2.$_set(1, 456);
      let actual2: number = arr1.$_get(1);
      let expected2: int = 456;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__3600
     * @tc.name int16ArrayConstructorPart17Test036
     * @tc.desc Verify new Int16Array $_set(0,256) low byte is 0 and high byte is 1 in Int8Array view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const i16 = new Int16Array(buf);
      const i8 = new Int8Array(buf);
      i16.$_set(0, 256);
      let actual: number = i8.$_get(0);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: number = i8.$_get(1);
      let expected2: int = 1;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__3700
     * @tc.name int16ArrayConstructorPart17Test037
     * @tc.desc Verify new Int16Array $_set(0,32767) $_get(0) equals 32767 and Uint8 low byte equals 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const i16 = new Int16Array(buf);
      const u8 = new Uint8Array(buf);
      let val:short = 32767
      i16.$_set(0, val);
      let actual: number = i16.$_get(0);
      let expected: int = 32767;
      expect(actual).assertEqual(expected);
      let actual2: number = u8.$_get(0);
      expect(actual2).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__3800
     * @tc.name int16ArrayConstructorPart17Test038
     * @tc.desc Verify new Int16Array buffer length byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Int16Array(buf);
      const prevLen: number = arr.length;
      const prevByteLen: number = arr.byteLength;
      arr.$_set(0, 9999);
      let actual: int = arr.length;
      let expected: number = prevLen;
      expect(actual).assertEqual(expected);
      let actual2: int = arr.byteLength;
      let expected2: number = prevByteLen;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__3900
     * @tc.name int16ArrayConstructorPart17Test039
     * @tc.desc Verify new Int16Array ArrayBuffer Array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr1 = new Int16Array(buf);
      const arr2 = new Int16Array(2);
      let actual: number = arr1.$_get(0);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: number = arr1.$_get(1);
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr2.$_get(0);
      let expected3: int = 0;
      expect(actual3).assertEqual(expected3);
      let actual4: number = arr2.$_get(1);
      let expected4: int = 0;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__4000
     * @tc.name int16ArrayConstructorPart17Test040
     * @tc.desc Verify new Int16Array copy elements equal source elements by index iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Int16Array.of(100, 200, 300);
      const copy = new Int16Array(src);
      let match: boolean = true;
      for (let i = 0; i < src.length; i++) {
        if (src.$_get(i) !== copy.$_get(i)) {
          match = false;
        }
      }
      expect(match).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__4100
     * @tc.name int16ArrayConstructorPart17Test041
     * @tc.desc Verify new Int16Array constructor variants produce correct length for empty, sized, copy and ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr0 = new Int16Array();
      const arr3 = new Int16Array(3);
      const arrCopy = new Int16Array(Int16Array.of(1, 2));
      const buf = new ArrayBuffer(4);
      const arrBuf = new Int16Array(buf);
      let actual: int = arr0.length;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: int = arr3.length;
      let expected2: int = 3;
      expect(actual2).assertEqual(expected2);
      let actual3: int = arrCopy.length;
      let expected3: int = 2;
      expect(actual3).assertEqual(expected3);
      let actual4: int = arrBuf.length;
      let expected4: int = 2;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__4200
     * @tc.name int16ArrayConstructorPart17Test042
     * @tc.desc Verify new Int16Array out-of-range index $_get throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = Int16Array.of(1, 2);
      const arr2 = new Int16Array(arr1);
      const buf = new ArrayBuffer(4);
      const arr3 = new Int16Array(buf);
      try {
        arr1.$_get(5);
        expect().assertFail();
      } catch (e) {
        let actual: string = e.name;
        let expected: string = "RangeError";
        expect(actual).assertEqual(expected);
      }
      try {
        arr2.$_get(5);
        expect().assertFail();
      } catch (e) {
        let actual2: string = e.name;
        let expected2: string = "RangeError";
        expect(actual2).assertEqual(expected2);
      }
      try {
        arr3.$_get(2);
        expect().assertFail();
      } catch (e) {
        let actual3: string = e.name;
        let expected3: string = "RangeError";
        expect(actual3).assertEqual(expected3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__4300
     * @tc.name int16ArrayConstructorPart17Test043
     * @tc.desc Verify new Int16Array $_set out of range throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = Int16Array.of(1, 2);
      const arr2 = new Int16Array(arr1);
      try {
        arr1.$_set(100, 999);
        expect().assertFail();
      } catch (e) {
        let actual: string = e.name;
        let expected: string = "RangeError";
        expect(actual).assertEqual(expected);
      }
      try {
        arr2.$_set(100, 999);
        expect().assertFail();
      } catch (e) {
        let actual2: string = e.name;
        let expected2: string = "RangeError";
        expect(actual2).assertEqual(expected2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__4400
     * @tc.name int16ArrayConstructorPart17Test044
     * @tc.desc Verify new Int16Array negative index $_get throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr1 = new Int16Array(buf);
      const arr2 = Int16Array.of(1, 2);
      try {
        arr1.$_get(-1);
        expect().assertFail();
      } catch (e) {
        let actual: string = e.name;
        let expected: string = "RangeError";
        expect(actual).assertEqual(expected);
      }
      try {
        arr2.$_get(-1);
        expect().assertFail();
      } catch (e) {
        let actual2: string = e.name;
        let expected2: string = "RangeError";
        expect(actual2).assertEqual(expected2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__4500
     * @tc.name int16ArrayConstructorPart17Test045
     * @tc.desc Verify new Int16Array BYTES_PER_ELEMENT 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array();
      let actual: int = Int16Array.BYTES_PER_ELEMENT;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
      let actual2: int = arr.BYTES_PER_ELEMENT;
      let expected2: int = 2;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__4600
     * @tc.name int16ArrayConstructorPart17Test046
     * @tc.desc Verify new Int16Array ArrayBuffer buffer null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test046", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr = new Int16Array(buf);
      let actual: int = arr.buffer.byteLength;
      let expected: int = 4;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__4700
     * @tc.name int16ArrayConstructorPart17Test047
     * @tc.desc Verify new Int16Array ArrayLike buffer null ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test047", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3);
      let actual: int = arr.buffer.byteLength;
      let expected: int = 6;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__4800
     * @tc.name int16ArrayConstructorPart17Test048
     * @tc.desc Verify new Int16Array byteLength length BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Int16Array(3);
      const arr2 = Int16Array.of(1, 2, 3, 4);
      const buf3 = new ArrayBuffer(6);
      const arr3 = new Int16Array(buf3);
      let actual: int = arr1.byteLength;
      let expected: int = arr1.length * Int16Array.BYTES_PER_ELEMENT;
      expect(actual).assertEqual(expected);
      let actual2: int = arr2.byteLength;
      let expected2: int = arr2.length * Int16Array.BYTES_PER_ELEMENT;
      expect(actual2).assertEqual(expected2);
      let actual3: int = arr3.byteLength;
      let expected3: int = arr3.length * Int16Array.BYTES_PER_ELEMENT;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__4900
     * @tc.name int16ArrayConstructorPart17Test049
     * @tc.desc Verify new Int16Array from Array<int> and FixedArray<int> produce equal $_get(0) and $_get(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src1: int[] = [100, 200];
      const src2: FixedArray<int> = [100, 200];
      const arr1 = new Int16Array(src1);
      const arr2 = new Int16Array(src2);
      let actual: number = arr1.$_get(0);
      let expected: number = arr2.$_get(0);
      expect(actual).assertEqual(expected);
      let actual2: number = arr1.$_get(1);
      let expected2: number = arr2.$_get(1);
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__5000
     * @tc.name int16ArrayConstructorPart17Test050
     * @tc.desc Verify new Int16Array int16 Array<int> Int16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: int[] = [40000, -40000];
      const arr1 = new Int16Array(src);
      const arr2 = new Int16Array(src);
      let actual: number = arr1.$_get(0);
      let expected: number = arr2.$_get(0);
      expect(actual).assertEqual(expected);
      let actual2: number = arr1.$_get(1);
      let expected2: number = arr2.$_get(1);
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__5100
     * @tc.name int16ArrayConstructorPart17Test051
     * @tc.desc Verify new Int16Array constructor(0) vs Int16Array.of()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Int16Array(0);
      const arr2 = Int16Array.of();
      let actual: int = arr1.length;
      let expected: int = arr2.length;
      expect(actual).assertEqual(expected);
      let actual2: int = arr1.byteLength;
      let expected2: int = arr2.byteLength;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__5200
     * @tc.name int16ArrayConstructorPart17Test052
     * @tc.desc Verify new Int16Array constructor(length) vs Int16Array.of(...) length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Int16Array(3);
      const arr2 = Int16Array.of(0, 0, 0);
      let actual: int = arr1.length;
      let expected: int = arr2.length;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__5300
     * @tc.name int16ArrayConstructorPart17Test053
     * @tc.desc Verify new Int16Array constructor(Int16Array) vs Int16Array.from(Int16Array) length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test053", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Int16Array.of(10, 20, 30);
      const copy1 = new Int16Array(src);
      const copy2 = Int16Array.from(src);
      let actual: int = copy1.length;
      let expected: int = copy2.length;
      expect(actual).assertEqual(expected);
      let actual2: number = copy1.$_get(0);
      let expected2: number = copy2.$_get(0);
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__5400
     * @tc.name int16ArrayConstructorPart17Test054
     * @tc.desc Verify new Int16Array constructor(Array<int>) vs Int16Array.from(Array<int>)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: int[] = [5, 10, 15];
      const arr1 = new Int16Array(src);
      const arr2 = Int16Array.from(src);
      let actual: int = arr1.length;
      let expected: int = arr2.length;
      expect(actual).assertEqual(expected);
      let actual2: number = arr1.$_get(1);
      let expected2: number = arr2.$_get(1);
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__5500
     * @tc.name int16ArrayConstructorPart17Test055
     * @tc.desc Verify new Int16Array (int ) vs (int +int )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr2 = new Int16Array(buf, 0);
      const arr3 = new Int16Array(buf, 0, 2);
      let actual: int = arr2.length;
      let expected: int = 4;
      expect(actual).assertEqual(expected);
      let actual2: int = arr3.length;
      let expected2: int = 2;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__5600
     * @tc.name int16ArrayConstructorPart17Test056
     * @tc.desc Verify new Int16Array (number ) vs (Number +Number )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr1 = new Int16Array(buf, 0.9);
      const arr2 = new Int16Array(buf, 0, 2);
      let actual: int = arr1.byteOffset;
      let expected: int = arr2.byteOffset;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__5700
     * @tc.name int16ArrayConstructorPart17Test057
     * @tc.desc Verify new Int16Array ArrayBuffer+ + vs ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test057", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(6);
      const arr1 = new Int16Array(buf);
      const arr2 = new Int16Array(buf, undefined, undefined);
      let actual: int = arr1.length;
      let expected: int = arr2.length;
      expect(actual).assertEqual(expected);
      let actual2: int = arr1.byteOffset;
      let expected2: int = arr2.byteOffset;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__5800
     * @tc.name int16ArrayConstructorPart17Test058
     * @tc.desc Verify new Int16Array ArrayBuffer+0 + vs ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(6);
      const arr1 = new Int16Array(buf);
      const arr2 = new Int16Array(buf, 0, undefined);
      let actual: int = arr1.length;
      let expected: int = arr2.length;
      expect(actual).assertEqual(expected);
      let actual2: int = arr1.byteOffset;
      let expected2: int = arr2.byteOffset;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__5900
     * @tc.name int16ArrayConstructorPart17Test059
     * @tc.desc Verify new Int16Array(-1) and new Int16Array(ArrayBuffer, 1) throw RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr1 = new Int16Array(-1);
        expect().assertFail();
      } catch (e) {
        let actual: string = e.name;
        let expected: string = "RangeError";
        expect(actual).assertEqual(expected);
      }
      try {
        const buf = new ArrayBuffer(3);
        const arr2 = new Int16Array(buf, 1);
        expect().assertFail();
      } catch (e) {
        let actual2: string = e.name;
        let expected2: string = "RangeError";
        expect(actual2).assertEqual(expected2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__6000
     * @tc.name int16ArrayConstructorPart17Test060
     * @tc.desc Verify new Int16Array(-5) throws RangeError while existing Int16Array stays intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = Int16Array.of(1, 2, 3);
      let caught: boolean = false;
      try {
        const arr2 = new Int16Array(-5);
        expect().assertFail();
      } catch (e) {
        caught = true;
        let actual3: string = e.name;
        let expected3: string = "RangeError";
        expect(actual3).assertEqual(expected3);
      }
      let actual: int = arr1.length;
      let expected: int = 3;
      expect(actual).assertEqual(expected);
      let actual2: number = arr1.$_get(0);
      let expected2: int = 1;
      expect(actual2).assertEqual(expected2);
      expect(caught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__6100
     * @tc.name int16ArrayConstructorPart17Test061
     * @tc.desc Verify new Int16Array int16.MAX+1 Int16Array ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val:short = 32767
      const src = Int16Array.of(val);
      src.$_set(0, 32768);
      const copy = new Int16Array(src);
      const buf = new ArrayBuffer(2);
      const dv = new DataView(buf);
      dv.setInt16(0, 32768, true);
      const arrBuf = new Int16Array(buf);
      let actual: number = copy.$_get(0);
      let expected: number = arrBuf.$_get(0);
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__6200
     * @tc.name int16ArrayConstructorPart17Test062
     * @tc.desc Verify new Int16Array Array<int> vs Int16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src1: int[] = [32768, -32769];
      const arr1 = new Int16Array(src1);
      const arr2 = new Int16Array(src1);
      let actual: number = arr1.$_get(0);
      let expected: number = arr2.$_get(0);
      expect(actual).assertEqual(expected);
      let actual2: number = arr1.$_get(1);
      let expected2: number = arr2.$_get(1);
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__6300
     * @tc.name int16ArrayConstructorPart17Test063
     * @tc.desc Verify new Int16Array for-of iteration sums to 6 for of(), copy and Array<int> source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = Int16Array.of(1, 2, 3);
      const arr2 = new Int16Array(arr1);
      const src: int[] = [1, 2, 3];
      const arr3 = new Int16Array(src);
      let sum1: number = 0;
      let sum2: number = 0;
      let sum3: number = 0;
      for (let element1 of arr1) { sum1 = sum1 + element1; }
      for (let element2 of arr2) { sum2 = sum2 + element2; }
      for (let element3 of arr3) { sum3 = sum3 + element3; }
      expect(sum1).assertEqual(6);
      expect(sum2).assertEqual(6);
      expect(sum3).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__6400
     * @tc.name int16ArrayConstructorPart17Test064
     * @tc.desc Verify new Int16Array NaN length constructor(length: number) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Int16Array(Number.NaN);
      const arr2 = new Int16Array();
      let actual: int = arr1.length;
      let expected: int = arr2.length;
      expect(actual).assertEqual(expected);
      let actual2: int = arr1.byteLength;
      let expected2: int = arr2.byteLength;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__6500
     * @tc.name int16ArrayConstructorPart17Test065
     * @tc.desc Verify new Int16Array Infinity length constructor(length: number) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr1 = new Int16Array(Number.POSITIVE_INFINITY);
        expect().assertFail();
      } catch (e) {
        let actual: string = e.name;
        let expected: string = "RangeError";
        expect(actual).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__6600
     * @tc.name int16ArrayConstructorPart17Test066
     * @tc.desc Verify new Int16Array -Infinity length constructor(length: number) RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let caught: boolean = false;
      try {
        const arr = new Int16Array(-Number.POSITIVE_INFINITY);
        expect().assertFail();
      } catch (e) {
        caught = true;
        let actual: string = e.name;
        let expected: string = "RangeError";
        expect(actual).assertEqual(expected);
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__6700
     * @tc.name int16ArrayConstructorPart17Test067
     * @tc.desc Verify new Int16Array FixedArray<int> constructor(numbers: FixedArray<E>)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test067", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<int> = [10, 20, 30];
      const arr = new Int16Array(src);
      let actual: int = arr.length;
      let expected: int = 3;
      expect(actual).assertEqual(expected);
      let actual2: number = arr.$_get(0);
      let expected2: int = 10;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__6800
     * @tc.name int16ArrayConstructorPart17Test068
     * @tc.desc Verify new Int16Array FixedArray<number> constructor(numbers: FixedArray<number>)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test068", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<number> = [1.5, 2.5, 3.5];
      const arr = new Int16Array(src);
      let actual: int = arr.length;
      let expected: int = 3;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__6900
     * @tc.name int16ArrayConstructorPart17Test069
     * @tc.desc Verify new Int16Array buf arr1 arr2 arr1.buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test069", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr1 = new Int16Array(buf, 2, 3);
      const arr2 = new Int16Array(arr1.buffer);
      arr2.$_set(1, 777);
      let actual: number = arr1.$_get(0);
      let expected: int = 777;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__7000
     * @tc.name int16ArrayConstructorPart17Test070
     * @tc.desc Verify new Int16Array(arr1.buffer,2,4) byteOffset is 2 and length is 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(10);
      const arr1 = new Int16Array(buf, 4, 3);
      const arr2 = new Int16Array(arr1.buffer, 2, 4);
      let actual: int = arr2.byteOffset;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
      let actual2: int = arr2.length;
      let expected2: int = 4;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__7100
     * @tc.name int16ArrayConstructorPart17Test071
     * @tc.desc Verify new Int16Array Int16Array Int32Array buffer int16 int32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test071", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const i16 = new Int16Array(buf);
      const i32 = new Int32Array(buf);
      i16.$_set(0, 1);
      i16.$_set(1, 1);
      i32.$_set(0, 0);
      let actual: number = i16.$_get(0);
      expect(actual).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__7200
     * @tc.name int16ArrayConstructorPart17Test072
     * @tc.desc Verify new Int16Array Int16Array Float32Array buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test072", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const i16 = new Int16Array(buf);
      const f32 = new Float32Array(buf);
      i16.$_set(0, 12345);
      i16.$_set(0, 0);
      f32.$_set(0, 3.14);
      let actual: number = i16.$_get(0);
      expect(actual).assertEqual(-2621);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__7300
     * @tc.name int16ArrayConstructorPart17Test073
     * @tc.desc Verify two Int16Array views on the same ArrayBuffer are not reference-equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test073", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const arr1 = new Int16Array(buf);
      const arr2 = new Int16Array(buf);
      let actual: boolean = arr1 === arr2;
      expect(actual).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__7400
     * @tc.name int16ArrayConstructorPart17Test074
     * @tc.desc Verify new Int16Array copies are not reference-equal but $_get(0) values are equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test074", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Int16Array.of(1, 2, 3);
      const copy1 = new Int16Array(src);
      const copy2 = new Int16Array(src);
      let actual: boolean = copy1 === copy2;
      expect(actual).assertFalse();
      let actual2: number = copy1.$_get(0);
      let expected2: number = copy2.$_get(0);
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__7500
     * @tc.name int16ArrayConstructorPart17Test075
     * @tc.desc Verify new Int16Array fill(99) sets $_get(0), $_get(1) and $_get(2) to 99 for length, of and ArrayBuffer sources
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test075", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Int16Array(3).fill(99);
      const arr2 = new Int16Array(Int16Array.of(0, 0, 0)).fill(99);
      const buf = new ArrayBuffer(6);
      const arr3 = new Int16Array(buf).fill(99);
      let actual: number = arr1.$_get(0);
      let expected: int = 99;
      expect(actual).assertEqual(expected);
      let actual2: number = arr2.$_get(1);
      let expected2: int = 99;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr3.$_get(2);
      let expected3: int = 99;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART17__7600
     * @tc.name int16ArrayConstructorPart17Test076
     * @tc.desc Verify new Int16Array copy reverse() yields $_get(0) equals 3 and $_get(2) equals 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart17Test076", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = Int16Array.of(1, 2, 3);
      const arr2 = new Int16Array(arr1);
      arr2.reverse();
      let actual: number = arr2.$_get(0);
      let expected: int = 3;
      expect(actual).assertEqual(expected);
      let actual2: number = arr2.$_get(2);
      let expected2: int = 1;
      expect(actual2).assertEqual(expected2);
    });

  });
}
