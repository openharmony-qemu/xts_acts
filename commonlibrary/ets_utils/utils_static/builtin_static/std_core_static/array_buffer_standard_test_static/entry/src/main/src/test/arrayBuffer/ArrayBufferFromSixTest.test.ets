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

export default function arrayBufferFromSixTest(): void {
  describe('ArrayBufferFromSixTest', (): void => {
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
     * @tc.name testArrayBufferFromSix0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_0100
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 1; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      buf.set(3, 4 as byte)
      let r = ArrayBuffer.from(buf, 0 as int, 4 as int)
      expect(r.byteLength).assertEqual(4)
    });

    /**
     * @tc.name testArrayBufferFromSix0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_0200
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 2; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 9 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf, 0 as int, 2 as int)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSix0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_0300
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 3; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 9 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf, 0 as int, 2 as int)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSix0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_0400
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 4; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 9 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf, 0 as int, 2 as int)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSix0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_0500
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 5; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(2)
      buf.set(0, 9 as byte)
      buf.set(1, 8 as byte)
      let r = ArrayBuffer.from(buf, 0 as int, 2 as int)
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromSix0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_0600
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 6; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(3)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      let r = ArrayBuffer.from(buf, 0 as int, 3 as int)
      expect(r.byteLength).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferFromSix0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_0700
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 7; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(3)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      let r = ArrayBuffer.from(buf, 0 as int, 3 as int)
      expect(r.byteLength).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferFromSix0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_0800
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 8; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(3)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      let r = ArrayBuffer.from(buf, 0 as int, 3 as int)
      expect(r.byteLength).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferFromSix0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_0900
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 9; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(0)
      let r = ArrayBuffer.from(buf, 0 as int, 0 as int)
      expect(r.byteLength).assertEqual(0)
    });

    /**
     * @tc.name testArrayBufferFromSix0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_1000
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 10; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      buf.set(3, 4 as byte)
      let r = ArrayBuffer.from(buf, 1 as int, 2 as int)
      expect(r.byteLength).assertEqual(2)
      expect(r.at(0)).assertEqual(2 as byte)
    });

    /**
     * @tc.name testArrayBufferFromSix0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_1100
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 11; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      buf.set(3, 4 as byte)
      let r = ArrayBuffer.from(buf, 1 as int, 2 as int)
      expect(r.byteLength).assertEqual(2)
      expect(r.at(0)).assertEqual(2 as byte)
    });

    /**
     * @tc.name testArrayBufferFromSix0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_1200
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 12; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      buf.set(3, 4 as byte)
      let r = ArrayBuffer.from(buf, 1 as int, 2 as int)
      expect(r.byteLength).assertEqual(2)
      expect(r.at(0)).assertEqual(2 as byte)
    });

    /**
     * @tc.name testArrayBufferFromSix0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_1300
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 13; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      buf.set(3, 4 as byte)
      let r = ArrayBuffer.from(buf, 1 as int, 2 as int)
      expect(r.byteLength).assertEqual(2)
      expect(r.at(0)).assertEqual(2 as byte)
    });

    /**
     * @tc.name testArrayBufferFromSix0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_1400
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 14; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      buf.set(3, 4 as byte)
      let r = ArrayBuffer.from(buf, 1 as int, 2 as int)
      expect(r.byteLength).assertEqual(2)
      expect(r.at(0)).assertEqual(2 as byte)
    });

    /**
     * @tc.name testArrayBufferFromSix0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_1500
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 15; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      buf.set(3, 4 as byte)
      let r = ArrayBuffer.from(buf, 1 as int, 2 as int)
      expect(r.byteLength).assertEqual(2)
      expect(r.at(0)).assertEqual(2 as byte)
    });

    /**
     * @tc.name testArrayBufferFromSix0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_1600
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 16; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      buf.set(3, 4 as byte)
      let r = ArrayBuffer.from(buf, 1 as int, 2 as int)
      expect(r.byteLength).assertEqual(2)
      expect(r.at(0)).assertEqual(2 as byte)
    });

    /**
     * @tc.name testArrayBufferFromSix0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_1700
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 17; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      buf.set(3, 4 as byte)
      let r = ArrayBuffer.from(buf, 1 as int, 2 as int)
      expect(r.byteLength).assertEqual(2)
      expect(r.at(0)).assertEqual(2 as byte)
    });

    /**
     * @tc.name testArrayBufferFromSix0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_1800
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 18; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      buf.set(3, 4 as byte)
      let r = ArrayBuffer.from(buf, 1 as int, 2 as int)
      expect(r.byteLength).assertEqual(2)
      expect(r.at(0)).assertEqual(2 as byte)
    });

    /**
     * @tc.name testArrayBufferFromSix0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_1900
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 19; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      buf.set(3, 4 as byte)
      let r = ArrayBuffer.from(buf, 1 as int, 2 as int)
      expect(r.byteLength).assertEqual(2)
      expect(r.at(0)).assertEqual(2 as byte)
    });

    /**
     * @tc.name testArrayBufferFromSix0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_2000
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 20; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      buf.set(3, 4 as byte)
      let r = ArrayBuffer.from(buf, 1 as int, 2 as int)
      expect(r.byteLength).assertEqual(2)
      expect(r.at(0)).assertEqual(2 as byte)
    });

    /**
     * @tc.name testArrayBufferFromSix0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_2100
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 21; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      buf.set(3, 4 as byte)
      let r = ArrayBuffer.from(buf, 1 as int, 2 as int)
      expect(r.byteLength).assertEqual(2)
      expect(r.at(0)).assertEqual(2 as byte)
    });

    /**
     * @tc.name testArrayBufferFromSix0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_2200
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 22; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      buf.set(3, 4 as byte)
      let r = ArrayBuffer.from(buf, 1 as int, 2 as int)
      expect(r.byteLength).assertEqual(2)
      expect(r.at(0)).assertEqual(2 as byte)
    });

    /**
     * @tc.name testArrayBufferFromSix0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_2300
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 23; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      buf.set(3, 4 as byte)
      let r = ArrayBuffer.from(buf, 1 as int, 2 as int)
      expect(r.byteLength).assertEqual(2)
      expect(r.at(0)).assertEqual(2 as byte)
    });

    /**
     * @tc.name testArrayBufferFromSix0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_2400
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 24; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      buf.set(3, 4 as byte)
      let r = ArrayBuffer.from(buf, 1 as int, 2 as int)
      expect(r.byteLength).assertEqual(2)
      expect(r.at(0)).assertEqual(2 as byte)
    });

    /**
     * @tc.name testArrayBufferFromSix0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_2500
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 25; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      buf.set(3, 4 as byte)
      let r = ArrayBuffer.from(buf, 1 as int, 2 as int)
      expect(r.byteLength).assertEqual(2)
      expect(r.at(0)).assertEqual(2 as byte)
    });

    /**
     * @tc.name testArrayBufferFromSix0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_2600
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 26; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      buf.set(3, 4 as byte)
      let r = ArrayBuffer.from(buf, 1 as int, 2 as int)
      expect(r.byteLength).assertEqual(2)
      expect(r.at(0)).assertEqual(2 as byte)
    });

    /**
     * @tc.name testArrayBufferFromSix0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_2700
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 27; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      buf.set(3, 4 as byte)
      let r = ArrayBuffer.from(buf, 1 as int, 2 as int)
      expect(r.byteLength).assertEqual(2)
      expect(r.at(0)).assertEqual(2 as byte)
    });

    /**
     * @tc.name testArrayBufferFromSix0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_2800
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 28; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      buf.set(3, 4 as byte)
      let r = ArrayBuffer.from(buf, 1 as int, 2 as int)
      expect(r.byteLength).assertEqual(2)
      expect(r.at(0)).assertEqual(2 as byte)
    });

    /**
     * @tc.name testArrayBufferFromSix0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_2900
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 29; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      buf.set(3, 4 as byte)
      let r = ArrayBuffer.from(buf, 1 as int, 2 as int)
      expect(r.byteLength).assertEqual(2)
      expect(r.at(0)).assertEqual(2 as byte)
    });

    /**
     * @tc.name testArrayBufferFromSix0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_3000
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 30; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      buf.set(3, 4 as byte)
      let r = ArrayBuffer.from(buf, 1 as int, 2 as int)
      expect(r.byteLength).assertEqual(2)
      expect(r.at(0)).assertEqual(2 as byte)
    });

    /**
     * @tc.name testArrayBufferFromSix0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_3100
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 31; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      buf.set(3, 4 as byte)
      let r = ArrayBuffer.from(buf, 1 as int, 2 as int)
      expect(r.byteLength).assertEqual(2)
      expect(r.at(0)).assertEqual(2 as byte)
    });

    /**
     * @tc.name testArrayBufferFromSix0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_3200
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 32; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      buf.set(3, 4 as byte)
      let r = ArrayBuffer.from(buf, 1 as int, 2 as int)
      expect(r.byteLength).assertEqual(2)
      expect(r.at(0)).assertEqual(2 as byte)
    });

    /**
     * @tc.name testArrayBufferFromSix0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_3300
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 33; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      buf.set(3, 4 as byte)
      let r = ArrayBuffer.from(buf, 1 as int, 2 as int)
      expect(r.byteLength).assertEqual(2)
      expect(r.at(0)).assertEqual(2 as byte)
    });

    /**
     * @tc.name testArrayBufferFromSix0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_3400
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 34; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      buf.set(3, 4 as byte)
      let r = ArrayBuffer.from(buf, 1 as int, 2 as int)
      expect(r.byteLength).assertEqual(2)
      expect(r.at(0)).assertEqual(2 as byte)
    });

    /**
     * @tc.name testArrayBufferFromSix0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_3500
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 35; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      buf.set(3, 4 as byte)
      let r = ArrayBuffer.from(buf, 1 as int, 2 as int)
      expect(r.byteLength).assertEqual(2)
      expect(r.at(0)).assertEqual(2 as byte)
    });

    /**
     * @tc.name testArrayBufferFromSix0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_3600
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 36; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      buf.set(3, 4 as byte)
      let r = ArrayBuffer.from(buf, 1 as int, 2 as int)
      expect(r.byteLength).assertEqual(2)
      expect(r.at(0)).assertEqual(2 as byte)
    });

    /**
     * @tc.name testArrayBufferFromSix0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_3700
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 37; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      buf.set(3, 4 as byte)
      let r = ArrayBuffer.from(buf, 1 as int, 2 as int)
      expect(r.byteLength).assertEqual(2)
      expect(r.at(0)).assertEqual(2 as byte)
    });

    /**
     * @tc.name testArrayBufferFromSix0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_3800
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 38; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      buf.set(3, 4 as byte)
      let r = ArrayBuffer.from(buf, 1 as int, 2 as int)
      expect(r.byteLength).assertEqual(2)
      expect(r.at(0)).assertEqual(2 as byte)
    });

    /**
     * @tc.name testArrayBufferFromSix0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_3900
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 39; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      buf.set(3, 4 as byte)
      let r = ArrayBuffer.from(buf, 1 as int, 2 as int)
      expect(r.byteLength).assertEqual(2)
      expect(r.at(0)).assertEqual(2 as byte)
    });

    /**
     * @tc.name testArrayBufferFromSix0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_4000
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 40; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      buf.set(3, 4 as byte)
      let r = ArrayBuffer.from(buf, 1 as int, 2 as int)
      expect(r.byteLength).assertEqual(2)
      expect(r.at(0)).assertEqual(2 as byte)
    });

    /**
     * @tc.name testArrayBufferFromSix0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_4100
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 41; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      buf.set(3, 4 as byte)
      let r = ArrayBuffer.from(buf, 1 as int, 2 as int)
      expect(r.byteLength).assertEqual(2)
      expect(r.at(0)).assertEqual(2 as byte)
    });

    /**
     * @tc.name testArrayBufferFromSix0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_4200
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 42; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      buf.set(3, 4 as byte)
      let r = ArrayBuffer.from(buf, 1 as int, 2 as int)
      expect(r.byteLength).assertEqual(2)
      expect(r.at(0)).assertEqual(2 as byte)
    });

    /**
     * @tc.name testArrayBufferFromSix0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_4300
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 43; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      buf.set(3, 4 as byte)
      let r = ArrayBuffer.from(buf, 1 as int, 2 as int)
      expect(r.byteLength).assertEqual(2)
      expect(r.at(0)).assertEqual(2 as byte)
    });

    /**
     * @tc.name testArrayBufferFromSix0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_4400
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 44; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      buf.set(3, 4 as byte)
      let r = ArrayBuffer.from(buf, 1 as int, 2 as int)
      expect(r.byteLength).assertEqual(2)
      expect(r.at(0)).assertEqual(2 as byte)
    });

    /**
     * @tc.name testArrayBufferFromSix0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_4500
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 45; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      buf.set(3, 4 as byte)
      let r = ArrayBuffer.from(buf, 1 as int, 2 as int)
      expect(r.byteLength).assertEqual(2)
      expect(r.at(0)).assertEqual(2 as byte)
    });

    /**
     * @tc.name testArrayBufferFromSix0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_4600
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 46; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      buf.set(3, 4 as byte)
      let r = ArrayBuffer.from(buf, 1 as int, 2 as int)
      expect(r.byteLength).assertEqual(2)
      expect(r.at(0)).assertEqual(2 as byte)
    });

    /**
     * @tc.name testArrayBufferFromSix0047
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_4700
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 47; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      buf.set(3, 4 as byte)
      let r = ArrayBuffer.from(buf, 1 as int, 2 as int)
      expect(r.byteLength).assertEqual(2)
      expect(r.at(0)).assertEqual(2 as byte)
    });

    /**
     * @tc.name testArrayBufferFromSix0048
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_4800
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 48; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      buf.set(3, 4 as byte)
      let r = ArrayBuffer.from(buf, 1 as int, 2 as int)
      expect(r.byteLength).assertEqual(2)
      expect(r.at(0)).assertEqual(2 as byte)
    });

    /**
     * @tc.name testArrayBufferFromSix0049
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_4900
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 49; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      buf.set(3, 4 as byte)
      let r = ArrayBuffer.from(buf, 1 as int, 2 as int)
      expect(r.byteLength).assertEqual(2)
      expect(r.at(0)).assertEqual(2 as byte)
    });

    /**
     * @tc.name testArrayBufferFromSix0050
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_5000
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 50; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      buf.set(3, 4 as byte)
      let r = ArrayBuffer.from(buf, 1 as int, 2 as int)
      expect(r.byteLength).assertEqual(2)
      expect(r.at(0)).assertEqual(2 as byte)
    });

    /**
     * @tc.name testArrayBufferFromSix0051
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_5100
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 51; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      buf.set(3, 4 as byte)
      let r = ArrayBuffer.from(buf, 1 as int, 2 as int)
      expect(r.byteLength).assertEqual(2)
      expect(r.at(0)).assertEqual(2 as byte)
    });

    /**
     * @tc.name testArrayBufferFromSix0052
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_5200
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 52; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      buf.set(3, 4 as byte)
      let r = ArrayBuffer.from(buf, 1 as int, 2 as int)
      expect(r.byteLength).assertEqual(2)
      expect(r.at(0)).assertEqual(2 as byte)
    });

    /**
     * @tc.name testArrayBufferFromSix0053
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_5300
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 53; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      buf.set(3, 4 as byte)
      let r = ArrayBuffer.from(buf, 1 as int, 2 as int)
      expect(r.byteLength).assertEqual(2)
      expect(r.at(0)).assertEqual(2 as byte)
    });

    /**
     * @tc.name testArrayBufferFromSix0054
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_5400
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 54; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      buf.set(3, 4 as byte)
      let r = ArrayBuffer.from(buf, 1 as int, 2 as int)
      expect(r.byteLength).assertEqual(2)
      expect(r.at(0)).assertEqual(2 as byte)
    });

    /**
     * @tc.name testArrayBufferFromSix0055
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_5500
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 55; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      buf.set(3, 4 as byte)
      let r = ArrayBuffer.from(buf, 1 as int, 2 as int)
      expect(r.byteLength).assertEqual(2)
      expect(r.at(0)).assertEqual(2 as byte)
    });

    /**
     * @tc.name testArrayBufferFromSix0056
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_5600
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 56; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      buf.set(3, 4 as byte)
      let r = ArrayBuffer.from(buf, 1 as int, 2 as int)
      expect(r.byteLength).assertEqual(2)
      expect(r.at(0)).assertEqual(2 as byte)
    });

    /**
     * @tc.name testArrayBufferFromSix0057
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_5700
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 57; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      buf.set(3, 4 as byte)
      let r = ArrayBuffer.from(buf, 1 as int, 2 as int)
      expect(r.byteLength).assertEqual(2)
      expect(r.at(0)).assertEqual(2 as byte)
    });

    /**
     * @tc.name testArrayBufferFromSix0058
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_5800
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 58; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      buf.set(3, 4 as byte)
      let r = ArrayBuffer.from(buf, 1 as int, 2 as int)
      expect(r.byteLength).assertEqual(2)
      expect(r.at(0)).assertEqual(2 as byte)
    });

    /**
     * @tc.name testArrayBufferFromSix0059
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_5900
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 59; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      buf.set(3, 4 as byte)
      let r = ArrayBuffer.from(buf, 1 as int, 2 as int)
      expect(r.byteLength).assertEqual(2)
      expect(r.at(0)).assertEqual(2 as byte)
    });

    /**
     * @tc.name testArrayBufferFromSix0060
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_6000
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 60; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      buf.set(3, 4 as byte)
      let r = ArrayBuffer.from(buf, 1 as int, 2 as int)
      expect(r.byteLength).assertEqual(2)
      expect(r.at(0)).assertEqual(2 as byte)
    });

    /**
     * @tc.name testArrayBufferFromSix0061
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_6100
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 61; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      buf.set(3, 4 as byte)
      let r = ArrayBuffer.from(buf, 1 as int, 2 as int)
      expect(r.byteLength).assertEqual(2)
      expect(r.at(0)).assertEqual(2 as byte)
    });

    /**
     * @tc.name testArrayBufferFromSix0062
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_6200
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 62; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      buf.set(3, 4 as byte)
      let r = ArrayBuffer.from(buf, 1 as int, 2 as int)
      expect(r.byteLength).assertEqual(2)
      expect(r.at(0)).assertEqual(2 as byte)
    });

    /**
     * @tc.name testArrayBufferFromSix0063
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_6300
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 63; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      buf.set(3, 4 as byte)
      let r = ArrayBuffer.from(buf, 1 as int, 2 as int)
      expect(r.byteLength).assertEqual(2)
      expect(r.at(0)).assertEqual(2 as byte)
    });

    /**
     * @tc.name testArrayBufferFromSix0064
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_6400
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 64; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      buf.set(3, 4 as byte)
      let r = ArrayBuffer.from(buf, 1 as int, 2 as int)
      expect(r.byteLength).assertEqual(2)
      expect(r.at(0)).assertEqual(2 as byte)
    });

    /**
     * @tc.name testArrayBufferFromSix0065
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_6500
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 65; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      buf.set(3, 4 as byte)
      let r = ArrayBuffer.from(buf, 1 as int, 2 as int)
      expect(r.byteLength).assertEqual(2)
      expect(r.at(0)).assertEqual(2 as byte)
    });

    /**
     * @tc.name testArrayBufferFromSix0066
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_6600
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 66; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      buf.set(3, 4 as byte)
      let r = ArrayBuffer.from(buf, 1 as int, 2 as int)
      expect(r.byteLength).assertEqual(2)
      expect(r.at(0)).assertEqual(2 as byte)
    });

    /**
     * @tc.name testArrayBufferFromSix0067
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_6700
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 67; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      buf.set(3, 4 as byte)
      let r = ArrayBuffer.from(buf, 1 as int, 2 as int)
      expect(r.byteLength).assertEqual(2)
      expect(r.at(0)).assertEqual(2 as byte)
    });

    /**
     * @tc.name testArrayBufferFromSix0068
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_6800
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 68; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      buf.set(3, 4 as byte)
      let r = ArrayBuffer.from(buf, 1 as int, 2 as int)
      expect(r.byteLength).assertEqual(2)
      expect(r.at(0)).assertEqual(2 as byte)
    });

    /**
     * @tc.name testArrayBufferFromSix0069
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_6900
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 69; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      buf.set(3, 4 as byte)
      let r = ArrayBuffer.from(buf, 1 as int, 2 as int)
      expect(r.byteLength).assertEqual(2)
      expect(r.at(0)).assertEqual(2 as byte)
    });

    /**
     * @tc.name testArrayBufferFromSix0070
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_7000
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 70; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      buf.set(3, 4 as byte)
      let r = ArrayBuffer.from(buf, 1 as int, 2 as int)
      expect(r.byteLength).assertEqual(2)
      expect(r.at(0)).assertEqual(2 as byte)
    });

    /**
     * @tc.name testArrayBufferFromSix0071
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_7100
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 71; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      buf.set(3, 4 as byte)
      let r = ArrayBuffer.from(buf, 1 as int, 2 as int)
      expect(r.byteLength).assertEqual(2)
      expect(r.at(0)).assertEqual(2 as byte)
    });

    /**
     * @tc.name testArrayBufferFromSix0072
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_7200
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 72; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      buf.set(3, 4 as byte)
      let r = ArrayBuffer.from(buf, 1 as int, 2 as int)
      expect(r.byteLength).assertEqual(2)
      expect(r.at(0)).assertEqual(2 as byte)
    });

    /**
     * @tc.name testArrayBufferFromSix0073
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_7300
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 73; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      buf.set(3, 4 as byte)
      let r = ArrayBuffer.from(buf, 1 as int, 2 as int)
      expect(r.byteLength).assertEqual(2)
      expect(r.at(0)).assertEqual(2 as byte)
    });

    /**
     * @tc.name testArrayBufferFromSix0074
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_7400
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 74; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      buf.set(3, 4 as byte)
      let r = ArrayBuffer.from(buf, 1 as int, 2 as int)
      expect(r.byteLength).assertEqual(2)
      expect(r.at(0)).assertEqual(2 as byte)
    });

    /**
     * @tc.name testArrayBufferFromSix0075
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_7500
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 75; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      buf.set(3, 4 as byte)
      let r = ArrayBuffer.from(buf, 1 as int, 2 as int)
      expect(r.byteLength).assertEqual(2)
      expect(r.at(0)).assertEqual(2 as byte)
    });

    /**
     * @tc.name testArrayBufferFromSix0076
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_SIX_7600
     * @tc.desc Verify ArrayBuffer_from6 mindmap-ordered case 76; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromSix0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4)
      buf.set(0, 1 as byte)
      buf.set(1, 2 as byte)
      buf.set(2, 3 as byte)
      buf.set(3, 4 as byte)
      let r = ArrayBuffer.from(buf, 1 as int, 2 as int)
      expect(r.byteLength).assertEqual(2)
      expect(r.at(0)).assertEqual(2 as byte)
    });

    return;
  });
}
