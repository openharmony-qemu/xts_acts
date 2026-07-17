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

export default function uint16ArrayFromPart2Test(): void {
  describe('Uint16ArrayFromPart2Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART2_0100
     * @tc.name testUint16ArrayFromPart2_001
     * @tc.desc Verify Set<number> Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart2_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let set: Set<number> = new Set<number>();
      let result: Uint16Array = Uint16Array.from(set);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART2_0200
     * @tc.name testUint16ArrayFromPart2_002
     * @tc.desc Verify Set<number> 65535( ) Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart2_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let set: Set<number> = new Set<number>();
      set.add(65535);
      let result: Uint16Array = Uint16Array.from(set);
      expect(result.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART2_0300
     * @tc.name testUint16ArrayFromPart2_003
     * @tc.desc Verify Set<number> 65536 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart2_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let set: Set<number> = new Set<number>();
      set.add(65536);
      let result: Uint16Array = Uint16Array.from(set);
      expect(result.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART2_0400
     * @tc.name testUint16ArrayFromPart2_004
     * @tc.desc Verify Set<number> -1 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart2_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let set: Set<number> = new Set<number>();
      set.add(-1);
      let result: Uint16Array = Uint16Array.from(set);
      expect(result.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART2_0500
     * @tc.name testUint16ArrayFromPart2_005
     * @tc.desc Verify Set<number> 3.14 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart2_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let set: Set<number> = new Set<number>();
      set.add(3.14);
      let result: Uint16Array = Uint16Array.from(set);
      expect(result.at(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART2_0600
     * @tc.name testUint16ArrayFromPart2_006
     * @tc.desc Verify Set<number> NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart2_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let set: Set<number> = new Set<number>();
      set.add(Number.NaN);
      let result: Uint16Array = Uint16Array.from(set);
      expect(result.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART2_0700
     * @tc.name testUint16ArrayFromPart2_007
     * @tc.desc Verify Set<number> Infinity 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart2_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let set: Set<number> = new Set<number>();
      set.add(Number.POSITIVE_INFINITY);
      let result: Uint16Array = Uint16Array.from(set);
      expect(result.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART2_0800
     * @tc.name testUint16ArrayFromPart2_008
     * @tc.desc Verify Set<number> -Infinity 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart2_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let set: Set<number> = new Set<number>();
      set.add(-Number.POSITIVE_INFINITY);
      let result: Uint16Array = Uint16Array.from(set);
      expect(result.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART2_0900
     * @tc.name testUint16ArrayFromPart2_009
     * @tc.desc Verify Set<number> 0xFFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart2_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let set: Set<number> = new Set<number>();
      set.add(0xFFFF);
      let result: Uint16Array = Uint16Array.from(set);
      expect(result.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART2_1000
     * @tc.name testUint16ArrayFromPart2_010
     * @tc.desc Verify Set<number> 0b1111111111111111
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart2_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let set: Set<number> = new Set<number>();
      set.add(0b1111111111111111);
      let result: Uint16Array = Uint16Array.from(set);
      expect(result.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART2_1100
     * @tc.name testUint16ArrayFromPart2_011
     * @tc.desc Verify Set<number> 0o177777
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart2_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let set: Set<number> = new Set<number>();
      set.add(0o177777);
      let result: Uint16Array = Uint16Array.from(set);
      expect(result.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART2_1200
     * @tc.name testUint16ArrayFromPart2_012
     * @tc.desc Verify Set<number> 1e4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart2_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let set: Set<number> = new Set<number>();
      set.add(1e4);
      let result: Uint16Array = Uint16Array.from(set);
      expect(result.at(0)).assertEqual(10000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART2_1300
     * @tc.name testUint16ArrayFromPart2_013
     * @tc.desc Verify Set<number> {0,65535,32768}
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart2_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let set: Set<number> = new Set<number>();
      set.add(0);
      set.add(65535);
      set.add(32768);
      let result: Uint16Array = Uint16Array.from(set);
      expect(result.length).assertEqual(3);
      expect(result.at(0)).assertEqual(0);
      expect(result.at(1)).assertEqual(65535);
      expect(result.at(2)).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART2_1400
     * @tc.name testUint16ArrayFromPart2_014
     * @tc.desc Verify Set<number> 65535.9 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart2_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let set: Set<number> = new Set<number>();
      set.add(65535.9);
      let result: Uint16Array = Uint16Array.from(set);
      expect(result.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART2_1500
     * @tc.name testUint16ArrayFromPart2_015
     * @tc.desc Verify Set<number> 0x10000 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart2_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let set: Set<number> = new Set<number>();
      set.add(0x10000);
      let result: Uint16Array = Uint16Array.from(set);
      expect(result.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART2_1600
     * @tc.name testUint16ArrayFromPart2_016
     * @tc.desc Verify Set<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart2_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let set: Set<number> = new Set<number>();
      set.add(1);
      set.add(1);
      set.add(2);
      let result: Uint16Array = Uint16Array.from(set);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART2_1700
     * @tc.name testUint16ArrayFromPart2_017
     * @tc.desc Verify Set<number> 100+ Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart2_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let set: Set<number> = new Set<number>();
      let i: int = 0;
      for (i = 0; i < 100; i++) {
        set.add(i);
      }
      let result: Uint16Array = Uint16Array.from(set);
      expect(result.length).assertEqual(100);
      expect(result.at(0)).assertEqual(0);
      expect(result.at(99)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART2_1800
     * @tc.name testUint16ArrayFromPart2_018
     * @tc.desc Verify Set<number> 65537 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart2_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let set: Set<number> = new Set<number>();
      set.add(65537);
      let result: Uint16Array = Uint16Array.from(set);
      expect(result.at(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART2_1900
     * @tc.name testUint16ArrayFromPart2_019
     * @tc.desc Verify from(set) instanceof Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart2_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let set: Set<number> = new Set<number>();
      set.add(10);
      let result: Uint16Array = Uint16Array.from(set);
      expect(result instanceof Uint16Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART2_2000
     * @tc.name testUint16ArrayFromPart2_020
     * @tc.desc Verify from(set) BYTES_PER_ELEMENT 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart2_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let set: Set<number> = new Set<number>();
      set.add(10);
      let result: Uint16Array = Uint16Array.from(set);
      expect(result.BYTES_PER_ELEMENT).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART2_2100
     * @tc.name testUint16ArrayFromPart2_021
     * @tc.desc Verify from(set) byteLength length*2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart2_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let set: Set<number> = new Set<number>();
      set.add(10);
      set.add(20);
      let result: Uint16Array = Uint16Array.from(set);
      expect(result.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART2_2200
     * @tc.name testUint16ArrayFromPart2_022
     * @tc.desc Verify from(set) byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart2_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let set: Set<number> = new Set<number>();
      set.add(10);
      let result: Uint16Array = Uint16Array.from(set);
      expect(result.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART2_2300
     * @tc.name testUint16ArrayFromPart2_023
     * @tc.desc Verify from(set) name Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart2_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let set: Set<number> = new Set<number>();
      set.add(10);
      let result: Uint16Array = Uint16Array.from(set);
      expect(result instanceof Uint16Array).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART2_2400
     * @tc.name testUint16ArrayFromPart2_024
     * @tc.desc Verify from(set) ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart2_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let set: Set<number> = new Set<number>();
      set.add(10);
      let result: Uint16Array = Uint16Array.from(set);
      set.add(20);
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART2_2500
     * @tc.name testUint16ArrayFromPart2_025
     * @tc.desc Verify Array<number> Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart2_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Array<number> = [];
      let result: Uint16Array = Uint16Array.from(arr);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART2_2600
     * @tc.name testUint16ArrayFromPart2_026
     * @tc.desc Verify Array<number> [0] Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart2_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Array<number> = [0];
      let result: Uint16Array = Uint16Array.from(arr);
      expect(result.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART2_2700
     * @tc.name testUint16ArrayFromPart2_027
     * @tc.desc Verify Array<number> [65536] 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart2_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Array<number> = [65536];
      let result: Uint16Array = Uint16Array.from(arr);
      expect(result.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART2_2800
     * @tc.name testUint16ArrayFromPart2_028
     * @tc.desc Verify Array<number> [-1] 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart2_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Array<number> = [-1];
      let result: Uint16Array = Uint16Array.from(arr);
      expect(result.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART2_2900
     * @tc.name testUint16ArrayFromPart2_029
     * @tc.desc Verify Array<number> [NaN] 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart2_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Array<number> = [Number.NaN];
      let result: Uint16Array = Uint16Array.from(arr);
      expect(result.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART2_3000
     * @tc.name testUint16ArrayFromPart2_030
     * @tc.desc Verify Array<number> [Infinity] 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart2_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Array<number> = [Number.POSITIVE_INFINITY];
      let result: Uint16Array = Uint16Array.from(arr);
      expect(result.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART2_3100
     * @tc.name testUint16ArrayFromPart2_031
     * @tc.desc Verify Array<number> [-Infinity] 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart2_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Array<number> = [-Number.POSITIVE_INFINITY];
      let result: Uint16Array = Uint16Array.from(arr);
      expect(result.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART2_3200
     * @tc.name testUint16ArrayFromPart2_032
     * @tc.desc Verify Array<number> [1,2,3,4,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart2_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Array<number> = [1, 2, 3, 4, 5];
      let result: Uint16Array = Uint16Array.from(arr);
      expect(result.length).assertEqual(5);
      expect(result.at(0)).assertEqual(1);
      expect(result.at(4)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART2_3300
     * @tc.name testUint16ArrayFromPart2_033
     * @tc.desc Verify Array<number> [0xFFFF]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart2_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Array<number> = [0xFFFF];
      let result: Uint16Array = Uint16Array.from(arr);
      expect(result.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART2_3400
     * @tc.name testUint16ArrayFromPart2_034
     * @tc.desc Verify Array<number> [0b1111111111111111]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart2_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Array<number> = [0b1111111111111111];
      let result: Uint16Array = Uint16Array.from(arr);
      expect(result.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART2_3500
     * @tc.name testUint16ArrayFromPart2_035
     * @tc.desc Verify Array<number> [1e4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart2_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Array<number> = [1e4];
      let result: Uint16Array = Uint16Array.from(arr);
      expect(result.at(0)).assertEqual(10000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART2_3600
     * @tc.name testUint16ArrayFromPart2_036
     * @tc.desc Verify Array<number> [0x10000] 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart2_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Array<number> = [0x10000];
      let result: Uint16Array = Uint16Array.from(arr);
      expect(result.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART2_3700
     * @tc.name testUint16ArrayFromPart2_037
     * @tc.desc Verify Array<number> 100+
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart2_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Array<number> = [];
      let i: int = 0;
      for (i = 0; i < 100; i++) {
        arr.push(i);
      }
      let result: Uint16Array = Uint16Array.from(arr);
      expect(result.length).assertEqual(100);
      expect(result.at(0)).assertEqual(0);
      expect(result.at(99)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART2_3800
     * @tc.name testUint16ArrayFromPart2_038
     * @tc.desc Verify from(arr) instanceof Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart2_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Array<number> = [10];
      let result: Uint16Array = Uint16Array.from(arr);
      expect(result instanceof Uint16Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART2_3900
     * @tc.name testUint16ArrayFromPart2_039
     * @tc.desc Verify from(arr) length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart2_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Array<number> = [10, 20, 30];
      let result: Uint16Array = Uint16Array.from(arr);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART2_4000
     * @tc.name testUint16ArrayFromPart2_040
     * @tc.desc Verify from(arr) BYTES_PER_ELEMENT 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart2_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Array<number> = [10];
      let result: Uint16Array = Uint16Array.from(arr);
      expect(result.BYTES_PER_ELEMENT).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART2_4100
     * @tc.name testUint16ArrayFromPart2_041
     * @tc.desc Verify from(arr) byteLength length*2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart2_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Array<number> = [10, 20];
      let result: Uint16Array = Uint16Array.from(arr);
      expect(result.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART2_4200
     * @tc.name testUint16ArrayFromPart2_042
     * @tc.desc Verify from(arr) byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart2_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Array<number> = [10];
      let result: Uint16Array = Uint16Array.from(arr);
      expect(result.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART2_4300
     * @tc.name testUint16ArrayFromPart2_043
     * @tc.desc Verify Array<number> mapfn Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart2_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Array<number> = [];
      let result: Uint16Array = Uint16Array.from(arr, (v: number, k: number): number => v);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART2_4400
     * @tc.name testUint16ArrayFromPart2_044
     * @tc.desc Verify Array<number> mapfn 65535( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart2_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Array<number> = [100];
      let result: Uint16Array = Uint16Array.from(arr, (v: number, k: number): number => 65535);
      expect(result.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART2_4500
     * @tc.name testUint16ArrayFromPart2_045
     * @tc.desc Verify Array<number> mapfn 65536 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart2_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Array<number> = [100];
      let result: Uint16Array = Uint16Array.from(arr, (v: number, k: number): number => 65536);
      expect(result.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART2_4600
     * @tc.name testUint16ArrayFromPart2_046
     * @tc.desc Verify Array<number> mapfn -1 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart2_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Array<number> = [100];
      let result: Uint16Array = Uint16Array.from(arr, (v: number, k: number): number => -1);
      expect(result.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART2_4700
     * @tc.name testUint16ArrayFromPart2_047
     * @tc.desc Verify Array<number> mapfn 3.14 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart2_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Array<number> = [100];
      let result: Uint16Array = Uint16Array.from(arr, (v: number, k: number): number => 3.14);
      expect(result.at(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART2_4800
     * @tc.name testUint16ArrayFromPart2_048
     * @tc.desc Verify Array<number> mapfn NaN 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart2_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Array<number> = [100];
      let result: Uint16Array = Uint16Array.from(arr, (v: number, k: number): number => Number.NaN);
      expect(result.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART2_4900
     * @tc.name testUint16ArrayFromPart2_049
     * @tc.desc Verify Array<number> mapfn Infinity 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart2_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Array<number> = [100];
      let result: Uint16Array = Uint16Array.from(arr, (v: number, k: number): number => Number.POSITIVE_INFINITY);
      expect(result.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART2_5000
     * @tc.name testUint16ArrayFromPart2_050
     * @tc.desc Verify Array<number> mapfn -Infinity 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart2_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Array<number> = [100];
      let result: Uint16Array = Uint16Array.from(arr, (v: number, k: number): number => -Number.POSITIVE_INFINITY);
      expect(result.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART2_5100
     * @tc.name testUint16ArrayFromPart2_051
     * @tc.desc Verify Array<string> mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart2_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Array<string> = ["10", "20", "30"];
      let result: Uint16Array = Uint16Array.from(arr, (v: string, k: number): number => {
        if (v === "10") {
          return 10;
        }
        if (v === "20") {
          return 20;
        }
        return 30;
      });
      expect(result.at(0)).assertEqual(10);
      expect(result.at(1)).assertEqual(20);
      expect(result.at(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART2_5200
     * @tc.name testUint16ArrayFromPart2_052
     * @tc.desc Verify Array<number> mapfn index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart2_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Array<number> = [0, 0, 0];
      let result: Uint16Array = Uint16Array.from(arr, (v: number, k: number): number => k + 1);
      expect(result.at(0)).assertEqual(1);
      expect(result.at(1)).assertEqual(2);
      expect(result.at(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART2_5300
     * @tc.name testUint16ArrayFromPart2_053
     * @tc.desc Verify Array<number> mapfn 32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart2_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Array<number> = [100];
      let result: Uint16Array = Uint16Array.from(arr, (v: number, k: number): number => 32768);
      expect(result.at(0)).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART2_5400
     * @tc.name testUint16ArrayFromPart2_054
     * @tc.desc Verify Array<number> mapfn 0xFFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart2_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Array<number> = [100];
      let result: Uint16Array = Uint16Array.from(arr, (v: number, k: number): number => 0xFFFF);
      expect(result.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART2_5500
     * @tc.name testUint16ArrayFromPart2_055
     * @tc.desc Verify Array<number> mapfn 65535.9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart2_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Array<number> = [100];
      let result: Uint16Array = Uint16Array.from(arr, (v: number, k: number): number => 65535.9);
      expect(result.at(0)).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART2_5600
     * @tc.name testUint16ArrayFromPart2_056
     * @tc.desc Verify Array<number> mapfn -0.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart2_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Array<number> = [100];
      let result: Uint16Array = Uint16Array.from(arr, (v: number, k: number): number => -0.5);
      expect(result.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART2_5700
     * @tc.name testUint16ArrayFromPart2_057
     * @tc.desc Verify Array<number> mapfn 0x10000 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart2_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Array<number> = [100];
      let result: Uint16Array = Uint16Array.from(arr, (v: number, k: number): number => 0x10000);
      expect(result.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART2_5800
     * @tc.name testUint16ArrayFromPart2_058
     * @tc.desc Verify Array<number> mapfn 65537 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart2_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Array<number> = [100];
      let result: Uint16Array = Uint16Array.from(arr, (v: number, k: number): number => 65537);
      expect(result.at(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART2_5900
     * @tc.name testUint16ArrayFromPart2_059
     * @tc.desc Verify Array<number> mapfn 65536*2+1 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart2_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Array<number> = [100];
      let result: Uint16Array = Uint16Array.from(arr, (v: number, k: number): number => 65536 * 2 + 1);
      expect(result.at(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART2_6000
     * @tc.name testUint16ArrayFromPart2_060
     * @tc.desc Verify Array<number> mapfn -0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart2_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Array<number> = [100];
      let result: Uint16Array = Uint16Array.from(arr, (v: number, k: number): number => -0);
      expect(result.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART2_6100
     * @tc.name testUint16ArrayFromPart2_061
     * @tc.desc Verify Array<number> 100+ mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart2_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Array<number> = [];
      let i: int = 0;
      for (i = 0; i < 100; i++) {
        arr.push(i);
      }
      let result: Uint16Array = Uint16Array.from(arr, (v: number, k: number): number => v + 1);
      expect(result.length).assertEqual(100);
      expect(result.at(0)).assertEqual(1);
      expect(result.at(99)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART2_6200
     * @tc.name testUint16ArrayFromPart2_062
     * @tc.desc Verify mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart2_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Array<number> = [1, 2, 3];
      let result: Uint16Array = Uint16Array.from(arr, (v: number, k: number): number => v * 2);
      expect(result.at(0)).assertEqual(2);
      expect(result.at(2)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART2_6300
     * @tc.name testUint16ArrayFromPart2_063
     * @tc.desc Verify mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart2_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Array<number> = [1, 2, 3];
      try {
        let result: Uint16Array = Uint16Array.from(arr, (v: number, k: number): number => {
          throw new Error("mapfn error");
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART2_6400
     * @tc.name testUint16ArrayFromPart2_064
     * @tc.desc Verify from Uint16Array source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart2_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = Uint16Array.of(100, 200, 300, 400);
      let result: Uint16Array = Uint16Array.from(source);
      expect(result.length).assertEqual(4);
      expect(result.at(0)).assertEqual(100);
      expect(result.at(3)).assertEqual(400);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART2_6500
     * @tc.name testUint16ArrayFromPart2_065
     * @tc.desc Verify from with mapfn on Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart2_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source = Uint16Array.of(1, 2, 3);
      let result: Uint16Array = Uint16Array.from(source, (v: number, k: number): number => v * 500);
      expect(result.at(0)).assertEqual(500);
      expect(result.at(1)).assertEqual(1000);
      expect(result.at(2)).assertEqual(1500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART2_6600
     * @tc.name testUint16ArrayFromPart2_066
     * @tc.desc Verify from array with 0x10000 value (0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart2_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [0x10000];
      let result: Uint16Array = Uint16Array.from(source);
      expect(result.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART2_6700
     * @tc.name testUint16ArrayFromPart2_067
     * @tc.desc Verify from source after modification (copy is independent)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart2_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let source: Array<number> = [1, 2, 3];
      let result: Uint16Array = Uint16Array.from(source);
      source[0] = 999;
      expect(result.at(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FROM_PART2_6800
     * @tc.name testUint16ArrayFromPart2_068
     * @tc.desc Verify from with mapfn and empty source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFromPart2_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let called: boolean = false;
      let source: Array<number> = [];
      let result: Uint16Array = Uint16Array.from(source, (v: number, k: number): number => { called = true; return v; });
      expect(called).assertFalse();
      expect(result.length).assertEqual(0);
    });

  });
}
