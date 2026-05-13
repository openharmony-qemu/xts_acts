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
     * @tc.desc Verify ArrayBuffer.from(ValueArray<byte>) copies three bytes; byteLength 3 and first byte match source per arkts-sta-array-buffer.md from(arr).
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ValueArray<byte> = [1 as byte, 2 as byte, 3 as byte]
      let result = ArrayBuffer.from(arr)
      expect(result.byteLength).assertEqual(3)
      expect(result.at(0)).assertEqual(1 as byte)
      expect(result.at(2)).assertEqual(3 as byte)
    });

    /**
     * @tc.name testArrayBufferFromOne0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_0200
     * @tc.desc Mindmap zero-arg call is compile-time rejected; STA requires ValueArray<byte> arr; runtime verifies one-arg from on a single-byte array.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ValueArray<byte> = [7 as byte]
      let result = ArrayBuffer.from(arr)
      expect(result.byteLength).assertEqual(1)
      expect(result.at(0)).assertEqual(7 as byte)
    });

    /**
     * @tc.name testArrayBufferFromOne0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_0300
     * @tc.desc Mindmap two-arg ValueArray call is compile-time rejected; STA overload is from(arr) only for this form; runtime verifies single-arg from.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ValueArray<byte> = [1 as byte, 2 as byte, 3 as byte]
      let result = ArrayBuffer.from(arr)
      expect(result.byteLength).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferFromOne0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_0400
     * @tc.desc Mindmap three-arg call is compile-time rejected; STA from(arr) takes one array parameter; runtime verifies single-arg from.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ValueArray<byte> = [9 as byte, 8 as byte]
      let result = ArrayBuffer.from(arr)
      expect(result.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromOne0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_0500
     * @tc.desc Verify from(ValueArray<byte>) succeeds for typical positive byte values including 127.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ValueArray<byte> = [0 as byte, 1 as byte, 10 as byte, 100 as byte, 127 as byte]
      let result = ArrayBuffer.from(arr)
      expect(result.byteLength).assertEqual(5)
      expect(result.at(4)).assertEqual(127 as byte)
    });

    /**
     * @tc.name testArrayBufferFromOne0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_0600
     * @tc.desc Verify empty ValueArray<byte> yields ArrayBuffer byteLength 0.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ValueArray<byte> = []
      let result = ArrayBuffer.from(arr)
      expect(result.byteLength).assertEqual(0)
    });

    /**
     * @tc.name testArrayBufferFromOne0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_0700
     * @tc.desc Verify single-element ValueArray<byte> yields byteLength 1 and matching at(0).
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ValueArray<byte> = [42 as byte]
      let result = ArrayBuffer.from(arr)
      expect(result.byteLength).assertEqual(1)
      expect(result.at(0)).assertEqual(42 as byte)
    });

    /**
     * @tc.name testArrayBufferFromOne0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_0800
     * @tc.desc Verify eight-element ValueArray<byte> yields byteLength 8 with last byte 8.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ValueArray<byte> = [1 as byte, 2 as byte, 3 as byte, 4 as byte, 5 as byte, 6 as byte, 7 as byte, 8 as byte]
      let result = ArrayBuffer.from(arr)
      expect(result.byteLength).assertEqual(8)
      expect(result.at(7)).assertEqual(8 as byte)
    });

    /**
     * @tc.name testArrayBufferFromOne0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_0900
     * @tc.desc Verify negative signed byte values are preserved in the copied buffer via at().
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ValueArray<byte> = [-1 as byte, -10 as byte, -50 as byte, -128 as byte]
      let result = ArrayBuffer.from(arr)
      expect(result.byteLength).assertEqual(4)
      expect(result.at(0)).assertEqual(-1 as byte)
      expect(result.at(3)).assertEqual(-128 as byte)
    });

    /**
     * @tc.name testArrayBufferFromOne0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_1000
     * @tc.desc Verify byte boundaries 127 and -128 round-trip through from and at.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ValueArray<byte> = [127 as byte, -128 as byte, 0 as byte, -1 as byte]
      let result = ArrayBuffer.from(arr)
      expect(result.at(0)).assertEqual(127 as byte)
      expect(result.at(1)).assertEqual(-128 as byte)
    });

    /**
     * @tc.name testArrayBufferFromOne0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_1100
     * @tc.desc Verify array of maximum positive byte 127 copies correctly.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ValueArray<byte> = [127 as byte, 127 as byte, 127 as byte]
      let result = ArrayBuffer.from(arr)
      expect(result.byteLength).assertEqual(3)
      expect(result.at(1)).assertEqual(127 as byte)
    });

    /**
     * @tc.name testArrayBufferFromOne0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_1200
     * @tc.desc Verify array of minimum byte -128 copies correctly.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ValueArray<byte> = [-128 as byte, -128 as byte]
      let result = ArrayBuffer.from(arr)
      expect(result.byteLength).assertEqual(2)
      expect(result.at(0)).assertEqual(-128 as byte)
    });

    /**
     * @tc.name testArrayBufferFromOne0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_1300
     * @tc.desc Mindmap null is rejected at compile/runtime for ValueArray<byte>; STA requires arr; runtime verifies valid from on a non-null literal array.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ValueArray<byte> = [0 as byte]
      let result = ArrayBuffer.from(arr)
      expect(result.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromOne0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_1400
     * @tc.desc Mindmap undefined rejected for ValueArray<byte>; STA requires defined arr; runtime verifies from on literal bytes.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ValueArray<byte> = [5 as byte, 6 as byte]
      let result = ArrayBuffer.from(arr)
      expect(result.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromOne0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_1500
     * @tc.desc Mindmap one-arg string is not ValueArray<byte> overload; string encoding uses from(str, encoding) in STA; runtime verifies ValueArray path with explicit bytes.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ValueArray<byte> = [104 as byte, 101 as byte, 108 as byte, 108 as byte, 111 as byte]
      let result = ArrayBuffer.from(arr)
      expect(result.byteLength).assertEqual(5)
    });

    /**
     * @tc.name testArrayBufferFromOne0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_1600
     * @tc.desc Mindmap number argument is not ValueArray<byte>; STA documents double[] overload separately; runtime verifies ValueArray literal from for observable byteLength.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ValueArray<byte> = [123 as byte]
      let result = ArrayBuffer.from(arr)
      expect(result.byteLength).assertEqual(1)
      expect(result.at(0)).assertEqual(123 as byte)
    });

    /**
     * @tc.name testArrayBufferFromOne0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_1700
     * @tc.desc Mindmap boolean is not ValueArray<byte>; runtime verifies ValueArray path instead with same observable assertions as mindmap positive case intent.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ValueArray<byte> = [1 as byte]
      let result = ArrayBuffer.from(arr)
      expect(result.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromOne0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_1800
     * @tc.desc Mindmap plain object is not ValueArray<byte>; runtime verifies ValueArray literal from for valid copy semantics.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ValueArray<byte> = [11 as byte, 22 as byte]
      let result = ArrayBuffer.from(arr)
      expect(result.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromOne0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_1900
     * @tc.desc Mindmap expects ValueArray-only; STA also documents from(buffer, byteOffset?, length?) copying full buffer when optional args omitted; verify byteLength and bytes match after set on source.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      buf.set(3, 4 as byte)
      let result = ArrayBuffer.from(buf)
      expect(result.byteLength).assertEqual(4)
      expect(result.at(0)).assertEqual(1 as byte)
      expect(result.at(3)).assertEqual(4 as byte)
    });

    /**
     * @tc.name testArrayBufferFromOne0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_2000
     * @tc.desc Verify representative values across signed byte range copy correctly via at.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ValueArray<byte> = [0 as byte, 1 as byte, 63 as byte, 127 as byte, -1 as byte, -64 as byte, -128 as byte]
      let result = ArrayBuffer.from(arr)
      expect(result.byteLength).assertEqual(7)
      expect(result.at(3)).assertEqual(127 as byte)
      expect(result.at(6)).assertEqual(-128 as byte)
    });

    /**
     * @tc.name testArrayBufferFromOne0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_2100
     * @tc.desc Verify result.byteLength equals source ValueArray length after from.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ValueArray<byte> = [1 as byte, 2 as byte, 3 as byte, 4 as byte, 5 as byte]
      let result = ArrayBuffer.from(arr)
      expect(result.byteLength).assertEqual(5)
    });

    /**
     * @tc.name testArrayBufferFromOne0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_2200
     * @tc.desc Verify empty source yields byteLength 0 after from.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ValueArray<byte> = []
      let result = ArrayBuffer.from(arr)
      expect(result.byteLength).assertEqual(0)
    });

    /**
     * @tc.name testArrayBufferFromOne0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_2300
     * @tc.desc Verify single-element source yields byteLength 1.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ValueArray<byte> = [99 as byte]
      let result = ArrayBuffer.from(arr)
      expect(result.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromOne0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_2400
     * @tc.desc Mindmap large ValueArray via dynamic Array; OH runtime rejects Array to ValueArray i8[] cast. Same 1024-byte pattern via ArrayBuffer.set loop plus Uint8Array and STA from(Uint8Array); byteLength 1024 and ends match source buffer.
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
      let result = ArrayBuffer.from(u8)
      expect(result.byteLength).assertEqual(1024)
      expect(result.at(0)).assertEqual(Int.toByte(0))
      let lastIndex: int = 1023
      expect(result.at(lastIndex)).assertEqual(ab.at(lastIndex))
    });

    /**
     * @tc.name testArrayBufferFromOne0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_2500
     * @tc.desc Verify return value is instanceof ArrayBuffer.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ValueArray<byte> = [1 as byte, 2 as byte, 3 as byte]
      let result = ArrayBuffer.from(arr)
      expect((result instanceof ArrayBuffer)).assertTrue()
    });

    /**
     * @tc.name testArrayBufferFromOne0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_2600
     * @tc.desc Verify from result is not null.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ValueArray<byte> = [1 as byte, 2 as byte, 3 as byte]
      let result = ArrayBuffer.from(arr)
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferFromOne0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_2700
     * @tc.desc Verify from result is defined (not undefined) using strict inequality then assertTrue.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ValueArray<byte> = [1 as byte, 2 as byte, 3 as byte]
      let result = ArrayBuffer.from(arr)
      let defined: boolean = result !== undefined
      expect(defined).assertTrue()
    });

    /**
     * @tc.name testArrayBufferFromOne0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_2800
     * @tc.desc Verify each byte via at(pos) matches source array for int indices 0..length-1.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ValueArray<byte> = [10 as byte, 20 as byte, 30 as byte, 40 as byte, 50 as byte]
      let result = ArrayBuffer.from(arr)
      for (let i: int = 0; i < 5; i++) {
        expect(result.at(i)).assertEqual(arr[i])
      }
    });

    /**
     * @tc.name testArrayBufferFromOne0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_2900
     * @tc.desc Verify at reads 127 -128 0 for boundary source bytes.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ValueArray<byte> = [127 as byte, -128 as byte, 0 as byte]
      let result = ArrayBuffer.from(arr)
      expect(result.at(0)).assertEqual(127 as byte)
      expect(result.at(1)).assertEqual(-128 as byte)
      expect(result.at(2)).assertEqual(0 as byte)
    });

    /**
     * @tc.name testArrayBufferFromOne0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_3000
     * @tc.desc Verify negative byte triple matches at sequence.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ValueArray<byte> = [-1 as byte, -50 as byte, -100 as byte]
      let result = ArrayBuffer.from(arr)
      expect(result.at(0)).assertEqual(-1 as byte)
      expect(result.at(1)).assertEqual(-50 as byte)
      expect(result.at(2)).assertEqual(-100 as byte)
    });

    /**
     * @tc.name testArrayBufferFromOne0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_3100
     * @tc.desc Verify all-zero source yields zero at each index.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ValueArray<byte> = [0 as byte, 0 as byte, 0 as byte, 0 as byte]
      let result = ArrayBuffer.from(arr)
      for (let i: int = 0; i < 4; i++) {
        expect(result.at(i)).assertEqual(0 as byte)
      }
    });

    /**
     * @tc.name testArrayBufferFromOne0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_3200
     * @tc.desc Verify single-element source at(0) equals 42.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ValueArray<byte> = [42 as byte]
      let result = ArrayBuffer.from(arr)
      expect(result.at(0)).assertEqual(42 as byte)
    });

    /**
     * @tc.name testArrayBufferFromOne0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_3300
     * @tc.desc Mutate backing bytes after from: mindmap used Array bridged to ValueArray; OH cannot cast Array to i8[]. Same independence via Uint8Array over ArrayBuffer, from(Uint8Array), then ab.set(0, 99); first byte of copy stays 1.
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
      let result = ArrayBuffer.from(u8)
      let z0: int = 0
      ab.set(z0, Int.toByte(99))
      expect(result.at(0)).assertEqual(Int.toByte(1))
    });

    /**
     * @tc.name testArrayBufferFromOne0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_3400
     * @tc.desc Mindmap shorten source after from (arr.length = 0); OH cannot bridge Array to ValueArray. Resizable ArrayBuffer(3,8), from(Uint8Array), then resize(0) on source; copy keeps byteLength 3 and first byte 10.
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
      let result = ArrayBuffer.from(u8)
      ab.resize(0)
      expect(result.byteLength).assertEqual(3)
      expect(result.at(0)).assertEqual(Int.toByte(10))
    });

    /**
     * @tc.name testArrayBufferFromOne0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_3500
     * @tc.desc Verify two from same source produce distinct buffers with equal length and equal first byte.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ValueArray<byte> = [5 as byte, 6 as byte, 7 as byte]
      let result1 = ArrayBuffer.from(arr)
      let result2 = ArrayBuffer.from(arr)
      expect((result1 !== result2)).assertTrue()
      expect(result1.byteLength).assertEqual(result2.byteLength)
      expect(result1.at(0)).assertEqual(result2.at(0))
    });

    /**
     * @tc.name testArrayBufferFromOne0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_3600
     * @tc.desc Copy at(0) stays 1 while backing first byte becomes 100 after assignment; mindmap used mutable Array bridged to ValueArray — OH rejects Array to i8[], use shared ArrayBuffer plus Uint8Array and from(Uint8Array) then ab.set(0, 100).
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
      let result = ArrayBuffer.from(u8)
      let z0: int = 0
      ab.set(z0, Int.toByte(100))
      expect(result.at(0)).assertEqual(Int.toByte(1))
      expect(ab.at(z0)).assertEqual(Int.toByte(100))
    });

    /**
     * @tc.name testArrayBufferFromOne0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_3700
     * @tc.desc Mindmap null in try; runtime path uses null-as-ValueArray cast: expect throw or reject with non-null error (ASSERTION.01).
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let bad: ValueArray<byte> = null as ValueArray<byte>
        ArrayBuffer.from(bad)
        expect(true).assertFail()
      } catch (e) {
        expect(e != null).assertTrue()
      }
    });

    /**
     * @tc.name testArrayBufferFromOne0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_3800
     * @tc.desc Mindmap undefined in try; runtime uses undefined cast to ValueArray<byte>; expect exception path with non-null error.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let bad: ValueArray<byte> = undefined as ValueArray<byte>
        ArrayBuffer.from(bad)
        expect(true).assertFail()
      } catch (e) {
        expect(e != null).assertTrue()
      }
    });

    /**
     * @tc.name testArrayBufferFromOne0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_3900
     * @tc.desc Mindmap string in try; cast string to ValueArray<byte> to exercise invalid buffer construction; expect throw or assertFail on success.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let s: string = 'abc'
        let o: ESObject = s as ESObject
        let bad: ValueArray<byte> = o as ValueArray<byte>
        ArrayBuffer.from(bad)
        expect(true).assertFail()
      } catch (e) {
        expect(e != null).assertTrue()
      }
    });

    /**
     * @tc.name testArrayBufferFromOne0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_4000
     * @tc.desc Mindmap number in try; invalid ValueArray cast from number; expect error path.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let n: number = 42
        let o: ESObject = n as ESObject
        let bad: ValueArray<byte> = o as ValueArray<byte>
        ArrayBuffer.from(bad)
        expect(true).assertFail()
      } catch (e) {
        expect(e != null).assertTrue()
      }
    });

    /**
     * @tc.name testArrayBufferFromOne0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_4100
     * @tc.desc Mindmap boolean in try; cast true to ValueArray<byte>; expect error path.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let b: boolean = true
        let o: ESObject = b as ESObject
        let bad: ValueArray<byte> = o as ValueArray<byte>
        ArrayBuffer.from(bad)
        expect(true).assertFail()
      } catch (e) {
        expect(e != null).assertTrue()
      }
    });

    /**
     * @tc.name testArrayBufferFromOne0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_4200
     * @tc.desc Mindmap object in try; cast plain record to ValueArray<byte>; expect error path.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let plain: ArrayBufferFromOnePlainRecordFor0042 = new ArrayBufferFromOnePlainRecordFor0042()
        let o: ESObject = plain as ESObject
        let bad: ValueArray<byte> = o as ValueArray<byte>
        ArrayBuffer.from(bad)
        expect(true).assertFail()
      } catch (e) {
        expect(e != null).assertTrue()
      }
    });

    /**
     * @tc.name testArrayBufferFromOne0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_4300
     * @tc.desc Mindmap try/catch on ArrayBuffer arg expected throw in TS-only view; STA documents from(buffer, byteOffset?, length?) so single ArrayBuffer copies full buffer; verify byteLength and first byte (no throw).
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4)
      buf.set(0, 11 as byte)
      let result = ArrayBuffer.from(buf)
      expect(result.byteLength).assertEqual(4)
      expect(result.at(0)).assertEqual(11 as byte)
    });

    /**
     * @tc.name testArrayBufferFromOne0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_ONE_4400
     * @tc.desc Mindmap function argument; cast closure to ValueArray<byte>; expect exception when from rejects non-array.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromOne0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let fn = (): void => { }
        let o: ESObject = fn as ESObject
        let bad: ValueArray<byte> = o as ValueArray<byte>
        ArrayBuffer.from(bad)
        expect(true).assertFail()
      } catch (e) {
        expect(e != null).assertTrue()
      }
    });

    return;
  });
}
