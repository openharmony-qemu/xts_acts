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

export default function arrayBufferDetachedField2Test(): void {
  describe('ArrayBufferDetachedField2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.name testArrayBufferDetachedField0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_DETACHED_FIELD_0100
     * @tc.desc Verify sliced ArrayBuffer remains not detached
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.set(0, Int.toByte(10));
      buffer.set(1, Int.toByte(20));
      buffer.set(2, Int.toByte(30));
      buffer.set(3, Int.toByte(40));
      const sliced: ArrayBuffer = buffer.slice(1, 3);
      expect(buffer.detached).assertFalse();
      expect(sliced.detached).assertFalse();
      expect(sliced.byteLength).assertEqual(2);
      expect(sliced.at(0)).assertEqual(Int.toByte(20));
      expect(sliced.at(1)).assertEqual(Int.toByte(30));
    });

    /**
     * @tc.name testArrayBufferDetachedField0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_DETACHED_FIELD_0200
     * @tc.desc Verify resizable ArrayBuffer remains not detached after expanding and shrinking
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(2, 6);
      expect(buffer.detached).assertFalse();
      buffer.resize(5);
      expect(buffer.detached).assertFalse();
      buffer.resize(2);
      expect(buffer.detached).assertFalse();
    });

    /**
     * @tc.name testArrayBufferDetachedField0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_DETACHED_FIELD_0300
     * @tc.desc Verify from(ValueArray<byte>) created buffer has detached false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ValueArray<byte> = [Int.toByte(10), Int.toByte(20)];
      const buf: ArrayBuffer = ArrayBuffer.from(arr);
      expect(buf.detached).assertFalse();
      expect(buf.byteLength).assertEqual(2);
    });

    /**
     * @tc.name testArrayBufferDetachedField0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_DETACHED_FIELD_0400
     * @tc.desc Verify from(FixedArray<byte>) created buffer has detached false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: FixedArray<byte> = [Int.toByte(30), Int.toByte(40)];
      const buf: ArrayBuffer = ArrayBuffer.from(arr);
      expect(buf.detached).assertFalse();
      expect(buf.byteLength).assertEqual(2);
    });

    /**
     * @tc.name testArrayBufferDetachedField0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_DETACHED_FIELD_0500
     * @tc.desc Verify resize to 0 then resize back, detached remains false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(2, 6);
      buffer.resize(0);
      expect(buffer.detached).assertFalse();
      buffer.resize(2);
      expect(buffer.detached).assertFalse();
      expect(buffer.byteLength).assertEqual(2);
    });

    /**
     * @tc.name testArrayBufferDetachedField0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_DETACHED_FIELD_0600
     * @tc.desc Verify slice from resizable buffer yields new buffer with detached false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(3, 8);
      buffer.set(0, Int.toByte(11));
      buffer.set(1, Int.toByte(22));
      buffer.set(2, Int.toByte(33));
      const sliced: ArrayBuffer = buffer.slice(0, 2);
      expect(sliced.detached).assertFalse();
      expect(sliced.byteLength).assertEqual(2);
      expect(sliced.at(0)).assertEqual(Int.toByte(11));
    });

    /**
     * @tc.name testArrayBufferDetachedField0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_DETACHED_FIELD_0700
     * @tc.desc Verify normal ArrayBuffer constructor detached remains false after at() access
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      buf.set(0, Int.toByte(10));
      buf.at(0);
      expect(buf.detached).assertFalse();
    });

    /**
     * @tc.name testArrayBufferDetachedField0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_DETACHED_FIELD_0800
     * @tc.desc Verify from(string, "base64") created buffer detached is false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = ArrayBuffer.from("QUJD", "base64");
      expect(buf.detached).assertFalse();
      expect(buf.byteLength).assertEqual(3);
    });

    /**
     * @tc.name testArrayBufferDetachedField0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_DETACHED_FIELD_0900
     * @tc.desc Verify normal ArrayBuffer constructor detached is false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      expect(buf.detached).assertFalse();
    });

    /**
     * @tc.name testArrayBufferDetachedField0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_DETACHED_FIELD_1000
     * @tc.desc Verify resizable ArrayBuffer constructor detached is false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(2, 8);
      expect(buf.detached).assertFalse();
    });

    /**
     * @tc.name testArrayBufferDetachedField0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_DETACHED_FIELD_1100
     * @tc.desc Verify set operation does not change detached state
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      buf.set(0, Int.toByte(1));
      expect(buf.detached).assertFalse();
    });

    /**
     * @tc.name testArrayBufferDetachedField0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_DETACHED_FIELD_1200
     * @tc.desc Verify resize does not change detached state (stays false)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(2, 6);
      buf.resize(4);
      expect(buf.detached).assertFalse();
    });

    /**
     * @tc.name testArrayBufferDetachedField0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_DETACHED_FIELD_1300
     * @tc.desc Verify slice does not change original buffer detached state
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      buf.slice(0, 2);
      expect(buf.detached).assertFalse();
    });

    /**
     * @tc.name testArrayBufferDetachedField0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_DETACHED_FIELD_1400
     * @tc.desc Verify at access does not change detached state
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      buf.set(0, Int.toByte(1));
      buf.at(0);
      expect(buf.detached).assertFalse();
    });

    /**
     * @tc.name testArrayBufferDetachedField0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_DETACHED_FIELD_1500
     * @tc.desc Verify from(ValueArray) new buffer detached is false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: ValueArray<byte> = [Int.toByte(1), Int.toByte(2), Int.toByte(3)];
      const buf: ArrayBuffer = ArrayBuffer.from(src);
      expect(buf.detached).assertFalse();
    });

    /**
     * @tc.name testArrayBufferDetachedField0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_DETACHED_FIELD_1600
     * @tc.desc Verify empty buffer (byteLength=0) detached is false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(0);
      expect(buf.detached).assertFalse();
    });

    /**
     * @tc.name testArrayBufferDetachedField0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_DETACHED_FIELD_1700
     * @tc.desc Verify slice from resizable buffer original buffer detached is false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(3, 8);
      buf.slice(0, 2);
      expect(buf.detached).assertFalse();
    });

    /**
     * @tc.name testArrayBufferDetachedField0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_DETACHED_FIELD_1800
     * @tc.desc Verify from(string, utf8) new buffer detached is false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = ArrayBuffer.from("hello", "utf8");
      expect(buf.detached).assertFalse();
    });

    /**
     * @tc.name testArrayBufferDetachedField0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_DETACHED_FIELD_1900
     * @tc.desc Verify from(double[]) new buffer detached is false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: double[] = [1.0, 2.0];
      const buf: ArrayBuffer = ArrayBuffer.from(src);
      expect(buf.detached).assertFalse();
    });

    /**
     * @tc.name testArrayBufferDetachedField0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_DETACHED_FIELD_2000
     * @tc.desc Verify from(Uint8Array) new buffer detached is false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u8: Uint8Array = new Uint8Array(4);
      const buf: ArrayBuffer = ArrayBuffer.from(u8);
      expect(buf.detached).assertFalse();
    });

    /**
     * @tc.name testArrayBufferDetachedField0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_DETACHED_FIELD_2100
     * @tc.desc Verify toString does not change detached state
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const d: boolean = buf.detached;
      buf.toString();
      expect(buf.detached).assertEqual(d);
    });

    /**
     * @tc.name testArrayBufferDetachedField0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_DETACHED_FIELD_2200
     * @tc.desc Verify getByteLength does not change detached state
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const d: boolean = buf.detached;
      buf.getByteLength();
      expect(buf.detached).assertEqual(d);
    });

    /**
     * @tc.name testArrayBufferDetachedField0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_DETACHED_FIELD_2300
     * @tc.desc Verify detached on empty resizable buffer is false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferDetachedField0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(0, 6);
      expect(buf.detached).assertFalse();
    });
  });
}