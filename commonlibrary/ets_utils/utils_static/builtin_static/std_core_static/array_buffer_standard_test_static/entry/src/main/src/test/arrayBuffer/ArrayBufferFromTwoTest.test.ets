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

export default function arrayBufferFromTwoTest(): void {
  describe('ArrayBufferFromTwoTest', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.name testArrayBufferFromTwo0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_0100
     * @tc.desc Verify buffer.byteLength equals 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: FixedArray<byte> = [Int.toByte(1), Int.toByte(2), Int.toByte(3)];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.byteLength).assertEqual(3);
    });

    /**
     * @tc.name testArrayBufferFromTwo0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_0200
     * @tc.desc Verify buffer.byteLength equals 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: FixedArray<byte> =
        [Int.toByte(10), Int.toByte(20), Int.toByte(30), Int.toByte(40)];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.byteLength).assertEqual(4);
      expect(buffer.at(0)).assertEqual(Int.toByte(10));
      expect(buffer.at(1)).assertEqual(Int.toByte(20));
      expect(buffer.at(2)).assertEqual(Int.toByte(30));
      expect(buffer.at(3)).assertEqual(Int.toByte(40));
    });

    /**
     * @tc.name testArrayBufferFromTwo0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_0300
     * @tc.desc Verify buffer.byteLength equals 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: FixedArray<byte> = [Int.toByte(42)];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.byteLength).assertEqual(1);
      expect(buffer.at(0)).assertEqual(Int.toByte(42));
    });

    /**
     * @tc.name testArrayBufferFromTwo0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_0400
     * @tc.desc Verify value is not null and buffer.byteLength equals 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: FixedArray<byte> = [];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.byteLength).assertEqual(0);
      expect(buffer != null).assertTrue();
    });

    /**
     * @tc.name testArrayBufferFromTwo0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_0500
     * @tc.desc Verify buffer.byteLength equals 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: FixedArray<byte> = [Int.toByte(127)];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.byteLength).assertEqual(1);
      expect(buffer.at(0)).assertEqual(Int.toByte(127));
    });

    /**
     * @tc.name testArrayBufferFromTwo0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_0600
     * @tc.desc Verify buffer.byteLength equals 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: FixedArray<byte> = [Int.toByte(-128)];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.byteLength).assertEqual(1);
      expect(buffer.at(0)).assertEqual(Int.toByte(-128));
    });

    /**
     * @tc.name testArrayBufferFromTwo0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_0700
     * @tc.desc Verify buffer.byteLength equals 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: FixedArray<byte> = [Int.toByte(0)];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.byteLength).assertEqual(1);
      expect(buffer.at(0)).assertEqual(Int.toByte(0));
    });

    /**
     * @tc.name testArrayBufferFromTwo0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_0800
     * @tc.desc Verify buffer.byteLength equals 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: FixedArray<byte> = [Int.toByte(-1)];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.byteLength).assertEqual(1);
      expect(buffer.at(0)).assertEqual(Int.toByte(-1));
    });

    /**
     * @tc.name testArrayBufferFromTwo0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_0900
     * @tc.desc Verify buffer.byteLength equals 5
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: FixedArray<byte> =
        [Int.toByte(-128), Int.toByte(-1), Int.toByte(0), Int.toByte(1), Int.toByte(127)];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.byteLength).assertEqual(5);
      expect(buffer.at(0)).assertEqual(Int.toByte(-128));
      expect(buffer.at(1)).assertEqual(Int.toByte(-1));
      expect(buffer.at(2)).assertEqual(Int.toByte(0));
      expect(buffer.at(3)).assertEqual(Int.toByte(1));
      expect(buffer.at(4)).assertEqual(Int.toByte(127));
    });

    /**
     * @tc.name testArrayBufferFromTwo0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_1000
     * @tc.desc Verify buffer.byteLength equals 10
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: FixedArray<byte> =
        [Int.toByte(1), Int.toByte(2), Int.toByte(3), Int.toByte(4), Int.toByte(5), Int.toByte(6), Int.toByte(7),
          Int.toByte(8), Int.toByte(9), Int.toByte(10)];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.byteLength).assertEqual(10);
      expect(buffer.at(0)).assertEqual(Int.toByte(1));
      expect(buffer.at(9)).assertEqual(Int.toByte(10));
    });

    /**
     * @tc.name testArrayBufferFromTwo0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_1100
     * @tc.desc Verify buffer.byteLength equals 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: FixedArray<byte> = [Int.toByte(10), Int.toByte(20), Int.toByte(30)];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.byteLength).assertEqual(3);
    });

    /**
     * @tc.name testArrayBufferFromTwo0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_1200
     * @tc.desc Verify buffer.byteLength equals 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: FixedArray<byte> = [Int.toByte(99)];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.byteLength).assertEqual(1);
    });

    /**
     * @tc.name testArrayBufferFromTwo0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_1300
     * @tc.desc Verify return value is ArrayBuffer instance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: FixedArray<byte> = [Int.toByte(1), Int.toByte(2)];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer instanceof ArrayBuffer).assertTrue();
    });

    /**
     * @tc.name testArrayBufferFromTwo0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_1400
     * @tc.desc Verify value is not null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: FixedArray<byte> = [Int.toByte(1)];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer != null).assertTrue();
    });

    /**
     * @tc.name testArrayBufferFromTwo0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_1500
     * @tc.desc Verify (buffer1 !== buffer2) is true
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: FixedArray<byte> = [Int.toByte(1), Int.toByte(2)];
      const buffer1 = ArrayBuffer.from(arr);
      const buffer2 = ArrayBuffer.from(arr);
      expect((buffer1 !== buffer2)).assertTrue();
    });

    /**
     * @tc.name testArrayBufferFromTwo0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_1600
     * @tc.desc Verify buffer.at returns expected bytes at 4 indices
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: FixedArray<byte> =
        [Int.toByte(10), Int.toByte(20), Int.toByte(30), Int.toByte(40)];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.at(0)).assertEqual(Int.toByte(10));
      expect(buffer.at(1)).assertEqual(Int.toByte(20));
      expect(buffer.at(2)).assertEqual(Int.toByte(30));
      expect(buffer.at(3)).assertEqual(Int.toByte(40));
    });

    /**
     * @tc.name testArrayBufferFromTwo0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_1700
     * @tc.desc Verify buffer.at(0) returns Int.toByte(55)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: FixedArray<byte> = [Int.toByte(55)];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.at(0)).assertEqual(Int.toByte(55));
    });

    /**
     * @tc.name testArrayBufferFromTwo0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_1800
     * @tc.desc Verify buffer.at returns expected bytes at 2 indices
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: FixedArray<byte> = [Int.toByte(-128), Int.toByte(127)];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.at(0)).assertEqual(Int.toByte(-128));
      expect(buffer.at(1)).assertEqual(Int.toByte(127));
    });

    /**
     * @tc.name testArrayBufferFromTwo0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_1900
     * @tc.desc Verify buffer.at returns expected bytes at 3 indices
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: FixedArray<byte> = [Int.toByte(0), Int.toByte(0), Int.toByte(0)];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.at(0)).assertEqual(Int.toByte(0));
      expect(buffer.at(1)).assertEqual(Int.toByte(0));
      expect(buffer.at(2)).assertEqual(Int.toByte(0));
    });

    /**
     * @tc.name testArrayBufferFromTwo0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_2000
     * @tc.desc Verify buffer.at returns expected bytes at 3 indices
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: FixedArray<byte> = [Int.toByte(10), Int.toByte(20), Int.toByte(30)];
      const buffer = ArrayBuffer.from(arr);
      arr[0] = Int.toByte(99);
      expect(buffer.at(0)).assertEqual(Int.toByte(10));
      expect(buffer.at(1)).assertEqual(Int.toByte(20));
      expect(buffer.at(2)).assertEqual(Int.toByte(30));
    });

    /**
     * @tc.name testArrayBufferFromTwo0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_2100
     * @tc.desc Verify arr[0] equals Int.toByte(10)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: FixedArray<byte> = [Int.toByte(10), Int.toByte(20)];
      const buffer = ArrayBuffer.from(arr);
      buffer.set(0, Int.toByte(99));
      expect(arr[0]).assertEqual(Int.toByte(10));
      expect(arr[1]).assertEqual(Int.toByte(20));
    });

    /**
     * @tc.name testArrayBufferFromTwo0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_2200
     * @tc.desc Verify buffer.at returns expected bytes at 2 indices
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: FixedArray<byte> = [Int.toByte(1), Int.toByte(2), Int.toByte(3)];
      const buffer1 = ArrayBuffer.from(arr);
      const buffer2 = ArrayBuffer.from(arr);
      buffer1.set(0, Int.toByte(99));
      expect(buffer2.at(0)).assertEqual(Int.toByte(1));
      expect(buffer1.at(0)).assertEqual(Int.toByte(99));
    });
  });
}
