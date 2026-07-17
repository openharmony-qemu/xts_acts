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

export default function arrayBufferAtomic2Test(): void {
  describe('ArrayBufferAtomic2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.name testArrayBufferAtomic0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0010
     * @tc.desc Verify I8 atomicAddI8 overflow returns old value 127
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI8(0, 0, Int.toByte(127));
      const old = buffer.atomicAddI8(0, 0, Int.toByte(1));
      expect(old).assertEqual(Int.toLong(127));
    });

    /**
     * @tc.name testArrayBufferAtomic0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0020
     * @tc.desc Verify I8 atomicSubI8 underflow returns old value -128
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI8(0, 0, Int.toByte(-128));
      const old = buffer.atomicSubI8(0, 0, Int.toByte(1));
      expect(old).assertEqual(Int.toLong(-128));
    });

    /**
     * @tc.name testArrayBufferAtomic0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0030
     * @tc.desc Verify I8 atomicAndI8 returns old value -128
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI8(0, 0, Int.toByte(-128));
      const old = buffer.atomicAndI8(0, 0, Int.toByte(0x7F));
      expect(old).assertEqual(Int.toLong(-128));
    });

    /**
     * @tc.name testArrayBufferAtomic0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0040
     * @tc.desc Verify I8 atomicOrI8 returns old value 127
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI8(0, 0, Int.toByte(127));
      const old = buffer.atomicOrI8(0, 0, Int.toByte(0x80));
      expect(old).assertEqual(Int.toLong(127));
    });

    /**
     * @tc.name testArrayBufferAtomic0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0050
     * @tc.desc Verify I8 atomicXorI8 returns old value -1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI8(0, 0, Int.toByte(-1));
      const old = buffer.atomicXorI8(0, 0, Int.toByte(0xFF));
      expect(old).assertEqual(Int.toLong(-1));
    });

    /**
     * @tc.name testArrayBufferAtomic0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0060
     * @tc.desc Verify I8 atomicExchangeI8 returns old signed value -128
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI8(0, 0, Int.toByte(-128));
      const old = buffer.atomicExchangeI8(0, 0, Int.toByte(127));
      expect(old).assertEqual(Int.toLong(-128));
    });

    /**
     * @tc.name testArrayBufferAtomic0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0070
     * @tc.desc Verify all I8 atomic methods on minimum 1-byte buffer (index=0, byteOffset=0)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(1);
      buffer.atomicStoreI8(0, 0, Int.toByte(42));
      expect(buffer.atomicLoadI8(0, 0)).assertEqual(Int.toLong(42));
      buffer.atomicAddI8(0, 0, Int.toByte(10));
      expect(buffer.atomicLoadI8(0, 0)).assertEqual(Int.toLong(52));
      buffer.atomicSubI8(0, 0, Int.toByte(10));
      expect(buffer.atomicLoadI8(0, 0)).assertEqual(Int.toLong(42));
      buffer.atomicAndI8(0, 0, Int.toByte(0x0F));
      expect(buffer.atomicLoadI8(0, 0)).assertEqual(Int.toLong(10));
      buffer.atomicOrI8(0, 0, Int.toByte(0xF0));
      expect(buffer.atomicLoadI8(0, 0)).assertEqual(Int.toLong(-6));
      buffer.atomicXorI8(0, 0, Int.toByte(0xFF));
      expect(buffer.atomicLoadI8(0, 0)).assertEqual(Int.toLong(5));
    });

    /**
     * @tc.name testArrayBufferAtomic0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0080
     * @tc.desc Verify atomicExchangeI8 and atomicCompareExchangeI8 on minimum 1-byte buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(1);
      buffer.atomicStoreI8(0, 0, Int.toByte(5));
      buffer.atomicExchangeI8(0, 0, Int.toByte(50));
      expect(buffer.atomicLoadI8(0, 0)).assertEqual(Int.toLong(50));
      const oldCas = buffer.atomicCompareExchangeI8(0, 0, Int.toByte(50), Int.toByte(100));
      expect(oldCas).assertEqual(Int.toLong(50));
      expect(buffer.atomicLoadI8(0, 0)).assertEqual(Int.toLong(100));
    });

    /**
     * @tc.name testArrayBufferAtomic0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0090
     * @tc.desc Verify all I8 atomic operations on the last valid byte (addr=3 in 4-byte buffer)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI8(3, 0, Int.toByte(-1));
      expect(buffer.atomicLoadI8(3, 0)).assertEqual(Int.toLong(-1));
      buffer.atomicAddI8(3, 0, Int.toByte(1));
      expect(buffer.atomicLoadI8(3, 0)).assertEqual(Int.toLong(0));
      buffer.atomicStoreI8(3, 0, Int.toByte(127));
      buffer.atomicSubI8(3, 0, Int.toByte(1));
      expect(buffer.atomicLoadI8(3, 0)).assertEqual(Int.toLong(126));
      buffer.atomicStoreI8(3, 0, Int.toByte(-1));
      buffer.atomicAndI8(3, 0, Int.toByte(0x7F));
      expect(buffer.atomicLoadI8(3, 0)).assertEqual(Int.toLong(127));
      buffer.atomicStoreI8(3, 0, Int.toByte(0));
      buffer.atomicOrI8(3, 0, Int.toByte(0x80));
      expect(buffer.atomicLoadI8(3, 0)).assertEqual(Int.toLong(-128));
      buffer.atomicStoreI8(3, 0, Int.toByte(0x7F));
      buffer.atomicXorI8(3, 0, Int.toByte(0x80));
      expect(buffer.atomicLoadI8(3, 0)).assertEqual(Int.toLong(-1));
      buffer.atomicStoreI8(3, 0, Int.toByte(10));
      buffer.atomicExchangeI8(3, 0, Int.toByte(20));
      expect(buffer.atomicLoadI8(3, 0)).assertEqual(Int.toLong(20));
      buffer.atomicStoreI8(3, 0, Int.toByte(30));
      let old = buffer.atomicCompareExchangeI8(3, 0, Int.toByte(30), Int.toByte(40));
      expect(old).assertEqual(Int.toLong(30));
      expect(buffer.atomicLoadI8(3, 0)).assertEqual(Int.toLong(40));
    });

    /**
     * @tc.name testArrayBufferAtomic0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0100
     * @tc.desc Verify atomic I8 operations on addr=2 do not affect neighboring bytes at addr 0, 1, 3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI8(0, 0, Int.toByte(0x12));
      buffer.atomicStoreI8(1, 0, Int.toByte(0x34));
      buffer.atomicStoreI8(2, 0, Int.toByte(0x56));
      buffer.atomicStoreI8(3, 0, Int.toByte(0x78));

      buffer.atomicAddI8(2, 0, Int.toByte(10));
      expect(buffer.atomicLoadI8(0, 0)).assertEqual(Int.toLong(0x12));
      expect(buffer.atomicLoadI8(1, 0)).assertEqual(Int.toLong(0x34));
      expect(buffer.atomicLoadI8(3, 0)).assertEqual(Int.toLong(0x78));

      buffer.atomicStoreI8(2, 0, Int.toByte(0x56));
      buffer.atomicAndI8(2, 0, Int.toByte(0xF0));
      expect(buffer.atomicLoadI8(0, 0)).assertEqual(Int.toLong(0x12));
      expect(buffer.atomicLoadI8(1, 0)).assertEqual(Int.toLong(0x34));
      expect(buffer.atomicLoadI8(3, 0)).assertEqual(Int.toLong(0x78));

      buffer.atomicStoreI8(2, 0, Int.toByte(0x56));
      buffer.atomicOrI8(2, 0, Int.toByte(0x0F));
      expect(buffer.atomicLoadI8(0, 0)).assertEqual(Int.toLong(0x12));
      expect(buffer.atomicLoadI8(1, 0)).assertEqual(Int.toLong(0x34));
      expect(buffer.atomicLoadI8(3, 0)).assertEqual(Int.toLong(0x78));
    });

    /**
     * @tc.name testArrayBufferAtomic0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0110
     * @tc.desc Verify I8 Add 120 + 20 = -116 (overflow with large step)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI8(0, 0, Int.toByte(120));
      buffer.atomicAddI8(0, 0, Int.toByte(20));
      expect(buffer.atomicLoadI8(0, 0)).assertEqual(Int.toLong(-116));
    });

    /**
     * @tc.name testArrayBufferAtomic0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0120
     * @tc.desc Verify I8 Add -100 + (-50) = 106 (negative wrap)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI8(0, 0, Int.toByte(-100));
      buffer.atomicAddI8(0, 0, Int.toByte(-50));
      expect(buffer.atomicLoadI8(0, 0)).assertEqual(Int.toLong(106));
    });

    /**
     * @tc.name testArrayBufferAtomic0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0130
     * @tc.desc Verify I8 consecutive Add overflow: 120+10+10 = -116
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI8(0, 0, Int.toByte(120));
      buffer.atomicAddI8(0, 0, Int.toByte(10));
      expect(buffer.atomicLoadI8(0, 0)).assertEqual(Int.toLong(-126));
      buffer.atomicAddI8(0, 0, Int.toByte(10));
      expect(buffer.atomicLoadI8(0, 0)).assertEqual(Int.toLong(-116));
    });

    /**
     * @tc.name testArrayBufferAtomic0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0140
     * @tc.desc Verify I8 Add overflow at non-zero address: (index=1,byteOffset=2) Store 127, Add 1, Load -128
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI8(1, 2, Int.toByte(127));
      buffer.atomicAddI8(1, 2, Int.toByte(1));
      expect(buffer.atomicLoadI8(1, 2)).assertEqual(Int.toLong(-128));
    });

    /**
     * @tc.name testArrayBufferAtomic0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0150
     * @tc.desc Verify I8 Sub -120 - 20 = 116 (underflow with large step)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI8(0, 0, Int.toByte(-120));
      buffer.atomicSubI8(0, 0, Int.toByte(20));
      expect(buffer.atomicLoadI8(0, 0)).assertEqual(Int.toLong(116));
    });

    /**
     * @tc.name testArrayBufferAtomic0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0160
     * @tc.desc Verify I8 Sub 100 - (-60) = -96 (sub negative = add, overflow)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI8(0, 0, Int.toByte(100));
      buffer.atomicSubI8(0, 0, Int.toByte(-60));
      expect(buffer.atomicLoadI8(0, 0)).assertEqual(Int.toLong(-96));
    });

    /**
     * @tc.name testArrayBufferAtomic0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0170
     * @tc.desc Verify I8 consecutive Sub underflow: -120-10-10 = 116
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI8(0, 0, Int.toByte(-120));
      buffer.atomicSubI8(0, 0, Int.toByte(10));
      buffer.atomicSubI8(0, 0, Int.toByte(10));
      expect(buffer.atomicLoadI8(0, 0)).assertEqual(Int.toLong(116));
    });

    /**
     * @tc.name testArrayBufferAtomic0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0180
     * @tc.desc Verify I8 Add then Sub at non-zero address: (1,2) Add 10 then Sub 10 -> original
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI8(1, 2, Int.toByte(100));
      buffer.atomicAddI8(1, 2, Int.toByte(10));
      expect(buffer.atomicLoadI8(1, 2)).assertEqual(Int.toLong(110));
      buffer.atomicSubI8(1, 2, Int.toByte(10));
      expect(buffer.atomicLoadI8(1, 2)).assertEqual(Int.toLong(100));
    });

    /**
     * @tc.name testArrayBufferAtomic0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0190
     * @tc.desc Verify I8 atomicCompareExchangeI8 success returns old value -1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI8(0, 0, Int.toByte(-1));
      const old = buffer.atomicCompareExchangeI8(0, 0, Int.toByte(-1), Int.toByte(0));
      expect(old).assertEqual(Int.toLong(-1));
      expect(buffer.atomicLoadI8(0, 0)).assertEqual(Int.toLong(0));
    });

    /**
     * @tc.name testArrayBufferAtomic0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0200
     * @tc.desc Verify I8 atomicCompareExchangeI8 failure returns actual value 127, does not write
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI8(0, 0, Int.toByte(127));
      const old = buffer.atomicCompareExchangeI8(0, 0, Int.toByte(-1), Int.toByte(0));
      expect(old).assertEqual(Int.toLong(127));
      expect(buffer.atomicLoadI8(0, 0)).assertEqual(Int.toLong(127));
    });

    /**
     * @tc.name testArrayBufferAtomic0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0210
     * @tc.desc Verify CAS expectedValue=-128 success: Store -128, CAS(-128,127), Load 127
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI8(0, 0, Int.toByte(-128));
      const old = buffer.atomicCompareExchangeI8(0, 0, Int.toByte(-128), Int.toByte(127));
      expect(old).assertEqual(Int.toLong(-128));
      expect(buffer.atomicLoadI8(0, 0)).assertEqual(Int.toLong(127));
    });

    /**
     * @tc.name testArrayBufferAtomic0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0220
     * @tc.desc Verify CAS replacementValue=-128: Store 0, CAS(0,-128), Load -128
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI8(0, 0, Int.toByte(0));
      const old = buffer.atomicCompareExchangeI8(0, 0, Int.toByte(0), Int.toByte(-128));
      expect(old).assertEqual(Int.toLong(0));
      expect(buffer.atomicLoadI8(0, 0)).assertEqual(Int.toLong(-128));
    });

    /**
     * @tc.name testArrayBufferAtomic0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0230
     * @tc.desc Verify CAS replacementValue=127: Store 0, CAS(0,127), Load 127
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI8(0, 0, Int.toByte(0));
      const old = buffer.atomicCompareExchangeI8(0, 0, Int.toByte(0), Int.toByte(127));
      expect(old).assertEqual(Int.toLong(0));
      expect(buffer.atomicLoadI8(0, 0)).assertEqual(Int.toLong(127));
    });

    /**
     * @tc.name testArrayBufferAtomic0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0240
     * @tc.desc Verify CAS fail then retry success: Store 10, CAS(9,20) fail, CAS(10,20) success
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI8(0, 0, Int.toByte(10));
      let old = buffer.atomicCompareExchangeI8(0, 0, Int.toByte(9), Int.toByte(20));
      expect(old).assertEqual(Int.toLong(10));
      old = buffer.atomicCompareExchangeI8(0, 0, Int.toByte(10), Int.toByte(20));
      expect(old).assertEqual(Int.toLong(10));
      expect(buffer.atomicLoadI8(0, 0)).assertEqual(Int.toLong(20));
    });

    /**
     * @tc.name testArrayBufferAtomic0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0250
     * @tc.desc Verify CAS chain: -128 -> -1 -> 0 -> 127
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI8(0, 0, Int.toByte(-128));
      let old = buffer.atomicCompareExchangeI8(0, 0, Int.toByte(-128), Int.toByte(-1));
      expect(old).assertEqual(Int.toLong(-128));
      old = buffer.atomicCompareExchangeI8(0, 0, Int.toByte(-1), Int.toByte(0));
      expect(old).assertEqual(Int.toLong(-1));
      old = buffer.atomicCompareExchangeI8(0, 0, Int.toByte(0), Int.toByte(127));
      expect(old).assertEqual(Int.toLong(0));
      expect(buffer.atomicLoadI8(0, 0)).assertEqual(Int.toLong(127));
    });

    /**
     * @tc.name testArrayBufferAtomic0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0260
     * @tc.desc Verify And clears sign bit: Store -1, And 0x7F, Load 127
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI8(0, 0, Int.toByte(-1));
      buffer.atomicAndI8(0, 0, Int.toByte(0x7F));
      expect(buffer.atomicLoadI8(0, 0)).assertEqual(Int.toLong(127));
    });

    /**
     * @tc.name testArrayBufferAtomic0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0270
     * @tc.desc Verify And preserves sign bit: Store -1, And 0x80, Load -128
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI8(0, 0, Int.toByte(-1));
      buffer.atomicAndI8(0, 0, Int.toByte(0x80));
      expect(buffer.atomicLoadI8(0, 0)).assertEqual(Int.toLong(-128));
    });

    /**
     * @tc.name testArrayBufferAtomic0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0280
     * @tc.desc Verify Or sets sign bit: Store 0x7F, Or 0x80, Load -1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI8(0, 0, Int.toByte(127));
      buffer.atomicOrI8(0, 0, Int.toByte(0x80));
      expect(buffer.atomicLoadI8(0, 0)).assertEqual(Int.toLong(-1));
    });

    /**
     * @tc.name testArrayBufferAtomic0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0290
     * @tc.desc Verify Or sets all bits: Store 0, Or 0xFF, Load -1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI8(0, 0, Int.toByte(0));
      buffer.atomicOrI8(0, 0, Int.toByte(0xFF));
      expect(buffer.atomicLoadI8(0, 0)).assertEqual(Int.toLong(-1));
    });

    /**
     * @tc.name testArrayBufferAtomic0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0300
     * @tc.desc Verify Xor flips sign bit: Store 0x7F, Xor 0x80, Load -1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI8(0, 0, Int.toByte(127));
      buffer.atomicXorI8(0, 0, Int.toByte(0x80));
      expect(buffer.atomicLoadI8(0, 0)).assertEqual(Int.toLong(-1));
    });

    /**
     * @tc.name testArrayBufferAtomic0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0310
     * @tc.desc Verify Xor self = 0: Store -1, Xor -1, Load 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI8(0, 0, Int.toByte(-1));
      buffer.atomicXorI8(0, 0, Int.toByte(-1));
      expect(buffer.atomicLoadI8(0, 0)).assertEqual(Int.toLong(0));
    });

    /**
     * @tc.name testArrayBufferAtomic0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0320
     * @tc.desc Verify And then Or: Store 0xFF, And 0x0F, Or 0x10, Load 0x1F (=31)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI8(0, 0, Int.toByte(0xFF));
      buffer.atomicAndI8(0, 0, Int.toByte(0x0F));
      buffer.atomicOrI8(0, 0, Int.toByte(0x10));
      expect(buffer.atomicLoadI8(0, 0)).assertEqual(Int.toLong(0x1F));
    });

    /**
     * @tc.name testArrayBufferAtomic0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0330
     * @tc.desc Verify Or then And: Store 0, Or 0xF0, And 0x0F, Load 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI8(0, 0, Int.toByte(0));
      buffer.atomicOrI8(0, 0, Int.toByte(0xF0));
      buffer.atomicAndI8(0, 0, Int.toByte(0x0F));
      expect(buffer.atomicLoadI8(0, 0)).assertEqual(Int.toLong(0));
    });

    /**
     * @tc.name testArrayBufferAtomic0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0340
     * @tc.desc Verify Xor then And: Store 0x55, Xor 0xFF, And 0x0F, Load 0x0A (=10)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI8(0, 0, Int.toByte(0x55));
      buffer.atomicXorI8(0, 0, Int.toByte(0xFF));
      buffer.atomicAndI8(0, 0, Int.toByte(0x0F));
      expect(buffer.atomicLoadI8(0, 0)).assertEqual(Int.toLong(0x0A));
    });

    /**
     * @tc.name testArrayBufferAtomic0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0350
     * @tc.desc Verify Int.toByte(128) -> -128: Store and Load
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI8(0, 0, Int.toByte(128));
      expect(buffer.atomicLoadI8(0, 0)).assertEqual(Int.toLong(-128));
    });

    /**
     * @tc.name testArrayBufferAtomic0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0360
     * @tc.desc Verify Int.toByte(255) -> -1: Store and Load
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI8(0, 0, Int.toByte(255));
      expect(buffer.atomicLoadI8(0, 0)).assertEqual(Int.toLong(-1));
    });

    /**
     * @tc.name testArrayBufferAtomic0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0370
     * @tc.desc Verify Int.toByte(-129) -> 127: Store and Load
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI8(0, 0, Int.toByte(-129));
      expect(buffer.atomicLoadI8(0, 0)).assertEqual(Int.toLong(127));
    });

    /**
     * @tc.name testArrayBufferAtomic0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0380
     * @tc.desc Verify Add with Int.toByte(255) = -1: Store 1, Add 255, Load 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI8(0, 0, Int.toByte(1));
      buffer.atomicAddI8(0, 0, Int.toByte(255));
      expect(buffer.atomicLoadI8(0, 0)).assertEqual(Int.toLong(0));
    });

    /**
     * @tc.name testArrayBufferAtomic0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0390
     * @tc.desc Verify Sub with Int.toByte(255) = -1: Store 1, Sub 255, Load 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI8(0, 0, Int.toByte(1));
      buffer.atomicSubI8(0, 0, Int.toByte(255));
      expect(buffer.atomicLoadI8(0, 0)).assertEqual(Int.toLong(2));
    });

    /**
     * @tc.name testArrayBufferAtomic0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0400
     * @tc.desc Verify U8 store 255 then I8 load returns -1 (same 0xFF bit pattern)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU8(0, 0, Int.toByte(255));
      expect(buffer.atomicLoadI8(0, 0)).assertEqual(Int.toLong(-1));
    });

    /**
     * @tc.name testArrayBufferAtomic0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0410
     * @tc.desc Verify U8 store 255 then I8 Add 1: Load I8 = 0 (since -1 + 1 = 0)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU8(0, 0, Int.toByte(255));
      buffer.atomicAddI8(0, 0, Int.toByte(1));
      expect(buffer.atomicLoadI8(0, 0)).assertEqual(Int.toLong(0));
    });

    /**
     * @tc.name testArrayBufferAtomic0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0420
     * @tc.desc Verify I8 store -1 then U8 load returns 255 (cross-type read)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI8(0, 0, Int.toByte(-1));
      expect(buffer.atomicLoadU8(0, 0)).assertEqual(Int.toLong(255));
    });

    /**
     * @tc.name testArrayBufferAtomic0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0430
     * @tc.desc Verify I8 store -1 then U8 Add 1: Load U8 = 0 (since 255+1 wraps to 0)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI8(0, 0, Int.toByte(-1));
      buffer.atomicAddU8(0, 0, Int.toByte(1));
      expect(buffer.atomicLoadU8(0, 0)).assertEqual(Int.toLong(0));
    });

    /**
     * @tc.name testArrayBufferAtomic0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0440
     * @tc.desc Verify U8 store 255 then I8 CAS(-1,1) succeeds (same bit pattern 0xFF)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU8(0, 0, Int.toByte(255));
      const old = buffer.atomicCompareExchangeI8(0, 0, Int.toByte(-1), Int.toByte(1));
      expect(old).assertEqual(Int.toLong(-1));
      expect(buffer.atomicLoadI8(0, 0)).assertEqual(Int.toLong(1));
    });

    /**
     * @tc.name testArrayBufferAtomic0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0450
     * @tc.desc Verify I8 Exchange -128 then U8 Load 128
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI8(0, 0, Int.toByte(0));
      buffer.atomicExchangeI8(0, 0, Int.toByte(-128));
      expect(buffer.atomicLoadU8(0, 0)).assertEqual(Int.toLong(128));
    });

    /**
     * @tc.name testArrayBufferAtomic0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0460
     * @tc.desc Verify set() then atomicLoadI8(): buffer[0] = -1, atomicLoadI8 returns -1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.set(0, Int.toByte(-1));
      expect(buffer.atomicLoadI8(0, 0)).assertEqual(Int.toLong(-1));
    });

    /**
     * @tc.name testArrayBufferAtomic0047
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0470
     * @tc.desc Verify atomicStoreI8() then at() reads same value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI8(0, 0, Int.toByte(20));
      expect(buffer.at(0)).assertEqual(Int.toByte(20));
    });

    /**
     * @tc.name testArrayBufferAtomic0048
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0480
     * @tc.desc Verify set() then atomicAddI8(): set 10, Add 5, at/Load = 15
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.set(0, Int.toByte(10));
      buffer.atomicAddI8(0, 0, Int.toByte(5));
      expect(buffer.atomicLoadI8(0, 0)).assertEqual(Int.toLong(15));
      expect(buffer.at(0)).assertEqual(Int.toByte(15));
    });

    /**
     * @tc.name testArrayBufferAtomic0049
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0490
     * @tc.desc Verify atomicExchangeI8() then at() reads the new value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI8(0, 0, Int.toByte(5));
      buffer.atomicExchangeI8(0, 0, Int.toByte(-1));
      expect(buffer.at(0)).assertEqual(Int.toByte(-1));
    });

    /**
     * @tc.name testArrayBufferAtomic0050
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0500
     * @tc.desc Verify I8 and I32 non-overlapping: I8 at 0, I32 at 1, independent (non-aligned access)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(8);
      buffer.atomicStoreI8(0, 0, Int.toByte(0xAB));
      buffer.atomicStoreI32(1, 0, 0x12345678);
      expect(buffer.atomicLoadI8(0, 0)).assertEqual(Int.toLong(Int.toByte(0xAB)));
      expect(buffer.atomicLoadI32(1, 0)).assertEqual(Int.toLong(0x12345678));
    });

    /**
     * @tc.name testArrayBufferAtomic0051
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0510
     * @tc.desc Verify I8 and U8 same address alternation: StoreI8 -1, AddU8 1, LoadI8 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI8(0, 0, Int.toByte(-1));
      buffer.atomicAddU8(0, 0, Int.toByte(1));
      expect(buffer.atomicLoadI8(0, 0)).assertEqual(Int.toLong(0));
    });

    /**
     * @tc.name testArrayBufferAtomic0052
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0520
     * @tc.desc Verify resize(4) then atomicLoadI8 on new byte returns 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(2, 4);
      buffer.resize(4);
      expect(buffer.atomicLoadI8(3, 0)).assertEqual(Int.toLong(0));
    });

    /**
     * @tc.name testArrayBufferAtomic0053
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0530
     * @tc.desc Verify resize(4) then StoreI8 and LoadI8 on new area
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(2, 4);
      buffer.resize(4);
      buffer.atomicStoreI8(3, 0, Int.toByte(42));
      expect(buffer.atomicLoadI8(3, 0)).assertEqual(Int.toLong(42));
    });

    /**
     * @tc.name testArrayBufferAtomic0054
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0540
     * @tc.desc Verify resize(4) then Store 127 at addr 3, Add 1, Load -128 (overflow at new area)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(2, 4);
      buffer.resize(4);
      buffer.atomicStoreI8(3, 0, Int.toByte(127));
      buffer.atomicAddI8(3, 0, Int.toByte(1));
      expect(buffer.atomicLoadI8(3, 0)).assertEqual(Int.toLong(-128));
    });

    /**
     * @tc.name testArrayBufferAtomic0055
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0550
     * @tc.desc Verify I8 Add overflow stability: loop 127+1->-128 5 times in same buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      for (let i = 0; i < 5; i++) {
        buffer.atomicStoreI8(0, 0, Int.toByte(127));
        buffer.atomicAddI8(0, 0, Int.toByte(1));
        expect(buffer.atomicLoadI8(0, 0)).assertEqual(Int.toLong(-128));
      }
    });

    /**
     * @tc.name testArrayBufferAtomic0056
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0560
     * @tc.desc Verify I8 stability with new buffer each time
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 5; i++) {
        const buffer: ArrayBuffer = new ArrayBuffer(4);
        buffer.atomicStoreI8(0, 0, Int.toByte(100));
        buffer.atomicAddI8(0, 0, Int.toByte(27));
        buffer.atomicSubI8(0, 0, Int.toByte(10));
        expect(buffer.atomicLoadI8(0, 0)).assertEqual(Int.toLong(117));
      }
    });

    /**
     * @tc.name testArrayBufferAtomic0057
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0570
     * @tc.desc Verify atomicAddU8 returns old 255 when adding 1 to 255
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU8(0, 0, Int.toByte(255));
      const old = buffer.atomicAddU8(0, 0, Int.toByte(1));
      expect(old).assertEqual(Int.toLong(255));
    });

    /**
     * @tc.name testArrayBufferAtomic0058
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0580
     * @tc.desc Verify atomicSubU8 returns old 0 when Sub 1 wraps to 255
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU8(0, 0, Int.toByte(0));
      const old = buffer.atomicSubU8(0, 0, Int.toByte(1));
      expect(old).assertEqual(Int.toLong(0));
    });

    /**
     * @tc.name testArrayBufferAtomic0059
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0590
     * @tc.desc Verify atomicAndU8 returns old 255
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU8(0, 0, Int.toByte(255));
      const old = buffer.atomicAndU8(0, 0, Int.toByte(0x0F));
      expect(old).assertEqual(Int.toLong(255));
    });

    /**
     * @tc.name testArrayBufferAtomic0060
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0600
     * @tc.desc Verify atomicOrU8 returns old 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU8(0, 0, Int.toByte(0));
      const old = buffer.atomicOrU8(0, 0, Int.toByte(0xFF));
      expect(old).assertEqual(Int.toLong(0));
    });

    /**
     * @tc.name testArrayBufferAtomic0061
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0610
     * @tc.desc Verify atomicXorU8 returns old 128
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU8(0, 0, Int.toByte(128));
      const old = buffer.atomicXorU8(0, 0, Int.toByte(0xFF));
      expect(old).assertEqual(Int.toLong(128));
    });

    /**
     * @tc.name testArrayBufferAtomic0062
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0620
     * @tc.desc Verify atomicExchangeU8 returns old value 200
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU8(0, 0, Int.toByte(200));
      const old = buffer.atomicExchangeU8(0, 0, Int.toByte(100));
      expect(old).assertEqual(Int.toLong(200));
    });

    /**
     * @tc.name testArrayBufferAtomic0063
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0630
     * @tc.desc Verify all U8 operations on 1-byte buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(1);
      buffer.atomicStoreU8(0, 0, Int.toByte(100));
      expect(buffer.atomicLoadU8(0, 0)).assertEqual(Int.toLong(100));
      let old = buffer.atomicAddU8(0, 0, Int.toByte(20));
      expect(old).assertEqual(Int.toLong(100));
      expect(buffer.atomicLoadU8(0, 0)).assertEqual(Int.toLong(120));
      old = buffer.atomicSubU8(0, 0, Int.toByte(20));
      expect(old).assertEqual(Int.toLong(120));
      expect(buffer.atomicLoadU8(0, 0)).assertEqual(Int.toLong(100));
      old = buffer.atomicAndU8(0, 0, Int.toByte(0x0F));
      expect(old).assertEqual(Int.toLong(100));
      expect(buffer.atomicLoadU8(0, 0)).assertEqual(Int.toLong(4));
      old = buffer.atomicOrU8(0, 0, Int.toByte(0xF0));
      expect(old).assertEqual(Int.toLong(4));
      expect(buffer.atomicLoadU8(0, 0)).assertEqual(Int.toLong(244));
      old = buffer.atomicXorU8(0, 0, Int.toByte(0xFF));
      expect(old).assertEqual(Int.toLong(244));
      expect(buffer.atomicLoadU8(0, 0)).assertEqual(Int.toLong(11));
    });

    /**
     * @tc.name testArrayBufferAtomic0064
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0640
     * @tc.desc Verify Exchange and CAS on 1-byte buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(1);
      buffer.atomicStoreU8(0, 0, Int.toByte(10));
      const oldEx = buffer.atomicExchangeU8(0, 0, Int.toByte(50));
      expect(oldEx).assertEqual(Int.toLong(10));
      expect(buffer.atomicLoadU8(0, 0)).assertEqual(Int.toLong(50));
      const oldCas = buffer.atomicCompareExchangeU8(0, 0, Int.toByte(50), Int.toByte(100));
      expect(oldCas).assertEqual(Int.toLong(50));
      expect(buffer.atomicLoadU8(0, 0)).assertEqual(Int.toLong(100));
    });

    /**
     * @tc.name testArrayBufferAtomic0065
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0650
     * @tc.desc Verify all U8 operations on last valid byte (addr=3)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU8(3, 0, Int.toByte(255));
      expect(buffer.atomicLoadU8(3, 0)).assertEqual(Int.toLong(255));
      let old = buffer.atomicAddU8(3, 0, Int.toByte(1));
      expect(old).assertEqual(Int.toLong(255));
      expect(buffer.atomicLoadU8(3, 0)).assertEqual(Int.toLong(0));
      buffer.atomicStoreU8(3, 0, Int.toByte(100));
      old = buffer.atomicSubU8(3, 0, Int.toByte(1));
      expect(old).assertEqual(Int.toLong(100));
      expect(buffer.atomicLoadU8(3, 0)).assertEqual(Int.toLong(99));
      buffer.atomicStoreU8(3, 0, Int.toByte(0xFF));
      old = buffer.atomicAndU8(3, 0, Int.toByte(0x7F));
      expect(old).assertEqual(Int.toLong(255));
      expect(buffer.atomicLoadU8(3, 0)).assertEqual(Int.toLong(127));
      buffer.atomicStoreU8(3, 0, Int.toByte(0));
      old = buffer.atomicOrU8(3, 0, Int.toByte(0x80));
      expect(old).assertEqual(Int.toLong(0));
      expect(buffer.atomicLoadU8(3, 0)).assertEqual(Int.toLong(128));
      buffer.atomicStoreU8(3, 0, Int.toByte(0x7F));
      old = buffer.atomicXorU8(3, 0, Int.toByte(0x80));
      expect(old).assertEqual(Int.toLong(127));
      expect(buffer.atomicLoadU8(3, 0)).assertEqual(Int.toLong(255));
      buffer.atomicStoreU8(3, 0, Int.toByte(10));
      old = buffer.atomicExchangeU8(3, 0, Int.toByte(20));
      expect(old).assertEqual(Int.toLong(10));
      expect(buffer.atomicLoadU8(3, 0)).assertEqual(Int.toLong(20));
      buffer.atomicStoreU8(3, 0, Int.toByte(30));
      old = buffer.atomicCompareExchangeU8(3, 0, Int.toByte(30), Int.toByte(40));
      expect(old).assertEqual(Int.toLong(30));
      expect(buffer.atomicLoadU8(3, 0)).assertEqual(Int.toLong(40));
    });

    /**
     * @tc.name testArrayBufferAtomic0066
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0660
     * @tc.desc Verify U8 atomic ops on addr=2 do not affect neighbors
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU8(0, 0, Int.toByte(0x12));
      buffer.atomicStoreU8(1, 0, Int.toByte(0x34));
      buffer.atomicStoreU8(2, 0, Int.toByte(0x56));
      buffer.atomicStoreU8(3, 0, Int.toByte(0x78));
      buffer.atomicAddU8(2, 0, Int.toByte(10));
      expect(buffer.atomicLoadU8(0, 0)).assertEqual(Int.toLong(0x12));
      expect(buffer.atomicLoadU8(1, 0)).assertEqual(Int.toLong(0x34));
      expect(buffer.atomicLoadU8(3, 0)).assertEqual(Int.toLong(0x78));
    });

    /**
     * @tc.name testArrayBufferAtomic0067
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0670
     * @tc.desc Verify U8 Add 240 + 20 = 4 (wrap)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU8(0, 0, Int.toByte(240));
      buffer.atomicAddU8(0, 0, Int.toByte(20));
      expect(buffer.atomicLoadU8(0, 0)).assertEqual(Int.toLong(4));
    });

    /**
     * @tc.name testArrayBufferAtomic0068
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0680
     * @tc.desc Verify U8 Add 200 + 100 = 44 (large step wrap)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU8(0, 0, Int.toByte(200));
      buffer.atomicAddU8(0, 0, Int.toByte(100));
      expect(buffer.atomicLoadU8(0, 0)).assertEqual(Int.toLong(44));
    });

    /**
     * @tc.name testArrayBufferAtomic0069
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0690
     * @tc.desc Verify U8 consecutive Add wrap: 200+30+30 = 4
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU8(0, 0, Int.toByte(200));
      buffer.atomicAddU8(0, 0, Int.toByte(30));
      expect(buffer.atomicLoadU8(0, 0)).assertEqual(Int.toLong(230));
      buffer.atomicAddU8(0, 0, Int.toByte(30));
      expect(buffer.atomicLoadU8(0, 0)).assertEqual(Int.toLong(4));
    });

    /**
     * @tc.name testArrayBufferAtomic0070
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0700
     * @tc.desc Verify U8 Add at non-zero address: (1,2) Store 254, Add 3, Load 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU8(1, 2, Int.toByte(254));
      buffer.atomicAddU8(1, 2, Int.toByte(3));
      expect(buffer.atomicLoadU8(1, 2)).assertEqual(Int.toLong(1));
    });

    /**
     * @tc.name testArrayBufferAtomic0071
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0710
     * @tc.desc Verify U8 Sub 10 - 20 = 246 (wrap to large)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU8(0, 0, Int.toByte(10));
      buffer.atomicSubU8(0, 0, Int.toByte(20));
      expect(buffer.atomicLoadU8(0, 0)).assertEqual(Int.toLong(246));
    });

    /**
     * @tc.name testArrayBufferAtomic0072
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0720
     * @tc.desc Verify U8 consecutive Sub wrap: 10-5-10 = 251
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU8(0, 0, Int.toByte(10));
      buffer.atomicSubU8(0, 0, Int.toByte(5));
      expect(buffer.atomicLoadU8(0, 0)).assertEqual(Int.toLong(5));
      buffer.atomicSubU8(0, 0, Int.toByte(10));
      expect(buffer.atomicLoadU8(0, 0)).assertEqual(Int.toLong(251));
    });

    /**
     * @tc.name testArrayBufferAtomic0073
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0730
     * @tc.desc Verify U8 CAS success: Store 100, CAS(100,200), Load 200
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU8(0, 0, Int.toByte(100));
      const old = buffer.atomicCompareExchangeU8(0, 0, Int.toByte(100), Int.toByte(200));
      expect(old).assertEqual(Int.toLong(100));
      expect(buffer.atomicLoadU8(0, 0)).assertEqual(Int.toLong(200));
    });

    /**
     * @tc.name testArrayBufferAtomic0074
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0740
     * @tc.desc Verify U8 CAS failure: Store 100, CAS(99,200), Load 100
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU8(0, 0, Int.toByte(100));
      const old = buffer.atomicCompareExchangeU8(0, 0, Int.toByte(99), Int.toByte(200));
      expect(old).assertEqual(Int.toLong(100));
      expect(buffer.atomicLoadU8(0, 0)).assertEqual(Int.toLong(100));
    });

    /**
     * @tc.name testArrayBufferAtomic0075
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0750
     * @tc.desc Verify U8 CAS with expected=0: Store 0, CAS(0,255), Load 255
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU8(0, 0, Int.toByte(0));
      const old = buffer.atomicCompareExchangeU8(0, 0, Int.toByte(0), Int.toByte(255));
      expect(old).assertEqual(Int.toLong(0));
      expect(buffer.atomicLoadU8(0, 0)).assertEqual(Int.toLong(255));
    });

    /**
     * @tc.name testArrayBufferAtomic0076
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0760
     * @tc.desc Verify U8 CAS with expected=255: Store 255, CAS(255,0), Load 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU8(0, 0, Int.toByte(255));
      const old = buffer.atomicCompareExchangeU8(0, 0, Int.toByte(255), Int.toByte(0));
      expect(old).assertEqual(Int.toLong(255));
      expect(buffer.atomicLoadU8(0, 0)).assertEqual(Int.toLong(0));
    });

    /**
     * @tc.name testArrayBufferAtomic0077
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0770
     * @tc.desc Verify U8 CAS fail then retry: CAS(9,20) fail, CAS(10,20) success
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU8(0, 0, Int.toByte(10));
      let old = buffer.atomicCompareExchangeU8(0, 0, Int.toByte(9), Int.toByte(20));
      expect(old).assertEqual(Int.toLong(10));
      old = buffer.atomicCompareExchangeU8(0, 0, Int.toByte(10), Int.toByte(20));
      expect(old).assertEqual(Int.toLong(10));
      expect(buffer.atomicLoadU8(0, 0)).assertEqual(Int.toLong(20));
    });

    /**
     * @tc.name testArrayBufferAtomic0078
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0780
     * @tc.desc Verify U8 CAS chain: 0 -> 128 -> 255
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU8(0, 0, Int.toByte(0));
      let old = buffer.atomicCompareExchangeU8(0, 0, Int.toByte(0), Int.toByte(128));
      expect(old).assertEqual(Int.toLong(0));
      old = buffer.atomicCompareExchangeU8(0, 0, Int.toByte(128), Int.toByte(255));
      expect(old).assertEqual(Int.toLong(128));
      expect(buffer.atomicLoadU8(0, 0)).assertEqual(Int.toLong(255));
    });

    /**
     * @tc.name testArrayBufferAtomic0079
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0790
     * @tc.desc Verify U8 And clears high bit: 255 & 0x7F = 127
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU8(0, 0, Int.toByte(255));
      buffer.atomicAndU8(0, 0, Int.toByte(0x7F));
      expect(buffer.atomicLoadU8(0, 0)).assertEqual(Int.toLong(127));
    });

    /**
     * @tc.name testArrayBufferAtomic0080
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0800
     * @tc.desc Verify U8 And preserves low bits: 255 & 0x0F = 15
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU8(0, 0, Int.toByte(255));
      buffer.atomicAndU8(0, 0, Int.toByte(0x0F));
      expect(buffer.atomicLoadU8(0, 0)).assertEqual(Int.toLong(15));
    });

    /**
     * @tc.name testArrayBufferAtomic0081
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0810
     * @tc.desc Verify U8 Or sets high bit: 0 | 0x80 = 128
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU8(0, 0, Int.toByte(0));
      buffer.atomicOrU8(0, 0, Int.toByte(0x80));
      expect(buffer.atomicLoadU8(0, 0)).assertEqual(Int.toLong(128));
    });

    /**
     * @tc.name testArrayBufferAtomic0082
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0820
     * @tc.desc Verify U8 Or all 1s: 0 | 0xFF = 255
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU8(0, 0, Int.toByte(0));
      buffer.atomicOrU8(0, 0, Int.toByte(0xFF));
      expect(buffer.atomicLoadU8(0, 0)).assertEqual(Int.toLong(255));
    });

    /**
     * @tc.name testArrayBufferAtomic0083
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0830
     * @tc.desc Verify U8 Xor flips high bit: 127 ^ 0x80 = 255
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU8(0, 0, Int.toByte(127));
      buffer.atomicXorU8(0, 0, Int.toByte(0x80));
      expect(buffer.atomicLoadU8(0, 0)).assertEqual(Int.toLong(255));
    });

    /**
     * @tc.name testArrayBufferAtomic0084
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0840
     * @tc.desc Verify U8 Xor self = 0: 128 ^ 128 = 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU8(0, 0, Int.toByte(128));
      buffer.atomicXorU8(0, 0, Int.toByte(128));
      expect(buffer.atomicLoadU8(0, 0)).assertEqual(Int.toLong(0));
    });

    /**
     * @tc.name testArrayBufferAtomic0085
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0850
     * @tc.desc Verify U8 bit combination: Store 0xFF, And 0x0F, Or 0x10 = 0x1F
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU8(0, 0, Int.toByte(0xFF));
      buffer.atomicAndU8(0, 0, Int.toByte(0x0F));
      buffer.atomicOrU8(0, 0, Int.toByte(0x10));
      expect(buffer.atomicLoadU8(0, 0)).assertEqual(Int.toLong(0x1F));
    });

    /**
     * @tc.name testArrayBufferAtomic0086
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0860
     * @tc.desc Verify Int.toByte(256) -> 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU8(0, 0, Int.toByte(256));
      expect(buffer.atomicLoadU8(0, 0)).assertEqual(Int.toLong(0));
    });

    /**
     * @tc.name testArrayBufferAtomic0087
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0870
     * @tc.desc Verify Int.toByte(-1) -> 255
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU8(0, 0, Int.toByte(-1));
      expect(buffer.atomicLoadU8(0, 0)).assertEqual(Int.toLong(255));
    });

    /**
     * @tc.name testArrayBufferAtomic0088
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0880
     * @tc.desc Verify Int.toByte(-128) -> 128
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU8(0, 0, Int.toByte(-128));
      expect(buffer.atomicLoadU8(0, 0)).assertEqual(Int.toLong(128));
    });

    /**
     * @tc.name testArrayBufferAtomic0089
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0890
     * @tc.desc Verify Add with truncated operand: Store 1, Add Int.toByte(-1)=255, Load 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU8(0, 0, Int.toByte(1));
      buffer.atomicAddU8(0, 0, Int.toByte(-1));
      expect(buffer.atomicLoadU8(0, 0)).assertEqual(Int.toLong(0));
    });

    /**
     * @tc.name testArrayBufferAtomic0090
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0900
     * @tc.desc Verify Sub with truncated operand: Store 1, Sub Int.toByte(-1)=255, Load 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU8(0, 0, Int.toByte(1));
      buffer.atomicSubU8(0, 0, Int.toByte(-1));
      expect(buffer.atomicLoadU8(0, 0)).assertEqual(Int.toLong(2));
    });

    /**
     * @tc.name testArrayBufferAtomic0091
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0910
     * @tc.desc Verify U8 store 128 then I8 load returns -128 (0x80 pattern)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU8(0, 0, Int.toByte(128));
      expect(buffer.atomicLoadI8(0, 0)).assertEqual(Int.toLong(-128));
    });

    /**
     * @tc.name testArrayBufferAtomic0092
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0920
     * @tc.desc Verify I8 store -128 then U8 load returns 128 (0x80 pattern, mirror of 163)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI8(0, 0, Int.toByte(-128));
      expect(buffer.atomicLoadU8(0, 0)).assertEqual(Int.toLong(128));
    });

    /**
     * @tc.name testArrayBufferAtomic0093
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0930
     * @tc.desc Verify U8 store 128, I8 Sub 1, I8 Load = 127 (0x80-1=0x7F as signed)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU8(0, 0, Int.toByte(128));
      buffer.atomicSubI8(0, 0, Int.toByte(1));
      expect(buffer.atomicLoadI8(0, 0)).assertEqual(Int.toLong(127));
    });

    /**
     * @tc.name testArrayBufferAtomic0094
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0940
     * @tc.desc Verify U8 + I16 non-overlapping coexistence (non-aligned access)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU8(0, 0, Int.toByte(200));
      buffer.atomicStoreI16(1, 0, Int.toShort(1000));
      expect(buffer.atomicLoadU8(0, 0)).assertEqual(Int.toLong(200));
      expect(buffer.atomicLoadI16(1, 0)).assertEqual(Int.toLong(1000));
    });

    /**
     * @tc.name testArrayBufferAtomic0095
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0950
     * @tc.desc Verify set(0, 200) then atomicLoadU8(0,0) = 200
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.set(0, Int.toByte(200));
      expect(buffer.atomicLoadU8(0, 0)).assertEqual(Int.toLong(200));
    });

    /**
     * @tc.name testArrayBufferAtomic0096
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0960
     * @tc.desc Verify atomicStoreU8 then at() reads same value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU8(0, 0, Int.toByte(128));
      expect(buffer.at(0)).assertEqual(Int.toByte(-128));
    });

    /**
     * @tc.name testArrayBufferAtomic0097
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0970
     * @tc.desc Verify set then atomicAddU8: set 200, Add 60, at = Load = 4 (wrap)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.set(0, Int.toByte(200));
      buffer.atomicAddU8(0, 0, Int.toByte(60));
      expect(buffer.atomicLoadU8(0, 0)).assertEqual(Int.toLong(4));
      expect(buffer.at(0)).assertEqual(Int.toByte(4));
    });

    /**
     * @tc.name testArrayBufferAtomic0098
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0980
     * @tc.desc Verify atomicExchangeU8 then at() reads new value
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU8(0, 0, Int.toByte(10));
      buffer.atomicExchangeU8(0, 0, Int.toByte(255));
      expect(buffer.at(0)).assertEqual(Int.toByte(-1));
    });

    /**
     * @tc.name testArrayBufferAtomic0099
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0990
     * @tc.desc Verify resize(4) then atomicLoadU8 on new byte returns 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(2, 4);
      buffer.resize(4);
      expect(buffer.atomicLoadU8(3, 0)).assertEqual(Int.toLong(0));
    });

    /**
     * @tc.name testArrayBufferAtomic0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1000
     * @tc.desc Verify resize(4) then StoreU8 and LoadU8 on new area
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(2, 4);
      buffer.resize(4);
      buffer.atomicStoreU8(3, 0, Int.toByte(200));
      expect(buffer.atomicLoadU8(3, 0)).assertEqual(Int.toLong(200));
    });

    /**
     * @tc.name testArrayBufferAtomic0101
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1010
     * @tc.desc Verify resize(4) then AddU8 wrap on new area: Store 255, Add 1, Load 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(2, 4);
      buffer.resize(4);
      buffer.atomicStoreU8(3, 0, Int.toByte(255));
      buffer.atomicAddU8(3, 0, Int.toByte(1));
      expect(buffer.atomicLoadU8(3, 0)).assertEqual(Int.toLong(0));
    });

    /**
     * @tc.name testArrayBufferAtomic0102
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1020
     * @tc.desc Verify U8 Add wrap stability: 5 times same buffer 255+1=0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      for (let i = 0; i < 5; i++) {
        buffer.atomicStoreU8(0, 0, Int.toByte(255));
        buffer.atomicAddU8(0, 0, Int.toByte(1));
        expect(buffer.atomicLoadU8(0, 0)).assertEqual(Int.toLong(0));
      }
    });

    /**
     * @tc.name testArrayBufferAtomic0103
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1030
     * @tc.desc Verify U8 stability with new buffer each time
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 5; i++) {
        const buffer: ArrayBuffer = new ArrayBuffer(4);
        buffer.atomicStoreU8(0, 0, Int.toByte(200));
        buffer.atomicAddU8(0, 0, Int.toByte(30));
        buffer.atomicSubU8(0, 0, Int.toByte(20));
        expect(buffer.atomicLoadU8(0, 0)).assertEqual(Int.toLong(210));
      }
    });

    /**
     * @tc.name testArrayBufferAtomic0104
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1040
     * @tc.desc Verify atomicAddI16 returns old 32767 when overflow
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI16(0, 0, Int.toShort(32767));
      const old = buffer.atomicAddI16(0, 0, Int.toShort(1));
      expect(old).assertEqual(Int.toLong(32767));
    });

    /**
     * @tc.name testArrayBufferAtomic0105
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1050
     * @tc.desc Verify atomicSubI16 returns old -32768 when underflow
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI16(0, 0, Int.toShort(-32768));
      const old = buffer.atomicSubI16(0, 0, Int.toShort(1));
      expect(old).assertEqual(Int.toLong(-32768));
    });

    /**
     * @tc.name testArrayBufferAtomic0106
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1060
     * @tc.desc Verify atomicAndI16 returns old -32768
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI16(0, 0, Int.toShort(-32768));
      const old = buffer.atomicAndI16(0, 0, Int.toShort(0x7FFF));
      expect(old).assertEqual(Int.toLong(-32768));
    });

    /**
     * @tc.name testArrayBufferAtomic0107
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1070
     * @tc.desc Verify atomicOrI16 returns old 32767
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI16(0, 0, Int.toShort(32767));
      const old = buffer.atomicOrI16(0, 0, Int.toShort(0x8000));
      expect(old).assertEqual(Int.toLong(32767));
    });

    /**
     * @tc.name testArrayBufferAtomic0108
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1080
     * @tc.desc Verify atomicXorI16 returns old -1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI16(0, 0, Int.toShort(-1));
      const old = buffer.atomicXorI16(0, 0, Int.toShort(0xFFFF));
      expect(old).assertEqual(Int.toLong(-1));
    });

    /**
     * @tc.name testArrayBufferAtomic0109
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1090
     * @tc.desc Verify atomicExchangeI16 returns old -32768
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI16(0, 0, Int.toShort(-32768));
      const old = buffer.atomicExchangeI16(0, 0, Int.toShort(32767));
      expect(old).assertEqual(Int.toLong(-32768));
    });

    /**
     * @tc.name testArrayBufferAtomic0110
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1100
     * @tc.desc Verify all I16 operations on 2-byte buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(2);
      buffer.atomicStoreI16(0, 0, Int.toShort(1000));
      expect(buffer.atomicLoadI16(0, 0)).assertEqual(Int.toLong(1000));
      let old = buffer.atomicAddI16(0, 0, Int.toShort(500));
      expect(old).assertEqual(Int.toLong(1000));
      expect(buffer.atomicLoadI16(0, 0)).assertEqual(Int.toLong(1500));
      old = buffer.atomicSubI16(0, 0, Int.toShort(500));
      expect(old).assertEqual(Int.toLong(1500));
      expect(buffer.atomicLoadI16(0, 0)).assertEqual(Int.toLong(1000));
      old = buffer.atomicAndI16(0, 0, Int.toShort(0x00FF));
      expect(old).assertEqual(Int.toLong(1000));
      expect(buffer.atomicLoadI16(0, 0)).assertEqual(Int.toLong(232));
      old = buffer.atomicOrI16(0, 0, Int.toShort(0xFF00));
      expect(old).assertEqual(Int.toLong(232));
      expect(buffer.atomicLoadI16(0, 0)).assertEqual(Int.toLong(-24));
      old = buffer.atomicXorI16(0, 0, Int.toShort(0xFFFF));
      expect(old).assertEqual(Int.toLong(-24));
      expect(buffer.atomicLoadI16(0, 0)).assertEqual(Int.toLong(23));
    });

    /**
     * @tc.name testArrayBufferAtomic0111
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1110
     * @tc.desc Verify Exchange and CAS on 2-byte buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(2);
      buffer.atomicStoreI16(0, 0, Int.toShort(100));
      const oldEx = buffer.atomicExchangeI16(0, 0, Int.toShort(200));
      expect(oldEx).assertEqual(Int.toLong(100));
      expect(buffer.atomicLoadI16(0, 0)).assertEqual(Int.toLong(200));
      const oldCas = buffer.atomicCompareExchangeI16(0, 0, Int.toShort(200), Int.toShort(300));
      expect(oldCas).assertEqual(Int.toLong(200));
      expect(buffer.atomicLoadI16(0, 0)).assertEqual(Int.toLong(300));
    });

    /**
     * @tc.name testArrayBufferAtomic0112
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1120
     * @tc.desc Verify all I16 operations on last valid addr=2 (index=0, byteOffset=2 in 4-byte buffer)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI16(0, 2, Int.toShort(-1));
      expect(buffer.atomicLoadI16(0, 2)).assertEqual(Int.toLong(-1));
      let old = buffer.atomicAddI16(0, 2, Int.toShort(1));
      expect(old).assertEqual(Int.toLong(-1));
      expect(buffer.atomicLoadI16(0, 2)).assertEqual(Int.toLong(0));
      buffer.atomicStoreI16(0, 2, Int.toShort(32767));
      old = buffer.atomicSubI16(0, 2, Int.toShort(1));
      expect(old).assertEqual(Int.toLong(32767));
      expect(buffer.atomicLoadI16(0, 2)).assertEqual(Int.toLong(32766));
      buffer.atomicStoreI16(0, 2, Int.toShort(-1));
      old = buffer.atomicAndI16(0, 2, Int.toShort(0x7FFF));
      expect(old).assertEqual(Int.toLong(-1));
      expect(buffer.atomicLoadI16(0, 2)).assertEqual(Int.toLong(32767));
      buffer.atomicStoreI16(0, 2, Int.toShort(0));
      old = buffer.atomicOrI16(0, 2, Int.toShort(0x8000));
      expect(old).assertEqual(Int.toLong(0));
      expect(buffer.atomicLoadI16(0, 2)).assertEqual(Int.toLong(-32768));
      buffer.atomicStoreI16(0, 2, Int.toShort(0x7FFF));
      old = buffer.atomicXorI16(0, 2, Int.toShort(0x8000));
      expect(old).assertEqual(Int.toLong(32767));
      expect(buffer.atomicLoadI16(0, 2)).assertEqual(Int.toLong(-1));
      buffer.atomicStoreI16(0, 2, Int.toShort(100));
      old = buffer.atomicExchangeI16(0, 2, Int.toShort(200));
      expect(old).assertEqual(Int.toLong(100));
      expect(buffer.atomicLoadI16(0, 2)).assertEqual(Int.toLong(200));
      buffer.atomicStoreI16(0, 2, Int.toShort(300));
      old = buffer.atomicCompareExchangeI16(0, 2, Int.toShort(300), Int.toShort(400));
      expect(old).assertEqual(Int.toLong(300));
      expect(buffer.atomicLoadI16(0, 2)).assertEqual(Int.toLong(400));
    });

    /**
     * @tc.name testArrayBufferAtomic0113
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1130
     * @tc.desc Verify I16 at addr 0-1 does not affect addr 2-3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI16(0, 0, Int.toShort(0x1234));
      buffer.atomicStoreI16(0, 2, Int.toShort(0x5678));
      buffer.atomicAddI16(0, 0, Int.toShort(1));
      expect(buffer.atomicLoadI16(0, 2)).assertEqual(Int.toLong(0x5678));
      buffer.atomicStoreI16(0, 2, Int.toShort(0xABCD));
      expect(buffer.atomicLoadI16(0, 0)).assertEqual(Int.toLong(0x1235));
    });

    /**
     * @tc.name testArrayBufferAtomic0114
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1140
     * @tc.desc Verify I16 Add 30000 + 5000 = -30536 (overflow)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI16(0, 0, Int.toShort(30000));
      buffer.atomicAddI16(0, 0, Int.toShort(5000));
      expect(buffer.atomicLoadI16(0, 0)).assertEqual(Int.toLong(-30536));
    });

    /**
     * @tc.name testArrayBufferAtomic0115
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1150
     * @tc.desc Verify I16 Add -20000 + (-20000) = 25536 (neg wrap)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI16(0, 0, Int.toShort(-20000));
      buffer.atomicAddI16(0, 0, Int.toShort(-20000));
      expect(buffer.atomicLoadI16(0, 0)).assertEqual(Int.toLong(25536));
    });

    /**
     * @tc.name testArrayBufferAtomic0116
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1160
     * @tc.desc Verify I16 consecutive Add overflow: 32000+3000+3000 = -27536
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI16(0, 0, Int.toShort(32000));
      buffer.atomicAddI16(0, 0, Int.toShort(3000));
      expect(buffer.atomicLoadI16(0, 0)).assertEqual(Int.toLong(-30536));
      buffer.atomicAddI16(0, 0, Int.toShort(3000));
      expect(buffer.atomicLoadI16(0, 0)).assertEqual(Int.toLong(-27536));
    });

    /**
     * @tc.name testArrayBufferAtomic0117
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1170
     * @tc.desc Verify I16 Add at non-zero address: (index=1, byteOffset=2) Store 32767, Add 1, Load -32768
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(6);
      buffer.atomicStoreI16(1, 2, Int.toShort(32767));
      buffer.atomicAddI16(1, 2, Int.toShort(1));
      expect(buffer.atomicLoadI16(1, 2)).assertEqual(Int.toLong(-32768));
    });

    /**
     * @tc.name testArrayBufferAtomic0118
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1180
     * @tc.desc Verify I16 Sub -30000 - 5000 = 30536 (underflow)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI16(0, 0, Int.toShort(-30000));
      buffer.atomicSubI16(0, 0, Int.toShort(5000));
      expect(buffer.atomicLoadI16(0, 0)).assertEqual(Int.toLong(30536));
    });

    /**
     * @tc.name testArrayBufferAtomic0119
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1190
     * @tc.desc Verify I16 Sub 30000 - (-5000) = -30536 (sub negative)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI16(0, 0, Int.toShort(30000));
      buffer.atomicSubI16(0, 0, Int.toShort(-5000));
      expect(buffer.atomicLoadI16(0, 0)).assertEqual(Int.toLong(-30536));
    });

    /**
     * @tc.name testArrayBufferAtomic0120
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1200
     * @tc.desc Verify I16 consecutive Sub: -32000-3000-3000 = 27536
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI16(0, 0, Int.toShort(-32000));
      buffer.atomicSubI16(0, 0, Int.toShort(3000));
      expect(buffer.atomicLoadI16(0, 0)).assertEqual(Int.toLong(30536));
      buffer.atomicSubI16(0, 0, Int.toShort(3000));
      expect(buffer.atomicLoadI16(0, 0)).assertEqual(Int.toLong(27536));
    });

    /**
     * @tc.name testArrayBufferAtomic0121
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1210
     * @tc.desc Verify I16 Add then Sub at non-zero address: (0,2) Add 100, Sub 100 -> original
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI16(0, 2, Int.toShort(5000));
      buffer.atomicAddI16(0, 2, Int.toShort(100));
      expect(buffer.atomicLoadI16(0, 2)).assertEqual(Int.toLong(5100));
      buffer.atomicSubI16(0, 2, Int.toShort(100));
      expect(buffer.atomicLoadI16(0, 2)).assertEqual(Int.toLong(5000));
    });

    /**
     * @tc.name testArrayBufferAtomic0122
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1220
     * @tc.desc Verify I16 CAS success: Store -1, CAS(-1,0), Load 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI16(0, 0, Int.toShort(-1));
      const old = buffer.atomicCompareExchangeI16(0, 0, Int.toShort(-1), Int.toShort(0));
      expect(old).assertEqual(Int.toLong(-1));
      expect(buffer.atomicLoadI16(0, 0)).assertEqual(Int.toLong(0));
    });

    /**
     * @tc.name testArrayBufferAtomic0123
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1230
     * @tc.desc Verify I16 CAS failure: Store 32767, CAS(-32768,0), Load 32767
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI16(0, 0, Int.toShort(32767));
      const old = buffer.atomicCompareExchangeI16(0, 0, Int.toShort(-32768), Int.toShort(0));
      expect(old).assertEqual(Int.toLong(32767));
      expect(buffer.atomicLoadI16(0, 0)).assertEqual(Int.toLong(32767));
    });

    /**
     * @tc.name testArrayBufferAtomic0124
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1240
     * @tc.desc Verify I16 CAS expected=-32768: Store -32768, CAS(-32768,32767), Load 32767
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI16(0, 0, Int.toShort(-32768));
      const old = buffer.atomicCompareExchangeI16(0, 0, Int.toShort(-32768), Int.toShort(32767));
      expect(old).assertEqual(Int.toLong(-32768));
      expect(buffer.atomicLoadI16(0, 0)).assertEqual(Int.toLong(32767));
    });

    /**
     * @tc.name testArrayBufferAtomic0125
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1250
     * @tc.desc Verify I16 CAS replacement=-32768: Store 0, CAS(0,-32768), Load -32768
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI16(0, 0, Int.toShort(0));
      const old = buffer.atomicCompareExchangeI16(0, 0, Int.toShort(0), Int.toShort(-32768));
      expect(old).assertEqual(Int.toLong(0));
      expect(buffer.atomicLoadI16(0, 0)).assertEqual(Int.toLong(-32768));
    });

    /**
     * @tc.name testArrayBufferAtomic0126
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1260
     * @tc.desc Verify I16 CAS retry: CAS(99,200) fail, CAS(100,200) success
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI16(0, 0, Int.toShort(100));
      let old = buffer.atomicCompareExchangeI16(0, 0, Int.toShort(99), Int.toShort(200));
      expect(old).assertEqual(Int.toLong(100));
      old = buffer.atomicCompareExchangeI16(0, 0, Int.toShort(100), Int.toShort(200));
      expect(old).assertEqual(Int.toLong(100));
      expect(buffer.atomicLoadI16(0, 0)).assertEqual(Int.toLong(200));
    });

    /**
     * @tc.name testArrayBufferAtomic0127
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1270
     * @tc.desc Verify I16 CAS chain: -32768 -> -1 -> 0 -> 32767
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI16(0, 0, Int.toShort(-32768));
      let old = buffer.atomicCompareExchangeI16(0, 0, Int.toShort(-32768), Int.toShort(-1));
      expect(old).assertEqual(Int.toLong(-32768));
      old = buffer.atomicCompareExchangeI16(0, 0, Int.toShort(-1), Int.toShort(0));
      expect(old).assertEqual(Int.toLong(-1));
      old = buffer.atomicCompareExchangeI16(0, 0, Int.toShort(0), Int.toShort(32767));
      expect(old).assertEqual(Int.toLong(0));
      expect(buffer.atomicLoadI16(0, 0)).assertEqual(Int.toLong(32767));
    });

    /**
     * @tc.name testArrayBufferAtomic0128
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1280
     * @tc.desc Verify I16 And clears sign bit: -1 & 0x7FFF = 32767
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI16(0, 0, Int.toShort(-1));
      buffer.atomicAndI16(0, 0, Int.toShort(0x7FFF));
      expect(buffer.atomicLoadI16(0, 0)).assertEqual(Int.toLong(32767));
    });

    /**
     * @tc.name testArrayBufferAtomic0129
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1290
     * @tc.desc Verify I16 And preserves sign bit: -1 & 0x8000 = -32768
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI16(0, 0, Int.toShort(-1));
      buffer.atomicAndI16(0, 0, Int.toShort(0x8000));
      expect(buffer.atomicLoadI16(0, 0)).assertEqual(Int.toLong(-32768));
    });

    /**
     * @tc.name testArrayBufferAtomic0130
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1300
     * @tc.desc Verify I16 Or sets sign bit: 32767 | 0x8000 = -1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI16(0, 0, Int.toShort(32767));
      buffer.atomicOrI16(0, 0, Int.toShort(0x8000));
      expect(buffer.atomicLoadI16(0, 0)).assertEqual(Int.toLong(-1));
    });

    /**
     * @tc.name testArrayBufferAtomic0131
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1310
     * @tc.desc Verify I16 Or all 1s: 0 | 0xFFFF = -1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI16(0, 0, Int.toShort(0));
      buffer.atomicOrI16(0, 0, Int.toShort(0xFFFF));
      expect(buffer.atomicLoadI16(0, 0)).assertEqual(Int.toLong(-1));
    });

    /**
     * @tc.name testArrayBufferAtomic0132
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1320
     * @tc.desc Verify I16 Xor flips sign bit: 32767 ^ 0x8000 = -1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI16(0, 0, Int.toShort(32767));
      buffer.atomicXorI16(0, 0, Int.toShort(0x8000));
      expect(buffer.atomicLoadI16(0, 0)).assertEqual(Int.toLong(-1));
    });

    /**
     * @tc.name testArrayBufferAtomic0133
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1330
     * @tc.desc Verify I16 Xor self = 0: -1 ^ -1 = 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI16(0, 0, Int.toShort(-1));
      buffer.atomicXorI16(0, 0, Int.toShort(-1));
      expect(buffer.atomicLoadI16(0, 0)).assertEqual(Int.toLong(0));
    });

    /**
     * @tc.name testArrayBufferAtomic0134
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1340
     * @tc.desc Verify I16 And+Or combination: Store 0xFFFF, And 0x00FF, Or 0x0100 = 0x01FF
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI16(0, 0, Int.toShort(0xFFFF));
      buffer.atomicAndI16(0, 0, Int.toShort(0x00FF));
      buffer.atomicOrI16(0, 0, Int.toShort(0x0100));
      expect(buffer.atomicLoadI16(0, 0)).assertEqual(Int.toLong(0x01FF));
    });

    /**
     * @tc.name testArrayBufferAtomic0135
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1350
     * @tc.desc Verify Int.toShort(32768) -> -32768
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI16(0, 0, Int.toShort(32768));
      expect(buffer.atomicLoadI16(0, 0)).assertEqual(Int.toLong(-32768));
    });

    /**
     * @tc.name testArrayBufferAtomic0136
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1360
     * @tc.desc Verify Int.toShort(65535) -> -1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI16(0, 0, Int.toShort(65535));
      expect(buffer.atomicLoadI16(0, 0)).assertEqual(Int.toLong(-1));
    });

    /**
     * @tc.name testArrayBufferAtomic0137
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1370
     * @tc.desc Verify Int.toShort(-32769) -> 32767
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI16(0, 0, Int.toShort(-32769));
      expect(buffer.atomicLoadI16(0, 0)).assertEqual(Int.toLong(32767));
    });

    /**
     * @tc.name testArrayBufferAtomic0138
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1380
     * @tc.desc Verify Add with truncated operand: Store 1, Add Int.toShort(65535)=-1, Load 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI16(0, 0, Int.toShort(1));
      buffer.atomicAddI16(0, 0, Int.toShort(65535));
      expect(buffer.atomicLoadI16(0, 0)).assertEqual(Int.toLong(0));
    });

    /**
     * @tc.name testArrayBufferAtomic0139
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1390
     * @tc.desc Verify Sub with truncated operand: Store 1, Sub Int.toShort(65535)=-1, Load 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI16(0, 0, Int.toShort(1));
      buffer.atomicSubI16(0, 0, Int.toShort(65535));
      expect(buffer.atomicLoadI16(0, 0)).assertEqual(Int.toLong(2));
    });

    /**
     * @tc.name testArrayBufferAtomic0140
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1400
     * @tc.desc Verify I16 store -1, U16 load returns 65535 (0xFFFF)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI16(0, 0, Int.toShort(-1));
      expect(buffer.atomicLoadU16(0, 0)).assertEqual(Int.toLong(65535));
    });

    /**
     * @tc.name testArrayBufferAtomic0141
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1410
     * @tc.desc Verify I16 store -32768, U16 load returns 32768 (0x8000)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI16(0, 0, Int.toShort(-32768));
      expect(buffer.atomicLoadU16(0, 0)).assertEqual(Int.toLong(32768));
    });

    /**
     * @tc.name testArrayBufferAtomic0142
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1420
     * @tc.desc Verify I16 + U8 non-overlapping coexistence
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI16(0, 0, Int.toShort(1000));
      buffer.atomicStoreU8(2, 0, Int.toByte(200));
      expect(buffer.atomicLoadI16(0, 0)).assertEqual(Int.toLong(1000));
      expect(buffer.atomicLoadU8(2, 0)).assertEqual(Int.toLong(200));
    });

    /**
     * @tc.name testArrayBufferAtomic0143
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1430
     * @tc.desc Verify set() then atomicLoadI16 reads correctly
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.set(0, Int.toByte(10));
      buffer.set(1, Int.toByte(0));
      buffer.atomicAddI16(0, 0, Int.toShort(5));
      expect(buffer.atomicLoadI16(0, 0)).assertEqual(Int.toLong(15));
    });

    /**
     * @tc.name testArrayBufferAtomic0144
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1440
     * @tc.desc Verify atomicStoreI16 then at() on first byte
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI16(0, 0, Int.toShort(0x1234));
      const lo = buffer.at(0);
      const hi = buffer.at(1);
      expect(Byte.toInt(lo)).assertEqual(Int.toLong(0x34));
      expect(Byte.toInt(hi)).assertEqual(Int.toLong(0x12));
    });

    /**
     * @tc.name testArrayBufferAtomic0145
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1450
     * @tc.desc Verify resize(4) then atomicLoadI16 on new area returns 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(2, 4);
      buffer.resize(4);
      expect(buffer.atomicLoadI16(0, 2)).assertEqual(Int.toLong(0));
    });

    /**
     * @tc.name testArrayBufferAtomic0146
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1460
     * @tc.desc Verify resize(4) then StoreI16 and LoadI16 on new area
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(2, 4);
      buffer.resize(4);
      buffer.atomicStoreI16(0, 2, Int.toShort(5000));
      expect(buffer.atomicLoadI16(0, 2)).assertEqual(Int.toLong(5000));
    });

    /**
     * @tc.name testArrayBufferAtomic0147
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1470
     * @tc.desc Verify resize(4) then AddI16 overflow: Store 32767 at addr 2, Add 1, Load -32768
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(2, 4);
      buffer.resize(4);
      buffer.atomicStoreI16(0, 2, Int.toShort(32767));
      buffer.atomicAddI16(0, 2, Int.toShort(1));
      expect(buffer.atomicLoadI16(0, 2)).assertEqual(Int.toLong(-32768));
    });

    /**
     * @tc.name testArrayBufferAtomic0148
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1480
     * @tc.desc Verify I16 overflow stability: 5 times same buffer 32767+1=-32768
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      for (let i = 0; i < 5; i++) {
        buffer.atomicStoreI16(0, 0, Int.toShort(32767));
        buffer.atomicAddI16(0, 0, Int.toShort(1));
        expect(buffer.atomicLoadI16(0, 0)).assertEqual(Int.toLong(-32768));
      }
    });

    /**
     * @tc.name testArrayBufferAtomic0149
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1490
     * @tc.desc Verify I16 stability with new buffer each time
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 5; i++) {
        const buffer: ArrayBuffer = new ArrayBuffer(4);
        buffer.atomicStoreI16(0, 0, Int.toShort(1000));
        buffer.atomicAddI16(0, 0, Int.toShort(500));
        buffer.atomicSubI16(0, 0, Int.toShort(200));
        expect(buffer.atomicLoadI16(0, 0)).assertEqual(Int.toLong(1300));
      }
    });

    /**
     * @tc.name testArrayBufferAtomic0150
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1500
     * @tc.desc Verify atomicAddU16 returns old 65535 when wrap
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU16(0, 0, Int.toShort(65535));
      const old = buffer.atomicAddU16(0, 0, Int.toShort(1));
      expect(old).assertEqual(Int.toLong(65535));
    });

    /**
     * @tc.name testArrayBufferAtomic0151
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1510
     * @tc.desc Verify atomicSubU16 returns old 0 when wrap
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU16(0, 0, Int.toShort(0));
      const old = buffer.atomicSubU16(0, 0, Int.toShort(1));
      expect(old).assertEqual(Int.toLong(0));
    });

    /**
     * @tc.name testArrayBufferAtomic0152
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1520
     * @tc.desc Verify atomicAndU16 returns old 65535
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU16(0, 0, Int.toShort(65535));
      const old = buffer.atomicAndU16(0, 0, Int.toShort(0x00FF));
      expect(old).assertEqual(Int.toLong(65535));
    });

    /**
     * @tc.name testArrayBufferAtomic0153
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1530
     * @tc.desc Verify atomicOrU16 returns old 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU16(0, 0, Int.toShort(0));
      const old = buffer.atomicOrU16(0, 0, Int.toShort(0xFFFF));
      expect(old).assertEqual(Int.toLong(0));
    });

    /**
     * @tc.name testArrayBufferAtomic0154
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1540
     * @tc.desc Verify atomicXorU16 returns old 32768
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU16(0, 0, Int.toShort(32768));
      const old = buffer.atomicXorU16(0, 0, Int.toShort(0xFFFF));
      expect(old).assertEqual(Int.toLong(32768));
    });

    /**
     * @tc.name testArrayBufferAtomic0155
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1550
     * @tc.desc Verify atomicExchangeU16 returns old 50000
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU16(0, 0, Int.toShort(50000));
      const old = buffer.atomicExchangeU16(0, 0, Int.toShort(10000));
      expect(old).assertEqual(Int.toLong(50000));
    });

    /**
     * @tc.name testArrayBufferAtomic0156
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1560
     * @tc.desc Verify all U16 operations on 2-byte buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(2);
      buffer.atomicStoreU16(0, 0, Int.toShort(1000));
      expect(buffer.atomicLoadU16(0, 0)).assertEqual(Int.toLong(1000));
      let old = buffer.atomicAddU16(0, 0, Int.toShort(500));
      expect(old).assertEqual(Int.toLong(1000));
      expect(buffer.atomicLoadU16(0, 0)).assertEqual(Int.toLong(1500));
      old = buffer.atomicSubU16(0, 0, Int.toShort(500));
      expect(old).assertEqual(Int.toLong(1500));
      expect(buffer.atomicLoadU16(0, 0)).assertEqual(Int.toLong(1000));
      old = buffer.atomicAndU16(0, 0, Int.toShort(0x00FF));
      expect(old).assertEqual(Int.toLong(1000));
      expect(buffer.atomicLoadU16(0, 0)).assertEqual(Int.toLong(232));
      old = buffer.atomicOrU16(0, 0, Int.toShort(0xFF00));
      expect(old).assertEqual(Int.toLong(232));
      expect(buffer.atomicLoadU16(0, 0)).assertEqual(Int.toLong(65512));
      old = buffer.atomicXorU16(0, 0, Int.toShort(0xFFFF));
      expect(old).assertEqual(Int.toLong(65512));
      expect(buffer.atomicLoadU16(0, 0)).assertEqual(Int.toLong(23));
    });

    /**
     * @tc.name testArrayBufferAtomic0157
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1570
     * @tc.desc Verify Exchange and CAS on 2-byte buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(2);
      buffer.atomicStoreU16(0, 0, Int.toShort(100));
      const oldEx = buffer.atomicExchangeU16(0, 0, Int.toShort(200));
      expect(oldEx).assertEqual(Int.toLong(100));
      expect(buffer.atomicLoadU16(0, 0)).assertEqual(Int.toLong(200));
      const oldCas = buffer.atomicCompareExchangeU16(0, 0, Int.toShort(200), Int.toShort(300));
      expect(oldCas).assertEqual(Int.toLong(200));
      expect(buffer.atomicLoadU16(0, 0)).assertEqual(Int.toLong(300));
    });

    /**
     * @tc.name testArrayBufferAtomic0158
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1580
     * @tc.desc Verify all U16 operations on last valid addr=2 (index=0, byteOffset=2 in 4-byte buffer)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU16(0, 2, Int.toShort(65535));
      expect(buffer.atomicLoadU16(0, 2)).assertEqual(Int.toLong(65535));
      let old = buffer.atomicAddU16(0, 2, Int.toShort(1));
      expect(old).assertEqual(Int.toLong(65535));
      expect(buffer.atomicLoadU16(0, 2)).assertEqual(Int.toLong(0));
      buffer.atomicStoreU16(0, 2, Int.toShort(50000));
      old = buffer.atomicSubU16(0, 2, Int.toShort(1));
      expect(old).assertEqual(Int.toLong(50000));
      expect(buffer.atomicLoadU16(0, 2)).assertEqual(Int.toLong(49999));
      buffer.atomicStoreU16(0, 2, Int.toShort(0xFFFF));
      old = buffer.atomicAndU16(0, 2, Int.toShort(0x7FFF));
      expect(old).assertEqual(Int.toLong(65535));
      expect(buffer.atomicLoadU16(0, 2)).assertEqual(Int.toLong(32767));
      buffer.atomicStoreU16(0, 2, Int.toShort(0));
      old = buffer.atomicOrU16(0, 2, Int.toShort(0x8000));
      expect(old).assertEqual(Int.toLong(0));
      expect(buffer.atomicLoadU16(0, 2)).assertEqual(Int.toLong(32768));
      buffer.atomicStoreU16(0, 2, Int.toShort(0x7FFF));
      old = buffer.atomicXorU16(0, 2, Int.toShort(0x8000));
      expect(old).assertEqual(Int.toLong(32767));
      expect(buffer.atomicLoadU16(0, 2)).assertEqual(Int.toLong(65535));
      buffer.atomicStoreU16(0, 2, Int.toShort(100));
      old = buffer.atomicExchangeU16(0, 2, Int.toShort(200));
      expect(old).assertEqual(Int.toLong(100));
      expect(buffer.atomicLoadU16(0, 2)).assertEqual(Int.toLong(200));
      buffer.atomicStoreU16(0, 2, Int.toShort(300));
      old = buffer.atomicCompareExchangeU16(0, 2, Int.toShort(300), Int.toShort(400));
      expect(old).assertEqual(Int.toLong(300));
      expect(buffer.atomicLoadU16(0, 2)).assertEqual(Int.toLong(400));
    });

    /**
     * @tc.name testArrayBufferAtomic0159
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1590
     * @tc.desc Verify U16 at addr 0-1 does not affect addr 2-3
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU16(0, 0, Int.toShort(0x1234));
      buffer.atomicStoreU16(0, 2, Int.toShort(0x5678));
      buffer.atomicAddU16(0, 0, Int.toShort(1));
      expect(buffer.atomicLoadU16(0, 2)).assertEqual(Int.toLong(0x5678));
    });

    /**
     * @tc.name testArrayBufferAtomic0160
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1600
     * @tc.desc Verify U16 Add 65000 + 1000 = 464 (wrap)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU16(0, 0, Int.toShort(65000));
      buffer.atomicAddU16(0, 0, Int.toShort(1000));
      expect(buffer.atomicLoadU16(0, 0)).assertEqual(Int.toLong(464));
    });

    /**
     * @tc.name testArrayBufferAtomic0161
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1610
     * @tc.desc Verify U16 consecutive Add wrap: 64000+1000+1000 = 464 (U16 wrap)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU16(0, 0, Int.toShort(64000));
      buffer.atomicAddU16(0, 0, Int.toShort(1000));
      expect(buffer.atomicLoadU16(0, 0)).assertEqual(Int.toLong(65000));
      buffer.atomicAddU16(0, 0, Int.toShort(1000));
      expect(buffer.atomicLoadU16(0, 0)).assertEqual(Int.toLong(464));
    });

    /**
     * @tc.name testArrayBufferAtomic0162
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1620
     * @tc.desc Verify U16 Add at non-zero address: (1,2) Store 65534, Add 3, Load 1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(6);
      buffer.atomicStoreU16(1, 2, Int.toShort(65534));
      buffer.atomicAddU16(1, 2, Int.toShort(3));
      expect(buffer.atomicLoadU16(1, 2)).assertEqual(Int.toLong(1));
    });

    /**
     * @tc.name testArrayBufferAtomic0163
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1630
     * @tc.desc Verify U16 Sub 100 - 200 = 65436 (wrap)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU16(0, 0, Int.toShort(100));
      buffer.atomicSubU16(0, 0, Int.toShort(200));
      expect(buffer.atomicLoadU16(0, 0)).assertEqual(Int.toLong(65436));
    });

    /**
     * @tc.name testArrayBufferAtomic0164
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1640
     * @tc.desc Verify U16 consecutive Sub wrap: 100-50-100 = 65486 (U16 wrap)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU16(0, 0, Int.toShort(100));
      buffer.atomicSubU16(0, 0, Int.toShort(50));
      expect(buffer.atomicLoadU16(0, 0)).assertEqual(Int.toLong(50));
      buffer.atomicSubU16(0, 0, Int.toShort(100));
      expect(buffer.atomicLoadU16(0, 0)).assertEqual(Int.toLong(65486));
    });

    /**
     * @tc.name testArrayBufferAtomic0165
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1650
     * @tc.desc Verify U16 CAS success: Store 50000, CAS(50000,60000), Load 60000
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU16(0, 0, Int.toShort(50000));
      const old = buffer.atomicCompareExchangeU16(0, 0, Int.toShort(50000), Int.toShort(60000));
      expect(old).assertEqual(Int.toLong(50000));
      expect(buffer.atomicLoadU16(0, 0)).assertEqual(Int.toLong(60000));
    });

    /**
     * @tc.name testArrayBufferAtomic0166
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1660
     * @tc.desc Verify U16 CAS failure: Store 60000, CAS(50000,0), Load 60000
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU16(0, 0, Int.toShort(60000));
      const old = buffer.atomicCompareExchangeU16(0, 0, Int.toShort(50000), Int.toShort(0));
      expect(old).assertEqual(Int.toLong(60000));
      expect(buffer.atomicLoadU16(0, 0)).assertEqual(Int.toLong(60000));
    });

    /**
     * @tc.name testArrayBufferAtomic0167
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1670
     * @tc.desc Verify U16 CAS boundary: Store 0, CAS(0,65535), Load 65535
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU16(0, 0, Int.toShort(0));
      const old = buffer.atomicCompareExchangeU16(0, 0, Int.toShort(0), Int.toShort(65535));
      expect(old).assertEqual(Int.toLong(0));
      expect(buffer.atomicLoadU16(0, 0)).assertEqual(Int.toLong(65535));
    });

    /**
     * @tc.name testArrayBufferAtomic0168
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1680
     * @tc.desc Verify U16 CAS chain: 0 -> 32768 -> 65535
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU16(0, 0, Int.toShort(0));
      let old = buffer.atomicCompareExchangeU16(0, 0, Int.toShort(0), Int.toShort(32768));
      expect(old).assertEqual(Int.toLong(0));
      old = buffer.atomicCompareExchangeU16(0, 0, Int.toShort(32768), Int.toShort(65535));
      expect(old).assertEqual(Int.toLong(32768));
      expect(buffer.atomicLoadU16(0, 0)).assertEqual(Int.toLong(65535));
    });

    /**
     * @tc.name testArrayBufferAtomic0169
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1690
     * @tc.desc Verify U16 CAS retry: fail then success
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU16(0, 0, Int.toShort(100));
      let old = buffer.atomicCompareExchangeU16(0, 0, Int.toShort(99), Int.toShort(200));
      expect(old).assertEqual(Int.toLong(100));
      old = buffer.atomicCompareExchangeU16(0, 0, Int.toShort(100), Int.toShort(200));
      expect(old).assertEqual(Int.toLong(100));
      expect(buffer.atomicLoadU16(0, 0)).assertEqual(Int.toLong(200));
    });

    /**
     * @tc.name testArrayBufferAtomic0170
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1700
     * @tc.desc Verify U16 And clears high bit: 65535 & 0x7FFF = 32767
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU16(0, 0, Int.toShort(65535));
      buffer.atomicAndU16(0, 0, Int.toShort(0x7FFF));
      expect(buffer.atomicLoadU16(0, 0)).assertEqual(Int.toLong(32767));
    });

    /**
     * @tc.name testArrayBufferAtomic0171
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1710
     * @tc.desc Verify U16 Or sets high bit: 0 | 0x8000 = 32768
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU16(0, 0, Int.toShort(0));
      buffer.atomicOrU16(0, 0, Int.toShort(0x8000));
      expect(buffer.atomicLoadU16(0, 0)).assertEqual(Int.toLong(32768));
    });

    /**
     * @tc.name testArrayBufferAtomic0172
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1720
     * @tc.desc Verify U16 Xor flips high bit: 32767 ^ 0x8000 = 65535
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU16(0, 0, Int.toShort(32767));
      buffer.atomicXorU16(0, 0, Int.toShort(0x8000));
      expect(buffer.atomicLoadU16(0, 0)).assertEqual(Int.toLong(65535));
    });

    /**
     * @tc.name testArrayBufferAtomic0173
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1730
     * @tc.desc Verify U16 Xor self = 0: 32768 ^ 32768 = 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU16(0, 0, Int.toShort(32768));
      buffer.atomicXorU16(0, 0, Int.toShort(32768));
      expect(buffer.atomicLoadU16(0, 0)).assertEqual(Int.toLong(0));
    });

    /**
     * @tc.name testArrayBufferAtomic0174
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1740
     * @tc.desc Verify U16 bit combination: 0xFFFF & 0x00FF | 0x0100 = 0x01FF
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU16(0, 0, Int.toShort(0xFFFF));
      buffer.atomicAndU16(0, 0, Int.toShort(0x00FF));
      buffer.atomicOrU16(0, 0, Int.toShort(0x0100));
      expect(buffer.atomicLoadU16(0, 0)).assertEqual(Int.toLong(0x01FF));
    });

    /**
     * @tc.name testArrayBufferAtomic0175
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1750
     * @tc.desc Verify Int.toShort(65536) -> 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU16(0, 0, Int.toShort(65536));
      expect(buffer.atomicLoadU16(0, 0)).assertEqual(Int.toLong(0));
    });

    /**
     * @tc.name testArrayBufferAtomic0176
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1760
     * @tc.desc Verify Int.toShort(-1) -> 65535
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU16(0, 0, Int.toShort(-1));
      expect(buffer.atomicLoadU16(0, 0)).assertEqual(Int.toLong(65535));
    });

    /**
     * @tc.name testArrayBufferAtomic0177
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1770
     * @tc.desc Verify Int.toShort(-32768) -> 32768
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU16(0, 0, Int.toShort(-32768));
      expect(buffer.atomicLoadU16(0, 0)).assertEqual(Int.toLong(32768));
    });

    /**
     * @tc.name testArrayBufferAtomic0178
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1780
     * @tc.desc Verify Add with truncated operand: Store 1, Add Int.toShort(-1)=65535, Load 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU16(0, 0, Int.toShort(1));
      buffer.atomicAddU16(0, 0, Int.toShort(-1));
      expect(buffer.atomicLoadU16(0, 0)).assertEqual(Int.toLong(0));
    });

    /**
     * @tc.name testArrayBufferAtomic0179
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1790
     * @tc.desc Verify Sub with truncated operand: Store 1, Sub Int.toShort(-1)=65535, Load 2
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU16(0, 0, Int.toShort(1));
      buffer.atomicSubU16(0, 0, Int.toShort(-1));
      expect(buffer.atomicLoadU16(0, 0)).assertEqual(Int.toLong(2));
    });

    /**
     * @tc.name testArrayBufferAtomic0180
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1800
     * @tc.desc Verify U16 store 65535, I16 load returns -1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU16(0, 0, Int.toShort(65535));
      expect(buffer.atomicLoadI16(0, 0)).assertEqual(Int.toLong(-1));
    });

    /**
     * @tc.name testArrayBufferAtomic0181
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1810
     * @tc.desc Verify U16 + I32 non-overlapping coexistence (non-aligned access)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(8);
      buffer.atomicStoreU16(0, 0, Int.toShort(50000));
      buffer.atomicStoreI32(1, 0, 1000000);
      expect(buffer.atomicLoadU16(0, 0)).assertEqual(Int.toLong(50000));
      expect(buffer.atomicLoadI32(1, 0)).assertEqual(Int.toLong(1000000));
    });

    /**
     * @tc.name testArrayBufferAtomic0182
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1820
     * @tc.desc Verify resize(4) then atomicLoadU16 on new area = 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(2, 4);
      buffer.resize(4);
      expect(buffer.atomicLoadU16(0, 2)).assertEqual(Int.toLong(0));
    });

    /**
     * @tc.name testArrayBufferAtomic0183
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1830
     * @tc.desc Verify resize(4) then StoreU16 and LoadU16 on new area
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(2, 4);
      buffer.resize(4);
      buffer.atomicStoreU16(0, 2, Int.toShort(40000));
      expect(buffer.atomicLoadU16(0, 2)).assertEqual(Int.toLong(40000));
    });

    /**
     * @tc.name testArrayBufferAtomic0184
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1840
     * @tc.desc Verify resize(4) then AddU16 wrap: Store 65535 at addr 2, Add 1, Load 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(2, 4);
      buffer.resize(4);
      buffer.atomicStoreU16(0, 2, Int.toShort(65535));
      buffer.atomicAddU16(0, 2, Int.toShort(1));
      expect(buffer.atomicLoadU16(0, 2)).assertEqual(Int.toLong(0));
    });

    /**
     * @tc.name testArrayBufferAtomic0185
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1850
     * @tc.desc Verify U16 wrap stability: 5 times same buffer 65535+1=0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      for (let i = 0; i < 5; i++) {
        buffer.atomicStoreU16(0, 0, Int.toShort(65535));
        buffer.atomicAddU16(0, 0, Int.toShort(1));
        expect(buffer.atomicLoadU16(0, 0)).assertEqual(Int.toLong(0));
      }
    });

    /**
     * @tc.name testArrayBufferAtomic0186
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1860
     * @tc.desc Verify U16 stability with new buffer each time
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 5; i++) {
        const buffer: ArrayBuffer = new ArrayBuffer(4);
        buffer.atomicStoreU16(0, 0, Int.toShort(1000));
        buffer.atomicAddU16(0, 0, Int.toShort(500));
        buffer.atomicSubU16(0, 0, Int.toShort(200));
        expect(buffer.atomicLoadU16(0, 0)).assertEqual(Int.toLong(1300));
      }
    });

    /**
     * @tc.name testArrayBufferAtomic0187
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1870
     * @tc.desc Verify atomicAddI32 returns old 2147483647 (MAX) on overflow
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI32(0, 0, 2147483647);
      const old = buffer.atomicAddI32(0, 0, 1);
      expect(old).assertEqual(Int.toLong(2147483647));
    });

    /**
     * @tc.name testArrayBufferAtomic0188
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1880
     * @tc.desc Verify atomicSubI32 returns old -2147483648 on underflow
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI32(0, 0, -2147483648);
      const old = buffer.atomicSubI32(0, 0, 1);
      expect(old).assertEqual(Int.toLong(-2147483648));
    });

    /**
     * @tc.name testArrayBufferAtomic0189
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1890
     * @tc.desc Verify atomicAndI32 returns old -1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI32(0, 0, -1);
      const old = buffer.atomicAndI32(0, 0, 2147483647);
      expect(old).assertEqual(Int.toLong(-1));
    });

    /**
     * @tc.name testArrayBufferAtomic0190
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1900
     * @tc.desc Verify atomicOrI32 returns old 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI32(0, 0, 0);
      const old = buffer.atomicOrI32(0, 0, -1);
      expect(old).assertEqual(Int.toLong(0));
    });

    /**
     * @tc.name testArrayBufferAtomic0191
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1910
     * @tc.desc Verify atomicXorI32 returns old 2147483647
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI32(0, 0, 2147483647);
      const old = buffer.atomicXorI32(0, 0, -1);
      expect(old).assertEqual(Int.toLong(2147483647));
    });

    /**
     * @tc.name testArrayBufferAtomic0192
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1920
     * @tc.desc Verify atomicExchangeI32 returns old -2147483648
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI32(0, 0, -2147483648);
      const old = buffer.atomicExchangeI32(0, 0, 2147483647);
      expect(old).assertEqual(Int.toLong(-2147483648));
    });

    /**
     * @tc.name testArrayBufferAtomic0193
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1930
     * @tc.desc Verify all I32 operations on 4-byte buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI32(0, 0, 100000);
      expect(buffer.atomicLoadI32(0, 0)).assertEqual(Int.toLong(100000));
      let old = buffer.atomicAddI32(0, 0, 50000);
      expect(old).assertEqual(Int.toLong(100000));
      expect(buffer.atomicLoadI32(0, 0)).assertEqual(Int.toLong(150000));
      old = buffer.atomicSubI32(0, 0, 50000);
      expect(old).assertEqual(Int.toLong(150000));
      expect(buffer.atomicLoadI32(0, 0)).assertEqual(Int.toLong(100000));
      old = buffer.atomicAndI32(0, 0, 65535);
      expect(old).assertEqual(Int.toLong(100000));
      expect(buffer.atomicLoadI32(0, 0)).assertEqual(Int.toLong(34464));
      old = buffer.atomicOrI32(0, 0, -65536);
      expect(old).assertEqual(Int.toLong(34464));
      expect(buffer.atomicLoadI32(0, 0)).assertEqual(Int.toLong(-31072));
      old = buffer.atomicXorI32(0, 0, -1);
      expect(old).assertEqual(Int.toLong(-31072));
      expect(buffer.atomicLoadI32(0, 0)).assertEqual(Int.toLong(31071));
    });

    /**
     * @tc.name testArrayBufferAtomic0194
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1940
     * @tc.desc Verify Exchange and CAS on 4-byte buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI32(0, 0, 1000);
      const oldEx = buffer.atomicExchangeI32(0, 0, 2000);
      expect(oldEx).assertEqual(Int.toLong(1000));
      expect(buffer.atomicLoadI32(0, 0)).assertEqual(Int.toLong(2000));
      const oldCas = buffer.atomicCompareExchangeI32(0, 0, 2000, 3000);
      expect(oldCas).assertEqual(Int.toLong(2000));
      expect(buffer.atomicLoadI32(0, 0)).assertEqual(Int.toLong(3000));
    });

    /**
     * @tc.name testArrayBufferAtomic0195
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1950
     * @tc.desc Verify all I32 operations on last valid addr=4 (index=0, byteOffset=4 in 8-byte buffer)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(8);
      buffer.atomicStoreI32(0, 4, -1);
      expect(buffer.atomicLoadI32(0, 4)).assertEqual(Int.toLong(-1));
      let old = buffer.atomicAddI32(0, 4, 1);
      expect(old).assertEqual(Int.toLong(-1));
      expect(buffer.atomicLoadI32(0, 4)).assertEqual(Int.toLong(0));
      buffer.atomicStoreI32(0, 4, 2147483647);
      old = buffer.atomicSubI32(0, 4, 1);
      expect(old).assertEqual(Int.toLong(2147483647));
      expect(buffer.atomicLoadI32(0, 4)).assertEqual(Int.toLong(2147483646));
      buffer.atomicStoreI32(0, 4, -1);
      old = buffer.atomicAndI32(0, 4, 2147483647);
      expect(old).assertEqual(Int.toLong(-1));
      expect(buffer.atomicLoadI32(0, 4)).assertEqual(Int.toLong(2147483647));
      buffer.atomicStoreI32(0, 4, 0);
      old = buffer.atomicOrI32(0, 4, -2147483648);
      expect(old).assertEqual(Int.toLong(0));
      expect(buffer.atomicLoadI32(0, 4)).assertEqual(Int.toLong(-2147483648));
      buffer.atomicStoreI32(0, 4, 1000);
      old = buffer.atomicExchangeI32(0, 4, 2000);
      expect(old).assertEqual(Int.toLong(1000));
      expect(buffer.atomicLoadI32(0, 4)).assertEqual(Int.toLong(2000));
      buffer.atomicStoreI32(0, 4, 3000);
      old = buffer.atomicCompareExchangeI32(0, 4, 3000, 4000);
      expect(old).assertEqual(Int.toLong(3000));
      expect(buffer.atomicLoadI32(0, 4)).assertEqual(Int.toLong(4000));
    });

    /**
     * @tc.name testArrayBufferAtomic0196
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1960
     * @tc.desc Verify I32 at addr 0-3 does not affect addr 4-7
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(8);
      buffer.atomicStoreI32(0, 0, 305419896);
      buffer.atomicStoreI32(0, 4, -1698898192);
      buffer.atomicAddI32(0, 0, 1);
      expect(buffer.atomicLoadI32(0, 4)).assertEqual(Int.toLong(-1698898192));
    });

    /**
     * @tc.name testArrayBufferAtomic0197
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1970
     * @tc.desc Verify I32 Add 2000000000 + 500000000 = -1794967296 (overflow)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI32(0, 0, 2000000000);
      buffer.atomicAddI32(0, 0, 500000000);
      expect(buffer.atomicLoadI32(0, 0)).assertEqual(Int.toLong(-1794967296));
    });

    /**
     * @tc.name testArrayBufferAtomic0198
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1980
     * @tc.desc Verify I32 Add -1500000000 + (-1000000000) = 1794967296 (neg wrap)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI32(0, 0, -1500000000);
      buffer.atomicAddI32(0, 0, -1000000000);
      expect(buffer.atomicLoadI32(0, 0)).assertEqual(Int.toLong(1794967296));
    });

    /**
     * @tc.name testArrayBufferAtomic0199
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1990
     * @tc.desc Verify I32 consecutive Add: 2000000000+100000000+100000000 = -2094967296
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI32(0, 0, 2000000000);
      buffer.atomicAddI32(0, 0, 100000000);
      expect(buffer.atomicLoadI32(0, 0)).assertEqual(Int.toLong(2100000000));
      buffer.atomicAddI32(0, 0, 100000000);
      expect(buffer.atomicLoadI32(0, 0)).assertEqual(Int.toLong(-2094967296));
    });

    /**
     * @tc.name testArrayBufferAtomic0200
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_2000
     * @tc.desc Verify I32 Sub -2000000000 - 500000000 = 1794967296 (underflow)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI32(0, 0, -2000000000);
      buffer.atomicSubI32(0, 0, 500000000);
      expect(buffer.atomicLoadI32(0, 0)).assertEqual(Int.toLong(1794967296));
    });

    /**
     * @tc.name testArrayBufferAtomic0201
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_2010
     * @tc.desc Verify I32 consecutive Sub: -2000000000-100000000-100000000 = 2094967296
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI32(0, 0, -2000000000);
      buffer.atomicSubI32(0, 0, 100000000);
      expect(buffer.atomicLoadI32(0, 0)).assertEqual(Int.toLong(-2100000000));
      buffer.atomicSubI32(0, 0, 100000000);
      expect(buffer.atomicLoadI32(0, 0)).assertEqual(Int.toLong(2094967296));
    });

    /**
     * @tc.name testArrayBufferAtomic0202
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_2020
     * @tc.desc Verify I32 CAS expected=-2147483648: Store MIN, CAS(MIN,MAX), Load MAX
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI32(0, 0, -2147483648);
      const old = buffer.atomicCompareExchangeI32(0, 0, -2147483648, 2147483647);
      expect(old).assertEqual(Int.toLong(-2147483648));
      expect(buffer.atomicLoadI32(0, 0)).assertEqual(Int.toLong(2147483647));
    });

    /**
     * @tc.name testArrayBufferAtomic0203
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_2030
     * @tc.desc Verify I32 CAS chain: MIN -> -1 -> 0 -> MAX
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI32(0, 0, -2147483648);
      let old = buffer.atomicCompareExchangeI32(0, 0, -2147483648, -1);
      expect(old).assertEqual(Int.toLong(-2147483648));
      old = buffer.atomicCompareExchangeI32(0, 0, -1, 0);
      expect(old).assertEqual(Int.toLong(-1));
      old = buffer.atomicCompareExchangeI32(0, 0, 0, 2147483647);
      expect(old).assertEqual(Int.toLong(0));
      expect(buffer.atomicLoadI32(0, 0)).assertEqual(Int.toLong(2147483647));
    });

    /**
     * @tc.name testArrayBufferAtomic0204
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_2040
     * @tc.desc Verify I32 And clears sign bit: -1 & 2147483647 = 2147483647
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI32(0, 0, -1);
      buffer.atomicAndI32(0, 0, 2147483647);
      expect(buffer.atomicLoadI32(0, 0)).assertEqual(Int.toLong(2147483647));
    });

    /**
     * @tc.name testArrayBufferAtomic0205
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_2050
     * @tc.desc Verify I32 And preserves sign bit: -1 & -2147483648 = -2147483648
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI32(0, 0, -1);
      buffer.atomicAndI32(0, 0, -2147483648);
      expect(buffer.atomicLoadI32(0, 0)).assertEqual(Int.toLong(-2147483648));
    });

    /**
     * @tc.name testArrayBufferAtomic0206
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_2060
     * @tc.desc Verify I32 store -1, U32 load returns 4294967295
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreI32(0, 0, -1);
      expect(buffer.atomicLoadU32(0, 0)).assertEqual(4294967295);
    });

    /**
     * @tc.name testArrayBufferAtomic0207
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_2070
     * @tc.desc Verify I32 + I16 non-overlapping coexistence
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(8);
      buffer.atomicStoreI32(0, 0, 1000000);
      buffer.atomicStoreI16(0, 4, Int.toShort(1000));
      expect(buffer.atomicLoadI32(0, 0)).assertEqual(Int.toLong(1000000));
      expect(buffer.atomicLoadI16(0, 4)).assertEqual(Int.toLong(1000));
    });

    /**
     * @tc.name testArrayBufferAtomic0208
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_2080
     * @tc.desc Verify resize(8) then atomicLoadI32 on new area = 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4, 8);
      buffer.resize(8);
      expect(buffer.atomicLoadI32(0, 4)).assertEqual(Int.toLong(0));
    });

    /**
     * @tc.name testArrayBufferAtomic0209
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_2090
     * @tc.desc Verify resize(8) then StoreI32 and LoadI32 on new area
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4, 8);
      buffer.resize(8);
      buffer.atomicStoreI32(0, 4, 50000);
      expect(buffer.atomicLoadI32(0, 4)).assertEqual(Int.toLong(50000));
    });

    /**
     * @tc.name testArrayBufferAtomic0210
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_2100
     * @tc.desc Verify resize(8) then AddI32 overflow on new area
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4, 8);
      buffer.resize(8);
      buffer.atomicStoreI32(0, 4, 2147483647);
      buffer.atomicAddI32(0, 4, 1);
      expect(buffer.atomicLoadI32(0, 4)).assertEqual(Int.toLong(-2147483648));
    });

    /**
     * @tc.name testArrayBufferAtomic0211
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_2110
     * @tc.desc Verify I32 overflow stability: 5 times same buffer MAX+1=MIN
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      for (let i = 0; i < 5; i++) {
        buffer.atomicStoreI32(0, 0, 2147483647);
        buffer.atomicAddI32(0, 0, 1);
        expect(buffer.atomicLoadI32(0, 0)).assertEqual(Int.toLong(-2147483648));
      }
    });

    /**
     * @tc.name testArrayBufferAtomic0212
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_2120
     * @tc.desc Verify I32 stability with new buffer each time
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 5; i++) {
        const buffer: ArrayBuffer = new ArrayBuffer(4);
        buffer.atomicStoreI32(0, 0, 1000);
        buffer.atomicAddI32(0, 0, 500);
        buffer.atomicSubI32(0, 0, 200);
        expect(buffer.atomicLoadI32(0, 0)).assertEqual(Int.toLong(1300));
      }
    });

    /**
     * @tc.name testArrayBufferAtomic0213
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_2130
     * @tc.desc Verify atomicAddU32 returns old 4294967295 (all 1s) on wrap
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU32(0, 0, -1);
      const old = buffer.atomicAddU32(0, 0, 1);
      expect(old).assertEqual(4294967295);
    });

    /**
     * @tc.name testArrayBufferAtomic0214
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_2140
     * @tc.desc Verify atomicSubU32 returns old 0 on wrap
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU32(0, 0, 0);
      const old = buffer.atomicSubU32(0, 0, 1);
      expect(old).assertEqual(Int.toLong(0));
    });

    /**
     * @tc.name testArrayBufferAtomic0215
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_2150
     * @tc.desc Verify atomicAndU32 returns old 4294967295
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU32(0, 0, -1);
      const old = buffer.atomicAndU32(0, 0, 65535);
      expect(old).assertEqual(4294967295);
    });

    /**
     * @tc.name testArrayBufferAtomic0216
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_2160
     * @tc.desc Verify atomicOrU32 returns old 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU32(0, 0, 0);
      const old = buffer.atomicOrU32(0, 0, -1);
      expect(old).assertEqual(Int.toLong(0));
    });

    /**
     * @tc.name testArrayBufferAtomic0217
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_2170
     * @tc.desc Verify atomicExchangeU32 returns old 3000000000
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU32(0, 0, -1294967296);
      const old = buffer.atomicExchangeU32(0, 0, 100);
      expect(old).assertEqual(3000000000);
    });

    /**
     * @tc.name testArrayBufferAtomic0218
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_2180
     * @tc.desc Verify all U32 operations on 4-byte buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU32(0, 0, 1000);
      expect(buffer.atomicLoadU32(0, 0)).assertEqual(Int.toLong(1000));
      let old = buffer.atomicAddU32(0, 0, 500);
      expect(old).assertEqual(Int.toLong(1000));
      expect(buffer.atomicLoadU32(0, 0)).assertEqual(Int.toLong(1500));
      old = buffer.atomicSubU32(0, 0, 500);
      expect(old).assertEqual(Int.toLong(1500));
      expect(buffer.atomicLoadU32(0, 0)).assertEqual(Int.toLong(1000));
      old = buffer.atomicAndU32(0, 0, 65535);
      expect(old).assertEqual(Int.toLong(1000));
      expect(buffer.atomicLoadU32(0, 0)).assertEqual(Int.toLong(1000));
      old = buffer.atomicOrU32(0, 0, -65536);
      expect(old).assertEqual(Int.toLong(1000));
      expect(buffer.atomicLoadU32(0, 0)).assertEqual(4294902760);
    });

    /**
     * @tc.name testArrayBufferAtomic0219
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_2190
     * @tc.desc Verify Exchange and CAS on 4-byte buffer
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU32(0, 0, 1000);
      const oldEx = buffer.atomicExchangeU32(0, 0, 2000);
      expect(oldEx).assertEqual(Int.toLong(1000));
      expect(buffer.atomicLoadU32(0, 0)).assertEqual(Int.toLong(2000));
      const oldCas = buffer.atomicCompareExchangeU32(0, 0, 2000, 3000);
      expect(oldCas).assertEqual(Int.toLong(2000));
      expect(buffer.atomicLoadU32(0, 0)).assertEqual(Int.toLong(3000));
    });

    /**
     * @tc.name testArrayBufferAtomic0220
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_2200
     * @tc.desc Verify all U32 operations on last valid addr=4 (index=0, byteOffset=4 in 8-byte buffer)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(8);
      buffer.atomicStoreU32(0, 4, -1);
      expect(buffer.atomicLoadU32(0, 4)).assertEqual(4294967295);
      let old = buffer.atomicAddU32(0, 4, 1);
      expect(old).assertEqual(4294967295);
      expect(buffer.atomicLoadU32(0, 4)).assertEqual(Int.toLong(0));
      buffer.atomicStoreU32(0, 4, -1294967296);
      old = buffer.atomicSubU32(0, 4, 1);
      expect(old).assertEqual(3000000000);
      expect(buffer.atomicLoadU32(0, 4)).assertEqual(2999999999);
      buffer.atomicStoreU32(0, 4, 100);
      old = buffer.atomicExchangeU32(0, 4, 200);
      expect(old).assertEqual(Int.toLong(100));
      expect(buffer.atomicLoadU32(0, 4)).assertEqual(Int.toLong(200));
      buffer.atomicStoreU32(0, 4, 300);
      old = buffer.atomicCompareExchangeU32(0, 4, 300, 400);
      expect(old).assertEqual(Int.toLong(300));
      expect(buffer.atomicLoadU32(0, 4)).assertEqual(Int.toLong(400));
    });

    /**
     * @tc.name testArrayBufferAtomic0221
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_2210
     * @tc.desc Verify U32 Add 4000000000 + 500000000 = 205032704 (U32 wrap)
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU32(0, 0, -294967296);
      buffer.atomicAddU32(0, 0, 500000000);
      expect(buffer.atomicLoadU32(0, 0)).assertEqual(Int.toLong(205032704));
    });

    /**
     * @tc.name testArrayBufferAtomic0222
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_2220
     * @tc.desc Verify U32 consecutive Add wrap: 4000000000+300000000+300000000 = 305032704
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0222', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU32(0, 0, -294967296);
      buffer.atomicAddU32(0, 0, 300000000);
      expect(buffer.atomicLoadU32(0, 0)).assertEqual(Int.toLong(5032704));
      buffer.atomicAddU32(0, 0, 300000000);
      expect(buffer.atomicLoadU32(0, 0)).assertEqual(Int.toLong(305032704));
    });

    /**
     * @tc.name testArrayBufferAtomic0223
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_2230
     * @tc.desc Verify U32 Sub 100 - 200 = wrap
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU32(0, 0, 100);
      buffer.atomicSubU32(0, 0, 200);
      expect(buffer.atomicLoadU32(0, 0)).assertEqual(4294967196);
    });

    /**
     * @tc.name testArrayBufferAtomic0224
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_2240
     * @tc.desc Verify U32 CAS success: Store 4000000000, CAS, Load new
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU32(0, 0, -294967296);
      const old = buffer.atomicCompareExchangeU32(0, 0, -294967296, 100);
      expect(old).assertEqual(4000000000);
      expect(buffer.atomicLoadU32(0, 0)).assertEqual(Int.toLong(100));
    });

    /**
     * @tc.name testArrayBufferAtomic0225
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_2250
     * @tc.desc Verify U32 CAS chain: 0 -> 2147483648 -> 4294967295
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0225', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU32(0, 0, 0);
      let old = buffer.atomicCompareExchangeU32(0, 0, 0, -2147483648);
      expect(old).assertEqual(Int.toLong(0));
      old = buffer.atomicCompareExchangeU32(0, 0, -2147483648, -1);
      expect(old).assertEqual(2147483648);
      expect(buffer.atomicLoadU32(0, 0)).assertEqual(4294967295);
    });

    /**
     * @tc.name testArrayBufferAtomic0226
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_2260
     * @tc.desc Verify U32 CAS retry: fail then success
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0226', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU32(0, 0, 100);
      let old = buffer.atomicCompareExchangeU32(0, 0, 99, 200);
      expect(old).assertEqual(Int.toLong(100));
      old = buffer.atomicCompareExchangeU32(0, 0, 100, 200);
      expect(old).assertEqual(Int.toLong(100));
      expect(buffer.atomicLoadU32(0, 0)).assertEqual(Int.toLong(200));
    });

    /**
     * @tc.name testArrayBufferAtomic0227
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_2270
     * @tc.desc Verify U32 And clears high bit: 4294967295 & 2147483647 = 2147483647
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0227', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU32(0, 0, -1);
      buffer.atomicAndU32(0, 0, 2147483647);
      expect(buffer.atomicLoadU32(0, 0)).assertEqual(Int.toLong(2147483647));
    });

    /**
     * @tc.name testArrayBufferAtomic0228
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_2280
     * @tc.desc Verify U32 Or sets high bit: 0 | -2147483648 = 2147483648
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0228', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU32(0, 0, 0);
      buffer.atomicOrU32(0, 0, -2147483648);
      expect(buffer.atomicLoadU32(0, 0)).assertEqual(2147483648);
    });

    /**
     * @tc.name testArrayBufferAtomic0229
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_2290
     * @tc.desc Verify U32 Xor self = 0: 2147483648 ^ 2147483648 = 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0229', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU32(0, 0, -2147483648);
      buffer.atomicXorU32(0, 0, -2147483648);
      expect(buffer.atomicLoadU32(0, 0)).assertEqual(Int.toLong(0));
    });

    /**
     * @tc.name testArrayBufferAtomic0230
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_2300
     * @tc.desc Verify U32 store 4294967295, I32 load returns -1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      buffer.atomicStoreU32(0, 0, -1);
      expect(buffer.atomicLoadI32(0, 0)).assertEqual(Int.toLong(-1));
    });

    /**
     * @tc.name testArrayBufferAtomic0231
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_2310
     * @tc.desc Verify resize(8) then atomicLoadU32 on new area = 0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0231', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4, 8);
      buffer.resize(8);
      expect(buffer.atomicLoadU32(0, 4)).assertEqual(Int.toLong(0));
    });

    /**
     * @tc.name testArrayBufferAtomic0232
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_2320
     * @tc.desc Verify resize(8) then StoreU32 and LoadU32 on new area
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0232', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4, 8);
      buffer.resize(8);
      buffer.atomicStoreU32(0, 4, -1294967296);
      expect(buffer.atomicLoadU32(0, 4)).assertEqual(3000000000);
    });

    /**
     * @tc.name testArrayBufferAtomic0233
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_2330
     * @tc.desc Verify resize(8) then AddU32 wrap on new area
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0233', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4, 8);
      buffer.resize(8);
      buffer.atomicStoreU32(0, 4, -1);
      buffer.atomicAddU32(0, 4, 1);
      expect(buffer.atomicLoadU32(0, 4)).assertEqual(Int.toLong(0));
    });

    /**
     * @tc.name testArrayBufferAtomic0234
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_2340
     * @tc.desc Verify U32 wrap stability: 5 times same buffer 4294967295+1=0
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0234', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(4);
      for (let i = 0; i < 5; i++) {
        buffer.atomicStoreU32(0, 0, -1);
        buffer.atomicAddU32(0, 0, 1);
        expect(buffer.atomicLoadU32(0, 0)).assertEqual(Int.toLong(0));
      }
    });

    /**
     * @tc.name testArrayBufferAtomic0235
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_2350
     * @tc.desc Verify U32 stability with new buffer each time
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0235', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 5; i++) {
        const buffer: ArrayBuffer = new ArrayBuffer(4);
        buffer.atomicStoreU32(0, 0, 1000);
        buffer.atomicAddU32(0, 0, 500);
        buffer.atomicSubU32(0, 0, 200);
        expect(buffer.atomicLoadU32(0, 0)).assertEqual(Int.toLong(1300));
      }
    });

    /**
     * @tc.name testArrayBufferAtomic0236
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_2360
     * @tc.desc Verify atomicAddI64 returns old MAX when overflow
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0236', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(8);
      buffer.atomicStoreI64(0, 0, 9223372036854775807);
      const old = buffer.atomicAddI64(0, 0, Int.toLong(1));
      expect(old).assertEqual(9223372036854775807);
    });

    /**
     * @tc.name testArrayBufferAtomic0237
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_2370
     * @tc.desc Verify atomicSubI64 returns old MIN when underflow
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0237', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(8);
      buffer.atomicStoreI64(0, 0, -9223372036854775807 - 1);
      const old = buffer.atomicSubI64(0, 0, Int.toLong(1));
      expect(old).assertEqual(-9223372036854775807 - 1);
    });

    /**
     * @tc.name testArrayBufferAtomic0238
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_2380
     * @tc.desc Verify atomicAndI64 returns old -1
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0238', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(8);
      buffer.atomicStoreI64(0, 0, Int.toLong(-1));
      const old = buffer.atomicAndI64(0, 0, 0x7FFFFFFFFFFFFFFF);
      expect(old).assertEqual(Int.toLong(-1));
    });

    /**
     * @tc.name testArrayBufferAtomic0239
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_2390
     * @tc.desc Verify atomicXorI64 returns old MAX
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0239', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(8);
      buffer.atomicStoreI64(0, 0, 9223372036854775807);
      const old = buffer.atomicXorI64(0, 0, Int.toLong(-1));
      expect(old).assertEqual(9223372036854775807);
    });
