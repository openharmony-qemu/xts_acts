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
     * @tc.desc Verify from(FixedArray<byte>) copies three bytes; at(0) and at(2) match per STA.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<byte> = [1 as byte, 2 as byte, 3 as byte]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.byteLength).assertEqual(3)
      expect(buffer.at(0)).assertEqual(1 as byte)
      expect(buffer.at(2)).assertEqual(3 as byte)
    });

    /**
     * @tc.name testArrayBufferFromTwo0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_0200
     * @tc.desc Mindmap zero-arg compile rejected; STA requires FixedArray<byte>; runtime single-arg from.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<byte> = [7 as byte]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromTwo0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_0300
     * @tc.desc Mindmap two-arg compile rejected; runtime verifies single-arg from(FixedArray<byte>).
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<byte> = [1 as byte, 2 as byte]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromTwo0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_0400
     * @tc.desc Mindmap three-arg compile rejected; runtime verifies single-arg from.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<byte> = [9 as byte]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromTwo0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_0500
     * @tc.desc Verify multi-element FixedArray<byte> copies four bytes with matching at values.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<byte> = [10 as byte, 20 as byte, 30 as byte, 40 as byte]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.byteLength).assertEqual(4)
      expect(buffer.at(0)).assertEqual(10 as byte)
      expect(buffer.at(3)).assertEqual(40 as byte)
    });

    /**
     * @tc.name testArrayBufferFromTwo0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_0600
     * @tc.desc Verify single-element FixedArray<byte> yields byteLength 1 and at(0) 42.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<byte> = [42 as byte]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.byteLength).assertEqual(1)
      expect(buffer.at(0)).assertEqual(42 as byte)
    });

    /**
     * @tc.name testArrayBufferFromTwo0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_0700
     * @tc.desc Verify empty FixedArray<byte> yields byteLength 0.
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
     * @tc.desc Verify FixedArray containing byte 127.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<byte> = [127 as byte]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.at(0)).assertEqual(127 as byte)
    });

    /**
     * @tc.name testArrayBufferFromTwo0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_0900
     * @tc.desc Verify FixedArray containing byte -128.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<byte> = [-128 as byte]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.at(0)).assertEqual(-128 as byte)
    });

    /**
     * @tc.name testArrayBufferFromTwo0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_1000
     * @tc.desc Verify FixedArray containing 0.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<byte> = [0 as byte]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.at(0)).assertEqual(0 as byte)
    });

    /**
     * @tc.name testArrayBufferFromTwo0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_1100
     * @tc.desc Verify FixedArray containing -1.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<byte> = [-1 as byte]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.at(0)).assertEqual(-1 as byte)
    });

    /**
     * @tc.name testArrayBufferFromTwo0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_1200
     * @tc.desc Verify FixedArray with multiple boundary bytes copies five elements.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<byte> = [-128 as byte, -1 as byte, 0 as byte, 1 as byte, 127 as byte]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.byteLength).assertEqual(5)
      expect(buffer.at(4)).assertEqual(127 as byte)
    });

    /**
     * @tc.name testArrayBufferFromTwo0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_1300
     * @tc.desc Verify FixedArray of ten sequential bytes copies length 10.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<byte> = [1 as byte, 2 as byte, 3 as byte, 4 as byte, 5 as byte, 6 as byte, 7 as byte, 8 as byte, 9 as byte, 10 as byte]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.byteLength).assertEqual(10)
      expect(buffer.at(9)).assertEqual(10 as byte)
    });

    /**
     * @tc.name testArrayBufferFromTwo0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_1400
     * @tc.desc Mindmap null compile rejected for FixedArray<byte>; runtime valid literal.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<byte> = [0 as byte]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromTwo0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_1500
     * @tc.desc Mindmap undefined rejected; runtime valid FixedArray literal.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<byte> = [5 as byte, 6 as byte]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromTwo0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_1600
     * @tc.desc Mindmap string not FixedArray; runtime verifies FixedArray literal path.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<byte> = [65 as byte, 66 as byte]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromTwo0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_1700
     * @tc.desc Mindmap number not FixedArray; runtime verifies FixedArray literal.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<byte> = [123 as byte]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.at(0)).assertEqual(123 as byte)
    });

    /**
     * @tc.name testArrayBufferFromTwo0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_1800
     * @tc.desc Mindmap ArrayBuffer expected FixedArray-only compile; STA allows from(buffer) copy; verify byteLength.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(3)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      let copy = ArrayBuffer.from(buf)
      expect(copy.byteLength).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferFromTwo0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_1900
     * @tc.desc Verify byteLength equals FixedArray length 3.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<byte> = [10 as byte, 20 as byte, 30 as byte]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.byteLength).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferFromTwo0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_2000
     * @tc.desc Verify empty FixedArray yields byteLength 0.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<byte> = []
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.byteLength).assertEqual(0)
    });

    /**
     * @tc.name testArrayBufferFromTwo0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_2100
     * @tc.desc Verify single-element FixedArray yields byteLength 1.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<byte> = [99 as byte]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromTwo0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_2200
     * @tc.desc Verify return value instanceof ArrayBuffer.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<byte> = [1 as byte, 2 as byte]
      let buffer = ArrayBuffer.from(arr)
      expect((buffer instanceof ArrayBuffer)).assertTrue()
    });

    /**
     * @tc.name testArrayBufferFromTwo0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_2300
     * @tc.desc Verify return value is not null.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<byte> = [1 as byte]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferFromTwo0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_2400
     * @tc.desc Verify empty FixedArray still yields non-null buffer.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<byte> = []
      let buffer = ArrayBuffer.from(arr)
      expect(buffer != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferFromTwo0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_2500
     * @tc.desc Verify two from calls yield distinct ArrayBuffer instances.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<byte> = [1 as byte, 2 as byte]
      let buffer1 = ArrayBuffer.from(arr)
      let buffer2 = ArrayBuffer.from(arr)
      expect((buffer1 !== buffer2)).assertTrue()
    });

    /**
     * @tc.name testArrayBufferFromTwo0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_2600
     * @tc.desc Verify at(i) matches source FixedArray for four elements.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<byte> = [10 as byte, 20 as byte, 30 as byte, 40 as byte]
      let buffer = ArrayBuffer.from(arr)
      for (let i: int = 0; i < 4; i++) {
        expect(buffer.at(i)).assertEqual(arr[i])
      }
    });

    /**
     * @tc.name testArrayBufferFromTwo0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_2700
     * @tc.desc Verify single-element 55.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<byte> = [55 as byte]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.at(0)).assertEqual(55 as byte)
    });

    /**
     * @tc.name testArrayBufferFromTwo0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_2800
     * @tc.desc Verify boundary -128 and 127.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<byte> = [-128 as byte, 127 as byte]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.at(0)).assertEqual(-128 as byte)
      expect(buffer.at(1)).assertEqual(127 as byte)
    });

    /**
     * @tc.name testArrayBufferFromTwo0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_2900
     * @tc.desc Verify three zeros.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<byte> = [0 as byte, 0 as byte, 0 as byte]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.at(1)).assertEqual(0 as byte)
    });

    /**
     * @tc.name testArrayBufferFromTwo0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_3000
     * @tc.desc Verify two from same FixedArray literal share initial bytes at index 0; mindmap mutable source uses non-literal patterns on ArkTS.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<byte> = [10 as byte, 20 as byte, 30 as byte]
      let buffer = ArrayBuffer.from(arr)
      let buffer2 = ArrayBuffer.from(arr)
      expect(buffer.at(0)).assertEqual(10 as byte)
      expect(buffer2.at(0)).assertEqual(10 as byte)
    });

    /**
     * @tc.name testArrayBufferFromTwo0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_3100
     * @tc.desc Verify set on ArrayBuffer copy updates only the copy bytes.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<byte> = [10 as byte, 20 as byte]
      let buffer = ArrayBuffer.from(arr)
      buffer.set(0, 99 as byte)
      expect(buffer.at(0)).assertEqual(99 as byte)
      expect(buffer.at(1)).assertEqual(20 as byte)
    });

    /**
     * @tc.name testArrayBufferFromTwo0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_3200
     * @tc.desc Verify two buffers from same FixedArray literal are independent when mutating first via set.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<byte> = [1 as byte, 2 as byte, 3 as byte]
      let buffer1 = ArrayBuffer.from(arr)
      let buffer2 = ArrayBuffer.from(arr)
      buffer1.set(0, 99 as byte)
      expect(buffer2.at(0)).assertEqual(1 as byte)
      expect(buffer1.at(0)).assertEqual(99 as byte)
    });

    /**
     * @tc.name testArrayBufferFromTwo0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_3300
     * @tc.desc Mindmap null arr compile; try null as FixedArray<byte>; expect throw or assertFail.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let bad: FixedArray<byte> = null as FixedArray<byte>
        ArrayBuffer.from(bad)
        expect(true).assertFail()
      } catch (e) {
        expect(e != null).assertTrue()
      }
    });

    /**
     * @tc.name testArrayBufferFromTwo0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_3400
     * @tc.desc Mindmap undefined arr; try undefined as FixedArray<byte>.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let bad: FixedArray<byte> = undefined as FixedArray<byte>
        ArrayBuffer.from(bad)
        expect(true).assertFail()
      } catch (e) {
        expect(e != null).assertTrue()
      }
    });

    /**
     * @tc.name testArrayBufferFromTwo0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_3500
     * @tc.desc Mindmap number[] not FixedArray; runtime valid FixedArray literal with @tc alignment note.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<byte> = [1 as byte, 2 as byte, 3 as byte]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.byteLength).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferFromTwo0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_3600
     * @tc.desc Mindmap boolean compile rejected; runtime valid FixedArray single byte.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<byte> = [1 as byte]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromTwo0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_3700
     * @tc.desc Mindmap object compile rejected; runtime valid FixedArray.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<byte> = [11 as byte, 22 as byte]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromTwo0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_TWO_3800
     * @tc.desc Mindmap FixedArray<int> compile rejected; runtime verifies FixedArray<byte> literal.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromTwo0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<byte> = [1 as byte, 2 as byte, 3 as byte]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.byteLength).assertEqual(3)
    });

    return;
  });
}
