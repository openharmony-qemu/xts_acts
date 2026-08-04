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
     * @tc.desc Verify bytesLength('ABC','utf8') returns 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len = ArrayBuffer.bytesLength('ABC', 'utf8');
      expect(len).assertEqual(3);
    });

    /**
     * @tc.name testArrayBufferBytesLength0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0200
     * @tc.desc Verify bytesLength('你好','utf8') returns 6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len = ArrayBuffer.bytesLength('你好', 'utf8');
      expect(len).assertEqual(6);
    });

    /**
     * @tc.name testArrayBufferBytesLength0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0300
     * @tc.desc Verify bytesLength('','utf8') returns 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len = ArrayBuffer.bytesLength('', 'utf8');
      expect(len).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferBytesLength0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0400
     * @tc.desc Verify bytesLength with utf-8 alias returns same length as utf8
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len = ArrayBuffer.bytesLength('ABC', 'utf-8');
      expect(len).assertEqual(3);
    });

    /**
     * @tc.name testArrayBufferBytesLength0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0500
     * @tc.desc Verify bytesLength for 10000-char ASCII string returns 10000
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len = ArrayBuffer.bytesLength(Utils.buildLongString('A', 10000), 'utf8');
      expect(len).assertEqual(10000);
    });

    /**
     * @tc.name testArrayBufferBytesLength0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0600
     * @tc.desc Verify bytesLength for 1000 repeated CJK chars returns 3000
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const len = ArrayBuffer.bytesLength(Utils.buildLongString('你', 1000), 'utf8');
      expect(len).assertEqual(3000);
    });

    /**
     * @tc.name testArrayBufferBytesLength0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_BYTES_LENGTH_0700
     * @tc.desc Verify bytesLength('ABC','invalid-encoding') throws IllegalArgumentError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferBytesLength0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.bytesLength('ABC', 'invalid-encoding');
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IllegalArgumentError');
      }
    });
  });
}
