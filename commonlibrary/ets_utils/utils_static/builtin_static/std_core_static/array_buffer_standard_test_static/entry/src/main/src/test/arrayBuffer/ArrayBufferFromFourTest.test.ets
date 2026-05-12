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

export default function arrayBufferFromFourTest(): void {
  describe('ArrayBufferFromFourTest', (): void => {
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
     * @tc.name testArrayBufferFromFour0001
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_0100
     * @tc.desc Verify ArrayBuffer_from4 mindmap-ordered case 1; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: double[] = [1.0, 2.0, 3.0]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.byteLength).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferFromFour0002
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_0200
     * @tc.desc Verify ArrayBuffer_from4 mindmap-ordered case 2; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: double[] = [1.0]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromFour0003
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_0300
     * @tc.desc Verify ArrayBuffer_from4 mindmap-ordered case 3; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: double[] = [1.0]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromFour0004
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_0400
     * @tc.desc Verify ArrayBuffer_from4 mindmap-ordered case 4; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: double[] = [1.0]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.byteLength).assertEqual(1)
    });

    /**
     * @tc.name testArrayBufferFromFour0005
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_0500
     * @tc.desc Verify ArrayBuffer_from4 mindmap-ordered case 5; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: double[] = [1.0, 2.0, 3.0, 4.0]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.at(3)).assertEqual(4 as byte)
    });

    /**
     * @tc.name testArrayBufferFromFour0006
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_0600
     * @tc.desc Verify ArrayBuffer_from4 mindmap-ordered case 6; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: double[] = [1.9, 2.5, 3.1, -1.7]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.at(0)).assertEqual(1 as byte)
      expect(buffer.at(3)).assertEqual(-1 as byte)
    });

    /**
     * @tc.name testArrayBufferFromFour0007
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_0700
     * @tc.desc Verify ArrayBuffer_from4 mindmap-ordered case 7; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: double[] = [0.0]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.at(0)).assertEqual(0 as byte)
    });

    /**
     * @tc.name testArrayBufferFromFour0008
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_0800
     * @tc.desc Verify ArrayBuffer_from4 mindmap-ordered case 8; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: double[] = [-1.0, -128.0, -10.5]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.byteLength).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferFromFour0009
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_0900
     * @tc.desc Verify ArrayBuffer_from4 mindmap-ordered case 9; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: double[] = []
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.byteLength).assertEqual(0)
    });

    /**
     * @tc.name testArrayBufferFromFour0010
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_1000
     * @tc.desc Verify ArrayBuffer_from4 mindmap-ordered case 10; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: double[] = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.byteLength).assertEqual(10)
    });

    /**
     * @tc.name testArrayBufferFromFour0011
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_1100
     * @tc.desc Verify ArrayBuffer_from4 mindmap-ordered case 11; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: double[] = [1.0, Number.NaN, 3.0]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.byteLength).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferFromFour0012
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_1200
     * @tc.desc Verify ArrayBuffer_from4 mindmap-ordered case 12; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: double[] = [1.0, Infinity, -Infinity]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.byteLength).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferFromFour0013
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_1300
     * @tc.desc Verify ArrayBuffer_from4 mindmap-ordered case 13; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: double[] = [128.0, 255.0, 256.0]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.byteLength).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferFromFour0014
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_1400
     * @tc.desc Verify ArrayBuffer_from4 mindmap-ordered case 14; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: double[] = [128.0, 255.0, 256.0]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.byteLength).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferFromFour0015
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_1500
     * @tc.desc Verify ArrayBuffer_from4 mindmap-ordered case 15; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: double[] = [127.0]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.at(0)).assertEqual(127 as byte)
    });

    /**
     * @tc.name testArrayBufferFromFour0016
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_1600
     * @tc.desc Verify ArrayBuffer_from4 mindmap-ordered case 16; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: double[] = [-128.0]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.at(0)).assertEqual(-128 as byte)
    });

    /**
     * @tc.name testArrayBufferFromFour0017
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_1700
     * @tc.desc Verify ArrayBuffer_from4 mindmap-ordered case 17; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: double[] = [1.0, 2.0]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromFour0018
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_1800
     * @tc.desc Verify ArrayBuffer_from4 mindmap-ordered case 18; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: double[] = [1.0, 2.0]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromFour0019
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_1900
     * @tc.desc Verify ArrayBuffer_from4 mindmap-ordered case 19; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: double[] = [1.0, 2.0]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromFour0020
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_2000
     * @tc.desc Verify ArrayBuffer_from4 mindmap-ordered case 20; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: double[] = [1.0, 2.0]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromFour0021
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_2100
     * @tc.desc Verify ArrayBuffer_from4 mindmap-ordered case 21; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: double[] = [1.0, 2.0]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromFour0022
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_2200
     * @tc.desc Verify ArrayBuffer_from4 mindmap-ordered case 22; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: double[] = [1.0, 2.0]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromFour0023
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_2300
     * @tc.desc Verify ArrayBuffer_from4 mindmap-ordered case 23; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: double[] = [1.0, 2.0, 3.0]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.byteLength).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferFromFour0024
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_2400
     * @tc.desc Verify ArrayBuffer_from4 mindmap-ordered case 24; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: double[] = [1.0, 2.0, 3.0]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.byteLength).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferFromFour0025
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_2500
     * @tc.desc Verify ArrayBuffer_from4 mindmap-ordered case 25; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: double[] = [1.0, 2.0, 3.0]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.byteLength).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferFromFour0026
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_2600
     * @tc.desc Verify ArrayBuffer_from4 mindmap-ordered case 26; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: double[] = [1.0, 2.0, 3.0]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.byteLength).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferFromFour0027
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_2700
     * @tc.desc Verify ArrayBuffer_from4 mindmap-ordered case 27; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: double[] = [1.0, 2.0, 3.0]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.byteLength).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferFromFour0028
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_2800
     * @tc.desc Verify ArrayBuffer_from4 mindmap-ordered case 28; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: double[] = [1.0, 2.0, 3.0]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.byteLength).assertEqual(3)
    });

    /**
     * @tc.name testArrayBufferFromFour0029
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_2900
     * @tc.desc Verify ArrayBuffer_from4 mindmap-ordered case 29; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: double[] = [1.0, 2.2, 3.7]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.at(1)).assertEqual(2 as byte)
    });

    /**
     * @tc.name testArrayBufferFromFour0030
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_3000
     * @tc.desc Verify ArrayBuffer_from4 mindmap-ordered case 30; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: double[] = [-2.9]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.at(0)).assertEqual(-2 as byte)
    });

    /**
     * @tc.name testArrayBufferFromFour0031
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_3100
     * @tc.desc Verify ArrayBuffer_from4 mindmap-ordered case 31; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: double[] = [0.0]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.at(0)).assertEqual(0 as byte)
    });

    /**
     * @tc.name testArrayBufferFromFour0032
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_3200
     * @tc.desc Verify ArrayBuffer_from4 mindmap-ordered case 32; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: double[] = [127.0]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.at(0)).assertEqual(127 as byte)
    });

    /**
     * @tc.name testArrayBufferFromFour0033
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_3300
     * @tc.desc Verify ArrayBuffer_from4 mindmap-ordered case 33; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: double[] = [127.0]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.at(0)).assertEqual(127 as byte)
    });

    /**
     * @tc.name testArrayBufferFromFour0034
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_3400
     * @tc.desc Verify ArrayBuffer_from4 mindmap-ordered case 34; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: double[] = [1.0, 2.0, 3.0]
      let buffer = ArrayBuffer.from(arr)
      for (let j: int = 0; j < 3; j++) {
        expect(buffer.at(j)).assertEqual((j + 1) as byte)
      }
    });

    /**
     * @tc.name testArrayBufferFromFour0035
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_3500
     * @tc.desc Verify ArrayBuffer_from4 mindmap-ordered case 35; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: double[] = [1.0, 2.0, 3.0]
      let buffer = ArrayBuffer.from(arr)
      let arr2: double[] = [99.0, 2.0, 3.0]
      let buffer2 = ArrayBuffer.from(arr2)
      expect(buffer.at(0)).assertEqual(1 as byte)
      expect(buffer2.at(0)).assertEqual(99 as byte)
    });

    /**
     * @tc.name testArrayBufferFromFour0036
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_3600
     * @tc.desc Verify ArrayBuffer_from4 mindmap-ordered case 36; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: double[] = [10.0, 20.0]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.at(0)).assertEqual(10 as byte)
      buffer.set(0, 99 as byte)
      expect(buffer.at(0)).assertEqual(99 as byte)
    });

    /**
     * @tc.name testArrayBufferFromFour0037
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_3700
     * @tc.desc Verify ArrayBuffer_from4 mindmap-ordered case 37; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: double[] = [1.0, 2.0, 3.0]
      let buffer = ArrayBuffer.from(arr)
      let buffer = ArrayBuffer.from(arr)
      buffer.set(0, 99 as byte)
      let b2 = ArrayBuffer.from(arr)
      expect(b2.at(0)).assertEqual(1 as byte)
    });

    /**
     * @tc.name testArrayBufferFromFour0038
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_3800
     * @tc.desc Verify ArrayBuffer_from4 mindmap-ordered case 38; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: double[] = [1.0, 2.0]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromFour0039
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_3900
     * @tc.desc Verify ArrayBuffer_from4 mindmap-ordered case 39; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: double[] = [1.0, 2.0]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromFour0040
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_4000
     * @tc.desc Verify ArrayBuffer_from4 mindmap-ordered case 40; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: double[] = [1.0, 2.0]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromFour0041
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_4100
     * @tc.desc Verify ArrayBuffer_from4 mindmap-ordered case 41; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: double[] = [1.0, 2.0]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromFour0042
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_4200
     * @tc.desc Verify ArrayBuffer_from4 mindmap-ordered case 42; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: double[] = [1.0, 2.0]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromFour0043
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_4300
     * @tc.desc Verify ArrayBuffer_from4 mindmap-ordered case 43; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: double[] = [1.0, 2.0]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromFour0044
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_4400
     * @tc.desc Verify ArrayBuffer_from4 mindmap-ordered case 44; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: double[] = [1.0, 2.0]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromFour0045
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_4500
     * @tc.desc Verify ArrayBuffer_from4 mindmap-ordered case 45; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: double[] = [1.0, 2.0]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromFour0046
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_4600
     * @tc.desc Verify ArrayBuffer_from4 mindmap-ordered case 46; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: double[] = [1.0, 2.0]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromFour0047
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_4700
     * @tc.desc Verify ArrayBuffer_from4 mindmap-ordered case 47; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: double[] = [1.0, 2.0]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.byteLength).assertEqual(2)
    });

    /**
     * @tc.name testArrayBufferFromFour0048
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_BUFFER_FROM_FOUR_4800
     * @tc.desc Verify ArrayBuffer_from4 mindmap-ordered case 48; align STA from overloads and ArkTS constraints.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL2
     */
    it('testArrayBufferFromFour0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: double[] = [1.0, 2.0]
      let buffer = ArrayBuffer.from(arr)
      expect(buffer.byteLength).assertEqual(2)
    });

    return;
  });
}
