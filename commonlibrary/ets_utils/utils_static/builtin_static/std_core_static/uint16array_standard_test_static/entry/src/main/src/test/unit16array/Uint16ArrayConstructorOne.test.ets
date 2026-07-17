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

export default function uint16ArrayConstructor0101Test(): void {
  describe('Uint16ArrayConstructor0101Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_0100

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_0200

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_0300

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_0100
     * @tc.name testUint16ArrayConstructor0101_001
     * @tc.desc Verify buffer null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array();
      expect(arr.buffer.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_0200
     * @tc.name testUint16ArrayConstructor0101_002
     * @tc.desc Verify BYTES_PER_ELEMENT 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array();
      expect(arr.BYTES_PER_ELEMENT).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_0600

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_0300
     * @tc.name testUint16ArrayConstructor0101_003
     * @tc.desc Verify toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array();
      expect(arr.toString()).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_0400
     * @tc.name testUint16ArrayConstructor0101_004
     * @tc.desc Verify join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array();
      expect(arr.join()).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_0500
     * @tc.name testUint16ArrayConstructor0101_005
     * @tc.desc Verify values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array();
      let count: number = 0;
      for (let v of arr.values()) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_0600
     * @tc.name testUint16ArrayConstructor0101_006
     * @tc.desc Verify FixedArray<int> 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<int> = [0];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_0700
     * @tc.name testUint16ArrayConstructor0101_007
     * @tc.desc Verify FixedArray<int> 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<int> = [65535];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_0800
     * @tc.name testUint16ArrayConstructor0101_008
     * @tc.desc Verify FixedArray<int> 32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<int> = [32768];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_0900
     * @tc.name testUint16ArrayConstructor0101_009
     * @tc.desc Verify FixedArray<int> [1,2,3,4,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<int> = [1, 2, 3, 4, 5];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_1000
     * @tc.name testUint16ArrayConstructor0101_010
     * @tc.desc Verify FixedArray<int> [0,65535,32768]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<int> = [0, 65535, 32768];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(65535);
      expect(arr.at(2)).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_1100
     * @tc.name testUint16ArrayConstructor0101_011
     * @tc.desc Verify FixedArray<int> 65536 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<int> = [65536];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_1200
     * @tc.name testUint16ArrayConstructor0101_012
     * @tc.desc Verify FixedArray<int> -1 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<int> = [-1];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_1300
     * @tc.name testUint16ArrayConstructor0101_013
     * @tc.desc Verify FixedArray<int> -65536 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<int> = [-65536];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_1400
     * @tc.name testUint16ArrayConstructor0101_014
     * @tc.desc Verify FixedArray<int> 65536*2 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<int> = [65536 * 2];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_1500
     * @tc.name testUint16ArrayConstructor0101_015
     * @tc.desc Verify FixedArray<int> -32768 32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<int> = [-32768];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_1600
     * @tc.name testUint16ArrayConstructor0101_016
     * @tc.desc Verify FixedArray<int> 0xABCD 43981
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<int> = [0xABCD];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(43981);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_1700
     * @tc.name testUint16ArrayConstructor0101_017
     * @tc.desc Verify FixedArray<int> 0b1010 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<int> = [0b1010];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_1800
     * @tc.name testUint16ArrayConstructor0101_018
     * @tc.desc Verify FixedArray<number> 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<number> = [0.0];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_1900
     * @tc.name testUint16ArrayConstructor0101_019
     * @tc.desc Verify FixedArray<number> 65535.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<number> = [65535.0];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_2000
     * @tc.name testUint16ArrayConstructor0101_020
     * @tc.desc Verify FixedArray<number> 3.14 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<number> = [3.14];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_2100
     * @tc.name testUint16ArrayConstructor0101_021
     * @tc.desc Verify FixedArray<number> 65535.9 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<number> = [65535.9];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_2200
     * @tc.name testUint16ArrayConstructor0101_022
     * @tc.desc Verify FixedArray<number> -0.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<number> = [-0.5];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_2300
     * @tc.name testUint16ArrayConstructor0101_023
     * @tc.desc Verify FixedArray<number> [1.5,2.7,3.9]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<number> = [1.5, 2.7, 3.9];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(1);
      expect(arr.at(1)).assertEqual(2);
      expect(arr.at(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_2400
     * @tc.name testUint16ArrayConstructor0101_024
     * @tc.desc Verify FixedArray<number> 1e-10 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<number> = [1e-10];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_2500
     * @tc.name testUint16ArrayConstructor0101_025
     * @tc.desc Verify FixedArray<number> 0o7777 4095
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<number> = [0o7777];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(4095);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_2600
     * @tc.name testUint16ArrayConstructor0101_026
     * @tc.desc Verify FixedArray<number> 1e4 10000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<number> = [1e4];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(10000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_2700
     * @tc.name testUint16ArrayConstructor0101_027
     * @tc.desc Verify FixedArray<int> 65536*3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<int> = [65536 * 3];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_2800
     * @tc.name testUint16ArrayConstructor0101_028
     * @tc.desc Verify FixedArray<number>NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<number> = [Number.NaN];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_2900
     * @tc.name testUint16ArrayConstructor0101_029
     * @tc.desc Verify FixedArray<number> Infinity 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<number> = [Number.POSITIVE_INFINITY];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_3000
     * @tc.name testUint16ArrayConstructor0101_030
     * @tc.desc Verify FixedArray<number> -Infinity 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<number> = [-Number.POSITIVE_INFINITY];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_3100
     * @tc.name testUint16ArrayConstructor0101_031
     * @tc.desc Verify FixedArray<int> [0,-1,65536,32768]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<int> = [0, -1, 65536, 32768];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(65535);
      expect(arr.at(2)).assertEqual(0);
      expect(arr.at(3)).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_3200
     * @tc.name testUint16ArrayConstructor0101_032
     * @tc.desc Verify FixedArray<int>[1,2,3] length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<int> = [1, 2, 3];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_3300
     * @tc.name testUint16ArrayConstructor0101_033
     * @tc.desc Verify FixedArray<int>[1,2,3] byteLength 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<int> = [1, 2, 3];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.byteLength).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_3400
     * @tc.name testUint16ArrayConstructor0101_034
     * @tc.desc Verify FixedArray<int>[1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<int> = [10, 20, 30];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(10);
      expect(arr.at(1)).assertEqual(20);
      expect(arr.at(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_3500
     * @tc.name testUint16ArrayConstructor0101_035
     * @tc.desc Verify FixedArray<number>[1.0,2.0] length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<number> = [1.0, 2.0];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_3600
     * @tc.name testUint16ArrayConstructor0101_036
     * @tc.desc Verify FixedArray<int> length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<int> = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.length).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_3700
     * @tc.name testUint16ArrayConstructor0101_037
     * @tc.desc Verify FixedArray<int>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<int> = [42, 42, 42, 42, 42];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(42);
      expect(arr.at(4)).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_3800
     * @tc.name testUint16ArrayConstructor0101_038
     * @tc.desc Verify FixedArray<int> at
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: FixedArray<int> = [100, 200, 300];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(1)).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_3900
     * @tc.name testUint16ArrayConstructor0101_039
     * @tc.desc Verify ArrayBuffer byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint16Array = new Uint16Array(buf, 0);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_4000
     * @tc.name testUint16ArrayConstructor0101_040
     * @tc.desc Verify byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let arr: Uint16Array = new Uint16Array(buf, 0);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_4100
     * @tc.name testUint16ArrayConstructor0101_041
     * @tc.desc Verify byteOffset 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint16Array = new Uint16Array(buf, 2);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_4200
     * @tc.name testUint16ArrayConstructor0101_042
     * @tc.desc Verify byteOffset 2 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let arr: Uint16Array = new Uint16Array(buf, 2);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_4300
     * @tc.name testUint16ArrayConstructor0101_043
     * @tc.desc Verify byteOffset 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Uint16Array = new Uint16Array(buf, 4);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_4400
     * @tc.name testUint16ArrayConstructor0101_044
     * @tc.desc Verify byteOffset 4 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let arr: Uint16Array = new Uint16Array(buf, 4);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_4500
     * @tc.name testUint16ArrayConstructor0101_045
     * @tc.desc Verify byteOffset 6 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(10);
      let arr: Uint16Array = new Uint16Array(buf, 6);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_4600
     * @tc.name testUint16ArrayConstructor0101_046
     * @tc.desc Verify byteOffset 0 buffer 2 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(2);
      let arr: Uint16Array = new Uint16Array(buf, 0);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_4700
     * @tc.name testUint16ArrayConstructor0101_047
     * @tc.desc Verify byteOffset 0 buffer12 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(12);
      let arr: Uint16Array = new Uint16Array(buf, 0);
      expect(arr.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_4800
     * @tc.name testUint16ArrayConstructor0101_048
     * @tc.desc Verify byteOffset buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint16Array = new Uint16Array(buf, 4);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_4900
     * @tc.name testUint16ArrayConstructor0101_049
     * @tc.desc Verify byteOffset 0 byteLength 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint16Array = new Uint16Array(buf, 0);
      expect(arr.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_5000
     * @tc.name testUint16ArrayConstructor0101_050
     * @tc.desc Verify byteOffset 2 byteLength 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint16Array = new Uint16Array(buf, 2);
      expect(arr.byteLength).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_5100
     * @tc.name testUint16ArrayConstructor0101_051
     * @tc.desc Verify byteOffset 2 byteOffset 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint16Array = new Uint16Array(buf, 2);
      expect(arr.byteOffset).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_5200
     * @tc.name testUint16ArrayConstructor0101_052
     * @tc.desc Verify byteOffset 0 byteLength 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let arr: Uint16Array = new Uint16Array(buf, 0);
      expect(arr.byteLength).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_5700

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_5300
     * @tc.name testUint16ArrayConstructor0101_053
     * @tc.desc Verify byteOffset 0 name Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Uint16Array = new Uint16Array(buf, 0);
      expect(arr instanceof Uint16Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_5400
     * @tc.name testUint16ArrayConstructor0101_054
     * @tc.desc Verify byteOffset 0 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint16Array = new Uint16Array(buf, 0);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_5500
     * @tc.name testUint16ArrayConstructor0101_055
     * @tc.desc Verify byteOffset 0 buffer.byteLength 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint16Array = new Uint16Array(buf, 0);
      expect(arr.buffer.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_5600
     * @tc.name testUint16ArrayConstructor0101_056
     * @tc.desc Verify byteOffset 2 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let arr: Uint16Array = new Uint16Array(buf, 2);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_5700
     * @tc.name testUint16ArrayConstructor0101_057
     * @tc.desc Verify byteOffset 1 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      try {
        let arr: Uint16Array = new Uint16Array(buf, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_5800
     * @tc.name testUint16ArrayConstructor0101_058
     * @tc.desc Verify byteOffset 5 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      try {
        let arr: Uint16Array = new Uint16Array(buf, 5);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_5900
     * @tc.name testUint16ArrayConstructor0101_059
     * @tc.desc Verify buffer byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(0);
      try {
        let arr: Uint16Array = new Uint16Array(buf, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_6000
     * @tc.name testUint16ArrayConstructor0101_060
     * @tc.desc Verify byteOffset buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr1: Uint16Array = new Uint16Array(buf, 0);
      let arr2: Uint16Array = new Uint16Array(buf, 0);
      arr1[0] = 12345;
      expect(arr2.at(0)).assertEqual(12345);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_6100
     * @tc.name testUint16ArrayConstructor0101_061
     * @tc.desc Verify byteOffset 2 buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let arr1: Uint16Array = new Uint16Array(buf, 0);
      let arr2: Uint16Array = new Uint16Array(buf, 2);
      arr1[1] = 50000;
      expect(arr2.at(0)).assertEqual(50000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_6200
     * @tc.name testUint16ArrayConstructor0101_062
     * @tc.desc Verify ArrayBuffer(4) length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint16Array = new Uint16Array(buf);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_6300
     * @tc.name testUint16ArrayConstructor0101_063
     * @tc.desc Verify ArrayBuffer(4) byteLength 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint16Array = new Uint16Array(buf);
      expect(arr.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_6400
     * @tc.name testUint16ArrayConstructor0101_064
     * @tc.desc Verify ArrayBuffer(6) byteLength 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let arr: Uint16Array = new Uint16Array(buf);
      expect(arr.byteLength).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_6500
     * @tc.name testUint16ArrayConstructor0101_065
     * @tc.desc Verify ArrayBuffer(4) byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint16Array = new Uint16Array(buf);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_7100

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_6600
     * @tc.name testUint16ArrayConstructor0101_066
     * @tc.desc Verify ArrayBuffer(4) name Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint16Array = new Uint16Array(buf);
      expect(arr instanceof Uint16Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_6700
     * @tc.name testUint16ArrayConstructor0101_067
     * @tc.desc Verify ArrayBuffer(4) buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let arr: Uint16Array = new Uint16Array(buf);
      expect(arr.buffer).assertEqual(buf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_6800
     * @tc.name testUint16ArrayConstructor0101_068
     * @tc.desc Verify ArrayLike<Number> length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Array<Number> = [];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_6900
     * @tc.name testUint16ArrayConstructor0101_069
     * @tc.desc Verify ArrayLike<Number> 32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Array<Number> = [32768];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_7000
     * @tc.name testUint16ArrayConstructor0101_070
     * @tc.desc Verify ArrayLike<Number> [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Array<Number> = [1, 2, 3];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_7100
     * @tc.name testUint16ArrayConstructor0101_071
     * @tc.desc Verify ArrayLike<Number> 65536 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Array<Number> = [65536];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_7200
     * @tc.name testUint16ArrayConstructor0101_072
     * @tc.desc Verify ArrayLike<Number> -1 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Array<Number> = [-1];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_7300
     * @tc.name testUint16ArrayConstructor0101_073
     * @tc.desc Verify ArrayLike<Number> [0b1010101010101010]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Array<Number> = [0b1010101010101010];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(43690);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_7400
     * @tc.name testUint16ArrayConstructor0101_074
     * @tc.desc Verify ArrayLike<Number> [0o177777]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Array<Number> = [0o177777];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_7500
     * @tc.name testUint16ArrayConstructor0101_075
     * @tc.desc Verify ArrayLike<Number> [0.1, 0.9, 1.5, 2.499]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let src: Array<Number> = [0.1, 0.9, 1.5, 2.499];
      let arr: Uint16Array = new Uint16Array(src);
      expect(arr.at(0)).assertEqual(0);
      expect(arr.at(1)).assertEqual(0);
      expect(arr.at(2)).assertEqual(1);
      expect(arr.at(3)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_CONSTRUCTOR0101_7600
     * @tc.name testUint16ArrayConstructor0101_076
     * @tc.desc Verify new Uint16Array() with no arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayConstructor0101_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array();
      expect(arr.length).assertEqual(0);
      expect(arr.byteLength).assertEqual(0);
      expect(arr.byteOffset).assertEqual(0);
      expect(arr instanceof Uint16Array).assertTrue();
    });

  });
}
