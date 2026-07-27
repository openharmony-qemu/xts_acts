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

export default function arrayBufferStringify2Test(): void {
  describe('ArrayBufferStringify2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.name testArrayBufferStringify0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0100
     * @tc.desc Verify stringify with empty encoding throws IllegalArgumentError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(3);
      buffer.set(0, Int.toByte(65));
      buffer.set(1, Int.toByte(66));
      buffer.set(2, Int.toByte(67));
      try {
        ArrayBuffer.stringify(buffer, '', 0, buffer.byteLength);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0200
     * @tc.desc Verify stringify with space-only encoding throws IllegalArgumentError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(3);
      buffer.set(0, Int.toByte(65));
      try {
        ArrayBuffer.stringify(buffer, ' ', 0, buffer.byteLength);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0300
     * @tc.desc Verify stringify with special chars encoding throws IllegalArgumentError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(3);
      buffer.set(0, Int.toByte(65));
      try {
        ArrayBuffer.stringify(buffer, '!@#$%', 0, buffer.byteLength);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0400
     * @tc.desc Verify stringify with emoji encoding throws IllegalArgumentError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(3);
      buffer.set(0, Int.toByte(65));
      try {
        ArrayBuffer.stringify(buffer, '😀utf8', 0, buffer.byteLength);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0500
     * @tc.desc Verify stringify with Japanese encoding name throws IllegalArgumentError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(3);
      buffer.set(0, Int.toByte(65));
      try {
        ArrayBuffer.stringify(buffer, 'テスト', 0, buffer.byteLength);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0600
     * @tc.desc Verify stringify with Unicode encoding name throws IllegalArgumentError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(3);
      buffer.set(0, Int.toByte(65));
      try {
        ArrayBuffer.stringify(buffer, '\u4e2d\u6587', 0, buffer.byteLength);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0700
     * @tc.desc Verify stringify with uppercase UTF8 encoding throws IllegalArgumentError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(3);
      buffer.set(0, Int.toByte(65));
      buffer.set(1, Int.toByte(66));
      buffer.set(2, Int.toByte(67));
      try {
        ArrayBuffer.stringify(buffer, 'UTF8', 0, buffer.byteLength);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0800
     * @tc.desc Verify stringify with hex format encoding throws IllegalArgumentError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(3);
      buffer.set(0, Int.toByte(65));
      try {
        ArrayBuffer.stringify(buffer, '0x1234', 0, buffer.byteLength);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_0900
     * @tc.desc Verify stringify with number encoding throws IllegalArgumentError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(3);
      buffer.set(0, Int.toByte(65));
      try {
        ArrayBuffer.stringify(buffer, '123456', 0, buffer.byteLength);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_1000
     * @tc.desc Verify stringify with start greater than byteLength throws IllegalArgumentError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(3);
      buffer.set(0, Int.toByte(65));
      try {
        ArrayBuffer.stringify(buffer, 'utf8', 5, buffer.byteLength);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_1100
     * @tc.desc Verify stringify with negative start throws IllegalArgumentError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(3);
      buffer.set(0, Int.toByte(65));
      try {
        ArrayBuffer.stringify(buffer, 'utf8', -1, buffer.byteLength);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_1200
     * @tc.desc Verify stringify with negative end throws IllegalArgumentError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(3);
      buffer.set(0, Int.toByte(65));
      try {
        ArrayBuffer.stringify(buffer, 'utf8', 0, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_1300
     * @tc.desc Verify stringify with start greater than end throws IllegalArgumentError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(3);
      buffer.set(0, Int.toByte(65));
      try {
        ArrayBuffer.stringify(buffer, 'utf8', 3, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_1400
     * @tc.desc Verify stringify with hex format start parameter decodes partial range
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(5);
      buffer.set(0, Int.toByte(65));
      buffer.set(1, Int.toByte(66));
      buffer.set(2, Int.toByte(67));
      buffer.set(3, Int.toByte(68));
      buffer.set(4, Int.toByte(69));
      const result: string = ArrayBuffer.stringify(buffer, 'utf8', 0x1, 0x3);
      expect(result).assertEqual('BC');
    });

    /**
     * @tc.name testArrayBufferStringify0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_1500
     * @tc.desc Verify stringify with empty buffer returns empty string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(0);
      const result: string = ArrayBuffer.stringify(buffer, 'utf8', 0, buffer.byteLength);
      expect(result).assertEqual('');
    });

    /**
     * @tc.name testArrayBufferStringify0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_1600
     * @tc.desc Verify stringify with large buffer decodes correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(100);
      let expected: string = '';
      for (let i: int = 0; i < 100; i++) {
        const charCode: int = 65 + i % 26;
        buffer.set(i, Int.toByte(charCode));
        expected += String.fromCharCode(charCode);
      }
      const result: string = ArrayBuffer.stringify(buffer, 'utf8', 0, buffer.byteLength);
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.name testArrayBufferStringify0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_1700
     * @tc.desc Verify stringify with tab character encoding throws IllegalArgumentError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(3);
      buffer.set(0, Int.toByte(65));
      try {
        ArrayBuffer.stringify(buffer, '\t', 0, buffer.byteLength);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_1800
     * @tc.desc Verify stringify with newline character encoding throws IllegalArgumentError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(3);
      buffer.set(0, Int.toByte(65));
      try {
        ArrayBuffer.stringify(buffer, '\n', 0, buffer.byteLength);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_1900
     * @tc.desc Verify stringify with zero-width space encoding throws IllegalArgumentError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(3);
      buffer.set(0, Int.toByte(65));
      try {
        ArrayBuffer.stringify(buffer, '\u200B', 0, buffer.byteLength);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_2000
     * @tc.desc Verify stringify with XSS encoding throws IllegalArgumentError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(3);
      buffer.set(0, Int.toByte(65));
      try {
        ArrayBuffer.stringify(buffer, '<script>alert(1)</script>', 0, buffer.byteLength);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_2100
     * @tc.desc Verify stringify with Arabic encoding name throws IllegalArgumentError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(3);
      buffer.set(0, Int.toByte(65));
      try {
        ArrayBuffer.stringify(buffer, 'الاختبار', 0, buffer.byteLength);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_2200
     * @tc.desc Verify stringify with Russian encoding name throws IllegalArgumentError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(3);
      buffer.set(0, Int.toByte(65));
      try {
        ArrayBuffer.stringify(buffer, 'АБВГД', 0, buffer.byteLength);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_2300
     * @tc.desc Verify stringify with Korean encoding name throws IllegalArgumentError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(3);
      buffer.set(0, Int.toByte(65));
      try {
        ArrayBuffer.stringify(buffer, '테스트', 0, buffer.byteLength);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_2400
     * @tc.desc Verify stringify with mixed encoding name throws IllegalArgumentError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(3);
      buffer.set(0, Int.toByte(65));
      try {
        ArrayBuffer.stringify(buffer, 'Test測試', 0, buffer.byteLength);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_2500
     * @tc.desc Verify stringify with int boundary start throws IllegalArgumentError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(3);
      buffer.set(0, Int.toByte(65));
      try {
        ArrayBuffer.stringify(buffer, 'utf8', 2147483647, buffer.byteLength);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_2600
     * @tc.desc Verify stringify with int boundary end throws IllegalArgumentError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(3);
      buffer.set(0, Int.toByte(65));
      try {
        ArrayBuffer.stringify(buffer, 'utf8', 0, 2147483647);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_2700
     * @tc.desc Verify stringify full range restores 'ABC'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = ArrayBuffer.from('ABC', 'utf8');
      const s: string = ArrayBuffer.stringify(buf, 'utf8', 0, buf.byteLength);
      expect(s).assertEqual('ABC');
    });

    /**
     * @tc.name testArrayBufferStringify0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_2800
     * @tc.desc Verify stringify empty range returns empty string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = ArrayBuffer.from('ABC', 'utf8');
      const s: string = ArrayBuffer.stringify(buf, 'utf8', 0, 0);
      expect(s).assertEqual("");
    });

    /**
     * @tc.name testArrayBufferStringify0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_2900
     * @tc.desc Verify stringify with Chinese characters round-trips correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = ArrayBuffer.from("你好", 'utf8');
      const s: string = ArrayBuffer.stringify(buf, 'utf8', 0, buf.byteLength);
      expect(s).assertEqual("你好");
    });

    /**
     * @tc.name testArrayBufferStringify0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_3000
     * @tc.desc Verify stringify partial range [1,3) returns 'BC'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = ArrayBuffer.from('ABCDE', 'utf8');
      const s: string = ArrayBuffer.stringify(buf, 'utf8', 1, 3);
      expect(s).assertEqual('BC');
    });

    /**
     * @tc.name testArrayBufferStringify0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_3100
     * @tc.desc Verify stringify(start=0, end=1) returns first character
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = ArrayBuffer.from('XYZ', 'utf8');
      const s: string = ArrayBuffer.stringify(buf, 'utf8', 0, 1);
      expect(s).assertEqual("X");
    });

    /**
     * @tc.name testArrayBufferStringify0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_3200
     * @tc.desc Verify stringify does not modify source buffer byteLength
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = ArrayBuffer.from('hello', 'utf8');
      const lenB: int = buf.byteLength;
      ArrayBuffer.stringify(buf, 'utf8', 0, buf.byteLength);
      expect(buf.byteLength).assertEqual(lenB);
    });

    /**
     * @tc.name testArrayBufferStringify0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_3300
     * @tc.desc Verify stringify does not modify source buffer detached state
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = ArrayBuffer.from('hello', 'utf8');
      ArrayBuffer.stringify(buf, 'utf8', 0, buf.byteLength);
      expect(buf.detached).assertFalse();
    });

    /**
     * @tc.name testArrayBufferStringify0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_3400
     * @tc.desc Verify stringify with negative start throws error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = ArrayBuffer.from('abc', 'utf8');
      try {
        ArrayBuffer.stringify(buf, 'utf8', -1, 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_3500
     * @tc.desc Verify stringify with start beyond byteLength throws error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = ArrayBuffer.from('abc', 'utf8');
      try {
        ArrayBuffer.stringify(buf, 'utf8', 10, 12);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_3600
     * @tc.desc Verify stringify with end beyond byteLength throws error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = ArrayBuffer.from('abc', 'utf8');
      try {
        ArrayBuffer.stringify(buf, 'utf8', 0, 10);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_3700
     * @tc.desc Verify stringify with start > end throws error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = ArrayBuffer.from('abc', 'utf8');
      try {
        ArrayBuffer.stringify(buf, 'utf8', 3, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_3800
     * @tc.desc Verify stringify with invalid encoding throws error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = ArrayBuffer.from('abc', 'utf8');
      try {
        ArrayBuffer.stringify(buf, 'invalid-encoding', 0, 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_3900
     * @tc.desc Verify stringify with empty encoding throws error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = ArrayBuffer.from('abc', 'utf8');
      try {
        ArrayBuffer.stringify(buf, "", 0, 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
      }
    });

    /**
     * @tc.name testArrayBufferStringify0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_4000
     * @tc.desc Verify stringify Chinese characters round-trip
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = ArrayBuffer.from("你好世界", 'utf8');
      const text: string = ArrayBuffer.stringify(buf, 'utf8', 0, buf.byteLength);
      expect(text).assertEqual("你好世界");
    });

    /**
     * @tc.name testArrayBufferStringify0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_4100
     * @tc.desc Verify stringify does not modify source buffer content
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = ArrayBuffer.from('ABC', 'utf8');
      ArrayBuffer.stringify(buf, 'utf8', 0, buf.byteLength);
      expect(ArrayBuffer.stringify(buf, 'utf8', 0, buf.byteLength)).assertEqual('ABC');
    });

    /**
     * @tc.name testArrayBufferStringify0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_4200
     * @tc.desc Verify stringify start=5, end=10 on 10-byte buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = ArrayBuffer.from('abcdefghij', 'utf8');
      const s: string = ArrayBuffer.stringify(buf, 'utf8', 5, 10);
      expect(s).assertEqual('fghij');
    });

    /**
     * @tc.name testArrayBufferStringify0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_4300
     * @tc.desc Verify stringify end=5 on 10-byte buffer returns first 5 chars
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = ArrayBuffer.from('abcdefghij', 'utf8');
      const s: string = ArrayBuffer.stringify(buf, 'utf8', 0, 5);
      expect(s).assertEqual('abcde');
    });

    /**
     * @tc.name testArrayBufferStringify0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_4400
     * @tc.desc Verify stringify end=10 on 10-byte buffer returns full string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = ArrayBuffer.from('abcdefghij', 'utf8');
      const s: string = ArrayBuffer.stringify(buf, 'utf8', 0, 10);
      expect(s).assertEqual('abcdefghij');
    });

    /**
     * @tc.name testArrayBufferStringify0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_STRINGIFY_4500
     * @tc.desc Verify from(string) modifies buffer then stringify differs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferStringify0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = ArrayBuffer.from('ABC', 'utf8');
      buf.set(0, Int.toByte(88));
      const text: string = ArrayBuffer.stringify(buf, 'utf8', 0, buf.byteLength);
      expect(text).assertEqual('XBC');
    });
  });
}


