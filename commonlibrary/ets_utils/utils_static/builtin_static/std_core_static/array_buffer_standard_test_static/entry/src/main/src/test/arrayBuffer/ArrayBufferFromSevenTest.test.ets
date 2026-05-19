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

class ArrayBufferFromSevenPlainForMindmap {
  byteLength: int = 4
}

export default function arrayBufferFromSevenTest(): void {
  describe('ArrayBufferFromSevenTest', (): void => {
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
     * @tc.name testArrayBufferFromSeven0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0010
     * @tc.desc 验证 ArrayBuffer.from(source) 在当前场景执行成功，返回值的 byteLength 为 8。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      const view = new Int8Array(source);
      view[0] = 1;
      view[1] = 2;
      view[2] = 3;
      view[3] = 4;
      view[4] = 5;
      view[5] = 6;
      view[6] = 7;
      view[7] = 8;
      const result = ArrayBuffer.from(source);
      expect(result.byteLength).assertEqual(8);
    });

    /**
     * @tc.name testArrayBufferFromSeven0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0020
     * @tc.desc 验证 ArrayBuffer.from(source, 2, 4) 在当前场景执行成功，返回值的 byteLength 为 5。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      const view = new Int8Array(source);
      view[0] = 1;
      view[1] = 2;
      view[2] = 3;
      view[3] = 4;
      view[4] = 5;
      view[5] = 6;
      view[6] = 7;
      view[7] = 8;
      const result = Utils.fromArrayBufferWithOffset(source, 3);
      expect(result.byteLength).assertEqual(5);
    });

    /**
     * @tc.name testArrayBufferFromSeven0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0030
     * @tc.desc 验证 ArrayBuffer.from(source, 2, 4) 在当前场景执行成功，返回值的 byteLength 为 4。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      const view = new Int8Array(source);
      view[0] = 1;
      view[1] = 2;
      view[2] = 3;
      view[3] = 4;
      view[4] = 5;
      view[5] = 6;
      view[6] = 7;
      view[7] = 8;
      const result = ArrayBuffer.from(source, 2, 4);
      expect(result.byteLength).assertEqual(4);
    });

    /**
     * @tc.name testArrayBufferFromSeven0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0040
     * @tc.desc 验证 ArrayBuffer.from(source) 在当前场景执行成功，返回值的 byteLength 为 source.byteLength。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      const view = new Int8Array(source);
      const result = ArrayBuffer.from(source);
      expect(result.byteLength).assertEqual(source.byteLength);
    });

    /**
     * @tc.name testArrayBufferFromSeven0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0050
     * @tc.desc 验证 ArrayBuffer.from(source, 0, 8) 在当前场景执行成功，返回值的 byteLength 为 8。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      const result = ArrayBuffer.from(source, 0, 8);
      expect(result.byteLength).assertEqual(8);
    });

    /**
     * @tc.name testArrayBufferFromSeven0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0060
     * @tc.desc 验证 ArrayBuffer.from(source, 0, 16) 在当前场景执行成功，返回值的 byteLength 为 16。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(16);
      const view = new Int8Array(source);
      for (let i: int = 0; i < 16; i++) {
        view[i] = i;
      }
      const result = ArrayBuffer.from(source, 0, 16);
      expect(result.byteLength).assertEqual(16);
    });

    /**
     * @tc.name testArrayBufferFromSeven0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0070
     * @tc.desc 验证 ArrayBuffer.from(empty) 在当前场景执行成功，返回值的 byteLength 为 0。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty = new ArrayBuffer(0);
      const result = ArrayBuffer.from(empty);
      expect(result.byteLength).assertEqual(0);
      expect(result instanceof ArrayBuffer).assertTrue();
    });

    /**
     * @tc.name testArrayBufferFromSeven0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0080
     * @tc.desc 验证 ArrayBuffer.from(source) 在当前场景执行成功，返回值的 byteLength 为 1024。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(1024);
      const view = new Int8Array(source);
      view[0] = 42;
      view[1023] = 99;
      const result = ArrayBuffer.from(source);
      expect(result.byteLength).assertEqual(1024);
    });

    /**
     * @tc.name testArrayBufferFromSeven0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0090
     * @tc.desc 验证 ArrayBuffer.from(source) 在当前场景执行成功，返回值的 byteLength 为 1。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(1);
      const view = new Int8Array(source);
      view[0] = 127;
      const result = ArrayBuffer.from(source);
      expect(result.byteLength).assertEqual(1);
    });

    /**
     * @tc.name testArrayBufferFromSeven0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0100
     * @tc.desc 验证 ArrayBuffer.from(empty) 在当前场景执行成功，返回值的 byteLength 为 0。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty = new ArrayBuffer(0);
      const result = ArrayBuffer.from(empty);
      expect(result.byteLength).assertEqual(0);

    });

    /**
     * @tc.name testArrayBufferFromSeven0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0110
     * @tc.desc 验证 ArrayBuffer.from(source) 在当前场景执行成功，返回值的 byteLength 为 source.byteLength。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(1024);
      const view = new Int8Array(source);
      const result = ArrayBuffer.from(source);
      expect(result.byteLength).assertEqual(source.byteLength);
    });

    /**
     * @tc.name testArrayBufferFromSeven0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0120
     * @tc.desc 验证 ArrayBuffer.from(source) 在当前场景执行成功，返回值的 byteLength 为 source.byteLength。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(1);
      const view = new Int8Array(source);
      const result = ArrayBuffer.from(source);
      expect(result.byteLength).assertEqual(source.byteLength);
    });

    /**
     * @tc.name testArrayBufferFromSeven0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0130
     * @tc.desc 验证 ArrayBuffer.from(Utils.castToArrayBuffer(null as Object), 0, 1) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name testArrayBufferFromSeven0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0140
     * @tc.desc 验证 ArrayBuffer.from(Utils.castToArrayBuffer(undefined as Object), 0, 1) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name testArrayBufferFromSeven0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0150
     * @tc.desc 验证 ArrayBuffer.from(Utils.castToArrayBuffer("abcd" as Object)) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name testArrayBufferFromSeven0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0160
     * @tc.desc 验证 ArrayBuffer.from(Utils.castToArrayBuffer(true as Object)) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name testArrayBufferFromSeven0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0170
     * @tc.desc 验证 ArrayBuffer.from(source) 在当前场景执行成功，返回值的 byteLength 为 4。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(4);
      const view = new Int8Array(source);
      view[0] = 10;
      view[1] = 20;
      view[2] = 30;
      view[3] = 40;
      const result = ArrayBuffer.from(source);
      expect(result.byteLength).assertEqual(4);
    });

    /**
     * @tc.name testArrayBufferFromSeven0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0180
     * @tc.desc 验证 ArrayBuffer.from(source, 0, 3) 在当前场景执行成功，返回值的 byteLength 为 3。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(6);
      const view = new Int8Array(source);
      view[0] = 1;
      view[1] = 2;
      view[2] = 3;
      view[3] = 4;
      view[4] = 5;
      view[5] = 6;
      const result = ArrayBuffer.from(source, 0, 3);
      expect(result.byteLength).assertEqual(3);
    });

    /**
     * @tc.name testArrayBufferFromSeven0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0190
     * @tc.desc 验证 ArrayBuffer.from(source, 2, 3) 在当前场景执行成功，返回值的 byteLength 为 3。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(6);
      const view = new Int8Array(source);
      view[0] = 1;
      view[1] = 2;
      view[2] = 3;
      view[4] = 5;
      view[5] = 6;
      const result = ArrayBuffer.from(source, 2, 3);
      expect(result.byteLength).assertEqual(3);
    });

    /**
     * @tc.name testArrayBufferFromSeven0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0200
     * @tc.desc 验证 ArrayBuffer.from(source, Double.toInt(1.5), 3) 在当前场景执行成功，返回值的 byteLength 为 3。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      try {
        const result = ArrayBuffer.from(source, Double.toInt(1.5), 3);
        expect(result.byteLength).assertEqual(3);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
      }
    });

    /**
     * @tc.name testArrayBufferFromSeven0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0210
     * @tc.desc 验证 ArrayBuffer.from(source, 0, 2) 在当前场景执行成功，返回值的 byteLength 为 2。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(4);
      const view = new Int8Array(source);
      view[0] = 10;
      view[1] = 20;
      const result = ArrayBuffer.from(source, 0, 2);
      expect(result.byteLength).assertEqual(2);
    });

    /**
     * @tc.name testArrayBufferFromSeven0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0220
     * @tc.desc 验证 ArrayBuffer.from(source, Double.toInt(1.5), 3) 在当前场景执行成功，返回值的 byteLength 为 3。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      try {
        const result = ArrayBuffer.from(source, Double.toInt(1.5), 3);
        expect(result.byteLength).assertEqual(3);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
      }
    });

    /**
     * @tc.name testArrayBufferFromSeven0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0230
     * @tc.desc 验证 ArrayBuffer.from(source, Double.toInt(Number.POSITIVE_INFINITY), 4) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      try {
        const result = ArrayBuffer.from(source, Double.toInt(Number.POSITIVE_INFINITY), 4);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        expect(source.byteLength).assertEqual(8);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromSeven0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0240
     * @tc.desc 验证 ArrayBuffer.from(source, Double.toInt(Number.POSITIVE_INFINITY), 4) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      try {
        const result = ArrayBuffer.from(source, Double.toInt(Number.POSITIVE_INFINITY), 4);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        expect(source.byteLength).assertEqual(8);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromSeven0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0250
     * @tc.desc 验证 ArrayBuffer.from(source, Double.toInt(Number.NEGATIVE_INFINITY), 4) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      try {
        const result = ArrayBuffer.from(source, Double.toInt(Number.NEGATIVE_INFINITY), 4);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromSeven0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0260
     * @tc.desc 验证 ArrayBuffer.from(source, -1, 2) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
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
     * @tc.name testArrayBufferFromSeven0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0270
     * @tc.desc 验证 ArrayBuffer.from(source, (source.byteLength as int), 0) 在当前场景执行成功，返回值的 byteLength 为 0。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(6);
      const view = new Int8Array(source);
      for (let i: int = 0; i < 6; i++) {
        view[i] = i;
      }
      const result = ArrayBuffer.from(source, (source.byteLength as int), 0);
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferFromSeven0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0280
     * @tc.desc 验证 ArrayBuffer.from(source, (source.byteLength as int), 0) 在当前场景执行成功，返回值的 byteLength 为 0。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      const view = new Int8Array(source);
      try {
        const result = ArrayBuffer.from(source, (source.byteLength as int), 0);
        expect(result.byteLength).assertEqual(0);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
      }
    });

    /**
     * @tc.name testArrayBufferFromSeven0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0290
     * @tc.desc 验证 ArrayBuffer.from(source, source.byteLength + 1, 1) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name testArrayBufferFromSeven0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0300
     * @tc.desc 验证 ArrayBuffer.from(source, Double.toInt(Number.MAX_SAFE_INTEGER), 1) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      try {
        const result = ArrayBuffer.from(source, Double.toInt(Number.MAX_SAFE_INTEGER), 1);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        expect(source.byteLength).assertEqual(8);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromSeven0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0310
     * @tc.desc 验证 ArrayBuffer.from(source, Utils.castToInt(null as Object), 1) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);

      try {
        const result = ArrayBuffer.from(source, Utils.castToInt(null as Object), 1);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromSeven0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0320
     * @tc.desc 验证 ArrayBuffer.from(source, Utils.castToInt("1" as Object), 1) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);

      try {
        const result = ArrayBuffer.from(source, Utils.castToInt("1" as Object), 1);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromSeven0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0330
     * @tc.desc 验证 ArrayBuffer.from(source) 在当前场景执行成功，返回值的 byteLength 为 4。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(6);
      const view = new Int8Array(source);
      view[0] = 1;
      view[1] = 2;
      view[2] = 3;
      view[3] = 4;
      view[4] = 5;
      view[5] = 6;
      const result = Utils.fromArrayBufferWithOffset(source, 2);
      expect(result.byteLength).assertEqual(4);
    });

    /**
     * @tc.name testArrayBufferFromSeven0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0340
     * @tc.desc 验证 ArrayBuffer.from(source) 在当前场景执行成功，返回值的 byteLength 为 8。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      const view = new Int8Array(source);
      for (let i: int = 0; i < 8; i++) {
        view[i] = i + 1;
      }
      const result = ArrayBuffer.from(source);
      expect(result.byteLength).assertEqual(8);
      expect(result.at(0)).assertEqual(1);
      expect(result.at(7)).assertEqual(8);
    });

    /**
     * @tc.name testArrayBufferFromSeven0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0350
     * @tc.desc 验证 ArrayBuffer.from(source, 0, 0) 在当前场景执行成功，返回值的 byteLength 为 0。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      const result = ArrayBuffer.from(source, 0, 0);
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferFromSeven0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0360
     * @tc.desc 验证 ArrayBuffer.from(source, 0, 1) 在当前场景执行成功，返回值的 byteLength 为 1。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(6);
      const view = new Int8Array(source);
      view[0] = 42;
      const result = ArrayBuffer.from(source, 0, 1);
      expect(result.byteLength).assertEqual(1);
    });

    /**
     * @tc.name testArrayBufferFromSeven0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0370
     * @tc.desc 验证 ArrayBuffer.from(source, 1, 5) 在当前场景执行成功，返回值的 byteLength 为 5。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(10);
      const view = new Int8Array(source);
      for (let i: int = 0; i < 10; i++) {
        view[i] = i;
      }
      const result = ArrayBuffer.from(source, 1, 5);
      expect(result.byteLength).assertEqual(5);
    });

    /**
     * @tc.name testArrayBufferFromSeven0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0380
     * @tc.desc 验证 ArrayBuffer.from(source, 3, (source.byteLength as int) - 3) 在当前场景执行成功，返回值的 byteLength 为 5。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      const view = new Int8Array(source);
      for (let i: int = 0; i < 8; i++) {
        view[i] = i;
      }
      const result = ArrayBuffer.from(source, 3, (source.byteLength as int) - 3);
      expect(result.byteLength).assertEqual(5);
    });

    /**
     * @tc.name testArrayBufferFromSeven0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0390
     * @tc.desc 验证 ArrayBuffer.from(source, 0, (source.byteLength as int)) 在当前场景执行成功，返回值的 byteLength 为 source.byteLength。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      const view = new Int8Array(source);
      for (let i: int = 0; i < 8; i++) {
        view[i] = i;
      }
      const result = ArrayBuffer.from(source, 0, (source.byteLength as int));
      expect(result.byteLength).assertEqual(source.byteLength);
    });

    /**
     * @tc.name testArrayBufferFromSeven0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0400
     * @tc.desc 验证 ArrayBuffer.from(source, 0, Double.toInt(2.7)) 在当前场景执行成功，返回值的 byteLength 为 2。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      const result = ArrayBuffer.from(source, 0, Double.toInt(2.7));
      expect(result.byteLength).assertEqual(2);
    });

    /**
     * @tc.name testArrayBufferFromSeven0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0410
     * @tc.desc 验证 ArrayBuffer.from(source, 0, Double.toInt(0.0)) 在当前场景执行成功，返回值的 byteLength 为 0。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      const result = ArrayBuffer.from(source, 0, Double.toInt(0.0));
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferFromSeven0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0420
     * @tc.desc 验证 ArrayBuffer.from(source, 0, Double.toInt(Number.NaN)) 在当前场景执行成功，返回值的 byteLength 为 0。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      try {
        const result = ArrayBuffer.from(source, 0, Double.toInt(Number.NaN));
        expect(result.byteLength).assertEqual(0);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
      }
    });

    /**
     * @tc.name testArrayBufferFromSeven0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0430
     * @tc.desc 验证 ArrayBuffer.from(source, 0, Infinity) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      try {
        const result = ArrayBuffer.from(source, 0, Infinity);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        expect(source.byteLength).assertEqual(8);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromSeven0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0440
     * @tc.desc 验证 ArrayBuffer.from(source, 0, -Infinity) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      try {
        const result = ArrayBuffer.from(source, 0, -Infinity);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        expect(source.byteLength).assertEqual(8);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromSeven0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0450
     * @tc.desc 验证 ArrayBuffer.from(source, 0, -1) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name testArrayBufferFromSeven0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0460
     * @tc.desc 验证 ArrayBuffer.from(source, 0, -100) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      try {
        const result = ArrayBuffer.from(source, 0, -100);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromSeven0047
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0470
     * @tc.desc 验证 ArrayBuffer.from(source, 2, 10) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(6);
      try {
        const result = ArrayBuffer.from(source, 2, 10);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromSeven0048
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0480
     * @tc.desc 验证 ArrayBuffer.from(source, 0, Double.toInt(Number.MAX_SAFE_INTEGER)) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      try {
        const result = ArrayBuffer.from(source, 0, Double.toInt(Number.MAX_SAFE_INTEGER));
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromSeven0049
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0490
     * @tc.desc 验证 ArrayBuffer.from(source, 0, Utils.castToInt(null as Object)) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);

      try {
        const result = ArrayBuffer.from(source, 0, Utils.castToInt(null as Object));
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        expect(source.byteLength).assertEqual(8);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromSeven0050
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0500
     * @tc.desc 验证 ArrayBuffer.from(source, 0, Utils.castToInt("4" as Object)) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);

      try {
        const result = ArrayBuffer.from(source, 0, Utils.castToInt("4" as Object));
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        expect(source.byteLength).assertEqual(8);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromSeven0051
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0510
     * @tc.desc 验证 ArrayBuffer.from(source) 在当前场景执行成功，返回值的 byteLength 为 source.byteLength。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      const view = new Int8Array(source);
      const result = ArrayBuffer.from(source);
      expect(result.byteLength).assertEqual(source.byteLength);
    });

    /**
     * @tc.name testArrayBufferFromSeven0052
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0520
     * @tc.desc 验证 ArrayBuffer.from(source) 在当前场景执行成功，返回值的 byteLength 为 8。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      const view = new Int8Array(source);
      for (let i: int = 0; i < 8; i++) {
        view[i] = i + 1;
      }
      const result = ArrayBuffer.from(source);
      expect(result.byteLength).assertEqual(8);
      expect(result.at(3)).assertEqual(4);
      expect(result !== source).assertTrue();
    });

    /**
     * @tc.name testArrayBufferFromSeven0053
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0530
     * @tc.desc 验证 ArrayBuffer.from(source, 3, 4) 在当前场景执行成功，返回值的 byteLength 为 5。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(10);
      const view = new Int8Array(source);
      for (let i: int = 0; i < 10; i++) {
        view[i] = i;
      }
      const result = Utils.fromArrayBufferWithOffset(source, 5);
      expect(result.byteLength).assertEqual(5);
    });

    /**
     * @tc.name testArrayBufferFromSeven0054
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0540
     * @tc.desc 验证 ArrayBuffer.from(source, 3, 4) 在当前场景执行成功，返回值的 byteLength 为 4。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(10);
      const view = new Int8Array(source);
      for (let i: int = 0; i < 10; i++) {
        view[i] = i;
      }
      const result = ArrayBuffer.from(source, 3, 4);
      expect(result.byteLength).assertEqual(4);
    });

    /**
     * @tc.name testArrayBufferFromSeven0055
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0550
     * @tc.desc 验证 ArrayBuffer.from(source) 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(4);
      const view = new Int8Array(source);
      view[0] = 10;
      view[1] = 20;
      view[2] = 30;
      view[3] = 40;
      const result = ArrayBuffer.from(source);
      const resultView = new Int8Array(result);
      resultView[0] = 99;
      expect(view[0]).assertEqual(10);
    });

    /**
     * @tc.name testArrayBufferFromSeven0056
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0560
     * @tc.desc 验证 ArrayBuffer.from(source) 在当前场景执行成功，等值关系判断符合预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(4);
      const result = ArrayBuffer.from(source);
      expect(result === source).assertFalse();
    });

    /**
     * @tc.name testArrayBufferFromSeven0057
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0570
     * @tc.desc 验证 ArrayBuffer.from(source, 2, 2) 在当前场景执行成功，返回值的 byteLength 为 2。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(10);
      const view = new Int8Array(source);
      for (let i: int = 0; i < 10; i++) {
        view[i] = i;
      }
      const r1 = ArrayBuffer.from(source, 2, 2);
      const r2 = ArrayBuffer.from(source, 5, 3);
      const r3 = ArrayBuffer.from(source, 8, 2);
      expect(r1.byteLength).assertEqual(2);
      expect(r2.byteLength).assertEqual(3);
      expect(r3.byteLength).assertEqual(2);
    });

    /**
     * @tc.name testArrayBufferFromSeven0058
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0580
     * @tc.desc 验证 ArrayBuffer.from(source, 0, 4) 在当前场景执行成功，实例类型判断符合预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      const result = ArrayBuffer.from(source, 0, 4);
      expect(result instanceof ArrayBuffer).assertTrue();
    });

    /**
     * @tc.name testArrayBufferFromSeven0059
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0590
     * @tc.desc 验证 ArrayBuffer.from(source) 在当前场景执行成功，实例类型判断符合预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      const result = ArrayBuffer.from(source);
      expect(result instanceof ArrayBuffer).assertTrue()
    });

    /**
     * @tc.name testArrayBufferFromSeven0060
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0600
     * @tc.desc 验证 ArrayBuffer.from(source) 在当前场景执行成功，实例类型判断符合预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      const result = ArrayBuffer.from(source);
      expect(Class.of(result).getName().indexOf('ArrayBuffer') >= 0).assertTrue();
    });

    /**
     * @tc.name testArrayBufferFromSeven0061
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0610
     * @tc.desc 验证 ArrayBuffer.from(source, 1, 3) 在当前场景执行成功，实例类型判断符合预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      const result = ArrayBuffer.from(source, 1, 3);
      expect(Utils.isRuntimeNumericOrIntTypeof(typeof result.byteLength)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferFromSeven0062
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0620
     * @tc.desc 验证 ArrayBuffer.from(source) 在当前场景执行成功，实例类型判断符合预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      const result = ArrayBuffer.from(source);
      expect(result instanceof ArrayBuffer).assertTrue();
    });

    /**
     * @tc.name testArrayBufferFromSeven0063
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0630
     * @tc.desc 验证 ArrayBuffer.from(source) 在当前场景执行成功，实例类型判断符合预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(4);
      const result = ArrayBuffer.from(source);
      expect(result instanceof ArrayBuffer).assertTrue();
    });

    /**
     * @tc.name testArrayBufferFromSeven0064
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0640
     * @tc.desc 验证 ArrayBuffer.from(source) 在当前场景执行成功，实例类型判断符合预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      const result = Utils.fromArrayBufferWithOffset(source, 2);
      expect(result instanceof ArrayBuffer).assertTrue();
    });

    /**
     * @tc.name testArrayBufferFromSeven0065
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0650
     * @tc.desc 验证 ArrayBuffer.from(source) 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(6);
      const view = new Int8Array(source);
      view[0] = 10;
      view[1] = 20;
      view[2] = 30;
      view[3] = 40;
      view[4] = 50;
      view[5] = 60;
      const result = ArrayBuffer.from(source);
      const resultView = new Int8Array(result);
      for (let i: int = 0; i < source.byteLength; i++) {
        expect(resultView[i]).assertEqual(view[i]);
      }
    });

    /**
     * @tc.name testArrayBufferFromSeven0066
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0660
     * @tc.desc 验证 ArrayBuffer.from(source, 2, 5) 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      const view = new Int8Array(source);
      for (let i: int = 0; i < 8; i++) {
        view[i] = i * 10;
      }
      const result = Utils.fromArrayBufferWithOffset(source, 3);
      const resultView = new Int8Array(result);
      for (let i: int = 0; i < result.byteLength; i++) {
        expect(resultView[i]).assertEqual(view[i + 3]);
      }
    });

    /**
     * @tc.name testArrayBufferFromSeven0067
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0670
     * @tc.desc 验证 ArrayBuffer.from(source, 2, 5) 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(10);
      const view = new Int8Array(source);
      for (let i: int = 0; i < 10; i++) {
        view[i] = i + 1;
      }
      const result = ArrayBuffer.from(source, 2, 5);
      const resultView = new Int8Array(result);
      for (let i: int = 0; i < 5; i++) {
        expect(resultView[i]).assertEqual(view[i + 2]);
      }
    });

    /**
     * @tc.name testArrayBufferFromSeven0068
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0680
     * @tc.desc 验证 ArrayBuffer.from(source, 1, 4) 在当前场景执行成功，返回的数据内容与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      const view = new Int8Array(source);
      for (let i: int = 0; i < 8; i++) {
        view[i] = i * 2;
      }
      const result = ArrayBuffer.from(source, 1, 4);
      expect(result.at(0)).assertEqual(source.at(1));
      expect(result.at(1)).assertEqual(source.at(2));
      expect(result.at(2)).assertEqual(source.at(3));
      expect(result.at(3)).assertEqual(source.at(4));
    });

    /**
     * @tc.name testArrayBufferFromSeven0069
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0690
     * @tc.desc 验证 ArrayBuffer.from(source) 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(4);
      const srcView = new Int8Array(source);
      srcView[0] = 11;
      srcView[1] = 22;
      srcView[2] = 33;
      srcView[3] = 44;
      const result = ArrayBuffer.from(source);
      const resView = new Int8Array(result);
      resView[0] = 99;
      resView[1] = 88;
      expect(srcView[0]).assertEqual(11);
      expect(srcView[1]).assertEqual(22);
    });

    /**
     * @tc.name testArrayBufferFromSeven0070
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0700
     * @tc.desc 验证 ArrayBuffer.from(source) 在当前场景执行成功，边界值比较判断符合预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(256);
      const view = new Int8Array(source);
      for (let i: int = 0; i < 256; i++) {
        view[i] = i;
      }
      const result = ArrayBuffer.from(source);
      const resultView = new Int8Array(result);
      let allMatch = true;
      for (let i: int = 0; i < 256; i++) {
        if (resultView[i] !== view[i]) {
          allMatch = false;
          break;
        }
      }
      expect(allMatch).assertTrue();
    });

    /**
     * @tc.name testArrayBufferFromSeven0071
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0710
     * @tc.desc 验证 ArrayBuffer.from(source) 在当前场景执行成功，返回值的 byteLength 为 (source.byteLength as int。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(10);
      const view = new Int8Array(source);
      for (let i: int = 0; i < 10; i++) {
        view[i] = i + 100;
      }
      const off: int = 7;
      const result = Utils.fromArrayBufferWithOffset(source, off);
      const resultView = new Int8Array(result);
      expect(result.byteLength).assertEqual((source.byteLength as int) - off);
      expect(resultView[0]).assertEqual(107);
      expect(resultView[1]).assertEqual(108);
      expect(resultView[2]).assertEqual(109);
    });

    /**
     * @tc.name testArrayBufferFromSeven0072
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0720
     * @tc.desc 验证 ArrayBuffer.from(source) 在当前场景执行成功，返回值的 byteLength 为 6。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(6);
      const view = new Int8Array(source);
      view[0] = 1;
      view[1] = 2;
      view[2] = 3;
      view[3] = 4;
      view[4] = 5;
      view[5] = 6;
      const result = ArrayBuffer.from(source);
      expect(result.byteLength).assertEqual(6);
      const resultView = new Int8Array(result);
      for (let i: int = 0; i < 6; i++) {
        expect(resultView[i]).assertEqual(view[i]);
      }
    });

    /**
     * @tc.name testArrayBufferFromSeven0073
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0730
     * @tc.desc 验证 ArrayBuffer.from(source, 0, (source.byteLength as int)) 在当前场景执行成功，返回值的 byteLength 为 3。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      const view = new Int8Array(source);
      for (let i: int = 0; i < 8; i++) {
        view[i] = i;
      }
      const result = Utils.fromArrayBufferWithOffset(source, 5);
      expect(result.byteLength).assertEqual(3);
    });

    /**
     * @tc.name testArrayBufferFromSeven0074
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0740
     * @tc.desc 验证 ArrayBuffer.from(source, 0, (source.byteLength as int)) 在当前场景执行成功，返回值的 byteLength 为 (source.byteLength as int。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      const view = new Int8Array(source);
      for (let i: int = 0; i < 8; i++) {
        view[i] = i;
      }
      const off: int = 1;
      const result = Utils.fromArrayBufferWithOffset(source, off);
      expect(result.byteLength).assertEqual((source.byteLength as int) - off);
    });

    /**
     * @tc.name testArrayBufferFromSeven0075
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0750
     * @tc.desc 验证 ArrayBuffer.from(source, 0, (source.byteLength as int)) 在当前场景执行成功，返回值的 byteLength 为 source.byteLength。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      const view = new Int8Array(source);
      for (let i: int = 0; i < 8; i++) {
        view[i] = i;
      }
      const result = ArrayBuffer.from(source, 0, (source.byteLength as int));
      expect(result.byteLength).assertEqual(source.byteLength);
    });

    /**
     * @tc.name testArrayBufferFromSeven0076
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0760
     * @tc.desc 验证 ArrayBuffer.from(source, 0, 0) 在当前场景执行成功，返回值的 byteLength 为 0。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      const result = ArrayBuffer.from(source, 0, 0);
      expect(result.byteLength).assertEqual(0);
      expect(result instanceof ArrayBuffer).assertTrue();
    });

    /**
     * @tc.name testArrayBufferFromSeven0077
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0770
     * @tc.desc 验证 ArrayBuffer.from(source, (source.byteLength as int), 0) 在当前场景执行成功，返回值的 byteLength 为 0。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      const result = ArrayBuffer.from(source, (source.byteLength as int), 0);
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferFromSeven0078
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0780
     * @tc.desc 验证 ArrayBuffer.from(source, 0, 1) 在当前场景执行成功，返回值的 byteLength 为 1。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      const view = new Int8Array(source);
      view[0] = 42;
      const result = ArrayBuffer.from(source, 0, 1);
      expect(result.byteLength).assertEqual(1);
      expect(result.at(0)).assertEqual(source.at(0));
    });

    /**
     * @tc.name testArrayBufferFromSeven0079
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0790
     * @tc.desc 验证 ArrayBuffer.from(source, (source.byteLength as int) - 1, 1) 在当前场景执行成功，返回值的 byteLength 为 1。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      const view = new Int8Array(source);
      view[7] = 77;
      const result = ArrayBuffer.from(source, (source.byteLength as int) - 1, 1);
      expect(result.byteLength).assertEqual(1);
      expect(result.at(0)).assertEqual(source.at(source.byteLength - 1));
    });

    /**
     * @tc.name testArrayBufferFromSeven0080
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0800
     * @tc.desc 验证 ArrayBuffer.from(empty, 0, 0) 在当前场景执行成功，返回值的 byteLength 为 0。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty = new ArrayBuffer(0);
      const result = ArrayBuffer.from(empty, 0, 0);
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferFromSeven0081
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0810
     * @tc.desc 验证 ArrayBuffer.from(empty) 在当前场景执行成功，返回值的 byteLength 为 0。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const empty = new ArrayBuffer(0);
      const result = ArrayBuffer.from(empty);
      expect(result.byteLength).assertEqual(0);
      expect(empty.byteLength).assertEqual(0);
      expect(result !== empty).assertTrue();
    });

    /**
     * @tc.name testArrayBufferFromSeven0082
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0820
     * @tc.desc 验证 ArrayBuffer.from(source) 在当前场景执行成功，返回值的 byteLength 为 1。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(1);
      const view = new Int8Array(source);
      view[0] = 127;
      const result = ArrayBuffer.from(source);
      expect(result.byteLength).assertEqual(1);
      expect(result.at(0)).assertEqual(source.at(0));
    });

    /**
     * @tc.name testArrayBufferFromSeven0083
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0830
     * @tc.desc 验证 ArrayBuffer.from(source, 1, 1) 在当前场景执行成功，返回值的 byteLength 为 1。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(4);
      const view = new Int8Array(source);
      view[0] = 1;
      view[1] = 2;
      const result = ArrayBuffer.from(source, 1, 1);
      expect(result.byteLength).assertEqual(1);
    });

    /**
     * @tc.name testArrayBufferFromSeven0084
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0840
     * @tc.desc 验证 ArrayBuffer.from(source, 2, 3) 在当前场景执行成功，返回值的 byteLength 为 3。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      const view = new Int8Array(source);
      for (let i: int = 0; i < 8; i++) {
        view[i] = i;
      }
      const result = ArrayBuffer.from(source, 2, 3);
      expect(result.byteLength).assertEqual(3);
    });

    /**
     * @tc.name testArrayBufferFromSeven0085
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0850
     * @tc.desc 验证 ArrayBuffer.from(Utils.castToArrayBuffer(undefined as Object)) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const result = ArrayBuffer.from(Utils.castToArrayBuffer(undefined as Object));
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromSeven0086
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0860
     * @tc.desc 验证 ArrayBuffer.from(Utils.castToArrayBuffer(undefined as Object), 0, 2) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const result = ArrayBuffer.from(Utils.castToArrayBuffer(undefined as Object), 0, 2);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromSeven0087
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0870
     * @tc.desc 验证 ArrayBuffer.from(source, Utils.castToInt(null as Object), 1) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);

      try {
        const result = ArrayBuffer.from(source, Utils.castToInt(null as Object), 1);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromSeven0088
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0880
     * @tc.desc 验证 ArrayBuffer.from(source, 0, Utils.castToInt(null as Object)) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      try {
        ArrayBuffer.from(source, 0, Utils.castToInt(null as Object));
        expect(true).assertFail();
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        expect(source.byteLength).assertEqual(8);
      }
    });

    /**
     * @tc.name testArrayBufferFromSeven0089
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0890
     * @tc.desc 验证 ArrayBuffer.from(source, Utils.castToInt(null as Object), Utils.castToInt(null as Object)) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      try {
        ArrayBuffer.from(source, Utils.castToInt(null as Object), Utils.castToInt(null as Object));
        expect(true).assertFail();
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        expect(source.byteLength).assertEqual(8);
      }
    });

    /**
     * @tc.name testArrayBufferFromSeven0090
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0900
     * @tc.desc 验证 ArrayBuffer.from(source, 3, Utils.castToInt(null as Object)) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      try {
        const result = ArrayBuffer.from(source, 3, Utils.castToInt(null as Object));
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromSeven0091
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0910
     * @tc.desc 验证 ArrayBuffer.from(source, source.byteLength, 1) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
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
     * @tc.name testArrayBufferFromSeven0092
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0920
     * @tc.desc 验证 ArrayBuffer.from(source, source.byteLength + 10, 1) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
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
     * @tc.name testArrayBufferFromSeven0093
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0930
     * @tc.desc 验证 ArrayBuffer.from(source, 0, 10) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      try {
        const result = ArrayBuffer.from(source, 0, 10);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromSeven0094
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0940
     * @tc.desc 验证 ArrayBuffer.from(source, Double.toInt(Number.NaN), 4) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      try {
        const result = Utils.fromArrayBufferWithOffset(source, 10);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromSeven0095
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0950
     * @tc.desc 验证 ArrayBuffer.from(source, Double.toInt(Number.NaN), 4) 在当前场景执行成功，空值有效性判断符合预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      let result: ArrayBuffer;
      try {
        result = ArrayBuffer.from(source, Double.toInt(Number.NaN), 4);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(result.byteLength).assertEqual(4);
    });

    /**
     * @tc.name testArrayBufferFromSeven0096
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0960
     * @tc.desc 验证 ArrayBuffer.from(source, 0, Double.toInt(Number.NaN)) 在当前场景执行成功，返回值的 byteLength 为 0。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      try {
        const result = ArrayBuffer.from(source, 0, Double.toInt(Number.NaN));
        expect(result.byteLength).assertEqual(0);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
      }
    });

    /**
     * @tc.name testArrayBufferFromSeven0097
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0970
     * @tc.desc 验证 ArrayBuffer.from(source, Double.toInt(Number.NaN), Double.toInt(Number.NaN)) 在当前场景执行成功，空值有效性判断符合预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      let result: ArrayBuffer;
      try {
        result = ArrayBuffer.from(source, Double.toInt(Number.NaN), Double.toInt(Number.NaN));
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(result.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferFromSeven0098
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0980
     * @tc.desc 验证 ArrayBuffer.from(source, Double.toInt(Number.POSITIVE_INFINITY), 4) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(16);
      const view = new Int8Array(source);
      view[5] = 55;
      try {
        const result = ArrayBuffer.from(source, Double.toInt(Number.POSITIVE_INFINITY), 4);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        expect(source.at(5)).assertEqual(55);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromSeven0099
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0990
     * @tc.desc 验证 ArrayBuffer.from(source, 0, Infinity) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      try {
        const result = ArrayBuffer.from(source, 0, Infinity);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromSeven0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_1000
     * @tc.desc 验证 ArrayBuffer.from(source, Double.toInt(Number.NEGATIVE_INFINITY), 4) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(16);
      try {
        const result = ArrayBuffer.from(source, Double.toInt(Number.NEGATIVE_INFINITY), 4);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        expect(source.byteLength).assertEqual(16);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromSeven0101
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_1010
     * @tc.desc 验证 ArrayBuffer.from(source, 0, -Infinity) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(16);
      try {
        const result = ArrayBuffer.from(source, 0, -Infinity);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        expect(source.byteLength).assertEqual(16);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromSeven0102
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_1020
     * @tc.desc 验证 ArrayBuffer.from(source, Double.toInt(1.5), 3) 在当前场景执行成功，返回值的 byteLength 为 3。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      try {
        const result = ArrayBuffer.from(source, Double.toInt(1.5), 3);
        expect(result.byteLength).assertEqual(3);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
      }
    });

    /**
     * @tc.name testArrayBufferFromSeven0103
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_1030
     * @tc.desc 验证 ArrayBuffer.from(Utils.castToArrayBuffer("not_arraybuffer" as Object)) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(16);
      try {
        const result = ArrayBuffer.from(Utils.castToArrayBuffer("not_arraybuffer" as Object));
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        expect(source.byteLength).assertEqual(16);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromSeven0104
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_1040
     * @tc.desc 验证 ArrayBuffer.from(source, Double.toInt(1.5), 3) 在当前场景执行成功，返回值的 byteLength 为 3。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      try {
        const result = ArrayBuffer.from(source, Double.toInt(1.5), 3);
        expect(result.byteLength).assertEqual(3);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
      }
    });

    /**
     * @tc.name testArrayBufferFromSeven0105
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_1050
     * @tc.desc 验证 ArrayBuffer.from(source, 0, Double.toInt(2.5)) 在当前场景执行成功，返回值的 byteLength 为 2。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);
      try {
        const result = ArrayBuffer.from(source, 0, Double.toInt(2.5));
        expect(result.byteLength).assertEqual(2);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
      }
    });

    /**
     * @tc.name testArrayBufferFromSeven0106
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_1060
     * @tc.desc 验证 ArrayBuffer.from(Utils.castToArrayBuffer(new ArrayBufferFromSevenPlainForMindmap() as Object)) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const result =
          ArrayBuffer.from(Utils.castToArrayBuffer(new ArrayBufferFromSevenPlainForMindmap() as Object));
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromSeven0107
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_1070
     * @tc.desc 验证 ArrayBuffer.from(source, Utils.castToInt("0" as Object), 4) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);

      try {
        const result = ArrayBuffer.from(source, Utils.castToInt("0" as Object), 4);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromSeven0108
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_1080
     * @tc.desc 验证 ArrayBuffer.from(source, Utils.castToInt(true as Object), 4) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);

      try {
        const result = ArrayBuffer.from(source, Utils.castToInt(true as Object), 4);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromSeven0109
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_1090
     * @tc.desc 验证 ArrayBuffer.from(source, 0, Utils.castToInt(true as Object)) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);

      try {
        const result = ArrayBuffer.from(source, 0, Utils.castToInt(true as Object));
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromSeven0110
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_1100
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回值的 byteLength 为 8。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(8);
      const result = ArrayBuffer.from(arr);
      expect(result.byteLength).assertEqual(8);
    });

    /**
     * @tc.name testArrayBufferFromSeven0111
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_1110
     * @tc.desc 验证 ArrayBuffer.from(Utils.castToArrayBuffer(dv as Object)) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);

      try {
        const dv = new DataView(source);
        const result = ArrayBuffer.from(Utils.castToArrayBuffer(dv as Object));
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromSeven0112
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_1120
     * @tc.desc 验证 ArrayBuffer.from(source, 0, Utils.castToInt("4" as Object)) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(12);

      try {
        ArrayBuffer.from(source, 0, Utils.castToInt("4" as Object));
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        expect(source.byteLength).assertEqual(12);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromSeven0113
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_1130
     * @tc.desc 验证 ArrayBuffer.from(source, 0, Utils.castToInt(true as Object)) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(12);

      try {
        ArrayBuffer.from(source, 0, Utils.castToInt(true as Object));
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        expect(source.byteLength).assertEqual(12);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromSeven0114
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_1140
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回值的 byteLength 为 8。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(8);
      const result = ArrayBuffer.from(arr);
      expect(result.byteLength).assertEqual(8);
    });

    /**
     * @tc.name testArrayBufferFromSeven0115
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_1150
     * @tc.desc 验证 ArrayBuffer.from(Utils.castToArrayBuffer(dv as Object)) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new ArrayBuffer(8);

      try {
        const dv = new DataView(source);
        ArrayBuffer.from(Utils.castToArrayBuffer(dv as Object));
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