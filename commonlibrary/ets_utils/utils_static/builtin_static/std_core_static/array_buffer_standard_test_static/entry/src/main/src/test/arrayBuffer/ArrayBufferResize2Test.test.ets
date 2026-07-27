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

export default function arrayBufferResize2Test(): void {
  describe('ArrayBufferResize2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.name testArrayBufferResize0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_0100
     * @tc.desc Verify resize with hexadecimal newLen parameter
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(0x02, 0x10);
      buffer.resize(0x08);
      expect(buffer.byteLength).assertEqual(8);
    });

    /**
     * @tc.name testArrayBufferResize0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_0200
     * @tc.desc Verify resize with octal newLen parameter
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(0o2, 0o10);
      buffer.resize(0o6);
      expect(buffer.byteLength).assertEqual(6);
    });

    /**
     * @tc.name testArrayBufferResize0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_0300
     * @tc.desc Verify resize with binary newLen parameter
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(0b10, 0b1000);
      buffer.resize(0b100);
      expect(buffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.name testArrayBufferResize0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_0400
     * @tc.desc Verify resize with literal value 100 as newLen parameter
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(10, 1000);
      const newLen: int = 100;
      buffer.resize(newLen);
      expect(buffer.byteLength).assertEqual(100);
    });

    /**
     * @tc.name testArrayBufferResize0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_0500
     * @tc.desc Verify resize with truncated float newLen parameter
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(2, 8);
      const newLen: number = 4.9;
      buffer.resize(Double.toInt(newLen));
      expect(buffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.name testArrayBufferResize0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_0600
     * @tc.desc Verify multiple sequential resize operations
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(2, 16);
      buffer.resize(4);
      expect(buffer.byteLength).assertEqual(4);
      buffer.resize(8);
      expect(buffer.byteLength).assertEqual(8);
      buffer.resize(6);
      expect(buffer.byteLength).assertEqual(6);
      buffer.resize(2);
      expect(buffer.byteLength).assertEqual(2);
    });

    /**
     * @tc.name testArrayBufferResize0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_0700
     * @tc.desc Verify resize preserves bytes after grow then shrink
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(2, 8);
      buffer.set(0, Int.toByte(10));
      buffer.set(1, Int.toByte(20));
      buffer.resize(6);
      buffer.set(2, Int.toByte(30));
      buffer.set(3, Int.toByte(40));
      buffer.set(4, Int.toByte(50));
      buffer.set(5, Int.toByte(60));
      buffer.resize(3);
      expect(buffer.byteLength).assertEqual(3);
      expect(buffer.at(0)).assertEqual(Int.toByte(10));
      expect(buffer.at(1)).assertEqual(Int.toByte(20));
      expect(buffer.at(2)).assertEqual(Int.toByte(30));
    });

    /**
     * @tc.name testArrayBufferResize0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_0800
     * @tc.desc Verify resize from zero to non-zero length
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(0, 8);
      expect(buffer.byteLength).assertEqual(0);
      buffer.resize(4);
      expect(buffer.byteLength).assertEqual(4);
      buffer.set(0, Int.toByte(10));
      buffer.set(1, Int.toByte(20));
      expect(buffer.at(0)).assertEqual(Int.toByte(10));
      expect(buffer.at(1)).assertEqual(Int.toByte(20));
    });

    /**
     * @tc.name testArrayBufferResize0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_0900
     * @tc.desc Verify resize from non-zero to zero then back to non-zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4, 8);
      buffer.set(0, Int.toByte(10));
      buffer.set(1, Int.toByte(20));
      buffer.resize(0);
      expect(buffer.byteLength).assertEqual(0);
      buffer.resize(4);
      expect(buffer.byteLength).assertEqual(4);
      buffer.set(0, Int.toByte(30));
      buffer.set(1, Int.toByte(40));
      expect(buffer.at(0)).assertEqual(Int.toByte(30));
      expect(buffer.at(1)).assertEqual(Int.toByte(40));
    });

    /**
     * @tc.name testArrayBufferResize0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_1000
     * @tc.desc Verify resize with large maxByteLength buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(10, 1024);
      buffer.resize(512);
      expect(buffer.byteLength).assertEqual(512);
      buffer.resize(256);
      expect(buffer.byteLength).assertEqual(256);
      buffer.resize(1024);
      expect(buffer.byteLength).assertEqual(1024);
    });

    /**
     * @tc.name testArrayBufferResize0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_1100
     * @tc.desc Verify resize with minimum maxByteLength (equals initial length)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4, 4);
      buffer.resize(4);
      expect(buffer.byteLength).assertEqual(4);
      buffer.resize(0);
      expect(buffer.byteLength).assertEqual(0);
      buffer.resize(4);
      expect(buffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.name testArrayBufferResize0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_1200
     * @tc.desc Verify resize with normal value 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(0, 8);
      buffer.resize(1);
      expect(buffer.byteLength).assertEqual(1);
    });

    /**
     * @tc.name testArrayBufferResize0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_1300
     * @tc.desc Verify resize with normal value 10000
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(0, 10000);
      buffer.resize(10000);
      expect(buffer.byteLength).assertEqual(10000);
    });

    /**
     * @tc.name testArrayBufferResize0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_1400
     * @tc.desc Verify that resizing ArrayBuffer to value 2147483646 close to maximum int triggers OutOfMemoryError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buffer: ArrayBuffer = new ArrayBuffer(0, 2147483646);
        buffer.resize(2147483646);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('OutOfMemoryError');
      }
    });

    /**
     * @tc.name testArrayBufferResize0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_1500
     * @tc.desc Verify resize with hexadecimal value 0x1234
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(0, 0x1234);
      buffer.resize(0x1234);
      expect(buffer.byteLength).assertEqual(4660);
    });

    /**
     * @tc.name testArrayBufferResize0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_1600
     * @tc.desc Verify resize with octal value 0o123
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(0, 0o123);
      buffer.resize(0o123);
      expect(buffer.byteLength).assertEqual(83);
    });

    /**
     * @tc.name testArrayBufferResize0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_1700
     * @tc.desc Verify resize with binary value 0b1010
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(0, 0b1010);
      buffer.resize(0b1010);
      expect(buffer.byteLength).assertEqual(10);
    });

    /**
     * @tc.name testArrayBufferResize0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_1800
     * @tc.desc Verify resize with boundary value 2147483647 (int max) - triggers OutOfMemoryError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buffer: ArrayBuffer = new ArrayBuffer(0, 2147483647);
        buffer.resize(2147483647);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('OutOfMemoryError');
      }
    });

    /**
     * @tc.name testArrayBufferResize0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_1900
     * @tc.desc Verify resize with hexadecimal boundary value 0x7FFFFFFF (int max) - throws OutOfMemoryError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const buffer: ArrayBuffer = new ArrayBuffer(0, 0x7FFFFFFF);
        buffer.resize(0x7FFFFFFF);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('OutOfMemoryError');
      }
    });

    /**
     * @tc.name testArrayBufferResize0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_2000
     * @tc.desc Verify resize with business threshold value 1000000
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(0, 1000000);
      buffer.resize(1000000);
      expect(buffer.byteLength).assertEqual(1000000);
    });

    /**
     * @tc.name testArrayBufferResize0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_2100
     * @tc.desc Verify resize with int boundary negative value -2147483648 throws RangeError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4, 8);
      try {
        buffer.resize(-2147483648);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.name testArrayBufferResize0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_2200
     * @tc.desc Verify resize(0) then resize(n) recovers byteLength
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4, 10);
      buf.resize(0);
      expect(buf.byteLength).assertEqual(0);
      buf.resize(6);
      expect(buf.byteLength).assertEqual(6);
    });

    /**
     * @tc.name testArrayBufferResize0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_2300
     * @tc.desc Verify resize(1) shrinks buffer to 1 byte
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8, 10);
      buf.resize(1);
      expect(buf.byteLength).assertEqual(1);
    });

    /**
     * @tc.name testArrayBufferResize0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_2400
     * @tc.desc Verify resize to maxByteLength sets byteLength correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(0, 16);
      buf.resize(16);
      expect(buf.byteLength).assertEqual(16);
    });

    /**
     * @tc.name testArrayBufferResize0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_2500
     * @tc.desc Verify resize(3) from larger buffer shrinks to 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8, 10);
      buf.resize(3);
      expect(buf.byteLength).assertEqual(3);
    });

    /**
     * @tc.name testArrayBufferResize0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_2600
     * @tc.desc Verify resize(0) on non-zero buffer then at(0) throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(2, 8);
      buf.resize(0);
      try {
        buf.at(0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.name testArrayBufferResize0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_2700
     * @tc.desc Verify resize(0) then resize(n) recovers ability to write and read
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(3, 8);
      buf.resize(0);
      buf.resize(4);
      buf.set(3, Int.toByte(66));
      expect(buf.at(3)).assertEqual(Int.toByte(66));
    });

    /**
     * @tc.name testArrayBufferResize0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_2800
     * @tc.desc Verify resize(newLen equals current byteLength) is no-op
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4, 8);
      buf.set(0, Int.toByte(0xAB));
      buf.resize(4);
      expect(buf.byteLength).assertEqual(4);
      expect(buf.at(0)).assertEqual(Int.toByte(0xAB));
    });

    /**
     * @tc.name testArrayBufferResize0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_2900
     * @tc.desc Verify resize multiple times (5->2->8->4) tracks byteLength correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(3, 9);
      buf.resize(5);
      expect(buf.byteLength).assertEqual(5);
      buf.resize(2);
      expect(buf.byteLength).assertEqual(2);
      buf.resize(8);
      expect(buf.byteLength).assertEqual(8);
      buf.resize(4);
      expect(buf.byteLength).assertEqual(4);
    });

    /**
     * @tc.name testArrayBufferResize0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_3000
     * @tc.desc Verify resize shrink discards data: at on truncated position throws
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(6, 8);
      buf.set(5, Int.toByte(99));
      buf.resize(3);
      try {
        buf.at(5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.name testArrayBufferResize0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_3100
     * @tc.desc Verify resize shrink preserves data in remaining region
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8, 12);
      buf.set(0, Int.toByte(11));
      buf.set(1, Int.toByte(22));
      buf.resize(5);
      buf.resize(2);
      expect(buf.at(0)).assertEqual(Int.toByte(11));
    });

    /**
     * @tc.name testArrayBufferResize0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_3200
     * @tc.desc Verify resize shrink then from copies only valid region
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8, 10);
      buf.set(0, Int.toByte(7));
      buf.set(7, Int.toByte(8));
      buf.resize(3);
      const copied: ArrayBuffer = ArrayBuffer.from(buf, 0, 3);
      expect(copied.byteLength).assertEqual(3);
      expect(copied.at(0)).assertEqual(Int.toByte(7));
    });

    /**
     * @tc.name testArrayBufferResize0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_3300
     * @tc.desc Verify resize(byteLength+1) works normally
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(3, 6);
      buf.resize(4);
      expect(buf.byteLength).assertEqual(4);
    });

    /**
     * @tc.name testArrayBufferResize0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_3400
     * @tc.desc Verify resize(byteLength-1) works normally
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(5, 8);
      buf.resize(4);
      expect(buf.byteLength).assertEqual(4);
    });

    /**
     * @tc.name testArrayBufferResize0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_3500
     * @tc.desc Verify resize expand new region slice shows zeros
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(2, 6);
      buf.resize(5);
      const part: ArrayBuffer = buf.slice(2, 5);
      expect(part.byteLength).assertEqual(3);
      expect(part.at(0)).assertEqual(Int.toByte(0));
      expect(part.at(1)).assertEqual(Int.toByte(0));
      expect(part.at(2)).assertEqual(Int.toByte(0));
    });

    /**
     * @tc.name testArrayBufferResize0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_3600
     * @tc.desc Verify resize expand old region slice preserves data
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(2, 6);
      buf.set(0, Int.toByte(88));
      buf.set(1, Int.toByte(99));
      buf.resize(4);
      const part: ArrayBuffer = buf.slice(0, 2);
      expect(part.at(0)).assertEqual(Int.toByte(88));
      expect(part.at(1)).assertEqual(Int.toByte(99));
    });

    /**
     * @tc.name testArrayBufferResize0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_3700
     * @tc.desc Verify resize on non-resizable buffer throws TypeError, buffer state unchanged
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const before: int = buf.byteLength;
      try {
        buf.resize(6);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
      expect(buf.byteLength).assertEqual(before);
    });

    /**
     * @tc.name testArrayBufferResize0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_3800
     * @tc.desc Verify resize(0) on resizable buffer works
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4, 8);
      buf.resize(0);
      expect(buf.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferResize0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_3900
     * @tc.desc Verify buffer state unchanged when resize throws RangeError (negative)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(2, 6);
      try {
        buf.resize(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(buf.byteLength).assertEqual(2);
    });

    /**
     * @tc.name testArrayBufferResize0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_4000
     * @tc.desc Verify buffer state unchanged when resize throws RangeError (exceeds max)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(2, 6);
      try {
        buf.resize(10);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(buf.byteLength).assertEqual(2);
    });

    /**
     * @tc.name testArrayBufferResize0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_4100
     * @tc.desc Verify resize(0) then set throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(3, 6);
      buf.resize(0);
      try {
        buf.set(0, Int.toByte(1));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.name testArrayBufferResize0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_RESIZE_4200
     * @tc.desc Verify resize(2147483647) exceeds maxByteLength, throws RangeError,and does not change byteLength
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferResize0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(2, 8);
      try {
        buf.resize(2147483647);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(buf.byteLength).assertEqual(2);
    });
  });
}