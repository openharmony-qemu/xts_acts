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
  beforeEach, describe, expect, it, Level, Size, TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function arrayBufferFromObject2Test(): void {
  describe('ArrayBufferFromObject2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.name testArrayBufferFromObject0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0100
     * @tc.desc Verify fromObject with CJK characters utf8 yields 6 bytes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = ArrayBuffer.fromObject('你好', 'utf8', 6);
      expect(result.byteLength).assertEqual(6);
      expect(result.at(0)).assertEqual(Int.toByte(0xE4));
      expect(result.at(3)).assertEqual(Int.toByte(0xE5));
    });

    /**
     * @tc.name testArrayBufferFromObject0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0200
     * @tc.desc Verify fromObject with emoji utf8 yields 4 bytes for emoji
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = ArrayBuffer.fromObject('😀', 'utf8', 4);
      expect(result.byteLength).assertEqual(4);
      expect(result.at(0)).assertEqual(Int.toByte(0xF0));
      expect(result.at(3)).assertEqual(Int.toByte(0x80));
    });

    /**
     * @tc.name testArrayBufferFromObject0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0300
     * @tc.desc Verify fromObject('hello','utf16le',10) yields 10 bytes with little-endian byte order
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = ArrayBuffer.fromObject('hello', 'utf16le', 10);
      expect(result.byteLength).assertEqual(10);
      expect(result.at(0)).assertEqual(Int.toByte(104));
      expect(result.at(1)).assertEqual(Int.toByte(0));
      expect(result.at(8)).assertEqual(Int.toByte(111));
    });

    /**
     * @tc.name testArrayBufferFromObject0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0400
     * @tc.desc Verify fromObject with CJK character in utf16le yields 2 bytes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = ArrayBuffer.fromObject('中', 'utf16le', 2);
      expect(result.byteLength).assertEqual(2);
      expect(result.at(0)).assertEqual(Int.toByte(0x2D));
    });

    /**
     * @tc.name testArrayBufferFromObject0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0500
     * @tc.desc Verify fromObject('ABC','latin1',3) yields 3 bytes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = ArrayBuffer.fromObject('ABC', 'latin1', 3);
      expect(result.byteLength).assertEqual(3);
      expect(result.at(0)).assertEqual(Int.toByte(65));
      expect(result.at(2)).assertEqual(Int.toByte(67));
    });

    /**
     * @tc.name testArrayBufferFromObject0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0600
     * @tc.desc Verify fromObject with emoji mixed with ASCII utf8 yields 6 bytes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = ArrayBuffer.fromObject('A😀B', 'utf8', 6);
      expect(result.byteLength).assertEqual(6);
      expect(result.at(0)).assertEqual(Int.toByte(65));
      expect(result.at(5)).assertEqual(Int.toByte(66));
    });

    /**
     * @tc.name testArrayBufferFromObject0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0700
     * @tc.desc Verify fromObject with ASCII and CJK mixed utf8 yields 11 bytes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = ArrayBuffer.fromObject('Hello世界', 'utf8', 11);
      expect(result.byteLength).assertEqual(11);
      expect(result.at(0)).assertEqual(Int.toByte(72));
      expect(result.at(5)).assertEqual(Int.toByte(0xE4));
    });

    /**
     * @tc.name testArrayBufferFromObject0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0800
     * @tc.desc Verify fromObject('\u0000','utf8',1) yields 1 NUL byte
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = ArrayBuffer.fromObject('\u0000', 'utf8', 1);
      expect(result.byteLength).assertEqual(1);
      expect(result.at(0)).assertEqual(Int.toByte(0));
    });

    /**
     * @tc.name testArrayBufferFromObject0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_0900
     * @tc.desc Verify fromObject('ABCDE',0,5) yields full string bytes byteLength 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = ArrayBuffer.fromObject('ABCDE', 0, 5);
      expect(result.byteLength).assertEqual(5);
      expect(result.at(0)).assertEqual(Int.toByte(65));
      expect(result.at(4)).assertEqual(Int.toByte(69));
    });

    /**
     * @tc.name testArrayBufferFromObject0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_1000
     * @tc.desc Verify fromObject('ABCDE',0,0) yields byteLength 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = ArrayBuffer.fromObject('ABCDE', 0, 0);
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferFromObject0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_1100
     * @tc.desc Verify fromObject with CJK characters using offset yields first 2 chars 6 bytes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = ArrayBuffer.fromObject('你好世界', 0, 6);
      expect(result.byteLength).assertEqual(6);
      expect(result.at(0)).assertEqual(Int.toByte(0xE4));
      expect(result.at(3)).assertEqual(Int.toByte(0xE5));
    });

    /**
     * @tc.name testArrayBufferFromObject0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_1200
     * @tc.desc Verify fromObject with CJK characters offset yields second char 3 bytes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = ArrayBuffer.fromObject('你好世界', 3, 3);
      expect(result.byteLength).assertEqual(3);
      expect(result.at(0)).assertEqual(Int.toByte(0xE5));
    });

    /**
     * @tc.name testArrayBufferFromObject0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_1300
     * @tc.desc Verify fromObject with emoji plus A bytes yields full content
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = ArrayBuffer.fromObject('😀A', 0, 5);
      expect(result.byteLength).assertEqual(5);
      expect(result.at(0)).assertEqual(Int.toByte(0xF0));
      expect(result.at(4)).assertEqual(Int.toByte(65));
    });

    /**
     * @tc.name testArrayBufferFromObject0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_1400
     * @tc.desc Verify fromObject('ABC','utf8',3) byteLength matches from('ABC','utf8')
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fromObj = ArrayBuffer.fromObject('ABC', 'utf8', 3);
      const fromStr = ArrayBuffer.from('ABC', 'utf8');
      expect(fromObj.byteLength).assertEqual(fromStr.byteLength);
    });

    /**
     * @tc.name testArrayBufferFromObject0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_1500
     * @tc.desc Verify fromObject on string-sourced buffer yields correct bytes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = ArrayBuffer.from('hello', 'utf8');
      const result = ArrayBuffer.fromObject(src, 0, 5);
      expect(result.byteLength).assertEqual(5);
      expect(result.at(0)).assertEqual(Int.toByte(104));
      expect(result.at(4)).assertEqual(Int.toByte(111));
    });

    /**
     * @tc.name testArrayBufferFromObject0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_1600
     * @tc.desc Verify fromObject on unsupported boolean object throws Error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.fromObject(Utils.booleanAsObject(true), 0, 4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_1700
     * @tc.desc Verify fromObject on unsupported function object throws Error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.fromObject(Utils.voidFnAsObject(), 0, 4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_1800
     * @tc.desc Verify fromObject(src,byteLength,1) throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new ArrayBuffer(4);
      try {
        ArrayBuffer.fromObject(src, src.byteLength, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_1900
     * @tc.desc Verify fromObject on resizable ArrayBuffer copies correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new ArrayBuffer(4, 8);
      src.set(0, Int.toByte(10));
      src.set(1, Int.toByte(20));
      src.set(2, Int.toByte(30));
      src.set(3, Int.toByte(40));
      const result = ArrayBuffer.fromObject(src, 0, 4);
      expect(result.byteLength).assertEqual(4);
      expect(result.at(0)).assertEqual(Int.toByte(10));
      expect(result.at(3)).assertEqual(Int.toByte(40));
    });

    /**
     * @tc.name testArrayBufferFromObject0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_2000
     * @tc.desc Verify fromObject with large string truncated to 500 bytes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const longStr: string = Utils.buildLongString('A', 1000);
      const result = ArrayBuffer.fromObject(longStr, 'utf8', 500);
      expect(result.byteLength).assertEqual(500);
      expect(result.at(0)).assertEqual(Int.toByte(65));
      expect(result.at(499)).assertEqual(Int.toByte(65));
    });

    /**
     * @tc.name testArrayBufferFromObject0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_2100
     * @tc.desc Verify fromObject(string, utf8, 5) returns ArrayBuffer instance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = ArrayBuffer.fromObject("ABCDE" as Object, "utf8", 5);
      expect(buf.byteLength).assertEqual(5);
    });

    /**
     * @tc.name testArrayBufferFromObject0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_2200
     * @tc.desc Verify fromObject(ArrayBuffer, int, int) returns ArrayBuffer with byteLength 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: ArrayBuffer = new ArrayBuffer(8);
      const buf: ArrayBuffer = ArrayBuffer.fromObject(src as Object, 0, 4);
      expect(buf.byteLength).assertEqual(4);
    });

    /**
     * @tc.name testArrayBufferFromObject0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_2300
     * @tc.desc Verify fromObject("", utf8, 0) returns empty buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = ArrayBuffer.fromObject("" as Object, "utf8", 0);
      expect(buf.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferFromObject0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_2400
     * @tc.desc Verify fromObject(ArrayBuffer, 0, 3) byteLength is 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: ArrayBuffer = new ArrayBuffer(6);
      const buf: ArrayBuffer = ArrayBuffer.fromObject(src as Object, 0, 3);
      expect(buf.byteLength).assertEqual(3);
    });

    /**
     * @tc.name testArrayBufferFromObject0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_2500
     * @tc.desc Verify fromObject(string, utf8, 3) content can be stringified back
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = ArrayBuffer.fromObject("ABC" as Object, "utf8", 3);
      const text: string = ArrayBuffer.stringify(buf, "utf8", 0, buf.byteLength);
      expect(text).assertEqual("ABC");
    });

    /**
     * @tc.name testArrayBufferFromObject0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_2600
     * @tc.desc Verify fromObject(ArrayBuffer, 0, 2) content matches source
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: ArrayBuffer = new ArrayBuffer(4);
      src.set(0, Int.toByte(0x41));
      src.set(1, Int.toByte(0x42));
      const buf: ArrayBuffer = ArrayBuffer.fromObject(src as Object, 0, 2);
      expect(buf.at(0)).assertEqual(Int.toByte(0x41));
      expect(buf.at(1)).assertEqual(Int.toByte(0x42));
    });

    /**
     * @tc.name testArrayBufferFromObject0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_2700
     * @tc.desc Verify fromObject does not modify source ArrayBuffer content
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: ArrayBuffer = new ArrayBuffer(3);
      src.set(0, Int.toByte(0x11));
      src.set(1, Int.toByte(0x22));
      src.set(2, Int.toByte(0x33));
      const buf: ArrayBuffer = ArrayBuffer.fromObject(src as Object, 0, 3);
      expect(src.at(0)).assertEqual(Int.toByte(0x11));
      expect(src.at(1)).assertEqual(Int.toByte(0x22));
      expect(src.at(2)).assertEqual(Int.toByte(0x33));
    });

    /**
     * @tc.name testArrayBufferFromObject0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_2800
     * @tc.desc Verify fromObject created buffer detached is false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = ArrayBuffer.fromObject("HI" as Object, "utf8", 2);
      expect(buf.detached).assertFalse();
    });

    /**
     * @tc.name testArrayBufferFromObject0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_2900
     * @tc.desc Verify fromObject with unsupported type (number) throws Error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf: ArrayBuffer = ArrayBuffer.fromObject(42 as Object, 0, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_3000
     * @tc.desc Verify fromObject with boolean throws Error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf: ArrayBuffer = ArrayBuffer.fromObject(true as Object, 0, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_3100
     * @tc.desc Verify fromObject with null throws Error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf: ArrayBuffer = ArrayBuffer.fromObject((null as Object), 5, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_3200
     * @tc.desc Verify fromObject with undefined throws Error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const obj: Object = undefined as Object;
        const buf: ArrayBuffer = ArrayBuffer.fromObject(obj, 5, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_3300
     * @tc.desc Verify fromObject(string, int, len) with byteOffset int for string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = "abc";
      try {
        const buf: ArrayBuffer = ArrayBuffer.fromObject(str as Object, 5, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_3400
     * @tc.desc Verify fromObject(string, int, int) with negative byteOffset throws error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = "abc";
      try {
        const buf: ArrayBuffer = ArrayBuffer.fromObject(str as Object, -1, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_3500
     * @tc.desc Verify fromObject(ArrayBuffer) with negative byteOffset throws error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: ArrayBuffer = new ArrayBuffer(4);
      try {
        const buf: ArrayBuffer = ArrayBuffer.fromObject(src as Object, -1, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_3600
     * @tc.desc Verify fromObject(ArrayBuffer) with out-of-range offset+length throws error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: ArrayBuffer = new ArrayBuffer(4);
      try {
        const buf: ArrayBuffer = ArrayBuffer.fromObject(src as Object, 3, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.name testArrayBufferFromObject0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_OBJECT_3700
     * @tc.desc Verify fromObject(ArrayBuffer) with negative length throws error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromObject0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: ArrayBuffer = new ArrayBuffer(4);
      try {
        const buf: ArrayBuffer = ArrayBuffer.fromObject(src as Object, 0, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

  });
}