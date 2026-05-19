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

class ArrayBufferToStringPlainForMindmap {
}

export default function arrayBufferToStringTest(): void {
  describe('ArrayBufferToStringTest', (): void => {
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
     * @tc.name testArrayBufferToString0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_0100
     * @tc.desc 验证 buffer.toString() 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      let result = buffer.toString();
      expect(result).assertEqual("[object ArrayBuffer]");
      expect(result.length).assertEqual(20);
    });

    /**
     * @tc.name testArrayBufferToString0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_0200
     * @tc.desc 验证 buffer.toString() 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      let result = buffer.toString();
      expect(result).assertEqual("[object ArrayBuffer]");
    });

    /**
     * @tc.name testArrayBufferToString0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_0300
     * @tc.desc 验证 new ArrayBuffer(4) 在当前场景执行成功，边界值比较判断符合预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      let s = buffer.toString();
      expect(s.length >= 0).assertTrue();
      expect(buffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.name testArrayBufferToString0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_0400
     * @tc.desc 验证 buffer.toString() 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(0);
      let result = buffer.toString();
      expect(result).assertEqual("[object ArrayBuffer]");
    });

    /**
     * @tc.name testArrayBufferToString0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_0500
     * @tc.desc 验证 buffer.toString() 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(1);
      let result = buffer.toString();
      expect(result).assertEqual("[object ArrayBuffer]");
    });

    /**
     * @tc.name testArrayBufferToString0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_0600
     * @tc.desc 验证 buffer.toString() 在当前场景执行成功，实例类型判断符合预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      let result = buffer.toString();
      expect(Class.of(buffer).getName().indexOf("ArrayBuffer") >= 0).assertTrue();
      expect(result).assertEqual("[object ArrayBuffer]");
    });

    /**
     * @tc.name testArrayBufferToString0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_0700
     * @tc.desc 验证 buffer.toString() 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(1024);
      let result = buffer.toString();
      expect(result).assertEqual("[object ArrayBuffer]");
    });

    /**
     * @tc.name testArrayBufferToString0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_0800
     * @tc.desc 验证 buffer.toString() 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(65536);
      let result = buffer.toString();
      expect(result).assertEqual("[object ArrayBuffer]");
    });

    /**
     * @tc.name testArrayBufferToString0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_0900
     * @tc.desc 验证 buffer.toString() 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      let result = buffer.toString();
      expect(typeof result).assertEqual("string");
    });

    /**
     * @tc.name testArrayBufferToString0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_1000
     * @tc.desc 验证 buffer.toString() 在当前场景执行成功，实例类型判断符合预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      let result = buffer.toString();
      expect(typeof result === 'string').assertTrue()
    });

    /**
     * @tc.name testArrayBufferToString0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_1100
     * @tc.desc 验证 buffer.toString() 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      let result = buffer.toString();
      expect(result.length).assertEqual("[object ArrayBuffer]".length);
    });

    /**
     * @tc.name testArrayBufferToString0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_1200
     * @tc.desc 验证 buffer.resize(4) 在当前场景执行成功，等值关系判断符合预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      let result = buffer.toString();
      expect(result === "[object ArrayBuffer]").assertTrue();
    });

    /**
     * @tc.name testArrayBufferToString0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_1300
     * @tc.desc 验证 buffer.resize(4) 在当前场景执行成功，等值关系判断符合预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      let result1 = buffer.toString();
      let result2 = buffer.toString();
      expect(result1 === result2).assertTrue();
    });

    /**
     * @tc.name testArrayBufferToString0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_1400
     * @tc.desc 验证 buffer.resize(4) 在当前场景执行成功，返回值的 byteLength 为 0。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(0);
      let s = buffer.toString();
      expect(s).assertEqual("[object ArrayBuffer]");
      expect(buffer.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferToString0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_1500
     * @tc.desc 验证 buffer.resize(4) 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8, 16);
      let result = buffer.toString();
      expect(result).assertEqual("[object ArrayBuffer]");
    });

    /**
     * @tc.name testArrayBufferToString0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_1600
     * @tc.desc 验证 buffer.resize(4) 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8, 16);
      buffer.resize(4);
      let result = buffer.toString();
      expect(result).assertEqual("[object ArrayBuffer]");
    });

    /**
     * @tc.name testArrayBufferToString0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_1700
     * @tc.desc 验证 buffer.resize(0) 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8, 16);
      buffer.resize(0);
      let result = buffer.toString();
      expect(result).assertEqual("[object ArrayBuffer]");
    });

    /**
     * @tc.name testArrayBufferToString0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_1800
     * @tc.desc 验证 buffer.resize(3) 在当前场景执行成功，返回值的 byteLength 为 4。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(16);
      const sliced = buffer.slice(4, 8);
      let result = sliced.toString();
      expect(result).assertEqual("[object ArrayBuffer]");
      expect(sliced.byteLength).assertEqual(4)
    });

    /**
     * @tc.name testArrayBufferToString0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_1900
     * @tc.desc 验证 buffer.resize(3) 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      const view = new Uint8Array(buffer);
      view[0] = 72;
      view[1] = 101;
      view[2] = 108;
      view[3] = 108;
      view[4] = 111;
      let result = buffer.toString();
      expect(result).assertEqual("[object ArrayBuffer]");
    });

    /**
     * @tc.name testArrayBufferToString0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_2000
     * @tc.desc 验证 buffer.resize(3) 在当前场景执行成功，返回值的 byteLength 为 3。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8, 16);
      buffer.resize(3);
      let s = buffer.toString();
      expect(s).assertEqual("[object ArrayBuffer]");
      expect(buffer.byteLength).assertEqual(3);
    });

    /**
     * @tc.name testArrayBufferToString0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_2100
     * @tc.desc 验证 new ArrayBuffer(16) 在当前场景执行成功，返回值的 byteLength 为 16。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(16);
      buffer.set(0, Int.toByte(0xaa));
      let s = buffer.toString();
      expect(s).assertEqual("[object ArrayBuffer]");
      expect(buffer.byteLength).assertEqual(16);
    });

    /**
     * @tc.name testArrayBufferToString0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_2200
     * @tc.desc 验证 new ArrayBuffer(8) 在当前场景执行成功，边界值比较判断符合预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      let s = buffer.toString();
      expect(s.length >= 0).assertTrue();
      expect(buffer.byteLength).assertEqual(8);
    });

    /**
     * @tc.name testArrayBufferToString0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_2300
     * @tc.desc 验证 new ArrayBuffer(16) 在当前场景执行成功，边界值比较判断符合预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(16);
      let s = buffer.toString();
      expect(s.length >= 0).assertTrue();
      expect(buffer.byteLength).assertEqual(16);
    });

    /**
     * @tc.name testArrayBufferToString0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_2400
     * @tc.desc 验证 buffer.toString() 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      let result = buffer.toString();
      expect(result).assertEqual("[object ArrayBuffer]");
    });

    /**
     * @tc.name testArrayBufferToString0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_2500
     * @tc.desc 验证 new ArrayBufferToStringPlainForMindmap() 在当前场景执行成功，实例类型判断符合预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let plain = new ArrayBufferToStringPlainForMindmap();
      expect(Class.of(plain).getName().indexOf("ArrayBufferToStringPlainForMindmap") >= 0).assertTrue();
    });

    /**
     * @tc.name testArrayBufferToString0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_TO_STRING_2600
     * @tc.desc 验证 new Uint8Array(8) 在当前场景执行成功，实例类型判断符合预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferToString0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Uint8Array(8);
      expect(Class.of(arr).getName().indexOf("Uint8Array") >= 0).assertTrue();
    });
    return;
  });
}