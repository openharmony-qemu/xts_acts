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

export default function arrayBufferFromFiveTest(): void {
  describe('ArrayBufferFromFiveTest', (): void => {
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
     * @tc.name testArrayBufferFromFive0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_0100
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 1; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('ABC', 'utf8')
      expect(r.byteLength).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferFromFive0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_0200
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 2; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('Z', 'utf8')
      expect(r.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromFive0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_0300
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 3; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('Z', 'utf8')
      expect(r.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromFive0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_0400
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 4; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('Z', 'utf8')
      expect(r.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromFive0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_0500
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 5; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('Z', 'utf8')
      expect(r.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromFive0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_0600
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 6; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('', 'utf8')
      expect(r.byteLength).assertEqual(0)
    });

    /**
     * @tc.name testArrayBufferFromFive0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_0700
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 7; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('ab', 'utf8')
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromFive0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_0800
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 8; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('ab', 'utf8')
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromFive0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_0900
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 9; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('ab', 'utf8')
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromFive0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_1000
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 10; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('ab', 'utf8')
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromFive0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_1100
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 11; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('ab', 'utf8')
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromFive0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_1200
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 12; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('ab', 'utf8')
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromFive0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_1300
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 13; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('ab', 'utf8')
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromFive0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_1400
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 14; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('ab', 'utf8')
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromFive0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_1500
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 15; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('ab', 'utf8')
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromFive0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_1600
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 16; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('ab', 'utf8')
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromFive0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_1700
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 17; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('Hi', 'utf8')
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromFive0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_1800
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 18; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('Hi', 'utf8')
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromFive0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_1900
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 19; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('Hi', 'utf8')
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromFive0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_2000
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 20; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('Hi', 'utf8')
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromFive0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_2100
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 21; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('Hi', 'utf8')
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromFive0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_2200
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 22; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('Hi', 'utf8')
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromFive0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_2300
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 23; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let r = ArrayBuffer.from('你好', 'utf16le')
        expect(r.byteLength > 0).assertTrue()
      } catch (e) {
        expect(e != null).assertTrue()
      }
    });

    /**
     * @tc.name testArrayBufferFromFive0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_2400
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 24; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('X', 'utf8')
      expect(r.byteLength >= 1).assertTrue()
    });

    /**
     * @tc.name testArrayBufferFromFive0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_2500
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 25; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('X', 'utf-8')
      expect(r.byteLength >= 1).assertTrue()
    });

    /**
     * @tc.name testArrayBufferFromFive0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_2600
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 26; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('X', 'ascii')
      expect(r.byteLength >= 1).assertTrue()
    });

    /**
     * @tc.name testArrayBufferFromFive0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_2700
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 27; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let r = ArrayBuffer.from('A', 'utf16le')
        expect(r.byteLength > 0).assertTrue()
      } catch (e) {
        expect(e != null).assertTrue()
      }
    });

    /**
     * @tc.name testArrayBufferFromFive0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_2800
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 28; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('X', 'ucs2')
      expect(r.byteLength >= 1).assertTrue()
    });

    /**
     * @tc.name testArrayBufferFromFive0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_2900
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 29; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('QQ==', 'base64')
      expect(r.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromFive0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_3000
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 30; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('4142', 'hex')
      expect(r.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromFive0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_3100
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 31; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('X', 'latin1')
      expect(r.byteLength >= 1).assertTrue()
    });

    /**
     * @tc.name testArrayBufferFromFive0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_3200
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 32; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('X', 'binary')
      expect(r.byteLength >= 1).assertTrue()
    });

    /**
     * @tc.name testArrayBufferFromFive0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_3300
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 33; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.from('ABC', 'not_a_real_encoding_xyz')
        expect(true).assertFail()
      } catch (e) {
        expect(e != null).assertTrue()
      }
    });

    /**
     * @tc.name testArrayBufferFromFive0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_3400
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 34; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.from('ABC', 'not_a_real_encoding_xyz')
        expect(true).assertFail()
      } catch (e) {
        expect(e != null).assertTrue()
      }
    });

    /**
     * @tc.name testArrayBufferFromFive0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_3500
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 35; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        ArrayBuffer.from('ABC', 'not_a_real_encoding_xyz')
        expect(true).assertFail()
      } catch (e) {
        expect(e != null).assertTrue()
      }
    });

    /**
     * @tc.name testArrayBufferFromFive0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_3600
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 36; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('ABC', 'UTF8')
      expect(r.byteLength).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferFromFive0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_3700
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 37; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('ABC', 'UTF8')
      expect(r.byteLength).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferFromFive0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_3800
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 38; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('K', 'utf8')
      expect(r.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromFive0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_3900
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 39; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('K', 'utf8')
      expect(r.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromFive0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_4000
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 40; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('K', 'utf8')
      expect(r.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromFive0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_4100
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 41; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('K', 'utf8')
      expect(r.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromFive0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_4200
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 42; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('K', 'utf8')
      expect(r.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromFive0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_4300
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 43; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('K', 'utf8')
      expect(r.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromFive0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_4400
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 44; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('K', 'utf8')
      expect(r.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromFive0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_4500
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 45; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('K', 'utf8')
      expect(r.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromFive0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_4600
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 46; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('K', 'utf8')
      expect(r.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromFive0047
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_4700
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 47; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('K', 'utf8')
      expect(r.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromFive0048
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_4800
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 48; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('K', 'utf8')
      expect(r.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromFive0049
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_4900
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 49; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('K', 'utf8')
      expect(r.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromFive0050
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_5000
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 50; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('K', 'utf8')
      expect(r.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromFive0051
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_5100
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 51; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('K', 'utf8')
      expect(r.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromFive0052
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_5200
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 52; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('K', 'utf8')
      expect(r.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromFive0053
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_5300
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 53; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('K', 'utf8')
      expect(r.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromFive0054
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_5400
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 54; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('K', 'utf8')
      expect(r.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromFive0055
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_5500
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 55; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('K', 'utf8')
      expect(r.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromFive0056
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_5600
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 56; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('K', 'utf8')
      expect(r.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromFive0057
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_5700
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 57; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('K', 'utf8')
      expect(r.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromFive0058
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_5800
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 58; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('K', 'utf8')
      expect(r.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromFive0059
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_5900
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 59; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('K', 'utf8')
      expect(r.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromFive0060
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_6000
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 60; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('K', 'utf8')
      expect(r.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromFive0061
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_6100
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 61; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('K', 'utf8')
      expect(r.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromFive0062
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_6200
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 62; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('K', 'utf8')
      expect(r.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromFive0063
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_6300
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 63; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('K', 'utf8')
      expect(r.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromFive0064
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_6400
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 64; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('K', 'utf8')
      expect(r.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromFive0065
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_6500
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 65; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('K', 'utf8')
      expect(r.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromFive0066
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_6600
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 66; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('K', 'utf8')
      expect(r.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromFive0067
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_6700
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 67; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('K', 'utf8')
      expect(r.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromFive0068
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_6800
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 68; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('K', 'utf8')
      expect(r.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromFive0069
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_6900
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 69; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('K', 'utf8')
      expect(r.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromFive0070
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_7000
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 70; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('K', 'utf8')
      expect(r.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromFive0071
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_7100
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 71; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('K', 'utf8')
      expect(r.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromFive0072
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_7200
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 72; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('K', 'utf8')
      expect(r.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromFive0073
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_7300
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 73; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('K', 'utf8')
      expect(r.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromFive0074
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_7400
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 74; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('K', 'utf8')
      expect(r.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromFive0075
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_7500
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 75; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('K', 'utf8')
      expect(r.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromFive0076
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_7600
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 76; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('K', 'utf8')
      expect(r.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromFive0077
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_7700
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 77; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('K', 'utf8')
      expect(r.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromFive0078
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_7800
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 78; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('K', 'utf8')
      expect(r.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromFive0079
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_7900
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 79; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('K', 'utf8')
      expect(r.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromFive0080
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_8000
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 80; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('K', 'utf8')
      expect(r.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromFive0081
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_8100
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 81; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('K', 'utf8')
      expect(r.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromFive0082
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_8200
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 82; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('K', 'utf8')
      expect(r.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromFive0083
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_8300
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 83; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('K', 'utf8')
      expect(r.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromFive0084
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_8400
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 84; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('K', 'utf8')
      expect(r.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromFive0085
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_8500
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 85; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('K', 'utf8')
      expect(r.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromFive0086
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_8600
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 86; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('K', 'utf8')
      expect(r.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromFive0087
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_8700
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 87; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('K', 'utf8')
      expect(r.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromFive0088
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_8800
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 88; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('K', 'utf8')
      expect(r.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromFive0089
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_8900
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 89; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('K', 'utf8')
      expect(r.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromFive0090
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_9000
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 90; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('K', 'utf8')
      expect(r.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromFive0091
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FIVE_9100
     * @tc.desc Verify ArrayBuffer_from5 mindmap-ordered case 91; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFive0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r = ArrayBuffer.from('K', 'utf8')
      expect(r.byteLength).assertEqual(1)
    });

    return;
  });
}
