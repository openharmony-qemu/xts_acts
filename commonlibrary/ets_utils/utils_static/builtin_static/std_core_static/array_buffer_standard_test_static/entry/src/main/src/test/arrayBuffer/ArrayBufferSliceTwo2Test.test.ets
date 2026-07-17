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
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function arrayBufferSliceTwo2Test(): void {
  describe('ArrayBufferSliceTwo2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.name testArrayBufferSliceTwo0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_0100
     * @tc.desc Verify slice(-0.0,2.0) with negative zero decimal copies first 2 bytes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.set(0, Int.toByte(10));
      buffer.set(1, Int.toByte(20));
      buffer.set(2, Int.toByte(30));
      buffer.set(3, Int.toByte(40));
      const result: ArrayBuffer = buffer.slice(-0.0, 2.0);
      expect(result.byteLength).assertEqual(2);
      expect(result.at(0)).assertEqual(Int.toByte(10));
      expect(result.at(1)).assertEqual(Int.toByte(20));
    });

    /**
     * @tc.name testArrayBufferSliceTwo0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_0200
     * @tc.desc Verify slice(Double.POSITIVE_INFINITY,4) with positive infinity begin yields empty
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.set(0, Int.toByte(10));
      const result: ArrayBuffer = buffer.slice(Double.POSITIVE_INFINITY, 4);
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferSliceTwo0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_0300
     * @tc.desc Verify slice(2,Double.NEGATIVE_INFINITY) with negative infinity end yields byteLength 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.set(0, Int.toByte(10));
      const result: ArrayBuffer = buffer.slice(2, Double.NEGATIVE_INFINITY);
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferSliceTwo0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_0400
     * @tc.desc Verify slice(1e3,1e3+1) with scientific notation beyond byteLength yields empty
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.set(0, Int.toByte(10));
      const result: ArrayBuffer = buffer.slice(1e3, 1e3 + 1);
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferSliceTwo0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_0500
     * @tc.desc Verify slice(1e0,4e0) with scientific notation copies bytes from index 1 to 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.set(0, Int.toByte(10));
      buffer.set(1, Int.toByte(20));
      buffer.set(2, Int.toByte(30));
      buffer.set(3, Int.toByte(40));
      const result: ArrayBuffer = buffer.slice(1e0, 4e0);
      expect(result.byteLength).assertEqual(3);
      expect(result.at(0)).assertEqual(Int.toByte(20));
      expect(result.at(1)).assertEqual(Int.toByte(30));
      expect(result.at(2)).assertEqual(Int.toByte(40));
    });

    /**
     * @tc.name testArrayBufferSliceTwo0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_0600
     * @tc.desc Verify slice(0,-2.5) with negative decimal end coerces to offset from end
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(8);
      for (let i: int = 0; i < 8; i++) {
        buffer.set(i, Int.toByte(i + 10));
      }
      const result: ArrayBuffer = buffer.slice(0, -2.5);
      expect(result.byteLength).assertEqual(6);
      for (let i: int = 0; i < 6; i++) {
        expect(result.at(i)).assertEqual(buffer.at(i));
      }
    });

    /**
     * @tc.name testArrayBufferSliceTwo0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_0700
     * @tc.desc Verify slice(Double.MAX_VALUE,Double.MAX_VALUE+1) with max double yields empty
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.set(0, Int.toByte(10));
      const result: ArrayBuffer = buffer.slice(Double.MAX_VALUE, Double.MAX_VALUE + 1);
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferSliceTwo0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_0800
     * @tc.desc Verify slice(Double.MIN_VALUE,Double.MIN_VALUE+1) with min double yields 1-byte result
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.set(0, Int.toByte(10));
      const result: ArrayBuffer = buffer.slice(Double.MIN_VALUE, Double.MIN_VALUE + 1);
      expect(result.byteLength).assertEqual(1);
      expect(result.at(0)).assertEqual(Int.toByte(10));
    });

    /**
     * @tc.name testArrayBufferSliceTwo0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_0900
     * @tc.desc Verify slice(0,Double.MIN_VALUE) with min double end coerces to 0 and yields byteLength 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.set(0, Int.toByte(10));
      const result: ArrayBuffer = buffer.slice(0, Double.MIN_VALUE);
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferSliceTwo0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_1000
     * @tc.desc Verify slice(123.456,124.456) with normal decimal truncates to 123 and 124
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(8);
      for (let i: int = 0; i < 8; i++) {
        buffer.set(i, Int.toByte(i + 10));
      }
      const result: ArrayBuffer = buffer.slice(123.456, 124.456);
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferSliceTwo0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_1100
     * @tc.desc Verify slice(-888.88,4) with large negative decimal coerces begin to 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.set(0, Int.toByte(10));
      buffer.set(1, Int.toByte(20));
      buffer.set(2, Int.toByte(30));
      buffer.set(3, Int.toByte(40));
      const result: ArrayBuffer = buffer.slice(-888.88, 4);
      expect(result.byteLength).assertEqual(4);
      for (let i: int = 0; i < 4; i++) {
        expect(result.at(i)).assertEqual(buffer.at(i));
      }
    });

    /**
     * @tc.name testArrayBufferSliceTwo0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_1200
     * @tc.desc Verify slice(0,-888.88) with large negative decimal end coerces to 0 and yields byteLength 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.set(0, Int.toByte(10));
      const result: ArrayBuffer = buffer.slice(0, -888.88);
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferSliceTwo0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_1300
     * @tc.desc Verify slice(999999.99,999999.99+1) with business threshold yields empty
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.set(0, Int.toByte(10));
      const result: ArrayBuffer = buffer.slice(999999.99, 999999.99 + 1);
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferSliceTwo0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_1400
     * @tc.desc Verify slice(0.999,1.999) with decimal truncates to 0 and 1 copying 1 byte
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.set(0, Int.toByte(99));
      buffer.set(1, Int.toByte(20));
      const result: ArrayBuffer = buffer.slice(0.999, 1.999);
      expect(result.byteLength).assertEqual(1);
      expect(result.at(0)).assertEqual(Int.toByte(99));
    });

    /**
     * @tc.name testArrayBufferSliceTwo0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_1500
     * @tc.desc Verify slice(3.1,1.9) with decimal begin>end yields byteLength 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.set(0, Int.toByte(10));
      buffer.set(1, Int.toByte(20));
      buffer.set(2, Int.toByte(30));
      buffer.set(3, Int.toByte(40));
      const result: ArrayBuffer = buffer.slice(3.1, 1.9);
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferSliceTwo0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_1600
     * @tc.desc Verify slice(1.5,3.5) with decimal truncates to 1 and 3 copying 2 bytes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.set(0, Int.toByte(10));
      buffer.set(1, Int.toByte(20));
      buffer.set(2, Int.toByte(30));
      buffer.set(3, Int.toByte(40));
      const result: ArrayBuffer = buffer.slice(1.5, 3.5);
      expect(result.byteLength).assertEqual(2);
      expect(result.at(0)).assertEqual(Int.toByte(20));
      expect(result.at(1)).assertEqual(Int.toByte(30));
    });

    /**
     * @tc.name testArrayBufferSliceTwo0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_1700
     * @tc.desc Verify slice(0.0) with number overload copies entire buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      buf.set(0, Int.toByte(10));
      buf.set(1, Int.toByte(20));
      buf.set(2, Int.toByte(30));
      buf.set(3, Int.toByte(40));
      const sliced: ArrayBuffer = buf.slice(0.0);
      expect(sliced.byteLength).assertEqual(4);
      expect(sliced.at(0)).assertEqual(Int.toByte(10));
      expect(sliced.at(3)).assertEqual(Int.toByte(40));
    });

    /**
     * @tc.name testArrayBufferSliceTwo0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_1800
     * @tc.desc Verify slice(1.5) truncates begin to 1, slices from index 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      buf.set(0, Int.toByte(10));
      buf.set(1, Int.toByte(20));
      buf.set(2, Int.toByte(30));
      buf.set(3, Int.toByte(40));
      const sliced: ArrayBuffer = buf.slice(1.5);
      expect(sliced.byteLength).assertEqual(3);
      expect(sliced.at(0)).assertEqual(Int.toByte(20));
    });

    /**
     * @tc.name testArrayBufferSliceTwo0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_1900
     * @tc.desc Verify slice(0.0, 2.0) with number overload copies [0,2)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      buf.set(0, Int.toByte(10));
      buf.set(1, Int.toByte(20));
      buf.set(2, Int.toByte(30));
      buf.set(3, Int.toByte(40));
      const sliced: ArrayBuffer = buf.slice(0.0, 2.0);
      expect(sliced.byteLength).assertEqual(2);
      expect(sliced.at(0)).assertEqual(Int.toByte(10));
    });

    /**
     * @tc.name testArrayBufferSliceTwo0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_2000
     * @tc.desc Verify slice(0.0, 2.75) truncates end to 2, copies [0,2)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      buf.set(0, Int.toByte(10));
      buf.set(1, Int.toByte(20));
      buf.set(2, Int.toByte(30));
      buf.set(3, Int.toByte(40));
      const sliced: ArrayBuffer = buf.slice(0.0, 2.75);
      expect(sliced.byteLength).assertEqual(2);
      expect(sliced.at(1)).assertEqual(Int.toByte(20));
    });

    /**
     * @tc.name testArrayBufferSliceTwo0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_2100
     * @tc.desc Verify slice(0.0, -0.5) with negative fractional end returns empty buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(3);
      buf.set(0, Int.toByte(10));
      buf.set(1, Int.toByte(20));
      buf.set(2, Int.toByte(30));
      const sliced: ArrayBuffer = buf.slice(0.0, -0.5);
      expect(sliced.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferSliceTwo0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_2200
     * @tc.desc Verify slice(1.999, 3.999) with fractional truncation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      buf.set(0, Int.toByte(10));
      buf.set(1, Int.toByte(20));
      buf.set(2, Int.toByte(30));
      buf.set(3, Int.toByte(40));
      const sliced: ArrayBuffer = buf.slice(1.999, 3.999);
      expect(sliced.byteLength).assertEqual(2);
      expect(sliced.at(0)).assertEqual(Int.toByte(20));
    });

    /**
     * @tc.name testArrayBufferSliceTwo0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_2300
     * @tc.desc Verify slice(1.0) with number overload begin only
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      buf.set(0, Int.toByte(1));
      buf.set(1, Int.toByte(2));
      buf.set(2, Int.toByte(3));
      buf.set(3, Int.toByte(4));
      const sliced: ArrayBuffer = buf.slice(1.0);
      expect(sliced.byteLength).assertEqual(3);
      expect(sliced.at(0)).assertEqual(Int.toByte(2));
    });

    /**
     * @tc.name testArrayBufferSliceTwo0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_2400
     * @tc.desc Verify slice(0.0, 2.0) returns 2-byte sliced buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const sliced: ArrayBuffer = buf.slice(0.0, 2.0);
      expect(sliced.byteLength).assertEqual(2);
    });

    /**
     * @tc.name testArrayBufferSliceTwo0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_2500
     * @tc.desc Verify slice number overload returns remainder buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      const sliced: ArrayBuffer = buf.slice(2.0);
      expect(sliced.byteLength).assertEqual(6);
    });

    /**
     * @tc.name testArrayBufferSliceTwo0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_2600
     * @tc.desc Verify slice number overload result detached is false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const sliced: ArrayBuffer = buf.slice(0.0, 2.0);
      expect(sliced.detached).assertFalse();
    });

    /**
     * @tc.name testArrayBufferSliceTwo0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_2700
     * @tc.desc Verify slice number overload result resizable is false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(2, 8);
      const sliced: ArrayBuffer = buf.slice(0.0, 1.0);
      expect(sliced.resizable).assertFalse();
    });

    /**
     * @tc.name testArrayBufferSliceTwo0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_2800
     * @tc.desc Verify slice number overload does not modify original buffer content
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(3);
      buf.set(0, Int.toByte(0x10));
      buf.set(1, Int.toByte(0x20));
      buf.set(2, Int.toByte(0x30));
      buf.slice(0.0, 2.0);
      expect(buf.at(0)).assertEqual(Int.toByte(0x10));
      expect(buf.at(1)).assertEqual(Int.toByte(0x20));
      expect(buf.at(2)).assertEqual(Int.toByte(0x30));
    });

    /**
     * @tc.name testArrayBufferSliceTwo0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_2900
     * @tc.desc Verify slice number overload does not modify original buffer byteLength
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(5);
      const origLen: int = buf.byteLength;
      buf.slice(1.0, 3.0);
      expect(buf.byteLength).assertEqual(origLen);
    });

    /**
     * @tc.name testArrayBufferSliceTwo0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_3000
     * @tc.desc Verify int and number overload slice produce consistent byteLength
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(8);
      buf.set(0, Int.toByte(0x01));
      buf.set(1, Int.toByte(0x02));
      buf.set(2, Int.toByte(0x03));
      buf.set(3, Int.toByte(0x04));
      const s1: ArrayBuffer = buf.slice(1, 3);
      const s2: ArrayBuffer = buf.slice(1.0, 3.0);
      expect(s1.byteLength).assertEqual(s2.byteLength);
      expect(s1.at(0)).assertEqual(s2.at(0));
    });

    /**
     * @tc.name testArrayBufferSliceTwo0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_3100
     * @tc.desc Verify slice(0.0) byteLength equals original byteLength (number overload)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(6);
      const sliced: ArrayBuffer = buf.slice(0.0);
      expect(sliced.byteLength).assertEqual(buf.byteLength);
    });

    /**
     * @tc.name testArrayBufferSliceTwo0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SLICE_TWO_3200
     * @tc.desc Verify slice number overload with begin >= byteLength returns empty buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSliceTwo0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const sliced: ArrayBuffer = buf.slice(4.0);
      expect(sliced.byteLength).assertEqual(0);
    });
  });
}