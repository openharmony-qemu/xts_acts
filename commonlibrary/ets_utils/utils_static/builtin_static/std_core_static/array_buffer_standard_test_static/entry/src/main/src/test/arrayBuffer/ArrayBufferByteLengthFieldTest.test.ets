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
 * WITHOUT WARRANTIES OR ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function arrayBufferByteLengthFieldTest(): void {
  describe('ArrayBufferByteLengthFieldTest', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });

    /**
     * @tc.name testArrayBufferByteLengthField0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_0100
     * @tc.desc Verify ArrayBuffer.byteLength: fixed-size ArrayBufferaccess byteLength，returns constructor length
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      let result = buffer.byteLength;
      expect(result).assertEqual(8);
    });

    /**
     * @tc.name testArrayBufferByteLengthField0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_0200
     * @tc.desc Verify ArrayBuffer.byteLength: fixed-size ArrayBuffer(1)access byteLength，returns 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(1);
      let result = buffer.byteLength;
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name testArrayBufferByteLengthField0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_0300
     * @tc.desc Verify ArrayBuffer.byteLength: resizable ArrayBufferaccess byteLength，returns length not maxByteLength
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4, 16);
      let result = buffer.byteLength;
      expect(result).assertEqual(4);
    });

    /**
     * @tc.name testArrayBufferByteLengthField0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_0400
     * @tc.desc Verify ArrayBuffer.byteLength: resizable ArrayBuffer length equals maxByteLength ，byteLengthreturns
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8, 8);
      let result = buffer.byteLength;
      expect(result).assertEqual(8);
    });

    /**
     * @tc.name testArrayBufferByteLengthField0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_0500
     * @tc.desc Verify ArrayBuffer.byteLength: length is 0 ArrayBufferaccess byteLength，returns 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(0);
      let result = buffer.byteLength;
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferByteLengthField0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_0600
     * @tc.desc Verify ArrayBuffer.byteLength: length ArrayBuffer(65536)access byteLength，returns 65536
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(65536);
      let result = buffer.byteLength;
      expect(result).assertEqual(65536);
    });

    /**
     * @tc.name testArrayBufferByteLengthField0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_0700
     * @tc.desc Verify ArrayBuffer.byteLength: length ArrayBuffer(1024)access byteLength，returns 1024
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(1024);
      let result = buffer.byteLength;
      expect(result).assertEqual(1024);
    });

    /**
     * @tc.name testArrayBufferByteLengthField0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_0800
     * @tc.desc Verify ArrayBuffer.byteLength: ArrayBuffer.from(string, encoding)create buffer access byteLength
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = ArrayBuffer.from("ABC", "utf8");
      let result = buffer.byteLength;
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name testArrayBufferByteLengthField0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_0900
     * @tc.desc Verify ArrayBuffer.byteLength: ArrayBuffer.from(Uint8Array)create buffer access byteLength
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const u8 = new Uint8Array(5);
      const buffer = ArrayBuffer.from(u8);
      let result = buffer.byteLength;
      expect(result).assertEqual(5);
    });

    /**
     * @tc.name testArrayBufferByteLengthField0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_1000
     * @tc.desc Verify ArrayBuffer.byteLength: ArrayBuffer.from(ArrayBuffer, byteOffset, length)create buffer access byteLength
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from("abcde", "utf8");
      const part = ArrayBuffer.from(source, 1, 3);
      let result = part.byteLength;
      expect(result).assertEqual(3);
    });

    /**
     * @tc.name testArrayBufferByteLengthField0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_1100
     * @tc.desc Verify ArrayBuffer.byteLength: slicecreate ArrayBufferaccess byteLength，returns slice length
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(16);
      const sliced = buffer.slice(4, 10);
      let result = sliced.byteLength;
      expect(result).assertEqual(6);
    });

    /**
     * @tc.name testArrayBufferByteLengthField0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_1200
     * @tc.desc Verify ArrayBuffer.byteLength: sliceomitted end ，byteLengthreturns from begin to length
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      const sliced = buffer.slice(3);
      let result = sliced.byteLength;
      expect(result).assertEqual(5);
    });

    /**
     * @tc.name testArrayBufferByteLengthField0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_1300
     * @tc.desc Verify ArrayBuffer.byteLength: slice(0)create ，byteLength and buffer consistent
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(10);
      const sliced = buffer.slice(0);
      let result = sliced.byteLength;
      expect(result).assertEqual(10);
    });

    /**
     * @tc.name testArrayBufferByteLengthField0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_1400
     * @tc.desc Verify ArrayBuffer.byteLength: constructor is 8 ArrayBuffer，byteLengthreturns 8
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      let result = buffer.byteLength;
      expect(result).assertEqual(8);
    });

    /**
     * @tc.name testArrayBufferByteLengthField0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_1500
     * @tc.desc Verify ArrayBuffer.byteLength: constructor is 0 ArrayBuffer，byteLengthreturns 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(0);
      let result = buffer.byteLength;
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferByteLengthField0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_1600
     * @tc.desc Verify ArrayBuffer.byteLength: multiple access byteLengthreturn value consistent
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      let result1 = buffer.byteLength;
      let result2 = buffer.byteLength;
      let result3 = buffer.byteLength;
      expect(result1 === result2 && result2 === result3).assertTrue();
    });

    /**
     * @tc.name testArrayBufferByteLengthField0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_1700
     * @tc.desc Verify ArrayBuffer.byteLength: typeof byteLength is number or int on OH (Hypium typeof may report int).
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      let result = buffer.byteLength;
      expect(Utils.isRuntimeNumericOrIntTypeof(typeof result)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferByteLengthField0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_1800
     * @tc.desc Verify ArrayBuffer.byteLength: byteLengthreturn value is ，not floating-point
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      let result = buffer.byteLength;
      expect(Number.isInteger(result)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferByteLengthField0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_1900
     * @tc.desc Verify ArrayBuffer.byteLength: byteLengthreturn value greater than equals 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(0);
      let result = buffer.byteLength;
      expect(result >= 0).assertTrue();
    });

    /**
     * @tc.name testArrayBufferByteLengthField0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_2000
     * @tc.desc Verify ArrayBuffer.byteLength: byteLengthreturn value and constructor passing inttype consistent
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(100);
      let result: int = buffer.byteLength;
      expect(result).assertEqual(100);
    });

    /**
     * @tc.name testArrayBufferByteLengthField0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_2100
     * @tc.desc Verify ArrayBuffer.byteLength: byteLength and getByteLength()return value consistent （fixed-size ）
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      expect(buffer.byteLength).assertEqual(buffer.getByteLength());
    });

    /**
     * @tc.name testArrayBufferByteLengthField0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_2200
     * @tc.desc Verify ArrayBuffer.byteLength: byteLength and getByteLength()return value consistent （empty buffer ）
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(0);
      expect(buffer.byteLength).assertEqual(buffer.getByteLength());
    });

    /**
     * @tc.name testArrayBufferByteLengthField0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_2300
     * @tc.desc Verify ArrayBuffer.byteLength: byteLength and getByteLength()return value consistent （ buffer ）
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(65536);
      expect(buffer.byteLength).assertEqual(buffer.getByteLength());
    });

    /**
     * @tc.name testArrayBufferByteLengthField0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_2400
     * @tc.desc Verify ArrayBuffer.byteLength: byteLength and getByteLength()return value consistent （slicecreate ）
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(16);
      const sliced = buffer.slice(2, 8);
      expect(sliced.byteLength).assertEqual(sliced.getByteLength());
    });

    /**
     * @tc.name testArrayBufferByteLengthField0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_2500
     * @tc.desc Verify ArrayBuffer.byteLength: byteLength and getByteLength()return value consistent （fromcreate ）
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = ArrayBuffer.from("ABC", "utf8");
      expect(buffer.byteLength).assertEqual(buffer.getByteLength());
    });

    /**
     * @tc.name testArrayBufferByteLengthField0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_2600
     * @tc.desc Verify ArrayBuffer.byteLength: byteLength and getByteLength()return value consistent （resizable）
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4, 16);
      expect(buffer.byteLength).assertEqual(buffer.getByteLength());
    });

    /**
     * @tc.name testArrayBufferByteLengthField0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_2700
     * @tc.desc Verify ArrayBuffer.byteLength: byteLength is 0，verify minimum boundary
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(0);
      let result = buffer.byteLength;
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferByteLengthField0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_2800
     * @tc.desc Verify ArrayBuffer.byteLength: byteLength is 1，verify minimum valid length
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(1);
      let result = buffer.byteLength;
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name testArrayBufferByteLengthField0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_2900
     * @tc.desc Verify ArrayBuffer.byteLength: byteLength is 65536，verify buffer boundary
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(65536);
      let result = buffer.byteLength;
      expect(result).assertEqual(65536);
    });

    /**
     * @tc.name testArrayBufferByteLengthField0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_3000
     * @tc.desc Verify ArrayBuffer.byteLength: resizable ArrayBuffer byteLengthreturns when before length not maxByteLength
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(2, 1024);
      let result = buffer.byteLength;
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name testArrayBufferByteLengthField0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_3100
     * @tc.desc Verify ArrayBuffer.byteLength: resizable ArrayBuffer resize after ，byteLengthreturns length
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4, 16);
      buffer.resize(10);
      let result = buffer.byteLength;
      expect(result).assertEqual(10);
    });

    /**
     * @tc.name testArrayBufferByteLengthField0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_3200
     * @tc.desc Verify ArrayBuffer.byteLength: resizable ArrayBuffer resize after ，byteLengthreturns length
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8, 16);
      buffer.resize(2);
      let result = buffer.byteLength;
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name testArrayBufferByteLengthField0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_3300
     * @tc.desc Verify ArrayBuffer.byteLength: resizable ArrayBuffer resize to 0 after ，byteLengthreturns 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4, 16);
      buffer.resize(0);
      let result = buffer.byteLength;
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferByteLengthField0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_3400
     * @tc.desc Verify ArrayBuffer.byteLength: resizable ArrayBuffer resize to maxByteLength after ，byteLengthreturns maximum length
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4, 16);
      buffer.resize(16);
      let result = buffer.byteLength;
      expect(result).assertEqual(16);
    });

    /**
     * @tc.name testArrayBufferByteLengthField0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_3500
     * @tc.desc Verify ArrayBuffer.byteLength: resizable ArrayBuffermultiple resize after ，byteLengthreturns length
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4, 16);
      buffer.resize(8);
      expect(buffer.byteLength).assertEqual(8);
      buffer.resize(12);
      expect(buffer.byteLength).assertEqual(12);
      buffer.resize(4);
      expect(buffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.name testArrayBufferByteLengthField0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_3600
     * @tc.desc Verify ArrayBuffer.byteLength: resize after byteLength and getByteLength() consistent
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4, 16);
      buffer.resize(10);
      expect(buffer.byteLength).assertEqual(buffer.getByteLength());
      buffer.resize(2);
      expect(buffer.byteLength).assertEqual(buffer.getByteLength());
    });

    /**
     * @tc.name testArrayBufferByteLengthField0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_3700
     * @tc.desc Mindmap ArrayBuffer_get_byteLength §3.1: assigning to read-only byteLength may throw or be ignored; byteLength must stay unchanged (Record bracket used where compile allows).
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      let before = buffer.byteLength;
      try {
        (buffer as Record<string, Object>)["byteLength"] = 100;
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e as object);
      }
      let after = buffer.byteLength;
      expect(after).assertEqual(before);
    });

    /**
     * @tc.name testArrayBufferByteLengthField0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_3800
     * @tc.desc Mindmap ArrayBuffer_get_byteLength §3.1 follow-up: read byteLength on ArrayBuffer(8) still returns 8 after unrelated access pattern.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      let result = buffer.byteLength;
      expect(result).assertEqual(8);
    });

    /**
     * @tc.name testArrayBufferByteLengthField0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_3900
     * @tc.desc ArrayBuffer_byte §3.2 zero-length semantics: byteLength is 0 after resize(0) (no detach() available; simulates detached-length-0 behavior
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8, 16);
      buffer.resize(0);
      let result = buffer.byteLength;
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferByteLengthField0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_4000
     * @tc.desc Mindmap ArrayBuffer_get_byteLength §3.2: after resize(0), byteLength matches getByteLength() (detach substitute per STA).
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8, 16);
      buffer.resize(0);
      expect(buffer.byteLength).assertEqual(buffer.getByteLength());
    });

    /**
     * @tc.name testArrayBufferByteLengthField0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_4100
     * @tc.desc Mindmap ArrayBuffer_get_byteLength §3.2: repeated byteLength reads stay 0 after resize(0) (detach substitute).
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8, 16);
      buffer.resize(0);
      let result1 = buffer.byteLength;
      let result2 = buffer.byteLength;
      expect(result1).assertEqual(0);
      expect(result2).assertEqual(0);
      expect(result1 === result2).assertTrue();
    });

    /**
     * @tc.name testArrayBufferByteLengthField0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_4200
     * @tc.desc Mindmap ArrayBuffer_get_byteLength §3.2: resizable buffer after resize(0) reports byteLength 0 (detach substitute per STA).
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4, 16);
      buffer.resize(0);
      let result = buffer.byteLength;
      expect(result).assertEqual(0);
    });
  });
}
