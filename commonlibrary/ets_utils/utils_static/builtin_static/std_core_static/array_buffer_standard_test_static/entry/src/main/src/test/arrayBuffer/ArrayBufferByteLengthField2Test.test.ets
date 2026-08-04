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

export default function arrayBufferByteLengthField2Test(): void {
  describe('ArrayBufferByteLengthField2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.name testArrayBufferByteLengthField0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_0100
     * @tc.desc Verify byteLength equals 6 for new ArrayBuffer(6)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(6);
      expect(buffer.byteLength).assertEqual(6);
    });

    /**
     * @tc.name testArrayBufferByteLengthField0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_0200
     * @tc.desc Verify byteLength equals 0 for ArrayBuffer.from("", "utf8")
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = ArrayBuffer.from("", "utf8");
      expect(buffer.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferByteLengthField0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_0300
     * @tc.desc Verify byteLength equals 6 for ArrayBuffer.from CJK characters with utf8
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = ArrayBuffer.from("中文", "utf8");
      expect(buffer.byteLength).assertEqual(6);
    });

    /**
     * @tc.name testArrayBufferByteLengthField0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_0400
     * @tc.desc Verify byteLength equals 4 for ArrayBuffer.from("\uD83D\uDE00", "utf8") emoji
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = ArrayBuffer.from("\uD83D\uDE00", "utf8");
      expect(buffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.name testArrayBufferByteLengthField0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_0500
     * @tc.desc Verify byteLength equals 1 for ArrayBuffer.from(src, 0, 1) slice from source
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = ArrayBuffer.from("abcd", "utf8");
      const buffer = ArrayBuffer.from(src, 0, 1);
      expect(buffer.byteLength).assertEqual(1);
    });

    /**
     * @tc.name testArrayBufferByteLengthField0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_0600
     * @tc.desc Verify byteLength equals 4 for ArrayBuffer.from(new ArrayBuffer(4), 0, 4)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = ArrayBuffer.from(new ArrayBuffer(4), 0, 4);
      expect(buffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.name testArrayBufferByteLengthField0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_0700
     * @tc.desc Verify byteLength equals 3 for ArrayBuffer.from(new ArrayBuffer(8), 1, 3)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = ArrayBuffer.from(new ArrayBuffer(8), 1, 3);
      expect(buffer.byteLength).assertEqual(3);
    });

    /**
     * @tc.name testArrayBufferByteLengthField0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_0800
     * @tc.desc Verify byteLength equals 0 for ArrayBuffer.from(new ArrayBuffer(10), 0, 0)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = ArrayBuffer.from(new ArrayBuffer(10), 0, 0);
      expect(buffer.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferByteLengthField0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_0900
     * @tc.desc Verify byteLength matches getByteLength for new ArrayBuffer(1)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(1);
      expect(buffer.byteLength).assertEqual(buffer.getByteLength());
      expect(buffer.byteLength).assertEqual(1);
      expect(buffer.getByteLength()).assertEqual(1);
    });

    /**
     * @tc.name testArrayBufferByteLengthField0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_1000
     * @tc.desc Verify byteLength matches getByteLength after resize on new ArrayBuffer(2, 8)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(2, 8);
      buffer.resize(6);
      expect(buffer.byteLength).assertEqual(buffer.getByteLength());
      expect(buffer.byteLength).assertEqual(6);
      expect(buffer.getByteLength()).assertEqual(6);
    });

    /**
     * @tc.name testArrayBufferByteLengthField0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_1100
     * @tc.desc Verify byteLength after multi-step resize chain 0->2->4->2->0 (includes resize(0) path)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(0, 16);
      buffer.resize(2);
      expect(buffer.byteLength).assertEqual(2);
      buffer.resize(4);
      expect(buffer.byteLength).assertEqual(4);
      buffer.resize(2);
      expect(buffer.byteLength).assertEqual(2);
      buffer.resize(0);
      expect(buffer.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferByteLengthField0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_1200
     * @tc.desc Verify byteLength equals 4096 for new ArrayBuffer(4096)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4096);
      expect(buffer.byteLength).assertEqual(4096);
    });

    /**
     * @tc.name testArrayBufferByteLengthField0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_1300
     * @tc.desc Verify byteLength equals 65536 for new ArrayBuffer(65536)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(65536);
      expect(buffer.byteLength).assertEqual(65536);
    });

    /**
     * @tc.name testArrayBufferByteLengthField0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_1400
     * @tc.desc Verify four independent buffers have correct byteLength: 1, 2, 3, 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new ArrayBuffer(1);
      const b = new ArrayBuffer(2);
      const c = new ArrayBuffer(3);
      const d = new ArrayBuffer(4);
      expect(a.byteLength).assertEqual(1);
      expect(b.byteLength).assertEqual(2);
      expect(c.byteLength).assertEqual(3);
      expect(d.byteLength).assertEqual(4);
    });

    /**
     * @tc.name testArrayBufferByteLengthField0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_1500
     * @tc.desc Verify three independent resizable buffers have correct byteLength: 2, 4, 6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a = new ArrayBuffer(2, 8);
      const b = new ArrayBuffer(4, 16);
      const c = new ArrayBuffer(6, 16);
      expect(a.byteLength).assertEqual(2);
      expect(b.byteLength).assertEqual(4);
      expect(c.byteLength).assertEqual(6);
    });

    /**
     * @tc.name testArrayBufferByteLengthField0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_1600
     * @tc.desc Verify new ArrayBuffer(-1) throws RangeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buffer = new ArrayBuffer(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });
  });
}