'use static'
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

export default function arrayBufferByteLengthFieldTest(): void {
  describe('ArrayBufferByteLengthFieldTest', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });


    /**
     * @tc.name testArrayBufferByteLengthField0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_0100
     * @tc.desc Verify buffer.byteLength equals 8
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      expect(buffer.byteLength).assertEqual(8);
    });
    /**
     * @tc.name testArrayBufferByteLengthField0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_0200
     * @tc.desc Verify buffer.byteLength equals 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(1);
      expect(buffer.byteLength).assertEqual(1);
    });
    /**
     * @tc.name testArrayBufferByteLengthField0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_0300
     * @tc.desc Verify buffer.byteLength equals 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4, 16);
      expect(buffer.byteLength).assertEqual(4);
    });
    /**
     * @tc.name testArrayBufferByteLengthField0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_0400
     * @tc.desc Verify buffer.byteLength equals 8
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8, 8);
      expect(buffer.byteLength).assertEqual(8);
    });
    /**
     * @tc.name testArrayBufferByteLengthField0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_0500
     * @tc.desc Verify buffer.byteLength equals 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(0);
      expect(buffer.byteLength).assertEqual(0);
    });
    /**
     * @tc.name testArrayBufferByteLengthField0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_0600
     * @tc.desc Verify buffer.byteLength equals 65536
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(65536);
      expect(buffer.byteLength).assertEqual(65536);
    });
    /**
     * @tc.name testArrayBufferByteLengthField0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_0700
     * @tc.desc Verify buffer.byteLength equals 1024
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(1024);
      expect(buffer.byteLength).assertEqual(1024);
    });
    /**
     * @tc.name testArrayBufferByteLengthField0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_0800
     * @tc.desc Verify buffer.byteLength equals 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = ArrayBuffer.from("ABC", "utf8");
      expect(buffer.byteLength).assertEqual(3);
    });
    /**
     * @tc.name testArrayBufferByteLengthField0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_0900
     * @tc.desc Verify buffer.byteLength equals 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u8 = new Uint8Array(5);
      const buffer = ArrayBuffer.from(u8);
      expect(buffer.byteLength).assertEqual(5);
    });
    /**
     * @tc.name testArrayBufferByteLengthField0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_1000
     * @tc.desc Verify part.byteLength equals 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from("abcde", "utf8");
      const part = ArrayBuffer.from(source, 1, 3);
      expect(part.byteLength).assertEqual(3);
    });
    /**
     * @tc.name testArrayBufferByteLengthField0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_1100
     * @tc.desc Verify sliced.byteLength equals 6
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(16);
      const sliced = buffer.slice(4, 10);
      expect(sliced.byteLength).assertEqual(6);
    });
    /**
     * @tc.name testArrayBufferByteLengthField0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_1200
     * @tc.desc Verify sliced.byteLength equals 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      const sliced = buffer.slice(3);
      expect(sliced.byteLength).assertEqual(5);
    });
    /**
     * @tc.name testArrayBufferByteLengthField0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_1300
     * @tc.desc Verify sliced.byteLength equals 10
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(10);
      const sliced = buffer.slice(0);
      expect(sliced.byteLength).assertEqual(10);
    });
    /**
     * @tc.name testArrayBufferByteLengthField0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_1400
     * @tc.desc Verify resizable zero-length buffer has byteLength 0 and resizable true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(0, 8);
      expect(buffer.byteLength).assertEqual(0);
      expect(buffer.resizable).assertTrue();
    });
    /**
     * @tc.name testArrayBufferByteLengthField0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_1500
     * @tc.desc Verify Class.of(new Int(byteLength)) equals Class.of(ref) and value equals 8
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      const ref: int = 0;
      expect(Class.of(new Int(buffer.byteLength)) === Class.of(new Int(ref))).assertTrue();
      expect(buffer.byteLength).assertEqual(8);
    });
    /**
     * @tc.name testArrayBufferByteLengthField0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_1600
     * @tc.desc Verify byteLength is integer and equals 8
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      expect(Number.isInteger(buffer.byteLength)).assertTrue();
      expect(buffer.byteLength).assertEqual(8);
    });
    /**
     * @tc.name testArrayBufferByteLengthField0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_1700
     * @tc.desc Verify result equals 100
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(100);
      const result: int = buffer.byteLength;
      expect(result).assertEqual(100);
    });
    /**
     * @tc.name testArrayBufferByteLengthField0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_1800
     * @tc.desc Verify buffer.byteLength equals buffer.getByteLength()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      expect(buffer.byteLength).assertEqual(buffer.getByteLength());
    });
    /**
     * @tc.name testArrayBufferByteLengthField0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_1900
     * @tc.desc Verify buffer.byteLength equals buffer.getByteLength()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(0);
      expect(buffer.byteLength).assertEqual(buffer.getByteLength());
    });
    /**
     * @tc.name testArrayBufferByteLengthField0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_2000
     * @tc.desc Verify buffer.byteLength equals buffer.getByteLength()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(65536);
      expect(buffer.byteLength).assertEqual(buffer.getByteLength());
    });
    /**
     * @tc.name testArrayBufferByteLengthField0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_2100
     * @tc.desc Verify sliced.byteLength equals sliced.getByteLength()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(16);
      const sliced = buffer.slice(2, 8);
      expect(sliced.byteLength).assertEqual(sliced.getByteLength());
    });
    /**
     * @tc.name testArrayBufferByteLengthField0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_2200
     * @tc.desc Verify buffer.byteLength equals buffer.getByteLength()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = ArrayBuffer.from("ABC", "utf8");
      expect(buffer.byteLength).assertEqual(buffer.getByteLength());
    });
    /**
     * @tc.name testArrayBufferByteLengthField0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_2300
     * @tc.desc Verify buffer.byteLength equals buffer.getByteLength()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4, 16);
      expect(buffer.byteLength).assertEqual(buffer.getByteLength());
    });
    /**
     * @tc.name testArrayBufferByteLengthField0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_2400
     * @tc.desc Verify buffer.byteLength equals 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(2, 1024);
      expect(buffer.byteLength).assertEqual(2);
    });
    /**
     * @tc.name testArrayBufferByteLengthField0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_2500
     * @tc.desc Verify buffer.byteLength equals 10
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4, 16);
      buffer.resize(10);
      expect(buffer.byteLength).assertEqual(10);
    });
    /**
     * @tc.name testArrayBufferByteLengthField0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_2600
     * @tc.desc Verify buffer.byteLength equals 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8, 16);
      buffer.resize(2);
      expect(buffer.byteLength).assertEqual(2);
    });
    /**
     * @tc.name testArrayBufferByteLengthField0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_2700
     * @tc.desc Verify buffer.byteLength equals 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4, 16);
      buffer.resize(0);
      expect(buffer.byteLength).assertEqual(0);
    });
    /**
     * @tc.name testArrayBufferByteLengthField0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_2800
     * @tc.desc Verify buffer.byteLength equals 16
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4, 16);
      buffer.resize(16);
      expect(buffer.byteLength).assertEqual(16);
    });
    /**
     * @tc.name testArrayBufferByteLengthField0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_2900
     * @tc.desc Verify buffer.byteLength equals 8
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4, 16);
      buffer.resize(8);
      expect(buffer.byteLength).assertEqual(8);
      buffer.resize(12);
      expect(buffer.byteLength).assertEqual(12);
      buffer.resize(4);
      expect(buffer.byteLength).assertEqual(4);
    });
    /**
     * @tc.name testArrayBufferByteLengthField0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_3000
     * @tc.desc Verify buffer.byteLength equals buffer.getByteLength()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4, 16);
      buffer.resize(10);
      expect(buffer.byteLength).assertEqual(buffer.getByteLength());
      buffer.resize(2);
      expect(buffer.byteLength).assertEqual(buffer.getByteLength());
    });
    /**
     * @tc.name testArrayBufferByteLengthField0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_3100
     * @tc.desc Verify API call throws ClassCastError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let before = buffer.byteLength;
      try {
        (buffer as Record<string, Object>)["byteLength"] = 100;
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
      expect(buffer.byteLength).assertEqual(before);
    });
    /**
     * @tc.name testArrayBufferByteLengthField0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_3200
     * @tc.desc Verify buffer.byteLength equals buffer.getByteLength()
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8, 16);
      buffer.resize(0);
      expect(buffer.byteLength).assertEqual(buffer.getByteLength());
    });
    /**
     * @tc.name testArrayBufferByteLengthField0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_3300
     * @tc.desc Verify result1 equals 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8, 16);
      buffer.resize(0);
      const result1 = buffer.byteLength;
      const result2 = buffer.byteLength;
      expect(result1).assertEqual(0);
      expect(result2).assertEqual(0);
    });
  });
}
