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

export default function uint16ArrayIncludes02Test(): void {
  describe('Uint16ArrayIncludes02Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_TWO_0100
     * @tc.name testUint16ArrayIncludesTwo001
     * @tc.desc Verify includes boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
      let result: boolean = arr.includes(2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_TWO_0200
     * @tc.name testUint16ArrayIncludesTwo002
     * @tc.desc Verify includes true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
      let result: boolean = arr.includes(1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_TWO_0300
     * @tc.name testUint16ArrayIncludesTwo003
     * @tc.desc Verify includes false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
      let result: boolean = arr.includes(4);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_TWO_0400
     * @tc.name testUint16ArrayIncludesTwo004
     * @tc.desc Verify includes 0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(0);
      let result: boolean = arr.includes(0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_TWO_0500
     * @tc.name testUint16ArrayIncludesTwo005
     * @tc.desc Verify includes false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(0);
      let result: boolean = arr.includes(1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_TWO_0600
     * @tc.name testUint16ArrayIncludesTwo006
     * @tc.desc Verify includes true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(65535);
      let result: boolean = arr.includes(65535);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_TWO_0700
     * @tc.name testUint16ArrayIncludesTwo007
     * @tc.desc Verify includes false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(65535);
      let result: boolean = arr.includes(65534);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_TWO_0800
     * @tc.name testUint16ArrayIncludesTwo008
     * @tc.desc Verify includes 0 0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(0, 65535);
      let result: boolean = arr.includes(0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_TWO_0900
     * @tc.name testUint16ArrayIncludesTwo009
     * @tc.desc Verify includes 0 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(0, 65535);
      let result: boolean = arr.includes(32768);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_TWO_1000
     * @tc.name testUint16ArrayIncludesTwo010
     * @tc.desc Verify includes 0 false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of();
      let result: boolean = arr.includes(0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_TWO_1100
     * @tc.name testUint16ArrayIncludesTwo011
     * @tc.desc Verify includes constructor(int) true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr[0] = 15;
      arr[1] = 30;
      arr[2] = 45;
      let result: boolean = arr.includes(30);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_TWO_1200
     * @tc.name testUint16ArrayIncludesTwo012
     * @tc.desc Verify includes constructor(int) false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(3);
      arr[0] = 15;
      arr[1] = 30;
      arr[2] = 45;
      let result: boolean = arr.includes(60);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_TWO_1300
     * @tc.name testUint16ArrayIncludesTwo013
     * @tc.desc Verify includes true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Uint16Array = Uint16Array.of(7, 8, 9);
      let arr: Uint16Array = new Uint16Array(src);
      let result: boolean = arr.includes(8);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_TWO_1400
     * @tc.name testUint16ArrayIncludesTwo014
     * @tc.desc Verify includes false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Uint16Array = Uint16Array.of(7, 8, 9);
      let arr: Uint16Array = new Uint16Array(src);
      let result: boolean = arr.includes(10);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_TWO_1500
     * @tc.name testUint16ArrayIncludesTwo015
     * @tc.desc Verify includes fromIndex false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
      let result: boolean = arr.includes(1, 1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_TWO_1600
     * @tc.name testUint16ArrayIncludesTwo016
     * @tc.desc Verify includes length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
      let initialLen: int = arr.length;
      arr.includes(2);
      expect(arr.length).assertEqual(initialLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_TWO_1700
     * @tc.name testUint16ArrayIncludesTwo017
     * @tc.desc Verify includes byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
      let initialByteLen: int = arr.byteLength;
      arr.includes(2);
      expect(arr.byteLength).assertEqual(initialByteLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_TWO_1800
     * @tc.name testUint16ArrayIncludesTwo018
     * @tc.desc Verify includes byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
      let initialOffset: int = arr.byteOffset;
      arr.includes(2);
      expect(arr.byteOffset).assertEqual(initialOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_TWO_1900
     * @tc.name testUint16ArrayIncludesTwo019
     * @tc.desc Verify includes buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
      let buf: ArrayBuffer = arr.buffer;
      arr.includes(2);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_TWO_2000
     * @tc.name testUint16ArrayIncludesTwo020
     * @tc.desc Verify includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
      let first: number = arr[0];
      arr.includes(2);
      expect(arr.at(0)).assertEqual(first);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_TWO_2100
     * @tc.name testUint16ArrayIncludesTwo021
     * @tc.desc Verify includes length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(0, 65535);
      let initialLen: int = arr.length;
      arr.includes(65535);
      expect(arr.length).assertEqual(initialLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_TWO_2200
     * @tc.name testUint16ArrayIncludesTwo022
     * @tc.desc Verify includes byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(0, 65535);
      let initialByteLen: int = arr.byteLength;
      arr.includes(65535);
      expect(arr.byteLength).assertEqual(initialByteLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_TWO_2300
     * @tc.name testUint16ArrayIncludesTwo023
     * @tc.desc Verify includes byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(0, 65535);
      let initialOffset: int = arr.byteOffset;
      arr.includes(65535);
      expect(arr.byteOffset).assertEqual(initialOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_TWO_2400
     * @tc.name testUint16ArrayIncludesTwo024
     * @tc.desc Verify includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(0, 65535);
      let first: number = arr[0];
      arr.includes(65535);
      expect(arr.at(0)).assertEqual(first);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_TWO_2500
     * @tc.name testUint16ArrayIncludesTwo025
     * @tc.desc Verify includes fromIndex length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
      let initialLen: int = arr.length;
      arr.includes(2, 1);
      expect(arr.length).assertEqual(initialLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_TWO_2600
     * @tc.name testUint16ArrayIncludesTwo026
     * @tc.desc Verify includes fromIndex byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
      let initialByteLen: int = arr.byteLength;
      arr.includes(2, 1);
      expect(arr.byteLength).assertEqual(initialByteLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_TWO_2700
     * @tc.name testUint16ArrayIncludesTwo027
     * @tc.desc Verify includes fromIndex length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
      let initialLen: int = arr.length;
      arr.includes(2, -1);
      expect(arr.length).assertEqual(initialLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_TWO_2800
     * @tc.name testUint16ArrayIncludesTwo028
     * @tc.desc Verify includes length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Uint16Array = Uint16Array.of(4, 5, 6);
      let arr: Uint16Array = new Uint16Array(src);
      let initialLen: int = arr.length;
      arr.includes(5);
      expect(arr.length).assertEqual(initialLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_TWO_2900
     * @tc.name testUint16ArrayIncludesTwo029
     * @tc.desc Verify subarray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let view: Uint16Array = arr.subarray(1, 4);
      expect(view.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_TWO_3000
     * @tc.name testUint16ArrayIncludesTwo030
     * @tc.desc Verify subarray byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let view: Uint16Array = arr.subarray(2, 4);
      expect(view.byteOffset).assertEqual(arr.byteOffset + 4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_TWO_3100
     * @tc.name testUint16ArrayIncludesTwo031
     * @tc.desc Verify subarray byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let view: Uint16Array = arr.subarray(1, 4);
      expect(view.byteLength).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_TWO_3200
     * @tc.name testUint16ArrayIncludesTwo032
     * @tc.desc Verify includes subarray true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let view: Uint16Array = arr.subarray(1, 4);
      let result: boolean = view.includes(30);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_TWO_3300
     * @tc.name testUint16ArrayIncludesTwo033
     * @tc.desc Verify includes subarray false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let view: Uint16Array = arr.subarray(1, 4);
      let result: boolean = view.includes(10);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_TWO_3400
     * @tc.name testUint16ArrayIncludesTwo034
     * @tc.desc Verify includes subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let view: Uint16Array = arr.subarray(1, 4);
      let first: number = arr[0];
      view.includes(30);
      expect(arr.at(0)).assertEqual(first);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_TWO_3500
     * @tc.name testUint16ArrayIncludesTwo035
     * @tc.desc Verify includes subarray length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let view: Uint16Array = arr.subarray(1, 4);
      let initialLen: int = arr.length;
      view.includes(30);
      expect(arr.length).assertEqual(initialLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_TWO_3600
     * @tc.name testUint16ArrayIncludesTwo036
     * @tc.desc Verify includes subarray 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 0, 30, 40, 50);
      let view: Uint16Array = arr.subarray(1, 4);
      let result: boolean = view.includes(0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_TWO_3700
     * @tc.name testUint16ArrayIncludesTwo037
     * @tc.desc Verify includes subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 65535, 30, 40, 50);
      let view: Uint16Array = arr.subarray(1, 4);
      let result: boolean = view.includes(65535);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_TWO_3800
     * @tc.name testUint16ArrayIncludesTwo038
     * @tc.desc Verify includes subarray false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(65535, 20, 30, 40, 50);
      let view: Uint16Array = arr.subarray(1, 4);
      let result: boolean = view.includes(65535);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_TWO_3900
     * @tc.name testUint16ArrayIncludesTwo039
     * @tc.desc Verify includes subarray fromIndex true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let view: Uint16Array = arr.subarray(1, 4);
      let result: boolean = view.includes(40, 2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_TWO_4000
     * @tc.name testUint16ArrayIncludesTwo040
     * @tc.desc Verify includes subarray fromIndex false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let view: Uint16Array = arr.subarray(1, 4);
      let result: boolean = view.includes(30, 3);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_TWO_4100
     * @tc.name testUint16ArrayIncludesTwo041
     * @tc.desc Verify includes subarray byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let view: Uint16Array = arr.subarray(1, 4);
      let initialOffset: int = view.byteOffset;
      view.includes(30);
      expect(view.byteOffset).assertEqual(initialOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_TWO_4200
     * @tc.name testUint16ArrayIncludesTwo042
     * @tc.desc Verify includes subarray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let view: Uint16Array = arr.subarray(1, 4);
      let buf: ArrayBuffer = view.buffer;
      view.includes(30);
      expect(view.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_TWO_4300
     * @tc.name testUint16ArrayIncludesTwo043
     * @tc.desc Verify includes subarray-of-subarray true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let view1: Uint16Array = arr.subarray(1, 4);
      let view2: Uint16Array = view1.subarray(1, 3);
      let result: boolean = view2.includes(40);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_TWO_4400
     * @tc.name testUint16ArrayIncludesTwo044
     * @tc.desc Verify includes subarray-of-subarray false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let view1: Uint16Array = arr.subarray(1, 4);
      let view2: Uint16Array = view1.subarray(1, 3);
      let result: boolean = view2.includes(20);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_TWO_4500
     * @tc.name testUint16ArrayIncludesTwo045
     * @tc.desc Verify includes subarray-of-subarray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let view1: Uint16Array = arr.subarray(1, 4);
      let view2: Uint16Array = view1.subarray(1, 3);
      expect(view2.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_TWO_4600
     * @tc.name testUint16ArrayIncludesTwo046
     * @tc.desc Verify includes subarray fromIndex true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let view: Uint16Array = arr.subarray(1, 4);
      let result: boolean = view.includes(40, -1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_TWO_4700
     * @tc.name testUint16ArrayIncludesTwo047
     * @tc.desc Verify includes subarray fromIndex false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let view: Uint16Array = arr.subarray(1, 4);
      let result: boolean = view.includes(20, -3);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_TWO_4800
     * @tc.name testUint16ArrayIncludesTwo048
     * @tc.desc Verify includes subarray bytelength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let view: Uint16Array = arr.subarray(1, 3);
      expect((view.byteLength) !== (arr.byteLength)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_TWO_4900
     * @tc.name testUint16ArrayIncludesTwo049
     * @tc.desc Verify includes subarray byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let view: Uint16Array = arr.subarray(1, 4);
      let initialByteLen: int = arr.byteLength;
      view.includes(30);
      expect(arr.byteLength).assertEqual(initialByteLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_TWO_5000
     * @tc.name testUint16ArrayIncludesTwo050
     * @tc.desc Verify includes subarray fromIndex 1.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let view: Uint16Array = arr.subarray(1, 4);
      let result: boolean = view.includes(30, Double.toInt(1.5));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_TWO_5100
     * @tc.name testUint16ArrayIncludesTwo051
     * @tc.desc Verify includes subarray fromIndex NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let view: Uint16Array = arr.subarray(1, 4);
      let result: boolean = view.includes(20, Double.toInt(Number.NaN));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_TWO_5200
     * @tc.name testUint16ArrayIncludesTwo052
     * @tc.desc Verify includes subarray fromIndex Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let view: Uint16Array = arr.subarray(1, 4);
      let result: boolean = view.includes(40, Double.toInt(Number.POSITIVE_INFINITY));
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_TWO_5300
     * @tc.name testUint16ArrayIncludesTwo053
     * @tc.desc Verify includes subarray fromIndex using view.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let view: Uint16Array = arr.subarray(1, 4);
      let result: boolean = view.includes(40, view.length - 1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_TWO_5400
     * @tc.name testUint16ArrayIncludesTwo054
     * @tc.desc Verify includes subarray fromIndex using view.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let view: Uint16Array = arr.subarray(1, 4);
      let result: boolean = view.includes(30, view.byteLength / 2 - 1);
      expect(view.includes(40, view.byteLength / 2 - 1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_TWO_5500
     * @tc.name testUint16ArrayIncludesTwo055
     * @tc.desc Verify includes subarray fromIndex using view.byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let view: Uint16Array = arr.subarray(2, 5);
      let result: boolean = view.includes(30, 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_TWO_5600
     * @tc.name testUint16ArrayIncludesTwo056
     * @tc.desc Verify includes subarray fromIndex 0o1 (octal)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let view: Uint16Array = arr.subarray(1, 4);
      let result: boolean = view.includes(30, 0o1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_TWO_5700
     * @tc.name testUint16ArrayIncludesTwo057
     * @tc.desc Verify includes subarray fromIndex 0b10 (binary)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      let view: Uint16Array = arr.subarray(1, 5);
      let result: boolean = view.includes(40, 0b10);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_TWO_5800
     * @tc.name testUint16ArrayIncludesTwo058
     * @tc.desc Verify includes observes a value written through an alias
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer: ArrayBuffer = new ArrayBuffer(6);
            let arr: Uint16Array = new Uint16Array(buffer);
            let alias: Uint16Array = new Uint16Array(buffer);
            alias[1] = 50;
            expect(arr.includes(50)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_TWO_5900
     * @tc.name testUint16ArrayIncludesTwo059
     * @tc.desc Verify includes offset view excludes a matching value before its range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let all: Uint16Array = Uint16Array.of(9, 1, 2);
            let view: Uint16Array = new Uint16Array(all.buffer, 2, 2);
            expect(view.includes(9)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_TWO_6000
     * @tc.name testUint16ArrayIncludesTwo060
     * @tc.desc Verify includes offset view includes a matching value inside its range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let all: Uint16Array = Uint16Array.of(9, 1, 2);
            let view: Uint16Array = new Uint16Array(all.buffer, 2, 2);
            expect(view.includes(2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_TWO_6100
     * @tc.name testUint16ArrayIncludesTwo061
     * @tc.desc Verify includes alias replacement removes a previously included value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesTwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer: ArrayBuffer = new ArrayBuffer(4);
            let arr: Uint16Array = new Uint16Array(buffer);
            arr.set([7, 8]);
            let alias: Uint16Array = new Uint16Array(buffer);
            alias[0] = 6;
            expect(arr.includes(7)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_TWO_6200
     * @tc.name testUint16ArrayIncludesTwo062
     * @tc.desc Verify includes applies fromIndex relative to a nonzero-offset view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesTwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let backing: Uint16Array = Uint16Array.of(9, 7, 8, 7, 9);
      let view: Uint16Array = new Uint16Array(backing.buffer, 2, 3);
      expect(view.includes(7, 1)).assertTrue();
      expect(view.includes(7, 3)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INCLUDES_TWO_6300
     * @tc.name testUint16ArrayIncludesTwo063
     * @tc.desc Verify construction converts stored values while search arguments remain unconverted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIncludesTwo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
