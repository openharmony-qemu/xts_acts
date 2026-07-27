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

export default function arrayBufferFromSix2Test(): void {
  describe('ArrayBufferFromSix2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.name testArrayBufferFromSix0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_0100
     * @tc.desc Verify from(source,middle,0) yields empty ArrayBuffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(6);
      for (let i: int = 0; i < 6; i++) {
        source.set(i, Int.toByte(i + 1));
      }
      const result = ArrayBuffer.from(source, 3, 0);
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferFromSix0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_0200
     * @tc.desc Verify from(source,0,1) copies first single byte
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(4);
      source.set(0, Int.toByte(77));
      source.set(1, Int.toByte(88));
      const result = ArrayBuffer.from(source, 0, 1);
      expect(result.byteLength).assertEqual(1);
      expect(result.at(0)).assertEqual(Int.toByte(77));
    });

    /**
     * @tc.name testArrayBufferFromSix0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_0300
     * @tc.desc Verify from(source,0,256) preserves all byte values from -128 to 127
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(256);
      for (let i: int = 0; i < 256; i++) {
        source.set(i, Int.toByte(i - 128));
      }

      const result = ArrayBuffer.from(source, 0, 256);

      expect(result.byteLength).assertEqual(256);
      for (let i: int = 0; i < 256; i++) {
        expect(result.at(i)).assertEqual(Int.toByte(i - 128));
      }
    });

    /**
     * @tc.name testArrayBufferFromSix0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_0400
     * @tc.desc Verify from(source,0,largeLength) copies every byte in a large buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const length: int = 4096;
      const source = new ArrayBuffer(length);
      for (let i: int = 0; i < length; i++) {
        source.set(i, Int.toByte(i % 256));
      }

      const result = ArrayBuffer.from(source, 0, length);

      expect(result.byteLength).assertEqual(length);
      for (let i: int = 0; i < length; i++) {
        expect(result.at(i)).assertEqual(Int.toByte(i % 256));
      }
    });

    /**
     * @tc.name testArrayBufferFromSix0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_0500
     * @tc.desc Verify from(source,offset,length) copies every byte in a large middle segment
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sourceLength: int = 4096;
      const offset: int = 1024;
      const length: int = 2048;
      const source = new ArrayBuffer(sourceLength);
      for (let i: int = 0; i < sourceLength; i++) {
        source.set(i, Int.toByte((i * 31) % 256));
      }

      const result = ArrayBuffer.from(source, offset, length);

      expect(result.byteLength).assertEqual(length);
      for (let i: int = 0; i < length; i++) {
        expect(result.at(i)).assertEqual(Int.toByte(((offset + i) * 31) % 256));
      }
    });

    /**
     * @tc.name testArrayBufferFromSix0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_0600
     * @tc.desc Verify modifying source ArrayBuffer after from does not affect result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(4);
      source.set(0, Int.toByte(10));
      source.set(1, Int.toByte(20));
      source.set(2, Int.toByte(30));
      source.set(3, Int.toByte(40));

      const result = ArrayBuffer.from(source, 1, 2);

      source.set(1, Int.toByte(99));
      source.set(2, Int.toByte(88));

      expect(result.byteLength).assertEqual(2);
      expect(result.at(0)).assertEqual(Int.toByte(20));
      expect(result.at(1)).assertEqual(Int.toByte(30));
    });

    /**
     * @tc.name testArrayBufferFromSix0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_0700
     * @tc.desc Verify modifying result ArrayBuffer does not affect source ArrayBuffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(4);
      source.set(0, Int.toByte(10));
      source.set(1, Int.toByte(20));
      source.set(2, Int.toByte(30));
      source.set(3, Int.toByte(40));

      const result = ArrayBuffer.from(source, 1, 2);

      result.set(0, Int.toByte(99));
      result.set(1, Int.toByte(88));

      expect(source.at(1)).assertEqual(Int.toByte(20));
      expect(source.at(2)).assertEqual(Int.toByte(30));
      expect(result.at(0)).assertEqual(Int.toByte(99));
      expect(result.at(1)).assertEqual(Int.toByte(88));
    });

    /**
     * @tc.name testArrayBufferFromSix0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_0800
     * @tc.desc Verify repeated from(source,offset,length) calls return independent ArrayBuffer results
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(5);
      for (let i: int = 0; i < 5; i++) {
        source.set(i, Int.toByte(i + 1));
      }
      const result1 = ArrayBuffer.from(source, 1, 3);
      const result2 = ArrayBuffer.from(source, 1, 3);
      result1.set(0, Int.toByte(55));
      result2.set(1, Int.toByte(66));
      expect(result1.at(0)).assertEqual(Int.toByte(55));
      expect(result1.at(1)).assertEqual(Int.toByte(3));
      expect(result2.at(0)).assertEqual(Int.toByte(2));
      expect(result2.at(1)).assertEqual(Int.toByte(66));
      expect(source.at(1)).assertEqual(Int.toByte(2));
      expect(source.at(2)).assertEqual(Int.toByte(3));
    });

    /**
     * @tc.name testArrayBufferFromSix0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_0900
     * @tc.desc Verify from(source,offset,length) returns ArrayBuffer with correct basic properties
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(6);
      source.set(2, Int.toByte(11));
      source.set(3, Int.toByte(22));
      source.set(4, Int.toByte(33));
      const result = ArrayBuffer.from(source, 2, 3);
      expect(result.getByteLength()).assertEqual(3);
      expect(result.detached).assertFalse();
      expect(result.resizable).assertFalse();
    });

    /**
     * @tc.name testArrayBufferFromSix0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_1000
     * @tc.desc Verify from(source,offset,length) copies all-negative-one segment correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(64);
      for (let i: int = 0; i < 64; i++) {
        source.set(i, Int.toByte(-1));
      }
      const result = ArrayBuffer.from(source, 8, 32);
      expect(result.byteLength).assertEqual(32);
      for (let i: int = 0; i < 32; i++) {
        expect(result.at(i)).assertEqual(Int.toByte(-1));
      }
    });

    /**
     * @tc.name testArrayBufferFromSix0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_1100
     * @tc.desc Verify from(resizable source,offset,length) copies current bytes into non-resizable result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(4, 8);
      source.set(0, Int.toByte(1));
      source.set(1, Int.toByte(2));
      source.set(2, Int.toByte(3));
      source.set(3, Int.toByte(4));
      const result = ArrayBuffer.from(source, 1, 2);
      expect(source.resizable).assertTrue();
      expect(result.byteLength).assertEqual(2);
      expect(result.resizable).assertFalse();
      expect(result.at(0)).assertEqual(Int.toByte(2));
      expect(result.at(1)).assertEqual(Int.toByte(3));
    });

    /**
     * @tc.name testArrayBufferFromSix0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_1200
     * @tc.desc Verify modifying resizable source after from does not affect result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(4, 8);
      source.set(0, Int.toByte(10));
      source.set(1, Int.toByte(20));
      source.set(2, Int.toByte(30));
      source.set(3, Int.toByte(40));

      const result = ArrayBuffer.from(source, 1, 2);

      source.set(1, Int.toByte(99));
      source.set(2, Int.toByte(88));

      expect(result.byteLength).assertEqual(2);
      expect(result.at(0)).assertEqual(Int.toByte(20));
      expect(result.at(1)).assertEqual(Int.toByte(30));
    });

    /**
     * @tc.name testArrayBufferFromSix0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_1300
     * @tc.desc Verify from(source,byteLength+1,0) throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(4);
      try {
        ArrayBuffer.from(source, source.byteLength + 1, 0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.name testArrayBufferFromSix0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_1400
     * @tc.desc Verify from(source,byteLength,1) throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(4);
      try {
        ArrayBuffer.from(source, source.byteLength, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.name testArrayBufferFromSix0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_1500
     * @tc.desc Verify from(source,0,byteLength+1) throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(4);
      try {
        ArrayBuffer.from(source, 0, source.byteLength + 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.name testArrayBufferFromSix0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_1600
     * @tc.desc Verify from(ArrayBuffer, int, int) copies buffer segment correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: ArrayBuffer = new ArrayBuffer(4);
      src.set(0, Int.toByte(0x41));
      src.set(1, Int.toByte(0x42));
      src.set(2, Int.toByte(0x43));
      src.set(3, Int.toByte(0x44));
      const buf: ArrayBuffer = ArrayBuffer.from(src, 1, 2);
      expect(buf.byteLength).assertEqual(2);
      expect(buf.at(0)).assertEqual(Int.toByte(0x42));
      expect(buf.at(1)).assertEqual(Int.toByte(0x43));
    });

    /**
     * @tc.name testArrayBufferFromSix0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_1700
     * @tc.desc Verify from(ArrayBuffer, number, number) copies with number overload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: ArrayBuffer = new ArrayBuffer(6);
      const buf: ArrayBuffer = ArrayBuffer.from(src, 0.0, 4.0);
      expect(buf.byteLength).assertEqual(4);
    });

    /**
     * @tc.name testArrayBufferFromSix0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_1800
     * @tc.desc Verify from(ArrayBuffer, -1, 2) with negative byteOffset throws error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: ArrayBuffer = new ArrayBuffer(4);
      try {
        const buf: ArrayBuffer = ArrayBuffer.from(src, -1, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.name testArrayBufferFromSix0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_1900
     * @tc.desc Verify from with byteOffset+length exceeding source range throws error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: ArrayBuffer = new ArrayBuffer(4);
      try {
        const buf: ArrayBuffer = ArrayBuffer.from(src, 4, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.name testArrayBufferFromSix0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_2000
     * @tc.desc Verify from with length exceeding source range throws error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: ArrayBuffer = new ArrayBuffer(4);
      try {
        const buf: ArrayBuffer = ArrayBuffer.from(src, 3, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.name testArrayBufferFromSix0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_2100
     * @tc.desc Verify from with negative length throws error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: ArrayBuffer = new ArrayBuffer(4);
      try {
        const buf: ArrayBuffer = ArrayBuffer.from(src, 0, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.name testArrayBufferFromSix0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_2200
     * @tc.desc Verify from(ArrayBuffer, 0, 0) returns empty buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: ArrayBuffer = new ArrayBuffer(4);
      const buf: ArrayBuffer = ArrayBuffer.from(src, 0, 0);
      expect(buf.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferFromSix0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_2300
     * @tc.desc Verify from(empty ArrayBuffer, 0, 0) returns empty buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: ArrayBuffer = new ArrayBuffer(0);
      const buf: ArrayBuffer = ArrayBuffer.from(src, 0, 0);
      expect(buf.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferFromSix0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_2400
     * @tc.desc Verify from(ArrayBuffer) does not modify source buffer byteLength
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: ArrayBuffer = new ArrayBuffer(5);
      const lenB: int = src.byteLength;
      ArrayBuffer.from(src, 0, 2);
      expect(src.byteLength).assertEqual(lenB);
    });

    /**
     * @tc.name testArrayBufferFromSix0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_2500
     * @tc.desc Verify from(ArrayBuffer) creates independent copy (modify one does not affect other)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: ArrayBuffer = new ArrayBuffer(2);
      src.set(0, Int.toByte(0xAA));
      const buf: ArrayBuffer = ArrayBuffer.from(src, 0, 2);
      buf.set(0, Int.toByte(0xBB));
      expect(src.at(0)).assertEqual(Int.toByte(0xAA));
    });
  });
}