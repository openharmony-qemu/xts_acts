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

export default function arrayBufferGetByteLengthTest(): void {
  describe('ArrayBufferGetByteLengthTest', (): void => {
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
     * @tc.name testArrayBufferGetByteLength0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_METHOD_GET_BYTE_LENGTH_0100
     * @tc.desc Verify ArrayBuffer.getByteLength: call getByteLength，returns byte length
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferGetByteLength0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      let result = buffer.getByteLength();
      expect(result).assertEqual(8);
    });

    /**
     * @tc.name testArrayBufferGetByteLength0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_METHOD_GET_BYTE_LENGTH_0200
     * @tc.desc Verify ArrayBuffer.getByteLength: passing 1 call getByteLength，verify is
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferGetByteLength0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      let result = buffer.getByteLength(1);
      expect(result).assertEqual(8);
    });

    /**
     * @tc.name testArrayBufferGetByteLength0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_METHOD_GET_BYTE_LENGTH_0300
     * @tc.desc Verify ArrayBuffer.getByteLength: passing call getByteLength，verify is
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferGetByteLength0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      let result = buffer.getByteLength(1, 2);
      expect(result).assertEqual(8);
    });

    /**
     * @tc.name testArrayBufferGetByteLength0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_METHOD_GET_BYTE_LENGTH_0400
     * @tc.desc Verify ArrayBuffer.getByteLength: is 0 ArrayBuffercall getByteLength，returns 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferGetByteLength0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(0);
      let result = buffer.getByteLength();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferGetByteLength0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_METHOD_GET_BYTE_LENGTH_0500
     * @tc.desc Verify ArrayBuffer.getByteLength: is 1 ArrayBuffercall getByteLength，returns 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferGetByteLength0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(1);
      let result = buffer.getByteLength();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.name testArrayBufferGetByteLength0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_METHOD_GET_BYTE_LENGTH_0600
     * @tc.desc Verify ArrayBuffer.getByteLength: is 8 ArrayBuffercall getByteLength，returns 8
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferGetByteLength0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      let result = buffer.getByteLength();
      expect(result).assertEqual(8);
    });

    /**
     * @tc.name testArrayBufferGetByteLength0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_METHOD_GET_BYTE_LENGTH_0700
     * @tc.desc Verify ArrayBuffer.getByteLength: is 1024 ArrayBuffercall getByteLength，returns 1024
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferGetByteLength0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(1024);
      let result = buffer.getByteLength();
      expect(result).assertEqual(1024);
    });

    /**
     * @tc.name testArrayBufferGetByteLength0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_METHOD_GET_BYTE_LENGTH_0800
     * @tc.desc Verify ArrayBuffer.getByteLength: is 65536 ArrayBuffercall getByteLength，returns 65536
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferGetByteLength0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(65536);
      let result = buffer.getByteLength();
      expect(result).assertEqual(65536);
    });

    /**
     * @tc.name testArrayBufferGetByteLength0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_METHOD_GET_BYTE_LENGTH_0900
     * @tc.desc Verify ArrayBuffer.getByteLength: slicecreate ArrayBuffercall getByteLength，returns slice length
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferGetByteLength0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(16);
      const sliced = buffer.slice(4, 10);
      let result = sliced.getByteLength();
      expect(result).assertEqual(6);
    });

    /**
     * @tc.name testArrayBufferGetByteLength0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_METHOD_GET_BYTE_LENGTH_1000
     * @tc.desc Verify ArrayBuffer.getByteLength: resizable ArrayBufferconstructor after call getByteLength，returns length
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferGetByteLength0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4, 16);
      let result = buffer.getByteLength();
      expect(result).assertEqual(4);
    });

    /**
     * @tc.name testArrayBufferGetByteLength0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_METHOD_GET_BYTE_LENGTH_1100
     * @tc.desc Verify ArrayBuffer.getByteLength: verify return value type is int
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferGetByteLength0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      let result = buffer.getByteLength();
      expect(typeof result).assertEqual("number");
    });

    /**
     * @tc.name testArrayBufferGetByteLength0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_METHOD_GET_BYTE_LENGTH_1200
     * @tc.desc Verify ArrayBuffer.getByteLength: verify return value is ， floating-point
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferGetByteLength0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      let result = buffer.getByteLength();
      expect(Number.isInteger(result)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferGetByteLength0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_METHOD_GET_BYTE_LENGTH_1300
     * @tc.desc Verify ArrayBuffer.getByteLength: verify return value greater than equals 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferGetByteLength0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(0);
      let result = buffer.getByteLength();
      expect(result >= 0).assertTrue();
    });

    /**
     * @tc.name testArrayBufferGetByteLength0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_METHOD_GET_BYTE_LENGTH_1400
     * @tc.desc Verify ArrayBuffer.getByteLength: multiple call getByteLengthreturn value consistent
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferGetByteLength0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      let result1 = buffer.getByteLength();
      let result2 = buffer.getByteLength();
      let result3 = buffer.getByteLength();
      expect(result1 === result2 && result2 === result3).assertTrue();
    });

    /**
     * @tc.name testArrayBufferGetByteLength0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_METHOD_GET_BYTE_LENGTH_1500
     * @tc.desc Verify ArrayBuffer.getByteLength: getByteLengthreturn value and byteLengthproperty consistent （ is 0）
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferGetByteLength0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(0);
      expect(buffer.getByteLength()).assertEqual(buffer.byteLength);
    });

    /**
     * @tc.name testArrayBufferGetByteLength0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_METHOD_GET_BYTE_LENGTH_1600
     * @tc.desc Verify ArrayBuffer.getByteLength: getByteLengthreturn value and byteLengthproperty consistent （ is 8）
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferGetByteLength0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      expect(buffer.getByteLength()).assertEqual(buffer.byteLength);
    });

    /**
     * @tc.name testArrayBufferGetByteLength0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_METHOD_GET_BYTE_LENGTH_1700
     * @tc.desc Verify ArrayBuffer.getByteLength: getByteLengthreturn value and byteLengthproperty consistent （ is 1024）
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferGetByteLength0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(1024);
      expect(buffer.getByteLength()).assertEqual(buffer.byteLength);
    });

    /**
     * @tc.name testArrayBufferGetByteLength0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_METHOD_GET_BYTE_LENGTH_1800
     * @tc.desc Verify ArrayBuffer.getByteLength: slice after ArrayBuffer，getByteLength and byteLengthconsistent
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferGetByteLength0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(16);
      const sliced = buffer.slice(2, 8);
      expect(sliced.getByteLength()).assertEqual(sliced.byteLength);
    });

    /**
     * @tc.name testArrayBufferGetByteLength0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_METHOD_GET_BYTE_LENGTH_1900
     * @tc.desc Verify ArrayBuffer.getByteLength: resizable ArrayBuffer，getByteLength and byteLengthconsistent
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferGetByteLength0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4, 16);
      expect(buffer.getByteLength()).assertEqual(buffer.byteLength);
    });

    /**
     * @tc.name testArrayBufferGetByteLength0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_METHOD_GET_BYTE_LENGTH_2000
     * @tc.desc Verify ArrayBuffer.getByteLength: fromcreate ArrayBuffer，getByteLength and byteLengthconsistent
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferGetByteLength0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = ArrayBuffer.from("ABC", "utf8");
      expect(buffer.getByteLength()).assertEqual(buffer.byteLength);
    });

    /**
     * @tc.name testArrayBufferGetByteLength0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_METHOD_GET_BYTE_LENGTH_2100
     * @tc.desc Verify ArrayBuffer.getByteLength: resizable ArrayBuffer resize after ，getByteLengthreturns length
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferGetByteLength0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4, 16);
      buffer.resize(10);
      let result = buffer.getByteLength();
      expect(result).assertEqual(10);
    });

    /**
     * @tc.name testArrayBufferGetByteLength0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_METHOD_GET_BYTE_LENGTH_2200
     * @tc.desc Verify ArrayBuffer.getByteLength: resizable ArrayBuffer resize after ，getByteLengthreturns length
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferGetByteLength0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8, 16);
      buffer.resize(2);
      let result = buffer.getByteLength();
      expect(result).assertEqual(2);
    });

    /**
     * @tc.name testArrayBufferGetByteLength0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_METHOD_GET_BYTE_LENGTH_2300
     * @tc.desc Verify ArrayBuffer.getByteLength: resizable ArrayBuffer resize to 0 after ，getByteLengthreturns 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferGetByteLength0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4, 16);
      buffer.resize(0);
      let result = buffer.getByteLength();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferGetByteLength0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_METHOD_GET_BYTE_LENGTH_2400
     * @tc.desc Verify ArrayBuffer.getByteLength: resizable ArrayBuffer resize to maxByteLength after ，getByteLengthreturns maximum length
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferGetByteLength0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4, 16);
      buffer.resize(16);
      let result = buffer.getByteLength();
      expect(result).assertEqual(16);
    });

    /**
     * @tc.name testArrayBufferGetByteLength0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_METHOD_GET_BYTE_LENGTH_2500
     * @tc.desc Verify ArrayBuffer.getByteLength: resizable ArrayBuffermultiple resize after ，getByteLengthreturns length
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferGetByteLength0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4, 16);
      buffer.resize(8);
      expect(buffer.getByteLength()).assertEqual(8);
      buffer.resize(12);
      expect(buffer.getByteLength()).assertEqual(12);
      buffer.resize(4);
      expect(buffer.getByteLength()).assertEqual(4);
    });

    /**
     * @tc.name testArrayBufferGetByteLength0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_METHOD_GET_BYTE_LENGTH_2600
     * @tc.desc Verify ArrayBuffer.getByteLength: resize after getByteLength and byteLength consistent
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferGetByteLength0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4, 16);
      buffer.resize(10);
      expect(buffer.getByteLength()).assertEqual(buffer.byteLength);
      buffer.resize(2);
      expect(buffer.getByteLength()).assertEqual(buffer.byteLength);
    });

    /**
     * @tc.name testArrayBufferGetByteLength0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_METHOD_GET_BYTE_LENGTH_2700
     * @tc.desc Verify ArrayBuffer.getByteLength: passing undefined ，getByteLength returns length
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferGetByteLength0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      let result = buffer.getByteLength(undefined);
      expect(result).assertEqual(8);
    });

    /**
     * @tc.name testArrayBufferGetByteLength0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_METHOD_GET_BYTE_LENGTH_2800
     * @tc.desc Verify ArrayBuffer.getByteLength: passing null ，getByteLength returns length
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferGetByteLength0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      let result = buffer.getByteLength(null);
      expect(result).assertEqual(8);
    });

    /**
     * @tc.name testArrayBufferGetByteLength0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_METHOD_GET_BYTE_LENGTH_2900
     * @tc.desc Verify ArrayBuffer.getByteLength: passing ，getByteLength returns length
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferGetByteLength0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      let result = buffer.getByteLength(100);
      expect(result).assertEqual(8);
    });

    /**
     * @tc.name testArrayBufferGetByteLength0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_METHOD_GET_BYTE_LENGTH_3000
     * @tc.desc Verify ArrayBuffer.getByteLength: passing string ，getByteLength returns length
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferGetByteLength0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      let result = buffer.getByteLength("abc");
      expect(result).assertEqual(8);
    });

    /**
     * @tc.name testArrayBufferGetByteLength0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_METHOD_GET_BYTE_LENGTH_3100
     * @tc.desc Verify ArrayBuffer.getByteLength: passing object ，getByteLength returns length
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferGetByteLength0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      let result = buffer.getByteLength({});
      expect(result).assertEqual(8);
    });

    /**
     * @tc.name testArrayBufferGetByteLength0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_METHOD_GET_BYTE_LENGTH_3200
     * @tc.desc Verify ArrayBuffer.getByteLength: detached ArrayBuffercall getByteLength，verify return value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferGetByteLength0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      buffer.detach();
      let result = buffer.getByteLength();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferGetByteLength0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_METHOD_GET_BYTE_LENGTH_3300
     * @tc.desc Verify ArrayBuffer.getByteLength: detached ArrayBuffercall getByteLength and byteLengthconsistent
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferGetByteLength0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      buffer.detach();
      expect(buffer.getByteLength()).assertEqual(buffer.byteLength);
    });

    /**
     * @tc.name testArrayBufferGetByteLength0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_METHOD_GET_BYTE_LENGTH_3400
     * @tc.desc Verify ArrayBuffer.getByteLength: detached after multiple call getByteLength，return value consistent
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferGetByteLength0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      buffer.detach();
      let result1 = buffer.getByteLength();
      let result2 = buffer.getByteLength();
      expect(result1 === result2).assertTrue();
    });
    return;
  });
}
