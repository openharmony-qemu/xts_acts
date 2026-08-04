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

export default function arrayBufferFromTwo2Test(): void {
  describe('ArrayBufferFromTwo2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.name testArrayBufferFromTwo0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_0100
     * @tc.desc Verify from(FixedArray<byte>) preserves all byte values from -128 to 127
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: FixedArray<byte> = new FixedArray<byte>(256, Int.toByte(0));
      for (let i: int = 0; i < 256; i++) {
        arr[i] = Int.toByte(i - 128);
      }
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.byteLength).assertEqual(256);
      for (let i: int = 0; i < 256; i++) {
        expect(buffer.at(i)).assertEqual(Int.toByte(i - 128));
      }
    });

    /**
     * @tc.name testArrayBufferFromTwo0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_0200
     * @tc.desc Verify from(FixedArray<byte>) copies every byte in a regular large array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const length: int = 4096;
      const arr: FixedArray<byte> = new FixedArray<byte>(length, Int.toByte(0));
      for (let i: int = 0; i < length; i++) {
        arr[i] = Int.toByte(i % 256);
      }
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.byteLength).assertEqual(length);
      for (let i: int = 0; i < length; i++) {
        expect(buffer.at(i)).assertEqual(Int.toByte(i % 256));
      }
    });

    /**
     * @tc.name testArrayBufferFromTwo0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_0300
     * @tc.desc Verify from(FixedArray<byte>) copies an all-zero array correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const length: int = 64;
      const arr: FixedArray<byte> = new FixedArray<byte>(length, Int.toByte(0));
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.byteLength).assertEqual(length);
      for (let i: int = 0; i < length; i++) {
        expect(buffer.at(i)).assertEqual(Int.toByte(0));
      }
    });

    /**
     * @tc.name testArrayBufferFromTwo0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_0400
     * @tc.desc Verify from(FixedArray<byte>) copies an all-negative-one array correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const length: int = 64;
      const arr: FixedArray<byte> = new FixedArray<byte>(length, Int.toByte(-1));
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.byteLength).assertEqual(length);
      for (let i: int = 0; i < length; i++) {
        expect(buffer.at(i)).assertEqual(Int.toByte(-1));
      }
    });

    /**
     * @tc.name testArrayBufferFromTwo0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_0500
     * @tc.desc Verify from(FixedArray<byte>) copies alternating positive and negative byte values correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: FixedArray<byte> =
        [Int.toByte(127), Int.toByte(-128), Int.toByte(1), Int.toByte(-1), Int.toByte(0), Int.toByte(64),
          Int.toByte(-64), Int.toByte(32), Int.toByte(-32)];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.byteLength).assertEqual(9);
      for (let i: int = 0; i < 9; i++) {
        expect(buffer.at(i)).assertEqual(arr[i]);
      }
    });

    /**
     * @tc.name testArrayBufferFromTwo0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_0600
     * @tc.desc Verify from(FixedArray<byte>) returns ArrayBuffer with correct basic properties
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: FixedArray<byte> = [Int.toByte(11), Int.toByte(22), Int.toByte(33)];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.byteLength).assertEqual(3);
      expect(buffer.getByteLength()).assertEqual(3);
      expect(buffer.detached).assertFalse();
      expect(buffer.resizable).assertFalse();
      expect(buffer.at(0)).assertEqual(Int.toByte(11));
      expect(buffer.at(1)).assertEqual(Int.toByte(22));
      expect(buffer.at(2)).assertEqual(Int.toByte(33));
    });

    /**
     * @tc.name testArrayBufferFromTwo0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_0700
     * @tc.desc Verify from(empty ValueArray<byte>) returns empty buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ValueArray<byte> = [];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferFromTwo0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_0800
     * @tc.desc Verify from(non-empty ValueArray<byte>) creates buffer with correct byte values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ValueArray<byte> = [Int.toByte(10), Int.toByte(20), Int.toByte(30), Int.toByte(0xFF)];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.byteLength).assertEqual(4);
      expect(buffer.at(0)).assertEqual(Int.toByte(10));
      expect(buffer.at(1)).assertEqual(Int.toByte(20));
      expect(buffer.at(2)).assertEqual(Int.toByte(30));
      expect(buffer.at(3)).assertEqual(Int.toByte(0xFF));
    });

    /**
     * @tc.name testArrayBufferFromTwo0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_0900
     * @tc.desc Verify from(empty FixedArray<byte>) returns empty buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: FixedArray<byte> = [];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.byteLength).assertEqual(0);
    });
  });
}