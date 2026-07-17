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

export default function arrayBufferToString2Test(): void {
  describe('ArrayBufferToString2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.name testArrayBufferToString0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_0100
     * @tc.desc Verify toString() on large buffer returns '[object ArrayBuffer]'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(10000);
      expect(buffer.toString()).assertEqual('[object ArrayBuffer]');
    });

    /**
     * @tc.name testArrayBufferToString0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_0200
     * @tc.desc Verify toString() on resizable buffer returns '[object ArrayBuffer]'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(2, 8);
      expect(buffer.toString()).assertEqual('[object ArrayBuffer]');
    });

    /**
     * @tc.name testArrayBufferToString0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_0300
     * @tc.desc Verify toString() after resize returns '[object ArrayBuffer]'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(2, 8);
      buffer.resize(6);
      expect(buffer.toString()).assertEqual('[object ArrayBuffer]');
    });

    /**
     * @tc.name testArrayBufferToString0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_0400
     * @tc.desc Verify constructing and toString() on max size buffer throws OutOfMemoryError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buffer: ArrayBuffer = new ArrayBuffer(2147483647);
        buffer.toString();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('OutOfMemoryError');
      }
    });

    /**
     * @tc.name testArrayBufferToString0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_0500
     * @tc.desc Verify toString() on buffer with data returns '[object ArrayBuffer]'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(8);
      buffer.set(0, Int.toByte(65));
      buffer.set(1, Int.toByte(66));
      buffer.set(2, Int.toByte(67));
      expect(buffer.toString()).assertEqual('[object ArrayBuffer]');
    });

    /**
     * @tc.name testArrayBufferToString0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_0600
     * @tc.desc Verify toString() on all-zero buffer returns '[object ArrayBuffer]'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(8);
      for (let i: int = 0; i < 8; i++) {
        buffer.set(i, Int.toByte(0));
      }
      expect(buffer.toString()).assertEqual('[object ArrayBuffer]');
    });

    /**
     * @tc.name testArrayBufferToString0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_0700
     * @tc.desc Verify toString() on all-negative-one buffer returns '[object ArrayBuffer]'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(8);
      for (let i: int = 0; i < 8; i++) {
        buffer.set(i, Int.toByte(-1));
      }
      expect(buffer.toString()).assertEqual('[object ArrayBuffer]');
    });

    /**
     * @tc.name testArrayBufferToString0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_0800
     * @tc.desc Verify toString() on buffer with boundary byte values returns '[object ArrayBuffer]'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(8);
      buffer.set(0, Int.toByte(127));
      buffer.set(1, Int.toByte(-128));
      expect(buffer.toString()).assertEqual('[object ArrayBuffer]');
    });

    /**
     * @tc.name testArrayBufferToString0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_0900
     * @tc.desc Verify toString() on null buffer throws NullPointerError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buffer: ArrayBuffer | null = null;
        buffer!.toString();
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('NullPointerError');
      }
    });

    /**
     * @tc.name testArrayBufferToString0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_1000
     * @tc.desc Verify toString() on business threshold size buffer returns '[object ArrayBuffer]'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(1000000);
      expect(buffer.toString()).assertEqual('[object ArrayBuffer]');
    });

    /**
     * @tc.name testArrayBufferToString0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_1100
     * @tc.desc Verify toString() called multiple times returns consistent result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(8);
      const result1: string = buffer.toString();
      const result2: string = buffer.toString();
      const result3: string = buffer.toString();
      expect(result1).assertEqual('[object ArrayBuffer]');
      expect(result2).assertEqual('[object ArrayBuffer]');
      expect(result3).assertEqual('[object ArrayBuffer]');
    });

    /**
     * @tc.name testArrayBufferToString0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_1200
     * @tc.desc Verify toString() on buffer with hexadecimal size returns '[object ArrayBuffer]'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(0x1000);
      expect(buffer.toString()).assertEqual('[object ArrayBuffer]');
    });

    /**
     * @tc.name testArrayBufferToString0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_1300
     * @tc.desc Verify toString() on buffer with octal size returns '[object ArrayBuffer]'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(0o1000);
      expect(buffer.toString()).assertEqual('[object ArrayBuffer]');
    });

    /**
     * @tc.name testArrayBufferToString0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_1400
     * @tc.desc Verify toString() on buffer with binary size returns '[object ArrayBuffer]'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(0b1000);
      expect(buffer.toString()).assertEqual('[object ArrayBuffer]');
    });

    /**
     * @tc.name testArrayBufferToString0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_1500
     * @tc.desc Verify toString() on resizable buffer with maxByteLength returns '[object ArrayBuffer]'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(0x10, 0x100);
      expect(buffer.toString()).assertEqual('[object ArrayBuffer]');
    });

    /**
     * @tc.name testArrayBufferToString0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_1600
     * @tc.desc Verify toString() on buffer after multiple resize operations returns '[object ArrayBuffer]'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4, 16);
      buffer.resize(8);
      expect(buffer.toString()).assertEqual('[object ArrayBuffer]');
      buffer.resize(12);
      expect(buffer.toString()).assertEqual('[object ArrayBuffer]');
      buffer.resize(2);
      expect(buffer.toString()).assertEqual('[object ArrayBuffer]');
    });

    /**
     * @tc.name testArrayBufferToString0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_1700
     * @tc.desc Verify toString() on buffer with scientific notation size returns '[object ArrayBuffer]'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(1e3);
      expect(buffer.toString()).assertEqual('[object ArrayBuffer]');
    });

    /**
     * @tc.name testArrayBufferToString0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_1800
     * @tc.desc Verify toString() on buffer with alternating byte values returns '[object ArrayBuffer]'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(16);
      for (let i: int = 0; i < 16; i++) {
        buffer.set(i, Int.toByte(i % 2 === 0 ? 127 : -128));
      }
      expect(buffer.toString()).assertEqual('[object ArrayBuffer]');
    });

    /**
     * @tc.name testArrayBufferToString0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_1900
     * @tc.desc Verify toString() on small buffer returns '[object ArrayBuffer]'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      expect(buf.toString()).assertEqual('[object ArrayBuffer]');
    });

    /**
     * @tc.name testArrayBufferToString0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_2000
     * @tc.desc Verify toString() on empty buffer returns '[object ArrayBuffer]'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(0);
      expect(buf.toString()).assertEqual('[object ArrayBuffer]');
    });

    /**
     * @tc.name testArrayBufferToString0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_2100
     * @tc.desc Verify toString() on 5-byte buffer filled with data returns '[object ArrayBuffer]'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(5);
      buf.set(0, Int.toByte(0x11));
      buf.set(1, Int.toByte(0x22));
      buf.set(2, Int.toByte(0x33));
      buf.set(3, Int.toByte(0x44));
      buf.set(4, Int.toByte(0x55));
      expect(buf.toString()).assertEqual('[object ArrayBuffer]');
    });

    /**
     * @tc.name testArrayBufferToString0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_2200
     * @tc.desc Verify toString() result same regardless of byteLength
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf1: ArrayBuffer = new ArrayBuffer(1);
      const buf2: ArrayBuffer = new ArrayBuffer(0x7F);
      expect(buf1.toString()).assertEqual(buf2.toString());
    });

    /**
     * @tc.name testArrayBufferToString0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_2300
     * @tc.desc Verify toString() same regardless of maxByteLength
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf1: ArrayBuffer = new ArrayBuffer(2, 4);
      const buf2: ArrayBuffer = new ArrayBuffer(2, 16);
      expect(buf1.toString()).assertEqual(buf2.toString());
    });

    /**
     * @tc.name testArrayBufferToString0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_2400
     * @tc.desc Verify toString() does not modify byteLength
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(3);
      const lenBefore: int = buf.byteLength;
      buf.toString();
      expect(buf.byteLength).assertEqual(lenBefore);
    });

    /**
     * @tc.name testArrayBufferToString0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_2500
     * @tc.desc Verify toString() does not modify detached state
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(3);
      const dBefore: boolean = buf.detached;
      buf.toString();
      expect(buf.detached).assertEqual(dBefore);
    });

    /**
     * @tc.name testArrayBufferToString0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_2600
     * @tc.desc Verify toString() does not modify resizable state
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(2, 8);
      const rBefore: boolean = buf.resizable;
      buf.toString();
      expect(buf.resizable).assertEqual(rBefore);
    });

    /**
     * @tc.name testArrayBufferToString0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_2700
     * @tc.desc Verify toString() does not modify buffer content
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(3);
      buf.set(0, Int.toByte(0x41));
      buf.toString();
      expect(buf.at(0)).assertEqual(Int.toByte(0x41));
    });

    /**
     * @tc.name testArrayBufferToString0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_2800
     * @tc.desc Verify toString() returns '[object ArrayBuffer]' after construction
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      expect(buf.toString()).assertEqual('[object ArrayBuffer]');
    });

    /**
     * @tc.name testArrayBufferToString0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_2900
     * @tc.desc Verify toString() on 1-byte buffer returns '[object ArrayBuffer]'
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(1);
      expect(buf.toString()).assertEqual('[object ArrayBuffer]');
    });
  });
}