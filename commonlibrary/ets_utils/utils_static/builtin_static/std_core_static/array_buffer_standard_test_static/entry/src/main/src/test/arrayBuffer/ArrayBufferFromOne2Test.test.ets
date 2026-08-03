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

export default function arrayBufferFromOne2Test(): void {
  describe('ArrayBufferFromOne2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.name testArrayBufferFromOne0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_0100
     * @tc.desc Verify from(ValueArray<byte>) preserves all byte values from -128 to 127
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ValueArray<byte> = new ValueArray<byte>(256, Int.toByte(0));
      for (let i: int = 0; i < 256; i++) {
        arr[i] = Int.toByte(i - 128);
      }
      const result: ArrayBuffer = ArrayBuffer.from(arr);
      expect(result.byteLength).assertEqual(256);
      for (let i: int = 0; i < 256; i++) {
        expect(result.at(i)).assertEqual(Int.toByte(i - 128));
      }
    });

    /**
     * @tc.name testArrayBufferFromOne0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_0200
     * @tc.desc Verify from(ValueArray<byte>) copies every byte in a regular large array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const length: int = 4096;
      const arr: ValueArray<byte> = new ValueArray<byte>(length, Int.toByte(0));
      for (let i: int = 0; i < length; i++) {
        arr[i] = Int.toByte(i % 256);
      }
      const result: ArrayBuffer = ArrayBuffer.from(arr);
      expect(result.byteLength).assertEqual(length);
      for (let i: int = 0; i < length; i++) {
        expect(result.at(i)).assertEqual(Int.toByte(i % 256));
      }
    });

    /**
     * @tc.name testArrayBufferFromOne0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_0300
     * @tc.desc Verify from(ValueArray<byte>) copies an all-zero array correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const length: int = 64;
      const arr: ValueArray<byte> = new ValueArray<byte>(length, Int.toByte(0));
      const result: ArrayBuffer = ArrayBuffer.from(arr);
      expect(result.byteLength).assertEqual(length);
      for (let i: int = 0; i < length; i++) {
        expect(result.at(i)).assertEqual(Int.toByte(0));
      }
    });

    /**
     * @tc.name testArrayBufferFromOne0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_0400
     * @tc.desc Verify from(ValueArray<byte>) copies an all-negative-one array correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const length: int = 64;
      const arr: ValueArray<byte> = new ValueArray<byte>(length, Int.toByte(-1));
      const result: ArrayBuffer = ArrayBuffer.from(arr);
      expect(result.byteLength).assertEqual(length);
      for (let i: int = 0; i < length; i++) {
        expect(result.at(i)).assertEqual(Int.toByte(-1));
      }
    });

    /**
     * @tc.name testArrayBufferFromOne0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_0500
     * @tc.desc Verify from(ValueArray<byte>) copies alternating positive and negative byte values correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ValueArray<byte> =
        [Int.toByte(127), Int.toByte(-128), Int.toByte(1), Int.toByte(-1), Int.toByte(0), Int.toByte(64),
          Int.toByte(-64), Int.toByte(32), Int.toByte(-32)];
      const result: ArrayBuffer = ArrayBuffer.from(arr);
      expect(result.byteLength).assertEqual(9);
      for (let i: int = 0; i < 9; i++) {
        expect(result.at(i)).assertEqual(arr[i]);
      }
    });

    /**
     * @tc.name testArrayBufferFromOne0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_0600
     * @tc.desc Verify from(ValueArray<byte>) returns ArrayBuffer with correct basic properties
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ValueArray<byte> = [Int.toByte(11), Int.toByte(22), Int.toByte(33)];
      const result: ArrayBuffer = ArrayBuffer.from(arr);

      expect(result.byteLength).assertEqual(3);
      expect(result.getByteLength()).assertEqual(3);
      expect(result.detached).assertFalse();
      expect(result.resizable).assertFalse();
      expect(result.at(0)).assertEqual(Int.toByte(11));
      expect(result.at(1)).assertEqual(Int.toByte(22));
      expect(result.at(2)).assertEqual(Int.toByte(33));
    });

    /**
     * @tc.name testArrayBufferFromOne0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_0700
     * @tc.desc Verify from(ValueArray<byte>) with empty array returns zero-length buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ValueArray<byte> = [];
      const buf: ArrayBuffer = ArrayBuffer.from(arr);
      expect(buf.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferFromOne0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_0800
     * @tc.desc Verify from(ValueArray<byte>) single element -128
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ValueArray<byte> = [Int.toByte(-128)];
      const buf: ArrayBuffer = ArrayBuffer.from(arr);
      expect(buf.byteLength).assertEqual(1);
      expect(buf.at(0)).assertEqual(Int.toByte(-128));
    });

    /**
     * @tc.name testArrayBufferFromOne0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_0900
     * @tc.desc Verify from(ValueArray<byte>) single element 127
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ValueArray<byte> = [Int.toByte(127)];
      const buf: ArrayBuffer = ArrayBuffer.from(arr);
      expect(buf.byteLength).assertEqual(1);
      expect(buf.at(0)).assertEqual(Int.toByte(127));
    });

    /**
     * @tc.name testArrayBufferFromOne0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_1000
     * @tc.desc Verify from(ValueArray<byte>) with boundary values [-128, 127, 0, -1]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ValueArray<byte> = [Int.toByte(-128), Int.toByte(127), Int.toByte(0), Int.toByte(-1)];
      const buf: ArrayBuffer = ArrayBuffer.from(arr);
      expect(buf.byteLength).assertEqual(4);
      expect(buf.at(0)).assertEqual(Int.toByte(-128));
      expect(buf.at(1)).assertEqual(Int.toByte(127));
      expect(buf.at(2)).assertEqual(Int.toByte(0));
      expect(buf.at(3)).assertEqual(Int.toByte(-1));
    });

    /**
     * @tc.name testArrayBufferFromOne0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_1100
     * @tc.desc Verify from(ValueArray<byte>) all zeros array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ValueArray<byte> = [Int.toByte(0), Int.toByte(0), Int.toByte(0), Int.toByte(0), Int.toByte(0)];
      const buf: ArrayBuffer = ArrayBuffer.from(arr);
      expect(buf.byteLength).assertEqual(5);
      for (let i: int = 0; i < 5; i++) {
        expect(buf.at(i)).assertEqual(Int.toByte(0));
      }
    });

    /**
     * @tc.name testArrayBufferFromOne0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_1200
     * @tc.desc Verify from(ValueArray<byte>) with 0x7F hex literal [complements 0008-0010 with hex notation]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ValueArray<byte> = [Int.toByte(0x7F)];
      const buf: ArrayBuffer = ArrayBuffer.from(arr);
      expect(buf.byteLength).assertEqual(1);
      expect(buf.at(0)).assertEqual(Int.toByte(127));
    });

    /**
     * @tc.name testArrayBufferFromOne0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_1300
     * @tc.desc Verify from(ValueArray<byte>) with 0x80 hex literal wraps to -128 [complements 0008-0010 with hex notation]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ValueArray<byte> = [Int.toByte(0x80)];
      const buf: ArrayBuffer = ArrayBuffer.from(arr);
      expect(buf.at(0)).assertEqual(Int.toByte(-128));
    });

    /**
     * @tc.name testArrayBufferFromOne0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_1400
     * @tc.desc Verify from(ValueArray<byte>) with 0xFF hex literal wraps to -1 [complements 0008-0010 with hex notation]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ValueArray<byte> = [Int.toByte(0xFF)];
      const buf: ArrayBuffer = ArrayBuffer.from(arr);
      expect(buf.at(0)).assertEqual(Int.toByte(-1));
    });

    /**
     * @tc.name testArrayBufferFromOne0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_1500
     * @tc.desc Verify from(ValueArray<byte>) returns ArrayBuffer with byteLength 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ValueArray<byte> = [Int.toByte(0x10), Int.toByte(0x20), Int.toByte(0x30)];
      const buf: ArrayBuffer = ArrayBuffer.from(arr);
      expect(buf.byteLength).assertEqual(3);
    });

    /**
     * @tc.name testArrayBufferFromOne0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_1600
     * @tc.desc Verify from(ValueArray<byte>) returns ArrayBuffer with correct byteLength
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ValueArray<byte> = [Int.toByte(0x01), Int.toByte(0x02)];
      const buf: ArrayBuffer = ArrayBuffer.from(arr);
      expect(buf.byteLength).assertEqual(2);
    });

    /**
     * @tc.name testArrayBufferFromOne0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_1700
     * @tc.desc Verify from(ValueArray<byte>) creates buffer with detached false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ValueArray<byte> = [Int.toByte(0x01), Int.toByte(0x02)];
      const buf: ArrayBuffer = ArrayBuffer.from(arr);
      expect(buf.detached).assertFalse();
    });

    /**
     * @tc.name testArrayBufferFromOne0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_1800
     * @tc.desc Verify from(ValueArray<byte>) creates buffer with resizable false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ValueArray<byte> = [Int.toByte(0x01), Int.toByte(0x02)];
      const buf: ArrayBuffer = ArrayBuffer.from(arr);
      expect(buf.resizable).assertFalse();
    });

    /**
     * @tc.name testArrayBufferFromOne0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_1900
     * @tc.desc Verify from(ValueArray) content matches source array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ValueArray<byte> = [Int.toByte(0x01), Int.toByte(0x02), Int.toByte(0x03), Int.toByte(0x04)];
      const buf: ArrayBuffer = ArrayBuffer.from(arr);
      expect(buf.at(0)).assertEqual(Int.toByte(0x01));
      expect(buf.at(1)).assertEqual(Int.toByte(0x02));
      expect(buf.at(2)).assertEqual(Int.toByte(0x03));
      expect(buf.at(3)).assertEqual(Int.toByte(0x04));
    });
  });
}