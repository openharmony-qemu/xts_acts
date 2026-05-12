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

export default function arrayBufferFromThreeTest(): void {
  describe('ArrayBufferFromThreeTest', (): void => {
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
     * @tc.name testArrayBufferFromThree0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_0100
     * @tc.desc Verify ArrayBuffer_from3 mindmap-ordered case 1; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(3)
      ab.set(0, 1 as byte)
      ab.set(1, 2 as byte)
      ab.set(2, 3 as byte)
      let u8 = new Uint8Array(ab)
      let result = ArrayBuffer.from(u8)
      expect(result.byteLength).assertEqual(3)
      expect(result.at(0)).assertEqual(1 as byte)
    });

    /**
     * @tc.name testArrayBufferFromThree0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_0200
     * @tc.desc Verify ArrayBuffer_from3 mindmap-ordered case 2; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(1)
      ab.set(0, 7 as byte)
      let u8 = new Uint8Array(ab)
      let result = ArrayBuffer.from(u8)
      expect(result.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromThree0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_0300
     * @tc.desc Verify ArrayBuffer_from3 mindmap-ordered case 3; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(1)
      ab.set(0, 7 as byte)
      let u8 = new Uint8Array(ab)
      let result = ArrayBuffer.from(u8)
      expect(result.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromThree0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_0400
     * @tc.desc Verify ArrayBuffer_from3 mindmap-ordered case 4; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(1)
      ab.set(0, 7 as byte)
      let u8 = new Uint8Array(ab)
      let result = ArrayBuffer.from(u8)
      expect(result.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromThree0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_0500
     * @tc.desc Verify ArrayBuffer_from3 mindmap-ordered case 5; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(5)
      ab.set(0, 10 as byte)
      ab.set(1, 20 as byte)
      ab.set(2, 30 as byte)
      ab.set(3, 40 as byte)
      ab.set(4, 50 as byte)
      let u8 = new Uint8Array(ab)
      let result = ArrayBuffer.from(u8)
      expect(result.byteLength).assertEqual(5)
    });

    /**
     * @tc.name testArrayBufferFromThree0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_0600
     * @tc.desc Verify ArrayBuffer_from3 mindmap-ordered case 6; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let u8 = new Uint8Array(0)
      let result = ArrayBuffer.from(u8)
      expect(result.byteLength).assertEqual(0)
    });

    /**
     * @tc.name testArrayBufferFromThree0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_0700
     * @tc.desc Verify ArrayBuffer_from3 mindmap-ordered case 7; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(1)
      ab.set(0, Int.toByte(255))
      let u8 = new Uint8Array(ab)
      let result = ArrayBuffer.from(u8)
      expect(result.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromThree0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_0800
     * @tc.desc Verify ArrayBuffer_from3 mindmap-ordered case 8; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(1024)
      for (let j: int = 0; j < 1024; j++) {
        ab.set(j, Int.toByte(j % 256))
      }
      let u8 = new Uint8Array(ab)
      let result = ArrayBuffer.from(u8)
      expect(result.byteLength).assertEqual(1024)
      let last: int = (result.byteLength as int) - 1
      expect(result.at(last)).assertEqual(ab.at(last))
    });

    /**
     * @tc.name testArrayBufferFromThree0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_0900
     * @tc.desc Verify ArrayBuffer_from3 mindmap-ordered case 9; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(10)
      for (let j: int = 0; j < 10; j++) {
        buf.set(j, Int.toByte(j))
      }
      let u8 = new Uint8Array(buf, 3, 5)
      let result = ArrayBuffer.from(u8)
      expect(result.byteLength).assertEqual(5)
      expect(result.at(0)).assertEqual(3 as byte)
      expect(result.at(4)).assertEqual(7 as byte)
    });

    /**
     * @tc.name testArrayBufferFromThree0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_1000
     * @tc.desc Verify ArrayBuffer_from3 mindmap-ordered case 10; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(3)
      ab.set(0, 0 as byte)
      ab.set(1, 0 as byte)
      ab.set(2, 0 as byte)
      let u8 = new Uint8Array(ab)
      let result = ArrayBuffer.from(u8)
      expect(result.at(2)).assertEqual(0 as byte)
    });

    /**
     * @tc.name testArrayBufferFromThree0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_1100
     * @tc.desc Verify ArrayBuffer_from3 mindmap-ordered case 11; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(3)
      ab.set(0, Int.toByte(255))
      ab.set(1, Int.toByte(255))
      ab.set(2, Int.toByte(255))
      let u8 = new Uint8Array(ab)
      let result = ArrayBuffer.from(u8)
      expect(result.at(1)).assertEqual(Int.toByte(255))
    });

    /**
     * @tc.name testArrayBufferFromThree0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_1200
     * @tc.desc Verify ArrayBuffer_from3 mindmap-ordered case 12; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(2)
      ab.set(0, 1 as byte)
      ab.set(1, 2 as byte)
      let u8 = new Uint8Array(ab)
      let result = ArrayBuffer.from(u8)
      expect(result.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromThree0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_1300
     * @tc.desc Verify ArrayBuffer_from3 mindmap-ordered case 13; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(2)
      ab.set(0, 1 as byte)
      ab.set(1, 2 as byte)
      let u8 = new Uint8Array(ab)
      let result = ArrayBuffer.from(u8)
      expect(result.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromThree0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_1400
     * @tc.desc Verify ArrayBuffer_from3 mindmap-ordered case 14; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(2)
      ab.set(0, 1 as byte)
      ab.set(1, 2 as byte)
      let u8 = new Uint8Array(ab)
      let result = ArrayBuffer.from(u8)
      expect(result.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromThree0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_1500
     * @tc.desc Verify ArrayBuffer_from3 mindmap-ordered case 15; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(2)
      ab.set(0, 1 as byte)
      ab.set(1, 2 as byte)
      let u8 = new Uint8Array(ab)
      let result = ArrayBuffer.from(u8)
      expect(result.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromThree0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_1600
     * @tc.desc Verify ArrayBuffer_from3 mindmap-ordered case 16; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(2)
      ab.set(0, 1 as byte)
      ab.set(1, 2 as byte)
      let u8 = new Uint8Array(ab)
      let result = ArrayBuffer.from(u8)
      expect(result.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromThree0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_1700
     * @tc.desc Verify ArrayBuffer_from3 mindmap-ordered case 17; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(2)
      ab.set(0, 1 as byte)
      ab.set(1, 2 as byte)
      let u8 = new Uint8Array(ab)
      let result = ArrayBuffer.from(u8)
      expect(result.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromThree0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_1800
     * @tc.desc Verify ArrayBuffer_from3 mindmap-ordered case 18; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(2)
      ab.set(0, 1 as byte)
      ab.set(1, 2 as byte)
      let u8 = new Uint8Array(ab)
      let result = ArrayBuffer.from(u8)
      expect(result.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromThree0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_1900
     * @tc.desc Verify ArrayBuffer_from3 mindmap-ordered case 19; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(2)
      ab.set(0, 1 as byte)
      ab.set(1, 2 as byte)
      let u8 = new Uint8Array(ab)
      let result = ArrayBuffer.from(u8)
      expect(result.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromThree0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_2000
     * @tc.desc Verify ArrayBuffer_from3 mindmap-ordered case 20; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(2)
      ab.set(0, 1 as byte)
      ab.set(1, 2 as byte)
      let u8 = new Uint8Array(ab)
      let result = ArrayBuffer.from(u8)
      expect(result.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromThree0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_2100
     * @tc.desc Verify ArrayBuffer_from3 mindmap-ordered case 21; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(2)
      ab.set(0, 1 as byte)
      ab.set(1, 2 as byte)
      let u8 = new Uint8Array(ab)
      let result = ArrayBuffer.from(u8)
      expect(result.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromThree0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_2200
     * @tc.desc Verify ArrayBuffer_from3 mindmap-ordered case 22; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(10)
      let u8 = new Uint8Array(buf)
      let result = ArrayBuffer.from(buf)
      expect(result.byteLength).assertEqual(10)
    });

    /**
     * @tc.name testArrayBufferFromThree0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_2300
     * @tc.desc Verify ArrayBuffer_from3 mindmap-ordered case 23; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(3)
      ab.set(0, 1 as byte)
      ab.set(1, 2 as byte)
      ab.set(2, 3 as byte)
      let u8 = new Uint8Array(ab)
      let a = ArrayBuffer.from(u8)
      let b = ArrayBuffer.from(u8)
      expect((a !== b)).assertTrue()
    });

    /**
     * @tc.name testArrayBufferFromThree0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_2400
     * @tc.desc Verify ArrayBuffer_from3 mindmap-ordered case 24; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(3)
      ab.set(0, 1 as byte)
      ab.set(1, 2 as byte)
      ab.set(2, 3 as byte)
      let u8 = new Uint8Array(ab)
      let result = ArrayBuffer.from(u8)
      expect((result instanceof ArrayBuffer)).assertTrue()
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferFromThree0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_2500
     * @tc.desc Verify ArrayBuffer_from3 mindmap-ordered case 25; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(3)
      ab.set(0, 1 as byte)
      ab.set(1, 2 as byte)
      ab.set(2, 3 as byte)
      let u8 = new Uint8Array(ab)
      let result = ArrayBuffer.from(u8)
      expect((result instanceof ArrayBuffer)).assertTrue()
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferFromThree0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_2600
     * @tc.desc Verify ArrayBuffer_from3 mindmap-ordered case 26; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(3)
      ab.set(0, 1 as byte)
      ab.set(1, 2 as byte)
      ab.set(2, 3 as byte)
      let u8 = new Uint8Array(ab)
      let result = ArrayBuffer.from(u8)
      expect((result instanceof ArrayBuffer)).assertTrue()
      expect(result != null).assertTrue()
    });

    /**
     * @tc.name testArrayBufferFromThree0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_2700
     * @tc.desc Verify ArrayBuffer_from3 mindmap-ordered case 27; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(3)
      ab.set(0, 1 as byte)
      ab.set(1, 2 as byte)
      ab.set(2, 3 as byte)
      let u8 = new Uint8Array(ab)
      let result = ArrayBuffer.from(u8)
      let defined: boolean = result !== undefined
      expect(defined).assertTrue()
    });

    /**
     * @tc.name testArrayBufferFromThree0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_2800
     * @tc.desc Verify ArrayBuffer_from3 mindmap-ordered case 28; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(3)
      ab.set(0, 1 as byte)
      ab.set(1, 2 as byte)
      ab.set(2, 3 as byte)
      let u8 = new Uint8Array(ab)
      let result = ArrayBuffer.from(u8)
      expect(result.byteLength == 3).assertTrue()
    });

    /**
     * @tc.name testArrayBufferFromThree0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_2900
     * @tc.desc Verify ArrayBuffer_from3 mindmap-ordered case 29; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(3)
      ab.set(0, 10 as byte)
      ab.set(1, 20 as byte)
      ab.set(2, 30 as byte)
      let u8 = new Uint8Array(ab)
      let result = ArrayBuffer.from(u8)
      for (let j: int = 0; j < 3; j++) {
        expect(result.at(j)).assertEqual(Double.toByte(u8[j]))
      }
    });

    /**
     * @tc.name testArrayBufferFromThree0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_3000
     * @tc.desc Verify ArrayBuffer_from3 mindmap-ordered case 30; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(3)
      ab.set(0, 10 as byte)
      ab.set(1, 20 as byte)
      ab.set(2, 30 as byte)
      let u8 = new Uint8Array(ab)
      let result = ArrayBuffer.from(u8)
      for (let j: int = 0; j < 3; j++) {
        expect(result.at(j)).assertEqual(Double.toByte(u8[j]))
      }
    });

    /**
     * @tc.name testArrayBufferFromThree0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_3100
     * @tc.desc Verify ArrayBuffer_from3 mindmap-ordered case 31; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(2)
      ab.set(0, 0 as byte)
      ab.set(1, Int.toByte(255))
      let u8 = new Uint8Array(ab)
      let result = ArrayBuffer.from(u8)
      expect(result.at(1)).assertEqual(Int.toByte(255))
    });

    /**
     * @tc.name testArrayBufferFromThree0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_3200
     * @tc.desc Verify ArrayBuffer_from3 mindmap-ordered case 32; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(64)
      for (let j: int = 0; j < 64; j++) {
        ab.set(j, Int.toByte(j % 256))
      }
      let u8 = new Uint8Array(ab)
      let result = ArrayBuffer.from(u8)
      expect(result.byteLength).assertEqual(64)
      expect(result.at(0)).assertEqual(0 as byte)
    });

    /**
     * @tc.name testArrayBufferFromThree0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_3300
     * @tc.desc Verify ArrayBuffer_from3 mindmap-ordered case 33; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(3)
      ab.set(0, 1 as byte)
      ab.set(1, 2 as byte)
      ab.set(2, 3 as byte)
      let u8 = new Uint8Array(ab)
      let result = ArrayBuffer.from(u8)
      u8[0] = 99 as byte
      expect(result.at(0)).assertEqual(1 as byte)
    });

    /**
     * @tc.name testArrayBufferFromThree0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_3400
     * @tc.desc Verify ArrayBuffer_from3 mindmap-ordered case 34; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(3)
      ab.set(0, 10 as byte)
      ab.set(1, 20 as byte)
      ab.set(2, 30 as byte)
      let u8 = new Uint8Array(ab)
      let result = ArrayBuffer.from(u8)
      let v = new Uint8Array(result)
      v[0] = 99 as byte
      expect(u8[0]).assertEqual(10 as byte)
    });

    /**
     * @tc.name testArrayBufferFromThree0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_3500
     * @tc.desc Verify ArrayBuffer_from3 mindmap-ordered case 35; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ab = new ArrayBuffer(3)
      ab.set(0, 1 as byte)
      ab.set(1, 2 as byte)
      ab.set(2, 3 as byte)
      let u8 = new Uint8Array(ab)
      let result = ArrayBuffer.from(u8)
      expect((result !== u8.buffer)).assertTrue()
    });

    /**
     * @tc.name testArrayBufferFromThree0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_3600
     * @tc.desc Verify ArrayBuffer_from3 mindmap-ordered case 36; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let srcBuf = new ArrayBuffer(4)
      let u8 = new Uint8Array(srcBuf)
      u8[0] = 1 as byte
      u8[1] = 2 as byte
      u8[2] = 3 as byte
      u8[3] = 4 as byte
      let result = ArrayBuffer.from(u8)
      let otherView = new Uint8Array(srcBuf)
      otherView[0] = 100 as byte
      let view = new Uint8Array(result)
      expect(view[0]).assertEqual(1 as byte)
    });

    /**
     * @tc.name testArrayBufferFromThree0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_3700
     * @tc.desc Verify ArrayBuffer_from3 mindmap-ordered case 37; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let u0 = new Uint8Array(0)
      let r = ArrayBuffer.from(u0)
      expect(r.byteLength).assertEqual(0)
      expect((r instanceof ArrayBuffer)).assertTrue()
    });

    /**
     * @tc.name testArrayBufferFromThree0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_3800
     * @tc.desc Verify ArrayBuffer_from3 mindmap-ordered case 38; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let u0 = new Uint8Array(0)
      let r = ArrayBuffer.from(u0)
      expect(r.byteLength).assertEqual(0)
      expect((r instanceof ArrayBuffer)).assertTrue()
    });

    /**
     * @tc.name testArrayBufferFromThree0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_3900
     * @tc.desc Verify ArrayBuffer_from3 mindmap-ordered case 39; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let u0 = new Uint8Array(0)
      let r = ArrayBuffer.from(u0)
      expect(r.byteLength).assertEqual(0)
      expect((r instanceof ArrayBuffer)).assertTrue()
    });

    /**
     * @tc.name testArrayBufferFromThree0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_4000
     * @tc.desc Verify ArrayBuffer_from3 mindmap-ordered case 40; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let u0 = new Uint8Array(0)
      let r = ArrayBuffer.from(u0)
      let v = new Uint8Array(r)
      expect(v.length).assertEqual(0)
    });

    /**
     * @tc.name testArrayBufferFromThree0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_4100
     * @tc.desc Verify ArrayBuffer_from3 mindmap-ordered case 41; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let u0 = new Uint8Array(0)
      let r = ArrayBuffer.from(u0)
      let v = new Uint8Array(r)
      expect(v.length).assertEqual(0)
      expect(r.byteLength).assertEqual(0)
    });

    /**
     * @tc.name testArrayBufferFromThree0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_4200
     * @tc.desc Verify ArrayBuffer_from3 mindmap-ordered case 42; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let bad: Uint8Array = null as Uint8Array
        ArrayBuffer.from(bad)
        expect(true).assertFail()
      } catch (e) {
        expect(e != null).assertTrue()
      }
    });

    /**
     * @tc.name testArrayBufferFromThree0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_4300
     * @tc.desc Verify ArrayBuffer_from3 mindmap-ordered case 43; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let bad: Uint8Array = undefined as Uint8Array
        ArrayBuffer.from(bad)
        expect(true).assertFail()
      } catch (e) {
        expect(e != null).assertTrue()
      }
    });

    /**
     * @tc.name testArrayBufferFromThree0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_4400
     * @tc.desc Verify ArrayBuffer_from3 mindmap-ordered case 44; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let i8 = new Int8Array(2)
        let o: ESObject = i8 as ESObject
        let bad: Uint8Array = o as Uint8Array
        ArrayBuffer.from(bad)
        expect(true).assertFail()
      } catch (e) {
        expect(e != null).assertTrue()
      }
    });

    /**
     * @tc.name testArrayBufferFromThree0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_4500
     * @tc.desc Verify ArrayBuffer_from3 mindmap-ordered case 45; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let s: string = 'hello'
        let o: ESObject = s as ESObject
        let bad: Uint8Array = o as Uint8Array
        ArrayBuffer.from(bad)
        expect(true).assertFail()
      } catch (e) {
        expect(e != null).assertTrue()
      }
    });

    /**
     * @tc.name testArrayBufferFromThree0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_4600
     * @tc.desc Verify ArrayBuffer_from3 mindmap-ordered case 46; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let n: number = 42
        let o: ESObject = n as ESObject
        let bad: Uint8Array = o as Uint8Array
        ArrayBuffer.from(bad)
        expect(true).assertFail()
      } catch (e) {
        expect(e != null).assertTrue()
      }
    });

    /**
     * @tc.name testArrayBufferFromThree0047
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_4700
     * @tc.desc Verify ArrayBuffer_from3 mindmap-ordered case 47; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let b: boolean = true
        let o: ESObject = b as ESObject
        let bad: Uint8Array = o as Uint8Array
        ArrayBuffer.from(bad)
        expect(true).assertFail()
      } catch (e) {
        expect(e != null).assertTrue()
      }
    });

    /**
     * @tc.name testArrayBufferFromThree0048
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_THREE_4800
     * @tc.desc Verify ArrayBuffer_from3 mindmap-ordered case 48; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromThree0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let i16 = new Int16Array(2)
        let o: ESObject = i16 as ESObject
        let bad: Uint8Array = o as Uint8Array
        ArrayBuffer.from(bad)
        expect(true).assertFail()
      } catch (e) {
        expect(e != null).assertTrue()
      }
    });

    return;
  });
}
