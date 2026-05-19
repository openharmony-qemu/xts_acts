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

class ArrayBufferFromOnePlainRecordFor0042 {
  a: int = 1
}

export default function arrayBufferFromOneTest(): void {
  describe('ArrayBufferFromOneTest', (): void => {
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
     * @tc.name testArrayBufferFromOne0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_0100
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回值的 byteLength 为 3。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ValueArray<byte> = [Int.toByte(1), Int.toByte(2), Int.toByte(3)]
      let result = ArrayBuffer.from(arr);
      expect(result.byteLength).assertEqual(3)
      expect(result.at(0)).assertEqual(Int.toByte(1))
      expect(result.at(2)).assertEqual(Int.toByte(3))
    });

    /**
     * @tc.name testArrayBufferFromOne0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_0200
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回值的 byteLength 为 1。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ValueArray<byte> = [Int.toByte(7)]
      let result = ArrayBuffer.from(arr);
      expect(result.byteLength).assertEqual(1)
      expect(result.at(0)).assertEqual(Int.toByte(7))
    });

    /**
     * @tc.name testArrayBufferFromOne0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_0300
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回值的 byteLength 为 3。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ValueArray<byte> = [Int.toByte(1), Int.toByte(2), Int.toByte(3)]
      let result = ArrayBuffer.from(arr);
      expect(result.byteLength).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferFromOne0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_0400
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回值的 byteLength 为 2。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ValueArray<byte> = [Int.toByte(9), Int.toByte(8)]
      let result = ArrayBuffer.from(arr);
      expect(result.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromOne0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_0500
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回值的 byteLength 为 5。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ValueArray<byte> = [Int.toByte(0), Int.toByte(1), Int.toByte(10), Int.toByte(100), Int.toByte(127)]
      let result = ArrayBuffer.from(arr);
      expect(result.byteLength).assertEqual(5)
      expect(result.at(4)).assertEqual(Int.toByte(127))
    });

    /**
     * @tc.name testArrayBufferFromOne0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_0600
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回值的 byteLength 为 0。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ValueArray<byte> = []
      let result = ArrayBuffer.from(arr);
      expect(result.byteLength).assertEqual(0)
    });

    /**
     * @tc.name testArrayBufferFromOne0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_0700
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回值的 byteLength 为 1。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ValueArray<byte> = [Int.toByte(42)]
      let result = ArrayBuffer.from(arr);
      expect(result.byteLength).assertEqual(1)
      expect(result.at(0)).assertEqual(Int.toByte(42))
    });

    /**
     * @tc.name testArrayBufferFromOne0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_0800
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回值的 byteLength 为 8。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ValueArray<byte> =
        [Int.toByte(1), Int.toByte(2), Int.toByte(3), Int.toByte(4), Int.toByte(5), Int.toByte(6), Int.toByte(7),
          Int.toByte(8)]
      let result = ArrayBuffer.from(arr);
      expect(result.byteLength).assertEqual(8)
      expect(result.at(7)).assertEqual(Int.toByte(8))
    });

    /**
     * @tc.name testArrayBufferFromOne0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_0900
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回值的 byteLength 为 4。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ValueArray<byte> = [Int.toByte(-1), Int.toByte(-10), Int.toByte(-50), Int.toByte(-128)]
      let result = ArrayBuffer.from(arr);
      expect(result.byteLength).assertEqual(4)
      expect(result.at(0)).assertEqual(Int.toByte(-1))
      expect(result.at(3)).assertEqual(Int.toByte(-128))
    });

    /**
     * @tc.name testArrayBufferFromOne0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_1000
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回的数据内容与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ValueArray<byte> = [Int.toByte(127), Int.toByte(-128), Int.toByte(0), Int.toByte(-1)]
      let result = ArrayBuffer.from(arr);
      expect(result.at(0)).assertEqual(Int.toByte(127))
      expect(result.at(1)).assertEqual(Int.toByte(-128))
    });

    /**
     * @tc.name testArrayBufferFromOne0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_1100
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回值的 byteLength 为 3。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ValueArray<byte> = [Int.toByte(127), Int.toByte(127), Int.toByte(127)]
      let result = ArrayBuffer.from(arr);
      expect(result.byteLength).assertEqual(3)
      expect(result.at(1)).assertEqual(Int.toByte(127))
    });

    /**
     * @tc.name testArrayBufferFromOne0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_1200
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回值的 byteLength 为 2。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ValueArray<byte> = [Int.toByte(-128), Int.toByte(-128)]
      let result = ArrayBuffer.from(arr);
      expect(result.byteLength).assertEqual(2)
      expect(result.at(0)).assertEqual(Int.toByte(-128))
    });

    /**
     * @tc.name testArrayBufferFromOne0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_1300
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回值的 byteLength 为 1。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ValueArray<byte> = [Int.toByte(0)]
      let result = ArrayBuffer.from(arr);
      expect(result.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromOne0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_1400
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回值的 byteLength 为 2。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ValueArray<byte> = [Int.toByte(5), Int.toByte(6)]
      let result = ArrayBuffer.from(arr);
      expect(result.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromOne0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_1500
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回值的 byteLength 为 5。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ValueArray<byte> = [Int.toByte(104), Int.toByte(101), Int.toByte(108), Int.toByte(108), Int.toByte(111)]
      let result = ArrayBuffer.from(arr);
      expect(result.byteLength).assertEqual(5)
    });

    /**
     * @tc.name testArrayBufferFromOne0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_1600
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回值的 byteLength 为 1。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ValueArray<byte> = [Int.toByte(123)]
      let result = ArrayBuffer.from(arr);
      expect(result.byteLength).assertEqual(1)
      expect(result.at(0)).assertEqual(Int.toByte(123))
    });

    /**
     * @tc.name testArrayBufferFromOne0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_1700
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回值的 byteLength 为 1。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ValueArray<byte> = [Int.toByte(1)]
      let result = ArrayBuffer.from(arr);
      expect(result.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromOne0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_1800
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回值的 byteLength 为 2。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ValueArray<byte> = [Int.toByte(11), Int.toByte(22)]
      let result = ArrayBuffer.from(arr);
      expect(result.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromOne0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_1900
     * @tc.desc 验证 ArrayBuffer.from(buf) 在当前场景执行成功，返回值的 byteLength 为 4。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4)
      buf.set(0, Int.toByte(1))
      buf.set(1, Int.toByte(2))
      buf.set(2, Int.toByte(3))
      buf.set(3, Int.toByte(4))
      let result = ArrayBuffer.from(buf);
      expect(result.byteLength).assertEqual(4)
      expect(result.at(0)).assertEqual(Int.toByte(1))
      expect(result.at(3)).assertEqual(Int.toByte(4))
    });

    /**
     * @tc.name testArrayBufferFromOne0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_2000
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回值的 byteLength 为 7。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ValueArray<byte> =
        [Int.toByte(0), Int.toByte(1), Int.toByte(63), Int.toByte(127), Int.toByte(-1), Int.toByte(-64),
          Int.toByte(-128)]
      let result = ArrayBuffer.from(arr);
      expect(result.byteLength).assertEqual(7)
      expect(result.at(3)).assertEqual(Int.toByte(127))
      expect(result.at(6)).assertEqual(Int.toByte(-128))
    });

    /**
     * @tc.name testArrayBufferFromOne0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_2100
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回值的 byteLength 为 5。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ValueArray<byte> = [Int.toByte(1), Int.toByte(2), Int.toByte(3), Int.toByte(4), Int.toByte(5)]
      let result = ArrayBuffer.from(arr);
      expect(result.byteLength).assertEqual(5)
    });

    /**
     * @tc.name testArrayBufferFromOne0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_2200
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回值的 byteLength 为 0。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ValueArray<byte> = []
      let result = ArrayBuffer.from(arr);
      expect(result.byteLength).assertEqual(0)
      expect((result instanceof ArrayBuffer)).assertTrue()
      let bl1 = result.byteLength
      let bl2 = result.byteLength
      expect(bl1).assertEqual(0)
      expect(bl1 === bl2).assertTrue()
    });

    /**
     * @tc.name testArrayBufferFromOne0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_2300
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回值的 byteLength 为 1。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ValueArray<byte> = [Int.toByte(99)]
      let result = ArrayBuffer.from(arr);
      expect(result.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromOne0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_2400
     * @tc.desc 验证 ArrayBuffer.from(u8) 在当前场景执行成功，返回值的 byteLength 为 1024。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(1024)
      for (let i: int = 0; i < 1024; i++) {
        ab.set(i, Int.toByte(i % 256))
      }
      let u8 = new Uint8Array(ab)
      let result = ArrayBuffer.from(u8);
      expect(result.byteLength).assertEqual(1024)
      expect(result.at(0)).assertEqual(Int.toByte(0))
      let lastIndex: int = 1023
      expect(result.at(lastIndex)).assertEqual(ab.at(lastIndex))
    });

    /**
     * @tc.name testArrayBufferFromOne0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_2500
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，实例类型判断符合预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ValueArray<byte> = [Int.toByte(1), Int.toByte(2), Int.toByte(3)]
      let result = ArrayBuffer.from(arr);
      expect((result instanceof ArrayBuffer)).assertTrue()
    });

    /**
     * @tc.name testArrayBufferFromOne0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_2600
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，实例类型判断符合预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ValueArray<byte> = [Int.toByte(1), Int.toByte(2), Int.toByte(3)]
      let result = ArrayBuffer.from(arr);
      expect(result instanceof ArrayBuffer).assertTrue()
    });

    /**
     * @tc.name testArrayBufferFromOne0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_2700
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，边界值比较判断符合预期。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ValueArray<byte> = [Int.toByte(1), Int.toByte(2), Int.toByte(3)]
      let result = ArrayBuffer.from(arr);
      let defined: boolean = result !== undefined
      expect(defined).assertTrue()
    });

    /**
     * @tc.name testArrayBufferFromOne0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_2800
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回的数据内容与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ValueArray<byte> = [Int.toByte(10), Int.toByte(20), Int.toByte(30), Int.toByte(40), Int.toByte(50)]
      let result = ArrayBuffer.from(arr);
      for (let i: int = 0; i < 5; i++) {
        expect(result.at(i)).assertEqual(arr[i])
      }
    });

    /**
     * @tc.name testArrayBufferFromOne0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_2900
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回的数据内容与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ValueArray<byte> = [Int.toByte(127), Int.toByte(-128), Int.toByte(0)]
      let result = ArrayBuffer.from(arr);
      expect(result.at(0)).assertEqual(Int.toByte(127))
      expect(result.at(1)).assertEqual(Int.toByte(-128))
      expect(result.at(2)).assertEqual(Int.toByte(0))
    });

    /**
     * @tc.name testArrayBufferFromOne0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_3000
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回的数据内容与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ValueArray<byte> = [Int.toByte(-1), Int.toByte(-50), Int.toByte(-100)]
      let result = ArrayBuffer.from(arr);
      expect(result.at(0)).assertEqual(Int.toByte(-1))
      expect(result.at(1)).assertEqual(Int.toByte(-50))
      expect(result.at(2)).assertEqual(Int.toByte(-100))
    });

    /**
     * @tc.name testArrayBufferFromOne0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_3100
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回的数据内容与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ValueArray<byte> = [Int.toByte(0), Int.toByte(0), Int.toByte(0), Int.toByte(0)]
      let result = ArrayBuffer.from(arr);
      for (let i: int = 0; i < 4; i++) {
        expect(result.at(i)).assertEqual(Int.toByte(0))
      }
    });

    /**
     * @tc.name testArrayBufferFromOne0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_3200
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回的数据内容与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ValueArray<byte> = [Int.toByte(42)]
      let result = ArrayBuffer.from(arr);
      expect(result.at(0)).assertEqual(Int.toByte(42))
    });

    /**
     * @tc.name testArrayBufferFromOne0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_3300
     * @tc.desc 验证 ArrayBuffer.from(u8) 在当前场景执行成功，返回的数据内容与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(3)
      ab.set(0, Int.toByte(1))
      ab.set(1, Int.toByte(2))
      ab.set(2, Int.toByte(3))
      let u8 = new Uint8Array(ab)
      let result = ArrayBuffer.from(u8);
      let z0: int = 0
      ab.set(z0, Int.toByte(99))
      expect(result.at(0)).assertEqual(Int.toByte(1))
    });

    /**
     * @tc.name testArrayBufferFromOne0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_3400
     * @tc.desc 验证 ArrayBuffer.from(u8) 在当前场景执行成功，返回值的 byteLength 为 3。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(3, 8)
      ab.set(0, Int.toByte(10))
      ab.set(1, Int.toByte(20))
      ab.set(2, Int.toByte(30))
      let u8 = new Uint8Array(ab)
      let result = ArrayBuffer.from(u8);
      ab.resize(0)
      expect(result.byteLength).assertEqual(3)
      expect(result.at(0)).assertEqual(Int.toByte(10))
    });

    /**
     * @tc.name testArrayBufferFromOne0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_3500
     * @tc.desc 验证 ArrayBuffer.from(arr) 在当前场景执行成功，返回的数据内容与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ValueArray<byte> = [Int.toByte(5), Int.toByte(6), Int.toByte(7)]
      let result1 = ArrayBuffer.from(arr)
      let result2 = ArrayBuffer.from(arr)
      expect((result1 !== result2)).assertTrue()
      expect(result1.byteLength).assertEqual(result2.byteLength)
      expect(result1.at(0)).assertEqual(result2.at(0))
    });

    /**
     * @tc.name testArrayBufferFromOne0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_3600
     * @tc.desc 验证 ArrayBuffer.from(u8) 在当前场景执行成功，返回的数据内容与预期一致。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(3)
      ab.set(0, Int.toByte(1))
      ab.set(1, Int.toByte(2))
      ab.set(2, Int.toByte(3))
      let u8 = new Uint8Array(ab)
      let result = ArrayBuffer.from(u8);
      let z0: int = 0
      ab.set(z0, Int.toByte(100))
      expect(result.at(0)).assertEqual(Int.toByte(1))
      expect(ab.at(z0)).assertEqual(Int.toByte(100))
    });

    /**
     * @tc.name testArrayBufferFromOne0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_3700
     * @tc.desc 验证 ArrayBuffer.from((null as ESObject) as ValueArray<byte>) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.from((null as ESObject) as ValueArray<byte>);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromOne0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_3800
     * @tc.desc 验证 ArrayBuffer.from((undefined as ESObject) as ValueArray<byte>) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.from((undefined as ESObject) as ValueArray<byte>);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromOne0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_3900
     * @tc.desc 验证 ArrayBuffer.from((null as ESObject) as ValueArray<byte>) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result = ArrayBuffer.from((null as ESObject) as ValueArray<byte>);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromOne0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_4000
     * @tc.desc 验证 ArrayBuffer.from((undefined as ESObject) as ValueArray<byte>) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result = ArrayBuffer.from((undefined as ESObject) as ValueArray<byte>);
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromOne0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_4100
     * @tc.desc 验证 ArrayBuffer.from((("abc" as Object) as ValueArray<byte>)) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result = ArrayBuffer.from((("abc" as Object) as ValueArray<byte>));
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromOne0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_4200
     * @tc.desc 验证 ArrayBuffer.from((((42 as number) as ESObject) as ValueArray<byte>)) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result = ArrayBuffer.from((((42 as number) as ESObject) as ValueArray<byte>));
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
        Utils.assertThrownErrorCodeIsNumber(e);
        return;
      }
      expect(true).assertFail();
    });

    /**
     * @tc.name testArrayBufferFromOne0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_4300
     * @tc.desc 验证 ArrayBuffer.from(buf) 在当前场景执行成功，返回值的 byteLength 为 4。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4)
      buf.set(0, Int.toByte(11))
      let result = ArrayBuffer.from(buf);
      expect(result.byteLength).assertEqual(4)
      expect(result.at(0)).assertEqual(Int.toByte(11))
    });

    /**
     * @tc.name testArrayBufferFromOne0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_4400
     * @tc.desc 验证 ArrayBuffer.from(((true as Object) as ValueArray<byte>)) 在当前入参场景下会抛出异常。
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result = ArrayBuffer.from(((true as Object) as ValueArray<byte>));
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