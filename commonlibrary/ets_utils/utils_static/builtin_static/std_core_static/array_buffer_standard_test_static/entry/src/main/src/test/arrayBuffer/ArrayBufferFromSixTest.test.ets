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

class ArrayBufferFromSixPlainForMindmap {
}

export default function arrayBufferFromSixTest(): void {
  describe('ArrayBufferFromSixTest', (): void => {
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
     * @tc.name testArrayBufferFromSix0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_0100
     * @tc.desc 验证 ArrayBuffer.from("abcd", "utf8") 在当前场景执行成功，返回值的 byteLength 为 2。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from("abcd", "utf8");
      const result = ArrayBuffer.from(source, 1, 2);
      expect(result.byteLength).assertEqual(2);
      expect(result.at(0)).assertEqual(98);
      expect(result.at(1)).assertEqual(99);
    });

    /**
     * @tc.name testArrayBufferFromSix0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_0200
     * @tc.desc 验证 ArrayBuffer.from("abcd", "utf8") 在当前场景执行成功，返回值的 byteLength 为 2。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from("abcd", "utf8");
      const result = ArrayBuffer.from(source, 1, 2);
      expect(result.byteLength).assertEqual(2);
    });

    /**
     * @tc.name testArrayBufferFromSix0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_0300
     * @tc.desc 验证 ArrayBuffer.from("abcd", "utf8") 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const source = ArrayBuffer.from("abcd", "utf8");
        const result = ArrayBuffer.from(source, 1);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromSix0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_0400
     * @tc.desc 验证 ArrayBuffer.from("abcd", "utf8") 在当前场景执行成功，返回值的 byteLength 为 source.byteLength。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from("abcd", "utf8");
      const result = ArrayBuffer.from(source);
      expect(result.byteLength).assertEqual(source.byteLength);

    });

    /**
     * @tc.name testArrayBufferFromSix0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_0500
     * @tc.desc 验证 ArrayBuffer.from("WXYZ", "utf8") 在当前场景执行成功，返回值的 byteLength 为 1。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from("WXYZ", "utf8");
      const result = ArrayBuffer.from(source, 3, 1);
      expect(result.byteLength).assertEqual(1);
      expect(result.at(0)).assertEqual(90);
    });

    /**
     * @tc.name testArrayBufferFromSix0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_0600
     * @tc.desc 验证 ArrayBuffer.from("hello", "utf8") 在当前场景执行成功，返回值的 byteLength 为 5。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from("hello", "utf8");
      const result = ArrayBuffer.from(source, 0, (source.byteLength as int));
      expect(result.byteLength).assertEqual(5);
    });

    /**
     * @tc.name testArrayBufferFromSix0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_0700
     * @tc.desc 验证 ArrayBuffer.from(empty, 0, 0) 在当前场景执行成功，返回值的 byteLength 为 0。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty = new ArrayBuffer(0);
      const result = ArrayBuffer.from(empty, 0, 0);
      expect(result.byteLength).assertEqual(0);
      expect(result instanceof ArrayBuffer).assertTrue();
    });

    /**
     * @tc.name testArrayBufferFromSix0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_0800
     * @tc.desc 验证 ArrayBuffer.from("abcdefghijklmnopqrstuvwxyz", "utf8") 在当前场景执行成功，返回值的 byteLength 为 10。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from("abcdefghijklmnopqrstuvwxyz", "utf8");
      const result = ArrayBuffer.from(source, 5, 10);
      expect(result.byteLength).assertEqual(10);
    });

    /**
     * @tc.name testArrayBufferFromSix0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_0900
     * @tc.desc 验证 ArrayBuffer.from("hello", "utf8") 在当前场景执行成功，返回值的 byteLength 为 source.byteLength。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from("hello", "utf8");
      const result = ArrayBuffer.from(source, 0, source.byteLength);
      expect(result.byteLength).assertEqual(source.byteLength);
    });

    /**
     * @tc.name testArrayBufferFromSix0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_1000
     * @tc.desc 验证 ArrayBuffer.from(empty, 0, 0) 在当前场景执行成功，返回值的 byteLength 为 0。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty = new ArrayBuffer(0);
      const result = ArrayBuffer.from(empty, 0, 0);
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferFromSix0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_1100
     * @tc.desc 验证 ArrayBuffer.from(Utils.castToArrayBuffer(null as Object), 0, 1) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const result = ArrayBuffer.from(Utils.castToArrayBuffer(null as Object), 0, 1);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromSix0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_1200
     * @tc.desc 验证 ArrayBuffer.from(Utils.castToArrayBuffer(null as Object), 0, 2) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const result = ArrayBuffer.from(Utils.castToArrayBuffer(null as Object), 0, 2);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromSix0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_1300
     * @tc.desc 验证 ArrayBuffer.from(Utils.castToArrayBuffer("abcd" as Object)) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const result = ArrayBuffer.from(Utils.castToArrayBuffer("abcd" as Object), 0, 1);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromSix0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_1400
     * @tc.desc 验证 ArrayBuffer.from(Utils.numberAsArrayBuffer(_badNum2), 0, 1) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      try {
        const _badNum2: number = 12345;
        const result = ArrayBuffer.from(Utils.numberAsArrayBuffer(_badNum2), 0, 1);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromSix0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_1500
     * @tc.desc 验证 ArrayBuffer.from("abcdef", "utf8") 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from("abcdef", "utf8");
      const result = ArrayBuffer.from(source, 0, 3);
      const str = ArrayBuffer.stringify(result, "utf8", 0, result.byteLength);
      expect(str).assertEqual("abc");
    });

    /**
     * @tc.name testArrayBufferFromSix0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_1600
     * @tc.desc 验证 ArrayBuffer.from("abcdef", "utf8") 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from("abcdef", "utf8");
      const result = ArrayBuffer.from(source, 2, 3);
      const str = ArrayBuffer.stringify(result, "utf8", 0, result.byteLength);
      expect(str).assertEqual("cde");
    });

    /**
     * @tc.name testArrayBufferFromSix0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_1700
     * @tc.desc 验证 ArrayBuffer.from("abcdef", "utf8") 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from("abcdef", "utf8");
      const result = ArrayBuffer.from(source, (source.byteLength as int) - 1, 1);
      const str = ArrayBuffer.stringify(result, "utf8", 0, result.byteLength);
      expect(str).assertEqual("f");
    });

    /**
     * @tc.name testArrayBufferFromSix0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_1800
     * @tc.desc 验证 ArrayBuffer.from("abcdef", "utf8") 在当前场景执行成功，返回值的 byteLength 为 0。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from("abcdef", "utf8");
      const result = ArrayBuffer.from(source, (source.byteLength as int), 0);
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferFromSix0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_1900
     * @tc.desc 验证 ArrayBuffer.from("abcdef", "utf8") 在当前场景执行成功，返回值的 byteLength 为 1。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from("abcdef", "utf8");
      const lastOff: int = (source.byteLength as int) - 1;
      const result = ArrayBuffer.from(source, lastOff, 1);
      const str = ArrayBuffer.stringify(result, "utf8", 0, result.byteLength);
      expect(result.byteLength).assertEqual(1);
      expect(str).assertEqual("f");
    });

    /**
     * @tc.name testArrayBufferFromSix0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_2000
     * @tc.desc 验证 ArrayBuffer.from("abcdef", "utf8") 在当前场景执行成功，返回值的 byteLength 为 0。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from("abcdef", "utf8");
      const result = ArrayBuffer.from(source, source.byteLength, 0);
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferFromSix0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_2100
     * @tc.desc 验证 ArrayBuffer.from(source, source.byteLength + 1, 1) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      try {
        const result = ArrayBuffer.from(source, source.byteLength + 1, 1);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromSix0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_2200
     * @tc.desc 验证 ArrayBuffer.from(source, -1, 1) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      try {
        const result = ArrayBuffer.from(source, -1, 1);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromSix0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_2300
     * @tc.desc 验证 ArrayBuffer.from("abcdef", "utf8") 在当前场景执行成功，实例类型判断符合预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from("abcdef", "utf8");
      const result = ArrayBuffer.from(source, Double.toInt(1.5), 1);
      expect(result instanceof ArrayBuffer).assertTrue()
    });

    /**
     * @tc.name testArrayBufferFromSix0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_2400
     * @tc.desc 验证 ArrayBuffer.from("abcdef", "utf8") 在当前场景执行成功，返回值的 byteLength 为 1。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from("abcdef", "utf8");
      const result = ArrayBuffer.from(source, Double.toInt(1.5), 1);
      expect(result.byteLength).assertEqual(1);
      expect(result.at(0)).assertEqual(source.at(1));
    });

    /**
     * @tc.name testArrayBufferFromSix0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_2500
     * @tc.desc 验证 ArrayBuffer.from("abcdef", "utf8") 在当前场景执行成功，返回值的 byteLength 为 0。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from("abcdef", "utf8");
      const result = ArrayBuffer.from(source, 0, 0);
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferFromSix0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_2600
     * @tc.desc 验证 ArrayBuffer.from("abcdef", "utf8") 在当前场景执行成功，返回值的 byteLength 为 1。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from("abcdef", "utf8");
      const result = ArrayBuffer.from(source, 0, 1);
      expect(result.byteLength).assertEqual(1);
    });

    /**
     * @tc.name testArrayBufferFromSix0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_2700
     * @tc.desc 验证 ArrayBuffer.from("abcdef", "utf8") 在当前场景执行成功，返回值的 byteLength 为 3。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from("abcdef", "utf8");
      const result = ArrayBuffer.from(source, 1, 3);
      expect(result.byteLength).assertEqual(3);
    });

    /**
     * @tc.name testArrayBufferFromSix0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_2800
     * @tc.desc 验证 ArrayBuffer.from("abcdef", "utf8") 在当前场景执行成功，返回值的 byteLength 为 4。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from("abcdef", "utf8");
      const result = ArrayBuffer.from(source, 2, (source.byteLength as int) - 2);
      expect(result.byteLength).assertEqual(4);
    });

    /**
     * @tc.name testArrayBufferFromSix0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_2900
     * @tc.desc 验证 ArrayBuffer.from("abcdef", "utf8") 在当前场景执行成功，返回值的 byteLength 为 source.byteLength。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from("abcdef", "utf8");
      const result = ArrayBuffer.from(source, 0, (source.byteLength as int));
      expect(result.byteLength).assertEqual(source.byteLength);
    });

    /**
     * @tc.name testArrayBufferFromSix0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_3000
     * @tc.desc 验证 ArrayBuffer.from("abcdef", "utf8") 在当前场景执行成功，返回值的 byteLength 为 source.byteLength。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from("abcdef", "utf8");
      const result = ArrayBuffer.from(source, 0, source.byteLength);
      expect(result.byteLength).assertEqual(source.byteLength);
    });

    /**
     * @tc.name testArrayBufferFromSix0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_3100
     * @tc.desc 验证 ArrayBuffer.from("abcdef", "utf8") 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from("abcdef", "utf8");
      try {
        const result = ArrayBuffer.from(source, 2, source.byteLength);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        expect(source.byteLength).assertEqual(6);
        expect(source.at(0)).assertEqual(97);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromSix0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_3200
     * @tc.desc 验证 ArrayBuffer.from(source, 0, -1) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      try {
        const result = ArrayBuffer.from(source, 0, -1);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromSix0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_3300
     * @tc.desc 验证 ArrayBuffer.from("abcdef", "utf8") 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const source = ArrayBuffer.from("abcdef", "utf8");
        const result = ArrayBuffer.from(source, 0, Utils.castToInt(null as Object));
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromSix0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_3400
     * @tc.desc 验证 ArrayBuffer.from("abcdef", "utf8") 在当前场景执行成功，实例类型判断符合预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from("abcdef", "utf8");
      const result = ArrayBuffer.from(source, 0, Double.toInt(2.5));
      expect(result instanceof ArrayBuffer).assertTrue()
    });

    /**
     * @tc.name testArrayBufferFromSix0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_3500
     * @tc.desc 验证 ArrayBuffer.from("abcdef", "utf8") 在当前场景执行成功，返回值的 byteLength 为 2。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from("abcdef", "utf8");
      const result = ArrayBuffer.from(source, 0, 2.5);
      expect(result.byteLength).assertEqual(2);
    });

    /**
     * @tc.name testArrayBufferFromSix0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_3600
     * @tc.desc 验证 ArrayBuffer.from("abcdefghij", "utf8") 在当前场景执行成功，返回值的 byteLength 为 4。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from("abcdefghij", "utf8");
      const result = ArrayBuffer.from(source, 3, 4);
      expect(result.byteLength).assertEqual(4);
    });

    /**
     * @tc.name testArrayBufferFromSix0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_3700
     * @tc.desc 验证 ArrayBuffer.from("abcd", "utf8") 在当前场景执行成功，返回值的 byteLength 为 sourceLen。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from("abcd", "utf8");
      const result = ArrayBuffer.from(source, 0, (source.byteLength as int));
      const sourceLen = source.byteLength;
      expect(result.byteLength).assertEqual(sourceLen);
      expect(result != source).assertTrue();
    });

    /**
     * @tc.name testArrayBufferFromSix0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_3800
     * @tc.desc 验证 ArrayBuffer.from("1234567890", "utf8") 在当前场景执行成功，返回值的 byteLength 为 2。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from("1234567890", "utf8");
      const r1 = ArrayBuffer.from(source, 0, 2);
      const r2 = ArrayBuffer.from(source, 5, 3);
      expect(r1.byteLength).assertEqual(2);
      expect(r2.byteLength).assertEqual(3);
    });

    /**
     * @tc.name testArrayBufferFromSix0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_3900
     * @tc.desc 验证 ArrayBuffer.from("abcd", "utf8") 在当前场景执行成功，实例类型判断符合预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from("abcd", "utf8");
      const result = ArrayBuffer.from(source, 0, 2);
      expect(result instanceof ArrayBuffer).assertTrue();
    });

    /**
     * @tc.name testArrayBufferFromSix0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_4000
     * @tc.desc 验证 ArrayBuffer.from("abcd", "utf8") 在当前场景执行成功，实例类型判断符合预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from("abcd", "utf8");
      const result = ArrayBuffer.from(source, 0, 2);
      expect(result instanceof ArrayBuffer).assertTrue()
    });

    /**
     * @tc.name testArrayBufferFromSix0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_4100
     * @tc.desc 验证 ArrayBuffer.from("abcd", "utf8") 在当前场景执行成功，实例类型判断符合预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from("abcd", "utf8");
      const result = ArrayBuffer.from(source, 0, 2);
      expect(Class.of(result).getName().indexOf('ArrayBuffer') >= 0).assertTrue();
    });

    /**
     * @tc.name testArrayBufferFromSix0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_4200
     * @tc.desc 验证 ArrayBuffer.from("abcd", "utf8") 在当前场景执行成功，实例类型判断符合预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from("abcd", "utf8");
      const result = ArrayBuffer.from(source, 1, 2);
      expect(Utils.isRuntimeNumericOrIntTypeof(typeof result.byteLength)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferFromSix0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_4300
     * @tc.desc 验证 ArrayBuffer.from("abcdef", "utf8") 在当前场景执行成功，返回的数据内容与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from("abcdef", "utf8");
      const result = ArrayBuffer.from(source, 1, 3);
      expect(result.at(0)).assertEqual(source.at(1));
      expect(result.at(1)).assertEqual(source.at(2));
      expect(result.at(2)).assertEqual(source.at(3));
    });

    /**
     * @tc.name testArrayBufferFromSix0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_4400
     * @tc.desc 验证 ArrayBuffer.from("abcdef", "utf8") 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from("abcdef", "utf8");
      const result = ArrayBuffer.from(source, 1, 2);
      const str = ArrayBuffer.stringify(result, "utf8", 0, result.byteLength);
      expect(str).assertEqual("bc");
    });

    /**
     * @tc.name testArrayBufferFromSix0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_4500
     * @tc.desc 验证 ArrayBuffer.from("hello world", "utf8") 在当前场景执行成功，返回的数据内容与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from("hello world", "utf8");
      const result = ArrayBuffer.from(source, 0, (source.byteLength as int));
      for (let i: int = 0; i < result.byteLength; i++) {
        expect(result.at(i)).assertEqual(source.at(i));
      }
    });

    /**
     * @tc.name testArrayBufferFromSix0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_4600
     * @tc.desc 验证 ArrayBuffer.from("abcdefghij", "utf8") 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from("abcdefghij", "utf8");
      const result = ArrayBuffer.from(source, 3, 4);
      const str = ArrayBuffer.stringify(result, "utf8", 0, result.byteLength);
      expect(str).assertEqual("defg");
    });

    /**
     * @tc.name testArrayBufferFromSix0047
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_4700
     * @tc.desc 验证 ArrayBuffer.from("fullcopy", "utf8") 在当前场景执行成功，返回值的 byteLength 为 source.byteLength。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from("fullcopy", "utf8");
      const result = ArrayBuffer.from(source, 0, (source.byteLength as int));
      expect(result.byteLength).assertEqual(source.byteLength);
      const str = ArrayBuffer.stringify(result, "utf8", 0, result.byteLength);
      expect(str).assertEqual("fullcopy");
    });

    /**
     * @tc.name testArrayBufferFromSix0048
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_4800
     * @tc.desc 验证 ArrayBuffer.from("abcd", "utf8") 在当前场景执行成功，返回值的 byteLength 为 0。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from("abcd", "utf8");
      const result = ArrayBuffer.from(source, 0, 0);
      expect(result.byteLength).assertEqual(0);
      expect(result instanceof ArrayBuffer).assertTrue();
    });

    /**
     * @tc.name testArrayBufferFromSix0049
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_4900
     * @tc.desc 验证 ArrayBuffer.from("abcd", "utf8") 在当前场景执行成功，返回值的 byteLength 为 0。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from("abcd", "utf8");
      const result = ArrayBuffer.from(source, (source.byteLength as int), 0);
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferFromSix0050
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_5000
     * @tc.desc 验证 ArrayBuffer.from("abcd", "utf8") 在当前场景执行成功，返回值的 byteLength 为 1。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from("abcd", "utf8");
      const result = ArrayBuffer.from(source, 0, 1);
      expect(result.byteLength).assertEqual(1);
      expect(result.at(0)).assertEqual(source.at(0));
    });

    /**
     * @tc.name testArrayBufferFromSix0051
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_5100
     * @tc.desc 验证 ArrayBuffer.from("abcd", "utf8") 在当前场景执行成功，返回值的 byteLength 为 1。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from("abcd", "utf8");
      const result = ArrayBuffer.from(source, (source.byteLength as int) - 1, 1);
      expect(result.byteLength).assertEqual(1);
      expect(result.at(0)).assertEqual(source.at(source.byteLength - 1));
    });

    /**
     * @tc.name testArrayBufferFromSix0052
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_5200
     * @tc.desc 验证 ArrayBuffer.from(empty, 0, 0) 在当前场景执行成功，返回值的 byteLength 为 0。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      const empty = new ArrayBuffer(0);
      const result = ArrayBuffer.from(empty, 0, 0);
      expect(result.byteLength).assertEqual(0);
      expect(empty.byteLength).assertEqual(0);
      expect(result !== empty).assertTrue();
    });

    /**
     * @tc.name testArrayBufferFromSix0053
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_5300
     * @tc.desc 验证 ArrayBuffer.from("x", "utf8") 在当前场景执行成功，返回值的 byteLength 为 1。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from("x", "utf8");
      const result = ArrayBuffer.from(source, 0, 1);
      expect(result.byteLength).assertEqual(1);
      expect(result.at(0)).assertEqual(source.at(0));
    });

    /**
     * @tc.name testArrayBufferFromSix0054
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_5400
     * @tc.desc 验证 ArrayBuffer.from(Utils.castToArrayBuffer(null as Object), 0, 1) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const result = ArrayBuffer.from(Utils.castToArrayBuffer(null as Object), 0, 1);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromSix0055
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_5500
     * @tc.desc 验证 ArrayBuffer.from(Utils.castToArrayBuffer(undefined as Object), 0, 1) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const result = ArrayBuffer.from(Utils.castToArrayBuffer(undefined as Object), 0, 1);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromSix0056
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_5600
     * @tc.desc 验证 ArrayBuffer.from("abcd", "utf8") 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const source = ArrayBuffer.from("abcd", "utf8");
        const result = ArrayBuffer.from(source, Utils.castToInt(null as Object), 1);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromSix0057
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_5700
     * @tc.desc 验证 ArrayBuffer.from("abcd", "utf8") 在当前场景执行成功，空值有效性判断符合预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from("abcd", "utf8");
      let result: ArrayBuffer;
      try {
        result = ArrayBuffer.from(source, undefined, 1);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(result.byteLength).assertEqual(1);
    });

    /**
     * @tc.name testArrayBufferFromSix0058
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_5800
     * @tc.desc 验证 ArrayBuffer.from("abcd", "utf8") 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const source = ArrayBuffer.from("abcd", "utf8");
        const result = ArrayBuffer.from(source, 0, Utils.castToInt(null as Object));
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromSix0059
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_5900
     * @tc.desc 验证 ArrayBuffer.from("abcd", "utf8") 在当前场景执行成功，返回值的 byteLength 为 4。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from("abcd", "utf8");
      const result = ArrayBuffer.from(source, 0, undefined);
      expect(result.byteLength).assertEqual(4);
    });

    /**
     * @tc.name testArrayBufferFromSix0060
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_6000
     * @tc.desc 验证 ArrayBuffer.from("abcdef", "utf8") 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from("abcdef", "utf8");
      try {
        const result = ArrayBuffer.from(source, 0, 1000);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromSix0061
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_6100
     * @tc.desc 验证 ArrayBuffer.from("abcdef", "utf8") 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from("abcdef", "utf8");
      try {
        const result = ArrayBuffer.from(source, source.byteLength, 1);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromSix0062
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_6200
     * @tc.desc 验证 ArrayBuffer.from("abcdef", "utf8") 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from("abcdef", "utf8");
      try {
        const result = ArrayBuffer.from(source, source.byteLength + 10, 1);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromSix0063
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_6300
     * @tc.desc 验证 ArrayBuffer.from("abcdef", "utf8") 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from("abcdef", "utf8");
      try {
        const result = ArrayBuffer.from(source, -1, 2);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromSix0064
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_6400
     * @tc.desc 验证 ArrayBuffer.from("abcdef", "utf8") 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from("abcdef", "utf8");
      try {
        const result = ArrayBuffer.from(source, -100, 2);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromSix0065
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_6500
     * @tc.desc 验证 ArrayBuffer.from("abcdef", "utf8") 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from("abcdef", "utf8");
      try {
        const result = ArrayBuffer.from(source, 0, -1);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromSix0066
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_6600
     * @tc.desc 验证 ArrayBuffer.from("abcdef", "utf8") 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from("abcdef", "utf8");
      try {
        const result = ArrayBuffer.from(source, 0, -100);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        expect(source.at(1)).assertEqual(98);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromSix0067
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_6700
     * @tc.desc 验证 ArrayBuffer.from("abcdef", "utf8") 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from("abcdef", "utf8");
      try {
        const result = ArrayBuffer.from(source, -1, -1);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromSix0068
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_6800
     * @tc.desc 验证 ArrayBuffer.from("abcdef", "utf8") 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = ArrayBuffer.from("abcdef", "utf8");
      try {
        const result = ArrayBuffer.from(Utils.castToArrayBuffer("not_arraybuffer" as Object), 0, 1);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromSix0069
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_6900
     * @tc.desc 验证 ArrayBuffer.from(Utils.castToArrayBuffer(true as Object), 0, 1) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const result = ArrayBuffer.from(Utils.castToArrayBuffer(true as Object), 0, 1);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromSix0070
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_7000
     * @tc.desc 验证 ArrayBuffer.from(Utils.castToArrayBuffer(new ArrayBufferFromSixPlainForMindmap() as Object),... 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const result =
          ArrayBuffer.from(Utils.castToArrayBuffer(new ArrayBufferFromSixPlainForMindmap() as Object), 0, 1);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromSix0071
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_7100
     * @tc.desc 验证 ArrayBuffer.from("abcd", "utf8") 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const source = ArrayBuffer.from("abcd", "utf8");
        const result = ArrayBuffer.from(source, Utils.castToInt("0" as Object), 1);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromSix0072
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_7200
     * @tc.desc 验证 ArrayBuffer.from("abcd", "utf8") 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const source = ArrayBuffer.from("abcd", "utf8");
        const result = ArrayBuffer.from(source, Utils.castToInt(true as Object), 1);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromSix0073
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_7300
     * @tc.desc 验证 ArrayBuffer.from("abcd", "utf8") 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const source = ArrayBuffer.from("abcd", "utf8");
        const result = ArrayBuffer.from(source, 0, Utils.castToInt("2" as Object));
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromSix0074
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_7400
     * @tc.desc 验证 ArrayBuffer.from("abcd", "utf8") 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const source = ArrayBuffer.from("abcd", "utf8");
        const result = ArrayBuffer.from(source, 0, Utils.castToInt(true as Object));
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromSix0075
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_7500
     * @tc.desc 验证 ArrayBuffer.from("abcd", "utf8") 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const source = ArrayBuffer.from("abcd", "utf8");
        ArrayBuffer.from(source, 0, Utils.castToInt("2" as Object));
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromSix0076
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_7600
     * @tc.desc 验证 ArrayBuffer.from("abcd", "utf8") 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const source = ArrayBuffer.from("abcd", "utf8");
        ArrayBuffer.from(source, 0, Utils.castToInt(true as Object));
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    return;
  });
}