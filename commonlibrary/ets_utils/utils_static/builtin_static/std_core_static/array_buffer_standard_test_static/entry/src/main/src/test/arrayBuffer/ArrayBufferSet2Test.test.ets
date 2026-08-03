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

export default function arrayBufferSet2Test(): void {
  describe('ArrayBufferSet2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.name testArrayBufferSet0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_0100
     * @tc.desc Verify set with pos normal value 10000
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(10000);
      buffer.set(5000, Int.toByte(50));
      expect(buffer.at(5000)).assertEqual(Int.toByte(50));
    });

    /**
     * @tc.name testArrayBufferSet0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_0200
     * @tc.desc Verify set with pos hexadecimal value 0x1234
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(0x1234);
      buffer.set(0x1000, Int.toByte(60));
      expect(buffer.at(0x1000)).assertEqual(Int.toByte(60));
    });

    /**
     * @tc.name testArrayBufferSet0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_0300
     * @tc.desc Verify set with pos octal value 0o50 on buffer sized 0o123
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(0o123);
      buffer.set(0o50, Int.toByte(70));
      expect(buffer.at(0o50)).assertEqual(Int.toByte(70));
    });

    /**
     * @tc.name testArrayBufferSet0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_0400
     * @tc.desc Verify set with pos binary value 0b100 on buffer sized 0b1010
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(0b1010);
      buffer.set(0b100, Int.toByte(80));
      expect(buffer.at(0b100)).assertEqual(Int.toByte(80));
    });

    /**
     * @tc.name testArrayBufferSet0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_0500
     * @tc.desc Verify set with pos boundary value 2147483647 (int max) throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(100);
      try {
        buffer.set(2147483647, Int.toByte(10));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.name testArrayBufferSet0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_0600
     * @tc.desc Verify set with pos business threshold value 1000000
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(1000000);
      buffer.set(500000, Int.toByte(90));
      expect(buffer.at(500000)).assertEqual(Int.toByte(90));
    });

    /**
     * @tc.name testArrayBufferSet0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_0700
     * @tc.desc Verify set with val normal value 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.set(0, Int.toByte(0));
      expect(buffer.at(0)).assertEqual(Int.toByte(0));
    });

    /**
     * @tc.name testArrayBufferSet0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_0800
     * @tc.desc Verify set with val hexadecimal value 0x0A
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.set(0, Int.toByte(0x0A));
      expect(buffer.at(0)).assertEqual(Int.toByte(10));
    });

    /**
     * @tc.name testArrayBufferSet0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_0900
     * @tc.desc Verify set with val octal value 0o14
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.set(0, Int.toByte(0o14));
      expect(buffer.at(0)).assertEqual(Int.toByte(12));
    });

    /**
     * @tc.name testArrayBufferSet0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_1000
     * @tc.desc Verify set with val hexadecimal boundary value 0x80 (byte max + 1)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.set(0, Int.toByte(0x80));
      expect(buffer.at(0)).assertEqual(Int.toByte(-128));
    });

    /**
     * @tc.name testArrayBufferSet0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_1100
     * @tc.desc Verify set with val hexadecimal overflow value 0x81
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.set(0, Int.toByte(0x81));
      expect(buffer.at(0)).assertEqual(Int.toByte(-127));
    });

    /**
     * @tc.name testArrayBufferSet0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_1200
     * @tc.desc Verify set with val special value -1 (abnormal marker)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.set(0, Int.toByte(-1));
      expect(buffer.at(0)).assertEqual(Int.toByte(-1));
    });

    /**
     * @tc.name testArrayBufferSet0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_1300
     * @tc.desc Verify set after resize to larger size
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(2, 8);
      buffer.set(0, Int.toByte(10));
      buffer.set(1, Int.toByte(20));
      buffer.resize(6);
      buffer.set(2, Int.toByte(30));
      buffer.set(3, Int.toByte(40));
      expect(buffer.at(0)).assertEqual(Int.toByte(10));
      expect(buffer.at(1)).assertEqual(Int.toByte(20));
      expect(buffer.at(2)).assertEqual(Int.toByte(30));
      expect(buffer.at(3)).assertEqual(Int.toByte(40));
    });

    /**
     * @tc.name testArrayBufferSet0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_1400
     * @tc.desc Verify set after resize to smaller size throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(6, 8);
      buffer.set(0, Int.toByte(10));
      buffer.set(1, Int.toByte(20));
      buffer.set(2, Int.toByte(30));
      buffer.set(3, Int.toByte(40));
      buffer.set(4, Int.toByte(50));
      buffer.set(5, Int.toByte(60));
      buffer.resize(3);
      try {
        buffer.set(4, Int.toByte(70));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.name testArrayBufferSet0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_1500
     * @tc.desc Verify set after resize from zero to non-zero
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(0, 8);
      buffer.resize(4);
      buffer.set(0, Int.toByte(10));
      buffer.set(1, Int.toByte(20));
      buffer.set(2, Int.toByte(30));
      buffer.set(3, Int.toByte(40));
      expect(buffer.at(0)).assertEqual(Int.toByte(10));
      expect(buffer.at(1)).assertEqual(Int.toByte(20));
      expect(buffer.at(2)).assertEqual(Int.toByte(30));
      expect(buffer.at(3)).assertEqual(Int.toByte(40));
    });

    /**
     * @tc.name testArrayBufferSet0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_1600
     * @tc.desc Verify set after resize to zero throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4, 8);
      buffer.set(0, Int.toByte(10));
      buffer.set(1, Int.toByte(20));
      buffer.resize(0);
      try {
        buffer.set(0, Int.toByte(30));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.name testArrayBufferSet0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_1700
     * @tc.desc Verify multiple set operations on same position
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.set(0, Int.toByte(10));
      expect(buffer.at(0)).assertEqual(Int.toByte(10));
      buffer.set(0, Int.toByte(20));
      expect(buffer.at(0)).assertEqual(Int.toByte(20));
      buffer.set(0, Int.toByte(30));
      expect(buffer.at(0)).assertEqual(Int.toByte(30));
    });

    /**
     * @tc.name testArrayBufferSet0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_1800
     * @tc.desc Verify set all positions in buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(8);
      buffer.set(0, Int.toByte(10));
      buffer.set(1, Int.toByte(20));
      buffer.set(2, Int.toByte(30));
      buffer.set(3, Int.toByte(40));
      buffer.set(4, Int.toByte(50));
      buffer.set(5, Int.toByte(60));
      buffer.set(6, Int.toByte(70));
      buffer.set(7, Int.toByte(80));
      expect(buffer.at(0)).assertEqual(Int.toByte(10));
      expect(buffer.at(1)).assertEqual(Int.toByte(20));
      expect(buffer.at(2)).assertEqual(Int.toByte(30));
      expect(buffer.at(3)).assertEqual(Int.toByte(40));
      expect(buffer.at(4)).assertEqual(Int.toByte(50));
      expect(buffer.at(5)).assertEqual(Int.toByte(60));
      expect(buffer.at(6)).assertEqual(Int.toByte(70));
      expect(buffer.at(7)).assertEqual(Int.toByte(80));
    });

    /**
     * @tc.name testArrayBufferSet0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_1900
     * @tc.desc Verify set with int boundary negative pos -2147483648 throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      try {
        buffer.set(-2147483648, Int.toByte(10));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.name testArrayBufferSet0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_2000
     * @tc.desc Verify set with function return value as pos
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(10);
      buffer.set(returnIndexSet(), Int.toByte(50));
      expect(buffer.at(3)).assertEqual(Int.toByte(50));
    });

    /**
     * @tc.name testArrayBufferSet0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_2100
     * @tc.desc Verify set with ternary expression as pos
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(10);
      const flag: boolean = true;
      buffer.set(flag ? 1 : 0, Int.toByte(50));
      expect(buffer.at(1)).assertEqual(Int.toByte(50));
    });

    /**
     * @tc.name testArrayBufferSet0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_2200
     * @tc.desc Verify set with bitwise AND expression as pos
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(10);
      buffer.set(5 & 3, Int.toByte(50));
      expect(buffer.at(1)).assertEqual(Int.toByte(50));
    });

    /**
     * @tc.name testArrayBufferSet0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_2300
     * @tc.desc Verify set with left shift expression as pos
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(10);
      buffer.set(1 << 2, Int.toByte(50));
      expect(buffer.at(4)).assertEqual(Int.toByte(50));
    });

    /**
     * @tc.name testArrayBufferSet0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_2400
     * @tc.desc Verify set with float truncation as pos
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(10);
      buffer.set(Double.toInt(1.9), Int.toByte(50));
      expect(buffer.at(1)).assertEqual(Int.toByte(50));
    });

    /**
     * @tc.name testArrayBufferSet0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_2500
     * @tc.desc Verify set with negative float as pos throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(10);
      try {
        buffer.set(Double.toInt(-1.0), Int.toByte(50));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.name testArrayBufferSet0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_2600
     * @tc.desc Verify set with function return value as val
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(10);
      buffer.set(0, getByteValSet());
      expect(buffer.at(0)).assertEqual(Int.toByte(77));
    });

    /**
     * @tc.name testArrayBufferSet0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_2700
     * @tc.desc Verify set with ternary expression as val
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(10);
      const flag: boolean = false;
      buffer.set(0, Int.toByte(flag ? 10 : 20));
      expect(buffer.at(0)).assertEqual(Int.toByte(20));
    });

    /**
     * @tc.name testArrayBufferSet0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_2800
     * @tc.desc Verify set with arithmetic expression as val
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(10);
      buffer.set(0, Int.toByte(10 + 20));
      expect(buffer.at(0)).assertEqual(Int.toByte(30));
    });

    /**
     * @tc.name testArrayBufferSet0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_2900
     * @tc.desc Verify set using at result as val
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(10);
      buffer.set(0, Int.toByte(55));
      buffer.set(1, Int.toByte(77));
      buffer.set(0, buffer.at(1));
      expect(buffer.at(0)).assertEqual(Int.toByte(77));
    });

    /**
     * @tc.name testArrayBufferSet0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_3000
     * @tc.desc Verify set with byte 128 truncation to -128
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(10);
      buffer.set(0, Int.toByte(128));
      expect(buffer.at(0)).assertEqual(Int.toByte(-128));
    });

    /**
     * @tc.name testArrayBufferSet0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_3100
     * @tc.desc Verify set with byte 255 truncation to -1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(10);
      buffer.set(0, Int.toByte(255));
      expect(buffer.at(0)).assertEqual(Int.toByte(-1));
    });

    /**
     * @tc.name testArrayBufferSet0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_3200
     * @tc.desc Verify set with byte 256 overflow to 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(10);
      buffer.set(0, Int.toByte(256));
      expect(buffer.at(0)).assertEqual(Int.toByte(0));
    });

    /**
     * @tc.name testArrayBufferSet0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_3300
     * @tc.desc Verify set with byte -129 underflow to 127
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(10);
      buffer.set(0, Int.toByte(-129));
      expect(buffer.at(0)).assertEqual(Int.toByte(127));
    });

    /**
     * @tc.name testArrayBufferSet0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_3400
     * @tc.desc Verify set with at result as set index
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(10);
      buffer.set(0, Int.toByte(3));
      buffer.set(3, Int.toByte(77));
      buffer.set(buffer.at(0), Int.toByte(99));
      expect(buffer.at(3)).assertEqual(Int.toByte(99));
    });

    /**
     * @tc.name testArrayBufferSet0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_3500
     * @tc.desc Verify set(0) writes byte and at() reads it back
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      buf.set(0, Int.toByte(0x41));
      expect(buf.at(0)).assertEqual(Int.toByte(0x41));
    });

    /**
     * @tc.name testArrayBufferSet0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_3600
     * @tc.desc Verify set -256 as byte wraps to 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      buf.set(0, Int.toByte(-256));
      expect(buf.at(0)).assertEqual(Int.toByte(0));
    });

    /**
     * @tc.name testArrayBufferSet0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_3700
     * @tc.desc Verify set 0x7F as byte equals 127
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      buf.set(0, Int.toByte(0x7F));
      expect(buf.at(0)).assertEqual(Int.toByte(127));
    });

    /**
     * @tc.name testArrayBufferSet0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_3800
     * @tc.desc Verify set 0xFF as byte equals -1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      buf.set(0, Int.toByte(0xFF));
      expect(buf.at(0)).assertEqual(Int.toByte(-1));
    });

    /**
     * @tc.name testArrayBufferSet0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_3900
     * @tc.desc Verify set 0b01111111 as byte equals 127
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      buf.set(0, Int.toByte(0b01111111));
      expect(buf.at(0)).assertEqual(Int.toByte(127));
    });

    /**
     * @tc.name testArrayBufferSet0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_4000
     * @tc.desc Verify set does not change byteLength property
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const before: int = buf.byteLength;
      buf.set(0, Int.toByte(0x55));
      expect(buf.byteLength).assertEqual(before);
    });

    /**
     * @tc.name testArrayBufferSet0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_4100
     * @tc.desc Verify set does not change getByteLength return value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const before: int = buf.getByteLength();
      buf.set(1, Int.toByte(0x56));
      expect(buf.getByteLength()).assertEqual(before);
    });

    /**
     * @tc.name testArrayBufferSet0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_4200
     * @tc.desc Verify set then at reads back correct -128 value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      buf.set(0, Int.toByte(-128));
      expect(buf.at(0)).assertEqual(Int.toByte(-128));
    });

    /**
     * @tc.name testArrayBufferSet0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_4300
     * @tc.desc Verify set does not change detached state
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const before: boolean = buf.detached;
      buf.set(0, Int.toByte(0x55));
      expect(buf.detached).assertEqual(before);
    });

    /**
     * @tc.name testArrayBufferSet0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_4400
     * @tc.desc Verify set does not change resizable state
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(2, 8);
      buf.set(0, Int.toByte(0x55));
      expect(buf.resizable).assertTrue();
    });

    /**
     * @tc.name testArrayBufferSet0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_4500
     * @tc.desc Verify set does not modify other positions in buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(3);
      buf.set(0, Int.toByte(0xAA));
      buf.set(1, Int.toByte(0xBB));
      buf.set(2, Int.toByte(0xCC));
      buf.set(1, Int.toByte(0xDD));
      expect(buf.at(0)).assertEqual(Int.toByte(0xAA));
      expect(buf.at(2)).assertEqual(Int.toByte(0xCC));
    });

    /**
     * @tc.name testArrayBufferSet0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_4600
     * @tc.desc Verify set in empty buffer (byteLength=0) throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(0);
      try {
        buf.set(0, Int.toByte(0x1A));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.name testArrayBufferSet0047
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_4700
     * @tc.desc Verify set pos=-1 throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      try {
        buf.set(-1, Int.toByte(0x1B));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.name testArrayBufferSet0048
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_4800
     * @tc.desc Verify set pos=byteLength throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      try {
        buf.set(4, Int.toByte(0x1D));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });

    /**
     * @tc.name testArrayBufferSet0049
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_SET_4900
     * @tc.desc Verify set pos=5 (>byteLength) throws IndexOutOfBoundsError
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferSet0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      try {
        buf.set(5, Int.toByte(0x1E));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('IndexOutOfBoundsError');
      }
    });
  });
}

function returnIndexSet(): int {
  return 3;
}

function getByteValSet(): byte {
  return Int.toByte(77);
}