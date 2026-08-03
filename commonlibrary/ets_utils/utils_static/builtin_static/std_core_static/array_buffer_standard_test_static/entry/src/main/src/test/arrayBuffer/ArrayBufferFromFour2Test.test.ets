'use static';
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
  beforeEach, describe, expect, it, Level, Size, TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function arrayBufferFromFour2Test(): void {
  describe('ArrayBufferFromFour2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.name testArrayBufferFromFour0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_0100
     * @tc.desc Verify from(double[]) preserves all byte values from -128 to 127
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: double[] = [];
      for (let i: int = 0; i < 256; i++) {
        arr.push((i - 128) * 1.0);
      }
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.byteLength).assertEqual(256);
      for (let i: int = 0; i < 256; i++) {
        expect(buffer.at(i)).assertEqual(Int.toByte(i - 128));
      }
    });

    /**
     * @tc.name testArrayBufferFromFour0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_0200
     * @tc.desc Verify from(double[]) converts values from 0 to 255 to bytes correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: double[] = [];
      for (let i: int = 0; i < 256; i++) {
        arr.push(i * 1.0);
      }
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.byteLength).assertEqual(256);
      for (let i: int = 0; i < 256; i++) {
        expect(buffer.at(i)).assertEqual(Int.toByte(i));
      }
    });

    /**
     * @tc.name testArrayBufferFromFour0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_0300
     * @tc.desc Verify from(double[]) copies every converted byte in a regular large array
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const length: int = 4096;
      const arr: double[] = [];
      for (let i: int = 0; i < length; i++) {
        arr.push((i % 256) * 1.0);
      }
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.byteLength).assertEqual(length);
      for (let i: int = 0; i < length; i++) {
        expect(buffer.at(i)).assertEqual(Int.toByte(i % 256));
      }
    });

    /**
     * @tc.name testArrayBufferFromFour0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_0400
     * @tc.desc Verify from(double[]) truncates positive fractional values before byte conversion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: double[] = [0.1, 1.1, 1.9, 126.9, 127.9, 128.9, 255.9];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.byteLength).assertEqual(7);
      expect(buffer.at(0)).assertEqual(Int.toByte(0));
      expect(buffer.at(1)).assertEqual(Int.toByte(1));
      expect(buffer.at(2)).assertEqual(Int.toByte(1));
      expect(buffer.at(3)).assertEqual(Int.toByte(126));
      expect(buffer.at(4)).assertEqual(Int.toByte(127));
      expect(buffer.at(5)).assertEqual(Int.toByte(-128));
      expect(buffer.at(6)).assertEqual(Int.toByte(-1));
    });

    /**
     * @tc.name testArrayBufferFromFour0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_0500
     * @tc.desc Verify from(double[]) truncates negative fractional values before byte conversion
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: double[] = [-0.1, -1.1, -1.9, -126.9, -127.9, -128.9, -129.9];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.byteLength).assertEqual(7);
      expect(buffer.at(0)).assertEqual(Int.toByte(0));
      expect(buffer.at(1)).assertEqual(Int.toByte(-1));
      expect(buffer.at(2)).assertEqual(Int.toByte(-1));
      expect(buffer.at(3)).assertEqual(Int.toByte(-126));
      expect(buffer.at(4)).assertEqual(Int.toByte(-127));
      expect(buffer.at(5)).assertEqual(Int.toByte(-128));
      expect(buffer.at(6)).assertEqual(Int.toByte(127));
    });

    /**
     * @tc.name testArrayBufferFromFour0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_0600
     * @tc.desc Verify from(double[]) copies an all-zero array correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: double[] = [];
      for (let i: int = 0; i < 64; i++) {
        arr.push(0.0);
      }
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.byteLength).assertEqual(64);
      for (let i: int = 0; i < 64; i++) {
        expect(buffer.at(i)).assertEqual(Int.toByte(0));
      }
    });

    /**
     * @tc.name testArrayBufferFromFour0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_0700
     * @tc.desc Verify from(double[]) copies an all-negative-one array correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: double[] = [];
      for (let i: int = 0; i < 64; i++) {
        arr.push(-1.0);
      }
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.byteLength).assertEqual(64);
      for (let i: int = 0; i < 64; i++) {
        expect(buffer.at(i)).assertEqual(Int.toByte(-1));
      }
    });

    /**
     * @tc.name testArrayBufferFromFour0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_0800
     * @tc.desc Verify from(double[]) copies mixed signed and overflow values correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: double[] = [-257.0, -256.0, -129.0, -128.0, -1.0, 0.0, 1.0, 127.0, 128.0, 255.0, 256.0, 257.0];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.byteLength).assertEqual(12);
      expect(buffer.at(0)).assertEqual(Int.toByte(-1));
      expect(buffer.at(1)).assertEqual(Int.toByte(0));
      expect(buffer.at(2)).assertEqual(Int.toByte(127));
      expect(buffer.at(3)).assertEqual(Int.toByte(-128));
      expect(buffer.at(4)).assertEqual(Int.toByte(-1));
      expect(buffer.at(5)).assertEqual(Int.toByte(0));
      expect(buffer.at(6)).assertEqual(Int.toByte(1));
      expect(buffer.at(7)).assertEqual(Int.toByte(127));
      expect(buffer.at(8)).assertEqual(Int.toByte(-128));
      expect(buffer.at(9)).assertEqual(Int.toByte(-1));
      expect(buffer.at(10)).assertEqual(Int.toByte(0));
      expect(buffer.at(11)).assertEqual(Int.toByte(1));
    });

    /**
     * @tc.name testArrayBufferFromFour0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_0900
     * @tc.desc Verify from(double[]) returns ArrayBuffer with correct basic properties
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: double[] = [11.0, 22.0, 33.0];
      const buffer = ArrayBuffer.from(arr);
      expect(buffer.byteLength).assertEqual(3);
      expect(buffer.getByteLength()).assertEqual(3);
      expect(buffer.detached).assertFalse();
      expect(buffer.resizable).assertFalse();
      expect(buffer.at(0)).assertEqual(Int.toByte(11));
      expect(buffer.at(1)).assertEqual(Int.toByte(22));
      expect(buffer.at(2)).assertEqual(Int.toByte(33));
    });

    /**
     * @tc.name testArrayBufferFromFour0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_1000
     * @tc.desc Verify from(double[]) with empty array returns zero-length buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: double[] = [];
      const buf: ArrayBuffer = ArrayBuffer.from(src);
      expect(buf.byteLength).assertEqual(0);
    });

    /**
     * @tc.name testArrayBufferFromFour0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_1100
     * @tc.desc Verify from(double[]) single positive value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: double[] = [127.0];
      const buf: ArrayBuffer = ArrayBuffer.from(src);
      expect(buf.byteLength).assertEqual(1);
      expect(buf.at(0)).assertEqual(Int.toByte(127));
    });

    /**
     * @tc.name testArrayBufferFromFour0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_1200
     * @tc.desc Verify from(double[]) double negative -1.0 converts to byte -1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: double[] = [-1.0];
      const buf: ArrayBuffer = ArrayBuffer.from(src);
      expect(buf.at(0)).assertEqual(Int.toByte(-1));
    });

    /**
     * @tc.name testArrayBufferFromFour0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_1300
     * @tc.desc Verify from(double[]) 0.999 truncates to 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: double[] = [0.999];
      const buf: ArrayBuffer = ArrayBuffer.from(src);
      expect(buf.at(0)).assertEqual(Int.toByte(0));
    });

    /**
     * @tc.name testArrayBufferFromFour0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_1400
     * @tc.desc Verify from(double[]) 1.999 truncates to 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: double[] = [1.999];
      const buf: ArrayBuffer = ArrayBuffer.from(src);
      expect(buf.at(0)).assertEqual(Int.toByte(1));
    });

    /**
     * @tc.name testArrayBufferFromFour0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_1500
     * @tc.desc Verify from(double[]) 128.0 wraps to -128
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: double[] = [128.0];
      const buf: ArrayBuffer = ArrayBuffer.from(src);
      expect(buf.at(0)).assertEqual(Int.toByte(-128));
    });

    /**
     * @tc.name testArrayBufferFromFour0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_1600
     * @tc.desc Verify from(double[]) 256.0 wraps to 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: double[] = [256.0];
      const buf: ArrayBuffer = ArrayBuffer.from(src);
      expect(buf.at(0)).assertEqual(Int.toByte(0));
    });

    /**
     * @tc.name testArrayBufferFromFour0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_1700
     * @tc.desc Verify from(double[]) 255.0 wraps to -1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: double[] = [255.0];
      const buf: ArrayBuffer = ArrayBuffer.from(src);
      expect(buf.at(0)).assertEqual(Int.toByte(-1));
    });

    /**
     * @tc.name testArrayBufferFromFour0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_1800
     * @tc.desc Verify from(double[]) -129.0 wraps to 127
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: double[] = [-129.0];
      const buf: ArrayBuffer = ArrayBuffer.from(src);
      expect(buf.at(0)).assertEqual(Int.toByte(127));
    });

    /**
     * @tc.name testArrayBufferFromFour0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_1900
     * @tc.desc Verify from(double[]) 2000.0 wraps to -48
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: double[] = [2000.0];
      const buf: ArrayBuffer = ArrayBuffer.from(src);
      expect(buf.at(0)).assertEqual(Int.toByte(-48));
    });

    /**
     * @tc.name testArrayBufferFromFour0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_2000
     * @tc.desc Verify from(double[]) -300.0 wraps to -44
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: double[] = [-300.0];
      const buf: ArrayBuffer = ArrayBuffer.from(src);
      expect(buf.at(0)).assertEqual(Int.toByte(-44));
    });

    /**
     * @tc.name testArrayBufferFromFour0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_2100
     * @tc.desc Verify from(double[]) NaN converts to 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: double[] = [Double.NaN];
      const buf: ArrayBuffer = ArrayBuffer.from(src);
      expect(buf.at(0)).assertEqual(Int.toByte(0));
    });

    /**
     * @tc.name testArrayBufferFromFour0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_2200
     * @tc.desc Verify from(double[]) Infinity converts to -1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: double[] = [Double.POSITIVE_INFINITY];
      const buf: ArrayBuffer = ArrayBuffer.from(src);
      expect(buf.at(0)).assertEqual(Int.toByte(-1));
    });

    /**
     * @tc.name testArrayBufferFromFour0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_2300
     * @tc.desc Verify from(double[]) -Infinity converts to 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: double[] = [Double.NEGATIVE_INFINITY];
      const buf: ArrayBuffer = ArrayBuffer.from(src);
      expect(buf.at(0)).assertEqual(Int.toByte(0));
    });

    /**
     * @tc.name testArrayBufferFromFour0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_2400
     * @tc.desc Verify from(double[]) with 3 elements returns byteLength 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: double[] = [1.0, 2.0, 3.0];
      const buf: ArrayBuffer = ArrayBuffer.from(src);
      expect(buf.byteLength).assertEqual(3);
    });

    /**
     * @tc.name testArrayBufferFromFour0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_2500
     * @tc.desc Verify from(double[]) with 5 elements
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: double[] = [5.0, 10.0, 15.0, 20.0, 25.0];
      const buf: ArrayBuffer = ArrayBuffer.from(src);
      expect(buf.byteLength).assertEqual(5);
    });

    /**
     * @tc.name testArrayBufferFromFour0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_2600
     * @tc.desc Verify from(double[]) -128.5 truncates to -128
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: double[] = [-128.5];
      const buf: ArrayBuffer = ArrayBuffer.from(src);
      expect(buf.at(0)).assertEqual(Int.toByte(-128));
    });

    /**
     * @tc.name testArrayBufferFromFour0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_2700
     * @tc.desc Verify from(double[]) creates buffer with detached false
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: double[] = [1.0, 2.0];
      const buf: ArrayBuffer = ArrayBuffer.from(src);
      expect(buf.detached).assertFalse();
    });

    /**
     * @tc.name testArrayBufferFromFour0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_2800
     * @tc.desc Verify from(double[]) 0e0 scientific notation
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: double[] = [0e0, 1e1, 1.5e1];
      const buf: ArrayBuffer = ArrayBuffer.from(src);
      expect(buf.at(0)).assertEqual(Int.toByte(0));
      expect(buf.at(1)).assertEqual(Int.toByte(10));
      expect(buf.at(2)).assertEqual(Int.toByte(15));
    });
  });
}
