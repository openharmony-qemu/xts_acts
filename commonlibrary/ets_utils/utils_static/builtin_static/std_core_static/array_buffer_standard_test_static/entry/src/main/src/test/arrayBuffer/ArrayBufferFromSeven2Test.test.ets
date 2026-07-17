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

export default function arrayBufferFromSeven2Test(): void {
  describe('ArrayBufferFromSeven2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.name testArrayBufferFromSeven0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0100
     * @tc.desc Verify from(source) preserves all byte values from -128 to 127
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: ArrayBuffer = new ArrayBuffer(256);
      for (let i: int = 0; i < 256; i++) {
        source.set(i, Int.toByte(i - 128));
      }
      const result: ArrayBuffer = ArrayBuffer.from(source);
      expect(result.byteLength).assertEqual(256);
      for (let i: int = 0; i < 256; i++) {
        expect(result.at(i)).assertEqual(Int.toByte(i - 128));
      }
    });

    /**
     * @tc.name testArrayBufferFromSeven0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0200
     * @tc.desc Verify from(source) copies every byte in a regular large buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const length: int = 4096;
      const source: ArrayBuffer = new ArrayBuffer(length);
      for (let i: int = 0; i < length; i++) {
        source.set(i, Int.toByte(i % 256));
      }
      const result: ArrayBuffer = ArrayBuffer.from(source);
      expect(result.byteLength).assertEqual(length);
      for (let i: int = 0; i < length; i++) {
        expect(result.at(i)).assertEqual(Int.toByte(i % 256));
      }
    });

    /**
     * @tc.name testArrayBufferFromSeven0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0300
     * @tc.desc Verify modifying source after from(source) does not affect result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: ArrayBuffer = new ArrayBuffer(4);
      source.set(0, Int.toByte(10));
      source.set(1, Int.toByte(20));
      source.set(2, Int.toByte(30));
      source.set(3, Int.toByte(40));
      const result: ArrayBuffer = ArrayBuffer.from(source);
      source.set(0, Int.toByte(99));
      source.set(1, Int.toByte(88));
      expect(result.byteLength).assertEqual(4);
      expect(result.at(0)).assertEqual(Int.toByte(10));
      expect(result.at(1)).assertEqual(Int.toByte(20));
      expect(result.at(2)).assertEqual(Int.toByte(30));
      expect(result.at(3)).assertEqual(Int.toByte(40));
    });

    /**
     * @tc.name testArrayBufferFromSeven0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0400
     * @tc.desc Verify modifying result from from(source) does not affect source
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: ArrayBuffer = new ArrayBuffer(4);
      source.set(0, Int.toByte(10));
      source.set(1, Int.toByte(20));
      source.set(2, Int.toByte(30));
      source.set(3, Int.toByte(40));
      const result: ArrayBuffer = ArrayBuffer.from(source);
      result.set(0, Int.toByte(99));
      result.set(1, Int.toByte(88));
      expect(source.at(0)).assertEqual(Int.toByte(10));
      expect(source.at(1)).assertEqual(Int.toByte(20));
      expect(result.at(0)).assertEqual(Int.toByte(99));
      expect(result.at(1)).assertEqual(Int.toByte(88));
    });

    /**
     * @tc.name testArrayBufferFromSeven0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0500
     * @tc.desc Verify repeated from(source) calls return independent ArrayBuffer results
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: ArrayBuffer = new ArrayBuffer(3);
      source.set(0, Int.toByte(5));
      source.set(1, Int.toByte(6));
      source.set(2, Int.toByte(7));
      const result1: ArrayBuffer = ArrayBuffer.from(source);
      const result2: ArrayBuffer = ArrayBuffer.from(source);
      result1.set(0, Int.toByte(55));
      result2.set(1, Int.toByte(66));
      expect(result1.at(0)).assertEqual(Int.toByte(55));
      expect(result1.at(1)).assertEqual(Int.toByte(6));
      expect(result2.at(0)).assertEqual(Int.toByte(5));
      expect(result2.at(1)).assertEqual(Int.toByte(66));
      expect(source.at(0)).assertEqual(Int.toByte(5));
      expect(source.at(1)).assertEqual(Int.toByte(6));
    });

    /**
     * @tc.name testArrayBufferFromSeven0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0600
     * @tc.desc Verify from(source) returns ArrayBuffer with correct basic properties
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: ArrayBuffer = new ArrayBuffer(3);
      source.set(0, Int.toByte(11));
      source.set(1, Int.toByte(22));
      source.set(2, Int.toByte(33));
      const result: ArrayBuffer = ArrayBuffer.from(source);
      expect(result.getByteLength()).assertEqual(3);
      expect(result.detached).assertFalse();
      expect(result.resizable).assertFalse();
    });

    /**
     * @tc.name testArrayBufferFromSeven0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0700
     * @tc.desc Verify from(source) copies an all-zero buffer correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const length: int = 64;
      const source: ArrayBuffer = new ArrayBuffer(length);
      const result: ArrayBuffer = ArrayBuffer.from(source);
      expect(result.byteLength).assertEqual(length);
      for (let i: int = 0; i < length; i++) {
        expect(result.at(i)).assertEqual(Int.toByte(0));
      }
    });

    /**
     * @tc.name testArrayBufferFromSeven0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0800
     * @tc.desc Verify from(source) copies an all-negative-one buffer correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const length: int = 64;
      const source: ArrayBuffer = new ArrayBuffer(length);
      for (let i: int = 0; i < length; i++) {
        source.set(i, Int.toByte(-1));
      }
      const result: ArrayBuffer = ArrayBuffer.from(source);
      expect(result.byteLength).assertEqual(length);
      for (let i: int = 0; i < length; i++) {
        expect(result.at(i)).assertEqual(Int.toByte(-1));
      }
    });

    /**
     * @tc.name testArrayBufferFromSeven0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0900
     * @tc.desc Verify from(resizable source) copies current bytes into non-resizable result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: ArrayBuffer = new ArrayBuffer(4, 8);
      source.set(0, Int.toByte(1));
      source.set(1, Int.toByte(2));
      source.set(2, Int.toByte(3));
      source.set(3, Int.toByte(4));

      const result: ArrayBuffer = ArrayBuffer.from(source);

      expect(source.resizable).assertTrue();
      expect(result.byteLength).assertEqual(4);
      expect(result.resizable).assertFalse();
      expect(result.at(0)).assertEqual(Int.toByte(1));
      expect(result.at(1)).assertEqual(Int.toByte(2));
      expect(result.at(2)).assertEqual(Int.toByte(3));
      expect(result.at(3)).assertEqual(Int.toByte(4));
    });

    /**
     * @tc.name testArrayBufferFromSeven0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_1000
     * @tc.desc Verify resizing source after from(source) does not affect result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: ArrayBuffer = new ArrayBuffer(4, 8);
      source.set(0, Int.toByte(10));
      source.set(1, Int.toByte(20));
      source.set(2, Int.toByte(30));
      source.set(3, Int.toByte(40));

      const result: ArrayBuffer = ArrayBuffer.from(source);

      source.resize(6);
      source.set(4, Int.toByte(50));
      source.set(5, Int.toByte(60));

      expect(source.byteLength).assertEqual(6);
      expect(result.byteLength).assertEqual(4);
      expect(result.at(0)).assertEqual(Int.toByte(10));
      expect(result.at(1)).assertEqual(Int.toByte(20));
      expect(result.at(2)).assertEqual(Int.toByte(30));
      expect(result.at(3)).assertEqual(Int.toByte(40));
    });

    /**
     * @tc.name testArrayBufferFromSeven0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_1100
     * @tc.desc Verify from(source,NaN) coerces offset to 0 when length is omitted
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: ArrayBuffer = new ArrayBuffer(4);
      source.set(0, Int.toByte(11));
      source.set(1, Int.toByte(22));
      source.set(2, Int.toByte(33));
      source.set(3, Int.toByte(44));

      const result: ArrayBuffer = ArrayBuffer.from(source, Double.NaN);

      expect(result.byteLength).assertEqual(4);
      expect(result.at(0)).assertEqual(Int.toByte(11));
      expect(result.at(1)).assertEqual(Int.toByte(22));
      expect(result.at(2)).assertEqual(Int.toByte(33));
      expect(result.at(3)).assertEqual(Int.toByte(44));
    });

    /**
     * @tc.name testArrayBufferFromSeven0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_1200
     * @tc.desc Verify from(source,-1) throws IndexOutOfBoundsError when length is omitted
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: ArrayBuffer = new ArrayBuffer(4);
      try {
        ArrayBuffer.from(source, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.name testArrayBufferFromSeven0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_1300
     * @tc.desc Verify from(source,byteLength+1) throws IndexOutOfBoundsError when length is omitted
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: ArrayBuffer = new ArrayBuffer(4);
      try {
        ArrayBuffer.from(source, source.byteLength + 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.name testArrayBufferFromSeven0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_1400
     * @tc.desc Verify from(ArrayBuffer, 5, 3) with byteOffset at 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: ArrayBuffer = ArrayBuffer.from("abcdefghij", "utf8");
      const buf: ArrayBuffer = ArrayBuffer.from(src, 5, 3);
      expect(buf.byteLength).assertEqual(3);
      expect(buf.at(0)).assertEqual(Int.toByte(102));
      expect(buf.at(1)).assertEqual(Int.toByte(103));
      expect(buf.at(2)).assertEqual(Int.toByte(104));
    });

    /**
     * @tc.name testArrayBufferFromSeven0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_1500
     * @tc.desc Verify from(ArrayBuffer) number overload length=5.0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: ArrayBuffer = ArrayBuffer.from("abcdefghij", "utf8");
      const buf: ArrayBuffer = ArrayBuffer.from(src, 0.0, 5.0);
      expect(buf.byteLength).assertEqual(5);
      expect(buf.at(0)).assertEqual(Int.toByte(97));
      expect(buf.at(1)).assertEqual(Int.toByte(98));
      expect(buf.at(2)).assertEqual(Int.toByte(99));
      expect(buf.at(3)).assertEqual(Int.toByte(100));
      expect(buf.at(4)).assertEqual(Int.toByte(101));
    });

    /**
     * @tc.name testArrayBufferFromSeven0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_1600
     * @tc.desc Verify from(Uint8Array) content matches original buffer bytes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: ArrayBuffer = new ArrayBuffer(3);
      src.set(0, Int.toByte(10));
      src.set(1, Int.toByte(20));
      src.set(2, Int.toByte(30));
      const u8: Uint8Array = new Uint8Array(src);
      const buf: ArrayBuffer = ArrayBuffer.from(u8);
      expect(buf.byteLength).assertEqual(3);
      expect(buf.at(0)).assertEqual(Int.toByte(10));
      expect(buf.at(1)).assertEqual(Int.toByte(20));
      expect(buf.at(2)).assertEqual(Int.toByte(30));
    });
  });
}