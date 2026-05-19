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

export default function arrayBufferFromTwoTest(): void {
  describe('ArrayBufferFromTwoTest', (): void => {
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
     * @tc.name testArrayBufferFromTwo0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_0100
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回值的 byteLength 为 3。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<byte> = [Int.toByte(1), Int.toByte(2), Int.toByte(3)]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.byteLength).assertEqual(3)
      expect(buffer.at(0)).assertEqual(Int.toByte(1))
      expect(buffer.at(2)).assertEqual(Int.toByte(3))
    });

    /**
     * @tc.name testArrayBufferFromTwo0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_0200
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回值的 byteLength 为 1。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<byte> = [Int.toByte(7)]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromTwo0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_0300
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回值的 byteLength 为 2。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<byte> = [Int.toByte(1), Int.toByte(2)]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromTwo0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_0400
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回值的 byteLength 为 1。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<byte> = [Int.toByte(9)]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromTwo0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_0500
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回值的 byteLength 为 4。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<byte> = [Int.toByte(10), Int.toByte(20), Int.toByte(30), Int.toByte(40)]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.byteLength).assertEqual(4)
      expect(buffer.at(0)).assertEqual(Int.toByte(10))
      expect(buffer.at(3)).assertEqual(Int.toByte(40))
    });

    /**
     * @tc.name testArrayBufferFromTwo0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_0600
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回值的 byteLength 为 1。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<byte> = [Int.toByte(42)]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.byteLength).assertEqual(1)
      expect(buffer.at(0)).assertEqual(Int.toByte(42))
    });

    /**
     * @tc.name testArrayBufferFromTwo0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_0700
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回值的 byteLength 为 0。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<byte> = []
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.byteLength).assertEqual(0)
    });

    /**
     * @tc.name testArrayBufferFromTwo0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_0800
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回的数据内容与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<byte> = [Int.toByte(127)]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.at(0)).assertEqual(Int.toByte(127))
    });

    /**
     * @tc.name testArrayBufferFromTwo0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_0900
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回的数据内容与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<byte> = [Int.toByte(-128)]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.at(0)).assertEqual(Int.toByte(-128))
    });

    /**
     * @tc.name testArrayBufferFromTwo0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_1000
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回的数据内容与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<byte> = [Int.toByte(0)]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.at(0)).assertEqual(Int.toByte(0))
    });

    /**
     * @tc.name testArrayBufferFromTwo0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_1100
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回的数据内容与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<byte> = [Int.toByte(-1)]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.at(0)).assertEqual(Int.toByte(-1))
    });

    /**
     * @tc.name testArrayBufferFromTwo0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_1200
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回值的 byteLength 为 5。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<byte> = [Int.toByte(-128), Int.toByte(-1), Int.toByte(0), Int.toByte(1), Int.toByte(127)]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.byteLength).assertEqual(5)
      expect(buffer.at(4)).assertEqual(Int.toByte(127))
    });

    /**
     * @tc.name testArrayBufferFromTwo0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_1300
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回值的 byteLength 为 10。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<byte> =
        [Int.toByte(1), Int.toByte(2), Int.toByte(3), Int.toByte(4), Int.toByte(5), Int.toByte(6), Int.toByte(7),
          Int.toByte(8), Int.toByte(9), Int.toByte(10)]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.byteLength).assertEqual(10)
      expect(buffer.at(9)).assertEqual(Int.toByte(10))
    });

    /**
     * @tc.name testArrayBufferFromTwo0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_1400
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回值的 byteLength 为 1。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<byte> = [Int.toByte(0)]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromTwo0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_1500
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回值的 byteLength 为 2。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<byte> = [Int.toByte(5), Int.toByte(6)]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromTwo0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_1600
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回值的 byteLength 为 2。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<byte> = [Int.toByte(65), Int.toByte(66)]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromTwo0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_1700
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回的数据内容与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<byte> = [Int.toByte(123)]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.at(0)).assertEqual(Int.toByte(123))
    });

    /**
     * @tc.name testArrayBufferFromTwo0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_1800
     * @tc.desc 验证 ArrayBuffer.from(buf) 在当前场景执行成功，返回值的 byteLength 为 3。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(3)
      buf.set(0, Int.toByte(1))
      buf.set(1, Int.toByte(2))
      buf.set(2, Int.toByte(3))
      let copy = ArrayBuffer.from(buf)
      expect(copy.byteLength).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferFromTwo0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_1900
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回值的 byteLength 为 3。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<byte> = [Int.toByte(10), Int.toByte(20), Int.toByte(30)]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.byteLength).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferFromTwo0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_2000
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回值的 byteLength 为 0。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<byte> = []
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.byteLength).assertEqual(0)
      expect((buffer instanceof ArrayBuffer)).assertTrue()
    });

    /**
     * @tc.name testArrayBufferFromTwo0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_2100
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回值的 byteLength 为 1。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<byte> = [Int.toByte(99)]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromTwo0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_2200
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，实例类型判断符合预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<byte> = [Int.toByte(1), Int.toByte(2)]
      let buffer = ArrayBuffer.from(arr)
      expect((buffer instanceof ArrayBuffer)).assertTrue()
    });

    /**
     * @tc.name testArrayBufferFromTwo0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_2300
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，实例类型判断符合预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<byte> = [Int.toByte(1)]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer instanceof ArrayBuffer).assertTrue()
    });

    /**
     * @tc.name testArrayBufferFromTwo0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_2400
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，实例类型判断符合预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<byte> = []
      let buffer = ArrayBuffer.from(arr)
      expect(buffer instanceof ArrayBuffer).assertTrue()
    });

    /**
     * @tc.name testArrayBufferFromTwo0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_2500
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，等值关系判断符合预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<byte> = [Int.toByte(1), Int.toByte(2)]
      let buffer1 = ArrayBuffer.from(arr)
      let buffer2 = ArrayBuffer.from(arr)
      expect((buffer1 !== buffer2)).assertTrue()
    });

    /**
     * @tc.name testArrayBufferFromTwo0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_2600
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回的数据内容与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<byte> = [Int.toByte(10), Int.toByte(20), Int.toByte(30), Int.toByte(40)]
      let buffer = ArrayBuffer.from(arr)
      for (let i: int = 0; i < 4; i++) {
        expect(buffer.at(i)).assertEqual(arr[i])
      }
    });

    /**
     * @tc.name testArrayBufferFromTwo0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_2700
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回的数据内容与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<byte> = [Int.toByte(55)]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.at(0)).assertEqual(Int.toByte(55))
    });

    /**
     * @tc.name testArrayBufferFromTwo0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_2800
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回的数据内容与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<byte> = [Int.toByte(-128), Int.toByte(127)]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.at(0)).assertEqual(Int.toByte(-128))
      expect(buffer.at(1)).assertEqual(Int.toByte(127))
    });

    /**
     * @tc.name testArrayBufferFromTwo0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_2900
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回的数据内容与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<byte> = [Int.toByte(0), Int.toByte(0), Int.toByte(0)]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.at(1)).assertEqual(Int.toByte(0))
    });

    /**
     * @tc.name testArrayBufferFromTwo0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_3000
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回的数据内容与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<byte> = [Int.toByte(10), Int.toByte(20), Int.toByte(30)]
      let buffer = ArrayBuffer.from(arr)
      let buffer2 = ArrayBuffer.from(arr)
      expect(buffer.at(0)).assertEqual(Int.toByte(10))
      expect(buffer2.at(0)).assertEqual(Int.toByte(10))
    });

    /**
     * @tc.name testArrayBufferFromTwo0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_3100
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回的数据内容与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<byte> = [Int.toByte(10), Int.toByte(20)]
      let buffer = ArrayBuffer.from(arr)
      buffer.set(0, Int.toByte(99))
      expect(buffer.at(0)).assertEqual(Int.toByte(99))
      expect(buffer.at(1)).assertEqual(Int.toByte(20))
    });

    /**
     * @tc.name testArrayBufferFromTwo0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_3200
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回的数据内容与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<byte> = [Int.toByte(1), Int.toByte(2), Int.toByte(3)]
      let buffer1 = ArrayBuffer.from(arr)
      let buffer2 = ArrayBuffer.from(arr)
      buffer1.set(0, Int.toByte(99))
      expect(buffer2.at(0)).assertEqual(Int.toByte(1))
      expect(buffer1.at(0)).assertEqual(Int.toByte(99))
    });

    /**
     * @tc.name testArrayBufferFromTwo0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_3300
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回的数据内容与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: FixedArray<byte> = [Int.toByte(10), Int.toByte(20), Int.toByte(30)];
      const buffer = ArrayBuffer.from(arr);
      arr[0] = Int.toByte(99);
      expect(buffer.at(0)).assertEqual(Int.toByte(10));
    });

    /**
     * @tc.name testArrayBufferFromTwo0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_3400
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回值的 byteLength 为 2。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: FixedArray<byte> = [Int.toByte(10), Int.toByte(20)];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.byteLength).assertEqual(2);
    });

    /**
     * @tc.name testArrayBufferFromTwo0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_3500
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回值的 byteLength 为 3。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<byte> = [Int.toByte(1), Int.toByte(2), Int.toByte(3)]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.byteLength).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferFromTwo0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_3600
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回值的 byteLength 为 1。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<byte> = [Int.toByte(1)]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromTwo0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_3700
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回值的 byteLength 为 2。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<byte> = [Int.toByte(11), Int.toByte(22)]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromTwo0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_3800
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回值的 byteLength 为 3。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<byte> = [Int.toByte(1), Int.toByte(2), Int.toByte(3)]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.byteLength).assertEqual(3)
      expect(buffer.at(1)).assertEqual(Int.toByte(2))
      expect((buffer instanceof ArrayBuffer)).assertTrue()
    });

    return;
  });
}