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

class ArrayBufferFromFourPlainForMindmap {
}

class ArrayBufferLikePlainForMindmap {
}

export default function arrayBufferFromFourTest(): void {
  describe('ArrayBufferFromFourTest', (): void => {
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
     * @tc.name testArrayBufferFromFour0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_0100
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回值的 byteLength 为 3。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: double[] = [1.0, 2.0, 3.0];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.byteLength).assertEqual(3);
      expect(buffer.at(0)).assertEqual(1);
      expect(buffer.at(1)).assertEqual(2);
      expect(buffer.at(2)).assertEqual(3);
    });

    /**
     * @tc.name testArrayBufferFromFour0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_0200
     * @tc.desc 验证 ArrayBuffer.from((null as ESObject) as double[]) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.from((null as ESObject) as double[]);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromFour0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_0300
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回值的 byteLength 为 2。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: double[] = [1.0, 2.0];
      const buf = ArrayBuffer.from(arr);
      expect(buf.byteLength).assertEqual(2);
    });

    /**
     * @tc.name testArrayBufferFromFour0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_0400
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回值的 byteLength 为 1。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: double[] = [1.0];
      const buf = ArrayBuffer.from(arr);
      expect(buf.byteLength).assertEqual(1);
    });

    /**
     * @tc.name testArrayBufferFromFour0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_0500
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回值的 byteLength 为 4。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: double[] = [1.0, 2.0, 3.0, 4.0];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.byteLength).assertEqual(4);
      expect(buffer.at(0)).assertEqual(1);
      expect(buffer.at(1)).assertEqual(2);
      expect(buffer.at(2)).assertEqual(3);
      expect(buffer.at(3)).assertEqual(4);
    });

    /**
     * @tc.name testArrayBufferFromFour0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_0600
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回值的 byteLength 为 4。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: double[] = [1.9, 2.5, 3.1, -1.7];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.byteLength).assertEqual(4);
      expect(buffer.at(0)).assertEqual(1);
      expect(buffer.at(1)).assertEqual(2);
      expect(buffer.at(2)).assertEqual(3);
      expect(buffer.at(3)).assertEqual(-1);
    });

    /**
     * @tc.name testArrayBufferFromFour0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_0700
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回值的 byteLength 为 1。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: double[] = [0.0];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.byteLength).assertEqual(1);
      expect(buffer.at(0)).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferFromFour0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_0800
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回值的 byteLength 为 3。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: double[] = [-1.0, -128.0, -10.5];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.byteLength).assertEqual(3);
      expect(buffer.at(0)).assertEqual(-1);
      expect(buffer.at(1)).assertEqual(-128);
      expect(buffer.at(2)).assertEqual(-10);
    });

    /**
     * @tc.name testArrayBufferFromFour0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_0900
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回值的 byteLength 为 0。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: double[] = [];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.byteLength).assertEqual(0);
      expect((arr.length as int)).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferFromFour0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_1000
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回值的 byteLength 为 10。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: double[] = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.byteLength).assertEqual(10);
      expect(buffer.at(0)).assertEqual(1);
      expect(buffer.at(9)).assertEqual(10);
    });

    /**
     * @tc.name testArrayBufferFromFour0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_1100
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回值的 byteLength 为 3。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: double[] = [1.0, Number.NaN, 3.0];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.byteLength).assertEqual(3);
    });

    /**
     * @tc.name testArrayBufferFromFour0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_1200
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回值的 byteLength 为 3。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: double[] = [1.0, Number.POSITIVE_INFINITY, Number.NEGATIVE_INFINITY];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.byteLength).assertEqual(3);
    });

    /**
     * @tc.name testArrayBufferFromFour0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_1300
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回值的 byteLength 为 3。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: double[] = [128.0, 255.0, 256.0];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.byteLength).assertEqual(3);
    });

    /**
     * @tc.name testArrayBufferFromFour0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_1400
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回值的 byteLength 为 3。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: double[] = [-129.0, -256.0, -1000.0];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.byteLength).assertEqual(3);
    });

    /**
     * @tc.name testArrayBufferFromFour0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_1500
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回值的 byteLength 为 1。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: double[] = [127.0];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.byteLength).assertEqual(1);
      expect(buffer.at(0)).assertEqual(127);
    });

    /**
     * @tc.name testArrayBufferFromFour0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_1600
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回值的 byteLength 为 1。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: double[] = [-128.0];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.byteLength).assertEqual(1);
      expect(buffer.at(0)).assertEqual(-128);
    });

    /**
     * @tc.name testArrayBufferFromFour0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_1700
     * @tc.desc 验证 ArrayBuffer.from((null as ESObject) as double[]) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.from((null as ESObject) as double[]);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromFour0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_1800
     * @tc.desc 验证 ArrayBuffer.from((undefined as ESObject) as double[]) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.from((undefined as ESObject) as double[]);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromFour0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_1900
     * @tc.desc 验证 ArrayBuffer.from((__s as ESObject) as double[]) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const __s: string = "hello";
        ArrayBuffer.from((__s as ESObject) as double[]);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromFour0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_2000
     * @tc.desc 验证 ArrayBuffer.from((n as ESObject) as double[]) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const n: number = 123;
        ArrayBuffer.from((n as ESObject) as double[]);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromFour0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_2100
     * @tc.desc 验证 ArrayBuffer.from(buf) 在当前场景执行成功，返回值的 byteLength 为 4。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const copy = ArrayBuffer.from(buf);
      expect(copy.byteLength).assertEqual(4);
    });

    /**
     * @tc.name testArrayBufferFromFour0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_2200
     * @tc.desc 验证 ArrayBuffer.from(arr as ESObject as double[]) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr: int[] = [1, 2, 3];
        ArrayBuffer.from(arr as ESObject as double[]);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromFour0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_2300
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回值的 byteLength 为 2。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: FixedArray<byte> = [Int.toByte(1), Int.toByte(2)];
      const buf = ArrayBuffer.from(arr);
      expect(buf.byteLength).assertEqual(2);
    });

    /**
     * @tc.name testArrayBufferFromFour0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_2400
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回值的 byteLength 为 (arr.length as int。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: double[] = [1.0, 2.0, 3.0];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.byteLength).assertEqual((arr.length as int));
      expect(buffer instanceof ArrayBuffer).assertTrue();
    });

    /**
     * @tc.name testArrayBufferFromFour0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_2500
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回值的 byteLength 为 (arr.length as int。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: double[] = [];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.byteLength).assertEqual((arr.length as int));
      expect(buffer instanceof ArrayBuffer).assertTrue();
    });

    /**
     * @tc.name testArrayBufferFromFour0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_2600
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回值的 byteLength 为 1。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: double[] = [42.0];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.byteLength).assertEqual(1);
    });

    /**
     * @tc.name testArrayBufferFromFour0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_2700
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，实例类型判断符合预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: double[] = [1.0, 2.0];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer instanceof ArrayBuffer).assertTrue();
    });

    /**
     * @tc.name testArrayBufferFromFour0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_2800
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，实例类型判断符合预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: double[] = [1.0, 2.0];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer != null).assertTrue();
      expect(buffer instanceof ArrayBuffer).assertTrue();
      expect(buffer.byteLength).assertEqual(2);
    });

    /**
     * @tc.name testArrayBufferFromFour0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_2900
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，实例类型判断符合预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: double[] = [];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer != null).assertTrue();
      expect(buffer.byteLength).assertEqual(0);
      expect(buffer instanceof ArrayBuffer).assertTrue();
    });

    /**
     * @tc.name testArrayBufferFromFour0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_3000
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，等值关系判断符合预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: double[] = [1.0, 2.0];
      const buffer1 = ArrayBuffer.from(arr);
      const buffer2 = ArrayBuffer.from(arr);
      expect(buffer1 === buffer2).assertFalse();
    });

    /**
     * @tc.name testArrayBufferFromFour0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_3100
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回的数据内容与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: double[] = [1.0, 50.0, 100.0, 127.0];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.at(0)).assertEqual(1);
      expect(buffer.at(1)).assertEqual(50);
      expect(buffer.at(2)).assertEqual(100);
      expect(buffer.at(3)).assertEqual(127);
    });

    /**
     * @tc.name testArrayBufferFromFour0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_3200
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回的数据内容与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: double[] = [1.9, 99.5, 127.999];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.at(0)).assertEqual(1);
      expect(buffer.at(1)).assertEqual(99);
      expect(buffer.at(2)).assertEqual(127);
    });

    /**
     * @tc.name testArrayBufferFromFour0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_3300
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回的数据内容与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: double[] = [-1.9, -50.5, -128.0];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.at(0)).assertEqual(-1);
      expect(buffer.at(1)).assertEqual(-50);
      expect(buffer.at(2)).assertEqual(-128);
    });

    /**
     * @tc.name testArrayBufferFromFour0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_3400
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回的数据内容与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: double[] = [0.0, 0.0, 0.0];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.at(0)).assertEqual(0);
      expect(buffer.at(1)).assertEqual(0);
      expect(buffer.at(2)).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferFromFour0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_3500
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回的数据内容与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: double[] = [127.0];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.at(0)).assertEqual(127);
    });

    /**
     * @tc.name testArrayBufferFromFour0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_3600
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回的数据内容与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: double[] = [-128.0];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.at(0)).assertEqual(-128);
    });

    /**
     * @tc.name testArrayBufferFromFour0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_3700
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回的数据内容与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: double[] = [10.5, 20.9, 30.1, 40.0];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.at(0)).assertEqual(10);
      expect(buffer.at(1)).assertEqual(20);
      expect(buffer.at(2)).assertEqual(30);
      expect(buffer.at(3)).assertEqual(40);
    });

    /**
     * @tc.name testArrayBufferFromFour0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_3800
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回的数据内容与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: double[] = [10.0, 20.0, 30.0];
      const buffer = ArrayBuffer.from(arr);
      arr[0] = 99.0;
      expect(buffer.at(0)).assertEqual(10);
      expect(buffer.at(1)).assertEqual(20);
      expect(buffer.at(2)).assertEqual(30);
    });

    /**
     * @tc.name testArrayBufferFromFour0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_3900
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回结果与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: double[] = [10.0, 20.0];
      const buffer = ArrayBuffer.from(arr);
      buffer.set(0, Int.toByte(99));
      expect(arr[0]).assertEqual(10.0);
      expect(arr[1]).assertEqual(20.0);
    });

    /**
     * @tc.name testArrayBufferFromFour0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_4000
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回的数据内容与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: double[] = [1.0, 2.0, 3.0];
      const buffer1 = ArrayBuffer.from(arr);
      const buffer2 = ArrayBuffer.from(arr);
      buffer1.set(0, Int.toByte(99));
      expect(buffer2.at(0)).assertEqual(1);
      expect(buffer1.at(0)).assertEqual(99);
    });

    /**
     * @tc.name testArrayBufferFromFour0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_4100
     * @tc.desc 验证 ArrayBuffer.from((null as ESObject) as double[]) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const mindmapProbe: string = 'section-40-null-double-array-slot';
      expect(mindmapProbe.endsWith('slot')).assertTrue();
      try {
        ArrayBuffer.from((null as ESObject) as double[]);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromFour0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_4200
     * @tc.desc 验证 ArrayBuffer.from((undefined as ESObject) as double[]) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const mindmapProbe: string = 'section-41-undef-double-array-slot';
      expect(mindmapProbe.indexOf('undef') >= 0).assertTrue();
      try {
        ArrayBuffer.from((undefined as ESObject) as double[]);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromFour0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_4300
     * @tc.desc 验证 ArrayBuffer.from((true as ESObject) as double[]) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.from((true as ESObject) as double[]);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromFour0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_4400
     * @tc.desc 验证 ArrayBuffer.from((plain as ESObject) as double[]) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const plain = new ArrayBufferLikePlainForMindmap();
        ArrayBuffer.from((plain as ESObject) as double[]);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromFour0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_4500
     * @tc.desc 验证 ArrayBuffer.from((__s as ESObject) as double[]) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('string-not-double-vector'.substring(0, 6)).assertEqual('string');
      try {
        const __s: string = "hello";
        ArrayBuffer.from((__s as ESObject) as double[]);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromFour0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_4600
     * @tc.desc 验证 ArrayBuffer.from((n as ESObject) as double[]) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const scalarProbe: number = 123;
      expect(scalarProbe > 120).assertTrue();
      try {
        const n: number = 123;
        ArrayBuffer.from((n as ESObject) as double[]);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromFour0047
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_4700
     * @tc.desc 验证 ArrayBuffer.from(arr as ESObject as double[]) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr: int[] = [1, 2, 3];
        ArrayBuffer.from(arr as ESObject as double[]);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromFour0048
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_4800
     * @tc.desc 验证 ArrayBuffer.from((new ArrayBuffer(4) as ESObject) as double[]) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr: double[] = [1.0, 2.0];
        ArrayBuffer.from((new ArrayBuffer(4) as ESObject) as double[]);
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