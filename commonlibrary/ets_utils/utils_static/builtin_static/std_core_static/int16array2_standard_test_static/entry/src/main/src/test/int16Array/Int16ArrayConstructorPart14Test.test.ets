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

export default function int16ArrayConstructorPart14Test(): void {
  describe("Int16ArrayConstructorPart14Test", (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART14__0100
     * @tc.name int16ArrayConstructorPart14Test001
     * @tc.desc Verify new Int16Array(ArrayBuffer 6) creates length 3 view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart14Test001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(6);
      const arr: Int16Array = new Int16Array(buf);
      let actual: int = arr.length;
      let expected: int = 3;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART14__0200
     * @tc.name int16ArrayConstructorPart14Test002
     * @tc.desc Verify new Int16Array(ArrayBuffer 1, undefined, undefined) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("int16ArrayConstructorPart14Test002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(1);
      try {
        const arr: Int16Array = new Int16Array(buf, undefined, undefined);
        expect().assertFail();
      } catch (e) {
        let actual: string = e.name;
        let expected: string = 'RangeError';
        expect(actual).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART14__0300
     * @tc.name int16ArrayConstructorPart14Test003
     * @tc.desc Verify new Int16Array(ArrayBuffer 4, undefined, undefined) elements default to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart14Test003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const arr: Int16Array = new Int16Array(buf, undefined, undefined);
      let actual: number = arr.$_get(0);
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: number = arr.$_get(1);
      let expected2: int = 0;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART14__0400
     * @tc.name int16ArrayConstructorPart14Test004
     * @tc.desc Verify new Int16Array(ArrayBuffer 4, undefined, undefined) reads DataView values 100 and -200
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart14Test004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const dv: DataView = new DataView(buf);
      dv.setInt16(0, 100, true);
      dv.setInt16(2, -200, true);
      const arr: Int16Array = new Int16Array(buf, undefined, undefined);
      let actual: number = arr.$_get(0);
      let expected: int = 100;
      expect(actual).assertEqual(expected);
      let actual2: number = arr.$_get(1);
      let expected2: int = -200;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART14__0500
     * @tc.name int16ArrayConstructorPart14Test005
     * @tc.desc Verify new Int16Array(ArrayBuffer 4, undefined, undefined) has byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart14Test005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const arr: Int16Array = new Int16Array(buf, undefined, undefined);
      let actual: int = arr.byteOffset;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART14__0600
     * @tc.name int16ArrayConstructorPart14Test006
     * @tc.desc Verify new Int16Array(ArrayBuffer 4, Number.NaN, 1) truncates byteOffset to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart14Test006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const arr: Int16Array = new Int16Array(buf, Number.NaN, 1);
      let actual: int = arr.byteOffset;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART14__0700
     * @tc.name int16ArrayConstructorPart14Test007
     * @tc.desc Verify new Int16Array(ArrayBuffer 4, Number.POSITIVE_INFINITY, 1) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart14Test007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      try {
        new Int16Array(buf, Number.POSITIVE_INFINITY, 1);
        expect().assertFail();
      } catch (e) {
        let actual: string = e.name;
        let expected: string = "RangeError";
        expect(actual).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART14__0800
     * @tc.name int16ArrayConstructorPart14Test008
     * @tc.desc Verify new Int16Array(ArrayBuffer 4, -Number.POSITIVE_INFINITY, 1) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart14Test008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      try {
        new Int16Array(buf, -Number.POSITIVE_INFINITY, 1);
        expect().assertFail();
      } catch (e) {
        let actual: string = e.name;
        let expected: string = "RangeError";
        expect(actual).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART14__0900
     * @tc.name int16ArrayConstructorPart14Test009
     * @tc.desc Verify new Int16Array(ArrayBuffer 4, 0, 1) has byteLength 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart14Test009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const arr: Int16Array = new Int16Array(buf, 0, 1);
      let actual: int = arr.byteLength;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART14__1000
     * @tc.name int16ArrayConstructorPart14Test010
     * @tc.desc Verify new Int16Array(ArrayBuffer 4, 0, Number.NaN) truncates length to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart14Test010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const arr: Int16Array = new Int16Array(buf, 0, Number.NaN);
      let actual: int = arr.length;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART14__1100
     * @tc.name int16ArrayConstructorPart14Test011
     * @tc.desc Verify new Int16Array(ArrayBuffer 10, 2, undefined) creates length 4 view with byteOffset 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart14Test011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(10);
      const arr: Int16Array = new Int16Array(buf, 2, undefined);
      let actual: int = arr.length;
      let expected: int = 4;
      expect(actual).assertEqual(expected);
      let actual2: int = arr.byteOffset;
      let expected2: int = 2;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART14__1200
     * @tc.name int16ArrayConstructorPart14Test012
     * @tc.desc Verify new Int16Array(ArrayBuffer 6, Number 2, undefined) has byteOffset 2 and length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart14Test012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(6);
      const off: Number = 2 as Number;
      const arr: Int16Array = new Int16Array(buf, off, undefined);
      let actual: int = arr.byteOffset;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
      let actual2: int = arr.length;
      let expected2: int = 2;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART14__1300
     * @tc.name int16ArrayConstructorPart14Test013
     * @tc.desc Verify new Int16Array(ArrayBuffer 4, undefined, Number 2) has byteOffset 0 and length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart14Test013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const len: Number = 2 as Number;
      const arr: Int16Array = new Int16Array(buf, undefined, len);
      let actual: int = arr.byteOffset;
      let expected: int = 0;
      expect(actual).assertEqual(expected);
      let actual2: int = arr.length;
      let expected2: int = 2;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART14__1400
     * @tc.name int16ArrayConstructorPart14Test014
     * @tc.desc Verify new Int16Array(ArrayBuffer 8, 0, 3) byteLength equals length times BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart14Test014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const arr: Int16Array = new Int16Array(buf, 0, 3);
      let actual: int = arr.byteLength;
      let expected: number = arr.length * Int16Array.BYTES_PER_ELEMENT;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART14__1500
     * @tc.name int16ArrayConstructorPart14Test015
     * @tc.desc Verify new Int16Array(ArrayBuffer 4, 0, 2) buffer equals source ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart14Test015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const arr: Int16Array = new Int16Array(buf, 0, 2);
      let actual: boolean = arr.buffer === buf;
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART14__1600
     * @tc.name int16ArrayConstructorPart14Test016
     * @tc.desc Verify new Int16Array(ArrayBuffer 4, undefined, undefined) buffer byteLength is 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart14Test016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const arr: Int16Array = new Int16Array(buf, undefined, undefined);
      let actual: int = arr.buffer.byteLength;
      let expected: int = 4;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART14__1700
     * @tc.name int16ArrayConstructorPart14Test017
     * @tc.desc Verify new Int16Array(ArrayBuffer 2, undefined, undefined) BYTES_PER_ELEMENT is 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart14Test017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(2);
      const arr: Int16Array = new Int16Array(buf, undefined, undefined);
      let actual: int = Int16Array.BYTES_PER_ELEMENT;
      let expected: int = 2;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART14__1800
     * @tc.name int16ArrayConstructorPart14Test018
     * @tc.desc Verify new Int16Array(ArrayBuffer 4, 0, Number.POSITIVE_INFINITY) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart14Test018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      try {
        new Int16Array(buf, 0, Number.POSITIVE_INFINITY);
        expect().assertFail();
      } catch (e) {
        let actual: string = e.name;
        let expected: string = "RangeError";
        expect(actual).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART14__1900
     * @tc.name int16ArrayConstructorPart14Test019
     * @tc.desc Verify new Int16Array(ArrayBuffer 4, Number.NaN, -1) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart14Test019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      try {
        new Int16Array(buf, Number.NaN, -1);
        expect().assertFail();
      } catch (e) {
        let actual: string = e.name;
        let expected: string = "RangeError";
        expect(actual).assertEqual(expected);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART14__2000
     * @tc.name int16ArrayConstructorPart14Test020
     * @tc.desc Verify new Int16Array(ArrayBuffer 4, 0, 2) $_set writes 100 and -50 to DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart14Test020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const arr: Int16Array = new Int16Array(buf, 0, 2);
      arr.$_set(0, 100);
      arr.$_set(1, -50);
      const dv: DataView = new DataView(buf);
      let actual: number = dv.getInt16(0, true);
      let expected: int = 100;
      expect(actual).assertEqual(expected);
      let actual2: number = dv.getInt16(2, true);
      let expected2: int = -50;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART14__2100
     * @tc.name int16ArrayConstructorPart14Test021
     * @tc.desc Verify new Int16Array(ArrayBuffer 4, 0, 2) $_get reads DataView values 32767 and -32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart14Test021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const arr: Int16Array = new Int16Array(buf, 0, 2);
      const dv: DataView = new DataView(buf);
      dv.setInt16(0, 32767, true);
      dv.setInt16(2, -32768, true);
      let actual: number = arr.$_get(0);
      let expected: int = 32767;
      expect(actual).assertEqual(expected);
      let actual2: number = arr.$_get(1);
      let expected2: int = -32768;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART14__2200
     * @tc.name int16ArrayConstructorPart14Test022
     * @tc.desc Verify two Int16Array views over ArrayBuffer 8 $_set then $_get reads 10 and 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart14Test022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const view1: Int16Array = new Int16Array(buf, 0, 2);
      const view2: Int16Array = new Int16Array(buf, 4, 2);
      view1.$_set(0, 10);
      view2.$_set(0, 20);
      let actual: number = view1.$_get(0);
      let expected: int = 10;
      expect(actual).assertEqual(expected);
      let actual2: number = view2.$_get(0);
      let expected2: int = 20;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART14__2300
     * @tc.name int16ArrayConstructorPart14Test023
     * @tc.desc Verify overlapping Int16Array views over ArrayBuffer 6 $_set 99 visible via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart14Test023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(6);
      const view1: Int16Array = new Int16Array(buf, 0, 3);
      const view2: Int16Array = new Int16Array(buf, 2, 2);
      view1.$_set(1, 99);
      let actual: number = view2.$_get(0);
      let expected: int = 99;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART14__2400
     * @tc.name int16ArrayConstructorPart14Test024
     * @tc.desc Verify new Int16Array(ArrayBuffer 2, 0, 1) $_set 32767 reads 32767 via DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart14Test024", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(2);
      const arr: Int16Array = new Int16Array(buf, 0, 1);
      let val:short = 32767
      arr.$_set(0, val);
      const dv: DataView = new DataView(buf);
      let actual: number = dv.getInt16(0, true);
      let expected: int = 32767;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART14__2500
     * @tc.name int16ArrayConstructorPart14Test025
     * @tc.desc Verify new Int16Array(ArrayBuffer 2, 0, 1) $_set -32768 reads -32768 via DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart14Test025", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(2);
      const arr: Int16Array = new Int16Array(buf, 0, 1);
      let val:short = -32768
      arr.$_set(0, val);
      const dv: DataView = new DataView(buf);
      let actual: number = dv.getInt16(0, true);
      let expected: int = -32768;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART14__2600
     * @tc.name int16ArrayConstructorPart14Test026
     * @tc.desc Verify new Int16Array(ArrayBuffer 4, 0, 1) buffer equals source ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart14Test026", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const arr: Int16Array = new Int16Array(buf, 0, 1);
      const bufFromArr: ArrayBuffer = arr.buffer;
      let actual: boolean = bufFromArr === buf;
      expect(actual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART14__2700
     * @tc.name int16ArrayConstructorPart14Test027
     * @tc.desc Verify new Int16Array(ArrayBuffer 8, 2, 2) leaves source ArrayBuffer byteLength unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart14Test027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const originalByteLength: number = buf.byteLength;
      new Int16Array(buf, 2, 2);
      let actual: int = buf.byteLength;
      let expected: number = originalByteLength;
      expect(actual).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART14__2800
     * @tc.name int16ArrayConstructorPart14Test028
     * @tc.desc Verify two Int16Array views over ArrayBuffer 4 $_set 32768 and -32769 wraps via DataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart14Test028", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const view1: Int16Array = new Int16Array(buf, 0, 1);
      const view2: Int16Array = new Int16Array(buf, 2, 1);
      view1.$_set(0, 32768);
      view2.$_set(0, -32769);
      const dv: DataView = new DataView(buf);
      let actual: number = dv.getInt16(0, true);
      let expected: int = -32768;
      expect(actual).assertEqual(expected);
      let actual2: number = dv.getInt16(2, true);
      let expected2: int = 32767;
      expect(actual2).assertEqual(expected2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART14__2900
     * @tc.name int16ArrayConstructorPart14Test029
     * @tc.desc Verify fullView $_set over ArrayBuffer 6 visible via subView $_get as 10 and 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it("int16ArrayConstructorPart14Test029", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(6);
      const fullView: Int16Array = new Int16Array(buf, undefined, undefined);
      const subView: Int16Array = new Int16Array(buf, 2, 2);
      fullView.$_set(0, 5);
      fullView.$_set(1, 10);
      fullView.$_set(2, 15);
      let actual: number = subView.$_get(0);
      let expected: int = 10;
      expect(actual).assertEqual(expected);
      let actual2: number = subView.$_get(1);
      let expected2: int = 15;
      expect(actual2).assertEqual(expected2);
    });

  });
}
