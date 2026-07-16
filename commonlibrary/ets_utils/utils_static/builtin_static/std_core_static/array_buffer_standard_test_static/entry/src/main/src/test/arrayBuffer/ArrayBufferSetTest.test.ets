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

export default function arrayBufferSetTest(): void {
  describe('ArrayBufferSetTest', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.name testArrayBufferSet0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_0100
     * @tc.desc Verify buffer.set(1, val) writes byte at normal index
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.set(1, Int.toByte(20));
      expect(buffer.at(1)).assertEqual(Int.toByte(20));
    });

    /**
     * @tc.name testArrayBufferSet0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_0200
     * @tc.desc Verify buffer.set(0, val) writes byte at first index boundary
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.set(0, Int.toByte(65));
      expect(buffer.at(0)).assertEqual(Int.toByte(65));
    });

    /**
     * @tc.name testArrayBufferSet0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_0300
     * @tc.desc Verify buffer.set(byteLength-1, val) writes byte at last index boundary
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.set(3, Int.toByte(99));
      expect(buffer.at(3)).assertEqual(Int.toByte(99));
    });

    /**
     * @tc.name testArrayBufferSet0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_0400
     * @tc.desc Verify buffer.set writes byte min (-128) and max (127) values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(2);
      buffer.set(0, Int.toByte(-128));
      buffer.set(1, Int.toByte(127));
      expect(buffer.at(0)).assertEqual(Int.toByte(-128));
      expect(buffer.at(1)).assertEqual(Int.toByte(127));
    });

    /**
     * @tc.name testArrayBufferSet0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_0500
     * @tc.desc Verify buffer.set(-1, val) throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      try {
        buffer.set(-1, Int.toByte(10));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.name testArrayBufferSet0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_0600
     * @tc.desc Verify buffer.set(byteLength, val) throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      try {
        buffer.set(4, Int.toByte(10));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.name testArrayBufferSet0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_0700
     * @tc.desc Verify buffer.set(0, val) on zero-length buffer throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(0);
      try {
        buffer.set(0, Int.toByte(10));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });
  });
}
