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

export default function int16ArrayConstructorPart10Test(): void {
  describe("Int16ArrayConstructorPart10Test", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART10__0100
     * @tc.name int16ArrayConstructorPart10Test001
     * @tc.desc Verify new Int16Array(buf, 0.0) length expected values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart10Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Int16Array = new Int16Array(buf, 0.0);
      let actual: int = arr.length;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART10__0200
     * @tc.name int16ArrayConstructorPart10Test002
     * @tc.desc Verify new Int16Array(buf, byteOffset) buf ArrayBuffer byteOffset 0.0 creates zero-length view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart10Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(0);
      let arr: Int16Array = new Int16Array(buf, 0.0);
      let actual: int = arr.byteOffset;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: int = arr.length;
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART10__0300
     * @tc.name int16ArrayConstructorPart10Test003
     * @tc.desc Verify new Int16Array(buf, byteOffset) buf 1 ArrayBuffer byteOffset 0.0 throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart10Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(1);
      try {
        let arr: Int16Array = new Int16Array(buf, 0.0);
        expect().assertFail();
      } catch (e) {
        let actual: string = e.name;
        let expected: string = 'RangeError';
        expect(actual).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART10__0500
     * @tc.name int16ArrayConstructorPart10Test005
     * @tc.desc Verify new Int16Array(buf, byteOffset) byteOffset 2.0 offset 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart10Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let arr: Int16Array = new Int16Array(buf, 2.0);
      let actual: int = arr.byteOffset;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART10__0600
     * @tc.name int16ArrayConstructorPart10Test006
     * @tc.desc Verify new Int16Array(buf, byteOffset) byteOffset 4.0 offset 4
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart10Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(10);
      let arr: Int16Array = new Int16Array(buf, 4.0);
      let actual: int = arr.byteOffset;
      let expected: int = 4;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART10__0700
     * @tc.name int16ArrayConstructorPart10Test007
     * @tc.desc Verify new Int16Array(buf, Number.NaN) byteOffset/length expected values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart10Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Int16Array = new Int16Array(buf, Number.NaN);
      let actual: int = arr.byteOffset;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: int = arr.length;
      let expected2: int = 2;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART10__0800
     * @tc.name int16ArrayConstructorPart10Test008
     * @tc.desc Verify new Int16Array(buf, byteOffset) byteOffset +Infinity throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart10Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      try {
        let arr: Int16Array = new Int16Array(buf, Number.POSITIVE_INFINITY);
        expect().assertFail();
      } catch (e) {
        let actual: string = e.name;
        let expected: string = "RangeError";
        expect(actual).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART10__0900
     * @tc.name int16ArrayConstructorPart10Test009
     * @tc.desc Verify new Int16Array(buf, byteOffset) byteOffset -Infinity throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart10Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      try {
        let arr: Int16Array = new Int16Array(buf, Number.NEGATIVE_INFINITY);
        expect().assertFail();
      } catch (e) {
        let actual: string = e.name;
        let expected: string = "RangeError";
        expect(actual).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART10__1000
     * @tc.name int16ArrayConstructorPart10Test010
     * @tc.desc Verify new Int16Array(buf, byteOffset) byteOffset 2.0 buf 4 offset 2 length 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart10Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Int16Array = new Int16Array(buf, 2.0);
      let actual: int = arr.length;
      let expected: int = 1;
      expect(actual).assertEqual(expected);
      let actual2: int = arr.byteLength;
      let expected2: int = 2;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART10__1100
     * @tc.name int16ArrayConstructorPart10Test011
     * @tc.desc Verify new Int16Array(buf, byteOffset) byteOffset Number 2.7 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart10Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let offset: number = 2.7;
      let arr: Int16Array = new Int16Array(buf, offset);
      let actual: int = arr.byteOffset;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART10__1200
     * @tc.name int16ArrayConstructorPart10Test012
     * @tc.desc Verify new Int16Array(buf, byteOffset) byteOffset Number NaN 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart10Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let offset: number = Number.NaN;
      let arr: Int16Array = new Int16Array(buf, offset);
      let actual: int = arr.byteOffset;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART10__1300
     * @tc.name int16ArrayConstructorPart10Test013
     * @tc.desc Verify new Int16Array(buf, 0.0) byteLength expected values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart10Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Int16Array = new Int16Array(buf, 0.0);
      let actual: int = arr.byteLength;
      let expected: int = 4;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART10__1400
     * @tc.name int16ArrayConstructorPart10Test014
     * @tc.desc Verify new Int16Array(buf, 0.0) buffer expected values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart10Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Int16Array = new Int16Array(buf, 0.0);
      let actual: int = arr.buffer.byteLength;
      let expected: int = 4;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART10__1600
     * @tc.name int16ArrayConstructorPart10Test016
     * @tc.desc Verify new Int16Array(buf, byteOffset) byteLength length 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart10Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(10);
      let arr: Int16Array = new Int16Array(buf, 2.0);
      let actual: int = arr.byteLength;
      let expected: number = arr.length * 2;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART10__1700
     * @tc.name int16ArrayConstructorPart10Test017
     * @tc.desc Verify new Int16Array(buf, 0.0) name expected values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart10Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Int16Array = new Int16Array(buf, 0.0);
      let actual: string = arr.name;
      let expected: string = "Int16Array";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART10__1900
     * @tc.name int16ArrayConstructorPart10Test019
     * @tc.desc Verify new Int16Array(buf, 2.0) byteLength/buffer expected values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart10Test019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int16Array = new Int16Array(buf, 2.0);
      let actual: string = (arr.buffer.byteLength >= arr.byteLength).toString();
      let expected: string = "true";
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART10__2100
     * @tc.name int16ArrayConstructorPart10Test021
     * @tc.desc Verify new Int16Array(buf, byteOffset) byteOffset NaN coerces to 0 creates zero-length view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart10Test021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(0);
      let arr: Int16Array = new Int16Array(buf, Number.NaN);
      let actual: int = arr.byteOffset;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: int = arr.length;
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART10__2600
     * @tc.name int16ArrayConstructorPart10Test026
     * @tc.desc Verify new Int16Array(buf, byteOffset) byteOffset 2 0 buffer 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart10Test026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let arr1: Int16Array = new Int16Array(buf, 0.0);
      let arr2: Int16Array = new Int16Array(buf, 2.0);
      arr1.$_set(0, 7);
      arr1.$_set(1, 8);
      arr2.$_set(1, 9);
      let actual: number = arr1.$_get(2);
      let expected: int = 9;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART10__2700
     * @tc.name int16ArrayConstructorPart10Test027
     * @tc.desc Verify new Int16Array(buf, Number.NaN) shared buffer via set get
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart10Test027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Int16Array = new Int16Array(buf, Number.NaN);
      arr.$_set(0, 127);
      let arr2: Int16Array = new Int16Array(buf, 0.0);
      let actual: number = arr2.$_get(0);
      let expected: int = 127;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART10__2800
     * @tc.name int16ArrayConstructorPart10Test028
     * @tc.desc Verify new Int16Array(buf, byteOffset) +Infinity throws RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart10Test028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      try {
        let arr: Int16Array = new Int16Array(buf, Number.POSITIVE_INFINITY);
        let val:short = 32767;
        arr.$_set(1, val);
        expect().assertFail();
      } catch (e) {
        let actual: string = e.name;
        let expected: string = "RangeError";
        expect(actual).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART10__2900
     * @tc.name int16ArrayConstructorPart10Test029
     * @tc.desc Verify new Int16Array(buf, 2.7) shared buffer via set get
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart10Test029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr1: Int16Array = new Int16Array(buf, 2.7);
      let arr2: Int16Array = new Int16Array(buf, 2.0);
      arr1.$_set(0, 33);
      let actual: number = arr2.$_get(0);
      let expected: int = 33;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART10__3000
     * @tc.name int16ArrayConstructorPart10Test030
     * @tc.desc Verify new Int16Array(buf, byteOffset) $_set/$_get with -0.0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart10Test030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Int16Array = new Int16Array(buf, -0.0);
      arr.$_set(0, 256);
      let arr2: Int16Array = new Int16Array(buf, 0.0);
      let actual: number = arr2.$_get(0);
      let expected: int = 256;
      expect(actual).assertEqual(expected);
    });

  });
}
