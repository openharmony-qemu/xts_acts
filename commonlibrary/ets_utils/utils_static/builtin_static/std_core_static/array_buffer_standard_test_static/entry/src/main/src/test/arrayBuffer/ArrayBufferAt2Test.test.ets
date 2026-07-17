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

export default function arrayBufferAt2Test(): void {
  describe('ArrayBufferAt2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.name testArrayBufferAt0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_0100
     * @tc.desc Verify set 0x0A at index 0 then at reads back correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(10);
      buffer.set(0, Int.toByte(0x0A));
      expect(buffer.at(0)).assertEqual(Int.toByte(0x0A));
    });

    /**
     * @tc.name testArrayBufferAt0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_0200
     * @tc.desc Verify set -1 at index 6 then at reads back correctly on 10-byte buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(10);
      buffer.set(6, Int.toByte(-1));
      expect(buffer.at(6)).assertEqual(Int.toByte(-1));
    });

    /**
     * @tc.name testArrayBufferAt0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_0300
     * @tc.desc Verify overwrite index 0 three times then at returns final value 30
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      buffer.set(0, Int.toByte(10));
      buffer.set(0, Int.toByte(20));
      buffer.set(0, Int.toByte(30));
      expect(buffer.at(0)).assertEqual(Int.toByte(30));
    });

    /**
     * @tc.name testArrayBufferAt0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_0400
     * @tc.desc Verify sequential pattern 0-9 written and read back at indices 0-9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(10);
      for (let i: int = 0; i < 10; i++) {
        buffer.set(i, Int.toByte(i));
      }
      for (let i: int = 0; i < 10; i++) {
        expect(buffer.at(i)).assertEqual(Int.toByte(i));
      }
    });

    /**
     * @tc.name testArrayBufferAt0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_0500
     * @tc.desc Verify alternating pattern 0 127 -128 repeated on 6-byte buffer reads correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(6);
      buffer.set(0, Int.toByte(0));
      buffer.set(1, Int.toByte(127));
      buffer.set(2, Int.toByte(-128));
      buffer.set(3, Int.toByte(0));
      buffer.set(4, Int.toByte(127));
      buffer.set(5, Int.toByte(-128));
      expect(buffer.at(0)).assertEqual(Int.toByte(0));
      expect(buffer.at(1)).assertEqual(Int.toByte(127));
      expect(buffer.at(2)).assertEqual(Int.toByte(-128));
      expect(buffer.at(3)).assertEqual(Int.toByte(0));
      expect(buffer.at(4)).assertEqual(Int.toByte(127));
      expect(buffer.at(5)).assertEqual(Int.toByte(-128));
    });

    /**
     * @tc.name testArrayBufferAt0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_0600
     * @tc.desc Verify write all zero then modify positions 0 3 6 reads updated and zero values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      for (let i: int = 0; i < 8; i++) {
        buffer.set(i, Int.toByte(0));
      }
      buffer.set(0, Int.toByte(10));
      buffer.set(3, Int.toByte(20));
      buffer.set(6, Int.toByte(30));
      expect(buffer.at(0)).assertEqual(Int.toByte(10));
      expect(buffer.at(3)).assertEqual(Int.toByte(20));
      expect(buffer.at(6)).assertEqual(Int.toByte(30));
      expect(buffer.at(1)).assertEqual(Int.toByte(0));
      expect(buffer.at(4)).assertEqual(Int.toByte(0));
      expect(buffer.at(7)).assertEqual(Int.toByte(0));
    });

    /**
     * @tc.name testArrayBufferAt0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_0700
     * @tc.desc Verify at(4) reads byte -1 from setting 0xFF as signed byte
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(10);
      buffer.set(4, Int.toByte(0xFF));
      expect(buffer.at(4)).assertEqual(Int.toByte(0xFF));
    });

    /**
     * @tc.name testArrayBufferAt0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_0800
     * @tc.desc Verify at(0) on 65536-byte large buffer reads first byte with different value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(65536);
      buffer.set(0, Int.toByte(0x55));
      expect(buffer.at(0)).assertEqual(Int.toByte(0x55));
    });

    /**
     * @tc.name testArrayBufferAt0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_0900
     * @tc.desc Verify at(32768) on 65536-byte large buffer middle reads correct byte
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(65536);
      buffer.set(32768, Int.toByte(0xAA));
      expect(buffer.at(32768)).assertEqual(Int.toByte(0xAA));
    });

    /**
     * @tc.name testArrayBufferAt0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_1000
     * @tc.desc Verify at(65535) on 65536-byte large buffer tail reads last byte
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(65536);
      buffer.set(65535, Int.toByte(127));
      expect(buffer.at(65535)).assertEqual(Int.toByte(127));
    });

    /**
     * @tc.name testArrayBufferAt0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_1100
     * @tc.desc Verify at(0x0) hex pos reads first byte
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(1);
      buf.set(0, Int.toByte(88));
      const r: byte = buf.at(0x0);
      expect(r).assertEqual(Int.toByte(88));
    });

    /**
     * @tc.name testArrayBufferAt0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_1200
     * @tc.desc Verify at(0b0) binary pos reads first byte
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(1);
      buf.set(0, Int.toByte(66));
      const r: byte = buf.at(0b0);
      expect(r).assertEqual(Int.toByte(66));
    });

    /**
     * @tc.name testArrayBufferAt0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_1300
     * @tc.desc Verify at(1) reads second byte
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(3);
      buf.set(1, Int.toByte(55));
      const r: byte = buf.at(1);
      expect(r).assertEqual(Int.toByte(55));
    });

    /**
     * @tc.name testArrayBufferAt0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_1400
     * @tc.desc Verify at(0x1) hex pos reads second byte
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(3);
      buf.set(1, Int.toByte(77));
      const r: byte = buf.at(0x1);
      expect(r).assertEqual(Int.toByte(77));
    });

    /**
     * @tc.name testArrayBufferAt0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_1500
     * @tc.desc Verify at(0b1) binary pos reads second byte
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(3);
      buf.set(1, Int.toByte(99));
      const r: byte = buf.at(0b1);
      expect(r).assertEqual(Int.toByte(99));
    });

    /**
     * @tc.name testArrayBufferAt0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_1600
     * @tc.desc Verify at(100) large pos throws IndexOutOfBoundsError on 10-byte buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(10);
      try {
        const r: byte = buf.at(100);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.name testArrayBufferAt0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_1700
     * @tc.desc Verify at(1000000) massively large pos throws error
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(10);
      try {
        const r: byte = buf.at(1000000);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.name testArrayBufferAt0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_1800
     * @tc.desc Verify at reads back byte 127 (max byte value)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(1);
      buf.set(0, Int.toByte(127));
      expect(buf.at(0)).assertEqual(Int.toByte(127));
    });

    /**
     * @tc.name testArrayBufferAt0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_1900
     * @tc.desc Verify at reads back byte -128 (min byte value)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(1);
      buf.set(0, Int.toByte(-128));
      expect(buf.at(0)).assertEqual(Int.toByte(-128));
    });

    /**
     * @tc.name testArrayBufferAt0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_2000
     * @tc.desc Verify at(0) on single-byte buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(1);
      buf.set(0, Int.toByte(42));
      expect(buf.at(0)).assertEqual(Int.toByte(42));
    });

    /**
     * @tc.name testArrayBufferAt0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_2100
     * @tc.desc Verify at() returns correct byte value 0x42
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(3);
      buf.set(0, Int.toByte(0x42));
      const v: byte = buf.at(0);
      expect(v).assertEqual(Int.toByte(0x42));
    });

    /**
     * @tc.name testArrayBufferAt0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_2200
     * @tc.desc Verify at() has no side effects on byteLength, content, detached
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const lenB: int = buf.byteLength;
      const d: boolean = buf.detached;
      buf.set(0, Int.toByte(0x33));
      buf.set(1, Int.toByte(0x44));
      buf.at(0);
      expect(buf.byteLength).assertEqual(lenB);
      expect(buf.detached).assertEqual(d);
      expect(buf.at(0)).assertEqual(Int.toByte(0x33));
      expect(buf.at(1)).assertEqual(Int.toByte(0x44));
    });

    /**
     * @tc.name testArrayBufferAt0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_2300
     * @tc.desc Verify at() does not modify resizable state
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(2, 8);
      const r: boolean = buf.resizable;
      buf.at(0);
      expect(buf.resizable).assertEqual(r);
    });

    /**
     * @tc.name testArrayBufferAt0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_2400
     * @tc.desc Verify at(0) reads 0xAB as signed byte = -85
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(1);
      buf.set(0, Int.toByte(0xAB));
      expect(buf.at(0)).assertEqual(Int.toByte(-85));
    });

    /**
     * @tc.name testArrayBufferAt0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_2500
     * @tc.desc Verify at(-1) throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(3);
      try {
        buf.at(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.name testArrayBufferAt0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_2600
     * @tc.desc Verify at(byteLength) on non-empty buffer throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(2);
      try {
        buf.at(2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.name testArrayBufferAt0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_2700
     * @tc.desc Verify at(0) on empty buffer throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(0);
      try {
        buf.at(0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.name testArrayBufferAt0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_2800
     * @tc.desc Verify at(pos) on buffer with data written at all positions reads correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(5);
      for (let i: int = 0; i < 5; i++) {
        buf.set(i, Int.toByte(i * 10));
      }
      for (let j: int = 0; j < 5; j++) {
        expect(buf.at(j)).assertEqual(Int.toByte(j * 10));
      }
    });

    /**
     * @tc.name testArrayBufferAt0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_2900
     * @tc.desc Verify at() with int variable as pos parameter reads correct byte
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      buf.set(0, Int.toByte(10));
      buf.set(1, Int.toByte(20));
      buf.set(2, Int.toByte(30));
      buf.set(3, Int.toByte(40));
      const p: int = 2;
      expect(buf.at(p)).assertEqual(Int.toByte(30));
    });

    /**
     * @tc.name testArrayBufferAt0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_3000
     * @tc.desc Verify at() with const int as pos parameter reads correct byte
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      buf.set(0, Int.toByte(10));
      buf.set(1, Int.toByte(20));
      buf.set(2, Int.toByte(30));
      buf.set(3, Int.toByte(40));
      const LAST: int = 3;
      expect(buf.at(LAST)).assertEqual(Int.toByte(40));
    });

    /**
     * @tc.name testArrayBufferAt0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_3100
     * @tc.desc Verify at() with int variable for negative index throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const neg: int = -1;
      try {
        buf.at(neg);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.name testArrayBufferAt0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_3200
     * @tc.desc Verify DataView setInt8 value is visible via buffer.at()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const dv: DataView = new DataView(buf);
      dv.setInt8(0, 42);
      expect(buf.at(0)).assertEqual(Int.toByte(42));
    });

    /**
     * @tc.name testArrayBufferAt0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_3300
     * @tc.desc Verify Int8Array set value is visible via buffer.at()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const view: Int8Array = new Int8Array(buf);
      view[0] = Int.toByte(-128);
      expect(buf.at(0)).assertEqual(Int.toByte(-128));
    });

    /**
     * @tc.name testArrayBufferAt0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_3400
     * @tc.desc Verify buffer.set value is visible via DataView.getInt8()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      buf.set(0, Int.toByte(99));
      const dv: DataView = new DataView(buf);
      expect(dv.getInt8(0)).assertEqual(Int.toByte(99));
    });

    /**
     * @tc.name testArrayBufferAt0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_3500
     * @tc.desc Verify buffer.at() returns byte modified by Uint8Array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const u8: Uint8Array = new Uint8Array(buf);
      u8[0] = Int.toByte(255);
      expect(buf.at(0)).assertEqual(Int.toByte(255));
    });
  });
}