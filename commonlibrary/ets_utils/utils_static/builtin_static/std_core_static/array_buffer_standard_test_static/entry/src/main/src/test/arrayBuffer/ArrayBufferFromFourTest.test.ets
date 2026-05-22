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

export default function arrayBufferFromFourTest(): void {
  describe('ArrayBufferFromFourTest', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });


    /**
     * @tc.name testArrayBufferFromFour0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_0100
     * @tc.desc Verify buffer.byteLength equals 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: double[] = [1.0, 2.0, 3.0];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.byteLength).assertEqual(3);
      expect(buffer.at(0)).assertEqual(Int.toByte(1));
      expect(buffer.at(1)).assertEqual(Int.toByte(2));
      expect(buffer.at(2)).assertEqual(Int.toByte(3));
    });
    /**
     * @tc.name testArrayBufferFromFour0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_0200
     * @tc.desc Verify buffer.byteLength equals 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: double[] = [1.0, 2.0, 3.0, 4.0];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.byteLength).assertEqual(4);
      expect(buffer.at(0)).assertEqual(Int.toByte(1));
      expect(buffer.at(1)).assertEqual(Int.toByte(2));
      expect(buffer.at(2)).assertEqual(Int.toByte(3));
      expect(buffer.at(3)).assertEqual(Int.toByte(4));
    });
    /**
     * @tc.name testArrayBufferFromFour0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_0300
     * @tc.desc Verify buffer.byteLength equals 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: double[] = [1.9, 2.5, 3.1, -1.7];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.byteLength).assertEqual(4);
      expect(buffer.at(0)).assertEqual(Int.toByte(1));
      expect(buffer.at(1)).assertEqual(Int.toByte(2));
      expect(buffer.at(2)).assertEqual(Int.toByte(3));
      expect(buffer.at(3)).assertEqual(Int.toByte(-1));
    });
    /**
     * @tc.name testArrayBufferFromFour0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_0400
     * @tc.desc Verify buffer.byteLength equals 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: double[] = [0.0];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.byteLength).assertEqual(1);
      expect(buffer.at(0)).assertEqual(Int.toByte(0));
    });
    /**
     * @tc.name testArrayBufferFromFour0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_0500
     * @tc.desc Verify buffer.byteLength equals 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: double[] = [-1.0, -128.0, -10.5];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.byteLength).assertEqual(3);
      expect(buffer.at(0)).assertEqual(Int.toByte(-1));
      expect(buffer.at(1)).assertEqual(Int.toByte(-128));
      expect(buffer.at(2)).assertEqual(Int.toByte(-10));
    });
    /**
     * @tc.name testArrayBufferFromFour0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_0600
     * @tc.desc Verify buffer.byteLength equals 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: double[] = [];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.byteLength).assertEqual(0);
    });
    /**
     * @tc.name testArrayBufferFromFour0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_0700
     * @tc.desc Verify buffer.byteLength equals 10
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: double[] = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.byteLength).assertEqual(10);
      expect(buffer.at(0)).assertEqual(Int.toByte(1));
      expect(buffer.at(9)).assertEqual(Int.toByte(10));
    });
    /**
     * @tc.name testArrayBufferFromFour0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_0800
     * @tc.desc Verify buffer.byteLength equals 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: double[] = [1.0, Double.NaN, 3.0];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.byteLength).assertEqual(3);
    });
    /**
     * @tc.name testArrayBufferFromFour0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_0900
     * @tc.desc Verify buffer.byteLength equals 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: double[] = [1.0, Double.POSITIVE_INFINITY, Double.NEGATIVE_INFINITY];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.byteLength).assertEqual(3);
    });
    /**
     * @tc.name testArrayBufferFromFour0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_1000
     * @tc.desc Verify buffer.byteLength equals 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: double[] = [128.0, 255.0, 256.0];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.byteLength).assertEqual(3);
    });
    /**
     * @tc.name testArrayBufferFromFour0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_1100
     * @tc.desc Verify buffer.byteLength equals 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: double[] = [-129.0, -256.0, -1000.0];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.byteLength).assertEqual(3);
    });
    /**
     * @tc.name testArrayBufferFromFour0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_1200
     * @tc.desc Verify buffer.byteLength equals 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: double[] = [127.0];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.byteLength).assertEqual(1);
      expect(buffer.at(0)).assertEqual(Int.toByte(127));
    });
    /**
     * @tc.name testArrayBufferFromFour0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_1300
     * @tc.desc Verify buffer.byteLength equals 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: double[] = [-128.0];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.byteLength).assertEqual(1);
      expect(buffer.at(0)).assertEqual(Int.toByte(-128));
    });
    /**
     * @tc.name testArrayBufferFromFour0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_1400
     * @tc.desc Verify buffer.byteLength equals 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: double[] = [1.0, 2.0, 3.0];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.byteLength).assertEqual(3);
    });
    /**
     * @tc.name testArrayBufferFromFour0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_1500
     * @tc.desc Verify buffer.byteLength equals 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: double[] = [42.0];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.byteLength).assertEqual(1);
    });
    /**
     * @tc.name testArrayBufferFromFour0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_1600
     * @tc.desc Verify return value is ArrayBuffer instance
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: double[] = [1.0, 2.0];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer instanceof ArrayBuffer).assertTrue();
    });
    /**
     * @tc.name testArrayBufferFromFour0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_1700
     * @tc.desc Verify value is not null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: double[] = [1.0];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer != null).assertTrue();
    });
    /**
     * @tc.name testArrayBufferFromFour0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_1800
     * @tc.desc Verify buffer.byteLength equals 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: double[] = [];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer != null).assertTrue();
      expect(buffer.byteLength).assertEqual(0);
      expect(buffer instanceof ArrayBuffer).assertTrue();
    });
    /**
     * @tc.name testArrayBufferFromFour0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_1900
     * @tc.desc Verify buffer1 === buffer2 is false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: double[] = [1.0, 2.0];
      const buffer1 = ArrayBuffer.from(arr);
      const buffer2 = ArrayBuffer.from(arr);
      expect(buffer1 === buffer2).assertFalse();
    });
    /**
     * @tc.name testArrayBufferFromFour0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_2000
     * @tc.desc Verify buffer.at returns expected bytes at 4 indices
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: double[] = [1.0, 50.0, 100.0, 127.0];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.at(0)).assertEqual(Int.toByte(1));
      expect(buffer.at(1)).assertEqual(Int.toByte(50));
      expect(buffer.at(2)).assertEqual(Int.toByte(100));
      expect(buffer.at(3)).assertEqual(Int.toByte(127));
    });
    /**
     * @tc.name testArrayBufferFromFour0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_2100
     * @tc.desc Verify buffer.at returns expected bytes at 3 indices
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: double[] = [1.9, 99.5, 127.999];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.at(0)).assertEqual(Int.toByte(1));
      expect(buffer.at(1)).assertEqual(Int.toByte(99));
      expect(buffer.at(2)).assertEqual(Int.toByte(127));
    });
    /**
     * @tc.name testArrayBufferFromFour0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_2200
     * @tc.desc Verify buffer.at returns expected bytes at 3 indices
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: double[] = [-1.9, -50.5, -128.0];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.at(0)).assertEqual(Int.toByte(-1));
      expect(buffer.at(1)).assertEqual(Int.toByte(-50));
      expect(buffer.at(2)).assertEqual(Int.toByte(-128));
    });
    /**
     * @tc.name testArrayBufferFromFour0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_2300
     * @tc.desc Verify buffer.at returns expected bytes at 3 indices
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: double[] = [0.0, 0.0, 0.0];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.at(0)).assertEqual(Int.toByte(0));
      expect(buffer.at(1)).assertEqual(Int.toByte(0));
      expect(buffer.at(2)).assertEqual(Int.toByte(0));
    });
    /**
     * @tc.name testArrayBufferFromFour0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_2400
     * @tc.desc Verify buffer.at(0) returns Int.toByte(-128)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: double[] = [-128.0];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.at(0)).assertEqual(Int.toByte(-128));
    });
    /**
     * @tc.name testArrayBufferFromFour0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_2500
     * @tc.desc Verify buffer.at returns expected bytes at 4 indices
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: double[] = [10.5, 20.9, 30.1, 40.0];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.at(0)).assertEqual(Int.toByte(10));
      expect(buffer.at(1)).assertEqual(Int.toByte(20));
      expect(buffer.at(2)).assertEqual(Int.toByte(30));
      expect(buffer.at(3)).assertEqual(Int.toByte(40));
    });
    /**
     * @tc.name testArrayBufferFromFour0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_2600
     * @tc.desc Verify buffer.at returns expected bytes at 3 indices
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: double[] = [10.0, 20.0, 30.0];
      const buffer = ArrayBuffer.from(arr);
      arr[0] = 99.0;
      expect(buffer.at(0)).assertEqual(Int.toByte(10));
      expect(buffer.at(1)).assertEqual(Int.toByte(20));
      expect(buffer.at(2)).assertEqual(Int.toByte(30));
    });
    /**
     * @tc.name testArrayBufferFromFour0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_2700
     * @tc.desc Verify arr[0] equals 10.0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: double[] = [10.0, 20.0];
      const buffer = ArrayBuffer.from(arr);
      buffer.set(0, Int.toByte(99));
      expect(arr[0]).assertEqual(10.0);
      expect(arr[1]).assertEqual(20.0);
    });
    /**
     * @tc.name testArrayBufferFromFour0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_2800
     * @tc.desc Verify buffer.at returns expected bytes at 2 indices
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: double[] = [1.0, 2.0, 3.0];
      const buffer1 = ArrayBuffer.from(arr);
      const buffer2 = ArrayBuffer.from(arr);
      buffer1.set(0, Int.toByte(99));
      expect(buffer2.at(0)).assertEqual(Int.toByte(1));
      expect(buffer1.at(0)).assertEqual(Int.toByte(99));
    });
  });
}
