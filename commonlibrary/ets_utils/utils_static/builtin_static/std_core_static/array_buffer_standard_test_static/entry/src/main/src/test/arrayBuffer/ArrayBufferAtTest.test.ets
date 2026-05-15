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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function arrayBufferAtTest(): void {
  describe('ArrayBufferAtTest', (): void => {
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
     * @tc.name testArrayBufferAt0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_0100
     * @tc.desc Verify ArrayBuffer.at(pos) reads one byte at index pos per ArkTS-sta (signature and example in arkts-sta-array-buffer.md).
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(3)
      buffer.set(0, 65 as byte)
      buffer.set(1, 66 as byte)
      buffer.set(2, 67 as byte)
      let result = buffer.at(0)
      expect(result).assertEqual(65 as byte)
    });

    /**
     * @tc.name testArrayBufferAt0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_0200
     * @tc.desc Mindmap ArrayBuffer_at §1.1.2: buffer.at() with zero args is compile-time rejected; executable case covers §1.2.1 pos=0 read after set (STA requires at(pos: int)).
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(3)
      buffer.set(0, 65 as byte)
      expect(buffer.at(0)).assertEqual(65 as byte)
    });

    /**
     * @tc.name testArrayBufferAt0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_0300
     * @tc.desc Mindmap ArrayBuffer_at §1.1.3: two-arg at is compile-time rejected; executable case verifies single-arg at(1) after set on a length-3 buffer.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(3)
      buffer.set(1, 66 as byte)
      expect(buffer.at(1)).assertEqual(66 as byte)
    });

    /**
     * @tc.name testArrayBufferAt0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_0400
     * @tc.desc Mindmap ArrayBuffer_at §1.1.4: three-arg at is compile-time rejected; executable case verifies single-arg at(byteLength-1) after set on a length-3 buffer (§1.2.3).
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(3)
      buffer.set(2, 67 as byte)
      expect(buffer.at(2)).assertEqual(67 as byte)
    });

    /**
     * @tc.name testArrayBufferAt0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_0500
     * @tc.desc Verify pos 0 reads the first byte.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(3)
      buffer.set(0, 65 as byte)
      buffer.set(1, 66 as byte)
      buffer.set(2, 67 as byte)
      let result = buffer.at(0)
      expect(result).assertEqual(65 as byte)
    });

    /**
     * @tc.name testArrayBufferAt0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_0600
     * @tc.desc Verify pos at middle index returns the byte at that offset.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(5)
      buffer.set(0, 10 as byte)
      buffer.set(1, 20 as byte)
      buffer.set(2, 30 as byte)
      buffer.set(3, 40 as byte)
      buffer.set(4, 50 as byte)
      let result = buffer.at(2)
      expect(result).assertEqual(30 as byte)
    });

    /**
     * @tc.name testArrayBufferAt0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_0700
     * @tc.desc Verify pos byteLength minus one reads the last byte.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(4)
      buffer.set(0, 10 as byte)
      buffer.set(1, 20 as byte)
      buffer.set(2, 30 as byte)
      buffer.set(3, 40 as byte)
      let result = buffer.at(3)
      expect(result).assertEqual(40 as byte)
    });

    /**
     * @tc.name testArrayBufferAt0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_0800
     * @tc.desc Verify pos less than 0 throws IndexOutOfBoundsError as specified for ArrayBuffer.at in arkts-sta-array-buffer.md.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(4)
      buffer.set(0, 10 as byte)
      try {
        buffer.at(-1)
        expect(true).assertFail()
      } catch (e) {
        expect(e instanceof IndexOutOfBoundsError).assertTrue()
      }
    });

    /**
     * @tc.name testArrayBufferAt0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_0900
     * @tc.desc Verify large negative pos throws IndexOutOfBoundsError.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(4)
      try {
        buffer.at(-100)
        expect(true).assertFail()
      } catch (e) {
        expect(e instanceof IndexOutOfBoundsError).assertTrue()
      }
    });

    /**
     * @tc.name testArrayBufferAt0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_1000
     * @tc.desc Verify pos equal to byteLength throws IndexOutOfBoundsError.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(4)
      buffer.set(0, 10 as byte)
      try {
        buffer.at(4)
        expect(true).assertFail()
      } catch (e) {
        expect(e instanceof IndexOutOfBoundsError).assertTrue()
      }
    });

    /**
     * @tc.name testArrayBufferAt0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_1100
     * @tc.desc Verify pos greater than byteLength throws IndexOutOfBoundsError.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(4)
      try {
        buffer.at(100)
        expect(true).assertFail()
      } catch (e) {
        expect(e instanceof IndexOutOfBoundsError).assertTrue()
      }
    });

    /**
     * @tc.name testArrayBufferAt0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_1200
     * @tc.desc Verify pos int max throws IndexOutOfBoundsError on small buffer.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(4)
      let posMax: int = 2147483647
      try {
        buffer.at(posMax)
        expect(true).assertFail()
      } catch (e) {
        expect(e instanceof IndexOutOfBoundsError).assertTrue()
      }
    });

    /**
     * @tc.name testArrayBufferAt0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_1300
     * @tc.desc Verify byteLength 1 buffer throws when pos equals byteLength.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(1)
      buffer.set(0, 42 as byte)
      try {
        buffer.at(1)
        expect(true).assertFail()
      } catch (e) {
        expect(e instanceof IndexOutOfBoundsError).assertTrue()
      }
    });

    /**
     * @tc.name testArrayBufferAt0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_1400
     * @tc.desc Verify reads after set match written bytes at each index.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(3)
      buffer.set(0, 65 as byte)
      buffer.set(1, 66 as byte)
      buffer.set(2, 67 as byte)
      expect(buffer.at(0)).assertEqual(65 as byte)
      expect(buffer.at(1)).assertEqual(66 as byte)
      expect(buffer.at(2)).assertEqual(67 as byte)
    });

    /**
     * @tc.name testArrayBufferAt0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_1500
     * @tc.desc Verify unset bytes read as zero.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(4)
      let result = buffer.at(0)
      expect(result).assertEqual(0 as byte)
    });

    /**
     * @tc.name testArrayBufferAt0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_1600
     * @tc.desc Verify mixed set and unset positions read expected bytes including zeros.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(4)
      buffer.set(0, 10 as byte)
      buffer.set(2, 30 as byte)
      expect(buffer.at(0)).assertEqual(10 as byte)
      expect(buffer.at(1)).assertEqual(0 as byte)
      expect(buffer.at(2)).assertEqual(30 as byte)
      expect(buffer.at(3)).assertEqual(0 as byte)
    });

    /**
     * @tc.name testArrayBufferAt0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_1700
     * @tc.desc Verify value updates after set and repeated at reads.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(2)
      buffer.set(0, 10 as byte)
      expect(buffer.at(0)).assertEqual(10 as byte)
      buffer.set(0, 99 as byte)
      expect(buffer.at(0)).assertEqual(99 as byte)
    });

    /**
     * @tc.name testArrayBufferAt0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_1800
     * @tc.desc Verify repeated at on same index returns the same byte.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(2)
      buffer.set(0, 42 as byte)
      let r1 = buffer.at(0)
      let r2 = buffer.at(0)
      let r3 = buffer.at(0)
      expect(r1).assertEqual(42 as byte)
      expect(r2).assertEqual(42 as byte)
      expect(r3).assertEqual(42 as byte)
    });

    /**
     * @tc.name testArrayBufferAt0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_1900
     * @tc.desc Verify byte max 127 round-trips through set and at.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(2)
      buffer.set(0, 127 as byte)
      let result = buffer.at(0)
      expect(result).assertEqual(127 as byte)
    });

    /**
     * @tc.name testArrayBufferAt0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_2000
     * @tc.desc Verify byte min -128 round-trips through set and at.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(2)
      buffer.set(0, -128 as byte)
      let result = buffer.at(0)
      expect(result).assertEqual(-128 as byte)
    });

    /**
     * @tc.name testArrayBufferAt0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_2100
     * @tc.desc Verify at result is assignable to byte and matches set value.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(4)
      buffer.set(0, 65 as byte)
      let result: byte = buffer.at(0)
      expect(result).assertEqual(65 as byte)
    });

    /**
     * @tc.name testArrayBufferAt0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_2200
     * @tc.desc Verify at values participate in numeric addition as expected.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(2)
      buffer.set(0, 10 as byte)
      buffer.set(1, 20 as byte)
      let sum = buffer.at(0) + buffer.at(1)
      expect(sum).assertEqual(30)
    });

    /**
     * @tc.name testArrayBufferAt0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_2300
     * @tc.desc Verify at results compare with each other and with literals.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(2)
      buffer.set(0, 10 as byte)
      buffer.set(1, 20 as byte)
      expect(buffer.at(0) < buffer.at(1)).assertTrue()
      expect(buffer.at(0) === 10).assertTrue()
    });

    /**
     * @tc.name testArrayBufferAt0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_2400
     * @tc.desc Verify first byte at index 0 matches set value.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(4)
      buffer.set(0, 11 as byte)
      buffer.set(1, 22 as byte)
      buffer.set(2, 33 as byte)
      buffer.set(3, 44 as byte)
      expect(buffer.at(0)).assertEqual(11 as byte)
    });

    /**
     * @tc.name testArrayBufferAt0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_2500
     * @tc.desc Verify last byte at byteLength minus one matches set value.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(4)
      buffer.set(0, 11 as byte)
      buffer.set(1, 22 as byte)
      buffer.set(2, 33 as byte)
      buffer.set(3, 44 as byte)
      expect(buffer.at(3)).assertEqual(44 as byte)
    });

    /**
     * @tc.name testArrayBufferAt0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_2600
     * @tc.desc Verify unset indices read zero when one slot is set.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(4)
      buffer.set(1, 100 as byte)
      expect(buffer.at(0)).assertEqual(0 as byte)
      expect(buffer.at(2)).assertEqual(0 as byte)
      expect(buffer.at(3)).assertEqual(0 as byte)
    });

    /**
     * @tc.name testArrayBufferAt0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_2700
     * @tc.desc Verify single-byte buffer at 0 returns written byte.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(1)
      buffer.set(0, 42 as byte)
      expect(buffer.at(0)).assertEqual(42 as byte)
    });

    /**
     * @tc.name testArrayBufferAt0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_2800
     * @tc.desc Verify single-byte buffer without set reads zero at index 0.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(1)
      expect(buffer.at(0)).assertEqual(0 as byte)
    });

    /**
     * @tc.name testArrayBufferAt0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_2900
     * @tc.desc Verify large buffer reads at 0, 127, and 255 after set.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(256)
      buffer.set(0, 1 as byte)
      buffer.set(127, 127 as byte)
      buffer.set(255, -1 as byte)
      expect(buffer.at(0)).assertEqual(1 as byte)
      expect(buffer.at(127)).assertEqual(127 as byte)
      expect(buffer.at(255)).assertEqual(-1 as byte)
    });

    /**
     * @tc.name testArrayBufferAt0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_3000
     * @tc.desc Verify pos -1 throws IndexOutOfBoundsError per STA at (pos less than 0).
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(4)
      buffer.set(0, 10 as byte)
      try {
        buffer.at(-1)
        expect(true).assertFail()
      } catch (e) {
        expect(e instanceof IndexOutOfBoundsError).assertTrue()
      }
    });

    /**
     * @tc.name testArrayBufferAt0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_3100
     * @tc.desc Verify pos -2 throws IndexOutOfBoundsError.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(4)
      try {
        buffer.at(-2)
        expect(true).assertFail()
      } catch (e) {
        expect(e instanceof IndexOutOfBoundsError).assertTrue()
      }
    });

    /**
     * @tc.name testArrayBufferAt0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_3200
     * @tc.desc Verify pos int min throws IndexOutOfBoundsError.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(4)
      let posMin: int = -2147483648
      try {
        buffer.at(posMin)
        expect(true).assertFail()
      } catch (e) {
        expect(e instanceof IndexOutOfBoundsError).assertTrue()
      }
    });

    /**
     * @tc.name testArrayBufferAt0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_3300
     * @tc.desc Verify pos equal byteLength throws IndexOutOfBoundsError.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(4)
      buffer.set(0, 10 as byte)
      try {
        buffer.at(4)
        expect(true).assertFail()
      } catch (e) {
        expect(e instanceof IndexOutOfBoundsError).assertTrue()
      }
    });

    /**
     * @tc.name testArrayBufferAt0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_3400
     * @tc.desc Verify pos much larger than byteLength throws IndexOutOfBoundsError.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(4)
      try {
        buffer.at(1000)
        expect(true).assertFail()
      } catch (e) {
        expect(e instanceof IndexOutOfBoundsError).assertTrue()
      }
    });

    /**
     * @tc.name testArrayBufferAt0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_3500
     * @tc.desc Verify pos int max throws IndexOutOfBoundsError on length-4 buffer.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(4)
      let posMax: int = 2147483647
      try {
        buffer.at(posMax)
        expect(true).assertFail()
      } catch (e) {
        expect(e instanceof IndexOutOfBoundsError).assertTrue()
      }
    });

    /**
     * @tc.name testArrayBufferAt0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_3600
     * @tc.desc Verify length-1 buffer throws at pos 1.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(1)
      buffer.set(0, 42 as byte)
      try {
        buffer.at(1)
        expect(true).assertFail()
      } catch (e) {
        expect(e instanceof IndexOutOfBoundsError).assertTrue()
      }
    });

    /**
     * @tc.name testArrayBufferAt0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_3700
     * @tc.desc Verify empty buffer at pos 0 throws IndexOutOfBoundsError.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(0)
      try {
        buffer.at(0)
        expect(true).assertFail()
      } catch (e) {
        expect(e instanceof IndexOutOfBoundsError).assertTrue()
      }
    });

    /**
     * @tc.name testArrayBufferAt0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_3800
     * @tc.desc Verify empty buffer at negative pos throws IndexOutOfBoundsError.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(0)
      try {
        buffer.at(-1)
        expect(true).assertFail()
      } catch (e) {
        expect(e instanceof IndexOutOfBoundsError).assertTrue()
      }
    });

    /**
     * @tc.name testArrayBufferAt0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_3900
     * @tc.desc Verify empty buffer at positive pos throws IndexOutOfBoundsError.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(0)
      try {
        buffer.at(10)
        expect(true).assertFail()
      } catch (e) {
        expect(e instanceof IndexOutOfBoundsError).assertTrue()
      }
    });

    /**
     * @tc.name testArrayBufferAt0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_4000
     * @tc.desc STA documents at exceptions only as IndexOutOfBoundsError for invalid pos, unlike slice which lists TypeError when detached; ordinary code rarely obtains detached per get detached doc; verify at on non-detached buffer and detached false.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(4)
      buffer.set(0, 10 as byte)
      expect(buffer.detached).assertFalse()
      expect(buffer.at(0)).assertEqual(10 as byte)
    });

    /**
     * @tc.name testArrayBufferAt0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_4100
     * @tc.desc STA at does not list TypeError for detached state; verify two in-range at reads on a non-detached buffer match default zero bytes.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(4)
      expect(buffer.detached).assertFalse()
      expect(buffer.at(0)).assertEqual(0 as byte)
      expect(buffer.at(3)).assertEqual(0 as byte)
    });

    /**
     * @tc.name testArrayBufferAt0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_AT_4200
     * @tc.desc After using another buffer, a new ArrayBuffer at valid index returns set byte per STA at semantics (slice example uses at on a fresh buffer copy).
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferAt0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer2 = new ArrayBuffer(2)
      buffer2.set(0, 65 as byte)
      expect(buffer2.at(0)).assertEqual(65 as byte)
    });
  });
}
