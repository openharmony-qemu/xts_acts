'use static';

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

export default function uint16ArraySortPart1Test(): void {
  describe('Uint16ArraySortPart1Test', (): void => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_0100
     * @tc.name testUint16ArraySortPart1001
      * @tc.desc Verify default sort orders three unsorted values ascending
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(3, 1, 2);
      let result: Uint16Array = arr.sort();
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_0200
     * @tc.name testUint16ArraySortPart1002
      * @tc.desc Verify an ascending comparator orders three unsorted values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(3, 1, 2);
      arr.sort((a: number, b: number): int => a < b ? -1 : (a > b ? 1 : 0));
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_0300
     * @tc.name testUint16ArraySortPart1003
      * @tc.desc Verify a zero comparator preserves the original order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(9, 6, 4);
      arr.sort((a: number, b: number): int => 0);
      expect(arr[0]).assertEqual(9);
      expect(arr[1]).assertEqual(6);
      expect(arr[2]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_0400
     * @tc.name testUint16ArraySortPart1004
      * @tc.desc Verify an ascending comparator orders tens values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(30, 10, 20);
      arr.sort((a: number, b: number): int => a < b ? -1 : (a > b ? 1 : 0));
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_0500
     * @tc.name testUint16ArraySortPart1005
      * @tc.desc Verify a descending comparator reverses three values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 30, 20);
      arr.sort((a: number, b: number): int => a < b ? 1 : (a > b ? -1 : 0));
      expect(arr[0]).assertEqual(30);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_0600
     * @tc.name testUint16ArraySortPart1006
      * @tc.desc Verify an integer subtraction comparator orders values ascending
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(25, 5, 15);
      arr.sort((a: number, b: number): int => a.toInt() - b.toInt());
      expect(arr[0]).assertEqual(5);
      expect(arr[1]).assertEqual(15);
      expect(arr[2]).assertEqual(25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_0700
     * @tc.name testUint16ArraySortPart1007
      * @tc.desc Verify a three-way ascending comparator orders irregular values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(42, 13, 29);
      arr.sort((a: number, b: number): int => a > b ? 1 : (a < b ? -1 : 0));
      expect(arr[0]).assertEqual(13);
      expect(arr[1]).assertEqual(29);
      expect(arr[2]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_0800
     * @tc.name testUint16ArraySortPart1008
      * @tc.desc Verify a nonzero ascending comparator orders distinct values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(15, 8, 22);
      arr.sort((a: number, b: number): int => a < b ? -1 : 1);
      expect(arr[0]).assertEqual(8);
      expect(arr[1]).assertEqual(15);
      expect(arr[2]).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_0900
     * @tc.name testUint16ArraySortPart1009
       * @tc.desc Verify a comparator sorts even values before odd values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(4, 3, 2, 1);
      arr.sort((a: number, b: number): int => ((a % 2).toInt()) - ((b % 2).toInt()));
      expect(arr[0]).assertEqual(4);
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_1000
     * @tc.name testUint16ArraySortPart1010
       * @tc.desc Verify a bitwise comparator sorts even values before odd values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(5, 2, 7, 4);
      arr.sort((a: number, b: number): int => ((a & 1).toInt()) - ((b & 1).toInt()));
      expect(arr[0] & 1).assertEqual(0);
      expect(arr[1] & 1).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_1100
     * @tc.name testUint16ArraySortPart1011
      * @tc.desc Verify a tens-bucket comparator orders values by quotient
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(25, 12, 38, 5);
      arr.sort((a: number, b: number): int => ((a.toInt() / 10) - (b.toInt() / 10)).toInt());
      expect(arr[0]).assertEqual(5);
      expect(arr[1]).assertEqual(12);
      expect(arr[2]).assertEqual(25);
      expect(arr[3]).assertEqual(38);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_1200
     * @tc.name testUint16ArraySortPart1012
      * @tc.desc Verify a reverse remainder comparator orders the leading remainders
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(7, 4, 9, 2);
      arr.sort((a: number, b: number): int => ((b % 3) - (a % 3)).toInt());
      expect(arr[0] % 3).assertEqual(2);
      expect(arr[1] % 3).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_1300
     * @tc.name testUint16ArraySortPart1013
      * @tc.desc Verify a comparator can place the maximum Uint16 value first
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(100, 65535, 50);
      arr.sort((a: number, b: number): int => (a === 65535 ? -1 : (b === 65535 ? 1 : a - b)).toInt());
      expect(arr[0]).assertEqual(65535);
      expect(arr[1]).assertEqual(50);
      expect(arr[2]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_1400
     * @tc.name testUint16ArraySortPart1014
      * @tc.desc Verify a comparator can place zero after other values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(0, 100, 50);
      arr.sort((a: number, b: number): int => (a === 0 ? 1 : (b === 0 ? -1 : a - b)).toInt());
      expect(arr[0]).assertEqual(50);
      expect(arr[1]).assertEqual(100);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_1500
     * @tc.name testUint16ArraySortPart1015
      * @tc.desc Verify a bit-mask comparator groups values with bit two set
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(3, 6, 2, 7);
      arr.sort((a: number, b: number): int => ((a & 2).toInt()) - ((b & 2).toInt()));
      expect(arr[0] & 2).assertEqual(2);
      expect(arr[1] & 2).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_1600
     * @tc.name testUint16ArraySortPart1016
      * @tc.desc Verify sort propagates an Error thrown by its comparator
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(3, 1, 2);
      try {
      arr.sort((a: number, b: number): int => {
        throw new Error("sort fail");
      });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_1700
     * @tc.name testUint16ArraySortPart1017
      * @tc.desc Verify sort propagates a TypeError thrown by its comparator
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(5, 4, 3);
      try {
      arr.sort((a: number, b: number): int => {
        throw new TypeError("type err");
      });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_1800
     * @tc.name testUint16ArraySortPart1018
      * @tc.desc Verify sort propagates a RangeError thrown by its comparator
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(9, 8, 7);
      try {
      arr.sort((a: number, b: number): int => {
        throw new RangeError("range err");
      });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_1900
     * @tc.name testUint16ArraySortPart1019
      * @tc.desc Verify a three-way descending comparator orders distinct values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(20, 10, 30);
      arr.sort((a: number, b: number): int => a === b ? 0 : (a > b ? -1 : 1));
      expect(arr[0]).assertEqual(30);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_2000
     * @tc.name testUint16ArraySortPart1020
      * @tc.desc Verify a block-body comparator can return an ascending difference
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(50, 30, 40);
      arr.sort((a: number, b: number): int => {
        let r: int = (a - b).toInt();
        return r;
      });
      expect(arr[0]).assertEqual(30);
      expect(arr[1]).assertEqual(40);
      expect(arr[2]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_2100
     * @tc.name testUint16ArraySortPart1021
      * @tc.desc Verify an asymmetric ascending comparator orders distinct values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(4, 2, 6);
      arr.sort((a: number, b: number): int => a > b ? 1 : -1);
      expect(arr[0]).assertEqual(2);
      expect(arr[1]).assertEqual(4);
      expect(arr[2]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_2200
     * @tc.name testUint16ArraySortPart1022
      * @tc.desc Verify default sort handles an empty array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array();
      arr.sort();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_2300
     * @tc.name testUint16ArraySortPart1023
      * @tc.desc Verify default sort preserves a single element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(42);
      arr.sort();
      expect(arr[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_2400
     * @tc.name testUint16ArraySortPart1024
      * @tc.desc Verify default sort orders a two-element descending array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(2, 1);
      arr.sort();
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_2500
     * @tc.name testUint16ArraySortPart1025
      * @tc.desc Verify default sort orders a three-element permutation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(3, 1, 2);
      arr.sort();
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_2600
     * @tc.name testUint16ArraySortPart1026
      * @tc.desc Verify default sort preserves an already ascending sequence
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
      arr.sort();
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_2700
     * @tc.name testUint16ArraySortPart1027
      * @tc.desc Verify default sort reverses a three-element descending sequence
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(3, 2, 1);
      arr.sort();
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_2800
     * @tc.name testUint16ArraySortPart1028
      * @tc.desc Verify default sort preserves equal values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(5, 5, 5);
      arr.sort();
      expect(arr[0]).assertEqual(5);
      expect(arr[1]).assertEqual(5);
      expect(arr[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_2900
     * @tc.name testUint16ArraySortPart1029
      * @tc.desc Verify default sort orders minimum midpoint and maximum values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(0, 65535, 32768);
      arr.sort();
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(32768);
      expect(arr[2]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_3000
     * @tc.name testUint16ArraySortPart1030
      * @tc.desc Verify default sort groups duplicate values in ascending order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(5, 3, 5, 1, 3);
      arr.sort();
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(3);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(5);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_3100
     * @tc.name testUint16ArraySortPart1031
      * @tc.desc Verify default sort orders a ten-element descending sequence
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 9, 8, 7, 6, 5, 4, 3, 2, 1);
      arr.sort();
      for (let i: int = 0; i < 10; i++) {
        expect(arr[i]).assertEqual(i + 1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_3200
     * @tc.name testUint16ArraySortPart1032
      * @tc.desc Verify default sort preserves an ascending five-element sequence
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3, 4, 5);
      arr.sort();
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_3300
     * @tc.name testUint16ArraySortPart1033
      * @tc.desc Verify default sort reverses a five-element descending sequence
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(5, 4, 3, 2, 1);
      arr.sort();
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_3400
     * @tc.name testUint16ArraySortPart1034
      * @tc.desc Verify default sort retains an already ascending sequence beginning with zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(0, 1, 2);
      arr.sort();
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(1);
      expect(arr[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_3500
     * @tc.name testUint16ArraySortPart1035
      * @tc.desc Verify default sort orders a maximum-first boundary triplet
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(65535, 0, 1);
      arr.sort();
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(1);
      expect(arr[2]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_3600
     * @tc.name testUint16ArraySortPart1036
      * @tc.desc Verify default sort preserves repeated zero values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(0, 0, 0);
      arr.sort();
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_3700
     * @tc.name testUint16ArraySortPart1037
      * @tc.desc Verify an ascending comparator orders duplicate values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(2, 1, 2);
      arr.sort((a: number, b: number): int => a < b ? -1 : (a > b ? 1 : 0));
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_3800
     * @tc.name testUint16ArraySortPart1038
      * @tc.desc Verify an ascending comparator orders repeated mixed values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(3, 1, 2, 1);
      arr.sort((a: number, b: number): int => a < b ? -1 : (a > b ? 1 : 0));
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(1);
      expect(arr[2]).assertEqual(2);
      expect(arr[3]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_3900
     * @tc.name testUint16ArraySortPart1039
      * @tc.desc Verify an ascending comparator groups an alternating duplicate sequence
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(2, 1, 2, 1);
      arr.sort((a: number, b: number): int => a < b ? -1 : (a > b ? 1 : 0));
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(1);
      expect(arr[2]).assertEqual(2);
      expect(arr[3]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_4000
     * @tc.name testUint16ArraySortPart1040
      * @tc.desc Verify comparator invocation propagates its thrown error
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(5, 3, 8);
      let called: boolean = false;
      try {
        arr.sort((a: number, b: number): int => {
          called = true;
          throw new Error("abort");
        });
        expect().assertFail();
      } catch (e) {
        expect(called).assertTrue();
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_4100
     * @tc.name testUint16ArraySortPart1041
      * @tc.desc Verify sort propagates a custom Error thrown by its comparator
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(9, 6, 3);
      try {
        arr.sort((a: number, b: number): int => {
          throw new Error("custom error");
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_4200
     * @tc.name testUint16ArraySortPart1042
      * @tc.desc Verify comparator side effects occur before its thrown error
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(4, 2, 6);
      let sideEffect: int = 0;
      try {
        arr.sort((a: number, b: number): int => {
          sideEffect = 99;
          throw new Error("side");
        });
        expect().assertFail();
      } catch (e) {
        expect(sideEffect).assertEqual(99);
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_4300
     * @tc.name testUint16ArraySortPart1043
      * @tc.desc Verify default sort mutates and returns the receiver
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(3, 1, 2);
      let result: Uint16Array = arr.sort();
      expect(result).assertEqual(arr);
      expect(arr.join(',')).assertEqual('1,2,3');

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_4400
     * @tc.name testUint16ArraySortPart1044
      * @tc.desc Verify comparator sort mutates and returns the receiver
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 5, 15);
      let result: Uint16Array = arr.sort((a: number, b: number): int => a < b ? -1 : (a > b ? 1 : 0));
      expect(result).assertEqual(arr);
      expect(arr.join(',')).assertEqual('5,10,15');

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_4500
     * @tc.name testUint16ArraySortPart1045
      * @tc.desc Verify default sort returns the same two-element Uint16Array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(2, 1);
      let result: Uint16Array = arr.sort();
      expect(result).assertEqual(arr);
      expect(result.join(',')).assertEqual('1,2');

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_4600
     * @tc.name testUint16ArraySortPart1046
      * @tc.desc Verify default sort preserves length while ordering values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(5, 3, 1, 4, 2);
      let lenBefore: int = arr.length;
      arr.sort();
      expect(arr.length).assertEqual(lenBefore);
      expect(arr.join(',')).assertEqual('1,2,3,4,5');

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_4700
     * @tc.name testUint16ArraySortPart1047
      * @tc.desc Verify comparator sorting preserves the receiver byte length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(9, 5, 7);
      let byteLenBefore: int = arr.byteLength;
      arr.sort((a: number, b: number): int => a < b ? -1 : (a > b ? 1 : 0));
      expect(arr.byteLength).assertEqual(byteLenBefore);
      expect(arr.join(',')).assertEqual('5,7,9');

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_4800
     * @tc.name testUint16ArraySortPart1048
      * @tc.desc Verify default sorting preserves the receiver byte offset
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(8, 4, 6);
      let offsetBefore: int = arr.byteOffset;
      arr.sort();
      expect(arr.byteOffset).assertEqual(offsetBefore);
      expect(arr.join(',')).assertEqual('4,6,8');

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_4900
     * @tc.name testUint16ArraySortPart1049
     * @tc.desc Verify sort orders the full array numerically ascending
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Uint16Array = Uint16Array.of(40, 2, 300, 11);
      source.sort();
      expect(source.join(',')).assertEqual('2,11,40,300');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_5000
     * @tc.name testUint16ArraySortPart1050
     * @tc.desc Verify sort comparator orders the full array descending
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Uint16Array = Uint16Array.of(4, 1, 3, 2);
      source.sort((left: number, right: number): int => right.toInt() - left.toInt());
      expect(source.join(',')).assertEqual('4,3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_5100
     * @tc.name testUint16ArraySortPart1051
     * @tc.desc Verify sort comparator groups even values before odd values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Uint16Array = Uint16Array.of(7, 4, 3, 8, 5, 2);
      source.sort((left: number, right: number): int => {
        const parity: int = left.toInt() % 2 - right.toInt() % 2;
        return parity !== 0 ? parity : left.toInt() - right.toInt();
      });
      expect(source.join(',')).assertEqual('2,4,8,3,5,7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_5200
     * @tc.name testUint16ArraySortPart1052
     * @tc.desc Verify sort comparator orders by remainder then by value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Uint16Array = Uint16Array.of(14, 3, 11, 8, 5);
      source.sort((left: number, right: number): int => {
        const remainder: int = left.toInt() % 3 - right.toInt() % 3;
        return remainder !== 0 ? remainder : left.toInt() - right.toInt();
      });
      expect(source.join(',')).assertEqual('3,5,8,11,14');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_5300
     * @tc.name testUint16ArraySortPart1053
     * @tc.desc Verify sort comparator orders by distance from a pivot
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Uint16Array = Uint16Array.of(2, 8, 5, 10, 1);
      source.sort((left: number, right: number): int => {
        const leftDistance: int = left.toInt() > 6 ? left.toInt() - 6 : 6 - left.toInt();
        const rightDistance: int = right.toInt() > 6 ? right.toInt() - 6 : 6 - right.toInt();
        return leftDistance !== rightDistance ? leftDistance - rightDistance : left.toInt() - right.toInt();
      });
      expect(source.join(',')).assertEqual('5,8,2,10,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_5400
     * @tc.name testUint16ArraySortPart1054
     * @tc.desc Verify sort mutates and returns the same typed array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Uint16Array = Uint16Array.of(9, 1, 5);
      const result: Uint16Array = source.sort();
      expect(result).assertEqual(source);
      expect(source.join(',')).assertEqual('1,5,9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_5500
     * @tc.name testUint16ArraySortPart1055
     * @tc.desc Verify sort only reorders a nonzero ArrayBuffer view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(12);
      const full: Uint16Array = new Uint16Array(buffer);
      full.set(Uint16Array.of(90, 7, 3, 5, 1, 80));
      const view: Uint16Array = new Uint16Array(buffer, 2, 4);
      view.sort();
      expect(view.join(',')).assertEqual('1,3,5,7');
      expect(full.join(',')).assertEqual('90,1,3,5,7,80');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_5600
     * @tc.name testUint16ArraySortPart1056
     * @tc.desc Verify sort handles duplicate values and boundary values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Uint16Array = Uint16Array.of(65535, 0, 32768, 0, 65535);
      source.sort();
      expect(source.join(',')).assertEqual('0,0,32768,65535,65535');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_5700
     * @tc.name testUint16ArraySortPart1057
     * @tc.desc Verify sort invokes no comparator for an empty array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Uint16Array = new Uint16Array();
      let calls: int = 0;
      source.sort((left: number, right: number): int => {
        calls++;
        return left.toInt() - right.toInt();
      });
      expect(source.join(',')).assertEqual('');
      expect(calls).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_5800
     * @tc.name testUint16ArraySortPart1058
     * @tc.desc Verify sort invokes no comparator for a single element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Uint16Array = Uint16Array.of(42);
      let calls: int = 0;
      source.sort((left: number, right: number): int => {
        calls++;
        return left.toInt() - right.toInt();
      });
      expect(source.join(',')).assertEqual('42');
      expect(calls).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_5900
     * @tc.name testUint16ArraySortPart1059
     * @tc.desc Verify sort propagates comparator Error
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Uint16Array = Uint16Array.of(3, 2, 1);
      try {
        source.sort((left: number, right: number): int => {
          throw new Error('sort stop');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.message).assertEqual('sort stop');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_6000
     * @tc.name testUint16ArraySortPart1060
     * @tc.desc Verify sort comparator orders by high byte then low byte
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Uint16Array = Uint16Array.of(0x0201, 0x0102, 0x0200, 0x0101);
      source.sort((left: number, right: number): int => left.toInt() - right.toInt());
      expect(source.join(',')).assertEqual('257,258,512,513');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_6100
     * @tc.name testUint16ArraySortPart1061
     * @tc.desc Verify sort comparator orders by quotient bucket then value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Uint16Array = Uint16Array.of(25, 4, 19, 11, 32);
      source.sort((left: number, right: number): int => {
        const bucket: int = left.toInt() / 10 - right.toInt() / 10;
        return bucket !== 0 ? bucket : right.toInt() - left.toInt();
      });
      expect(source.join(',')).assertEqual('4,19,11,25,32');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_6200
     * @tc.name testUint16ArraySortPart1062
     * @tc.desc Verify sort preserves the backing buffer object
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Uint16Array = Uint16Array.of(8, 6, 7, 5);
      const bufferBefore: ArrayBuffer = source.buffer;
      source.sort();
      expect(source.buffer).assertEqual(bufferBefore);
      expect(source.join(',')).assertEqual('5,6,7,8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_6300
     * @tc.name testUint16ArraySortPart1063
     * @tc.desc Verify sort orders values produced by Uint16 conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Uint16Array = new Uint16Array([-1, 65536, 65537, 32768]);
      source.sort();
      expect(source.join(',')).assertEqual('0,1,32768,65535');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_6400
     * @tc.name testUint16ArraySortPart1064
     * @tc.desc Verify sort comparator can place a selected sentinel first
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Uint16Array = Uint16Array.of(4, 99, 2, 99, 3);
      source.sort((left: number, right: number): int => {
        if (left === 99 && right !== 99) {
          return -1;
        }
        if (right === 99 && left !== 99) {
          return 1;
        }
        return left.toInt() - right.toInt();
      });
      expect(source.join(',')).assertEqual('99,99,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_6500
     * @tc.name testUint16ArraySortPart1065
     * @tc.desc Verify sort comparator orders by low byte then full value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Uint16Array = Uint16Array.of(0x0102, 0x0003, 0x0201, 0x0101);
      source.sort((left: number, right: number): int => {
        const lowByte: int = left.toInt() % 256 - right.toInt() % 256;
        return lowByte !== 0 ? lowByte : left.toInt() - right.toInt();
      });
      expect(source.join(',')).assertEqual('257,513,258,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_6600
     * @tc.name testUint16ArraySortPart1066
     * @tc.desc Verify sort comparator orders by high byte descending
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Uint16Array = Uint16Array.of(0x0102, 0x0301, 0x0205, 0x0101);
      source.sort((left: number, right: number): int => {
        const highByte: int = right.toInt() / 256 - left.toInt() / 256;
        return highByte !== 0 ? highByte : left.toInt() - right.toInt();
      });
      expect(source.join(',')).assertEqual('769,517,257,258');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_6700
     * @tc.name testUint16ArraySortPart1067
     * @tc.desc Verify sort comparator orders by decimal last digit
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Uint16Array = Uint16Array.of(42, 17, 35, 21, 9);
      source.sort((left: number, right: number): int => {
        const digit: int = left.toInt() % 10 - right.toInt() % 10;
        return digit !== 0 ? digit : left.toInt() - right.toInt();
      });
      expect(source.join(',')).assertEqual('21,42,35,17,9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_6800
     * @tc.name testUint16ArraySortPart1068
     * @tc.desc Verify sort comparator orders by decimal digit sum
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Uint16Array = Uint16Array.of(99, 12, 40, 7, 23);
      source.sort((left: number, right: number): int => {
        const leftSum: int = left.toInt() / 10 + left.toInt() % 10;
        const rightSum: int = right.toInt() / 10 + right.toInt() % 10;
        return leftSum !== rightSum ? leftSum - rightSum : left.toInt() - right.toInt();
      });
      expect(source.join(',')).assertEqual('12,40,23,7,99');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_6900
     * @tc.name testUint16ArraySortPart1069
     * @tc.desc Verify sort comparator orders values below a threshold first
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Uint16Array = Uint16Array.of(60, 10, 80, 30, 50);
      source.sort((left: number, right: number): int => {
        const leftGroup: int = left < 50 ? 0 : 1;
        const rightGroup: int = right < 50 ? 0 : 1;
        return leftGroup !== rightGroup ? leftGroup - rightGroup : left.toInt() - right.toInt();
      });
      expect(source.join(',')).assertEqual('10,30,50,60,80');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_7000
     * @tc.name testUint16ArraySortPart1070
     * @tc.desc Verify sort comparator orders powers of two before other values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Uint16Array = Uint16Array.of(3, 8, 5, 4, 6, 2);
      source.sort((left: number, right: number): int => {
        const leftPower: int = (left === 2 || left === 4 || left === 8) ? 0 : 1;
        const rightPower: int = (right === 2 || right === 4 || right === 8) ? 0 : 1;
        return leftPower !== rightPower ? leftPower - rightPower : left.toInt() - right.toInt();
      });
      expect(source.join(',')).assertEqual('2,4,8,3,5,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_7100
     * @tc.name testUint16ArraySortPart1071
     * @tc.desc Verify sort comparator orders values by absolute distance from zero after wrap
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Uint16Array = Uint16Array.of(65535, 1, 65534, 2, 32768);
      source.sort((left: number, right: number): int => {
        const leftDistance: int = left > 32767 ? 65536 - left.toInt() : left.toInt();
        const rightDistance: int = right > 32767 ? 65536 - right.toInt() : right.toInt();
        return leftDistance !== rightDistance ? leftDistance - rightDistance : left.toInt() - right.toInt();
      });
      expect(source.join(',')).assertEqual('1,65535,2,65534,32768');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_7200
     * @tc.name testUint16ArraySortPart1072
     * @tc.desc Verify sort comparator orders an inclusive range before outside values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Uint16Array = Uint16Array.of(5, 20, 15, 30, 10, 25);
      source.sort((left: number, right: number): int => {
        const leftGroup: int = left >= 10 && left <= 20 ? 0 : 1;
        const rightGroup: int = right >= 10 && right <= 20 ? 0 : 1;
        return leftGroup !== rightGroup ? leftGroup - rightGroup : left.toInt() - right.toInt();
      });
      expect(source.join(',')).assertEqual('10,15,20,5,25,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_7300
     * @tc.name testUint16ArraySortPart1073
     * @tc.desc Verify sort comparator orders by quotient and descending remainder
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Uint16Array = Uint16Array.of(14, 11, 23, 20, 18);
      source.sort((left: number, right: number): int => {
        const quotient: int = left.toInt() / 10 - right.toInt() / 10;
        return quotient !== 0 ? quotient : right.toInt() % 10 - left.toInt() % 10;
      });
      expect(source.join(',')).assertEqual('18,14,11,23,20');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_7400
     * @tc.name testUint16ArraySortPart1074
     * @tc.desc Verify sort comparator orders by xor-transformed numeric key
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Uint16Array = Uint16Array.of(0, 1, 2, 3);
      source.sort((left: number, right: number): int => (left.toInt() ^ 2) - (right.toInt() ^ 2));
      expect(source.join(',')).assertEqual('2,3,0,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_7500
     * @tc.name testUint16ArraySortPart1075
     * @tc.desc Verify sort comparator orders zero last
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Uint16Array = Uint16Array.of(0, 4, 2, 0, 3);
      source.sort((left: number, right: number): int => {
        if (left === 0 && right !== 0) {
          return 1;
        }
        if (right === 0 && left !== 0) {
          return -1;
        }
        return left.toInt() - right.toInt();
      });
      expect(source.join(',')).assertEqual('2,3,4,0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_7600
     * @tc.name testUint16ArraySortPart1076
     * @tc.desc Verify sort comparator orders by nearest multiple of ten
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Uint16Array = Uint16Array.of(14, 26, 21, 8, 33);
      source.sort((left: number, right: number): int => {
        const leftDistance: int = left.toInt() % 10 <= 5 ? left.toInt() % 10 : 10 - left.toInt() % 10;
        const rightDistance: int = right.toInt() % 10 <= 5 ? right.toInt() % 10 : 10 - right.toInt() % 10;
        return leftDistance !== rightDistance ? leftDistance - rightDistance : left.toInt() - right.toInt();
      });
      expect(source.join(',')).assertEqual('21,8,33,14,26');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_7700
     * @tc.name testUint16ArraySortPart1077
     * @tc.desc Verify sort comparator orders by alternating parity preference above threshold
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Uint16Array = Uint16Array.of(2, 7, 12, 5, 10, 3);
      source.sort((left: number, right: number): int => {
        const leftGroup: int = left >= 10 ? 0 : (left.toInt() % 2 === 1 ? 1 : 2);
        const rightGroup: int = right >= 10 ? 0 : (right.toInt() % 2 === 1 ? 1 : 2);
        return leftGroup !== rightGroup ? leftGroup - rightGroup : left.toInt() - right.toInt();
      });
      expect(source.join(',')).assertEqual('10,12,3,5,7,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_7800
     * @tc.name testUint16ArraySortPart1078
     * @tc.desc Verify sort comparator orders by number of set low bits
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Uint16Array = Uint16Array.of(7, 8, 3, 5, 1);
      source.sort((left: number, right: number): int => {
        const leftBits: int = (left.toInt() & 1) + ((left.toInt() >> 1) & 1) + ((left.toInt() >> 2) & 1) + ((left.toInt() >> 3) & 1);
        const rightBits: int = (right.toInt() & 1) + ((right.toInt() >> 1) & 1) + ((right.toInt() >> 2) & 1) + ((right.toInt() >> 3) & 1);
        return leftBits !== rightBits ? leftBits - rightBits : left.toInt() - right.toInt();
      });
      expect(source.join(',')).assertEqual('1,8,3,5,7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_7900
     * @tc.name testUint16ArraySortPart1079
     * @tc.desc Verify sort comparator orders mirrored Uint16 values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Uint16Array = Uint16Array.of(0, 1, 32768, 65534, 65535);
      source.sort((left: number, right: number): int => (65535 - left.toInt()) - (65535 - right.toInt()));
      expect(source.join(',')).assertEqual('65535,65534,32768,1,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART1_8000
     * @tc.name testUint16ArraySortPart1080
     * @tc.desc Verify sort comparator preserves equal-key order while sorting groups
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart1080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Uint16Array = Uint16Array.of(12, 14, 21, 23, 16);
      source.sort((left: number, right: number): int => left.toInt() / 10 - right.toInt() / 10);
      expect(source.join(',')).assertEqual('12,14,16,21,23');
    });

  });
}
