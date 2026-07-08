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
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../Util.test';

export default function arrayBufferFromFiveTest(): void {
  describe('ArrayBufferFromFiveTest', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.name testArrayBufferFromFive0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_0100
     * @tc.desc Verify from('ABC','utf8') yields byteLength 3 and ASCII bytes 65 and 67
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = ArrayBuffer.from('ABC', 'utf8');
      expect(buf.byteLength).assertEqual(3);
      expect(buf.at(0)).assertEqual(Int.toByte(65));
      expect(buf.at(2)).assertEqual(Int.toByte(67));
    });

    /**
     * @tc.name testArrayBufferFromFive0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_0200
     * @tc.desc Verify from with utf-8, ascii, utf16le, ucs2, base64, hex, latin1, binary yields expected byteLength
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(ArrayBuffer.from('ABC', 'utf-8').byteLength).assertEqual(3);
      expect(ArrayBuffer.from('ABC', 'ascii').byteLength).assertEqual(3);
      expect(ArrayBuffer.from('ABC', 'utf16le').byteLength).assertEqual(6);
      expect(ArrayBuffer.from('ABC', 'ucs2').byteLength).assertEqual(6);
      expect(ArrayBuffer.from('QUJD', 'base64').byteLength).assertEqual(3);
      expect(ArrayBuffer.from('414243', 'hex').byteLength).assertEqual(3);
      expect(ArrayBuffer.from('ABC', 'latin1').byteLength).assertEqual(3);
      expect(ArrayBuffer.from('ABC', 'binary').byteLength).assertEqual(3);
    });

    /**
     * @tc.name testArrayBufferFromFive0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_0300
     * @tc.desc Verify from empty string yields byteLength 0; CJK and emoji yield 6, 4, and 6 bytes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty = ArrayBuffer.from('', 'utf8');
      expect(empty.byteLength).assertEqual(0);
      expect(empty instanceof ArrayBuffer).assertTrue();
      expect(ArrayBuffer.from('你好', 'utf8').byteLength).assertEqual(6);
      expect(ArrayBuffer.from('😀', 'utf8').byteLength).assertEqual(4);
      expect(ArrayBuffer.from('A😀B', 'utf8').byteLength).assertEqual(6);
    });

    /**
     * @tc.name testArrayBufferFromFive0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_0400
     * @tc.desc Verify from 10000-char string yields byteLength 10000 and two from('ABC') results are distinct
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const longBuf = ArrayBuffer.from(Utils.buildLongString('A', 10000), 'utf8');
      expect(longBuf.byteLength).assertEqual(10000);
      const buf1 = ArrayBuffer.from('ABC', 'utf8');
      const buf2 = ArrayBuffer.from('ABC', 'utf8');
      expect(buf1 !== buf2).assertTrue();
      expect(buf1.byteLength).assertEqual(buf2.byteLength);
    });

    /**
     * @tc.name testArrayBufferFromFive0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_0500
     * @tc.desc Verify from with unsupported encoding throws IllegalArgumentError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.from('ABC', 'invalid_encoding');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
      }
    });
  });
}
