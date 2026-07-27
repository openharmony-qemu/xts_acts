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

export default function arrayBufferGetByteLength2Test(): void {
  describe('ArrayBufferGetByteLength2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.name testArrayBufferGetByteLength0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_METHOD_GET_BYTE_LENGTH_0100
     * @tc.desc Verify getByteLength returns 1 for new ArrayBuffer(1)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferGetByteLength0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(1);
      expect(buffer.getByteLength()).assertEqual(1);
    });

    /**
     * @tc.name testArrayBufferGetByteLength0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_METHOD_GET_BYTE_LENGTH_0200
     * @tc.desc Verify getByteLength returns 4 for ArrayBuffer.from test utf8
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferGetByteLength0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = ArrayBuffer.from("test", "utf8");
      expect(buffer.getByteLength()).assertEqual(4);
    });

    /**
     * @tc.name testArrayBufferGetByteLength0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_METHOD_GET_BYTE_LENGTH_0300
     * @tc.desc Verify getByteLength matches requested length for different offset/length slices
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferGetByteLength0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: ArrayBuffer = ArrayBuffer.from("abcdef", "utf8");
      const cases: int[][] = [[0, 3, 3], [1, 2, 2]];
      for (let i: int = 0; i < cases.length; i++) {
        const c: int[] = cases[i];
        const buffer: ArrayBuffer = ArrayBuffer.from(src, c[0], c[1]);
        expect(buffer.getByteLength()).assertEqual(c[2]);
      }
    });

    /**
     * @tc.name testArrayBufferGetByteLength0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_METHOD_GET_BYTE_LENGTH_0400
     * @tc.desc Verify getByteLength returns same value over 3 calls on ArrayBuffer 16
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferGetByteLength0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(16);
      const first: int = buffer.getByteLength();
      const second: int = buffer.getByteLength();
      const third: int = buffer.getByteLength();
      expect(first).assertEqual(16);
      expect(second).assertEqual(16);
      expect(third).assertEqual(16);
    });

    /**
     * @tc.name testArrayBufferGetByteLength0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_METHOD_GET_BYTE_LENGTH_0500
     * @tc.desc Verify getByteLength independent for two buffers of different sizes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferGetByteLength0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer1: ArrayBuffer = new ArrayBuffer(1);
      const buffer2: ArrayBuffer = new ArrayBuffer(10);
      expect(buffer1.getByteLength()).assertEqual(1);
      expect(buffer2.getByteLength()).assertEqual(10);
    });

    /**
     * @tc.name testArrayBufferGetByteLength0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_METHOD_GET_BYTE_LENGTH_0600
     * @tc.desc Verify getByteLength returns 0 for ArrayBuffer.from empty string
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferGetByteLength0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = ArrayBuffer.from("", "utf8");
      expect(buffer.getByteLength()).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferGetByteLength0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_METHOD_GET_BYTE_LENGTH_0700
     * @tc.desc Verify getByteLength on 0-byte buffer returns 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferGetByteLength0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(0);
      expect(buf.getByteLength()).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferGetByteLength0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_METHOD_GET_BYTE_LENGTH_0800
     * @tc.desc Verify getByteLength on 16-byte buffer returns 16
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferGetByteLength0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      expect(buf.getByteLength()).assertEqual(16);
    });

    /**
     * @tc.name testArrayBufferGetByteLength0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_METHOD_GET_BYTE_LENGTH_0900
     * @tc.desc Verify getByteLength on 32-byte buffer returns 32
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferGetByteLength0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(32);
      expect(buf.getByteLength()).assertEqual(32);
    });

    /**
     * @tc.name testArrayBufferGetByteLength0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_METHOD_GET_BYTE_LENGTH_1000
     * @tc.desc Verify getByteLength on 64-byte buffer returns 64
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferGetByteLength0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(64);
      expect(buf.getByteLength()).assertEqual(64);
    });

    /**
     * @tc.name testArrayBufferGetByteLength0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_METHOD_GET_BYTE_LENGTH_1100
     * @tc.desc Verify getByteLength on 128-byte buffer returns 128
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferGetByteLength0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(128);
      expect(buf.getByteLength()).assertEqual(128);
    });

    /**
     * @tc.name testArrayBufferGetByteLength0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_METHOD_GET_BYTE_LENGTH_1200
     * @tc.desc Verify getByteLength on 256-byte buffer returns 256
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferGetByteLength0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(256);
      expect(buf.getByteLength()).assertEqual(256);
    });

    /**
     * @tc.name testArrayBufferGetByteLength0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_METHOD_GET_BYTE_LENGTH_1300
     * @tc.desc Verify getByteLength on 1000-byte buffer returns 1000
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferGetByteLength0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(1000);
      expect(buf.getByteLength()).assertEqual(1000);
    });

    /**
     * @tc.name testArrayBufferGetByteLength0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_METHOD_GET_BYTE_LENGTH_1400
     * @tc.desc Verify getByteLength returns 4 for 4-byte buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferGetByteLength0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      expect(buf.getByteLength()).assertEqual(4);
    });

    /**
     * @tc.name testArrayBufferGetByteLength0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_METHOD_GET_BYTE_LENGTH_1500
     * @tc.desc Verify getByteLength on resizable buffer returns 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferGetByteLength0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(2, 8);
      expect(buf.getByteLength()).assertEqual(2);
    });

    /**
     * @tc.name testArrayBufferGetByteLength0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_METHOD_GET_BYTE_LENGTH_1600
     * @tc.desc Verify getByteLength equals byteLength property on 5-byte buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferGetByteLength0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(5);
      expect(buf.getByteLength()).assertEqual(buf.byteLength);
    });

    /**
     * @tc.name testArrayBufferGetByteLength0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_METHOD_GET_BYTE_LENGTH_1700
     * @tc.desc Verify getByteLength equals byteLength property on empty buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferGetByteLength0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(0);
      expect(buf.getByteLength()).assertEqual(buf.byteLength);
    });

    /**
     * @tc.name testArrayBufferGetByteLength0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_METHOD_GET_BYTE_LENGTH_1800
     * @tc.desc Verify getByteLength returns 127 for 127-byte buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferGetByteLength0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(127);
      expect(buf.getByteLength()).assertEqual(127);
    });

    /**
     * @tc.name testArrayBufferGetByteLength0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_METHOD_GET_BYTE_LENGTH_1900
     * @tc.desc Verify getByteLength returns 128 for 0x80 buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferGetByteLength0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(0x80);
      expect(buf.getByteLength()).assertEqual(128);
    });

    /**
     * @tc.name testArrayBufferGetByteLength0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_METHOD_GET_BYTE_LENGTH_2000
     * @tc.desc Verify getByteLength on from(ValueArray) single element returns 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferGetByteLength0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ValueArray<byte> = [0x42];
      const buf: ArrayBuffer = ArrayBuffer.from(arr);
      expect(buf.getByteLength()).assertEqual(1);
    });

    /**
     * @tc.name testArrayBufferGetByteLength0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_METHOD_GET_BYTE_LENGTH_2100
     * @tc.desc Verify getByteLength updates after resize expand
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferGetByteLength0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(2, 10);
      buf.resize(8);
      expect(buf.getByteLength()).assertEqual(8);
    });

    /**
     * @tc.name testArrayBufferGetByteLength0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_METHOD_GET_BYTE_LENGTH_2200
     * @tc.desc Verify getByteLength updates after resize shrink
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferGetByteLength0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(6, 10);
      buf.resize(3);
      expect(buf.getByteLength()).assertEqual(3);
    });

    /**
     * @tc.name testArrayBufferGetByteLength0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_METHOD_GET_BYTE_LENGTH_2300
     * @tc.desc Verify getByteLength equals byteLength on resize buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferGetByteLength0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(2, 8);
      buf.resize(6);
      expect(buf.getByteLength()).assertEqual(buf.byteLength);
    });

    /**
     * @tc.name testArrayBufferGetByteLength0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_METHOD_GET_BYTE_LENGTH_2400
     * @tc.desc Verify getByteLength does not modify buffer content
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferGetByteLength0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(3);
      buf.set(0, Int.toByte(0x55));
      buf.set(1, Int.toByte(0x66));
      buf.set(2, Int.toByte(0x77));
      buf.getByteLength();
      expect(buf.at(0)).assertEqual(Int.toByte(0x55));
      expect(buf.at(1)).assertEqual(Int.toByte(0x66));
      expect(buf.at(2)).assertEqual(Int.toByte(0x77));
    });

    /**
     * @tc.name testArrayBufferGetByteLength0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_METHOD_GET_BYTE_LENGTH_2500
     * @tc.desc Verify getByteLength does not modify detached state
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferGetByteLength0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const d: boolean = buf.detached;
      buf.getByteLength();
      expect(buf.detached).assertEqual(d);
    });

    /**
     * @tc.name testArrayBufferGetByteLength0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_METHOD_GET_BYTE_LENGTH_2600
     * @tc.desc Verify getByteLength does not change resizable property
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferGetByteLength0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(2, 8);
      const r: boolean = buf.resizable;
      buf.getByteLength();
      expect(buf.resizable).assertEqual(r);
    });
  });
}