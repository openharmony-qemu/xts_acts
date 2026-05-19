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
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
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
     * @tc.desc 验证 buffer.byteLength 在当前场景执行成功，返回结果与预期一致。
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
     * @tc.desc 验证 buffer.byteLength 在当前场景执行成功，返回结果与预期一致。
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
     * @tc.desc 验证 buffer.byteLength 在当前场景执行成功，返回结果与预期一致。
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
     * @tc.desc 验证 buffer.byteLength 在当前场景执行成功，返回结果与预期一致。
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
     * @tc.desc 验证 buffer.byteLength 在当前场景执行成功，返回结果与预期一致。
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
     * @tc.desc 验证 buffer.byteLength 在当前场景执行成功，返回结果与预期一致。
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
     * @tc.desc 验证 buffer.byteLength 在当前场景执行成功，返回结果与预期一致。
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
     * @tc.desc 验证 buffer.byteLength 在当前场景执行成功，返回结果与预期一致。
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
     * @tc.desc 验证 buffer.byteLength 在当前场景执行成功，返回结果与预期一致。
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
     * @tc.desc 验证 part.byteLength 在当前场景执行成功，返回结果与预期一致。
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
     * @tc.desc 验证 sliced.byteLength 在当前场景执行成功，返回值的 byteLength 为 6。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(16);
      const sliced = buffer.slice(4, 10);
      let result = sliced.byteLength;
      expect(result).assertEqual(6);
      expect(sliced.byteLength).assertEqual(6)
    });

    /**
     * @tc.name testArrayBufferByteLengthField0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_1200
     * @tc.desc 验证 sliced.byteLength 在当前场景执行成功，返回值的 byteLength 为 5。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      const sliced = buffer.slice(3);
      let result = sliced.byteLength;
      expect(result).assertEqual(5);
      expect(sliced.byteLength).assertEqual(5)
    });

    /**
     * @tc.name testArrayBufferByteLengthField0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_1300
     * @tc.desc 验证 sliced.byteLength 在当前场景执行成功，返回值的 byteLength 为 10。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(10);
      const sliced = buffer.slice(0);
      let result = sliced.byteLength;
      expect(result).assertEqual(10);
      expect(sliced.byteLength).assertEqual(10)
    });

    /**
     * @tc.name testArrayBufferByteLengthField0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_1400
     * @tc.desc 验证 new ArrayBuffer(4) 在当前场景执行成功，返回值的 byteLength 为 4。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      expect(buffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.name testArrayBufferByteLengthField0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_1500
     * @tc.desc 验证 new ArrayBuffer(8) 在当前场景执行成功，返回值的 byteLength 为 8。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      expect(buffer.byteLength).assertEqual(8);
    });

    /**
     * @tc.name testArrayBufferByteLengthField0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_1600
     * @tc.desc 验证 new ArrayBuffer(8) 在当前场景执行成功，等值关系判断符合预期。
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
     * @tc.desc 验证 buffer.byteLength 在当前场景执行成功，等值关系判断符合预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      let result = buffer.byteLength;
      let kind: string = typeof result;
      expect(kind === 'number' || kind === 'int').assertTrue();
    });

    /**
     * @tc.name testArrayBufferByteLengthField0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_1800
     * @tc.desc 验证 buffer.byteLength 在当前场景执行成功，长度与偏移关系判断符合预期。
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
     * @tc.desc 验证 buffer.byteLength 在当前场景执行成功，边界值比较判断符合预期。
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
     * @tc.desc 验证 new ArrayBuffer(100) 在当前场景执行成功，返回结果与预期一致。
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
     * @tc.desc 验证 new ArrayBuffer(8) 在当前场景执行成功，返回值的 byteLength 为 buffer.getByteLength(。
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
     * @tc.desc 验证 new ArrayBuffer(0) 在当前场景执行成功，返回值的 byteLength 为 buffer.getByteLength(。
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
     * @tc.desc 验证 new ArrayBuffer(65536) 在当前场景执行成功，返回值的 byteLength 为 buffer.getByteLength(。
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
     * @tc.desc 验证 new ArrayBuffer(16) 在当前场景执行成功，返回值的 byteLength 为 sliced.getByteLength(。
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
     * @tc.desc 验证 ArrayBuffer.from("ABC", "utf8") 在当前场景执行成功，返回值的 byteLength 为 buffer.getByteLength(。
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
     * @tc.desc 验证 new ArrayBuffer(4, 16) 在当前场景执行成功，返回值的 byteLength 为 buffer.getByteLength(。
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
     * @tc.desc 验证 new ArrayBuffer(32) 在当前场景执行成功，返回值的 byteLength 为 32。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(32);
      expect(buffer.byteLength).assertEqual(32);
    });

    /**
     * @tc.name testArrayBufferByteLengthField0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_2800
     * @tc.desc 验证 new ArrayBuffer(1) 在当前场景执行成功，返回值的 byteLength 为 1。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(1);
      expect(buffer.byteLength).assertEqual(1);
    });

    /**
     * @tc.name testArrayBufferByteLengthField0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_2900
     * @tc.desc 验证 new ArrayBuffer(128) 在当前场景执行成功，返回值的 byteLength 为 128。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(128);
      expect(buffer.byteLength).assertEqual(128);
    });

    /**
     * @tc.name testArrayBufferByteLengthField0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_3000
     * @tc.desc 验证 buffer.byteLength 在当前场景执行成功，返回结果与预期一致。
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
     * @tc.desc 验证 buffer.byteLength 在当前场景执行成功，返回结果与预期一致。
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
     * @tc.desc 验证 buffer.byteLength 在当前场景执行成功，返回结果与预期一致。
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
     * @tc.desc 验证 buffer.byteLength 在当前场景执行成功，返回结果与预期一致。
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
     * @tc.desc 验证 buffer.byteLength 在当前场景执行成功，返回结果与预期一致。
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
     * @tc.desc 验证 new ArrayBuffer(4, 16) 在当前场景执行成功，返回值的 byteLength 为 8。
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
     * @tc.desc 验证 new ArrayBuffer(4, 16) 在当前场景执行成功，返回值的 byteLength 为 buffer.getByteLength(。
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
     * @tc.desc 验证 new ArrayBuffer(8) 在当前场景执行成功，返回值的 byteLength 为 before。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      let before = buffer.byteLength;
      expect(buffer.byteLength).assertEqual(before);
      expect(buffer.getByteLength()).assertEqual(before);
    });

    /**
     * @tc.name testArrayBufferByteLengthField0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_3800
     * @tc.desc 验证 buffer.byteLength 在当前场景执行成功，边界值比较判断符合预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(0);
      let result = buffer.byteLength;
      expect(result >= 0).assertTrue();
      expect(result).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferByteLengthField0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FIELD_BYTE_LENGTH_3900
     * @tc.desc 验证 buffer.byteLength 在当前场景执行成功，返回结果与预期一致。
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
     * @tc.desc 验证 new ArrayBuffer(8, 16) 在当前场景执行成功，返回值的 byteLength 为 buffer.getByteLength(。
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
     * @tc.desc 验证 new ArrayBuffer(8, 16) 在当前场景执行成功，等值关系判断符合预期。
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
     * @tc.desc 验证 new ArrayBuffer(4, 16) 在当前场景执行成功，返回值的 byteLength 为 0。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferByteLengthField0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4, 16);
      buffer.resize(0);
      expect(buffer.byteLength).assertEqual(0);
    });
    return;
  });
}