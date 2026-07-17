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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function uint16ArrayIncludesPart2Test(): void {
  describe('Uint16ArrayIncludesPart2Test', () => {
    beforeAll(() => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART2_0100
     * @tc.name testUint16ArrayIncludesPart2_001
     * @tc.desc Verify includes boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart2_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
      let result: boolean = arr.includes(2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART2_0200
     * @tc.name testUint16ArrayIncludesPart2_002
     * @tc.desc Verify includes true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart2_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
      let result: boolean = arr.includes(1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART2_0300
     * @tc.name testUint16ArrayIncludesPart2_003
     * @tc.desc Verify includes false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart2_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
      let result: boolean = arr.includes(4);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART2_0400
     * @tc.name testUint16ArrayIncludesPart2_004
     * @tc.desc Verify includes 0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart2_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(0);
      let result: boolean = arr.includes(0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART2_0500
     * @tc.name testUint16ArrayIncludesPart2_005
     * @tc.desc Verify includes false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart2_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(0);
      let result: boolean = arr.includes(1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART2_0600
     * @tc.name testUint16ArrayIncludesPart2_006
     * @tc.desc Verify includes true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart2_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(65535);
      let result: boolean = arr.includes(65535);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART2_0700
     * @tc.name testUint16ArrayIncludesPart2_007
     * @tc.desc Verify includes false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart2_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(65535);
      let result: boolean = arr.includes(65534);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART2_0800
     * @tc.name testUint16ArrayIncludesPart2_008
     * @tc.desc Verify includes 0 0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart2_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(0, 65535);
      let result: boolean = arr.includes(0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART2_0900
     * @tc.name testUint16ArrayIncludesPart2_009
     * @tc.desc Verify includes 0 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart2_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(0, 65535);
      let result: boolean = arr.includes(32768);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART2_1000
     * @tc.name testUint16ArrayIncludesPart2_010
     * @tc.desc Verify includes 0 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart2_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of();
      let result: boolean = arr.includes(0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART2_1100
     * @tc.name testUint16ArrayIncludesPart2_011
     * @tc.desc Verify includes constructor(int) true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart2_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr[0] = 15;
      arr[1] = 30;
      arr[2] = 45;
      let result: boolean = arr.includes(30);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART2_1200
     * @tc.name testUint16ArrayIncludesPart2_012
     * @tc.desc Verify includes constructor(int) false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart2_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr[0] = 15;
      arr[1] = 30;
      arr[2] = 45;
      let result: boolean = arr.includes(60);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART2_1300
     * @tc.name testUint16ArrayIncludesPart2_013
     * @tc.desc Verify includes true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart2_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Uint16Array = Uint16Array.of(7, 8, 9);
      let arr: Uint16Array = new Uint16Array(src);
      let result: boolean = arr.includes(8);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART2_1400
     * @tc.name testUint16ArrayIncludesPart2_014
     * @tc.desc Verify includes false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart2_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Uint16Array = Uint16Array.of(7, 8, 9);
      let arr: Uint16Array = new Uint16Array(src);
      let result: boolean = arr.includes(10);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART2_1500
     * @tc.name testUint16ArrayIncludesPart2_015
     * @tc.desc Verify includes fromIndex false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart2_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
      let result: boolean = arr.includes(1, 1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART2_1600
     * @tc.name testUint16ArrayIncludesPart2_016
     * @tc.desc Verify includes length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart2_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
      let initialLen: int = arr.length;
      arr.includes(2);
      expect(arr.length).assertEqual(initialLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART2_1700
     * @tc.name testUint16ArrayIncludesPart2_017
     * @tc.desc Verify includes byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart2_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
      let initialByteLen: int = arr.byteLength;
      arr.includes(2);
      expect(arr.byteLength).assertEqual(initialByteLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART2_1800
     * @tc.name testUint16ArrayIncludesPart2_018
     * @tc.desc Verify includes byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart2_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
      let initialOffset: int = arr.byteOffset;
      arr.includes(2);
      expect(arr.byteOffset).assertEqual(initialOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART2_1900
     * @tc.name testUint16ArrayIncludesPart2_019
     * @tc.desc Verify includes buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart2_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
      let buf: ArrayBuffer = arr.buffer;
      arr.includes(2);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART2_2000
     * @tc.name testUint16ArrayIncludesPart2_020
     * @tc.desc Verify includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart2_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
      let first: number = arr[0];
      arr.includes(2);
      expect(arr.at(0)).assertEqual(first);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART2_2100
     * @tc.name testUint16ArrayIncludesPart2_021
     * @tc.desc Verify includes length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart2_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(0, 65535);
      let initialLen: int = arr.length;
      arr.includes(65535);
      expect(arr.length).assertEqual(initialLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART2_2200
     * @tc.name testUint16ArrayIncludesPart2_022
     * @tc.desc Verify includes byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart2_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(0, 65535);
      let initialByteLen: int = arr.byteLength;
      arr.includes(65535);
      expect(arr.byteLength).assertEqual(initialByteLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART2_2300
     * @tc.name testUint16ArrayIncludesPart2_023
     * @tc.desc Verify includes byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart2_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(0, 65535);
      let initialOffset: int = arr.byteOffset;
      arr.includes(65535);
      expect(arr.byteOffset).assertEqual(initialOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART2_2400
     * @tc.name testUint16ArrayIncludesPart2_024
     * @tc.desc Verify includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart2_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(0, 65535);
      let first: number = arr[0];
      arr.includes(65535);
      expect(arr.at(0)).assertEqual(first);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART2_2500
     * @tc.name testUint16ArrayIncludesPart2_025
     * @tc.desc Verify includes fromIndex length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart2_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
      let initialLen: int = arr.length;
      arr.includes(2, 1);
      expect(arr.length).assertEqual(initialLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART2_2600
     * @tc.name testUint16ArrayIncludesPart2_026
     * @tc.desc Verify includes fromIndex byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart2_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
      let initialByteLen: int = arr.byteLength;
      arr.includes(2, 1);
      expect(arr.byteLength).assertEqual(initialByteLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART2_2700
     * @tc.name testUint16ArrayIncludesPart2_027
     * @tc.desc Verify includes fromIndex length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart2_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
      let initialLen: int = arr.length;
      arr.includes(2, -1);
      expect(arr.length).assertEqual(initialLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART2_2800
     * @tc.name testUint16ArrayIncludesPart2_028
     * @tc.desc Verify includes length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart2_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Uint16Array = Uint16Array.of(4, 5, 6);
      let arr: Uint16Array = new Uint16Array(src);
      let initialLen: int = arr.length;
      arr.includes(5);
      expect(arr.length).assertEqual(initialLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART2_2900
     * @tc.name testUint16ArrayIncludesPart2_029
     * @tc.desc Verify subarray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart2_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let view: Uint16Array = arr.subarray(1, 4);
      expect(view.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART2_3000
     * @tc.name testUint16ArrayIncludesPart2_030
     * @tc.desc Verify subarray byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart2_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let view: Uint16Array = arr.subarray(2, 4);
      expect(view.byteOffset).assertEqual(arr.byteOffset + 4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART2_3100
     * @tc.name testUint16ArrayIncludesPart2_031
     * @tc.desc Verify subarray byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart2_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let view: Uint16Array = arr.subarray(1, 4);
      expect(view.byteLength).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART2_3200
     * @tc.name testUint16ArrayIncludesPart2_032
     * @tc.desc Verify includes subarray true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart2_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let view: Uint16Array = arr.subarray(1, 4);
      let result: boolean = view.includes(30);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART2_3300
     * @tc.name testUint16ArrayIncludesPart2_033
     * @tc.desc Verify includes subarray false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart2_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let view: Uint16Array = arr.subarray(1, 4);
      let result: boolean = view.includes(10);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART2_3400
     * @tc.name testUint16ArrayIncludesPart2_034
     * @tc.desc Verify includes subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart2_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let view: Uint16Array = arr.subarray(1, 4);
      let first: number = arr[0];
      view.includes(30);
      expect(arr.at(0)).assertEqual(first);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART2_3500
     * @tc.name testUint16ArrayIncludesPart2_035
     * @tc.desc Verify includes subarray length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart2_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let view: Uint16Array = arr.subarray(1, 4);
      let initialLen: int = arr.length;
      view.includes(30);
      expect(arr.length).assertEqual(initialLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART2_3600
     * @tc.name testUint16ArrayIncludesPart2_036
     * @tc.desc Verify includes subarray 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart2_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 0, 30, 40, 50);
      let view: Uint16Array = arr.subarray(1, 4);
      let result: boolean = view.includes(0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART2_3700
     * @tc.name testUint16ArrayIncludesPart2_037
     * @tc.desc Verify includes subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart2_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 65535, 30, 40, 50);
      let view: Uint16Array = arr.subarray(1, 4);
      let result: boolean = view.includes(65535);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART2_3800
     * @tc.name testUint16ArrayIncludesPart2_038
     * @tc.desc Verify includes subarray false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart2_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(65535, 20, 30, 40, 50);
      let view: Uint16Array = arr.subarray(1, 4);
      let result: boolean = view.includes(65535);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART2_3900
     * @tc.name testUint16ArrayIncludesPart2_039
     * @tc.desc Verify includes subarray fromIndex true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart2_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let view: Uint16Array = arr.subarray(1, 4);
      let result: boolean = view.includes(40, 2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART2_4000
     * @tc.name testUint16ArrayIncludesPart2_040
     * @tc.desc Verify includes subarray fromIndex false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart2_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let view: Uint16Array = arr.subarray(1, 4);
      let result: boolean = view.includes(30, 3);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART2_4100
     * @tc.name testUint16ArrayIncludesPart2_041
     * @tc.desc Verify includes subarray byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart2_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let view: Uint16Array = arr.subarray(1, 4);
      let initialOffset: int = view.byteOffset;
      view.includes(30);
      expect(view.byteOffset).assertEqual(initialOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART2_4200
     * @tc.name testUint16ArrayIncludesPart2_042
     * @tc.desc Verify includes subarray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart2_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let view: Uint16Array = arr.subarray(1, 4);
      let buf: ArrayBuffer = view.buffer;
      view.includes(30);
      expect(view.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART2_4300
     * @tc.name testUint16ArrayIncludesPart2_043
     * @tc.desc Verify includes subarray-of-subarray true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart2_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let view1: Uint16Array = arr.subarray(1, 4);
      let view2: Uint16Array = view1.subarray(1, 3);
      let result: boolean = view2.includes(40);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART2_4400
     * @tc.name testUint16ArrayIncludesPart2_044
     * @tc.desc Verify includes subarray-of-subarray false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart2_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let view1: Uint16Array = arr.subarray(1, 4);
      let view2: Uint16Array = view1.subarray(1, 3);
      let result: boolean = view2.includes(20);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART2_4500
     * @tc.name testUint16ArrayIncludesPart2_045
     * @tc.desc Verify includes subarray-of-subarray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart2_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let view1: Uint16Array = arr.subarray(1, 4);
      let view2: Uint16Array = view1.subarray(1, 3);
      expect(view2.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART2_4600
     * @tc.name testUint16ArrayIncludesPart2_046
     * @tc.desc Verify includes subarray fromIndex true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart2_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let view: Uint16Array = arr.subarray(1, 4);
      let result: boolean = view.includes(40, -1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART2_4700
     * @tc.name testUint16ArrayIncludesPart2_047
     * @tc.desc Verify includes subarray fromIndex false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart2_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let view: Uint16Array = arr.subarray(1, 4);
      let result: boolean = view.includes(20, -3);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART2_4800
     * @tc.name testUint16ArrayIncludesPart2_048
     * @tc.desc Verify includes subarray bytelength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart2_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let view: Uint16Array = arr.subarray(1, 3);
      expect((view.byteLength) !== (arr.byteLength)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART2_4900
     * @tc.name testUint16ArrayIncludesPart2_049
     * @tc.desc Verify includes subarray byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart2_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let view: Uint16Array = arr.subarray(1, 4);
      let initialByteLen: int = arr.byteLength;
      view.includes(30);
      expect(arr.byteLength).assertEqual(initialByteLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART2_5000
     * @tc.name testUint16ArrayIncludesPart2_050
     * @tc.desc Verify includes subarray fromIndex 1.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart2_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let view: Uint16Array = arr.subarray(1, 4);
      let result: boolean = view.includes(30, Double.toInt(1.5));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART2_5100
     * @tc.name testUint16ArrayIncludesPart2_051
     * @tc.desc Verify includes subarray fromIndex NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart2_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let view: Uint16Array = arr.subarray(1, 4);
      let result: boolean = view.includes(20, Double.toInt(Number.NaN));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART2_5200
     * @tc.name testUint16ArrayIncludesPart2_052
     * @tc.desc Verify includes subarray fromIndex Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart2_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let view: Uint16Array = arr.subarray(1, 4);
      let result: boolean = view.includes(40, Double.toInt(Number.POSITIVE_INFINITY));
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART2_5300
     * @tc.name testUint16ArrayIncludesPart2_053
     * @tc.desc Verify includes subarray fromIndex using view.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart2_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let view: Uint16Array = arr.subarray(1, 4);
      let result: boolean = view.includes(40, view.length - 1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART2_5400
     * @tc.name testUint16ArrayIncludesPart2_054
     * @tc.desc Verify includes subarray fromIndex using view.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart2_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let view: Uint16Array = arr.subarray(1, 4);
      let result: boolean = view.includes(30, view.byteLength / 2 - 1);
      expect(view.includes(40, view.byteLength / 2 - 1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART2_5500
     * @tc.name testUint16ArrayIncludesPart2_055
     * @tc.desc Verify includes subarray fromIndex using view.byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart2_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let view: Uint16Array = arr.subarray(2, 5);
      let result: boolean = view.includes(30, 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART2_5600
     * @tc.name testUint16ArrayIncludesPart2_056
     * @tc.desc Verify includes subarray fromIndex 0o1 (octal)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart2_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let view: Uint16Array = arr.subarray(1, 4);
      let result: boolean = view.includes(30, 0o1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART2_5700
     * @tc.name testUint16ArrayIncludesPart2_057
     * @tc.desc Verify includes subarray fromIndex 0b10 (binary)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart2_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let view: Uint16Array = arr.subarray(1, 5);
      let result: boolean = view.includes(40, 0b10);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART2_5800
     * @tc.name testUint16ArrayIncludesPart2_058
     * @tc.desc Verify includes observes a value written through an alias
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart2_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer: ArrayBuffer = new ArrayBuffer(6);
            let arr: Uint16Array = new Uint16Array(buffer);
            let alias: Uint16Array = new Uint16Array(buffer);
            alias[1] = 50;
            expect(arr.includes(50)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART2_5900
     * @tc.name testUint16ArrayIncludesPart2_059
     * @tc.desc Verify includes offset view excludes a matching value before its range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart2_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let all: Uint16Array = Uint16Array.of(9, 1, 2);
            let view: Uint16Array = new Uint16Array(all.buffer, 2, 2);
            expect(view.includes(9)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART2_6000
     * @tc.name testUint16ArrayIncludesPart2_060
     * @tc.desc Verify includes offset view includes a matching value inside its range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart2_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let all: Uint16Array = Uint16Array.of(9, 1, 2);
            let view: Uint16Array = new Uint16Array(all.buffer, 2, 2);
            expect(view.includes(2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART2_6100
     * @tc.name testUint16ArrayIncludesPart2_061
     * @tc.desc Verify includes alias replacement removes a previously included value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart2_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer: ArrayBuffer = new ArrayBuffer(4);
            let arr: Uint16Array = new Uint16Array(buffer);
            arr.set([7, 8]);
            let alias: Uint16Array = new Uint16Array(buffer);
            alias[0] = 6;
            expect(arr.includes(7)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART2_6200
     * @tc.name testUint16ArrayIncludesPart2_062
     * @tc.desc Verify includes applies fromIndex relative to a nonzero-offset view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart2_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let backing: Uint16Array = Uint16Array.of(9, 7, 8, 7, 9);
      let view: Uint16Array = new Uint16Array(backing.buffer, 2, 3);
      expect(view.includes(7, 1)).assertTrue();
      expect(view.includes(7, 3)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_PART2_6300
     * @tc.name testUint16ArrayIncludesPart2_063
     * @tc.desc Verify construction converts stored values while search arguments remain unconverted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesPart2_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array: Uint16Array = Uint16Array.of(-1, 65536, -1);
      expect(array.join('|')).assertEqual('65535|0|65535');
      expect(array.includes(-1)).assertFalse();
      expect(array.indexOf(-1)).assertEqual(-1);
      expect(array.lastIndexOf(-1)).assertEqual(-1);
      expect(array.includes(65535)).assertTrue();
      expect(array.indexOf(65535)).assertEqual(0);
      expect(array.lastIndexOf(65535)).assertEqual(2);
    });

  });
}
