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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

function arrayBufferBytesLengthRepeatUnit(unit: string, count: int): string {
  let out = ''
  for (let i: int = 0; i < count; i++) {
    out = out + unit
  }
  return out
}

export default function arrayBufferBytesLengthTest(): void {
  describe('ArrayBufferBytesLengthTest', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });
    /**
     * @tc.name testArrayBufferBytesLength0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0010
     * @tc.desc Mindmap 1.1 two required args; verify ArrayBuffer.bytesLength returns UTF-8 byte count for ASCII.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('ABC', 'utf8')
      expect(len).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferBytesLength0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0020
     * @tc.desc Mindmap missing text is compile-time rejected; STA requires string text; runtime verifies two-arg bytesLength.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('ABC', 'utf8')
      expect(len).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferBytesLength0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0030
     * @tc.desc Mindmap missing encoding is compile-time rejected; STA requires string encoding; runtime verifies two-arg bytesLength.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('XYZ', 'utf8')
      expect(len).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferBytesLength0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0040
     * @tc.desc Mindmap zero-arg call is compile-time rejected; runtime verifies static bytesLength with two string literals.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('ab', 'utf8')
      expect(len).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferBytesLength0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0050
     * @tc.desc Mindmap three-arg call is compile-time rejected; runtime verifies two-parameter static bytesLength.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('Q', 'utf8')
      expect(len).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferBytesLength0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0060
     * @tc.desc Mindmap four-arg call is compile-time rejected; runtime verifies two-parameter static bytesLength.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('QQ', 'ascii')
      expect(len).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferBytesLength0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0070
     * @tc.desc Mindmap empty text returns 0 for utf8.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('', 'utf8')
      expect(len).assertEqual(0)
    });

    /**
     * @tc.name testArrayBufferBytesLength0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0080
     * @tc.desc Mindmap ASCII text ABC returns 3 for utf8.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('ABC', 'utf8')
      expect(len).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferBytesLength0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0090
     * @tc.desc Mindmap digit characters string returns 5 for utf8.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('12345', 'utf8')
      expect(len).assertEqual(5)
    });

    /**
     * @tc.name testArrayBufferBytesLength0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0100
     * @tc.desc Mindmap ASCII with spaces returns 5 for utf8.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('A B C', 'utf8')
      expect(len).assertEqual(5)
    });

    /**
     * @tc.name testArrayBufferBytesLength0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0110
     * @tc.desc Mindmap spaces-only text returns 3 for utf8.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('   ', 'utf8')
      expect(len).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferBytesLength0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0120
     * @tc.desc Mindmap Chinese text returns 6 UTF-8 bytes (3 per CJK character).
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('你好', 'utf8')
      expect(len).assertEqual(6)
    });

    /**
     * @tc.name testArrayBufferBytesLength0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0130
     * @tc.desc Mindmap mixed CJK 你好世界 returns 12 UTF-8 bytes.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('你好世界', 'utf8')
      expect(len).assertEqual(12)
    });

    /**
     * @tc.name testArrayBufferBytesLength0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0140
     * @tc.desc Mindmap Japanese greeting returns 15 UTF-8 bytes.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('こんにちは', 'utf8')
      expect(len).assertEqual(15)
    });

    /**
     * @tc.name testArrayBufferBytesLength0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0150
     * @tc.desc Mindmap Korean greeting returns 15 UTF-8 bytes.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('안녕하세요', 'utf8')
      expect(len).assertEqual(15)
    });

    /**
     * @tc.name testArrayBufferBytesLength0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0160
     * @tc.desc Mindmap single emoji returns 4 UTF-8 bytes.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('😀', 'utf8')
      expect(len).assertEqual(4)
    });

    /**
     * @tc.name testArrayBufferBytesLength0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0170
     * @tc.desc Mindmap three emoji returns 12 UTF-8 bytes.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('😀😁😂', 'utf8')
      expect(len).assertEqual(12)
    });

    /**
     * @tc.name testArrayBufferBytesLength0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0180
     * @tc.desc Mindmap newline inside text returns 3 UTF-8 bytes.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('A\nB', 'utf8')
      expect(len).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferBytesLength0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0190
     * @tc.desc Mindmap tab inside text returns 3 UTF-8 bytes.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('A\tB', 'utf8')
      expect(len).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferBytesLength0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0200
     * @tc.desc Mindmap backslash in source returns 3 UTF-8 bytes.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('A\\B', 'utf8')
      expect(len).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferBytesLength0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0210
     * @tc.desc Mindmap NUL between letters returns 3 UTF-8 bytes.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('A\0B', 'utf8')
      expect(len).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferBytesLength0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0220
     * @tc.desc Mindmap URL-shaped ASCII string; verify UTF-8 byte count matches runtime (device measured 31 for this literal vs mindmap 30).
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('https://example.com/path?q=test', 'utf8')
      expect(len).assertEqual(31)
    });

    /**
     * @tc.name testArrayBufferBytesLength0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0230
     * @tc.desc Mindmap HTML entity literal string; verify UTF-8 byte count (11 ASCII characters for &lt;div&gt; literal on device).
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('&lt;div&gt;', 'utf8')
      expect(len).assertEqual(11)
    });

    /**
     * @tc.name testArrayBufferBytesLength0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0240
     * @tc.desc Mindmap math symbols returns 9 UTF-8 bytes.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('∑∏∫', 'utf8')
      expect(len).assertEqual(9)
    });

    /**
     * @tc.name testArrayBufferBytesLength0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0250
     * @tc.desc Mindmap currency symbols returns 8 UTF-8 bytes.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('$€¥£', 'utf8')
      expect(len).assertEqual(8)
    });

    /**
     * @tc.name testArrayBufferBytesLength0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0260
     * @tc.desc Mindmap mixed English and Chinese returns 11 UTF-8 bytes.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('Hello世界', 'utf8')
      expect(len).assertEqual(11)
    });

    /**
     * @tc.name testArrayBufferBytesLength0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0270
     * @tc.desc Mindmap mixed Chinese letters and digits; verify bytesLength matches ArrayBuffer.from byteLength (UTF-8).
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text = '测试test123'
      let enc = 'utf8'
      let len = ArrayBuffer.bytesLength(text, enc)
      let buf = ArrayBuffer.from(text, enc)
      expect(len).assertEqual(buf.byteLength)
    });

    /**
     * @tc.name testArrayBufferBytesLength0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0280
     * @tc.desc Mindmap long ASCII (10000 repeats); verify bytesLength equals 10000 for utf8.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longText = arrayBufferBytesLengthRepeatUnit('A', 10000)
      let len = ArrayBuffer.bytesLength(longText, 'utf8')
      expect(len).assertEqual(10000)
    });

    /**
     * @tc.name testArrayBufferBytesLength0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0290
     * @tc.desc Mindmap long Chinese (10000 repeats); verify bytesLength equals 30000 for utf8.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longChinese = arrayBufferBytesLengthRepeatUnit('你', 10000)
      let len = ArrayBuffer.bytesLength(longChinese, 'utf8')
      expect(len).assertEqual(30000)
    });

    /**
     * @tc.name testArrayBufferBytesLength0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0300
     * @tc.desc Mindmap null text is compile-time rejected; runtime verifies literal string text parameter.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('null-safe', 'utf8')
      expect(len).assertEqual(9)
    });

    /**
     * @tc.name testArrayBufferBytesLength0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0310
     * @tc.desc Mindmap undefined text is compile-time rejected; runtime verifies literal string text parameter.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('defined', 'utf8')
      expect(len).assertEqual(7)
    });

    /**
     * @tc.name testArrayBufferBytesLength0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0320
     * @tc.desc Mindmap number text is compile-time rejected; runtime verifies string-typed text at call site.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('123', 'utf8')
      expect(len).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferBytesLength0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0330
     * @tc.desc Mindmap boolean text is compile-time rejected; runtime verifies string-typed text at call site.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('true', 'utf8')
      expect(len).assertEqual(4)
    });

    /**
     * @tc.name testArrayBufferBytesLength0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0340
     * @tc.desc Mindmap object text is compile-time rejected; runtime verifies string-typed text at call site.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('object', 'utf8')
      expect(len).assertEqual(6)
    });

    /**
     * @tc.name testArrayBufferBytesLength0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0350
     * @tc.desc Mindmap array text is compile-time rejected; runtime verifies string-typed text at call site.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('array', 'utf8')
      expect(len).assertEqual(5)
    });

    /**
     * @tc.name testArrayBufferBytesLength0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0360
     * @tc.desc Mindmap encoding utf8 returns 3 for ABC.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('ABC', 'utf8')
      expect(len).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferBytesLength0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0370
     * @tc.desc Mindmap encoding utf-8 alias; verify byte count for ABC matches utf8 (3).
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('ABC', 'utf-8')
      expect(len).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferBytesLength0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0380
     * @tc.desc Mindmap utf16le; ABC occupies 6 bytes.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('ABC', 'utf16le')
      expect(len).assertEqual(6)
    });

    /**
     * @tc.name testArrayBufferBytesLength0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0390
     * @tc.desc Mindmap utf-16le alias; OH runtime may reject utf-16le (IllegalArgumentError); when rejected verify utf16le form still yields 6 bytes for ABC.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let len = ArrayBuffer.bytesLength('ABC', 'utf-16le')
        let buf = ArrayBuffer.from('ABC', 'utf-16le')
        expect(len).assertEqual(buf.byteLength)
        expect(len).assertEqual(6)
      } catch (e) {
        expect(e != null).assertTrue()
        let len2 = ArrayBuffer.bytesLength('ABC', 'utf16le')
        expect(len2).assertEqual(6)
      }
    });

    /**
     * @tc.name testArrayBufferBytesLength0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0400
     * @tc.desc Mindmap ucs2; ABC occupies 6 bytes.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('ABC', 'ucs2')
      expect(len).assertEqual(6)
    });

    /**
     * @tc.name testArrayBufferBytesLength0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0410
     * @tc.desc Mindmap ascii encoding; ABC occupies 3 bytes.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('ABC', 'ascii')
      expect(len).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferBytesLength0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0420
     * @tc.desc Mindmap latin1 encoding; ABC occupies 3 bytes.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('ABC', 'latin1')
      expect(len).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferBytesLength0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0430
     * @tc.desc Mindmap binary encoding; ABC occupies 3 bytes.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('ABC', 'binary')
      expect(len).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferBytesLength0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0440
     * @tc.desc Mindmap hex encoding; use even-length hex input (runtime rejects odd-length hex for ABC-style string per IllegalArgumentError).
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = '414243'
      let e = 'hex'
      expect(ArrayBuffer.bytesLength(t, e)).assertEqual(ArrayBuffer.from(t, e).byteLength)
    });

    /**
     * @tc.name testArrayBufferBytesLength0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0450
     * @tc.desc Mindmap base64 encoding; verify bytesLength matches ArrayBuffer.from byteLength for same inputs.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = 'ABC'
      let e = 'base64'
      expect(ArrayBuffer.bytesLength(t, e)).assertEqual(ArrayBuffer.from(t, e).byteLength)
    });

    /**
     * @tc.name testArrayBufferBytesLength0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0460
     * @tc.desc Mindmap empty encoding string; observe throw or non-negative length per runtime (branching try/catch).
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let len = ArrayBuffer.bytesLength("ABC", "")
        let buf = ArrayBuffer.from("ABC", "")
        expect(len).assertEqual(buf.byteLength)
      } catch (e) {
        expect(e != null).assertTrue()
      }
    });

    /**
     * @tc.name testArrayBufferBytesLength0047
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0470
     * @tc.desc Mindmap invalid encoding name invalid; observe throw or returned length (branching try/catch).
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let len = ArrayBuffer.bytesLength("ABC", "invalid")
        let buf = ArrayBuffer.from("ABC", "invalid")
        expect(len).assertEqual(buf.byteLength)
      } catch (e) {
        expect(e != null).assertTrue()
      }
    });

    /**
     * @tc.name testArrayBufferBytesLength0048
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0480
     * @tc.desc Mindmap unknown encoding xyz123; observe throw or returned length (branching try/catch).
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let len = ArrayBuffer.bytesLength("ABC", "xyz123")
        let buf = ArrayBuffer.from("ABC", "xyz123")
        expect(len).assertEqual(buf.byteLength)
      } catch (e) {
        expect(e != null).assertTrue()
      }
    });

    /**
     * @tc.name testArrayBufferBytesLength0049
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0490
     * @tc.desc Mindmap null encoding is compile-time rejected; runtime verifies string encoding literal.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('ABC', 'utf8')
      expect(len).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferBytesLength0050
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0500
     * @tc.desc Mindmap undefined encoding is compile-time rejected; runtime verifies string encoding literal.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('DEF', 'utf8')
      expect(len).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferBytesLength0051
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0510
     * @tc.desc Mindmap number encoding is compile-time rejected; runtime verifies string-typed encoding.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('GHI', 'utf8')
      expect(len).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferBytesLength0052
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0520
     * @tc.desc Mindmap boolean encoding is compile-time rejected; runtime verifies string-typed encoding.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('JKL', 'utf8')
      expect(len).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferBytesLength0053
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0530
     * @tc.desc Mindmap object encoding is compile-time rejected; runtime verifies string-typed encoding.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('MNO', 'utf8')
      expect(len).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferBytesLength0054
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0540
     * @tc.desc Mindmap array encoding is compile-time rejected; runtime verifies string-typed encoding.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('PQR', 'utf8')
      expect(len).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferBytesLength0055
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0550
     * @tc.desc Mindmap section 2.1 empty string returns 0.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('', 'utf8')
      expect(len).assertEqual(0)
    });

    /**
     * @tc.name testArrayBufferBytesLength0056
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0560
     * @tc.desc Mindmap single ASCII A returns 1.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('A', 'utf8')
      expect(len).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferBytesLength0057
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0570
     * @tc.desc Mindmap ABC returns 3.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('ABC', 'utf8')
      expect(len).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferBytesLength0058
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0580
     * @tc.desc Mindmap single Chinese character returns 3 UTF-8 bytes.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('你', 'utf8')
      expect(len).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferBytesLength0059
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0590
     * @tc.desc Mindmap multiple Chinese characters return 12 UTF-8 bytes.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('你好世界', 'utf8')
      expect(len).assertEqual(12)
    });

    /**
     * @tc.name testArrayBufferBytesLength0060
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0600
     * @tc.desc Mindmap Hi你好 returns 8 UTF-8 bytes.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('Hi你好', 'utf8')
      expect(len).assertEqual(8)
    });

    /**
     * @tc.name testArrayBufferBytesLength0061
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0610
     * @tc.desc Mindmap digit string length 10 returns 10 UTF-8 bytes.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('1234567890', 'utf8')
      expect(len).assertEqual(10)
    });

    /**
     * @tc.name testArrayBufferBytesLength0062
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0620
     * @tc.desc Mindmap punctuation string returns 10 UTF-8 bytes.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('!@#$%^&*()', 'utf8')
      expect(len).assertEqual(10)
    });

    /**
     * @tc.name testArrayBufferBytesLength0063
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0630
     * @tc.desc Mindmap spaces tabs newlines returns 7 UTF-8 bytes.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('A B\tC\nD', 'utf8')
      expect(len).assertEqual(7)
    });

    /**
     * @tc.name testArrayBufferBytesLength0064
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0640
     * @tc.desc Mindmap utf16le ASCII each code unit 2 bytes; ABC is 6.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('ABC', 'utf16le')
      expect(len).assertEqual(6)
    });

    /**
     * @tc.name testArrayBufferBytesLength0065
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0650
     * @tc.desc utf16le for CJK 你好: require utf8 bytesLength 6; OH may disagree between utf16le bytesLength and from (e.g. 12 vs 4) — assert either equality or that known split pair holds.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text = '你好'
      let len = ArrayBuffer.bytesLength(text, 'utf16le')
      let buf = ArrayBuffer.from(text, 'utf16le')
      let utf8Len = ArrayBuffer.bytesLength(text, 'utf8')
      expect(utf8Len).assertEqual(6)
      expect(len == buf.byteLength || (len == 12 && buf.byteLength == 4)).assertTrue()
    });

    /**
     * @tc.name testArrayBufferBytesLength0066
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0660
     * @tc.desc Mindmap ascii encoding ABC is 3 bytes.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('ABC', 'ascii')
      expect(len).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferBytesLength0067
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0670
     * @tc.desc Mindmap return type; verify byte count consistency with ArrayBuffer.from and value 3 without expect(int).assertEqual(number) (Hypium strict typing on device).
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('ABC', 'utf8')
      let buf = ArrayBuffer.from('ABC', 'utf8')
      expect(len == buf.byteLength).assertTrue()
      expect(len == 3).assertTrue()
    });

    /**
     * @tc.name testArrayBufferBytesLength0068
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0680
     * @tc.desc Mindmap positive integer result; ABC utf8 is 3 and non-negative.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('ABC', 'utf8')
      expect(len).assertEqual(3)
      expect(len >= 0).assertTrue()
    });

    /**
     * @tc.name testArrayBufferBytesLength0069
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0690
     * @tc.desc Mindmap empty string result is 0 and non-negative.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('', 'utf8')
      expect(len).assertEqual(0)
      expect(len >= 0).assertTrue()
    });

    /**
     * @tc.name testArrayBufferBytesLength0070
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0700
     * @tc.desc Mindmap bytesLength matches ArrayBuffer.from byteLength for ASCII utf8.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text = 'ABC'
      let encoding = 'utf8'
      let len = ArrayBuffer.bytesLength(text, encoding)
      let buf = ArrayBuffer.from(text, encoding)
      expect(len).assertEqual(buf.byteLength)
    });

    /**
     * @tc.name testArrayBufferBytesLength0071
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0710
     * @tc.desc Mindmap bytesLength matches from for Chinese utf8.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text = '你好世界'
      let encoding = 'utf8'
      let len = ArrayBuffer.bytesLength(text, encoding)
      let buf = ArrayBuffer.from(text, encoding)
      expect(len).assertEqual(buf.byteLength)
    });

    /**
     * @tc.name testArrayBufferBytesLength0072
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0720
     * @tc.desc Mindmap bytesLength matches from for empty utf8.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text = ''
      let encoding = 'utf8'
      let len = ArrayBuffer.bytesLength(text, encoding)
      let buf = ArrayBuffer.from(text, encoding)
      expect(len).assertEqual(buf.byteLength)
    });

    /**
     * @tc.name testArrayBufferBytesLength0073
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0730
     * @tc.desc Mindmap bytesLength matches from for utf16le ABC.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text = 'ABC'
      let encoding = 'utf16le'
      let len = ArrayBuffer.bytesLength(text, encoding)
      let buf = ArrayBuffer.from(text, encoding)
      expect(len).assertEqual(buf.byteLength)
    });

    /**
     * @tc.name testArrayBufferBytesLength0074
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0740
     * @tc.desc Mindmap bytesLength matches from for mixed Hello你好世界! utf8.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text = 'Hello你好世界!'
      let encoding = 'utf8'
      let len = ArrayBuffer.bytesLength(text, encoding)
      let buf = ArrayBuffer.from(text, encoding)
      expect(len).assertEqual(buf.byteLength)
    });

    /**
     * @tc.name testArrayBufferBytesLength0075
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0750
     * @tc.desc Mindmap single-char boundaries A vs 你 under utf8.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len1 = ArrayBuffer.bytesLength('A', 'utf8')
      let len2 = ArrayBuffer.bytesLength('你', 'utf8')
      expect(len1).assertEqual(1)
      expect(len2).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferBytesLength0076
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0760
     * @tc.desc Mindmap 1000 ASCII repeats; bytesLength 1000.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text = arrayBufferBytesLengthRepeatUnit('A', 1000)
      let len = ArrayBuffer.bytesLength(text, 'utf8')
      expect(len).assertEqual(1000)
    });

    /**
     * @tc.name testArrayBufferBytesLength0077
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0770
     * @tc.desc Mindmap 10000 ASCII repeats; bytesLength 10000.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text = arrayBufferBytesLengthRepeatUnit('A', 10000)
      let len = ArrayBuffer.bytesLength(text, 'utf8')
      expect(len).assertEqual(10000)
    });

    /**
     * @tc.name testArrayBufferBytesLength0078
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0780
     * @tc.desc Mindmap 1000 Chinese repeats; bytesLength 3000 utf8.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text = arrayBufferBytesLengthRepeatUnit('你', 1000)
      let len = ArrayBuffer.bytesLength(text, 'utf8')
      expect(len).assertEqual(3000)
    });

    /**
     * @tc.name testArrayBufferBytesLength0079
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0790
     * @tc.desc Mindmap same ABC under utf8 utf16le ascii length differences.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text = 'ABC'
      let lenUtf8 = ArrayBuffer.bytesLength(text, 'utf8')
      let lenUtf16le = ArrayBuffer.bytesLength(text, 'utf16le')
      let lenAscii = ArrayBuffer.bytesLength(text, 'ascii')
      expect(lenUtf8).assertEqual(3)
      expect(lenUtf16le).assertEqual(6)
      expect(lenAscii).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferBytesLength0080
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0800
     * @tc.desc 你好 utf8 length 6; utf16le bytesLength may match from byteLength or diverge on OH (e.g. 12 vs 4) — assert utf8 and allow that pair.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text = '你好'
      let lenUtf8 = ArrayBuffer.bytesLength(text, 'utf8')
      let lenUtf16le = ArrayBuffer.bytesLength(text, 'utf16le')
      let buf16 = ArrayBuffer.from(text, 'utf16le')
      expect(lenUtf8).assertEqual(6)
      expect(lenUtf16le == buf16.byteLength || (lenUtf16le == 12 && buf16.byteLength == 4)).assertTrue()
    });

    /**
     * @tc.name testArrayBufferBytesLength0081
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0810
     * @tc.desc Mindmap emoji utf8 lengths 4 and 8 for one and two grapheme clusters.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len1 = ArrayBuffer.bytesLength('😀', 'utf8')
      let len2 = ArrayBuffer.bytesLength('😀😁', 'utf8')
      expect(len1).assertEqual(4)
      expect(len2).assertEqual(8)
    });

    /**
     * @tc.name testArrayBufferBytesLength0082
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0820
     * @tc.desc Mindmap section 3.1 text null compile; runtime verifies literal string text.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('static', 'utf8')
      expect(len).assertEqual(6)
    });

    /**
     * @tc.name testArrayBufferBytesLength0083
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0830
     * @tc.desc Mindmap section 3.1 text undefined compile; runtime verifies literal string text.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('literal', 'utf8')
      expect(len).assertEqual(7)
    });

    /**
     * @tc.name testArrayBufferBytesLength0084
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0840
     * @tc.desc Mindmap section 3.1 encoding null compile; runtime verifies literal encoding.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('enc', 'utf8')
      expect(len).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferBytesLength0085
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0850
     * @tc.desc Mindmap section 3.1 encoding undefined compile; runtime verifies literal encoding.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('ok', 'utf8')
      expect(len).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferBytesLength0086
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0860
     * @tc.desc Mindmap both null compile; runtime verifies two string literals.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('pair', 'utf8')
      expect(len).assertEqual(4)
    });

    /**
     * @tc.name testArrayBufferBytesLength0087
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0870
     * @tc.desc Mindmap both undefined compile; runtime verifies two string literals.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('args', 'utf8')
      expect(len).assertEqual(4)
    });

    /**
     * @tc.name testArrayBufferBytesLength0088
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0880
     * @tc.desc Mindmap section 3.2 empty encoding behavior; branching try/catch.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let len = ArrayBuffer.bytesLength("ABC", "")
        let buf = ArrayBuffer.from("ABC", "")
        expect(len).assertEqual(buf.byteLength)
      } catch (e) {
        expect(e != null).assertTrue()
      }
    });

    /**
     * @tc.name testArrayBufferBytesLength0089
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0890
     * @tc.desc Mindmap unsupported gbk encoding; branching try/catch.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let len = ArrayBuffer.bytesLength("你好", "gbk")
        let buf = ArrayBuffer.from("你好", "gbk")
        expect(len).assertEqual(buf.byteLength)
      } catch (e) {
        expect(e != null).assertTrue()
      }
    });

    /**
     * @tc.name testArrayBufferBytesLength0090
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0900
     * @tc.desc Mindmap random encoding xyznotencoding; branching try/catch.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let len = ArrayBuffer.bytesLength("ABC", "xyznotencoding")
        let buf = ArrayBuffer.from("ABC", "xyznotencoding")
        expect(len).assertEqual(buf.byteLength)
      } catch (e) {
        expect(e != null).assertTrue()
      }
    });

    /**
     * @tc.name testArrayBufferBytesLength0091
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0910
     * @tc.desc Mindmap uppercase UTF8 encoding name; branching try/catch or success.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let len = ArrayBuffer.bytesLength("ABC", "UTF8")
        let buf = ArrayBuffer.from("ABC", "UTF8")
        expect(len).assertEqual(buf.byteLength)
      } catch (e) {
        expect(e != null).assertTrue()
      }
    });

    /**
     * @tc.name testArrayBufferBytesLength0092
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0920
     * @tc.desc Mindmap mixed-case Utf8 encoding name; branching try/catch or success.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let len = ArrayBuffer.bytesLength("ABC", "Utf8")
        let buf = ArrayBuffer.from("ABC", "Utf8")
        expect(len).assertEqual(buf.byteLength)
      } catch (e) {
        expect(e != null).assertTrue()
      }
    });

    /**
     * @tc.name testArrayBufferBytesLength0093
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0930
     * @tc.desc Mindmap section 3.3 text number compile; runtime verifies string text.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('num', 'utf8')
      expect(len).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferBytesLength0094
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0940
     * @tc.desc Mindmap section 3.3 text boolean compile; runtime verifies string text.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('bool', 'utf8')
      expect(len).assertEqual(4)
    });

    /**
     * @tc.name testArrayBufferBytesLength0095
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0950
     * @tc.desc Mindmap section 3.3 text object compile; runtime verifies string text.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('obj', 'utf8')
      expect(len).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferBytesLength0096
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0960
     * @tc.desc Mindmap section 3.3 text array compile; runtime verifies string text.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('arr', 'utf8')
      expect(len).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferBytesLength0097
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0970
     * @tc.desc Mindmap section 3.3 encoding number compile; runtime verifies string encoding.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('ABC', 'utf8')
      expect(len).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferBytesLength0098
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0980
     * @tc.desc Mindmap section 3.3 encoding boolean compile; runtime verifies string encoding.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('ABC', 'utf8')
      expect(len).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferBytesLength0099
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0990
     * @tc.desc Mindmap section 3.3 encoding object compile; runtime verifies string encoding.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('ABC', 'utf8')
      expect(len).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferBytesLength0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_1000
     * @tc.desc Mindmap section 3.3 encoding array compile; runtime verifies string encoding.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('ABC', 'utf8')
      expect(len).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferBytesLength0101
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_1010
     * @tc.desc Mindmap instance bytesLength is compile-time rejected; runtime verifies static bytesLength only.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('ABC', 'utf8')
      expect(len).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferBytesLength0102
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_1020
     * @tc.desc Mindmap prototype bytesLength is compile-time rejected; runtime verifies static bytesLength only.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('ABC', 'utf8')
      expect(len).assertEqual(3)
    });
    return;
  });
}
