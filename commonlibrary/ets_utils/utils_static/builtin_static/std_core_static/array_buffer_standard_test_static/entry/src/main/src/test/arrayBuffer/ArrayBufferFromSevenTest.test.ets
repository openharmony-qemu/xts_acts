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

export default function arrayBufferFromSevenTest(): void {
  describe('ArrayBufferFromSevenTest', (): void => {
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
     * @tc.name testArrayBufferFromSeven0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0010
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 1; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(3)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferFromSeven0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0020
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 2; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4)
      for (let j: int = 0; j < 4; j++) {
        buf.set(j, Int.toByte(j))
      }
      let r = ArrayBuffer.from(buf, 2 as number)
      expect(r.byteLength).assertEqual(2)
      expect(r.at(0)).assertEqual(2 as byte)
    });

    /**
     * @tc.name testArrayBufferFromSeven0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0030
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 3; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      buf.set(3, 4 as byte)
      let r = ArrayBuffer.from(buf, 1 as number, 2 as number)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0040
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 4; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0050
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 5; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0060
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 6; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0070
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 7; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0080
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 8; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0090
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 9; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0100
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 10; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0110
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 11; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0120
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 12; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0130
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 13; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0140
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 14; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0150
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 15; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0160
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 16; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0170
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 17; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0180
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 18; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0190
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 19; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0200
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 20; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0210
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 21; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 3 as byte)
      buf.set(1, 4 as byte)
      let r = ArrayBuffer.from(buf, 0.0 as number, 2 as number)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0220
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 22; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let buf = new ArrayBuffer(2)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
        ArrayBuffer.from(buf, Number.NaN as number, 1 as number)
        expect(true).assertFail()
      } catch (e) {
        expect(e != null).assertTrue()
      }
    });

    /**
     * @tc.name testArrayBufferFromSeven0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0230
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 23; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let buf = new ArrayBuffer(2)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
        ArrayBuffer.from(buf, Infinity as number, 1 as number)
        expect(true).assertFail()
      } catch (e) {
        expect(e != null).assertTrue()
      }
    });

    /**
     * @tc.name testArrayBufferFromSeven0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0240
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 24; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let buf = new ArrayBuffer(2)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
        ArrayBuffer.from(buf, Infinity as number, 1 as number)
        expect(true).assertFail()
      } catch (e) {
        expect(e != null).assertTrue()
      }
    });

    /**
     * @tc.name testArrayBufferFromSeven0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0250
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 25; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let buf = new ArrayBuffer(2)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
        ArrayBuffer.from(buf, -1 as number, 1 as number)
        expect(true).assertFail()
      } catch (e) {
        expect(e != null).assertTrue()
      }
    });

    /**
     * @tc.name testArrayBufferFromSeven0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0260
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 26; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let buf = new ArrayBuffer(2)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
        ArrayBuffer.from(buf, -1 as number, 1 as number)
        expect(true).assertFail()
      } catch (e) {
        expect(e != null).assertTrue()
      }
    });

    /**
     * @tc.name testArrayBufferFromSeven0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0270
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 27; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0280
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 28; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let buf = new ArrayBuffer(2)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
        ArrayBuffer.from(buf, 0 as number, 5 as number)
        expect(true).assertFail()
      } catch (e) {
        expect(e != null).assertTrue()
      }
    });

    /**
     * @tc.name testArrayBufferFromSeven0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0290
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 29; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0300
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 30; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0310
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 31; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0320
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 32; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0330
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 33; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0340
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 34; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0350
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 35; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(3)
      buf.set(0, 9 as byte)
      buf.set(1, 8 as byte)
      buf.set(2, 7 as byte)
      let r = ArrayBuffer.from(buf, 1 as number, 0 as number)
      expect(r.byteLength).assertEqual(0)
    });

    /**
     * @tc.name testArrayBufferFromSeven0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0360
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 36; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0370
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 37; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0380
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 38; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0390
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 39; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0400
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 40; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0410
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 41; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0420
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 42; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let buf = new ArrayBuffer(2)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
        ArrayBuffer.from(buf, Number.NaN as number, 1 as number)
        expect(true).assertFail()
      } catch (e) {
        expect(e != null).assertTrue()
      }
    });

    /**
     * @tc.name testArrayBufferFromSeven0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0430
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 43; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let buf = new ArrayBuffer(2)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
        ArrayBuffer.from(buf, Infinity as number, 1 as number)
        expect(true).assertFail()
      } catch (e) {
        expect(e != null).assertTrue()
      }
    });

    /**
     * @tc.name testArrayBufferFromSeven0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0440
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 44; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let buf = new ArrayBuffer(2)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
        ArrayBuffer.from(buf, Infinity as number, 1 as number)
        expect(true).assertFail()
      } catch (e) {
        expect(e != null).assertTrue()
      }
    });

    /**
     * @tc.name testArrayBufferFromSeven0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0450
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 45; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0460
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 46; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0047
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0470
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 47; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let buf = new ArrayBuffer(2)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
        ArrayBuffer.from(buf, 0 as number, 5 as number)
        expect(true).assertFail()
      } catch (e) {
        expect(e != null).assertTrue()
      }
    });

    /**
     * @tc.name testArrayBufferFromSeven0048
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0480
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 48; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0049
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0490
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 49; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0050
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0500
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 50; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0051
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0510
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 51; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0052
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0520
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 52; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0053
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0530
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 53; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0054
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0540
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 54; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0055
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0550
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 55; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0056
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0560
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 56; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0057
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0570
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 57; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0058
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0580
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 58; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0059
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0590
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 59; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0060
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0600
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 60; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0061
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0610
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 61; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0062
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0620
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 62; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
      expect((r instanceof ArrayBuffer)).assertTrue()
    });

    /**
     * @tc.name testArrayBufferFromSeven0063
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0630
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 63; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0064
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0640
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 64; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0065
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0650
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 65; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0066
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0660
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 66; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0067
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0670
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 67; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0068
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0680
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 68; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0069
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0690
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 69; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0070
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0700
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 70; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0071
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0710
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 71; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0072
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0720
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 72; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0073
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0730
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 73; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0074
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0740
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 74; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0075
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0750
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 75; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0076
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0760
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 76; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(3)
      buf.set(0, 9 as byte)
      buf.set(1, 8 as byte)
      buf.set(2, 7 as byte)
      let r = ArrayBuffer.from(buf, 1 as number, 0 as number)
      expect(r.byteLength).assertEqual(0)
    });

    /**
     * @tc.name testArrayBufferFromSeven0077
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0770
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 77; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(3)
      buf.set(0, 9 as byte)
      buf.set(1, 8 as byte)
      buf.set(2, 7 as byte)
      let r = ArrayBuffer.from(buf, 1 as number, 0 as number)
      expect(r.byteLength).assertEqual(0)
    });

    /**
     * @tc.name testArrayBufferFromSeven0078
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0780
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 78; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(3)
      buf.set(0, 9 as byte)
      buf.set(1, 8 as byte)
      buf.set(2, 7 as byte)
      let r = ArrayBuffer.from(buf, 0 as number, 1 as number)
      expect(r.byteLength).assertEqual(1)
      expect(r.at(0)).assertEqual(9 as byte)
    });

    /**
     * @tc.name testArrayBufferFromSeven0079
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0790
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 79; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0080
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0800
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 80; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(3)
      buf.set(0, 9 as byte)
      buf.set(1, 8 as byte)
      buf.set(2, 7 as byte)
      let r = ArrayBuffer.from(buf, 1 as number, 0 as number)
      expect(r.byteLength).assertEqual(0)
    });

    /**
     * @tc.name testArrayBufferFromSeven0081
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0810
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 81; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0082
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0820
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 82; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0083
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0830
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 83; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 3 as byte)
      buf.set(1, 4 as byte)
      let r = ArrayBuffer.from(buf, 0.0 as number, 2 as number)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0084
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0840
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 84; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      buf.set(3, 4 as byte)
      let r = ArrayBuffer.from(buf, 0 as number, 3.0 as number)
      expect(r.byteLength).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferFromSeven0085
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0850
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 85; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0086
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0860
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 86; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0087
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0870
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 87; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0088
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0880
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 88; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0089
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0890
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 89; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0090
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0900
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 90; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0091
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0910
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 91; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let buf = new ArrayBuffer(2)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
        ArrayBuffer.from(buf, 0 as number, 5 as number)
        expect(true).assertFail()
      } catch (e) {
        expect(e != null).assertTrue()
      }
    });

    /**
     * @tc.name testArrayBufferFromSeven0092
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0920
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 92; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let buf = new ArrayBuffer(2)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
        ArrayBuffer.from(buf, 0 as number, 5 as number)
        expect(true).assertFail()
      } catch (e) {
        expect(e != null).assertTrue()
      }
    });

    /**
     * @tc.name testArrayBufferFromSeven0093
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0930
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 93; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0094
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0940
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 94; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let buf = new ArrayBuffer(2)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
        ArrayBuffer.from(buf, 0 as number, 5 as number)
        expect(true).assertFail()
      } catch (e) {
        expect(e != null).assertTrue()
      }
    });

    /**
     * @tc.name testArrayBufferFromSeven0095
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0950
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 95; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let buf = new ArrayBuffer(2)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
        ArrayBuffer.from(buf, 0 as number, 5 as number)
        expect(true).assertFail()
      } catch (e) {
        expect(e != null).assertTrue()
      }
    });

    /**
     * @tc.name testArrayBufferFromSeven0096
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0960
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 96; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let buf = new ArrayBuffer(2)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
        ArrayBuffer.from(buf, 0 as number, 5 as number)
        expect(true).assertFail()
      } catch (e) {
        expect(e != null).assertTrue()
      }
    });

    /**
     * @tc.name testArrayBufferFromSeven0097
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0970
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 97; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let buf = new ArrayBuffer(2)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
        ArrayBuffer.from(buf, Number.NaN as number, 1 as number)
        expect(true).assertFail()
      } catch (e) {
        expect(e != null).assertTrue()
      }
    });

    /**
     * @tc.name testArrayBufferFromSeven0098
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0980
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 98; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let buf = new ArrayBuffer(2)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
        ArrayBuffer.from(buf, Number.NaN as number, 1 as number)
        expect(true).assertFail()
      } catch (e) {
        expect(e != null).assertTrue()
      }
    });

    /**
     * @tc.name testArrayBufferFromSeven0099
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_0990
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 99; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let buf = new ArrayBuffer(2)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
        ArrayBuffer.from(buf, Number.NaN as number, 1 as number)
        expect(true).assertFail()
      } catch (e) {
        expect(e != null).assertTrue()
      }
    });

    /**
     * @tc.name testArrayBufferFromSeven0100
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_1000
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 100; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let buf = new ArrayBuffer(2)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
        ArrayBuffer.from(buf, Infinity as number, 1 as number)
        expect(true).assertFail()
      } catch (e) {
        expect(e != null).assertTrue()
      }
    });

    /**
     * @tc.name testArrayBufferFromSeven0101
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_1010
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 101; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let buf = new ArrayBuffer(2)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
        ArrayBuffer.from(buf, Infinity as number, 1 as number)
        expect(true).assertFail()
      } catch (e) {
        expect(e != null).assertTrue()
      }
    });

    /**
     * @tc.name testArrayBufferFromSeven0102
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_1020
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 102; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let buf = new ArrayBuffer(2)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
        ArrayBuffer.from(buf, Infinity as number, 1 as number)
        expect(true).assertFail()
      } catch (e) {
        expect(e != null).assertTrue()
      }
    });

    /**
     * @tc.name testArrayBufferFromSeven0103
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_1030
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 103; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let buf = new ArrayBuffer(2)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
        ArrayBuffer.from(buf, Infinity as number, 1 as number)
        expect(true).assertFail()
      } catch (e) {
        expect(e != null).assertTrue()
      }
    });

    /**
     * @tc.name testArrayBufferFromSeven0104
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_1040
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 104; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0105
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_1050
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 105; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0106
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_1060
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 106; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0107
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_1070
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 107; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0108
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_1080
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 108; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0109
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_1090
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 109; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0110
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_1100
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 110; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0111
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_1110
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 111; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0112
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_1120
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 112; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0113
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_1130
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 113; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0114
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_1140
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 114; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSeven0115
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SEVEN_1150
     * @tc.desc Verify ArrayBuffer_from7 mindmap-ordered case 115; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSeven0115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 7 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf)
      expect(r.byteLength).assertEqual(2)
    });

    return;
  });
}
