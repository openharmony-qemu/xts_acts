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

export default function arrayBufferSliceOne2Test(): void {
  describe('ArrayBufferSliceOne2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.name testArrayBufferSliceOne0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_0100
     * @tc.desc Verify slice with large buffer size 1024 copies correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(1024);
      for (let i: int = 0; i < 1024; i++) {
        buffer.set(i, Int.toByte(i % 256));
      }
      const copied: ArrayBuffer = buffer.slice(100, 200);
      expect(copied.byteLength).assertEqual(100);
      for (let i: int = 0; i < 100; i++) {
        expect(copied.at(i)).assertEqual(Int.toByte((100 + i) % 256));
      }
    });

    /**
     * @tc.name testArrayBufferSliceOne0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_0200
     * @tc.desc Verify slice(512) on large buffer copies from middle to end
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(1024);
      for (let i: int = 0; i < 1024; i++) {
        buffer.set(i, Int.toByte(i % 256));
      }
      const copied: ArrayBuffer = buffer.slice(512);
      expect(copied.byteLength).assertEqual(512);
      for (let i: int = 0; i < 512; i++) {
        expect(copied.at(i)).assertEqual(Int.toByte((512 + i) % 256));
      }
    });

    /**
     * @tc.name testArrayBufferSliceOne0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_0300
     * @tc.desc Verify slice(0,1) copies single first byte correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.set(0, Int.toByte(99));
      buffer.set(1, Int.toByte(20));
      const copied: ArrayBuffer = buffer.slice(0, 1);
      expect(copied.byteLength).assertEqual(1);
      expect(copied.at(0)).assertEqual(Int.toByte(99));
    });

    /**
     * @tc.name testArrayBufferSliceOne0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_0400
     * @tc.desc Verify slice(10000,10001) with business threshold begin/end yields empty
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.set(0, Int.toByte(10));
      const copied: ArrayBuffer = buffer.slice(10000, 10001);
      expect(copied.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferSliceOne0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_0500
     * @tc.desc Verify slice(3,1) with begin>end yields byteLength 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.set(0, Int.toByte(10));
      buffer.set(1, Int.toByte(20));
      buffer.set(2, Int.toByte(30));
      buffer.set(3, Int.toByte(40));
      const copied: ArrayBuffer = buffer.slice(3, 1);
      expect(copied.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferSliceOne0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_0600
     * @tc.desc Verify slice(5,6) with begin/end beyond byteLength yields empty
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.set(0, Int.toByte(10));
      const copied: ArrayBuffer = buffer.slice(5, 6);
      expect(copied.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferSliceOne0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_0700
     * @tc.desc Verify slice(1,100) with end beyond byteLength copies partial buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.set(0, Int.toByte(10));
      buffer.set(1, Int.toByte(20));
      buffer.set(2, Int.toByte(30));
      buffer.set(3, Int.toByte(40));
      const copied: ArrayBuffer = buffer.slice(1, 100);
      expect(copied.byteLength).assertEqual(3);
      expect(copied.at(0)).assertEqual(Int.toByte(20));
      expect(copied.at(1)).assertEqual(Int.toByte(30));
      expect(copied.at(2)).assertEqual(Int.toByte(40));
    });

    /**
     * @tc.name testArrayBufferSliceOne0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_0800
     * @tc.desc Verify slice(0xFF,0x100) with hex beyond byteLength yields empty
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.set(0, Int.toByte(10));
      const copied: ArrayBuffer = buffer.slice(0xFF, 0x100);
      expect(copied.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferSliceOne0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_0900
     * @tc.desc Verify slice(0b1000,0b1001) with binary beyond byteLength yields empty
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.set(0, Int.toByte(10));
      const copied: ArrayBuffer = buffer.slice(0b1000, 0b1001);
      expect(copied.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferSliceOne0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_1000
     * @tc.desc Verify slice on buffer with all zero bytes copies zero values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      const copied: ArrayBuffer = buffer.slice(0, 2);
      expect(copied.byteLength).assertEqual(2);
      expect(copied.at(0)).assertEqual(Int.toByte(0));
      expect(copied.at(1)).assertEqual(Int.toByte(0));
    });

    /**
     * @tc.name testArrayBufferSliceOne0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_1100
     * @tc.desc Verify slice(0,2) with -1 byte values copies negative values correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.set(0, Int.toByte(-1));
      buffer.set(1, Int.toByte(-1));
      buffer.set(2, Int.toByte(10));
      buffer.set(3, Int.toByte(20));
      const copied: ArrayBuffer = buffer.slice(0, 2);
      expect(copied.byteLength).assertEqual(2);
      expect(copied.at(0)).assertEqual(Int.toByte(-1));
      expect(copied.at(1)).assertEqual(Int.toByte(-1));
    });

    /**
     * @tc.name testArrayBufferSliceOne0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_1200
     * @tc.desc Verify slice(1,3) on buffer with mixed positive and negative bytes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.set(0, Int.toByte(100));
      buffer.set(1, Int.toByte(-50));
      buffer.set(2, Int.toByte(-128));
      buffer.set(3, Int.toByte(127));
      const copied: ArrayBuffer = buffer.slice(1, 3);
      expect(copied.byteLength).assertEqual(2);
      expect(copied.at(0)).assertEqual(Int.toByte(-50));
      expect(copied.at(1)).assertEqual(Int.toByte(-128));
    });

    /**
     * @tc.name testArrayBufferSliceOne0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_1300
     * @tc.desc Verify slice(3,5) copies 2 bytes with boundary byte values 127 and -128
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(8);
      buffer.set(0, Int.toByte(0));
      buffer.set(1, Int.toByte(1));
      buffer.set(2, Int.toByte(127));
      buffer.set(3, Int.toByte(-128));
      buffer.set(4, Int.toByte(50));
      buffer.set(5, Int.toByte(60));
      buffer.set(6, Int.toByte(70));
      buffer.set(7, Int.toByte(80));
      const copied: ArrayBuffer = buffer.slice(3, 5);
      expect(copied.byteLength).assertEqual(2);
      expect(copied.at(0)).assertEqual(Int.toByte(-128));
      expect(copied.at(1)).assertEqual(Int.toByte(50));
    });

    /**
     * @tc.name testArrayBufferSliceOne0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_1400
     * @tc.desc Verify slice(0,2) on buffer with max byte value 127 copies correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.set(0, Int.toByte(127));
      buffer.set(1, Int.toByte(127));
      buffer.set(2, Int.toByte(0));
      buffer.set(3, Int.toByte(0));
      const copied: ArrayBuffer = buffer.slice(0, 2);
      expect(copied.byteLength).assertEqual(2);
      expect(copied.at(0)).assertEqual(Int.toByte(127));
      expect(copied.at(1)).assertEqual(Int.toByte(127));
    });

    /**
     * @tc.name testArrayBufferSliceOne0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_1500
     * @tc.desc Verify slice(-2) with negative begin copies last 2 bytes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(8);
      for (let i: int = 0; i < 8; i++) {
        buffer.set(i, Int.toByte(i + 10));
      }
      const copied: ArrayBuffer = buffer.slice(-2);
      expect(copied.byteLength).assertEqual(2);
      expect(copied.at(0)).assertEqual(Int.toByte(16));
      expect(copied.at(1)).assertEqual(Int.toByte(17));
    });

    /**
     * @tc.name testArrayBufferSliceOne0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_1600
     * @tc.desc Verify slice(0,-2) with negative end copies first 6 bytes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(8);
      for (let i: int = 0; i < 8; i++) {
        buffer.set(i, Int.toByte(i + 10));
      }
      const copied: ArrayBuffer = buffer.slice(0, -2);
      expect(copied.byteLength).assertEqual(6);
      for (let i: int = 0; i < 6; i++) {
        expect(copied.at(i)).assertEqual(Int.toByte(i + 10));
      }
    });

    /**
     * @tc.name testArrayBufferSliceOne0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_1700
     * @tc.desc Verify slice(-4,-2) with negative begin and end copies middle 2 bytes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(8);
      for (let i: int = 0; i < 8; i++) {
        buffer.set(i, Int.toByte(i + 10));
      }
      const copied: ArrayBuffer = buffer.slice(-4, -2);
      expect(copied.byteLength).assertEqual(2);
      expect(copied.at(0)).assertEqual(Int.toByte(14));
      expect(copied.at(1)).assertEqual(Int.toByte(15));
    });

    /**
     * @tc.name testArrayBufferSliceOne0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_1800
     * @tc.desc Verify slice(-8) with negative begin equal to byteLength copies entire buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(8);
      for (let i: int = 0; i < 8; i++) {
        buffer.set(i, Int.toByte(i + 10));
      }
      const copied: ArrayBuffer = buffer.slice(-8);
      expect(copied.byteLength).assertEqual(8);
      for (let i: int = 0; i < 8; i++) {
        expect(copied.at(i)).assertEqual(Int.toByte(i + 10));
      }
    });

    /**
     * @tc.name testArrayBufferSliceOne0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_1900
     * @tc.desc Verify slice(-10) with negative begin beyond byteLength copies entire buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(8);
      for (let i: int = 0; i < 8; i++) {
        buffer.set(i, Int.toByte(i + 10));
      }
      const copied: ArrayBuffer = buffer.slice(-10);
      expect(copied.byteLength).assertEqual(8);
      for (let i: int = 0; i < 8; i++) {
        expect(copied.at(i)).assertEqual(Int.toByte(i + 10));
      }
    });

    /**
     * @tc.name testArrayBufferSliceOne0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_2000
     * @tc.desc Verify slice(0, 0) returns empty buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const sliced: ArrayBuffer = buf.slice(0, 0);
      expect(sliced.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferSliceOne0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_2100
     * @tc.desc Verify slice(byteLength, byteLength) returns empty buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const sliced: ArrayBuffer = buf.slice(4, 4);
      expect(sliced.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferSliceOne0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_2200
     * @tc.desc Verify slice(0, byteLength) returns full copy
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      buf.set(0, Int.toByte(11));
      buf.set(1, Int.toByte(22));
      buf.set(2, Int.toByte(33));
      buf.set(3, Int.toByte(44));
      const sliced: ArrayBuffer = buf.slice(0, 4);
      expect(sliced.byteLength).assertEqual(4);
      expect(sliced.at(0)).assertEqual(Int.toByte(11));
      expect(sliced.at(3)).assertEqual(Int.toByte(44));
    });

    /**
     * @tc.name testArrayBufferSliceOne0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_2300
     * @tc.desc Verify slice(1, 4) on 5-byte buffer copies middle segment
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(5);
      buf.set(0, Int.toByte(1));
      buf.set(1, Int.toByte(2));
      buf.set(2, Int.toByte(3));
      buf.set(3, Int.toByte(4));
      buf.set(4, Int.toByte(5));
      const sliced: ArrayBuffer = buf.slice(1, 4);
      expect(sliced.byteLength).assertEqual(3);
      expect(sliced.at(0)).assertEqual(Int.toByte(2));
      expect(sliced.at(1)).assertEqual(Int.toByte(3));
      expect(sliced.at(2)).assertEqual(Int.toByte(4));
    });

    /**
     * @tc.name testArrayBufferSliceOne0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_2400
     * @tc.desc Verify slice on resizable buffer works
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4, 16);
      buf.set(0, Int.toByte(11));
      buf.set(1, Int.toByte(22));
      buf.set(2, Int.toByte(33));
      buf.set(3, Int.toByte(44));
      const sliced: ArrayBuffer = buf.slice(1, 3);
      expect(sliced.byteLength).assertEqual(2);
      expect(sliced.at(0)).assertEqual(Int.toByte(22));
      expect(sliced.at(1)).assertEqual(Int.toByte(33));
    });

    /**
     * @tc.name testArrayBufferSliceOne0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_2500
     * @tc.desc Verify slice result detached is false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const sliced: ArrayBuffer = buf.slice(0, 2);
      expect(sliced.detached).assertFalse();
    });

    /**
     * @tc.name testArrayBufferSliceOne0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_2600
     * @tc.desc Verify slice(0) with byteLength=byteLength
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(7);
      const sliced: ArrayBuffer = buf.slice(0);
      expect(sliced.byteLength).assertEqual(buf.byteLength);
    });

    /**
     * @tc.name testArrayBufferSliceOne0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_2700
     * @tc.desc Verify slice content matches original segment
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      buf.set(0, Int.toByte(0x0A));
      buf.set(1, Int.toByte(0x0B));
      buf.set(2, Int.toByte(0x0C));
      buf.set(3, Int.toByte(0x0D));
      const sliced: ArrayBuffer = buf.slice(1, 3);
      expect(sliced.at(0)).assertEqual(Int.toByte(0x0B));
      expect(sliced.at(1)).assertEqual(Int.toByte(0x0C));
    });

    /**
     * @tc.name testArrayBufferSliceOne0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_2800
     * @tc.desc Verify slice does not modify original buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(3);
      buf.set(0, Int.toByte(0x10));
      buf.set(1, Int.toByte(0x20));
      buf.set(2, Int.toByte(0x30));
      buf.slice(0, 2);
      expect(buf.at(0)).assertEqual(Int.toByte(0x10));
      expect(buf.at(1)).assertEqual(Int.toByte(0x20));
      expect(buf.at(2)).assertEqual(Int.toByte(0x30));
    });

    /**
     * @tc.name testArrayBufferSliceOne0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_2900
     * @tc.desc Verify slice(int) and slice(number) produce same result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      buf.set(0, Int.toByte(0x01));
      buf.set(1, Int.toByte(0x02));
      buf.set(2, Int.toByte(0x03));
      buf.set(3, Int.toByte(0x04));
      const s1: ArrayBuffer = buf.slice(1, 3);
      const s2: ArrayBuffer = buf.slice(1.0, 3.0);
      expect(s1.byteLength).assertEqual(s2.byteLength);
      expect(s1.at(0)).assertEqual(s2.at(0));
      expect(s1.at(1)).assertEqual(s2.at(1));
    });

    /**
     * @tc.name testArrayBufferSliceOne0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_3000
     * @tc.desc Verify slice(1) skips first byte
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(3);
      buf.set(0, Int.toByte(10));
      buf.set(1, Int.toByte(20));
      buf.set(2, Int.toByte(30));
      const result: ArrayBuffer = buf.slice(1);
      expect(result.byteLength).assertEqual(2);
      expect(result.at(0)).assertEqual(Int.toByte(20));
      expect(result.at(1)).assertEqual(Int.toByte(30));
    });

    /**
     * @tc.name testArrayBufferSliceOne0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_3100
     * @tc.desc Verify slice(byteLength-1) copies only last byte
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(5);
      buf.set(4, Int.toByte(99));
      const result: ArrayBuffer = buf.slice(4);
      expect(result.byteLength).assertEqual(1);
      expect(result.at(0)).assertEqual(Int.toByte(99));
    });

    /**
     * @tc.name testArrayBufferSliceOne0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_3200
     * @tc.desc Verify slice(byteLength) returns empty buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      buf.set(0, Int.toByte(1));
      buf.set(1, Int.toByte(2));
      buf.set(2, Int.toByte(3));
      buf.set(3, Int.toByte(4));
      const result: ArrayBuffer = buf.slice(4);
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferSliceOne0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_3300
     * @tc.desc Verify slice result resizable is false (even from resizable buffer)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(2, 8);
      const sliced: ArrayBuffer = buf.slice(0, 1);
      expect(sliced.resizable).assertFalse();
    });

    /**
     * @tc.name testArrayBufferSliceOne0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_3400
     * @tc.desc Verify slice(0, 4) returns ArrayBuffer with correct byteLength
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const sliced: ArrayBuffer = buf.slice(0, 4);
      expect(sliced.byteLength).assertEqual(4);
    });

    /**
     * @tc.name testArrayBufferSliceOne0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_3500
     * @tc.desc Verify slice(0, 1) returns ArrayBuffer with correct byteLength
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const sliced: ArrayBuffer = buf.slice(0, 1);
      expect(sliced.byteLength).assertEqual(1);
    });

    /**
     * @tc.name testArrayBufferSliceOne0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_3600
     * @tc.desc Verify slice(2) returns byteLength-2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(5);
      const sliced: ArrayBuffer = buf.slice(2);
      expect(sliced.byteLength).assertEqual(3);
    });

    /**
     * @tc.name testArrayBufferSliceOne0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_3700
     * @tc.desc Verify slice(0x00, 0x03) with hex values works
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const sliced: ArrayBuffer = buf.slice(0x00, 0x03);
      expect(sliced.byteLength).assertEqual(3);
    });

    /**
     * @tc.name testArrayBufferSliceOne0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_3800
     * @tc.desc Verify slice does not modify original buffer byteLength
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(5);
      const origLen: int = buf.byteLength;
      buf.slice(1, 3);
      expect(buf.byteLength).assertEqual(origLen);
    });

    /**
     * @tc.name testArrayBufferSliceOne0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_3900
     * @tc.desc Verify slice does not modify original buffer detached state
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const origDet: boolean = buf.detached;
      buf.slice(0, 2);
      expect(buf.detached).assertEqual(origDet);
    });

    /**
     * @tc.name testArrayBufferSliceOne0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_4000
     * @tc.desc Verify slice(-1) returns last byte of 4-element buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      buf.set(0, Int.toByte(10));
      buf.set(1, Int.toByte(20));
      buf.set(2, Int.toByte(30));
      buf.set(3, Int.toByte(40));
      const sliced: ArrayBuffer = buf.slice(-1);
      expect(sliced.byteLength).assertEqual(1);
      expect(sliced.at(0)).assertEqual(Int.toByte(40));
    });

    /**
     * @tc.name testArrayBufferSliceOne0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_4100
     * @tc.desc Verify slice(-3, -1) with both negative indices
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      buf.set(0, Int.toByte(10));
      buf.set(1, Int.toByte(20));
      buf.set(2, Int.toByte(30));
      buf.set(3, Int.toByte(40));
      const sliced: ArrayBuffer = buf.slice(-3, -1);
      expect(sliced.byteLength).assertEqual(2);
      expect(sliced.at(0)).assertEqual(Int.toByte(20));
    });

    /**
     * @tc.name testArrayBufferSliceOne0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_4200
     * @tc.desc Verify slice(-3) covers entire buffer (negative from start)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(3);
      buf.set(0, Int.toByte(100));
      buf.set(1, Int.toByte(101));
      buf.set(2, Int.toByte(102));
      const sliced: ArrayBuffer = buf.slice(-3);
      expect(sliced.byteLength).assertEqual(3);
    });

    /**
     * @tc.name testArrayBufferSliceOne0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_4300
     * @tc.desc Verify slice with begin=-1 using number overload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      buf.set(0, Int.toByte(10));
      buf.set(1, Int.toByte(20));
      buf.set(2, Int.toByte(30));
      buf.set(3, Int.toByte(40));
      const sliced: ArrayBuffer = buf.slice(-1.0);
      expect(sliced.byteLength).assertEqual(1);
      expect(sliced.at(0)).assertEqual(Int.toByte(40));
    });

    /**
     * @tc.name testArrayBufferSliceOne0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_4400
     * @tc.desc Verify slice with end=-1 using float overload
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      buf.set(0, Int.toByte(10));
      buf.set(1, Int.toByte(20));
      buf.set(2, Int.toByte(30));
      buf.set(3, Int.toByte(40));
      const sliced: ArrayBuffer = buf.slice(0, -1);
      expect(sliced.byteLength).assertEqual(3);
      expect(sliced.at(2)).assertEqual(Int.toByte(30));
    });

    /**
     * @tc.name testArrayBufferSliceOne0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_4500
     * @tc.desc Verify slice with begin=2147483647 returns empty
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const sliced: ArrayBuffer = buf.slice(2147483647);
      expect(sliced.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferSliceOne0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_ONE_4600
     * @tc.desc Verify slice(0, 2147483647) truncates to byteLength
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceOne0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(2);
      buf.set(0, Int.toByte(1));
      buf.set(1, Int.toByte(2));
      const sliced: ArrayBuffer = buf.slice(0, 2147483647);
      expect(sliced.byteLength).assertEqual(2);
      expect(sliced.at(1)).assertEqual(Int.toByte(2));
    });
  });
}