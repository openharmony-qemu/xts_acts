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

export default function int16ArrayConstructorPart11Test(): void {
  describe("Int16ArrayConstructorPart11Test", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART11__0100
     * @tc.name int16ArrayConstructorPart11Test001
     * @tc.desc Verify new Int16Array(buf, 0, 2) length, byteOffset, byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart11Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const arr: Int16Array = new Int16Array(buf, 0, 2);
      let actual: int = arr.length;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
      let actual2: int = arr.byteOffset;
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
      let actual3: int = arr.byteLength;
      let expected3: int = 4;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART11__0200
     * @tc.name int16ArrayConstructorPart11Test002
     * @tc.desc Verify new Int16Array(buf, offset, len) length, byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart11Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(6);
      const offset: int = 2;
      const len: int = 2;
      const arr: Int16Array = new Int16Array(buf, offset, len);
      let actual: int = arr.length;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
      let actual2: int = arr.byteOffset;
      let expected2: int = 2;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART11__0300
     * @tc.name int16ArrayConstructorPart11Test003
     * @tc.desc Verify new Int16Array(buf, off, cnt) length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart11Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const off: int = 0;
      const cnt: int = 4;
      const arr: Int16Array = new Int16Array(buf, off, cnt);
      let actual: int = arr.length;
      let expected: int = 4;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART11__0400
     * @tc.name int16ArrayConstructorPart11Test004
     * @tc.desc Verify new Int16Array(buf, 0, 0) length, byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart11Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(0);
      const arr: Int16Array = new Int16Array(buf, 0, 0);
      let actual: int = arr.length;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: int = arr.byteLength;
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART11__0500
     * @tc.name int16ArrayConstructorPart11Test005
     * @tc.desc Verify new Int16Array(buf, 2, 3) length, byteOffset, byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart11Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const arr: Int16Array = new Int16Array(buf, 2, 3);
      let actual: int = arr.length;
      let expected: int = 3;
      expect(actual).assertEqual(expected);
      let actual2: int = arr.byteOffset;
      let expected2: int = 2;
      expect(actual2).assertEqual(expected2);
      let actual3: int = arr.byteLength;
      let expected3: int = 6;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART11__0600
     * @tc.name int16ArrayConstructorPart11Test006
     * @tc.desc Verify new Int16Array(buf, 2, 1) length, byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart11Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(10);
      const arr: Int16Array = new Int16Array(buf, 2, 1);
      let actual: int = arr.length;
      let expected: int = 1;
      expect(actual).assertEqual(expected);
      let actual2: int = arr.byteOffset;
      let expected2: int = 2;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART11__0700
     * @tc.name int16ArrayConstructorPart11Test007
     * @tc.desc Verify new Int16Array(buf, 2, 1) length, byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart11Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const arr: Int16Array = new Int16Array(buf, 2, 1);
      let actual: int = arr.length;
      let expected: int = 1;
      expect(actual).assertEqual(expected);
      let actual2: int = arr.byteOffset;
      let expected2: int = 2;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART11__0800
     * @tc.name int16ArrayConstructorPart11Test008
     * @tc.desc Verify new Int16Array(buf, 0, 2) default element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart11Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const arr: Int16Array = new Int16Array(buf, 0, 2);
      let actual: number = arr.$_get(0);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: number = arr.$_get(1);
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART11__0900
     * @tc.name int16ArrayConstructorPart11Test009
     * @tc.desc Verify new Int16Array(buf, 0, 2) length, byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart11Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const arr: Int16Array = new Int16Array(buf, 0, 2);
      let actual: int = arr.byteOffset;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: int = arr.length;
      let expected2: int = 2;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART11__1000
     * @tc.name int16ArrayConstructorPart11Test010
     * @tc.desc Verify new Int16Array(buf, 2, 2) length, byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart11Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(6);
      const arr: Int16Array = new Int16Array(buf, 2, 2);
      let actual: int = arr.byteOffset;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
      let actual2: int = arr.length;
      let expected2: int = 2;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART11__1100
     * @tc.name int16ArrayConstructorPart11Test011
     * @tc.desc Verify new Int16Array(buf, 4, 2) byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart11Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const arr: Int16Array = new Int16Array(buf, 4, 2);
      let actual: int = arr.byteOffset;
      let expected: int = 4;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART11__1200
     * @tc.name int16ArrayConstructorPart11Test012
     * @tc.desc Verify new Int16Array(buf, 6, 2) byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart11Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(10);
      const arr: Int16Array = new Int16Array(buf, 6, 2);
      let actual: int = arr.byteOffset;
      let expected: int = 6;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART11__1300
     * @tc.name int16ArrayConstructorPart11Test013
     * @tc.desc Verify new Int16Array(buf, 1, 1) unaligned offset throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart11Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      try {
        const arr: Int16Array = new Int16Array(buf, 1, 1);
        expect().assertFail();
      } catch (e) {
        let actual: string = e.name;
        let expected: string = "RangeError";
        expect(actual).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART11__1400
     * @tc.name int16ArrayConstructorPart11Test014
     * @tc.desc Verify new Int16Array(buf, 4, 0) length, byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart11Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const arr: Int16Array = new Int16Array(buf, 4, 0);
      let actual: int = arr.length;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: int = arr.byteOffset;
      let expected2: int = 4;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART11__1500
     * @tc.name int16ArrayConstructorPart11Test015
     * @tc.desc Verify new Int16Array(buf, 4, 2) length, byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart11Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const arr: Int16Array = new Int16Array(buf, 4, 2);
      let actual: int = arr.length;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
      let actual2: int = arr.byteOffset;
      let expected2: int = 4;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART11__1600
     * @tc.name int16ArrayConstructorPart11Test016
     * @tc.desc Verify new Int16Array(buf, 198, 1) length, byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart11Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(200);
      const arr: Int16Array = new Int16Array(buf, 198, 1);
      let actual: int = arr.length;
      let expected: int = 1;
      expect(actual).assertEqual(expected);
      let actual2: int = arr.byteOffset;
      let expected2: int = 198;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART11__1700
     * @tc.name int16ArrayConstructorPart11Test017
     * @tc.desc Verify new Int16Array(buf, 0, 2) buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart11Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const arr: Int16Array = new Int16Array(buf, 0, 2);
      let actual: ArrayBuffer = arr.buffer;
      let expected: ArrayBuffer = buf;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART11__1800
     * @tc.name int16ArrayConstructorPart11Test018
     * @tc.desc Verify new Int16Array(buf, 2, 0) length, byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart11Test018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(6);
      const arr: Int16Array = new Int16Array(buf, 2, 0);
      let actual: int = arr.length;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: int = arr.byteOffset;
      let expected2: int = 2;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART11__1900
     * @tc.name int16ArrayConstructorPart11Test019
     * @tc.desc Verify new Int16Array(buf, 0, 1) byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart11Test019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(2);
      const arr: Int16Array = new Int16Array(buf, 0, 1);
      let actual: int = arr.byteLength;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART11__2000
     * @tc.name int16ArrayConstructorPart11Test020
     * @tc.desc Verify new Int16Array(buf, 4, 3) length, byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart11Test020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(10);
      const arr: Int16Array = new Int16Array(buf, 4, 3);
      let actual: int = arr.byteOffset;
      let expected: int = 4;
      expect(actual).assertEqual(expected);
      let actual2: int = arr.length;
      let expected2: int = 3;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART11__2100
     * @tc.name int16ArrayConstructorPart11Test021
     * @tc.desc Verify new Int16Array(buf, 0, 4) byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart11Test021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const arr: Int16Array = new Int16Array(buf, 0, 4);
      let actual: int = arr.byteLength;
      let expected: int = 8;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART11__2200
     * @tc.name int16ArrayConstructorPart11Test022
     * @tc.desc Verify new Int16Array(buf, 0, 2) BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart11Test022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const arr: Int16Array = new Int16Array(buf, 0, 2);
      let actual: int = arr.BYTES_PER_ELEMENT;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART11__2300
     * @tc.name int16ArrayConstructorPart11Test023
     * @tc.desc Verify new Int16Array(buf, 0, 3) default element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart11Test023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(6);
      const arr: Int16Array = new Int16Array(buf, 0, 3);
      let actual: number = arr.$_get(0);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: number = arr.$_get(1);
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
      let actual3: number = arr.$_get(2);
      let expected3: int = 0;
      expect(actual3).assertEqual(expected3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART11__2400
     * @tc.name int16ArrayConstructorPart11Test024
     * @tc.desc Verify new Int16Array(buf, 0, 0) byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart11Test024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const arr: Int16Array = new Int16Array(buf, 0, 0);
      let actual: int = arr.byteLength;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART11__2500
     * @tc.name int16ArrayConstructorPart11Test025
     * @tc.desc Verify new Int16Array(buf, 0, 0) buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart11Test025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const arr: Int16Array = new Int16Array(buf, 0, 0);
      let actual: ArrayBuffer = arr.buffer;
      let expected: ArrayBuffer = buf;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART11__2600
     * @tc.name int16ArrayConstructorPart11Test026
     * @tc.desc Verify new Int16Array(buf, byteOffset, length) views share underlying ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart11Test026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const view1: Int16Array = new Int16Array(buf, 0, 2);
      view1.$_set(0, 12345);
      const view2: Int16Array = new Int16Array(buf, 0, 2);
      let actual: number = view2.$_get(0);
      let expected: int = 12345;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART11__2700
     * @tc.name int16ArrayConstructorPart11Test027
     * @tc.desc Verify new Int16Array(buf, byteOffset, length) views share underlying ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart11Test027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const view1: Int16Array = new Int16Array(buf, 0, 2);
      view1.$_set(1, 9999);
      const view2: Int16Array = new Int16Array(buf, 2, 1);
      let actual: number = view2.$_get(0);
      let expected: int = 9999;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART11__2800
     * @tc.name int16ArrayConstructorPart11Test028
     * @tc.desc Verify new Int16Array(buf, byteOffset, length) views share underlying ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart11Test028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const viewOffset: Int16Array = new Int16Array(buf, 4, 2);
      viewOffset.$_set(0, 16384);
      const viewZero: Int16Array = new Int16Array(buf, 0, 4);
      let actual: number = viewZero.$_get(2);
      let expected: int = 16384;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART11__2900
     * @tc.name int16ArrayConstructorPart11Test029
     * @tc.desc Verify new Int16Array(buf, byteOffset, length) views share underlying ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart11Test029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const view1: Int16Array = new Int16Array(buf, 0, 4);
      const view2: Int16Array = new Int16Array(buf, 2, 3);
      view1.$_set(1, -20000);
      let actual: number = view2.$_get(0);
      let expected: int = -20000;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART11__3000
     * @tc.name int16ArrayConstructorPart11Test030
     * @tc.desc Verify new Int16Array(buf, byteOffset, length) views share underlying ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart11Test030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const view1: Int16Array = new Int16Array(buf, 0, 4);
      const view2: Int16Array = new Int16Array(buf, 0, 4);
      view1.$_set(0, 8888);
      view1.$_set(1, 9999);
      let actual: number = view2.$_get(0);
      let expected: int = 8888;
      expect(actual).assertEqual(expected);
      let actual2: number = view2.$_get(1);
      let expected2: int = 9999;
      expect(actual2).assertEqual(expected2);
      let actual3: number = view2.$_get(2);
      let expected3: int = 0;
      expect(actual3).assertEqual(expected3);
      let actual4: number = view2.$_get(3);
      let expected4: int = 0;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART11__3100
     * @tc.name int16ArrayConstructorPart11Test031
     * @tc.desc Verify new Int16Array(buf, byteOffset, length) views share underlying ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart11Test031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const left: Int16Array = new Int16Array(buf, 0, 2);
      const right: Int16Array = new Int16Array(buf, 4, 2);
      left.$_set(0, 111);
      right.$_set(0, 222);
      let actual: number = left.$_get(0);
      let expected: int = 111;
      expect(actual).assertEqual(expected);
      let actual2: number = right.$_get(0);
      let expected2: int = 222;
      expect(actual2).assertEqual(expected2);
      let actual3: number = left.$_get(1);
      let expected3: int = 0;
      expect(actual3).assertEqual(expected3);
      let actual4: number = right.$_get(1);
      let expected4: int = 0;
      expect(actual4).assertEqual(expected4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART11__3200
     * @tc.name int16ArrayConstructorPart11Test032
     * @tc.desc Verify new Int16Array(buf, 0, 2) buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart11Test032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const view1: Int16Array = new Int16Array(buf, 0, 2);
      const view2: Int16Array = new Int16Array(buf, 0, 2);
      let actual: ArrayBuffer = view1.buffer;
      let expected: ArrayBuffer = view2.buffer;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART11__3300
     * @tc.name int16ArrayConstructorPart11Test033
     * @tc.desc Verify new Int16Array(buf, byteOffset, length) views share underlying ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart11Test033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const view1: Int16Array = new Int16Array(buf, 0, 2);
      let val:short = 32767
      view1.$_set(0, val);
      const view2: Int16Array = new Int16Array(buf, 0, 2);
      let actual: number = view2.$_get(0);
      let expected: int = 32767;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART11__3400
     * @tc.name int16ArrayConstructorPart11Test034
     * @tc.desc Verify new Int16Array(buf, byteOffset, length) views share underlying ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart11Test034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const view1: Int16Array = new Int16Array(buf, 0, 2);
      view1.$_set(0, 32768);
      const view2: Int16Array = new Int16Array(buf, 0, 2);
      let actual: number = view2.$_get(0);
      let expected: int = -32768;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART11__3500
     * @tc.name int16ArrayConstructorPart11Test035
     * @tc.desc Verify new Int16Array(buf, byteOffset, length) views share underlying ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart11Test035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const viewOff: Int16Array = new Int16Array(buf, 2, 3);
      const viewZero: Int16Array = new Int16Array(buf, 0, 4);
      viewZero.$_set(1, -12345);
      let actual: number = viewOff.$_get(0);
      let expected: int = -12345;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART11__3600
     * @tc.name int16ArrayConstructorPart11Test036
     * @tc.desc Verify new Int16Array(buf, byteOffset, length) views share underlying ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart11Test036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const single: Int16Array = new Int16Array(buf, 2, 1);
      single.$_set(0, 1024);
      const full: Int16Array = new Int16Array(buf, 0, 2);
      let actual: number = full.$_get(1);
      let expected: int = 1024;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART11__3700
     * @tc.name int16ArrayConstructorPart11Test037
     * @tc.desc Verify new Int16Array(buf, byteOffset, length) views share underlying ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart11Test037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const empty: Int16Array = new Int16Array(buf, 2, 0);
      const full: Int16Array = new Int16Array(buf, 0, 2);
      full.$_set(1, 7777);
      let actual: ArrayBuffer = empty.buffer;
      let expected: ArrayBuffer = buf;
      expect(actual).assertEqual(expected);
      let actual2: number = full.$_get(1);
      let expected2: int = 7777;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART11__3800
     * @tc.name int16ArrayConstructorPart11Test038
     * @tc.desc Verify new Int16Array(buf, byteOffset, length) views share underlying ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart11Test038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(12);
      const seg1: Int16Array = new Int16Array(buf, 0, 2);
      const seg2: Int16Array = new Int16Array(buf, 4, 2);
      const seg3: Int16Array = new Int16Array(buf, 8, 2);
      seg1.$_set(0, 100);
      seg2.$_set(0, 200);
      seg3.$_set(0, 300);
      const full: Int16Array = new Int16Array(buf, 0, 6);
      let actual: number = full.$_get(0);
      let expected: int = 100;
      expect(actual).assertEqual(expected);
      let actual2: number = full.$_get(2);
      let expected2: int = 200;
      expect(actual2).assertEqual(expected2);
      let actual3: number = full.$_get(4);
      let expected3: int = 300;
      expect(actual3).assertEqual(expected3);
    });

  });
}
