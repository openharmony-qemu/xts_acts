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

export default function arrayBufferAtomicTest(): void {
  describe('ArrayBufferAtomicTest', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.name testArrayBufferAtomic0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0100
     * @tc.desc Verify atomicStoreI8(0,0,val) then atomicLoadI8(0,0) returns 65
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.atomicStoreI8(0, 0, Int.toByte(65));
      expect(buffer.atomicLoadI8(0, 0)).assertEqual(65);
    });
    /**
     * @tc.name testArrayBufferAtomic0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0200
     * @tc.desc Verify atomicCompareExchangeI8(0,0,...) returns old 10 and updates cell to 20
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.atomicStoreI8(0, 0, Int.toByte(10));
      const old = buffer.atomicCompareExchangeI8(0, 0, Int.toByte(10), Int.toByte(20));
      expect(old).assertEqual(10);
      expect(buffer.atomicLoadI8(0, 0)).assertEqual(20);
    });
    /**
     * @tc.name testArrayBufferAtomic0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0300
     * @tc.desc Verify atomicCompareExchangeI8(0,0,...) returns old 10 and leaves cell at 10
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.atomicStoreI8(0, 0, Int.toByte(10));
      const old = buffer.atomicCompareExchangeI8(0, 0, Int.toByte(99), Int.toByte(20));
      expect(old).assertEqual(10);
      expect(buffer.atomicLoadI8(0, 0)).assertEqual(10);
    });
    /**
     * @tc.name testArrayBufferAtomic0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0400
     * @tc.desc Verify atomicAddI8(0,0,...) returns old 10 and updates cell to 15
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.atomicStoreI8(0, 0, Int.toByte(10));
      const old = buffer.atomicAddI8(0, 0, Int.toByte(5));
      expect(old).assertEqual(10);
      expect(buffer.atomicLoadI8(0, 0)).assertEqual(15);
    });
    /**
     * @tc.name testArrayBufferAtomic0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0500
     * @tc.desc Verify atomicSubI8(0,0,...) returns old 20 and updates cell to 17
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.atomicStoreI8(0, 0, Int.toByte(20));
      const old = buffer.atomicSubI8(0, 0, Int.toByte(3));
      expect(old).assertEqual(20);
      expect(buffer.atomicLoadI8(0, 0)).assertEqual(17);
    });
    /**
     * @tc.name testArrayBufferAtomic0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0600
     * @tc.desc Verify atomicAndI8(0,0,...) returns old 15 and updates cell to 7
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.atomicStoreI8(0, 0, Int.toByte(15));
      const old = buffer.atomicAndI8(0, 0, Int.toByte(7));
      expect(old).assertEqual(15);
      expect(buffer.atomicLoadI8(0, 0)).assertEqual(7);
    });
    /**
     * @tc.name testArrayBufferAtomic0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0700
     * @tc.desc Verify atomicOrI8(0,0,...) returns old 8 and updates cell to 9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.atomicStoreI8(0, 0, Int.toByte(8));
      const old = buffer.atomicOrI8(0, 0, Int.toByte(1));
      expect(old).assertEqual(8);
      expect(buffer.atomicLoadI8(0, 0)).assertEqual(9);
    });
    /**
     * @tc.name testArrayBufferAtomic0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0800
     * @tc.desc Verify atomicXorI8(0,0,...) returns old 10 and updates cell to 9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.atomicStoreI8(0, 0, Int.toByte(10));
      const old = buffer.atomicXorI8(0, 0, Int.toByte(3));
      expect(old).assertEqual(10);
      expect(buffer.atomicLoadI8(0, 0)).assertEqual(9);
    });
    /**
     * @tc.name testArrayBufferAtomic0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_0900
     * @tc.desc Verify atomicExchangeI8(0,0,...) returns old 5 and replaces cell with 50
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.atomicStoreI8(0, 0, Int.toByte(5));
      const old = buffer.atomicExchangeI8(0, 0, Int.toByte(50));
      expect(old).assertEqual(5);
      expect(buffer.atomicLoadI8(0, 0)).assertEqual(50);
    });
    /**
     * @tc.name testArrayBufferAtomic0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1000
     * @tc.desc Verify atomicStoreI16(0,0,val) then atomicLoadI16(0,0) returns 1000
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      buffer.atomicStoreI16(0, 0, Int.toShort(1000));
      expect(buffer.atomicLoadI16(0, 0)).assertEqual(1000);
    });
    /**
     * @tc.name testArrayBufferAtomic0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1100
     * @tc.desc Verify atomicCompareExchangeI16(0,0,...) returns old 10 and updates cell to 20
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      buffer.atomicStoreI16(0, 0, Int.toShort(10));
      const old = buffer.atomicCompareExchangeI16(0, 0, Int.toShort(10), Int.toShort(20));
      expect(old).assertEqual(10);
      expect(buffer.atomicLoadI16(0, 0)).assertEqual(20);
    });
    /**
     * @tc.name testArrayBufferAtomic0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1200
     * @tc.desc Verify atomicCompareExchangeI16(0,0,...) returns old 10 and leaves cell at 10
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      buffer.atomicStoreI16(0, 0, Int.toShort(10));
      const old = buffer.atomicCompareExchangeI16(0, 0, Int.toShort(99), Int.toShort(20));
      expect(old).assertEqual(10);
      expect(buffer.atomicLoadI16(0, 0)).assertEqual(10);
    });
    /**
     * @tc.name testArrayBufferAtomic0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1300
     * @tc.desc Verify atomicAddI16(0,0,...) returns old 10 and updates cell to 15
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      buffer.atomicStoreI16(0, 0, Int.toShort(10));
      const old = buffer.atomicAddI16(0, 0, Int.toShort(5));
      expect(old).assertEqual(10);
      expect(buffer.atomicLoadI16(0, 0)).assertEqual(15);
    });
    /**
     * @tc.name testArrayBufferAtomic0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1400
     * @tc.desc Verify atomicSubI16(0,0,...) returns old 20 and updates cell to 17
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      buffer.atomicStoreI16(0, 0, Int.toShort(20));
      const old = buffer.atomicSubI16(0, 0, Int.toShort(3));
      expect(old).assertEqual(20);
      expect(buffer.atomicLoadI16(0, 0)).assertEqual(17);
    });
    /**
     * @tc.name testArrayBufferAtomic0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1500
     * @tc.desc Verify atomicAndI16(0,0,...) returns old 15 and updates cell to 7
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      buffer.atomicStoreI16(0, 0, Int.toShort(15));
      const old = buffer.atomicAndI16(0, 0, Int.toShort(7));
      expect(old).assertEqual(15);
      expect(buffer.atomicLoadI16(0, 0)).assertEqual(7);
    });
    /**
     * @tc.name testArrayBufferAtomic0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1600
     * @tc.desc Verify atomicOrI16(0,0,...) returns old 8 and updates cell to 9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      buffer.atomicStoreI16(0, 0, Int.toShort(8));
      const old = buffer.atomicOrI16(0, 0, Int.toShort(1));
      expect(old).assertEqual(8);
      expect(buffer.atomicLoadI16(0, 0)).assertEqual(9);
    });
    /**
     * @tc.name testArrayBufferAtomic0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1700
     * @tc.desc Verify atomicXorI16(0,0,...) returns old 10 and updates cell to 9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      buffer.atomicStoreI16(0, 0, Int.toShort(10));
      const old = buffer.atomicXorI16(0, 0, Int.toShort(3));
      expect(old).assertEqual(10);
      expect(buffer.atomicLoadI16(0, 0)).assertEqual(9);
    });
    /**
     * @tc.name testArrayBufferAtomic0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1800
     * @tc.desc Verify atomicExchangeI16(0,0,...) returns old 5 and replaces cell with 50
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      buffer.atomicStoreI16(0, 0, Int.toShort(5));
      const old = buffer.atomicExchangeI16(0, 0, Int.toShort(50));
      expect(old).assertEqual(5);
      expect(buffer.atomicLoadI16(0, 0)).assertEqual(50);
    });
    /**
     * @tc.name testArrayBufferAtomic0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_1900
     * @tc.desc Verify atomicStoreI32(0,0,val) then atomicLoadI32(0,0) returns 41
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      buffer.atomicStoreI32(0, 0, 41);
      expect(buffer.atomicLoadI32(0, 0)).assertEqual(41);
    });
    /**
     * @tc.name testArrayBufferAtomic0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_2000
     * @tc.desc Verify atomicCompareExchangeI32(0,0,...) returns old 10 and updates cell to 20
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      buffer.atomicStoreI32(0, 0, 10);
      const old = buffer.atomicCompareExchangeI32(0, 0, 10, 20);
      expect(old).assertEqual(10);
      expect(buffer.atomicLoadI32(0, 0)).assertEqual(20);
    });
    /**
     * @tc.name testArrayBufferAtomic0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_2100
     * @tc.desc Verify atomicCompareExchangeI32(0,0,...) returns old 10 and leaves cell at 10
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      buffer.atomicStoreI32(0, 0, 10);
      const old = buffer.atomicCompareExchangeI32(0, 0, 99, 20);
      expect(old).assertEqual(10);
      expect(buffer.atomicLoadI32(0, 0)).assertEqual(10);
    });
    /**
     * @tc.name testArrayBufferAtomic0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_2200
     * @tc.desc Verify atomicAddI32(0,0,...) returns old 41 and updates cell to 42
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      buffer.atomicStoreI32(0, 0, 41);
      const old = buffer.atomicAddI32(0, 0, 1);
      expect(old).assertEqual(41);
      expect(buffer.atomicLoadI32(0, 0)).assertEqual(42);
    });
    /**
     * @tc.name testArrayBufferAtomic0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_2300
     * @tc.desc Verify atomicSubI32(0,0,...) returns old 20 and updates cell to 17
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      buffer.atomicStoreI32(0, 0, 20);
      const old = buffer.atomicSubI32(0, 0, 3);
      expect(old).assertEqual(20);
      expect(buffer.atomicLoadI32(0, 0)).assertEqual(17);
    });
    /**
     * @tc.name testArrayBufferAtomic0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_2400
     * @tc.desc Verify atomicAndI32(0,0,...) returns old 15 and updates cell to 7
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      buffer.atomicStoreI32(0, 0, 15);
      const old = buffer.atomicAndI32(0, 0, 7);
      expect(old).assertEqual(15);
      expect(buffer.atomicLoadI32(0, 0)).assertEqual(7);
    });
    /**
     * @tc.name testArrayBufferAtomic0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_2500
     * @tc.desc Verify atomicOrI32(0,0,...) returns old 8 and updates cell to 9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      buffer.atomicStoreI32(0, 0, 8);
      const old = buffer.atomicOrI32(0, 0, 1);
      expect(old).assertEqual(8);
      expect(buffer.atomicLoadI32(0, 0)).assertEqual(9);
    });
    /**
     * @tc.name testArrayBufferAtomic0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_2600
     * @tc.desc Verify atomicXorI32(0,0,...) returns old 10 and updates cell to 9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      buffer.atomicStoreI32(0, 0, 10);
      const old = buffer.atomicXorI32(0, 0, 3);
      expect(old).assertEqual(10);
      expect(buffer.atomicLoadI32(0, 0)).assertEqual(9);
    });
    /**
     * @tc.name testArrayBufferAtomic0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_2700
     * @tc.desc Verify atomicExchangeI32(0,0,...) returns old 5 and replaces cell with 50
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      buffer.atomicStoreI32(0, 0, 5);
      const old = buffer.atomicExchangeI32(0, 0, 50);
      expect(old).assertEqual(5);
      expect(buffer.atomicLoadI32(0, 0)).assertEqual(50);
    });
    /**
     * @tc.name testArrayBufferAtomic0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_2800
     * @tc.desc Verify atomicStoreI64(0,0,val) then atomicLoadI64(0,0) returns 42
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      buffer.atomicStoreI64(0, 0, Int.toLong(42));
      expect(buffer.atomicLoadI64(0, 0)).assertEqual(42);
    });
    /**
     * @tc.name testArrayBufferAtomic0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_2900
     * @tc.desc Verify atomicCompareExchangeI64(0,0,...) returns old 10 and updates cell to 20
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      buffer.atomicStoreI64(0, 0, Int.toLong(10));
      const old = buffer.atomicCompareExchangeI64(0, 0, Int.toLong(10), Int.toLong(20));
      expect(old).assertEqual(10);
      expect(buffer.atomicLoadI64(0, 0)).assertEqual(20);
    });
    /**
     * @tc.name testArrayBufferAtomic0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_3000
     * @tc.desc Verify atomicCompareExchangeI64(0,0,...) returns old 10 and leaves cell at 10
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      buffer.atomicStoreI64(0, 0, Int.toLong(10));
      const old = buffer.atomicCompareExchangeI64(0, 0, Int.toLong(99), Int.toLong(20));
      expect(old).assertEqual(10);
      expect(buffer.atomicLoadI64(0, 0)).assertEqual(10);
    });
    /**
     * @tc.name testArrayBufferAtomic0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_3100
     * @tc.desc Verify atomicAddI64(0,0,...) returns old 10 and updates cell to 15
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      buffer.atomicStoreI64(0, 0, Int.toLong(10));
      const old = buffer.atomicAddI64(0, 0, Int.toLong(5));
      expect(old).assertEqual(10);
      expect(buffer.atomicLoadI64(0, 0)).assertEqual(15);
    });
    /**
     * @tc.name testArrayBufferAtomic0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_3200
     * @tc.desc Verify atomicSubI64(0,0,...) returns old 20 and updates cell to 17
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      buffer.atomicStoreI64(0, 0, Int.toLong(20));
      const old = buffer.atomicSubI64(0, 0, Int.toLong(3));
      expect(old).assertEqual(20);
      expect(buffer.atomicLoadI64(0, 0)).assertEqual(17);
    });
    /**
     * @tc.name testArrayBufferAtomic0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_3300
     * @tc.desc Verify atomicAndI64(0,0,...) returns old 15 and updates cell to 7
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      buffer.atomicStoreI64(0, 0, Int.toLong(15));
      const old = buffer.atomicAndI64(0, 0, Int.toLong(7));
      expect(old).assertEqual(15);
      expect(buffer.atomicLoadI64(0, 0)).assertEqual(7);
    });
    /**
     * @tc.name testArrayBufferAtomic0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_3400
     * @tc.desc Verify atomicOrI64(0,0,...) returns old 8 and updates cell to 9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      buffer.atomicStoreI64(0, 0, Int.toLong(8));
      const old = buffer.atomicOrI64(0, 0, Int.toLong(1));
      expect(old).assertEqual(8);
      expect(buffer.atomicLoadI64(0, 0)).assertEqual(9);
    });
    /**
     * @tc.name testArrayBufferAtomic0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_3500
     * @tc.desc Verify atomicXorI64(0,0,...) returns old 10 and updates cell to 9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      buffer.atomicStoreI64(0, 0, Int.toLong(10));
      const old = buffer.atomicXorI64(0, 0, Int.toLong(3));
      expect(old).assertEqual(10);
      expect(buffer.atomicLoadI64(0, 0)).assertEqual(9);
    });
    /**
     * @tc.name testArrayBufferAtomic0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_3600
     * @tc.desc Verify atomicExchangeI64(0,0,...) returns old 5 and replaces cell with 50
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      buffer.atomicStoreI64(0, 0, Int.toLong(5));
      const old = buffer.atomicExchangeI64(0, 0, Int.toLong(50));
      expect(old).assertEqual(5);
      expect(buffer.atomicLoadI64(0, 0)).assertEqual(50);
    });
    /**
     * @tc.name testArrayBufferAtomic0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_3700
     * @tc.desc Verify atomicStoreU8(1,1,200) then atomicLoadU8(1,1) returns 200
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.atomicStoreU8(1, 1, Int.toByte(200));
      expect(buffer.atomicLoadU8(1, 1)).assertEqual(200);
    });
    /**
     * @tc.name testArrayBufferAtomic0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_3800
     * @tc.desc Verify atomicCompareExchangeU8(0,0,...) returns old 10 and updates cell to 20
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.atomicStoreU8(0, 0, Int.toByte(10));
      const old = buffer.atomicCompareExchangeU8(0, 0, Int.toByte(10), Int.toByte(20));
      expect(old).assertEqual(10);
      expect(buffer.atomicLoadU8(0, 0)).assertEqual(20);
    });
    /**
     * @tc.name testArrayBufferAtomic0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_3900
     * @tc.desc Verify atomicCompareExchangeU8(0,0,...) returns old 10 and leaves cell at 10
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.atomicStoreU8(0, 0, Int.toByte(10));
      const old = buffer.atomicCompareExchangeU8(0, 0, Int.toByte(99), Int.toByte(20));
      expect(old).assertEqual(10);
      expect(buffer.atomicLoadU8(0, 0)).assertEqual(10);
    });
    /**
     * @tc.name testArrayBufferAtomic0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_4000
     * @tc.desc Verify atomicAddU8(0,0,...) returns old 10 and updates cell to 15
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.atomicStoreU8(0, 0, Int.toByte(10));
      const old = buffer.atomicAddU8(0, 0, Int.toByte(5));
      expect(old).assertEqual(10);
      expect(buffer.atomicLoadU8(0, 0)).assertEqual(15);
    });
    /**
     * @tc.name testArrayBufferAtomic0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_4100
     * @tc.desc Verify atomicSubU8(0,0,...) returns old 20 and updates cell to 17
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.atomicStoreU8(0, 0, Int.toByte(20));
      const old = buffer.atomicSubU8(0, 0, Int.toByte(3));
      expect(old).assertEqual(20);
      expect(buffer.atomicLoadU8(0, 0)).assertEqual(17);
    });
    /**
     * @tc.name testArrayBufferAtomic0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_4200
     * @tc.desc Verify atomicAndU8(0,0,...) returns old 15 and updates cell to 7
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.atomicStoreU8(0, 0, Int.toByte(15));
      const old = buffer.atomicAndU8(0, 0, Int.toByte(7));
      expect(old).assertEqual(15);
      expect(buffer.atomicLoadU8(0, 0)).assertEqual(7);
    });
    /**
     * @tc.name testArrayBufferAtomic0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_4300
     * @tc.desc Verify atomicOrU8(0,0,...) returns old 8 and updates cell to 9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.atomicStoreU8(0, 0, Int.toByte(8));
      const old = buffer.atomicOrU8(0, 0, Int.toByte(1));
      expect(old).assertEqual(8);
      expect(buffer.atomicLoadU8(0, 0)).assertEqual(9);
    });
    /**
     * @tc.name testArrayBufferAtomic0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_4400
     * @tc.desc Verify atomicXorU8(0,0,...) returns old 10 and updates cell to 9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.atomicStoreU8(0, 0, Int.toByte(10));
      const old = buffer.atomicXorU8(0, 0, Int.toByte(3));
      expect(old).assertEqual(10);
      expect(buffer.atomicLoadU8(0, 0)).assertEqual(9);
    });
    /**
     * @tc.name testArrayBufferAtomic0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_4500
     * @tc.desc Verify atomicExchangeU8(0,0,...) returns old 5 and replaces cell with 50
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(4);
      buffer.atomicStoreU8(0, 0, Int.toByte(5));
      const old = buffer.atomicExchangeU8(0, 0, Int.toByte(50));
      expect(old).assertEqual(5);
      expect(buffer.atomicLoadU8(0, 0)).assertEqual(50);
    });
    /**
     * @tc.name testArrayBufferAtomic0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_4600
     * @tc.desc Verify atomicStoreU16(0,0,val) then atomicLoadU16(0,0) returns 500
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      buffer.atomicStoreU16(0, 0, Int.toShort(500));
      expect(buffer.atomicLoadU16(0, 0)).assertEqual(500);
    });
    /**
     * @tc.name testArrayBufferAtomic0047
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_4700
     * @tc.desc Verify atomicCompareExchangeU16(0,0,...) returns old 10 and updates cell to 20
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      buffer.atomicStoreU16(0, 0, Int.toShort(10));
      const old = buffer.atomicCompareExchangeU16(0, 0, Int.toShort(10), Int.toShort(20));
      expect(old).assertEqual(10);
      expect(buffer.atomicLoadU16(0, 0)).assertEqual(20);
    });
    /**
     * @tc.name testArrayBufferAtomic0048
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_4800
     * @tc.desc Verify atomicCompareExchangeU16(0,0,...) returns old 10 and leaves cell at 10
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      buffer.atomicStoreU16(0, 0, Int.toShort(10));
      const old = buffer.atomicCompareExchangeU16(0, 0, Int.toShort(99), Int.toShort(20));
      expect(old).assertEqual(10);
      expect(buffer.atomicLoadU16(0, 0)).assertEqual(10);
    });
    /**
     * @tc.name testArrayBufferAtomic0049
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_4900
     * @tc.desc Verify atomicAddU16(0,0,...) returns old 10 and updates cell to 15
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      buffer.atomicStoreU16(0, 0, Int.toShort(10));
      const old = buffer.atomicAddU16(0, 0, Int.toShort(5));
      expect(old).assertEqual(10);
      expect(buffer.atomicLoadU16(0, 0)).assertEqual(15);
    });
    /**
     * @tc.name testArrayBufferAtomic0050
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_5000
     * @tc.desc Verify atomicSubU16(0,0,...) returns old 20 and updates cell to 17
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      buffer.atomicStoreU16(0, 0, Int.toShort(20));
      const old = buffer.atomicSubU16(0, 0, Int.toShort(3));
      expect(old).assertEqual(20);
      expect(buffer.atomicLoadU16(0, 0)).assertEqual(17);
    });
    /**
     * @tc.name testArrayBufferAtomic0051
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_5100
     * @tc.desc Verify atomicAndU16(0,0,...) returns old 15 and updates cell to 7
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      buffer.atomicStoreU16(0, 0, Int.toShort(15));
      const old = buffer.atomicAndU16(0, 0, Int.toShort(7));
      expect(old).assertEqual(15);
      expect(buffer.atomicLoadU16(0, 0)).assertEqual(7);
    });
    /**
     * @tc.name testArrayBufferAtomic0052
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_5200
     * @tc.desc Verify atomicOrU16(0,0,...) returns old 8 and updates cell to 9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      buffer.atomicStoreU16(0, 0, Int.toShort(8));
      const old = buffer.atomicOrU16(0, 0, Int.toShort(1));
      expect(old).assertEqual(8);
      expect(buffer.atomicLoadU16(0, 0)).assertEqual(9);
    });
    /**
     * @tc.name testArrayBufferAtomic0053
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_5300
     * @tc.desc Verify atomicXorU16(0,0,...) returns old 10 and updates cell to 9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      buffer.atomicStoreU16(0, 0, Int.toShort(10));
      const old = buffer.atomicXorU16(0, 0, Int.toShort(3));
      expect(old).assertEqual(10);
      expect(buffer.atomicLoadU16(0, 0)).assertEqual(9);
    });
    /**
     * @tc.name testArrayBufferAtomic0054
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_5400
     * @tc.desc Verify atomicExchangeU16(0,0,...) returns old 5 and replaces cell with 50
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      buffer.atomicStoreU16(0, 0, Int.toShort(5));
      const old = buffer.atomicExchangeU16(0, 0, Int.toShort(50));
      expect(old).assertEqual(5);
      expect(buffer.atomicLoadU16(0, 0)).assertEqual(50);
    });
    /**
     * @tc.name testArrayBufferAtomic0055
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_5500
     * @tc.desc Verify atomicStoreU32(0,0,val) then atomicLoadU32(0,0) returns 41
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      buffer.atomicStoreU32(0, 0, 41);
      expect(buffer.atomicLoadU32(0, 0)).assertEqual(41);
    });
    /**
     * @tc.name testArrayBufferAtomic0056
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_5600
     * @tc.desc Verify atomicCompareExchangeU32(0,0,...) returns old 10 and updates cell to 20
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      buffer.atomicStoreU32(0, 0, 10);
      const old = buffer.atomicCompareExchangeU32(0, 0, 10, 20);
      expect(old).assertEqual(10);
      expect(buffer.atomicLoadU32(0, 0)).assertEqual(20);
    });
    /**
     * @tc.name testArrayBufferAtomic0057
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_5700
     * @tc.desc Verify atomicCompareExchangeU32(0,0,...) returns old 10 and leaves cell at 10
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      buffer.atomicStoreU32(0, 0, 10);
      const old = buffer.atomicCompareExchangeU32(0, 0, 99, 20);
      expect(old).assertEqual(10);
      expect(buffer.atomicLoadU32(0, 0)).assertEqual(10);
    });
    /**
     * @tc.name testArrayBufferAtomic0058
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_5800
     * @tc.desc Verify atomicAddU32(0,0,...) returns old 10 and updates cell to 15
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      buffer.atomicStoreU32(0, 0, 10);
      const old = buffer.atomicAddU32(0, 0, 5);
      expect(old).assertEqual(10);
      expect(buffer.atomicLoadU32(0, 0)).assertEqual(15);
    });
    /**
     * @tc.name testArrayBufferAtomic0059
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_5900
     * @tc.desc Verify atomicSubU32(0,0,...) returns old 20 and updates cell to 17
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      buffer.atomicStoreU32(0, 0, 20);
      const old = buffer.atomicSubU32(0, 0, 3);
      expect(old).assertEqual(20);
      expect(buffer.atomicLoadU32(0, 0)).assertEqual(17);
    });
    /**
     * @tc.name testArrayBufferAtomic0060
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_6000
     * @tc.desc Verify atomicAndU32(0,0,...) returns old 15 and updates cell to 7
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      buffer.atomicStoreU32(0, 0, 15);
      const old = buffer.atomicAndU32(0, 0, 7);
      expect(old).assertEqual(15);
      expect(buffer.atomicLoadU32(0, 0)).assertEqual(7);
    });
    /**
     * @tc.name testArrayBufferAtomic0061
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_6100
     * @tc.desc Verify atomicOrU32(0,0,...) returns old 8 and updates cell to 9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      buffer.atomicStoreU32(0, 0, 8);
      const old = buffer.atomicOrU32(0, 0, 1);
      expect(old).assertEqual(8);
      expect(buffer.atomicLoadU32(0, 0)).assertEqual(9);
    });
    /**
     * @tc.name testArrayBufferAtomic0062
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_6200
     * @tc.desc Verify atomicXorU32(0,0,...) returns old 10 and updates cell to 9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      buffer.atomicStoreU32(0, 0, 10);
      const old = buffer.atomicXorU32(0, 0, 3);
      expect(old).assertEqual(10);
      expect(buffer.atomicLoadU32(0, 0)).assertEqual(9);
    });
    /**
     * @tc.name testArrayBufferAtomic0063
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_6300
     * @tc.desc Verify atomicExchangeU32(0,0,...) returns old 5 and replaces cell with 50
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      buffer.atomicStoreU32(0, 0, 5);
      const old = buffer.atomicExchangeU32(0, 0, 50);
      expect(old).assertEqual(5);
      expect(buffer.atomicLoadU32(0, 0)).assertEqual(50);
    });
    /**
     * @tc.name testArrayBufferAtomic0064
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_6400
     * @tc.desc Verify atomicStoreU64(0,0,val) then atomicLoadU64(0,0) returns 42
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      buffer.atomicStoreU64(0, 0, Int.toLong(42));
      expect(buffer.atomicLoadU64(0, 0)).assertEqual(42);
    });
    /**
     * @tc.name testArrayBufferAtomic0065
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_6500
     * @tc.desc Verify atomicCompareExchangeU64(0,0,...) returns old 10 and updates cell to 20
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      buffer.atomicStoreU64(0, 0, Int.toLong(10));
      const old = buffer.atomicCompareExchangeU64(0, 0, Int.toLong(10), Int.toLong(20));
      expect(old).assertEqual(10);
      expect(buffer.atomicLoadU64(0, 0)).assertEqual(20);
    });
    /**
     * @tc.name testArrayBufferAtomic0066
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_6600
     * @tc.desc Verify atomicCompareExchangeU64(0,0,...) returns old 10 and leaves cell at 10
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      buffer.atomicStoreU64(0, 0, Int.toLong(10));
      const old = buffer.atomicCompareExchangeU64(0, 0, Int.toLong(99), Int.toLong(20));
      expect(old).assertEqual(10);
      expect(buffer.atomicLoadU64(0, 0)).assertEqual(10);
    });
    /**
     * @tc.name testArrayBufferAtomic0067
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_6700
     * @tc.desc Verify atomicAddU64(0,0,...) returns old 10 and updates cell to 15
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      buffer.atomicStoreU64(0, 0, Int.toLong(10));
      const old = buffer.atomicAddU64(0, 0, Int.toLong(5));
      expect(old).assertEqual(10);
      expect(buffer.atomicLoadU64(0, 0)).assertEqual(15);
    });
    /**
     * @tc.name testArrayBufferAtomic0068
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_6800
     * @tc.desc Verify atomicSubU64(0,0,...) returns old 20 and updates cell to 17
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      buffer.atomicStoreU64(0, 0, Int.toLong(20));
      const old = buffer.atomicSubU64(0, 0, Int.toLong(3));
      expect(old).assertEqual(20);
      expect(buffer.atomicLoadU64(0, 0)).assertEqual(17);
    });
    /**
     * @tc.name testArrayBufferAtomic0069
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_6900
     * @tc.desc Verify atomicAndU64(0,0,...) returns old 15 and updates cell to 7
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      buffer.atomicStoreU64(0, 0, Int.toLong(15));
      const old = buffer.atomicAndU64(0, 0, Int.toLong(7));
      expect(old).assertEqual(15);
      expect(buffer.atomicLoadU64(0, 0)).assertEqual(7);
    });
    /**
     * @tc.name testArrayBufferAtomic0070
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_7000
     * @tc.desc Verify atomicOrU64(0,0,...) returns old 8 and updates cell to 9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      buffer.atomicStoreU64(0, 0, Int.toLong(8));
      const old = buffer.atomicOrU64(0, 0, Int.toLong(1));
      expect(old).assertEqual(8);
      expect(buffer.atomicLoadU64(0, 0)).assertEqual(9);
    });
    /**
     * @tc.name testArrayBufferAtomic0071
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_7100
     * @tc.desc Verify atomicXorU64(0,0,...) returns old 10 and updates cell to 9
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      buffer.atomicStoreU64(0, 0, Int.toLong(10));
      const old = buffer.atomicXorU64(0, 0, Int.toLong(3));
      expect(old).assertEqual(10);
      expect(buffer.atomicLoadU64(0, 0)).assertEqual(9);
    });
    /**
     * @tc.name testArrayBufferAtomic0072
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_ATOMIC_7200
     * @tc.desc Verify atomicExchangeU64(0,0,...) returns old 5 and replaces cell with 50
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAtomic0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(8);
      buffer.atomicStoreU64(0, 0, Int.toLong(5));
      const old = buffer.atomicExchangeU64(0, 0, Int.toLong(50));
      expect(old).assertEqual(5);
      expect(buffer.atomicLoadU64(0, 0)).assertEqual(50);
    });
  });
}
