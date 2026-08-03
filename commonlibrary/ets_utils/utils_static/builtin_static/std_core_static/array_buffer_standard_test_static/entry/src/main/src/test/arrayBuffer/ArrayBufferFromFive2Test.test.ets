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

export default function arrayBufferFromFive2Test(): void {
  describe('ArrayBufferFromFive2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    /**
     * @tc.name testArrayBufferFromFive0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_0100
     * @tc.desc Verify from ASCII letters with utf8 encodes every byte correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from('ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'utf8');
      expect(buf.byteLength).assertEqual(26);
      for (let i: int = 0; i < 26; i++) {
        expect(buf.at(i)).assertEqual(Int.toByte(65 + i));
      }
    });

    /**
     * @tc.name testArrayBufferFromFive0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_0200
     * @tc.desc Verify from string containing null character with utf8 encodes every byte correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from('A\u0000B', 'utf8');
      expect(buf.byteLength).assertEqual(3);
      expect(buf.at(0)).assertEqual(Int.toByte(0x41));
      expect(buf.at(1)).assertEqual(Int.toByte(0x00));
      expect(buf.at(2)).assertEqual(Int.toByte(0x42));
    });

    /**
     * @tc.name testArrayBufferFromFive0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_0300
     * @tc.desc Verify from single CJK character with utf8 encodes three-byte sequence correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from('浣', 'utf8');
      expect(buf.byteLength).assertEqual(3);
      expect(buf.at(0)).assertEqual(Int.toByte(0xE6));
      expect(buf.at(1)).assertEqual(Int.toByte(0xB5));
      expect(buf.at(2)).assertEqual(Int.toByte(0xA3));
    });

    /**
     * @tc.name testArrayBufferFromFive0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_0400
     * @tc.desc Verify from emoji with utf8 encodes four-byte sequence correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from('😀', 'utf8');
      expect(buf.byteLength).assertEqual(4);
      expect(buf.at(0)).assertEqual(Int.toByte(0xF0));
      expect(buf.at(1)).assertEqual(Int.toByte(0x9F));
      expect(buf.at(2)).assertEqual(Int.toByte(0x98));
      expect(buf.at(3)).assertEqual(Int.toByte(0x80));
    });

    /**
     * @tc.name testArrayBufferFromFive0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_0500
     * @tc.desc Verify from mixed ASCII, CJK, and emoji string with utf8 encodes every byte correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from('A你好😀B', 'utf8');
      expect(buf.byteLength).assertEqual(12);
      expect(buf.at(0)).assertEqual(Int.toByte(0x41));
      expect(buf.at(1)).assertEqual(Int.toByte(0xE4));
      expect(buf.at(2)).assertEqual(Int.toByte(0xBD));
      expect(buf.at(3)).assertEqual(Int.toByte(0xA0));
      expect(buf.at(4)).assertEqual(Int.toByte(0xE5));
      expect(buf.at(5)).assertEqual(Int.toByte(0xA5));
      expect(buf.at(6)).assertEqual(Int.toByte(0xBD));
      expect(buf.at(7)).assertEqual(Int.toByte(0xF0));
      expect(buf.at(8)).assertEqual(Int.toByte(0x9F));
      expect(buf.at(9)).assertEqual(Int.toByte(0x98));
      expect(buf.at(10)).assertEqual(Int.toByte(0x80));
      expect(buf.at(11)).assertEqual(Int.toByte(0x42));
    });

    /**
     * @tc.name testArrayBufferFromFive0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_0600
     * @tc.desc Verify from utf8 boundary code points encodes one-byte, two-byte, and three-byte sequences correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from('\u0000\u007F\u0080\u07FF\u0800\uFFFF', 'utf8');
      expect(buf.byteLength).assertEqual(12);
      expect(buf.at(0)).assertEqual(Int.toByte(0x00));
      expect(buf.at(1)).assertEqual(Int.toByte(0x7F));
      expect(buf.at(2)).assertEqual(Int.toByte(0xC2));
      expect(buf.at(3)).assertEqual(Int.toByte(0x80));
      expect(buf.at(4)).assertEqual(Int.toByte(0xDF));
      expect(buf.at(5)).assertEqual(Int.toByte(0xBF));
      expect(buf.at(6)).assertEqual(Int.toByte(0xE0));
      expect(buf.at(7)).assertEqual(Int.toByte(0xA0));
      expect(buf.at(8)).assertEqual(Int.toByte(0x80));
      expect(buf.at(9)).assertEqual(Int.toByte(0xEF));
      expect(buf.at(10)).assertEqual(Int.toByte(0xBF));
      expect(buf.at(11)).assertEqual(Int.toByte(0xBF));
    });

    /**
     * @tc.name testArrayBufferFromFive0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_0700
     * @tc.desc Verify from long ASCII string with utf8 copies every byte correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const length: int = 4096;
      const text: string = 'A'.repeat(length);
      const buf = ArrayBuffer.from(text, 'utf8');
      expect(buf.byteLength).assertEqual(length);
      for (let i: int = 0; i < length; i++) {
        expect(buf.at(i)).assertEqual(Int.toByte(0x41));
      }
    });

    /**
     * @tc.name testArrayBufferFromFive0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_0800
     * @tc.desc Verify from repeated CJK string with utf8 copies every byte pattern correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const count: int = 256;
      const text: string = '你'.repeat(count);
      const buf = ArrayBuffer.from(text, 'utf8');
      expect(buf.byteLength).assertEqual(count * 3);
      for (let i: int = 0; i < count; i++) {
        const index: int = i * 3;
        expect(buf.at(index)).assertEqual(Int.toByte(0xE4));
        expect(buf.at(index + 1)).assertEqual(Int.toByte(0xBD));
        expect(buf.at(index + 2)).assertEqual(Int.toByte(0xA0));
      }
    });

    /**
     * @tc.name testArrayBufferFromFive0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_0900
     * @tc.desc Verify from utf8 string supports round-trip stringify for mixed content
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: string = 'ArrayBuffer你好😀';
      const buf = ArrayBuffer.from(text, 'utf8');
      const result: string = ArrayBuffer.stringify(buf, 'utf8', 0, buf.byteLength);
      expect(result).assertEqual(text);
    });

    /**
     * @tc.name testArrayBufferFromFive0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_1000
     * @tc.desc Verify from ascii string supports round-trip stringify for ASCII content
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: string = 'ArrayBuffer123';
      const buf = ArrayBuffer.from(text, 'ascii');
      const result: string = ArrayBuffer.stringify(buf, 'ascii', 0, buf.byteLength);
      expect(result).assertEqual(text);
    });

    /**
     * @tc.name testArrayBufferFromFive0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_1100
     * @tc.desc Verify repeated from same ascii string returns independent ArrayBuffer results
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf1 = ArrayBuffer.from('ABC123', 'ascii');
      const buf2 = ArrayBuffer.from('ABC123', 'ascii');
      buf1.set(0, Int.toByte(90));
      expect(buf1.at(0)).assertEqual(Int.toByte(90));
      expect(buf2.at(0)).assertEqual(Int.toByte(65));
    });

    /**
     * @tc.name testArrayBufferFromFive0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_1200
     * @tc.desc Verify from ASCII letters with utf16le encodes every byte correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from('ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'utf16le');
      expect(buf.byteLength).assertEqual(52);
      for (let i: int = 0; i < 26; i++) {
        expect(buf.at(i * 2)).assertEqual(Int.toByte(65 + i));
        expect(buf.at(i * 2 + 1)).assertEqual(Int.toByte(0x00));
      }
    });

    /**
     * @tc.name testArrayBufferFromFive0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_1300
     * @tc.desc Verify from string containing null character with utf16le encodes every byte correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from('A\u0000B', 'utf16le');
      expect(buf.byteLength).assertEqual(6);
      expect(buf.at(0)).assertEqual(Int.toByte(0x41));
      expect(buf.at(1)).assertEqual(Int.toByte(0x00));
      expect(buf.at(2)).assertEqual(Int.toByte(0x00));
      expect(buf.at(3)).assertEqual(Int.toByte(0x00));
      expect(buf.at(4)).assertEqual(Int.toByte(0x42));
      expect(buf.at(5)).assertEqual(Int.toByte(0x00));
    });

    /**
     * @tc.name testArrayBufferFromFive0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_1400
     * @tc.desc Verify from single CJK character with utf16le encodes little-endian bytes correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from('你', 'utf16le');
      expect(buf.byteLength).assertEqual(2);
      expect(buf.at(0)).assertEqual(Int.toByte(0x60));
      expect(buf.at(1)).assertEqual(Int.toByte(0x4F));
    });

    /**
     * @tc.name testArrayBufferFromFive0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_1500
     * @tc.desc Verify from utf16le boundary code points encodes little-endian bytes correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from('\u0000\u007F\u0080\u07FF\u0800\uFFFF', 'utf16le');
      expect(buf.byteLength).assertEqual(12);
      expect(buf.at(0)).assertEqual(Int.toByte(0x00));
      expect(buf.at(1)).assertEqual(Int.toByte(0x00));
      expect(buf.at(2)).assertEqual(Int.toByte(0x7F));
      expect(buf.at(3)).assertEqual(Int.toByte(0x00));
      expect(buf.at(4)).assertEqual(Int.toByte(0x80));
      expect(buf.at(5)).assertEqual(Int.toByte(0x00));
      expect(buf.at(6)).assertEqual(Int.toByte(0xFF));
      expect(buf.at(7)).assertEqual(Int.toByte(0x07));
      expect(buf.at(8)).assertEqual(Int.toByte(0x00));
      expect(buf.at(9)).assertEqual(Int.toByte(0x08));
      expect(buf.at(10)).assertEqual(Int.toByte(0xFF));
      expect(buf.at(11)).assertEqual(Int.toByte(0xFF));
    });

    /**
     * @tc.name testArrayBufferFromFive0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_1600
     * @tc.desc Verify from long ASCII string with utf16le copies every byte correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const length: int = 4096;
      const text: string = 'A'.repeat(length);
      const buf = ArrayBuffer.from(text, 'utf16le');
      expect(buf.byteLength).assertEqual(length * 2);
      for (let i: int = 0; i < length; i++) {
        const index: int = i * 2;
        expect(buf.at(index)).assertEqual(Int.toByte(0x41));
        expect(buf.at(index + 1)).assertEqual(Int.toByte(0x00));
      }
    });

    /**
     * @tc.name testArrayBufferFromFive0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_1700
     * @tc.desc Verify from repeated CJK string with utf16le copies every byte pattern correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const count: int = 256;
      const text: string = '你'.repeat(count);
      const buf = ArrayBuffer.from(text, 'utf16le');
      expect(buf.byteLength).assertEqual(count * 2);
      for (let i: int = 0; i < count; i++) {
        const index: int = i * 2;
        expect(buf.at(index)).assertEqual(Int.toByte(0x60));
        expect(buf.at(index + 1)).assertEqual(Int.toByte(0x4F));
      }
    });

    /**
     * @tc.name testArrayBufferFromFive0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_1800
     * @tc.desc Verify repeated from same utf16le string returns independent ArrayBuffer results
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf1 = ArrayBuffer.from('ABC浣犲ソ', 'utf16le');
      const buf2 = ArrayBuffer.from('ABC浣犲ソ', 'utf16le');
      buf1.set(0, Int.toByte(90));
      expect(buf1.at(0)).assertEqual(Int.toByte(90));
      expect(buf2.at(0)).assertEqual(Int.toByte(65));
    });

    /**
     * @tc.name testArrayBufferFromFive0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_1900
     * @tc.desc Verify from base64 string for ASCII letters decodes every byte correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from('QUJDREVGR0hJSktMTU5PUFFSU1RVVldYWVo=', 'base64');
      expect(buf.byteLength).assertEqual(26);
      for (let i: int = 0; i < 26; i++) {
        expect(buf.at(i)).assertEqual(Int.toByte(65 + i));
      }
    });

    /**
     * @tc.name testArrayBufferFromFive0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_2000
     * @tc.desc Verify from base64 string containing null byte decodes every byte correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from('QQBC', 'base64');
      expect(buf.byteLength).assertEqual(3);
      expect(buf.at(0)).assertEqual(Int.toByte(0x41));
      expect(buf.at(1)).assertEqual(Int.toByte(0x00));
      expect(buf.at(2)).assertEqual(Int.toByte(0x42));
    });

    /**
     * @tc.name testArrayBufferFromFive0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_2100
     * @tc.desc Verify from base64 string for single CJK utf8 bytes decodes correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from('5L2g', 'base64');
      expect(buf.byteLength).assertEqual(3);
      expect(buf.at(0)).assertEqual(Int.toByte(0xE4));
      expect(buf.at(1)).assertEqual(Int.toByte(0xBD));
      expect(buf.at(2)).assertEqual(Int.toByte(0xA0));
    });

    /**
     * @tc.name testArrayBufferFromFive0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_2200
     * @tc.desc Verify from base64 string for emoji utf8 bytes decodes correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from('8J+YgA==', 'base64');
      expect(buf.byteLength).assertEqual(4);
      expect(buf.at(0)).assertEqual(Int.toByte(0xF0));
      expect(buf.at(1)).assertEqual(Int.toByte(0x9F));
      expect(buf.at(2)).assertEqual(Int.toByte(0x98));
      expect(buf.at(3)).assertEqual(Int.toByte(0x80));
    });

    /**
     * @tc.name testArrayBufferFromFive0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_2300
     * @tc.desc Verify from base64 string for mixed utf8 bytes decodes every byte correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from('QeS9oOWlvfCfmIBC', 'base64');
      expect(buf.byteLength).assertEqual(12);
      expect(buf.at(0)).assertEqual(Int.toByte(0x41));
      expect(buf.at(1)).assertEqual(Int.toByte(0xE4));
      expect(buf.at(2)).assertEqual(Int.toByte(0xBD));
      expect(buf.at(3)).assertEqual(Int.toByte(0xA0));
      expect(buf.at(4)).assertEqual(Int.toByte(0xE5));
      expect(buf.at(5)).assertEqual(Int.toByte(0xA5));
      expect(buf.at(6)).assertEqual(Int.toByte(0xBD));
      expect(buf.at(7)).assertEqual(Int.toByte(0xF0));
      expect(buf.at(8)).assertEqual(Int.toByte(0x9F));
      expect(buf.at(9)).assertEqual(Int.toByte(0x98));
      expect(buf.at(10)).assertEqual(Int.toByte(0x80));
      expect(buf.at(11)).assertEqual(Int.toByte(0x42));
    });

    /**
     * @tc.name testArrayBufferFromFive0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_2400
     * @tc.desc Verify from base64 boundary bytes decodes correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from('AH/CgN+/4KCA77+/', 'base64');
      expect(buf.byteLength).assertEqual(12);
      expect(buf.at(0)).assertEqual(Int.toByte(0x00));
      expect(buf.at(1)).assertEqual(Int.toByte(0x7F));
      expect(buf.at(2)).assertEqual(Int.toByte(0xC2));
      expect(buf.at(3)).assertEqual(Int.toByte(0x80));
      expect(buf.at(4)).assertEqual(Int.toByte(0xDF));
      expect(buf.at(5)).assertEqual(Int.toByte(0xBF));
      expect(buf.at(6)).assertEqual(Int.toByte(0xE0));
      expect(buf.at(7)).assertEqual(Int.toByte(0xA0));
      expect(buf.at(8)).assertEqual(Int.toByte(0x80));
      expect(buf.at(9)).assertEqual(Int.toByte(0xEF));
      expect(buf.at(10)).assertEqual(Int.toByte(0xBF));
      expect(buf.at(11)).assertEqual(Int.toByte(0xBF));
    });

    /**
     * @tc.name testArrayBufferFromFive0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_2500
     * @tc.desc Verify from long base64 ASCII payload decodes every byte correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const count: int = 1365;
      const text: string = 'QUFB'.repeat(count);
      const buf = ArrayBuffer.from(text, 'base64');
      expect(buf.byteLength).assertEqual(count * 3);
      for (let i: int = 0; i < count * 3; i++) {
        expect(buf.at(i)).assertEqual(Int.toByte(0x41));
      }
    });

    /**
     * @tc.name testArrayBufferFromFive0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_2600
     * @tc.desc Verify from repeated base64 CJK utf8 payload decodes every byte pattern correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const count: int = 256;
      const text: string = '5L2g'.repeat(count);
      const buf = ArrayBuffer.from(text, 'base64');
      expect(buf.byteLength).assertEqual(count * 3);
      for (let i: int = 0; i < count; i++) {
        const index: int = i * 3;
        expect(buf.at(index)).assertEqual(Int.toByte(0xE4));
        expect(buf.at(index + 1)).assertEqual(Int.toByte(0xBD));
        expect(buf.at(index + 2)).assertEqual(Int.toByte(0xA0));
      }
    });

    /**
     * @tc.name testArrayBufferFromFive0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_2700
     * @tc.desc Verify from base64 string supports round-trip stringify for mixed utf8 payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: string = 'ArrayBuffer你好😀';
      const buf = ArrayBuffer.from('QXJyYXlCdWZmZXLkvaDlpb3wn5iA', 'base64');
      const result: string = ArrayBuffer.stringify(buf, 'utf8', 0, buf.byteLength);
      expect(result).assertEqual(text);
    });

    /**
     * @tc.name testArrayBufferFromFive0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_2800
     * @tc.desc Verify repeated from same base64 string returns independent ArrayBuffer results
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf1 = ArrayBuffer.from('QUJD5L2g5aW9', 'base64');
      const buf2 = ArrayBuffer.from('QUJD5L2g5aW9', 'base64');
      buf1.set(0, Int.toByte(90));
      expect(buf1.at(0)).assertEqual(Int.toByte(90));
      expect(buf2.at(0)).assertEqual(Int.toByte(65));
    });

    /**
     * @tc.name testArrayBufferFromFive0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_2900
     * @tc.desc Verify from hex string for ASCII letters decodes every byte correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from('4142434445464748494a4b4c4d4e4f505152535455565758595a', 'hex');
      expect(buf.byteLength).assertEqual(26);
      for (let i: int = 0; i < 26; i++) {
        expect(buf.at(i)).assertEqual(Int.toByte(65 + i));
      }
    });

    /**
     * @tc.name testArrayBufferFromFive0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_3000
     * @tc.desc Verify from hex string containing null byte decodes every byte correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from('410042', 'hex');
      expect(buf.byteLength).assertEqual(3);
      expect(buf.at(0)).assertEqual(Int.toByte(0x41));
      expect(buf.at(1)).assertEqual(Int.toByte(0x00));
      expect(buf.at(2)).assertEqual(Int.toByte(0x42));
    });

    /**
     * @tc.name testArrayBufferFromFive0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_3100
     * @tc.desc Verify from hex string for single CJK utf8 bytes decodes correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from('e4bda0', 'hex');
      expect(buf.byteLength).assertEqual(3);
      expect(buf.at(0)).assertEqual(Int.toByte(0xE4));
      expect(buf.at(1)).assertEqual(Int.toByte(0xBD));
      expect(buf.at(2)).assertEqual(Int.toByte(0xA0));
    });

    /**
     * @tc.name testArrayBufferFromFive0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_3200
     * @tc.desc Verify from hex string for emoji utf8 bytes decodes correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from('f09f9880', 'hex');
      expect(buf.byteLength).assertEqual(4);
      expect(buf.at(0)).assertEqual(Int.toByte(0xF0));
      expect(buf.at(1)).assertEqual(Int.toByte(0x9F));
      expect(buf.at(2)).assertEqual(Int.toByte(0x98));
      expect(buf.at(3)).assertEqual(Int.toByte(0x80));
    });

    /**
     * @tc.name testArrayBufferFromFive0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_3300
     * @tc.desc Verify from hex string for mixed utf8 bytes decodes every byte correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from('41e4bda0e5a5bdf09f988042', 'hex');
      expect(buf.byteLength).assertEqual(12);
      expect(buf.at(0)).assertEqual(Int.toByte(0x41));
      expect(buf.at(1)).assertEqual(Int.toByte(0xE4));
      expect(buf.at(2)).assertEqual(Int.toByte(0xBD));
      expect(buf.at(3)).assertEqual(Int.toByte(0xA0));
      expect(buf.at(4)).assertEqual(Int.toByte(0xE5));
      expect(buf.at(5)).assertEqual(Int.toByte(0xA5));
      expect(buf.at(6)).assertEqual(Int.toByte(0xBD));
      expect(buf.at(7)).assertEqual(Int.toByte(0xF0));
      expect(buf.at(8)).assertEqual(Int.toByte(0x9F));
      expect(buf.at(9)).assertEqual(Int.toByte(0x98));
      expect(buf.at(10)).assertEqual(Int.toByte(0x80));
      expect(buf.at(11)).assertEqual(Int.toByte(0x42));
    });

    /**
     * @tc.name testArrayBufferFromFive0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_3400
     * @tc.desc Verify from hex boundary bytes decodes correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from('007fc280dfbfe0a080efbfbf', 'hex');
      expect(buf.byteLength).assertEqual(12);
      expect(buf.at(0)).assertEqual(Int.toByte(0x00));
      expect(buf.at(1)).assertEqual(Int.toByte(0x7F));
      expect(buf.at(2)).assertEqual(Int.toByte(0xC2));
      expect(buf.at(3)).assertEqual(Int.toByte(0x80));
      expect(buf.at(4)).assertEqual(Int.toByte(0xDF));
      expect(buf.at(5)).assertEqual(Int.toByte(0xBF));
      expect(buf.at(6)).assertEqual(Int.toByte(0xE0));
      expect(buf.at(7)).assertEqual(Int.toByte(0xA0));
      expect(buf.at(8)).assertEqual(Int.toByte(0x80));
      expect(buf.at(9)).assertEqual(Int.toByte(0xEF));
      expect(buf.at(10)).assertEqual(Int.toByte(0xBF));
      expect(buf.at(11)).assertEqual(Int.toByte(0xBF));
    });

    /**
     * @tc.name testArrayBufferFromFive0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_3500
     * @tc.desc Verify from long hex ASCII payload decodes every byte correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const length: int = 4096;
      const text: string = '41'.repeat(length);
      const buf = ArrayBuffer.from(text, 'hex');
      expect(buf.byteLength).assertEqual(length);
      for (let i: int = 0; i < length; i++) {
        expect(buf.at(i)).assertEqual(Int.toByte(0x41));
      }
    });

    /**
     * @tc.name testArrayBufferFromFive0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_3600
     * @tc.desc Verify from repeated hex CJK utf8 payload decodes every byte pattern correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const count: int = 256;
      const text: string = 'e4bda0'.repeat(count);
      const buf = ArrayBuffer.from(text, 'hex');
      expect(buf.byteLength).assertEqual(count * 3);
      for (let i: int = 0; i < count; i++) {
        const index: int = i * 3;
        expect(buf.at(index)).assertEqual(Int.toByte(0xE4));
        expect(buf.at(index + 1)).assertEqual(Int.toByte(0xBD));
        expect(buf.at(index + 2)).assertEqual(Int.toByte(0xA0));
      }
    });

    /**
     * @tc.name testArrayBufferFromFive0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_3700
     * @tc.desc Verify from hex string supports round-trip stringify for mixed utf8 payload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: string = 'ArrayBuffer你好😀';
      const buf = ArrayBuffer.from('4172726179427566666572e4bda0e5a5bdf09f9880', 'hex');
      const result: string = ArrayBuffer.stringify(buf, 'utf8', 0, buf.byteLength);
      expect(result).assertEqual(text);
    });

    /**
     * @tc.name testArrayBufferFromFive0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_3800
     * @tc.desc Verify repeated from same hex string returns independent ArrayBuffer results
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf1 = ArrayBuffer.from('414243e4bda0e5a5bd', 'hex');
      const buf2 = ArrayBuffer.from('414243e4bda0e5a5bd', 'hex');
      buf1.set(0, Int.toByte(90));
      expect(buf1.at(0)).assertEqual(Int.toByte(90));
      expect(buf2.at(0)).assertEqual(Int.toByte(65));
      expect(buf2.at(1)).assertEqual(Int.toByte(66));
      expect(buf2.at(2)).assertEqual(Int.toByte(67));
    });

    /**
     * @tc.name testArrayBufferFromFive0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_3900
     * @tc.desc Verify from ASCII letters with latin1 encodes every byte correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from('ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'latin1');
      expect(buf.byteLength).assertEqual(26);
      for (let i: int = 0; i < 26; i++) {
        expect(buf.at(i)).assertEqual(Int.toByte(65 + i));
      }
    });

    /**
     * @tc.name testArrayBufferFromFive0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_4000
     * @tc.desc Verify from string containing null character with latin1 encodes every byte correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from('A\u0000B', 'latin1');
      expect(buf.byteLength).assertEqual(3);
      expect(buf.at(0)).assertEqual(Int.toByte(0x41));
      expect(buf.at(1)).assertEqual(Int.toByte(0x00));
      expect(buf.at(2)).assertEqual(Int.toByte(0x42));
    });

    /**
     * @tc.name testArrayBufferFromFive0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_4100
     * @tc.desc Verify from long ASCII string with latin1 copies every byte correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const length: int = 4096;
      const text: string = 'A'.repeat(length);
      const buf = ArrayBuffer.from(text, 'latin1');
      expect(buf.byteLength).assertEqual(length);
      for (let i: int = 0; i < length; i++) {
        expect(buf.at(i)).assertEqual(Int.toByte(0x41));
      }
    });

    /**
     * @tc.name testArrayBufferFromFive0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_4200
     * @tc.desc Verify from latin1 string supports round-trip stringify for latin1 content
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: string = 'A\u00E9B';
      const buf = ArrayBuffer.from(text, 'latin1');
      const result: string = ArrayBuffer.stringify(buf, 'latin1', 0, buf.byteLength);
      expect(result).assertEqual(text);
    });

    /**
     * @tc.name testArrayBufferFromFive0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_4300
     * @tc.desc Verify from ASCII letters with binary encodes every byte correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from('ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'binary');
      expect(buf.byteLength).assertEqual(26);
      for (let i: int = 0; i < 26; i++) {
        expect(buf.at(i)).assertEqual(Int.toByte(65 + i));
      }
    });

    /**
     * @tc.name testArrayBufferFromFive0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_4400
     * @tc.desc Verify from string containing null character with binary encodes every byte correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from('A\u0000B', 'binary');
      expect(buf.byteLength).assertEqual(3);
      expect(buf.at(0)).assertEqual(Int.toByte(0x41));
      expect(buf.at(1)).assertEqual(Int.toByte(0x00));
      expect(buf.at(2)).assertEqual(Int.toByte(0x42));
    });

    /**
     * @tc.name testArrayBufferFromFive0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_4500
     * @tc.desc Verify from long ASCII string with binary copies every byte correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const length: int = 4096;
      const text: string = 'A'.repeat(length);
      const buf = ArrayBuffer.from(text, 'binary');
      expect(buf.byteLength).assertEqual(length);
      for (let i: int = 0; i < length; i++) {
        expect(buf.at(i)).assertEqual(Int.toByte(0x41));
      }
    });

    /**
     * @tc.name testArrayBufferFromFive0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_4600
     * @tc.desc Verify from single ASCII character "A" has byte length 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = ArrayBuffer.from('A', 'utf8');
      expect(buf.byteLength).assertEqual(1);
      expect(buf.at(0)).assertEqual(Int.toByte(0x41));
    });

    /**
     * @tc.name testArrayBufferFromFive0047
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_4700
     * @tc.desc Verify from("", 'utf8') returns empty buffer (round-trip empty string)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = ArrayBuffer.from('', 'utf8');
      const result: string = ArrayBuffer.stringify(buf, 'utf8', 0, buf.byteLength);
      expect(buf.byteLength).assertEqual(0);
      expect(result).assertEqual('');
    });

    /**
     * @tc.name testArrayBufferFromFive0048
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_4800
     * @tc.desc Verify from("abcde", 'utf8') 5 chars
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = ArrayBuffer.from('abcde', 'utf8');
      expect(buf.byteLength).assertEqual(5);
      expect(buf.at(0)).assertEqual(Int.toByte(0x61));
      expect(buf.at(1)).assertEqual(Int.toByte(0x62));
      expect(buf.at(2)).assertEqual(Int.toByte(0x63));
      expect(buf.at(3)).assertEqual(Int.toByte(0x64));
      expect(buf.at(4)).assertEqual(Int.toByte(0x65));
    });

    /**
     * @tc.name testArrayBufferFromFive0049
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_4900
     * @tc.desc Verify from("abcdefghij", 'utf8') 10 chars
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = ArrayBuffer.from('abcdefghij', 'utf8');
      expect(buf.byteLength).assertEqual(10);
      expect(buf.at(0)).assertEqual(Int.toByte(0x61));
      expect(buf.at(4)).assertEqual(Int.toByte(0x65));
      expect(buf.at(9)).assertEqual(Int.toByte(0x6A));
    });

    /**
     * @tc.name testArrayBufferFromFive0050
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_5000
     * @tc.desc Verify from("ABC",'utf8') returns ArrayBuffer with byteLength 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = ArrayBuffer.from('ABC', 'utf8');
      expect(buf.byteLength).assertEqual(3);
      expect(buf.at(0)).assertEqual(Int.toByte(0x41));
      expect(buf.at(1)).assertEqual(Int.toByte(0x42));
      expect(buf.at(2)).assertEqual(Int.toByte(0x43));
    });

    /**
     * @tc.name testArrayBufferFromFive0051
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_5100
     * @tc.desc Verify new ArrayBuffer(0) stringify returns empty string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(0);
      const result: string = ArrayBuffer.stringify(buf, 'utf8', 0, buf.byteLength);
      expect(result).assertEqual('');
    });

    /**
     * @tc.name testArrayBufferFromFive0052
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_5200
     * @tc.desc Verify from string utf8 with CJK character (U+9225) byte length
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = ArrayBuffer.from('鈥', 'utf8');
      expect(buf.byteLength).assertEqual(3);
    });

    /**
     * @tc.name testArrayBufferFromFive0053
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_5300
     * @tc.desc Verify from string with invalid encoding throws error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf: ArrayBuffer = ArrayBuffer.from('hello', 'invalid-encoding');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
      }
    });

    /**
     * @tc.name testArrayBufferFromFive0054
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_5400
     * @tc.desc Verify from string with empty encoding throws error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buf: ArrayBuffer = ArrayBuffer.from('hello', "");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
      }
    });

    /**
     * @tc.name testArrayBufferFromFive0055
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_5500
     * @tc.desc Verify from string with detached false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = ArrayBuffer.from('hello', 'utf8');
      expect(buf.detached).assertFalse();
    });

    /**
     * @tc.name testArrayBufferFromFive0056
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_5600
     * @tc.desc Verify from string with resizable false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = ArrayBuffer.from('hello', 'utf8');
      expect(buf.resizable).assertFalse();
    });

    /**
     * @tc.name testArrayBufferFromFive0057
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_5700
     * @tc.desc Verify from string, encoding and stringify round-trip
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = ArrayBuffer.from('XYZ', 'utf8');
      const text: string = ArrayBuffer.stringify(buf, 'utf8', 0, buf.byteLength);
      expect(text).assertEqual('XYZ');
    });
  });
}
