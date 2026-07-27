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

export default function arrayBufferFromThree2Test(): void {
  describe('ArrayBufferFromThree2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.name testArrayBufferFromThree0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_0100
     * @tc.desc Verify from(Uint8Array) preserves all uint8 values from 0 to 255
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u8 = new Uint8Array(256);
      for (let i: int = 0; i < 256; i++) {
        u8[i] = Int.toByte(i);
      }
      const result = ArrayBuffer.from(u8);
      expect(result.byteLength).assertEqual(256);
      for (let i: int = 0; i < 256; i++) {
        expect(result.at(i)).assertEqual(Int.toByte(i));
      }
    });

    /**
     * @tc.name testArrayBufferFromThree0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_0200
     * @tc.desc Verify from(Uint8Array) copies every byte in a regular large array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const length: int = 4096;
      const u8 = new Uint8Array(length);
      for (let i: int = 0; i < length; i++) {
        u8[i] = Int.toByte(i % 256);
      }
      const result = ArrayBuffer.from(u8);
      expect(result.byteLength).assertEqual(length);
      for (let i: int = 0; i < length; i++) {
        expect(result.at(i)).assertEqual(Int.toByte(i % 256));
      }
    });

    /**
     * @tc.name testArrayBufferFromThree0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_0300
     * @tc.desc Verify from(Uint8Array subview) copies every byte from the full underlying buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const full = new Uint8Array(buf);
      for (let i: int = 0; i < 16; i++) {
        full[i] = Int.toByte(i + 10);
      }
      const sub = new Uint8Array(buf, 4, 8);
      const result = ArrayBuffer.from(sub);
      expect(result.byteLength).assertEqual(16);
      for (let i: int = 0; i < 16; i++) {
        expect(result.at(i)).assertEqual(Int.toByte(i + 10));
      }
    });

    /**
     * @tc.name testArrayBufferFromThree0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_0400
     * @tc.desc Verify modifying ArrayBuffer result does not affect Uint8Array source
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u8 = new Uint8Array([1, 2, 3, 4]);
      const result = ArrayBuffer.from(u8);
      result.set(0, Int.toByte(99));
      result.set(1, Int.toByte(88));
      expect(u8[0]).assertEqual(Int.toByte(1));
      expect(u8[1]).assertEqual(Int.toByte(2));
      expect(u8[2]).assertEqual(Int.toByte(3));
      expect(u8[3]).assertEqual(Int.toByte(4));
      expect(result.at(0)).assertEqual(Int.toByte(99));
      expect(result.at(1)).assertEqual(Int.toByte(88));
    });

    /**
     * @tc.name testArrayBufferFromThree0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_0500
     * @tc.desc Verify repeated from(Uint8Array) calls return independent ArrayBuffer results
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u8 = new Uint8Array([5, 6, 7]);
      const result1 = ArrayBuffer.from(u8);
      const result2 = ArrayBuffer.from(u8);
      result1.set(0, Int.toByte(55));
      result2.set(1, Int.toByte(66));
      expect(result1.at(0)).assertEqual(Int.toByte(55));
      expect(result1.at(1)).assertEqual(Int.toByte(6));
      expect(result2.at(0)).assertEqual(Int.toByte(5));
      expect(result2.at(1)).assertEqual(Int.toByte(66));
      expect(u8[0]).assertEqual(Int.toByte(5));
      expect(u8[1]).assertEqual(Int.toByte(6));
    });

    /**
     * @tc.name testArrayBufferFromThree0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_0600
     * @tc.desc Verify from(Uint8Array) copies an all-zero array correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const length: int = 64;
      const u8 = new Uint8Array(length);
      const result = ArrayBuffer.from(u8);
      expect(result.byteLength).assertEqual(length);
      for (let i: int = 0; i < length; i++) {
        expect(result.at(i)).assertEqual(Int.toByte(0));
      }
    });

    /**
     * @tc.name testArrayBufferFromThree0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_0700
     * @tc.desc Verify from(Uint8Array) copies an all-255 array correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const length: int = 64;
      const u8 = new Uint8Array(length);
      for (let i: int = 0; i < length; i++) {
        u8[i] = Int.toByte(255);
      }
      const result = ArrayBuffer.from(u8);
      expect(result.byteLength).assertEqual(length);
      for (let i: int = 0; i < length; i++) {
        expect(result.at(i)).assertEqual(Int.toByte(255));
      }
    });

    /**
     * @tc.name testArrayBufferFromThree0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_0800
     * @tc.desc Verify from(Uint8Array) copies mixed uint8 boundary values correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u8 = new Uint8Array([0, 1, 127, 128, 129, 254, 255]);
      const result = ArrayBuffer.from(u8);
      expect(result.byteLength).assertEqual(7);
      expect(result.at(0)).assertEqual(Int.toByte(0));
      expect(result.at(1)).assertEqual(Int.toByte(1));
      expect(result.at(2)).assertEqual(Int.toByte(127));
      expect(result.at(3)).assertEqual(Int.toByte(128));
      expect(result.at(4)).assertEqual(Int.toByte(129));
      expect(result.at(5)).assertEqual(Int.toByte(254));
      expect(result.at(6)).assertEqual(Int.toByte(255));
    });

    /**
     * @tc.name testArrayBufferFromThree0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_0900
     * @tc.desc Verify from(Uint8Array) returns ArrayBuffer with correct basic properties
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u8 = new Uint8Array([11, 22, 33]);
      const result = ArrayBuffer.from(u8);
      expect(result.byteLength).assertEqual(3);
      expect(result.getByteLength()).assertEqual(3);
      expect(result.detached).assertFalse();
      expect(result.resizable).assertFalse();
      expect(result.at(0)).assertEqual(Int.toByte(11));
      expect(result.at(1)).assertEqual(Int.toByte(22));
      expect(result.at(2)).assertEqual(Int.toByte(33));
    });

    /**
     * @tc.name testArrayBufferFromThree0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_1000
     * @tc.desc Verify from(Uint8Array) copies very small arrays with length 0, 1, 2, and 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result0 = ArrayBuffer.from(new Uint8Array(0));
      expect(result0.byteLength).assertEqual(0);
      const result1 = ArrayBuffer.from(new Uint8Array([1]));
      expect(result1.byteLength).assertEqual(1);
      expect(result1.at(0)).assertEqual(Int.toByte(1));
      const result2 = ArrayBuffer.from(new Uint8Array([1, 255]));
      expect(result2.byteLength).assertEqual(2);
      expect(result2.at(0)).assertEqual(Int.toByte(1));
      expect(result2.at(1)).assertEqual(Int.toByte(255));
      const result3 = ArrayBuffer.from(new Uint8Array([1, 0, 255]));
      expect(result3.byteLength).assertEqual(3);
      expect(result3.at(0)).assertEqual(Int.toByte(1));
      expect(result3.at(1)).assertEqual(Int.toByte(0));
      expect(result3.at(2)).assertEqual(Int.toByte(255));
    });

    /**
     * @tc.name testArrayBufferFromThree0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_1100
     * @tc.desc Verify from(Uint8Array) single element 255 converts to byte -1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u8: Uint8Array = new Uint8Array(1);
      u8[0] = 255;
      const buf: ArrayBuffer = ArrayBuffer.from(u8);
      expect(buf.byteLength).assertEqual(1);
      expect(buf.at(0)).assertEqual(Int.toByte(-1));
    });

    /**
     * @tc.name testArrayBufferFromThree0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_1200
     * @tc.desc Verify from(Uint8Array) boundary values [0, 128, 255]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u8: Uint8Array = new Uint8Array(3);
      u8[0] = 0;
      u8[1] = 128;
      u8[2] = 255;
      const buf: ArrayBuffer = ArrayBuffer.from(u8);
      expect(buf.at(0)).assertEqual(Int.toByte(0));
      expect(buf.at(1)).assertEqual(Int.toByte(-128));
      expect(buf.at(2)).assertEqual(Int.toByte(-1));
    });

    /**
     * @tc.name testArrayBufferFromThree0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_1300
     * @tc.desc Verify from(Uint8Array) returns ArrayBuffer with byteLength 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bufSrc: ArrayBuffer = new ArrayBuffer(4);
      const u8: Uint8Array = new Uint8Array(bufSrc);
      const buf: ArrayBuffer = ArrayBuffer.from(u8);
      expect(buf.byteLength).assertEqual(4);
      expect(buf.at(0)).assertEqual(Int.toByte(0));
      expect(buf.at(3)).assertEqual(Int.toByte(0));
    });

    /**
     * @tc.name testArrayBufferFromThree0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_1400
     * @tc.desc Verify from(Uint8Array) byteLength matches original buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bufSrc: ArrayBuffer = new ArrayBuffer(6);
      const u8: Uint8Array = new Uint8Array(bufSrc);
      const buf: ArrayBuffer = ArrayBuffer.from(u8);
      expect(buf.byteLength).assertEqual(6);
      expect(buf.at(0)).assertEqual(Int.toByte(0));
    });

    /**
     * @tc.name testArrayBufferFromThree0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_1500
     * @tc.desc Verify from(Uint8Array) content matches original
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bufSrc: ArrayBuffer = new ArrayBuffer(3);
      bufSrc.set(0, Int.toByte(0x31));
      bufSrc.set(1, Int.toByte(0x32));
      bufSrc.set(2, Int.toByte(0x33));
      const u8: Uint8Array = new Uint8Array(bufSrc);
      const buf: ArrayBuffer = ArrayBuffer.from(u8);
      expect(buf.at(0)).assertEqual(Int.toByte(0x31));
      expect(buf.at(1)).assertEqual(Int.toByte(0x32));
      expect(buf.at(2)).assertEqual(Int.toByte(0x33));
    });

    /**
     * @tc.name testArrayBufferFromThree0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_1600
     * @tc.desc Verify from(Uint8Array) length 5 array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u8: Uint8Array = new Uint8Array(5);
      for (let i: int = 0; i < 5; i++) {
        u8[i] = i * 10;
      }
      const buf: ArrayBuffer = ArrayBuffer.from(u8);
      expect(buf.byteLength).assertEqual(5);
      expect(buf.at(0)).assertEqual(Int.toByte(0));
    });

    /**
     * @tc.name testArrayBufferFromThree0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_1700
     * @tc.desc Verify from(Uint8Array) length 10 array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u8: Uint8Array = new Uint8Array(10);
      for (let i: int = 0; i < 10; i++) {
        u8[i] = i * 5;
      }
      const buf: ArrayBuffer = ArrayBuffer.from(u8);
      expect(buf.byteLength).assertEqual(10);
      expect(buf.at(0)).assertEqual(Int.toByte(0));
    });

    /**
     * @tc.name testArrayBufferFromThree0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_1800
     * @tc.desc Verify from(Uint8Array) large array (100 elements)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u8: Uint8Array = new Uint8Array(100);
      for (let i: int = 0; i < 100; i++) {
        u8[i] = i;
      }
      const buf: ArrayBuffer = ArrayBuffer.from(u8);
      expect(buf.byteLength).assertEqual(100);
      expect(buf.at(99)).assertEqual(Int.toByte(99));
    });
  });
}