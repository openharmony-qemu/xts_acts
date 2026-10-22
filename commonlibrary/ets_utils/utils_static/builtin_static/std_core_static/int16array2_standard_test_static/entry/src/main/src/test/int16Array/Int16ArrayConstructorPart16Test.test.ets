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
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART16__0300
     * @tc.name int16ArrayConstructorPart16Test003
     * @tc.desc Verify new Int16Array constructor byteOffset=3 RangeError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
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
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
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
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART16__1700
     * @tc.name int16ArrayConstructorPart16Test017
     * @tc.desc Verify new Int16Array(ArrayBuffer 8, 2, 3) sets length to 3 and byteLength to 6
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
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
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART16__2200
     * @tc.name int16ArrayConstructorPart16Test022
     * @tc.desc Verify new Int16Array constructor byteLength length 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
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
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART16__3100
     * @tc.name int16ArrayConstructorPart16Test031
     * @tc.desc Verify new Int16Array constructor undefined byteLength buf.byteLength
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
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
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_CONSTRUCTOR_PART16__3500
     * @tc.name int16ArrayConstructorPart16Test035
     * @tc.desc Verify new Int16Array constructor Number length byteLength length*2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
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

  });
}
