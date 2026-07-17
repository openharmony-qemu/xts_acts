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

export default function arrayBufferProperty2Test(): void {
  describe('ArrayBufferProperty2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.name testArrayBufferProperty0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0010
     * @tc.desc Verify new ArrayBuffer(0x10) has byteLength 16 (hexadecimal)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(0x10);
      expect(buffer.byteLength).assertEqual(16);
      expect(buffer.detached).assertFalse();
      expect(buffer.resizable).assertFalse();
    });

    /**
     * @tc.name testArrayBufferProperty0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0020
     * @tc.desc Verify new ArrayBuffer(0o10) has byteLength 8 (octal)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(0o10);
      expect(buffer.byteLength).assertEqual(8);
      expect(buffer.detached).assertFalse();
      expect(buffer.resizable).assertFalse();
    });

    /**
     * @tc.name testArrayBufferProperty0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0030
     * @tc.desc Verify new ArrayBuffer(0b10) has byteLength 2 (binary)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(0b10);
      expect(buffer.byteLength).assertEqual(2);
      expect(buffer.detached).assertFalse();
      expect(buffer.resizable).assertFalse();
    });

    /**
     * @tc.name testArrayBufferProperty0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0040
     * @tc.desc Verify new ArrayBuffer(1e3) has byteLength 1000 (scientific notation)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(1e3);
      expect(buffer.byteLength).assertEqual(1000);
      expect(buffer.detached).assertFalse();
      expect(buffer.resizable).assertFalse();
    });

    /**
     * @tc.name testArrayBufferProperty0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0050
     * @tc.desc Verify new ArrayBuffer(0b100, 0b1000) has byteLength 4 and resizable true (binary both params)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(0b100, 0b1000);
      expect(buffer.byteLength).assertEqual(4);
      expect(buffer.detached).assertFalse();
      expect(buffer.resizable).assertTrue();
    });

    /**
     * @tc.name testArrayBufferProperty0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0060
     * @tc.desc Verify byteLength value of new ArrayBuffer(8) equals 8
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(8);
      const byteLengthValue: int = buffer.byteLength;
      expect(byteLengthValue).assertEqual(8);
    });

    /**
     * @tc.name testArrayBufferProperty0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0070
     * @tc.desc Verify detached property of new ArrayBuffer(8) is false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(8);
      const detachedValue: boolean = buffer.detached;
      expect(detachedValue).assertFalse();
    });

    /**
     * @tc.name testArrayBufferProperty0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0080
     * @tc.desc Verify resizable property of new ArrayBuffer(8) is false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(8);
      const resizableValue: boolean = buffer.resizable;
      expect(resizableValue).assertFalse();
    });

    /**
     * @tc.name testArrayBufferProperty0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0090
     * @tc.desc Verify byteLength reflects current accessible byte count after resize
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(8, 16);
      expect(buffer.byteLength).assertEqual(8);
      buffer.resize(12);
      expect(buffer.byteLength).assertEqual(12);
      buffer.resize(4);
      expect(buffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.name testArrayBufferProperty0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0100
     * @tc.desc Verify detached remains false after resize operations
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4, 8);
      expect(buffer.detached).assertFalse();
      buffer.resize(6);
      expect(buffer.detached).assertFalse();
      buffer.resize(2);
      expect(buffer.detached).assertFalse();
    });

    /**
     * @tc.name testArrayBufferProperty0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0110
     * @tc.desc Verify properties of large buffer (1000000 bytes)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(1000000);
      expect(buffer.byteLength).assertEqual(1000000);
      expect(buffer.detached).assertFalse();
      expect(buffer.resizable).assertFalse();
    });

    /**
     * @tc.name testArrayBufferProperty0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0120
     * @tc.desc Verify byteLength of large buffer after resize
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(500000, 1000000);
      expect(buffer.byteLength).assertEqual(500000);
      buffer.resize(800000);
      expect(buffer.byteLength).assertEqual(800000);
      buffer.resize(200000);
      expect(buffer.byteLength).assertEqual(200000);
    });

    /**
     * @tc.name testArrayBufferProperty0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0130
     * @tc.desc Verify new ArrayBuffer(0x80) has byteLength 128
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(0x80);
      expect(buf.byteLength).assertEqual(128);
    });

    /**
     * @tc.name testArrayBufferProperty0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0140
     * @tc.desc Verify new ArrayBuffer(127) has correct byteLength
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(127);
      expect(buf.byteLength).assertEqual(127);
    });

    /**
     * @tc.name testArrayBufferProperty0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0150
     * @tc.desc Verify new ArrayBuffer(1, 8) has correct byteLength
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(1, 8);
      expect(buf.byteLength).assertEqual(1);
    });

    /**
     * @tc.name testArrayBufferProperty0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0160
     * @tc.desc Verify new ArrayBuffer(0.0, 8.0) has correct byteLength
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(0.0, 8.0);
      expect(buf.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferProperty0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0170
     * @tc.desc Verify byteLength for constructor(0x10, 0x20) reads 16
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(0x10, 0x20);
      expect(buf.byteLength).assertEqual(16);
    });

    /**
     * @tc.name testArrayBufferProperty0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0180
     * @tc.desc Verify byteLength for constructor(5.0, 10.0) reads 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(5.0, 10.0);
      expect(buf.byteLength).assertEqual(5);
    });

    /**
     * @tc.name testArrayBufferProperty0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0190
     * @tc.desc Verify detached for new ArrayBuffer(16) is false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(16);
      expect(buf.detached).assertFalse();
    });

    /**
     * @tc.name testArrayBufferProperty0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0200
     * @tc.desc Verify detached for new ArrayBuffer(0x7F) is false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(0x7F);
      expect(buf.detached).assertFalse();
    });

    /**
     * @tc.name testArrayBufferProperty0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0210
     * @tc.desc Verify from(ValueArray<byte>) content consistency
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ValueArray<byte> = [Int.toByte(0x01), Int.toByte(0x02), Int.toByte(0x03), Int.toByte(0x04)];
      const buf: ArrayBuffer = ArrayBuffer.from(arr);
      expect(buf.at(0)).assertEqual(Int.toByte(0x01));
      expect(buf.at(1)).assertEqual(Int.toByte(0x02));
      expect(buf.at(2)).assertEqual(Int.toByte(0x03));
      expect(buf.at(3)).assertEqual(Int.toByte(0x04));
    });

    /**
     * @tc.name testArrayBufferProperty0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0220
     * @tc.desc Verify from(ValueArray) does not modify source
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valueArr: ValueArray<byte> = [Int.toByte(0x0A), Int.toByte(0x0B)];
      const result: ArrayBuffer = ArrayBuffer.from(valueArr);
      expect(valueArr[0]).assertEqual(Int.toByte(0x0A));
      expect(valueArr[1]).assertEqual(Int.toByte(0x0B));
    });

    /**
     * @tc.name testArrayBufferProperty0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0230
     * @tc.desc Verify from(Uint8Array) content matches original
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name testArrayBufferProperty0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0240
     * @tc.desc Verify from(double[]) empty returns byteLength 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: double[] = [];
      const buf: ArrayBuffer = ArrayBuffer.from(src);
      expect(buf.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferProperty0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0250
     * @tc.desc Verify from(FixedArray<byte>) empty returns byteLength 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fixed: FixedArray<byte> = [];
      const buf: ArrayBuffer = ArrayBuffer.from(fixed);
      expect(buf.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferProperty0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0260
     * @tc.desc Verify from(FixedArray<byte>) with inclusive byte values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fixed: FixedArray<byte> = [Int.toByte(-128), Int.toByte(127)];
      const buf: ArrayBuffer = ArrayBuffer.from(fixed);
      expect(buf.at(0)).assertEqual(Int.toByte(-128));
      expect(buf.at(1)).assertEqual(Int.toByte(127));
    });

    /**
     * @tc.name testArrayBufferProperty0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0270
     * @tc.desc Verify from(FixedArray<byte>) with binary literals
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fixed: FixedArray<byte> = [Int.toByte(0b10101010), Int.toByte(0b01010101)];
      const buf: ArrayBuffer = ArrayBuffer.from(fixed);
      expect(buf.at(0)).assertEqual(Int.toByte(-86));
      expect(buf.at(1)).assertEqual(Int.toByte(85));
    });

    /**
     * @tc.name testArrayBufferProperty0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0280
     * @tc.desc Verify from(double[]) 5 elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: double[] = [5.0, 10.0, 15.0, 20.0, 25.0];
      const buf: ArrayBuffer = ArrayBuffer.from(src);
      expect(buf.byteLength).assertEqual(5);
    });

    /**
     * @tc.name testArrayBufferProperty0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0290
     * @tc.desc Verify from(double[]) 10 elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: double[] = [5.0, 10.0, 15.0, 20.0, 25.0, 30.0, 35.0, 40.0, 45.0, 50.0];
      const buf: ArrayBuffer = ArrayBuffer.from(src);
      expect(buf.byteLength).assertEqual(10);
    });

    /**
     * @tc.name testArrayBufferProperty0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0300
     * @tc.desc Verify from(ArrayBuffer, 5, 3) with non-zero byteOffset
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: ArrayBuffer = ArrayBuffer.from("abcdefghij", "utf8");
      const buf: ArrayBuffer = ArrayBuffer.from(src, 5, 3);
      expect(buf.byteLength).assertEqual(3);
      expect(buf.at(0)).assertEqual(Int.toByte(0x66));
      expect(buf.at(1)).assertEqual(Int.toByte(0x67));
      expect(buf.at(2)).assertEqual(Int.toByte(0x68));
    });

    /**
     * @tc.name testArrayBufferProperty0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0310
     * @tc.desc Verify from(ArrayBuffer, 0, 5) copies first 5 bytes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: ArrayBuffer = ArrayBuffer.from("abcdefghij", "utf8");
      const buf: ArrayBuffer = ArrayBuffer.from(src, 0, 5);
      expect(buf.byteLength).assertEqual(5);
      expect(buf.at(0)).assertEqual(Int.toByte(0x61));
      expect(buf.at(1)).assertEqual(Int.toByte(0x62));
      expect(buf.at(2)).assertEqual(Int.toByte(0x63));
      expect(buf.at(3)).assertEqual(Int.toByte(0x64));
      expect(buf.at(4)).assertEqual(Int.toByte(0x65));
    });

    /**
     * @tc.name testArrayBufferProperty0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0320
     * @tc.desc Verify from(ArrayBuffer, 0, 0) returns empty
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: ArrayBuffer = ArrayBuffer.from("abc", "utf8");
      const buf: ArrayBuffer = ArrayBuffer.from(src, 0, 0);
      expect(buf.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferProperty0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0330
     * @tc.desc Verify from(ArrayBuffer, 0, 10) copies 10 bytes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: ArrayBuffer = ArrayBuffer.from("abcdefghij", "utf8");
      const buf: ArrayBuffer = ArrayBuffer.from(src, 0, 10);
      expect(buf.byteLength).assertEqual(10);
      expect(buf.at(0)).assertEqual(Int.toByte(0x61));
      expect(buf.at(1)).assertEqual(Int.toByte(0x62));
      expect(buf.at(2)).assertEqual(Int.toByte(0x63));
      expect(buf.at(3)).assertEqual(Int.toByte(0x64));
      expect(buf.at(4)).assertEqual(Int.toByte(0x65));
      expect(buf.at(5)).assertEqual(Int.toByte(0x66));
      expect(buf.at(6)).assertEqual(Int.toByte(0x67));
      expect(buf.at(7)).assertEqual(Int.toByte(0x68));
      expect(buf.at(8)).assertEqual(Int.toByte(0x69));
      expect(buf.at(9)).assertEqual(Int.toByte(0x6A));
    });

    /**
     * @tc.name testArrayBufferProperty0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0340
     * @tc.desc Verify slice(0) on zero-length buffer returns empty buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(0);
      const sliced: ArrayBuffer = buf.slice(0);
      expect(sliced.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferProperty0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0350
     * @tc.desc Verify constructor with length=0, maxByteLength=0 is resizable true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(0, 0);
      expect(buf.byteLength).assertEqual(0);
      expect(buf.resizable).assertTrue();
    });

    /**
     * @tc.name testArrayBufferProperty0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0360
     * @tc.desc Verify set after multiple writes on same position reads latest
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      buf.set(0, Int.toByte(10));
      buf.set(0, Int.toByte(20));
      buf.set(0, Int.toByte(30));
      expect(buf.at(0)).assertEqual(Int.toByte(30));
    });

    /**
     * @tc.name testArrayBufferProperty0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0370
     * @tc.desc Verify set then at on all positions works correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(5);
      for (let i: int = 0; i < 5; i++) {
        buf.set(i, Int.toByte(i * 10));
      }
      for (let j: int = 0; j < 5; j++) {
        expect(buf.at(j)).assertEqual(Int.toByte(j * 10));
      }
    });

    /**
     * @tc.name testArrayBufferProperty0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0380
     * @tc.desc Verify read default zero on uninitialized buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(3);
      expect(buf.at(0)).assertEqual(Int.toByte(0));
      expect(buf.at(1)).assertEqual(Int.toByte(0));
      expect(buf.at(2)).assertEqual(Int.toByte(0));
    });

    /**
     * @tc.name testArrayBufferProperty0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0390
     * @tc.desc Verify set writes then resize expand zeros new area
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(1, 5);
      buf.set(0, Int.toByte(99));
      buf.resize(4);
      expect(buf.at(1)).assertEqual(Int.toByte(0));
      expect(buf.at(2)).assertEqual(Int.toByte(0));
      expect(buf.at(3)).assertEqual(Int.toByte(0));
    });

    /**
     * @tc.name testArrayBufferProperty0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0400
     * @tc.desc Verify from double[] with 5 consecutive values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: double[] = [65.0, 66.0, 67.0, 68.0, 69.0];
      const buf: ArrayBuffer = ArrayBuffer.from(src);
      expect(buf.byteLength).assertEqual(5);
      expect(buf.at(0)).assertEqual(Int.toByte(65));
      expect(buf.at(4)).assertEqual(Int.toByte(69));
    });

    /**
     * @tc.name testArrayBufferProperty0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0410
     * @tc.desc Verify from string "ABC" utf8 then stringify back
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = ArrayBuffer.from("ABC", "utf8");
      const text: string = ArrayBuffer.stringify(buf, "utf8", 0, buf.byteLength);
      expect(text).assertEqual("ABC");
    });

    /**
     * @tc.name testArrayBufferProperty0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0420
     * @tc.desc Verify toString after resize still correct
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(2, 8);
      buf.resize(6);
      expect(buf.toString()).assertEqual('[object ArrayBuffer]');
    });

    /**
     * @tc.name testArrayBufferProperty0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0430
     * @tc.desc Verify isView(DataView on resizable buffer) is true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4, 16);
      const dv: DataView = new DataView(buf);
      expect(ArrayBuffer.isView(dv as Object)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferProperty0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0440
     * @tc.desc Verify getByteLength equals byteLength after resize
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(2, 8);
      buf.resize(6);
      expect(buf.getByteLength()).assertEqual(buf.byteLength);
    });

    /**
     * @tc.name testArrayBufferProperty0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0450
     * @tc.desc Verify from(ArrayBuffer, 1, 2) content matches source
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: ArrayBuffer = new ArrayBuffer(4);
      src.set(0, Int.toByte(0x41));
      src.set(1, Int.toByte(0x42));
      src.set(2, Int.toByte(0x43));
      src.set(3, Int.toByte(0x44));
      const buf: ArrayBuffer = ArrayBuffer.from(src, 1, 2);
      expect(buf.at(0)).assertEqual(Int.toByte(0x42));
      expect(buf.at(1)).assertEqual(Int.toByte(0x43));
    });

    /**
     * @tc.name testArrayBufferProperty0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0460
     * @tc.desc Verify atomicStore and atomicLoad on large buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(128);
      buf.atomicStoreI32(0, 0, 123456789);
      const r: long = buf.atomicLoadI32(0, 0);
      expect(r).assertEqual(123456789);
    });

    /**
     * @tc.name testArrayBufferProperty0047
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0470
     * @tc.desc Verify two separate buffers with same params are distinct objects
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf1: ArrayBuffer = new ArrayBuffer(4, 16);
      const buf2: ArrayBuffer = new ArrayBuffer(4, 16);
      buf1.resize(8)
      expect(buf1.byteLength).assertEqual(8);
      expect(buf2.byteLength).assertEqual(4);
    });

    /**
     * @tc.name testArrayBufferProperty0048
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0480
     * @tc.desc Verify modifying one buffer does not affect another
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf1: ArrayBuffer = new ArrayBuffer(4);
      const buf2: ArrayBuffer = new ArrayBuffer(4);
      buf1.set(0, Int.toByte(0x42));
      expect(buf2.at(0)).assertEqual(Int.toByte(0));
    });

    /**
     * @tc.name testArrayBufferProperty0049
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0490
     * @tc.desc Verify slice result is independent from original buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(6);
      buf.set(0, Int.toByte(1));
      buf.set(1, Int.toByte(2));
      const sliced: ArrayBuffer = buf.slice(0, 3);
      buf.set(0, Int.toByte(100));
      expect(sliced.at(0)).assertEqual(Int.toByte(1));
    });

    /**
     * @tc.name testArrayBufferProperty0050
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0500
     * @tc.desc Verify modifying slice does not affect original buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(6);
      buf.set(0, Int.toByte(1));
      buf.set(1, Int.toByte(2));
      const sliced: ArrayBuffer = buf.slice(0, 3);
      sliced.set(0, Int.toByte(200));
      expect(buf.at(0)).assertEqual(Int.toByte(1));
    });

    /**
     * @tc.name testArrayBufferProperty0051
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0510
     * @tc.desc Verify from(ArrayBuffer) creates independent copy
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: ArrayBuffer = new ArrayBuffer(2);
      src.set(0, Int.toByte(0xAA));
      const buf: ArrayBuffer = ArrayBuffer.from(src, 0, 2);
      buf.set(0, Int.toByte(0xBB));
      expect(src.at(0)).assertEqual(Int.toByte(0xAA));
    });

    /**
     * @tc.name testArrayBufferProperty0052
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0520
     * @tc.desc Verify from(ValueArray) modifying source array does not affect buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: ValueArray<byte> = [Int.toByte(10), Int.toByte(20), Int.toByte(30)];
      const buf: ArrayBuffer = ArrayBuffer.from(src);
      src[0] = 99;
      expect(buf.at(0)).assertEqual(Int.toByte(10));
    });

    /**
     * @tc.name testArrayBufferProperty0053
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0530
     * @tc.desc Verify from(FixedArray) modifying buffer does not affect source
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: FixedArray<byte> = [Int.toByte(1), Int.toByte(2), Int.toByte(3)];
      const buf: ArrayBuffer = ArrayBuffer.from(src);
      buf.set(0, Int.toByte(100));
      expect(src[0]).assertEqual(1);
    });

    /**
     * @tc.name testArrayBufferProperty0054
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0540
     * @tc.desc Verify from(double[]) modifying source array does not affect buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: double[] = [65.0, 66.0, 67.0];
      const buf: ArrayBuffer = ArrayBuffer.from(src);
      src[0] = 0.0;
      expect(buf.at(0)).assertEqual(Int.toByte(65));
    });

    /**
     * @tc.name testArrayBufferProperty0055
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0550
     * @tc.desc Verify fromObject does not modify source ArrayBuffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: ArrayBuffer = new ArrayBuffer(3);
      src.set(0, Int.toByte(0x11));
      src.set(1, Int.toByte(0x22));
      src.set(2, Int.toByte(0x33));
      const buf: ArrayBuffer = ArrayBuffer.fromObject(src as Object, 0, 3);
      expect(src.at(0)).assertEqual(Int.toByte(0x11));
      expect(src.at(1)).assertEqual(Int.toByte(0x22));
      expect(src.at(2)).assertEqual(Int.toByte(0x33));
    });

    /**
     * @tc.name testArrayBufferProperty0056
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0560
     * @tc.desc Verify resize multiple times: final byteLength is correct
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(1, 10);
      buf.resize(3);
      expect(buf.byteLength).assertEqual(3);
      buf.resize(7);
      expect(buf.byteLength).assertEqual(7);
      buf.resize(10);
      expect(buf.byteLength).assertEqual(10);
    });

    /**
     * @tc.name testArrayBufferProperty0057
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0570
     * @tc.desc Verify resize shrink sequence: byteLength shrinks correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8, 10);
      buf.resize(5);
      expect(buf.byteLength).assertEqual(5);
      buf.resize(2);
      expect(buf.byteLength).assertEqual(2);
      buf.resize(0);
      expect(buf.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferProperty0058
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0580
     * @tc.desc Verify nested slice: outer slice from inner slice works
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      buf.set(0, Int.toByte(10));
      buf.set(1, Int.toByte(20));
      buf.set(2, Int.toByte(30));
      const inner: ArrayBuffer = buf.slice(0, 6);
      const outer: ArrayBuffer = inner.slice(1, 3);
      expect(outer.at(0)).assertEqual(Int.toByte(20));
    });

    /**
     * @tc.name testArrayBufferProperty0059
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0590
     * @tc.desc Verify set then at returns stored byte value 42
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      buf.set(0, Int.toByte(42));
      const v: byte = buf.at(0);
      expect(v).assertEqual(Int.toByte(42));
    });

    /**
     * @tc.name testArrayBufferProperty0060
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0600
     * @tc.desc Verify set does not change byteLength
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const before: int = buf.byteLength;
      buf.set(0, Int.toByte(99));
      expect(buf.byteLength).assertEqual(before);
    });

    /**
     * @tc.name testArrayBufferProperty0061
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0610
     * @tc.desc Verify resize expands new region with zero byte default
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(2, 6);
      buf.resize(4);
      expect(buf.at(3)).assertEqual(Int.toByte(0));
    });

    /**
     * @tc.name testArrayBufferProperty0062
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0620
     * @tc.desc Verify resize expanded region preserves old data
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(2, 6);
      buf.set(0, Int.toByte(11));
      buf.set(1, Int.toByte(22));
      buf.resize(4);
      expect(buf.at(0)).assertEqual(Int.toByte(11));
      expect(buf.at(1)).assertEqual(Int.toByte(22));
    });

    /**
     * @tc.name testArrayBufferProperty0063
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0630
     * @tc.desc Verify shrink then expand: new region is zero-filled
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8, 12);
      buf.set(0, Int.toByte(55));
      buf.resize(2);
      buf.resize(6);
      expect(buf.at(5)).assertEqual(Int.toByte(0));
    });

    /**
     * @tc.name testArrayBufferProperty0064
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0640
     * @tc.desc Verify shrink then expand: old data in remaining region preserved
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8, 12);
      buf.set(0, Int.toByte(33));
      buf.set(1, Int.toByte(44));
      buf.resize(1);
      buf.resize(4);
      expect(buf.at(0)).assertEqual(Int.toByte(33));
    });

    /**
     * @tc.name testArrayBufferProperty0065
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0650
     * @tc.desc Verify slice does not modify original buffer data
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      buf.set(0, Int.toByte(10));
      buf.set(1, Int.toByte(20));
      buf.slice(0, 2);
      expect(buf.at(0)).assertEqual(Int.toByte(10));
      expect(buf.at(1)).assertEqual(Int.toByte(20));
    });

    /**
     * @tc.name testArrayBufferProperty0066
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0660
     * @tc.desc Verify slice result data is independent (modify original does not affect slice)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      buf.set(0, Int.toByte(10));
      const sliced: ArrayBuffer = buf.slice(0, 2);
      buf.set(0, Int.toByte(99));
      expect(sliced.at(0)).assertEqual(Int.toByte(10));
    });

    /**
     * @tc.name testArrayBufferProperty0067
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0670
     * @tc.desc Verify resize before and after byteLength correctly syncs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(3, 8);
      const before: int = buf.byteLength;
      buf.resize(7);
      expect(before).assertEqual(3);
      expect(buf.byteLength).assertEqual(7);
    });

    /**
     * @tc.name testArrayBufferProperty0068
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0680
     * @tc.desc Verify resize does not change resizable state (stays true)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(3, 8);
      buf.resize(5);
      expect(buf.resizable).assertTrue();
    });

    /**
     * @tc.name testArrayBufferProperty0069
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0690
     * @tc.desc Verify resize does not change detached state (stays false)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(3, 8);
      buf.resize(5);
      expect(buf.detached).assertFalse();
    });

    /**
     * @tc.name testArrayBufferProperty0070
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0700
     * @tc.desc Verify from(string, utf8) and stringify round-trip works
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = ArrayBuffer.from("Hello", "utf8");
      const text: string = ArrayBuffer.stringify(buf, "utf8", 0, buf.byteLength);
      expect(text).assertEqual("Hello");
    });

    /**
     * @tc.name testArrayBufferProperty0071
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0710
     * @tc.desc Verify bytesLength returns same value for identical inputs
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const l1: int = ArrayBuffer.bytesLength("test", "utf8");
      const l2: int = ArrayBuffer.bytesLength("test", "utf8");
      expect(l1).assertEqual(l2);
    });

    /**
     * @tc.name testArrayBufferProperty0072
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0720
     * @tc.desc Verify toString does not modify buffer content
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      buf.set(0, Int.toByte(5));
      buf.toString();
      expect(buf.at(0)).assertEqual(Int.toByte(5));
    });

    /**
     * @tc.name testArrayBufferProperty0073
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0730
     * @tc.desc Verify resize then set then at in sequence works
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(2, 8);
      buf.resize(5);
      buf.set(4, Int.toByte(123));
      expect(buf.at(4)).assertEqual(Int.toByte(123));
    });

    /**
     * @tc.name testArrayBufferProperty0074
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0740
     * @tc.desc Verify from then slice chain call works
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: ValueArray<byte> = [Int.toByte(1), Int.toByte(2), Int.toByte(3), Int.toByte(4), Int.toByte(5)];
      const buf: ArrayBuffer = ArrayBuffer.from(src);
      const part: ArrayBuffer = buf.slice(1, 4);
      expect(part.byteLength).assertEqual(3);
      expect(part.at(0)).assertEqual(Int.toByte(2));
    });

    /**
     * @tc.name testArrayBufferProperty0075
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0750
     * @tc.desc Verify resize then slice combination preserves data in old region
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(2, 10);
      buf.set(0, Int.toByte(5));
      buf.set(1, Int.toByte(6));
      buf.resize(5);
      buf.set(2, Int.toByte(7));
      const part: ArrayBuffer = buf.slice(0, 5);
      expect(part.byteLength).assertEqual(5);
      expect(part.at(2)).assertEqual(Int.toByte(7));
    });

    /**
     * @tc.name testArrayBufferProperty0076
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0760
     * @tc.desc Verify resize then from copies correct content
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(2, 8);
      buf.set(0, Int.toByte(10));
      buf.resize(4);
      buf.set(3, Int.toByte(20));
      const copied: ArrayBuffer = ArrayBuffer.from(buf, 0, 4);
      expect(copied.at(0)).assertEqual(Int.toByte(10));
      expect(copied.at(3)).assertEqual(Int.toByte(20));
    });

    /**
     * @tc.name testArrayBufferProperty0077
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0770
     * @tc.desc Verify from(double[]) truncates floats to byte values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: double[] = [65.7, 66.2, 67.9];
      const buf: ArrayBuffer = ArrayBuffer.from(src);
      expect(buf.at(0)).assertEqual(Int.toByte(65));
      expect(buf.at(1)).assertEqual(Int.toByte(66));
      expect(buf.at(2)).assertEqual(Int.toByte(67));
    });

    /**
     * @tc.name testArrayBufferProperty0078
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0780
     * @tc.desc Verify from(double[]) negative float truncation to byte
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: double[] = [-5.9, -3.2, -1.0];
      const buf: ArrayBuffer = ArrayBuffer.from(src);
      expect(buf.at(0)).assertEqual(Int.toByte(-5));
      expect(buf.at(1)).assertEqual(Int.toByte(-3));
      expect(buf.at(2)).assertEqual(Int.toByte(-1));
    });

    /**
     * @tc.name testArrayBufferProperty0079
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0790
     * @tc.desc Verify from(double[]) overflow byte range wraps around
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: double[] = [128.0, 255.0, 256.0];
      const buf: ArrayBuffer = ArrayBuffer.from(src);
      expect(buf.at(0)).assertEqual(Int.toByte(-128));
      expect(buf.at(1)).assertEqual(Int.toByte(-1));
      expect(buf.at(2)).assertEqual(Int.toByte(0));
    });

    /**
     * @tc.name testArrayBufferProperty0080
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0800
     * @tc.desc Verify from(double[]) negative overflow beyond byte range wraps
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: double[] = [-129.0, -256.0, -384.0];
      const buf: ArrayBuffer = ArrayBuffer.from(src);
      expect(buf.at(0)).assertEqual(Int.toByte(127));
      expect(buf.at(1)).assertEqual(Int.toByte(0));
      expect(buf.at(2)).assertEqual(Int.toByte(-128));
    });

    /**
     * @tc.name testArrayBufferProperty0081
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0810
     * @tc.desc Verify from(double[]) truncation edge cases [0.5, 0.49, -0.5, -0.49]
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: double[] = [0.5, 0.49, (-0.5), (-0.49)];
      const buf: ArrayBuffer = ArrayBuffer.from(src);
      expect(buf.at(0)).assertEqual(Int.toByte(0));
      expect(buf.at(1)).assertEqual(Int.toByte(0));
      expect(buf.at(2)).assertEqual(Int.toByte(0));
      expect(buf.at(3)).assertEqual(Int.toByte(0));
    });

    /**
     * @tc.name testArrayBufferProperty0082
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0820
     * @tc.desc Verify from(double[]) NaN converts to 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: double[] = [Double.NaN];
      const buf: ArrayBuffer = ArrayBuffer.from(src);
      expect(buf.at(0)).assertEqual(Int.toByte(0));
    });

    /**
     * @tc.name testArrayBufferProperty0083
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0830
     * @tc.desc Verify from(double[]) Number.MAX_VALUE wraps to -1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: double[] = [1.7976931348623157e+308];
      const buf: ArrayBuffer = ArrayBuffer.from(src);
      expect(buf.at(0)).assertEqual(Int.toByte(-1));
    });

    /**
     * @tc.name testArrayBufferProperty0084
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0840
     * @tc.desc Verify from(double[]) 2000.0 wraps: 2000 % 256 = 208 -> byte -48
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: double[] = [2000.0];
      const buf: ArrayBuffer = ArrayBuffer.from(src);
      expect(buf.at(0)).assertEqual(Int.toByte(-48));
    });

    /**
     * @tc.name testArrayBufferProperty0085
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0850
     * @tc.desc Verify from(double[]) -300.0 wraps: -300 % 256 = -44 -> byte -44
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: double[] = [-300.0];
      const buf: ArrayBuffer = ArrayBuffer.from(src);
      expect(buf.at(0)).assertEqual(Int.toByte(-44));
    });

    /**
     * @tc.name testArrayBufferProperty0086
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0860
     * @tc.desc Verify from(double[]) scientific notation values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: double[] = [1.1e+1, 2.2e+1, 3.3e+1];
      const buf: ArrayBuffer = ArrayBuffer.from(src);
      expect(buf.at(0)).assertEqual(Int.toByte(11));
      expect(buf.at(1)).assertEqual(Int.toByte(22));
      expect(buf.at(2)).assertEqual(Int.toByte(33));
    });

    /**
     * @tc.name testArrayBufferProperty0087
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0870
     * @tc.desc Verify constructor number overload length fractional truncation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4.7);
      expect(buf.byteLength).assertEqual(4);
    });

    /**
     * @tc.name testArrayBufferProperty0088
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0880
     * @tc.desc Verify constructor number overload maxByteLength fractional truncation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(3, 8.9);
      expect(buf.byteLength).assertEqual(3);
      expect(buf.resizable).assertTrue();
    });

    /**
     * @tc.name testArrayBufferProperty0089
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0890
     * @tc.desc Verify constructor number overload length=0.999 truncates to 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(0.999);
      expect(buf.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferProperty0090
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0900
     * @tc.desc Verify int and number constructor overload produce same byteLength for same value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bufInt: ArrayBuffer = new ArrayBuffer(5);
      const bufNum: ArrayBuffer = new ArrayBuffer(5.0);
      expect(bufInt.byteLength).assertEqual(bufNum.byteLength);
    });

    /**
     * @tc.name testArrayBufferProperty0091
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0910
     * @tc.desc Verify slice number overload begin fractional truncation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(5);
      buf.set(0, Int.toByte(10));
      buf.set(1, Int.toByte(20));
      buf.set(2, Int.toByte(30));
      const sliced: ArrayBuffer = buf.slice(1.7, 3.2);
      expect(sliced.byteLength).assertEqual(2);
      expect(sliced.at(0)).assertEqual(Int.toByte(20));
    });

    /**
     * @tc.name testArrayBufferProperty0092
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0920
     * @tc.desc Verify from(double[]) -128.0 stays -128 (byte min)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: double[] = [-128.0];
      const buf: ArrayBuffer = ArrayBuffer.from(src);
      expect(buf.at(0)).assertEqual(Int.toByte(-128));
    });

    /**
     * @tc.name testArrayBufferProperty0093
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0930
     * @tc.desc Verify from(double[]) 127.999 truncates to 127 (byte max)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: double[] = [127.999];
      const buf: ArrayBuffer = ArrayBuffer.from(src);
      expect(buf.at(0)).assertEqual(Int.toByte(127));
    });

    /**
     * @tc.name testArrayBufferProperty0094
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0940
     * @tc.desc Verify from(double[]) -128.5 truncates to -128
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: double[] = [-128.5];
      const buf: ArrayBuffer = ArrayBuffer.from(src);
      expect(buf.at(0)).assertEqual(Int.toByte(-128));
    });

    /**
     * @tc.name testArrayBufferProperty0095
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0950
     * @tc.desc Verify from(double[]) 0e0 and 1e1 scientific notation values
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: double[] = [0e0, 1e1, 1.5e1];
      const buf: ArrayBuffer = ArrayBuffer.from(src);
      expect(buf.at(0)).assertEqual(Int.toByte(0));
      expect(buf.at(1)).assertEqual(Int.toByte(10))
      expect(buf.at(2)).assertEqual(Int.toByte(15));
    });

    /**
     * @tc.name testArrayBufferProperty0096
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0960
     * @tc.desc Verify all bytes are zero in initialized buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(3);
      buf.set(0, Int.toByte(0));
      buf.set(1, Int.toByte(0));
      buf.set(2, Int.toByte(0));
      for (let i: int = 0; i < 3; i++) {
        expect(buf.at(i)).assertEqual(Int.toByte(0));
      }
    });

    /**
     * @tc.name testArrayBufferProperty0097
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0970
     * @tc.desc Verify byte boundary values [127, -128] write then read
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(2);
      buf.set(0, Int.toByte(127));
      buf.set(1, Int.toByte(-128));
      expect(buf.at(0)).assertEqual(Int.toByte(127));
      expect(buf.at(1)).assertEqual(Int.toByte(-128));
    });

    /**
     * @tc.name testArrayBufferProperty0098
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0980
     * @tc.desc Verify same position overwrite returns latest value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      buf.set(0, Int.toByte(1));
      buf.set(0, Int.toByte(2));
      buf.set(0, Int.toByte(3));
      expect(buf.at(0)).assertEqual(Int.toByte(3));
    });

    /**
     * @tc.name testArrayBufferProperty0099
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_0990
     * @tc.desc Verify write all zero, read confirm, then overwrite first byte
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(3);
      buf.set(0, Int.toByte(0));
      buf.set(1, Int.toByte(0));
      buf.set(2, Int.toByte(0));
      expect(buf.at(0)).assertEqual(Int.toByte(0));
      buf.set(0, Int.toByte(100));
      expect(buf.at(0)).assertEqual(Int.toByte(100));
    });

    /**
     * @tc.name testArrayBufferProperty0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_1000
     * @tc.desc Verify max value at middle position does not affect neighbors
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(3);
      buf.set(0, Int.toByte(5));
      buf.set(1, Int.toByte(127));
      buf.set(2, Int.toByte(5));
      expect(buf.at(1)).assertEqual(Int.toByte(127));
      expect(buf.at(0)).assertEqual(Int.toByte(5));
    });

    /**
     * @tc.name testArrayBufferProperty0101
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_1010
     * @tc.desc Verify write min value (-128) and read back
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(1);
      buf.set(0, Int.toByte(-128));
      expect(buf.at(0)).assertEqual(Int.toByte(-128));
    });

    /**
     * @tc.name testArrayBufferProperty0102
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_1020
     * @tc.desc Verify at overflow throws IndexOutOfBoundsError and buffer unchanged
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      try {
        buf.at(10);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
      expect(buf.byteLength).assertEqual(4);
    });

    /**
     * @tc.name testArrayBufferProperty0103
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_1030
     * @tc.desc Verify set overflow throws and data unchanged
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      buf.set(0, Int.toByte(55));
      try {
        buf.set(10, Int.toByte(99));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
      expect(buf.at(0)).assertEqual(Int.toByte(55));
    });

    /**
     * @tc.name testArrayBufferProperty0104
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_1040
     * @tc.desc Verify resize RangeError leaves buffer state unchanged
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name testArrayBufferProperty0105
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_1050
     * @tc.desc Verify resize(0) then resize to positive recovers write
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(3, 8);
      buf.resize(0);
      buf.resize(4);
      buf.set(3, Int.toByte(66));
      expect(buf.at(3)).assertEqual(Int.toByte(66));
    });

    /**
     * @tc.name testArrayBufferProperty0106
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_1060
     * @tc.desc Verify from(str).stringify round-trip consistency
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = ArrayBuffer.from("ABC", "utf8");
      const text: string = ArrayBuffer.stringify(buf, "utf8", 0, buf.byteLength);
      expect(text).assertEqual("ABC");
      const len: int = ArrayBuffer.bytesLength(text, "utf8");
      expect(len).assertEqual(3);
    });

    /**
     * @tc.name testArrayBufferProperty0107
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_1070
     * @tc.desc Verify resize after set preserves data in retained region
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4, 8);
      buf.set(0, Int.toByte(33));
      buf.set(1, Int.toByte(44));
      buf.resize(2);
      expect(buf.at(0)).assertEqual(Int.toByte(33));
      expect(buf.at(1)).assertEqual(Int.toByte(44));
    });

    /**
     * @tc.name testArrayBufferProperty0108
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_1080
     * @tc.desc Verify DataView float32 round-trip through ArrayBuffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const dv: DataView = new DataView(buf);
      dv.setFloat32(0, 1.5);
      expect(dv.getFloat32(0)).assertClose(1.5, 0.0001);
    });

    /**
     * @tc.name testArrayBufferProperty0109
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_1090
     * @tc.desc Verify ArrayBuffer byteLength property read
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(10);
      expect(buf.byteLength).assertEqual(10);
    });

    /**
     * @tc.name testArrayBufferProperty0110
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_1100
     * @tc.desc Verify ArrayBuffer byteLength after resize updates
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(1, 8);
      buf.resize(5);
      expect(buf.byteLength).assertEqual(5);
    });

    /**
     * @tc.name testArrayBufferProperty0111
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_1110
     * @tc.desc Verify ArrayBuffer byteLength on 0-length buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(0);
      expect(buf.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferProperty0112
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_1120
     * @tc.desc Verify ArrayBuffer byteLength on 0x7F-length buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(0x7F);
      expect(buf.byteLength).assertEqual(127);
    });

    /**
     * @tc.name testArrayBufferProperty0113
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_1130
     * @tc.desc Verify length=1000000 (million) buffer byteLength
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(1000000);
      expect(buf.byteLength).assertEqual(1000000);
    });

    /**
     * @tc.name testArrayBufferProperty0114
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_1140
     * @tc.desc Verify length=100000000 (hundred million) buffer byteLength
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(100000000);
      expect(buf.byteLength).assertEqual(100000000);
    });

    /**
     * @tc.name testArrayBufferProperty0115
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_1150
     * @tc.desc Verify non-resizable buffer: byteLength=32 and resizable is false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(32);
      expect(buf.byteLength).assertEqual(32);
      expect(buf.resizable).assertFalse();
    });

    /**
     * @tc.name testArrayBufferProperty0116
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_1160
     * @tc.desc Verify DataView.buffer references the same ArrayBuffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const dv: DataView = new DataView(buf);
      expect(dv.buffer).assertEqual(buf);
    });

    /**
     * @tc.name testArrayBufferProperty0117
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_1170
     * @tc.desc Verify writing to ArrayBuffer is visible through DataView
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      buf.set(0, Int.toByte(65));
      buf.set(1, Int.toByte(66));
      const dv: DataView = new DataView(buf);
      expect(dv.getUint8(0)).assertEqual(65);
      expect(dv.getUint8(1)).assertEqual(66);
    });

    /**
     * @tc.name testArrayBufferProperty0118
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_1180
     * @tc.desc Verify writing to DataView is visible through ArrayBuffer at()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const dv: DataView = new DataView(buf);
      dv.setUint8(0, 77);
      expect(buf.at(0)).assertEqual(Int.toByte(77));
    });

    /**
     * @tc.name testArrayBufferProperty0119
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_1190
     * @tc.desc Verify DataView and ArrayBuffer share same data at same byteOffset
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      buf.set(2, Int.toByte(88));
      const dv: DataView = new DataView(buf);
      expect(dv.getUint8(2)).assertEqual(88);
    });

    /**
     * @tc.name testArrayBufferProperty0120
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_1200
     * @tc.desc Verify ArrayBuffer resize shrink: DataView can still read remaining region
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(6, 10);
      const dv: DataView = new DataView(buf);
      buf.resize(3);
      expect(dv.getUint8(2)).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferProperty0121
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_1210
     * @tc.desc Verify ArrayBuffer resize shrink: DataView reading truncated region throws
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(6, 10);
      const dv: DataView = new DataView(buf);
      buf.resize(3);
      try {
        dv.getUint8(5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.name testArrayBufferProperty0122
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_1220
     * @tc.desc Verify multiple DataViews sharing same ArrayBuffer see each other's writes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const dv1: DataView = new DataView(buf);
      const dv2: DataView = new DataView(buf);
      dv1.setUint8(0, 55);
      expect(dv2.getUint8(0)).assertEqual(55);
    });

    /**
     * @tc.name testArrayBufferProperty0123
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_1230
     * @tc.desc Verify DataView write int32 then ArrayBuffer at() reads individual bytes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const dv: DataView = new DataView(buf);
      dv.setInt32(0, 16909060);
      expect(buf.at(0)).assertEqual(Int.toByte(1));
      expect(buf.at(1)).assertEqual(Int.toByte(2));
    });

    /**
     * @tc.name testArrayBufferProperty0124
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_1240
     * @tc.desc Verify ArrayBuffer at() write then DataView reads as int32
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      buf.set(0, Int.toByte(1));
      buf.set(1, Int.toByte(2));
      buf.set(2, Int.toByte(3));
      buf.set(3, Int.toByte(4));
      const dv: DataView = new DataView(buf);
      expect(dv.getInt32(0)).assertEqual(16909060);
    });

    /**
     * @tc.name testArrayBufferProperty0125
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_1250
     * @tc.desc Verify multiple DataViews at different offsets write independently
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const dv1: DataView = new DataView(buf, 0, 4);
      const dv2: DataView = new DataView(buf, 4, 4);
      dv1.setInt32(0, 1111);
      dv2.setInt32(0, 2222);
      const r1: int = (new DataView(buf, 0, 4)).getInt32(0);
      const r2: int = (new DataView(buf, 4, 4)).getInt32(0);
      expect(r1).assertEqual(1111);
      expect(r2).assertEqual(2222);
    });

    /**
     * @tc.name testArrayBufferProperty0126
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_1260
     * @tc.desc Verify DataView write then ArrayBuffer slice contains written data
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const dv: DataView = new DataView(buf);
      dv.setUint8(2, 99);
      const part: ArrayBuffer = buf.slice(0, 4);
      expect(part.at(2)).assertEqual(Int.toByte(99));
    });

    /**
     * @tc.name testArrayBufferProperty0127
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_PROPERTY_1270
     * @tc.desc Verify ArrayBuffer resize then DataView buffer property still points to same object
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferProperty0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(3, 8);
      const dv: DataView = new DataView(buf);
      buf.resize(6);
      expect(dv.buffer).assertEqual(buf);
    });
