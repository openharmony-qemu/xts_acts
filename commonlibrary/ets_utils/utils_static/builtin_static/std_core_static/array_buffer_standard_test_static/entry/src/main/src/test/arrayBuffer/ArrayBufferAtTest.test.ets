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

export default function arrayBufferAtTest(): void {
  describe('ArrayBufferAtTest', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.name testArrayBufferAt0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_0100
     * @tc.desc Verify buffer.at(1) returns written byte at normal index
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.set(0, Int.toByte(10));
      buffer.set(1, Int.toByte(20));
      buffer.set(2, Int.toByte(30));
      buffer.set(3, Int.toByte(40));
      expect(buffer.at(1)).assertEqual(Int.toByte(20));
    });

    /**
     * @tc.name testArrayBufferAt0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_0200
     * @tc.desc Verify buffer.at(0) returns byte at first index boundary
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.set(0, Int.toByte(65));
      expect(buffer.at(0)).assertEqual(Int.toByte(65));
    });

    /**
     * @tc.name testArrayBufferAt0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_0300
     * @tc.desc Verify buffer.at(byteLength-1) returns byte at last index boundary
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.set(3, Int.toByte(99));
      expect(buffer.at(3)).assertEqual(Int.toByte(99));
    });

    /**
     * @tc.name testArrayBufferAt0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_0400
     * @tc.desc Verify buffer.at reads byte min (-128) and max (127) values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(2);
      buffer.set(0, Int.toByte(-128));
      buffer.set(1, Int.toByte(127));
      expect(buffer.at(0)).assertEqual(Int.toByte(-128));
      expect(buffer.at(1)).assertEqual(Int.toByte(127));
    });

    /**
     * @tc.name testArrayBufferAt0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_0500
     * @tc.desc Verify buffer.at(-1) throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      try {
        buffer.at(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.name testArrayBufferAt0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_0600
     * @tc.desc Verify buffer.at(byteLength) throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      try {
        buffer.at(4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.name testArrayBufferAt0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_0700
     * @tc.desc Verify buffer.at(0) on zero-length buffer throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(0);
      try {
        buffer.at(0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });
  });
}
