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

export default function arrayBufferBytesLength2Test(): void {
  describe('ArrayBufferBytesLength2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.name testArrayBufferBytesLength0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0100
     * @tc.desc Verify bytesLength for multiple ASCII chars with utf16le
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = ArrayBuffer.bytesLength('ABC', 'utf16le');
      expect(len).assertEqual(6);
    });

    /**
     * @tc.name testArrayBufferBytesLength0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0200
     * @tc.desc Verify bytesLength for multiple ASCII chars with latin1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = ArrayBuffer.bytesLength('ABC', 'latin1');
      expect(len).assertEqual(3);
    });

    /**
     * @tc.name testArrayBufferBytesLength0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0300
     * @tc.desc Verify bytesLength for NUL character with utf8 encoding
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = ArrayBuffer.bytesLength('\u0000', 'utf8');
      expect(len).assertEqual(1);
    });

    /**
     * @tc.name testArrayBufferBytesLength0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0400
     * @tc.desc Verify bytesLength for NUL character with utf16le encoding
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = ArrayBuffer.bytesLength('\u0000', 'utf16le');
      expect(len).assertEqual(2);
    });

    /**
     * @tc.name testArrayBufferBytesLength0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0500
     * @tc.desc Verify bytesLength for tab character with utf8 returns 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayBuffer.bytesLength('\t', 'utf8')).assertEqual(1);
    });

    /**
     * @tc.name testArrayBufferBytesLength0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0600
     * @tc.desc Verify bytesLength for upper bound of 1-byte UTF-8 (U+007F)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = ArrayBuffer.bytesLength('\u007F', 'utf8');
      expect(len).assertEqual(1);
    });

    /**
     * @tc.name testArrayBufferBytesLength0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0700
     * @tc.desc Verify bytesLength for start of 2-byte UTF-8 range (U+0080)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = ArrayBuffer.bytesLength('\u0080', 'utf8');
      expect(len).assertEqual(2);
    });

    /**
     * @tc.name testArrayBufferBytesLength0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0800
     * @tc.desc Verify bytesLength for upper bound of 2-byte UTF-8 range (U+07FF)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = ArrayBuffer.bytesLength('\u07FF', 'utf8');
      expect(len).assertEqual(2);
    });

    /**
     * @tc.name testArrayBufferBytesLength0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0900
     * @tc.desc Verify bytesLength for UTF-8 2-byte sequences (Cyrillic)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = ArrayBuffer.bytesLength('Тест', 'utf8');
      expect(len).assertEqual(8);
    });

    /**
     * @tc.name testArrayBufferBytesLength0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_1000
     * @tc.desc Verify bytesLength for UTF-8 2-byte sequences (Arabic)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = ArrayBuffer.bytesLength('اختبار', 'utf8');
      expect(len).assertEqual(12);
    });

    /**
     * @tc.name testArrayBufferBytesLength0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_1100
     * @tc.desc Verify bytesLength for UTF-8 2-byte sequences (Russian)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = ArrayBuffer.bytesLength('русский', 'utf8');
      expect(len).assertEqual(14);
    });

    /**
     * @tc.name testArrayBufferBytesLength0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_1200
     * @tc.desc Verify bytesLength for start of 3-byte UTF-8 range (U+0800)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = ArrayBuffer.bytesLength('\u0800', 'utf8');
      expect(len).assertEqual(3);
    });

    /**
     * @tc.name testArrayBufferBytesLength0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_1300
     * @tc.desc Verify bytesLength for max BMP character (U+FFFF)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = ArrayBuffer.bytesLength('\uFFFF', 'utf8');
      expect(len).assertEqual(3);
    });

    /**
     * @tc.name testArrayBufferBytesLength0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_1400
     * @tc.desc Verify bytesLength for UTF-8 3-byte sequences (Japanese characters)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = ArrayBuffer.bytesLength('日本語', 'utf8');
      expect(len).assertEqual(9);
    });

    /**
     * @tc.name testArrayBufferBytesLength0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_1500
     * @tc.desc Verify bytesLength for UTF-8 3-byte sequences (Korean characters)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = ArrayBuffer.bytesLength('테스트', 'utf8');
      expect(len).assertEqual(9);
    });

    /**
     * @tc.name testArrayBufferBytesLength0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_1600
     * @tc.desc Verify bytesLength for UTF-8 mixed 1-byte and 3-byte sequences
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = ArrayBuffer.bytesLength('！@#￥%', 'utf8');
      expect(len).assertEqual(9);
    });

    /**
     * @tc.name testArrayBufferBytesLength0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_1700
     * @tc.desc Verify bytesLength for UTF-8 3-byte sequences (Zero-width space)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = ArrayBuffer.bytesLength('\u200B', 'utf8');
      expect(len).assertEqual(3);
    });

    /**
     * @tc.name testArrayBufferBytesLength0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_1800
     * @tc.desc Verify bytesLength for mixed English, CJK, numbers with utf8
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayBuffer.bytesLength('Hello世界123', 'utf8')).assertEqual(14);
    });

    /**
     * @tc.name testArrayBufferBytesLength0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_1900
     * @tc.desc Verify bytesLength for emoji + CJK and emoji + ASCII combos with utf8
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayBuffer.bytesLength('😀测试', 'utf8')).assertEqual(10);
      expect(ArrayBuffer.bytesLength('😀A', 'utf8')).assertEqual(5);
    });

    /**
     * @tc.name testArrayBufferBytesLength0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_2000
     * @tc.desc Verify bytesLength for multilingual sentence mix with utf8
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayBuffer.bytesLength('Hello世界테스트', 'utf8')).assertEqual(20);
      expect(ArrayBuffer.bytesLength('Hello，世界！Test。', 'utf8')).assertEqual(24);
    });

    /**
     * @tc.name testArrayBufferBytesLength0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_2100
     * @tc.desc Verify bytesLength matches from().byteLength for empty string utf8
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = '';
      const encoding = 'utf8';
      const lenDirect: int = ArrayBuffer.bytesLength(text, encoding);
      const buffer = ArrayBuffer.from(text, encoding);
      expect(lenDirect).assertEqual(buffer.byteLength);
    });

    /**
     * @tc.name testArrayBufferBytesLength0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_2200
     * @tc.desc Verify bytesLength("ABC", "utf8") returns 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = ArrayBuffer.bytesLength("ABC", "utf8");
      expect(len).assertEqual(3);
    });

    /**
     * @tc.name testArrayBufferBytesLength0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_2300
     * @tc.desc Verify bytesLength("", "utf8") returns 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = ArrayBuffer.bytesLength("", "utf8");
      expect(len).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferBytesLength0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_2400
     * @tc.desc Verify bytesLength with emoji returns correct count
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = ArrayBuffer.bytesLength("☃", "utf8");
      expect(len).assertEqual(3);
    });

    /**
     * @tc.name testArrayBufferBytesLength0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_2500
     * @tc.desc Verify bytesLength("A", "utf8") returns 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayBuffer.bytesLength("A", "utf8")).assertEqual(1);
    });

    /**
     * @tc.name testArrayBufferBytesLength0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_2600
     * @tc.desc Verify bytesLength does not modify source string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: string = "test";
      ArrayBuffer.bytesLength(s, "utf8");
      expect(s).assertEqual("test");
    });

    /**
     * @tc.name testArrayBufferBytesLength0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_2700
     * @tc.desc Verify bytesLength of a 2-codepoint CJK string under utf8 returns 6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = ArrayBuffer.bytesLength("你好", "utf8");
      expect(len).assertEqual(6);
    });

    /**
     * @tc.name testArrayBufferBytesLength0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_2800
     * @tc.desc Verify bytesLength with invalid encoding throws error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.bytesLength("ABC", "gbk");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
      }
    });

    /**
     * @tc.name testArrayBufferBytesLength0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_2900
     * @tc.desc Verify bytesLength for start of 4-byte UTF-8 range (U+10000)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = ArrayBuffer.bytesLength('𐀀', 'utf8');
      expect(len).assertEqual(4);
    });

    /**
     * @tc.name testArrayBufferBytesLength0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_3000
     * @tc.desc Verify bytesLength for upper bound of 4-byte UTF-8 range (U+10FFFF)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len: int = ArrayBuffer.bytesLength('􏿿', 'utf8');
      expect(len).assertEqual(4);
    });
  });
}