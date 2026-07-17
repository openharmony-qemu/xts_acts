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

function processArrayBufferLike(buf: ArrayBufferLike): int {
  return buf.byteLength;
}

function createArrayBufferLike(size: int, maxByteLength?: int): ArrayBufferLike {
  if (maxByteLength !== undefined) {
    return new ArrayBuffer(size, maxByteLength);
  }
  return new ArrayBuffer(size);
}

export default function arrayBufferLike2Test(): void {
  describe('ArrayBufferLike2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.name testArrayBufferLike0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_0100
     * @tc.desc Verify ArrayBufferLike passed to function as parameter
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(32);
      const result: int = processArrayBufferLike(buffer);
      expect(result).assertEqual(32);
    });

    /**
     * @tc.name testArrayBufferLike0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_0200
     * @tc.desc Verify ArrayBufferLike created by function return
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = createArrayBufferLike(64);
      expect(buffer.byteLength).assertEqual(64);
    });

    /**
     * @tc.name testArrayBufferLike0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_0300
     * @tc.desc Verify ArrayBufferLike with large buffer size
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(1024);
      expect(buffer.byteLength).assertEqual(1024);
    });

    /**
     * @tc.name testArrayBufferLike0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_0400
     * @tc.desc Verify ArrayBufferLike as DataView buffer parameter
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(16);
      const dataView: DataView = new DataView(buffer);
      expect(dataView.buffer).assertEqual(buffer);
      expect(dataView.byteLength).assertEqual(16);
    });

    /**
     * @tc.name testArrayBufferLike0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_0500
     * @tc.desc Verify ArrayBufferLike with Int8Array data read/write (interpret as int8)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(8);
      const int8Arr: Int8Array = new Int8Array(buffer);
      int8Arr[0] = 10;
      int8Arr[1] = -20;
      expect(int8Arr[0]).assertEqual(10);
      expect(int8Arr[1]).assertEqual(-20);
    });

    /**
     * @tc.name testArrayBufferLike0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_0600
     * @tc.desc Verify ArrayBufferLike with Uint8Array data read/write (interpret as uint8)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(8);
      const uint8Arr: Uint8Array = new Uint8Array(buffer);
      uint8Arr[0] = 255;
      uint8Arr[1] = 128;
      expect(uint8Arr[0]).assertEqual(255);
      expect(uint8Arr[1]).assertEqual(128);
    });

    /**
     * @tc.name testArrayBufferLike0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_0700
     * @tc.desc Verify ArrayBufferLike with Int16Array data read/write (interpret as int16)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(8);
      const int16Arr: Int16Array = new Int16Array(buffer);
      int16Arr[0] = 1000;
      int16Arr[1] = -500;
      expect(int16Arr[0]).assertEqual(1000);
      expect(int16Arr[1]).assertEqual(-500);
    });

    /**
     * @tc.name testArrayBufferLike0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_0800
     * @tc.desc Verify ArrayBufferLike with Int32Array data read/write (interpret as int32)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(16);
      const int32Arr: Int32Array = new Int32Array(buffer);
      int32Arr[0] = 100000;
      int32Arr[1] = -200000;
      expect(int32Arr[0]).assertEqual(100000);
      expect(int32Arr[1]).assertEqual(-200000);
    });

    /**
     * @tc.name testArrayBufferLike0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_0900
     * @tc.desc Verify ArrayBufferLike with Float32Array data read/write (interpret as float)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(16);
      const float32Arr: Float32Array = new Float32Array(buffer);
      float32Arr[0] = 3.14;
      float32Arr[1] = -2.71;
      expect(float32Arr[0]).assertClose(3.14, 0.0001);
      expect(float32Arr[1]).assertClose(-2.71, 0.0001);
    });

    /**
     * @tc.name testArrayBufferLike0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_1000
     * @tc.desc Verify ArrayBufferLike with Float64Array data read/write (interpret as double)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(16);
      const float64Arr: Float64Array = new Float64Array(buffer);
      float64Arr[0] = 3.14159265358979;
      float64Arr[1] = -2.71828182845904;
      expect(float64Arr[0]).assertClose(3.14159265358979, 0.0001);
      expect(float64Arr[1]).assertClose(-2.71828182845904, 0.0001);
    });

    /**
     * @tc.name testArrayBufferLike0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_1100
     * @tc.desc Verify ArrayBufferLike with DataView setInt8/getInt8 (interpret as int8)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(8);
      const dataView: DataView = new DataView(buffer);
      dataView.setInt8(0, 10);
      dataView.setInt8(1, -20);
      expect(dataView.getInt8(0)).assertEqual(10);
      expect(dataView.getInt8(1)).assertEqual(-20);
    });

    /**
     * @tc.name testArrayBufferLike0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_1200
     * @tc.desc Verify ArrayBufferLike with DataView setUint8/getUint8 (interpret as uint8)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(8);
      const dataView: DataView = new DataView(buffer);
      dataView.setUint8(0, 255);
      dataView.setUint8(1, 128);
      expect(dataView.getUint8(0)).assertEqual(255);
      expect(dataView.getUint8(1)).assertEqual(128);
    });

    /**
     * @tc.name testArrayBufferLike0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_1300
     * @tc.desc Verify ArrayBufferLike with DataView setInt16/getInt16 (interpret as int16)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(8);
      const dataView: DataView = new DataView(buffer);
      dataView.setInt16(0, 1000);
      dataView.setInt16(2, -500);
      expect(dataView.getInt16(0)).assertEqual(1000);
      expect(dataView.getInt16(2)).assertEqual(-500);
    });

    /**
     * @tc.name testArrayBufferLike0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_1400
     * @tc.desc Verify ArrayBufferLike with DataView setInt32/getInt32 (interpret as int32)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(16);
      const dataView: DataView = new DataView(buffer);
      dataView.setInt32(0, 100000);
      dataView.setInt32(4, -200000);
      expect(dataView.getInt32(0)).assertEqual(100000);
      expect(dataView.getInt32(4)).assertEqual(-200000);
    });

    /**
     * @tc.name testArrayBufferLike0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_1500
     * @tc.desc Verify ArrayBufferLike with DataView setFloat32/getFloat32 (interpret as float)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(16);
      const dataView: DataView = new DataView(buffer);
      dataView.setFloat32(0, 3.14);
      dataView.setFloat32(4, -2.71);
      expect(dataView.getFloat32(0)).assertClose(3.14, 0.0001);
      expect(dataView.getFloat32(4)).assertClose(-2.71, 0.0001);
    });

    /**
     * @tc.name testArrayBufferLike0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_1600
     * @tc.desc Verify ArrayBufferLike with DataView setFloat64/getFloat64 (interpret as double)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(16);
      const dataView: DataView = new DataView(buffer);
      dataView.setFloat64(0, 3.14159265358979);
      expect(dataView.getFloat64(0)).assertClose(3.14159265358979, 0.0001);
    });

    /**
     * @tc.name testArrayBufferLike0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_1700
     * @tc.desc Verify ArrayBufferLike raw binary data - multiple views share same buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(8);
      const int8View: Int8Array = new Int8Array(buffer);
      const uint8View: Uint8Array = new Uint8Array(buffer);
      int8View[0] = -1;
      expect(int8View[0]).assertEqual(-1);
      expect(uint8View[0]).assertEqual(255);
    });

    /**
     * @tc.name testArrayBufferLike0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_1800
     * @tc.desc Verify ArrayBufferLike - same data interpreted as different types via TypedArray (assumes little-endian byte order)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(4);
      const int32View: Int32Array = new Int32Array(buffer);
      const uint8View: Uint8Array = new Uint8Array(buffer);
      int32View[0] = 0x12345678;
      expect(int32View[0]).assertEqual(0x12345678);
      expect(uint8View[0]).assertEqual(0x78);
      expect(uint8View[1]).assertEqual(0x56);
      expect(uint8View[2]).assertEqual(0x34);
      expect(uint8View[3]).assertEqual(0x12);
    });

    /**
     * @tc.name testArrayBufferLike0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_1900
     * @tc.desc Verify ArrayBufferLike - modify data through one view visible in another view
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(8);
      const int8View: Int8Array = new Int8Array(buffer);
      const dataView: DataView = new DataView(buffer);
      int8View[0] = 100;
      int8View[1] = -50;
      expect(dataView.getInt8(0)).assertEqual(100);
      expect(dataView.getInt8(1)).assertEqual(-50);
    });

    /**
     * @tc.name testArrayBufferLike0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_2000
     * @tc.desc Verify ArrayBufferLike - DataView and TypedArray share same buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(8);
      const dataView: DataView = new DataView(buffer);
      const int16View: Int16Array = new Int16Array(buffer);
      int16View[0] = 1000;
      int16View[1] = -500;
      expect(dataView.getInt16(0, true)).assertEqual(1000);
      expect(dataView.getInt16(2, true)).assertEqual(-500);
    });

    /**
     * @tc.name testArrayBufferLike0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_2100
     * @tc.desc Verify ArrayBufferLike byte-level storage - Uint8Array operates on bytes
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(4);
      const bytes: Uint8Array = new Uint8Array(buffer);
      bytes[0] = 0x01;
      bytes[1] = 0x02;
      bytes[2] = 0x03;
      bytes[3] = 0x04;
      expect(bytes[0]).assertEqual(0x01);
      expect(bytes[1]).assertEqual(0x02);
      expect(bytes[2]).assertEqual(0x03);
      expect(bytes[3]).assertEqual(0x04);
    });

    /**
     * @tc.name testArrayBufferLike0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_2200
     * @tc.desc Verify ArrayBufferLike - interpret same bytes as int and float
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(4);
      const int32View: Int32Array = new Int32Array(buffer);
      const float32View: Float32Array = new Float32Array(buffer);
      int32View[0] = 1065353216;
      expect(float32View[0]).assertClose(1.0, 0.0001);
    });

    /**
     * @tc.name testArrayBufferLike0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_2300
     * @tc.desc Verify ArrayBufferLike - DataView byte order with little-endian
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(4);
      const dataView: DataView = new DataView(buffer);
      const uint8View: Uint8Array = new Uint8Array(buffer);
      dataView.setInt32(0, 0x12345678, true);
      expect(uint8View[0]).assertEqual(0x78);
      expect(uint8View[1]).assertEqual(0x56);
      expect(uint8View[2]).assertEqual(0x34);
      expect(uint8View[3]).assertEqual(0x12);
    });

    /**
     * @tc.name testArrayBufferLike0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_2400
     * @tc.desc Verify ArrayBufferLike - DataView byte order with big-endian
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(4);
      const dataView: DataView = new DataView(buffer);
      const uint8View: Uint8Array = new Uint8Array(buffer);
      dataView.setInt32(0, 0x12345678, false);
      expect(uint8View[0]).assertEqual(0x12);
      expect(uint8View[1]).assertEqual(0x34);
      expect(uint8View[2]).assertEqual(0x56);
      expect(uint8View[3]).assertEqual(0x78);
    });

    /**
     * @tc.name testArrayBufferLike0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_2500
     * @tc.desc Verify ArrayBufferLike - three different views share same buffer (assumes little-endian byte order)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(8);
      const int8View: Int8Array = new Int8Array(buffer);
      const int16View: Int16Array = new Int16Array(buffer);
      const int32View: Int32Array = new Int32Array(buffer);
      int8View[0] = 1;
      int8View[1] = 2;
      int8View[2] = 3;
      int8View[3] = 4;
      expect(int16View[0]).assertEqual(513);
      expect(int32View[0]).assertEqual(67305985);
    });

    /**
     * @tc.name testArrayBufferLike0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_2600
     * @tc.desc Verify ArrayBufferLike - raw binary data initialized to zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(16);
      const uint8View: Uint8Array = new Uint8Array(buffer);
      for (let i: int = 0; i < uint8View.length; i++) {
        expect(uint8View[i]).assertEqual(0);
      }
    });

    /**
     * @tc.name testArrayBufferLike0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_2700
     * @tc.desc Verify ArrayBufferLike with large resizable buffer (1000000 bytes)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(1000000, 2000000);
      expect(buffer.byteLength).assertEqual(1000000);
      expect(buffer.resizable).assertTrue();
    });

    /**
     * @tc.name testArrayBufferLike0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_2800
     * @tc.desc Verify ArrayBufferLike with Int8Array on large buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(1000000);
      const int8View: Int8Array = new Int8Array(buffer);
      int8View[0] = 42;
      int8View[999999] = -1;
      expect(int8View[0]).assertEqual(42);
      expect(int8View[999999]).assertEqual(-1);
    });

    /**
     * @tc.name testArrayBufferLike0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_LIKE_2900
     * @tc.desc Verify ArrayBufferLike with DataView on large buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferLike0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBufferLike = new ArrayBuffer(1000000);
      const dataView: DataView = new DataView(buffer);
      dataView.setInt32(0, 123456789);
      dataView.setInt32(999996, -123456789);
      expect(dataView.getInt32(0)).assertEqual(123456789);
      expect(dataView.getInt32(999996)).assertEqual(-123456789);
    });
  });
}