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

export default function uint16ArrayEvery01Test(): void {
  describe('Uint16ArrayEvery01Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_0100
     * @tc.name testUint16ArrayEvery01_001
     * @tc.desc Verify [1,2,3] 1 every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(1, 2, 3);
        let result: boolean = arr.every((v: number): boolean => v >= 1);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_0200
     * @tc.name testUint16ArrayEvery01_002
     * @tc.desc Verify [0,0,0] 0 every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(0, 0, 0);
        let result: boolean = arr.every((v: number): boolean => v === 0);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_0300
     * @tc.name testUint16ArrayEvery01_003
     * @tc.desc Verify [65535,65535] 65535 every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(65535, 65535);
        let result: boolean = arr.every((v: number): boolean => v === 65535);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_0400
     * @tc.name testUint16ArrayEvery01_004
     * @tc.desc Verify [1] 0 every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(1);
        let result: boolean = arr.every((v: number): boolean => v > 0);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_0500
     * @tc.name testUint16ArrayEvery01_005
     * @tc.desc Verify [0] 0 every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(0);
        let result: boolean = arr.every((v: number): boolean => v >= 0);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_0600
     * @tc.name testUint16ArrayEvery01_006
     * @tc.desc Verify [65535] 65535 every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(65535);
        let result: boolean = arr.every((v: number): boolean => v <= 65535);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_0700
     * @tc.name testUint16ArrayEvery01_007
     * @tc.desc Verify [100,200,300] 100 every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(100, 200, 300);
        let result: boolean = arr.every((v: number): boolean => v >= 100);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_0800
     * @tc.name testUint16ArrayEvery01_008
     * @tc.desc Verify [32768,40000,50000] 30000 every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(32768, 40000, 50000);
        let result: boolean = arr.every((v: number): boolean => v > 30000);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_0900
     * @tc.name testUint16ArrayEvery01_009
     * @tc.desc Verify [1,65535,32768] 0 every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(1, 65535, 32768);
        let result: boolean = arr.every((v: number): boolean => v !== 0);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_1000
     * @tc.name testUint16ArrayEvery01_010
     * @tc.desc Verify [10,20,30,40,50] 100 every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
        let result: boolean = arr.every((v: number): boolean => v < 100);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_1100
     * @tc.name testUint16ArrayEvery01_011
     * @tc.desc Verify [1,2,3,4,5] 0 every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(1, 2, 3, 4, 5);
        let result: boolean = arr.every((v: number): boolean => v > 0);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_1200
     * @tc.name testUint16ArrayEvery01_012
     * @tc.desc Verify 0xFF,0x7F,0x00 0 every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(0xFF, 0x7F, 0x00);
        let result: boolean = arr.every((v: number): boolean => v >= 0);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_1300
     * @tc.name testUint16ArrayEvery01_013
     * @tc.desc Verify 0o77777,0o100000,0o177777 0 every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(0o77777, 0o100000, 0o177777);
        let result: boolean = arr.every((v: number): boolean => v > 0);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_1400
     * @tc.name testUint16ArrayEvery01_014
     * @tc.desc Verify 0b1,0b10,0b100 0 every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(0b1, 0b10, 0b100);
        let result: boolean = arr.every((v: number): boolean => v > 0);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_1500
     * @tc.name testUint16ArrayEvery01_015
     * @tc.desc Verify [10000,20000,30000] 5000 every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(10000, 20000, 30000);
        let result: boolean = arr.every((v: number): boolean => v > 5000);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_1600
     * @tc.name testUint16ArrayEvery01_016
     * @tc.desc Verify [0xFFFF] 0xFFFF every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(0xFFFF);
        let result: boolean = arr.every((v: number): boolean => v === 0xFFFF);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_1700
     * @tc.name testUint16ArrayEvery01_017
     * @tc.desc Verify [1,1,1,1] 1 every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(1, 1, 1, 1);
        let result: boolean = arr.every((v: number): boolean => v === 1);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_1800
     * @tc.name testUint16ArrayEvery01_018
     * @tc.desc Verify [2,4,6,8] every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(2, 4, 6, 8);
        let result: boolean = arr.every((v: number): boolean => v % 2 === 0);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_1900
     * @tc.name testUint16ArrayEvery01_019
     * @tc.desc Verify [1,3,5,7] every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(1, 3, 5, 7);
        let result: boolean = arr.every((v: number): boolean => v % 2 === 1);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_2000
     * @tc.name testUint16ArrayEvery01_020
     * @tc.desc Verify [0,0xFFFF,0x8000] 0 every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(0, 0xFFFF, 0x8000);
        let result: boolean = arr.every((v: number): boolean => v >= 0);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_2100
     * @tc.name testUint16ArrayEvery01_021
     * @tc.desc Verify [50000,50000] 50000 every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(50000, 50000);
        let result: boolean = arr.every((v: number): boolean => v >= 50000);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_2200
     * @tc.name testUint16ArrayEvery01_022
     * @tc.desc Verify [4,5,6] 5 every false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(4, 5, 6);
        let result: boolean = arr.every((v: number): boolean => v > 5);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_2300
     * @tc.name testUint16ArrayEvery01_023
     * @tc.desc Verify [1,2,3] 1 every false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(1, 2, 3);
        let result: boolean = arr.every((v: number): boolean => v === 1);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_2400
     * @tc.name testUint16ArrayEvery01_024
     * @tc.desc Verify [0,1,2] 0 every false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(0, 1, 2);
        let result: boolean = arr.every((v: number): boolean => v > 0);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_2500
     * @tc.name testUint16ArrayEvery01_025
     * @tc.desc Verify [0] 0 every false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(0);
        let result: boolean = arr.every((v: number): boolean => v > 0);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_2600
     * @tc.name testUint16ArrayEvery01_026
     * @tc.desc Verify [1] 0 every false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(1);
        let result: boolean = arr.every((v: number): boolean => v === 0);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_2700
     * @tc.name testUint16ArrayEvery01_027
     * @tc.desc Verify [65535] 65535 every false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(65535);
        let result: boolean = arr.every((v: number): boolean => v < 65535);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_2800
     * @tc.name testUint16ArrayEvery01_028
     * @tc.desc Verify [65535,0] 0 every false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(65535, 0);
        let result: boolean = arr.every((v: number): boolean => v !== 0);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_2900
     * @tc.name testUint16ArrayEvery01_029
     * @tc.desc Verify [100,200,300] 500 every false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(100, 200, 300);
        let result: boolean = arr.every((v: number): boolean => v > 500);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_3000
     * @tc.name testUint16ArrayEvery01_030
     * @tc.desc Verify [1,2,3,4,5] 10 every false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(1, 2, 3, 4, 5);
        let result: boolean = arr.every((v: number): boolean => v > 10);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_3100
     * @tc.name testUint16ArrayEvery01_031
     * @tc.desc Verify 0xFFFF,0x0000 0 every false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(0xFFFF, 0x0000);
        let result: boolean = arr.every((v: number): boolean => v !== 0);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_3200
     * @tc.name testUint16ArrayEvery01_032
     * @tc.desc Verify 0o177777,0o000000 0 every false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(0o177777, 0o000000);
        let result: boolean = arr.every((v: number): boolean => v !== 0);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_3300
     * @tc.name testUint16ArrayEvery01_033
     * @tc.desc Verify 0b1111111111111111,0b0000000000000000 0 every false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(0b1111111111111111, 0b0000000000000000);
        let result: boolean = arr.every((v: number): boolean => v !== 0);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_3400
     * @tc.name testUint16ArrayEvery01_034
     * @tc.desc Verify [10000,0] 0 every false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(10000, 0);
        let result: boolean = arr.every((v: number): boolean => v > 0);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_3500
     * @tc.name testUint16ArrayEvery01_035
     * @tc.desc Verify [1,1,2] 1 every false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(1, 1, 2);
        let result: boolean = arr.every((v: number): boolean => v === 1);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_3600
     * @tc.name testUint16ArrayEvery01_036
     * @tc.desc Verify [1] 1 every false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(1);
        let result: boolean = arr.every((v: number): boolean => v > 1);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_3700
     * @tc.name testUint16ArrayEvery01_037
     * @tc.desc Verify [65535] 0 every false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(65535);
        let result: boolean = arr.every((v: number): boolean => v === 0);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_3800
     * @tc.name testUint16ArrayEvery01_038
     * @tc.desc Verify [0,0,1] 0 every false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(0, 0, 1);
        let result: boolean = arr.every((v: number): boolean => v === 0);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_3900
     * @tc.name testUint16ArrayEvery01_039
     * @tc.desc Verify [1,0,0] 0 every false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(1, 0, 0);
        let result: boolean = arr.every((v: number): boolean => v === 0);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_4000
     * @tc.name testUint16ArrayEvery01_040
     * @tc.desc Verify [0,1,0] 0 every false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(0, 1, 0);
        let result: boolean = arr.every((v: number): boolean => v === 0);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_4100
     * @tc.name testUint16ArrayEvery01_041
     * @tc.desc Verify [2,4,6,7] every false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(2, 4, 6, 7);
        let result: boolean = arr.every((v: number): boolean => v % 2 === 0);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_4200
     * @tc.name testUint16ArrayEvery01_042
     * @tc.desc Verify [1,3,5,6] every false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(1, 3, 5, 6);
        let result: boolean = arr.every((v: number): boolean => v % 2 === 1);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_4300
     * @tc.name testUint16ArrayEvery01_043
     * @tc.desc Verify [100] 200 every false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(100);
        let result: boolean = arr.every((v: number): boolean => v > 200);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_4400
     * @tc.name testUint16ArrayEvery01_044
     * @tc.desc Verify [50000] 50000 every false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(50000);
        let result: boolean = arr.every((v: number): boolean => v < 50000);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_4500
     * @tc.name testUint16ArrayEvery01_045
     * @tc.desc Verify every(() => true) true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = new Uint16Array();
        let result: boolean = arr.every((): boolean => true);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_4600
     * @tc.name testUint16ArrayEvery01_046
     * @tc.desc Verify every(() => false) true vacuous truth
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = new Uint16Array();
        let result: boolean = arr.every((): boolean => false);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_4700
     * @tc.name testUint16ArrayEvery01_047
     * @tc.desc Verify every v>0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = new Uint16Array();
        let result: boolean = arr.every((v: number): boolean => v > 0);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_4800
     * @tc.name testUint16ArrayEvery01_048
     * @tc.desc Verify every i>=0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = new Uint16Array();
        let result: boolean = arr.every((v: number, i: int): boolean => i >= 0);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_4900
     * @tc.name testUint16ArrayEvery01_049
     * @tc.desc Verify new Uint16Array(0) every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = new Uint16Array(0);
        let result: boolean = arr.every((v: number): boolean => false);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_5000
     * @tc.name testUint16ArrayEvery01_050
     * @tc.desc Verify element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(10, 20, 30);
        let capturedV: number = 0;
        arr.every((v: number, i: int): boolean => {
          capturedV = v;
          return false;
        });
        expect(capturedV).assertEqual(10);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_5100
     * @tc.name testUint16ArrayEvery01_051
     * @tc.desc Verify index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(10, 20, 30);
        let capturedI: int = -1;
        arr.every((v: number, i: int): boolean => {
          capturedI = i;
          return false;
        });
        expect(capturedI).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_5200
     * @tc.name testUint16ArrayEvery01_052
     * @tc.desc Verify index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(10, 20, 30);
        let prevI: int = -1;
        let monotonic: boolean = true;
        let callCount: int = 0;
        let result: boolean = arr.every((v: number, i: int): boolean => {
          if (i !== prevI + 1) {
            monotonic = false;
          }
          prevI = i;
          callCount++;
          return true;
        });
        expect(result).assertTrue();
        expect(callCount).assertEqual(3);
        expect(prevI).assertEqual(2);
        expect(monotonic).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_5300
     * @tc.name testUint16ArrayEvery01_053
     * @tc.desc Verify index length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(10, 20, 30);
        let lastI: int = -1;
        arr.every((v: number, i: int): boolean => {
          lastI = i;
          return true;
        });
        expect(lastI).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_5400
     * @tc.name testUint16ArrayEvery01_054
     * @tc.desc Verify array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(10, 20, 30);
        let arrayCheck: boolean = false;
        arr.every((v: number, i: int, a: Uint16Array): boolean => {
          arrayCheck = (a === arr);
          return false;
        });
        expect(arrayCheck).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_5500
     * @tc.name testUint16ArrayEvery01_055
     * @tc.desc Verify array.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(10, 20, 30);
        let lenCheck: boolean = false;
        arr.every((v: number, i: int, a: Uint16Array): boolean => {
          lenCheck = (a.length === 3);
          return false;
        });
        expect(lenCheck).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_5600
     * @tc.name testUint16ArrayEvery01_056
     * @tc.desc Verify array[index] element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(10, 20, 30);
        let elemCheck: boolean = false;
        arr.every((v: number, i: int, a: Uint16Array): boolean => {
          elemCheck = (a[i] === v);
          return false;
        });
        expect(elemCheck).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_5700
     * @tc.name testUint16ArrayEvery01_057
     * @tc.desc Verify every invokes the predicate for all three elements when all return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(4, 5, 6);
        let callCount: int = 0;
        arr.every((v: number): boolean => {
          callCount++;
          return true;
        });
        expect(callCount).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_5800
     * @tc.name testUint16ArrayEvery01_058
     * @tc.desc Verify [1,0,2] every>0 index 1 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(1, 0, 2);
        let callCount: int = 0;
        let result: boolean = arr.every((v: number): boolean => {
          callCount++;
          return v > 0;
        });
        expect(result).assertFalse();
        expect(callCount).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_5900
     * @tc.name testUint16ArrayEvery01_059
     * @tc.desc Verify [0,1,2] every>0 index 0 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(0, 1, 2);
        let callCount: int = 0;
        let result: boolean = arr.every((v: number): boolean => {
          callCount++;
          return v > 0;
        });
        expect(result).assertFalse();
        expect(callCount).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_6000
     * @tc.name testUint16ArrayEvery01_060
     * @tc.desc Verify [0] 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(0);
        let callCount: int = 0;
        let result: boolean = arr.every((v: number): boolean => {
          callCount++;
          return v > 0;
        });
        expect(result).assertFalse();
        expect(callCount).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_6100
     * @tc.name testUint16ArrayEvery01_061
     * @tc.desc Verify [1,2,3] 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(1, 2, 3);
        let callCount: int = 0;
        let result: boolean = arr.every((v: number): boolean => {
          callCount++;
          return v > 0;
        });
        expect(result).assertTrue();
        expect(callCount).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_6200
     * @tc.name testUint16ArrayEvery01_062
     * @tc.desc Verify [1,1,0,1] index 2 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(1, 1, 0, 1);
        let callCount: int = 0;
        let result: boolean = arr.every((v: number): boolean => {
          callCount++;
          return v > 0;
        });
        expect(result).assertFalse();
        expect(callCount).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_6300
     * @tc.name testUint16ArrayEvery01_063
     * @tc.desc Verify 100 0 every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = new Uint16Array(100);
        for (let i: int = 0; i < 100; i++) {
          arr[i] = 1;
        }
        let result: boolean = arr.every((v: number): boolean => v > 0);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_6400
     * @tc.name testUint16ArrayEvery01_064
     * @tc.desc Verify 100 0 every false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = new Uint16Array(100);
        for (let i: int = 0; i < 100; i++) {
          arr[i] = 1;
        }
        arr[0] = 0;
        let result: boolean = arr.every((v: number): boolean => v > 0);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_6500
     * @tc.name testUint16ArrayEvery01_065
     * @tc.desc Verify index every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(10, 20, 30);
        let result: boolean = arr.every((v: number, i: int): boolean => i < arr.length);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_6600
     * @tc.name testUint16ArrayEvery01_066
     * @tc.desc Verify index 0 every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(10, 20, 30);
        let result: boolean = arr.every((v: number, i: int): boolean => i >= 0);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_6700
     * @tc.name testUint16ArrayEvery01_067
     * @tc.desc Verify index 0 index 0 every false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(10, 20, 30);
        let result: boolean = arr.every((v: number, i: int): boolean => i > 0);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_6800
     * @tc.name testUint16ArrayEvery01_068
     * @tc.desc Verify index 1 index 1+ every false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(10, 20, 30);
        let result: boolean = arr.every((v: number, i: int): boolean => i < 1);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_6900
     * @tc.name testUint16ArrayEvery01_069
     * @tc.desc Verify index element every false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(10, 20, 30);
        let result: boolean = arr.every((v: number, i: int): boolean => (i === 0 && v === 10) || i > 0);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_7000
     * @tc.name testUint16ArrayEvery01_070
     * @tc.desc Verify a[i] v every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(10, 20, 30);
        let result: boolean = arr.every((v: number, i: int, a: Uint16Array): boolean => a[i] === v);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_7100
     * @tc.name testUint16ArrayEvery01_071
     * @tc.desc Verify a.length i every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(10, 20, 30);
        let result: boolean = arr.every((v: number, i: int, a: Uint16Array): boolean => a.length > i);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_7200
     * @tc.name testUint16ArrayEvery01_072
     * @tc.desc Verify a Uint16Array every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(10, 20, 30);
        let result: boolean = arr.every((v: number, i: int, a: Uint16Array): boolean => a instanceof Uint16Array);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_7300
     * @tc.name testUint16ArrayEvery01_073
     * @tc.desc Verify a.BYTES_PER_ELEMENT 2 every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(10, 20, 30);
        let result: boolean = arr.every((v: number, i: int, a: Uint16Array): boolean => a.BYTES_PER_ELEMENT === 2);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_7400
     * @tc.name testUint16ArrayEvery01_074
     * @tc.desc Verify [1,50,99] 0 100 every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(1, 50, 99);
        let result: boolean = arr.every((v: number): boolean => v > 0 && v < 100);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_7500
     * @tc.name testUint16ArrayEvery01_075
     * @tc.desc Verify [1,100,99] 0 100 100 100 every false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(1, 100, 99);
        let result: boolean = arr.every((v: number): boolean => v > 0 && v < 100);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_7600
     * @tc.name testUint16ArrayEvery01_076
     * @tc.desc Verify [0x100,0x200,0x300] 0xFF every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(0x100, 0x200, 0x300);
        let result: boolean = arr.every((v: number): boolean => v > 0xFF);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_7700
     * @tc.name testUint16ArrayEvery01_077
     * @tc.desc Verify [0xFF,0x100] 0xFF every false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(0xFF, 0x100);
        let result: boolean = arr.every((v: number): boolean => v > 0xFF);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_7800
     * @tc.name testUint16ArrayEvery01_078
     * @tc.desc Verify [0,65535,32768] Uint16 every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(0, 65535, 32768);
        let result: boolean = arr.every((v: number): boolean => v >= 0 && v <= 65535);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_7900
     * @tc.name testUint16ArrayEvery01_079
     * @tc.desc Verify [10,20,30] typeof number every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(10, 20, 30);
        let result: boolean = arr.every((v: number): boolean => typeof v === 'number');
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_8000
     * @tc.name testUint16ArrayEvery01_080
     * @tc.desc Verify new Uint16Array(5) 0 every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = new Uint16Array(5);
        let result: boolean = arr.every((v: number): boolean => v === 0);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_8100
     * @tc.name testUint16ArrayEvery01_081
     * @tc.desc Verify new Uint16Array([10,20,30]) FixedArray every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = new Uint16Array([10, 20, 30]);
        let result: boolean = arr.every((v: number): boolean => v > 0);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_8200
     * @tc.name testUint16ArrayEvery01_082
     * @tc.desc Verify Uint16Array.of(1,2,3) every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(1, 2, 3);
        let result: boolean = arr.every((v: number): boolean => v > 0);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_8300
     * @tc.name testUint16ArrayEvery01_083
     * @tc.desc Verify every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(10, 20, 30);
        let threshold: number = 5;
        let result: boolean = arr.every((v: number): boolean => v > threshold);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_8400
     * @tc.name testUint16ArrayEvery01_084
     * @tc.desc Verify every visits all elements and accumulates their sum when predicate returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(10, 20, 30);
        let sum: number = 0;
        arr.every((v: number): boolean => {
          sum = sum + v;
          return true;
        });
        expect(sum).assertEqual(60);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_8500
     * @tc.name testUint16ArrayEvery01_085
     * @tc.desc Verify every callback can double the current element through the array parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(10, 20, 30);
        let result: boolean = arr.every((v: number, i: int, a: Uint16Array): boolean => {
          a[i] = v * 2;
          return true;
        });
        expect(result).assertTrue();
        expect(arr.at(0)).assertEqual(20);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_8600
     * @tc.name testUint16ArrayEvery01_086
     * @tc.desc Verify every on subarray view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(5, 10, 15, 20, 25);
        let view: Uint16Array = arr.subarray(1, 4);
        let result: boolean = view.every((v: number): boolean => v >= 10);
        expect(result).assertTrue();
        expect(view.length).assertEqual(3);
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_8700
     * @tc.name testUint16ArrayEvery01_087
     * @tc.desc Verify predicate throws error is propagated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(1, 2, 3);
        let callCount: int = 0;
        const markerError = new Error('test error');
        try {
          arr.every((v: number): boolean => {
            callCount++;
            throw markerError;
          });
          expect().assertFail();
        } catch (e) {
          expect(e).assertEqual(markerError);
          expect(callCount).assertEqual(1);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_8800
     * @tc.name testUint16ArrayEvery01_088
     * @tc.desc Verify every does not modify original array when predicate is read-only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(1, 2, 3, 4, 5);
        let original: Uint16Array = Uint16Array.of(1, 2, 3, 4, 5);
        arr.every((v: number): boolean => v > 0);
        expect(arr.length).assertEqual(original.length);
        for (let i: int = 0; i < arr.length; i++) {
          expect(arr[i]).assertEqual(original[i]);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_8900
     * @tc.name testUint16ArrayEvery01_089
     * @tc.desc Verify every on array after fill()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = new Uint16Array(5);
        arr.fill(42);
        let result: boolean = arr.every((v: number): boolean => v === 42);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY01_9000
     * @tc.name testUint16ArrayEvery01_090
     * @tc.desc Verify every on array after set()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEvery01_090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = new Uint16Array(4);
        arr.set([10, 20, 30], 0);
        let result: boolean = arr.every((v: number, i: int): boolean => i < 3 ? v === (i + 1) * 10 : v === 0);
        expect(result).assertTrue();
      }
    });

  });
}
