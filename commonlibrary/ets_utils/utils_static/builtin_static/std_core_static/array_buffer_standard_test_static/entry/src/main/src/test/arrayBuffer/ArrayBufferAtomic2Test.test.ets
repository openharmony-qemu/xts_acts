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
