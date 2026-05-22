'use static'
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
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function arrayBufferBytesLengthTest(): void {
  describe('ArrayBufferBytesLengthTest', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.name testArrayBufferBytesLength0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0100
     * @tc.desc Verify len equals 3
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0200
     * @tc.desc Verify len equals 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('', 'utf8')
      expect(len).assertEqual(0)
    });

    /**
     * @tc.name testArrayBufferBytesLength0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0300
     * @tc.desc Verify len equals 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('12345', 'utf8')
      expect(len).assertEqual(5)
    });

    /**
     * @tc.name testArrayBufferBytesLength0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0400
     * @tc.desc Verify len equals 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('A B C', 'utf8')
      expect(len).assertEqual(5)
    });

    /**
     * @tc.name testArrayBufferBytesLength0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0500
     * @tc.desc Verify len equals 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('   ', 'utf8')
      expect(len).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferBytesLength0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0600
     * @tc.desc Verify len equals 6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('你好', 'utf8')
      expect(len).assertEqual(6)
    });

    /**
     * @tc.name testArrayBufferBytesLength0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0700
     * @tc.desc Verify len equals 12
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('你好世界', 'utf8')
      expect(len).assertEqual(12)
    });

    /**
     * @tc.name testArrayBufferBytesLength0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0800
     * @tc.desc Verify len equals 15
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('こんにちは', 'utf8')
      expect(len).assertEqual(15)
    });

    /**
     * @tc.name testArrayBufferBytesLength0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0900
     * @tc.desc Verify len equals 15
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('안녕하세요', 'utf8')
      expect(len).assertEqual(15)
    });

    /**
     * @tc.name testArrayBufferBytesLength0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_1000
     * @tc.desc Verify len equals 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('😀', 'utf8')
      expect(len).assertEqual(4)
    });

    /**
     * @tc.name testArrayBufferBytesLength0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_1100
     * @tc.desc Verify len equals 12
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('😀😁😂', 'utf8')
      expect(len).assertEqual(12)
    });

    /**
     * @tc.name testArrayBufferBytesLength0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_1200
     * @tc.desc Verify len equals 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('A\nB', 'utf8')
      expect(len).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferBytesLength0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_1300
     * @tc.desc Verify len equals 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('A\tB', 'utf8')
      expect(len).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferBytesLength0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_1400
     * @tc.desc Verify len equals 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('A\\B', 'utf8')
      expect(len).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferBytesLength0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_1500
     * @tc.desc Verify len equals 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('A\0B', 'utf8')
      expect(len).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferBytesLength0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_1600
     * @tc.desc Verify len equals 31
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('https://example.com/path?q=test', 'utf8')
      expect(len).assertEqual(31)
    });

    /**
     * @tc.name testArrayBufferBytesLength0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_1700
     * @tc.desc Verify len equals 11
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('&lt;div&gt;', 'utf8')
      expect(len).assertEqual(11)
    });

    /**
     * @tc.name testArrayBufferBytesLength0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_1800
     * @tc.desc Verify len equals 9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('∑∏∫', 'utf8')
      expect(len).assertEqual(9)
    });

    /**
     * @tc.name testArrayBufferBytesLength0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_1900
     * @tc.desc Verify len equals 8
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('$€¥£', 'utf8')
      expect(len).assertEqual(8)
    });

    /**
     * @tc.name testArrayBufferBytesLength0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_2000
     * @tc.desc Verify len equals 11
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('Hello世界', 'utf8')
      expect(len).assertEqual(11)
    });

    /**
     * @tc.name testArrayBufferBytesLength0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_2100
     * @tc.desc Verify len equals 13
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('测试test123', 'utf8')
      expect(len).assertEqual(13)
    });

    /**
     * @tc.name testArrayBufferBytesLength0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_2200
     * @tc.desc Verify len equals 10000
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longText = Utils.buildLongString('A', 10000)
      let len = ArrayBuffer.bytesLength(longText, 'utf8')
      expect(len).assertEqual(10000)
    });

    /**
     * @tc.name testArrayBufferBytesLength0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_2300
     * @tc.desc Verify len equals 30000
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longChinese = Utils.buildLongString('你', 10000)
      let len = ArrayBuffer.bytesLength(longChinese, 'utf8')
      expect(len).assertEqual(30000)
    });

    /**
     * @tc.name testArrayBufferBytesLength0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_2400
     * @tc.desc Verify len equals 6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('ABC', 'utf16le')
      expect(len).assertEqual(6)
    });

    /**
     * @tc.name testArrayBufferBytesLength0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_2500
     * @tc.desc Verify bytesLength with utf-16le encoding throws IllegalArgumentError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.bytesLength('ABC', 'utf-16le')
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError')
      }
    });

    /**
     * @tc.name testArrayBufferBytesLength0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_2600
     * @tc.desc Verify len equals 6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('ABC', 'ucs2')
      expect(len).assertEqual(6)
    });

    /**
     * @tc.name testArrayBufferBytesLength0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_2700
     * @tc.desc Verify len equals 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('ABC', 'ascii')
      expect(len).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferBytesLength0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_2800
     * @tc.desc Verify len equals 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('ABC', 'latin1')
      expect(len).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferBytesLength0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_2900
     * @tc.desc Verify len equals 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('ABC', 'binary')
      expect(len).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferBytesLength0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_3000
     * @tc.desc Verify ArrayBuffer.bytesLength(t, e) equals ArrayBuffer.from(t, e).byteLength
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = '414243'
      let e = 'hex'
      expect(ArrayBuffer.bytesLength(t, e)).assertEqual(ArrayBuffer.from(t, e).byteLength)
    });

    /**
     * @tc.name testArrayBufferBytesLength0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_3100
     * @tc.desc Verify ArrayBuffer.bytesLength(t, e) equals ArrayBuffer.from(t, e).byteLength
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t = 'ABC'
      let e = 'base64'
      expect(ArrayBuffer.bytesLength(t, e)).assertEqual(ArrayBuffer.from(t, e).byteLength)
    });

    /**
     * @tc.name testArrayBufferBytesLength0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_3200
     * @tc.desc Verify bytesLength with utf-8 encoding returns len 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('ABC', 'utf-8')
      expect(len).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferBytesLength0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_3300
     * @tc.desc Verify API call throws IllegalArgumentError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.bytesLength('ABC', '')
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError')
      }
    });

    /**
     * @tc.name testArrayBufferBytesLength0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_3400
     * @tc.desc Verify API call throws IllegalArgumentError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.bytesLength('ABC', 'invalid')
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError')
      }
    });

    /**
     * @tc.name testArrayBufferBytesLength0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_3500
     * @tc.desc Verify API call throws IllegalArgumentError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.bytesLength('你好', 'gbk')
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError')
      }
    });

    /**
     * @tc.name testArrayBufferBytesLength0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_3600
     * @tc.desc Verify bytesLength with UTF8 encoding throws IllegalArgumentError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.bytesLength('ABC', 'UTF8')
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError')
      }
    });

    /**
     * @tc.name testArrayBufferBytesLength0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_3700
     * @tc.desc Verify bytesLength with Utf8 encoding throws IllegalArgumentError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.bytesLength('ABC', 'Utf8')
        expect().assertFail()
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError')
      }
    });

    /**
     * @tc.name testArrayBufferBytesLength0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_3800
     * @tc.desc Verify typeof len equals 'int'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('ABC', 'utf8')
      expect(typeof len).assertEqual('int')
    });

    /**
     * @tc.name testArrayBufferBytesLength0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_3900
     * @tc.desc Verify value is integer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('ABC', 'utf8')
      expect(Number.isInteger(len)).assertTrue()
    });

    /**
     * @tc.name testArrayBufferBytesLength0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_4000
     * @tc.desc Verify len equals buf.byteLength
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text = 'ABC'
      let encoding = 'utf8'
      let len = ArrayBuffer.bytesLength(text, encoding)
      let buf = ArrayBuffer.from(text, encoding)
      expect(len).assertEqual(buf.byteLength)
    });

    /**
     * @tc.name testArrayBufferBytesLength0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_4100
     * @tc.desc Verify len equals buf.byteLength
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text = '你好世界'
      let encoding = 'utf8'
      let len = ArrayBuffer.bytesLength(text, encoding)
      let buf = ArrayBuffer.from(text, encoding)
      expect(len).assertEqual(buf.byteLength)
    });

    /**
     * @tc.name testArrayBufferBytesLength0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_4200
     * @tc.desc Verify len equals buf.byteLength
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text = ''
      let encoding = 'utf8'
      let len = ArrayBuffer.bytesLength(text, encoding)
      let buf = ArrayBuffer.from(text, encoding)
      expect(len).assertEqual(buf.byteLength)
    });

    /**
     * @tc.name testArrayBufferBytesLength0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_4300
     * @tc.desc Verify len equals buf.byteLength
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text = 'ABC'
      let encoding = 'utf16le'
      let len = ArrayBuffer.bytesLength(text, encoding)
      let buf = ArrayBuffer.from(text, encoding)
      expect(len).assertEqual(buf.byteLength)
    });

    /**
     * @tc.name testArrayBufferBytesLength0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_4400
     * @tc.desc Verify len equals buf.byteLength
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text = 'Hello你好世界!'
      let encoding = 'utf8'
      let len = ArrayBuffer.bytesLength(text, encoding)
      let buf = ArrayBuffer.from(text, encoding)
      expect(len).assertEqual(buf.byteLength)
    });

    /**
     * @tc.name testArrayBufferBytesLength0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_4500
     * @tc.desc Verify len equals 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('A', 'utf8')
      expect(len).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferBytesLength0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_4600
     * @tc.desc Verify len equals 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('你', 'utf8')
      expect(len).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferBytesLength0047
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_4700
     * @tc.desc Verify len equals 1000
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text = Utils.buildLongString('A', 1000)
      let len = ArrayBuffer.bytesLength(text, 'utf8')
      expect(len).assertEqual(1000)
    });

    /**
     * @tc.name testArrayBufferBytesLength0048
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_4800
     * @tc.desc Verify len equals 3000
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text = Utils.buildLongString('你', 1000)
      let len = ArrayBuffer.bytesLength(text, 'utf8')
      expect(len).assertEqual(3000)
    });

    /**
     * @tc.name testArrayBufferBytesLength0049
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_4900
     * @tc.desc Verify len equals 8
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('😀😁', 'utf8')
      expect(len).assertEqual(8)
    });

    /**
     * @tc.name testArrayBufferBytesLength0051
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_5100
     * @tc.desc Verify len equals 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let len = ArrayBuffer.bytesLength('41', 'hex')
      expect(len).assertEqual(1)
    });
  });
}
