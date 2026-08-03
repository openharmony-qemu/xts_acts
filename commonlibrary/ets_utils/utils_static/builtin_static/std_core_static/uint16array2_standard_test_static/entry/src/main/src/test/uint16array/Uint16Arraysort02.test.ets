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

export default function uint16ArraySortPart2Test(): void {
  describe('Uint16ArraySortPart2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_0100
     * @tc.name testUint16ArraySortPart2001
     * @tc.desc Verify sort() ascending sorts [65535,0] to [0,65535]
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(65535, 0);
      let result: Uint16Array = arr.sort();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_0200
     * @tc.name testUint16ArraySortPart2002
     * @tc.desc Verify sort() compareFn orders values in descending order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(3, 1, 2);
      let result: Uint16Array = arr.sort((a: number, b: number): int => a < b ? 1 : (a > b ? -1 : 0));
      expect(result[0]).assertEqual(3);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_0300
     * @tc.name testUint16ArraySortPart2003
     * @tc.desc Verify sort() on single element [32768] preserves value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(32768);
      let result: Uint16Array = arr.sort();
      expect(result[0]).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_0400
     * @tc.name testUint16ArraySortPart2004
     * @tc.desc Verify sort() on duplicates [5,5,5] preserves all values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(5, 5, 5);
      let result: Uint16Array = arr.sort();
      expect(result[0]).assertEqual(5);
      expect(result[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_0500
     * @tc.name testUint16ArraySortPart2005
     * @tc.desc Verify sort() returns the same array reference (=== arr)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(3, 1, 2);
      let result: Uint16Array = arr.sort();
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_0600
     * @tc.name testUint16ArraySortPart2006
      * @tc.desc Verify an ascending comparator returns the receiver reference
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(3, 1, 2);
      let result: Uint16Array = arr.sort((a: number, b: number): int => a < b ? -1 : (a > b ? 1 : 0));
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_0700
     * @tc.name testUint16ArraySortPart2007
     * @tc.desc Verify sort() on empty array returns same reference (=== arr)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array();
      let result: Uint16Array = arr.sort();
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_0800
     * @tc.name testUint16ArraySortPart2008
     * @tc.desc Verify sort() on single element [100] returns same reference (=== arr)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(100);
      let result: Uint16Array = arr.sort();
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_0900
     * @tc.name testUint16ArraySortPart2009
     * @tc.desc Verify sort() on duplicates [0,0,0] returns same reference (=== arr)
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(0, 0, 0);
      let result: Uint16Array = arr.sort();
      expect(result).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_1000
     * @tc.name testUint16ArraySortPart2010
      * @tc.desc Verify chaining join after default sort reports ascending content
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(3, 1, 2);
      let joined: string = arr.sort().join(',');
      expect(joined).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_1100
     * @tc.name testUint16ArraySortPart2011
      * @tc.desc Verify chaining join after comparator sort reports descending content
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
      let joined: string = arr.sort((a: number, b: number): int => a < b ? 1 : (a > b ? -1 : 0)).join(',');
      expect(joined).assertEqual('3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_1200
     * @tc.name testUint16ArraySortPart2012
      * @tc.desc Verify default sort retains three identical values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(5, 5, 5);
      arr.sort();
      expect(arr.join(',')).assertEqual('5,5,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_1300
     * @tc.name testUint16ArraySortPart2013
      * @tc.desc Verify default sort retains an already ascending five-value sequence
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3, 4, 5);
      arr.sort();
      expect(arr.join(',')).assertEqual('1,2,3,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_1400
     * @tc.name testUint16ArraySortPart2014
      * @tc.desc Verify default sort reverses a descending five-value sequence
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(5, 4, 3, 2, 1);
      arr.sort();
      expect(arr.join(',')).assertEqual('1,2,3,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_1500
     * @tc.name testUint16ArraySortPart2015
      * @tc.desc Verify default sort retains four zero values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(0, 0, 0, 0);
      arr.sort();
      expect(arr.join(',')).assertEqual('0,0,0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_1600
     * @tc.name testUint16ArraySortPart2016
      * @tc.desc Verify default sort retains an ascending tens sequence
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
      arr.sort();
      expect(arr.join(',')).assertEqual('10,20,30,40,50');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_1700
     * @tc.name testUint16ArraySortPart2017
      * @tc.desc Verify default sort retains grouped duplicate values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 1, 2, 2);
      arr.sort();
      expect(arr.join(',')).assertEqual('1,1,2,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_1800
     * @tc.name testUint16ArraySortPart2018
      * @tc.desc Verify default sort retains an ascending hundreds sequence
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(100, 200, 300);
      arr.sort();
      expect(arr.join(',')).assertEqual('100,200,300');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_1900
     * @tc.name testUint16ArraySortPart2019
      * @tc.desc Verify default sort merges interleaved odd and even values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 3, 5, 2, 4, 6);
      arr.sort();
      expect(arr.join(',')).assertEqual('1,2,3,4,5,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_2000
     * @tc.name testUint16ArraySortPart2020
      * @tc.desc Verify default sort retains ascending values near both Uint16 bounds
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(0, 1, 65534, 65535);
      arr.sort();
      expect(arr.join(',')).assertEqual('0,1,65534,65535');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_2100
     * @tc.name testUint16ArraySortPart2021
      * @tc.desc Verify default sort orders descending extreme boundary values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(65535, 65534, 1, 0);
      arr.sort();
      expect(arr.join(',')).assertEqual('0,1,65534,65535');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_2200
     * @tc.name testUint16ArraySortPart2022
      * @tc.desc Verify default sort retains repeated midpoint values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(32768, 32768, 32768);
      arr.sort();
      expect(arr.join(',')).assertEqual('32768,32768,32768');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_2300
     * @tc.name testUint16ArraySortPart2023
      * @tc.desc Verify an ascending comparator orders a three-value permutation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(3, 1, 2);
      arr.sort((a: number, b: number): int => a < b ? -1 : (a > b ? 1 : 0));
      expect(arr.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_2400
     * @tc.name testUint16ArraySortPart2024
      * @tc.desc Verify a descending comparator reverses an ascending triplet
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
      arr.sort((a: number, b: number): int => a < b ? 1 : (a > b ? -1 : 0));
      expect(arr.join(',')).assertEqual('3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_2500
     * @tc.name testUint16ArraySortPart2025
      * @tc.desc Verify an always-negative comparator produces its expected permutation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(3, 1, 2);
      arr.sort((a: number, b: number): int => -1);
      expect(arr.join(',')).assertEqual('2,1,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_2600
     * @tc.name testUint16ArraySortPart2026
      * @tc.desc Verify an ascending comparator orders an irregular four-value sequence
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(5, 3, 8, 1);
      arr.sort((a: number, b: number): int => a < b ? -1 : (a > b ? 1 : 0));
      expect(arr.join(',')).assertEqual('1,3,5,8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_2700
     * @tc.name testUint16ArraySortPart2027
      * @tc.desc Verify an ascending comparator orders a maximum-to-minimum boundary pair
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(65535, 0);
      arr.sort((a: number, b: number): int => a < b ? -1 : (a > b ? 1 : 0));
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_2800
     * @tc.name testUint16ArraySortPart2028
      * @tc.desc Verify a descending comparator orders a minimum-to-maximum boundary pair
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(0, 65535);
      arr.sort((a: number, b: number): int => a < b ? 1 : (a > b ? -1 : 0));
      expect(arr[0]).assertEqual(65535);
      expect(arr[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_2900
     * @tc.name testUint16ArraySortPart2029
      * @tc.desc Verify an ascending comparator groups duplicate tens values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(10, 10, 5, 5);
      arr.sort((a: number, b: number): int => a < b ? -1 : (a > b ? 1 : 0));
      expect(arr.join(',')).assertEqual('5,5,10,10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_3000
     * @tc.name testUint16ArraySortPart2030
      * @tc.desc Verify an ascending comparator orders the Uint16 boundary triplet
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(32768, 0, 65535);
      arr.sort((a: number, b: number): int => a < b ? -1 : (a > b ? 1 : 0));
      expect(arr.join(',')).assertEqual('0,32768,65535');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_3100
     * @tc.name testUint16ArraySortPart2031
      * @tc.desc Verify a three-way descending comparator reverses an ascending triplet
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
      arr.sort((a: number, b: number): int => (a < b ? 1 : (a > b ? -1 : 0)));
      expect(arr.join(',')).assertEqual('3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_3200
     * @tc.name testUint16ArraySortPart2032
      * @tc.desc Verify an ascending comparator orders a four-value hundreds sequence
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(100, 50, 150, 200);
      arr.sort((a: number, b: number): int => a < b ? -1 : (a > b ? 1 : 0));
      expect(arr.join(',')).assertEqual('50,100,150,200');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_3300
     * @tc.name testUint16ArraySortPart2033
      * @tc.desc Verify an ascending comparator retains an already sorted sequence
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(0, 1, 2, 3);
      arr.sort((a: number, b: number): int => a < b ? -1 : (a > b ? 1 : 0));
      expect(arr.join(',')).assertEqual('0,1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_3400
     * @tc.name testUint16ArraySortPart2034
      * @tc.desc Verify infinite comparator signs still order values ascending
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(3, 1, 2);
      arr.sort((a: number, b: number): int => (a > b ? Number.POSITIVE_INFINITY : (a < b ? -Number.POSITIVE_INFINITY : 0)).toInt());
      expect(arr.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_3500
     * @tc.name testUint16ArraySortPart2035
      * @tc.desc Verify large finite comparator signs order values ascending
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(3, 1, 2);
      arr.sort((a: number, b: number): int => (a > b ? 65535 : (a < b ? -65535 : 0)));
      expect(arr.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_3600
     * @tc.name testUint16ArraySortPart2036
      * @tc.desc Verify unit comparator signs order values ascending
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(3, 1, 2);
      arr.sort((a: number, b: number): int => (a > b ? 1 : (a < b ? -1 : 0)));
      expect(arr.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_3700
     * @tc.name testUint16ArraySortPart2037
      * @tc.desc Verify maximum-number comparator signs order values ascending
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(3, 1, 2);
      arr.sort((a: number, b: number): int => (a > b ? Number.MAX_VALUE : (a < b ? -Number.MAX_VALUE : 0)).toInt());
      expect(arr.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_3800
     * @tc.name testUint16ArraySortPart2038
      * @tc.desc Verify negative zero comparator results preserve source order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(3, 1, 2);
      arr.sort((a: number, b: number): int => {
        if (a < b) return -0;
        if (a > b) return 0;
        return 0;
      });
      expect(arr.join(',')).assertEqual('3,1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_3900
     * @tc.name testUint16ArraySortPart2039
      * @tc.desc Verify default sorting three values returns ascending content
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(3, 1, 2);
      let result: Uint16Array = arr.sort();
      expect(result.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_4000
     * @tc.name testUint16ArraySortPart2040
      * @tc.desc Verify comparator sorting three values returns descending content
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(3, 1, 2);
      let result: Uint16Array = arr.sort((a: number, b: number): int => a < b ? 1 : (a > b ? -1 : 0));
      expect(result.join(',')).assertEqual('3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_4100
     * @tc.name testUint16ArraySortPart2041
      * @tc.desc Verify default sorting a single value preserves it
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(99);
      let result: Uint16Array = arr.sort();
      expect(result[0]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_4200
     * @tc.name testUint16ArraySortPart2042
     * @tc.desc Verify sort orders one hundred descending elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(100);
      for (let i: int = 0; i < 100; i++) {
        arr[i] = 100 - i;
      }
      let result: Uint16Array = arr.sort();
      expect(result[0]).assertEqual(1);
      expect(result[99]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_4300
     * @tc.name testUint16ArraySortPart2043
      * @tc.desc Verify default sorting a boundary pair orders both values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(65535, 0);
      let result: Uint16Array = arr.sort();
      expect(result.join(',')).assertEqual('0,65535');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_4400
     * @tc.name testUint16ArraySortPart2044
      * @tc.desc Verify default sorting preserves byte length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(3, 1, 2);
      let before: int = arr.byteLength;
      arr.sort();
      expect(arr.byteLength).assertEqual(before);
      expect(arr.join(',')).assertEqual('1,2,3');

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_4500
     * @tc.name testUint16ArraySortPart2045
      * @tc.desc Verify comparator sorting preserves byte length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(3, 1, 2);
      let before: int = arr.byteLength;
      arr.sort((a: number, b: number): int => a < b ? -1 : (a > b ? 1 : 0));
      expect(arr.byteLength).assertEqual(before);
      expect(arr.join(',')).assertEqual('1,2,3');

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_4600
     * @tc.name testUint16ArraySortPart2046
      * @tc.desc Verify comparator sorting preserves byte offset
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(3, 1, 2);
      let before: int = arr.byteOffset;
      arr.sort((a: number, b: number): int => a < b ? 1 : (a > b ? -1 : 0));
      expect(arr.byteOffset).assertEqual(before);
      expect(arr.join(',')).assertEqual('3,2,1');

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_4700
     * @tc.name testUint16ArraySortPart2047
      * @tc.desc Verify default sorting preserves the backing buffer reference
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(3, 1, 2);
      let before: ArrayBuffer = arr.buffer;
      arr.sort();
      expect(arr.buffer).assertEqual(before);
      expect(arr.join(',')).assertEqual('1,2,3');

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_4800
     * @tc.name testUint16ArraySortPart2048
      * @tc.desc Verify comparator sorting preserves the backing buffer reference
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(3, 1, 2);
      let before: ArrayBuffer = arr.buffer;
      arr.sort((a: number, b: number): int => a < b ? -1 : (a > b ? 1 : 0));
      expect(arr.buffer).assertEqual(before);
      expect(arr.join(',')).assertEqual('1,2,3');

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_4900
     * @tc.name testUint16ArraySortPart2049
      * @tc.desc Verify default sorting preserves Uint16 element width metadata
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(3, 1, 2);
      arr.sort();
      expect(Uint16Array.BYTES_PER_ELEMENT).assertEqual(2);
      expect(arr.join(',')).assertEqual('1,2,3');

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_5000
     * @tc.name testUint16ArraySortPart2050
      * @tc.desc Verify comparator sorting preserves Uint16 element width metadata
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(3, 1, 2);
      arr.sort((a: number, b: number): int => a < b ? -1 : (a > b ? 1 : 0));
      expect(Uint16Array.BYTES_PER_ELEMENT).assertEqual(2);
      expect(arr.join(',')).assertEqual('1,2,3');

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_5100
     * @tc.name testUint16ArraySortPart2051
      * @tc.desc Verify default sorting preserves the Uint16Array type name
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(3, 1, 2);
      arr.sort();
      expect(arr.name).assertEqual('Uint16Array');
      expect(arr.join(',')).assertEqual('1,2,3');

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_5200
     * @tc.name testUint16ArraySortPart2052
      * @tc.desc Verify comparator sorting preserves the Uint16Array type name
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(3, 1, 2);
      arr.sort((a: number, b: number): int => a < b ? 1 : (a > b ? -1 : 0));
      expect(arr.name).assertEqual('Uint16Array');
      expect(arr.join(',')).assertEqual('3,2,1');

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_5300
     * @tc.name testUint16ArraySortPart2053
      * @tc.desc Verify default sorting retains the expected byte-length-to-element-width relation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(3, 1, 2);
      arr.sort();
      expect(arr.byteLength).assertEqual(arr.length * Uint16Array.BYTES_PER_ELEMENT);
      expect(arr.join(',')).assertEqual('1,2,3');

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_5400
     * @tc.name testUint16ArraySortPart2054
     * @tc.desc Verify sort on a buffer-backed array preserves its buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let arr: Uint16Array = new Uint16Array(buf);
      arr[0] = 3;
      arr[1] = 1;
      arr[2] = 2;
      let before: ArrayBuffer = arr.buffer;
      arr.sort();
      expect(arr.buffer).assertEqual(before);
      expect(arr.join(',')).assertEqual('1,2,3');

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_5500
     * @tc.name testUint16ArraySortPart2055
     * @tc.desc Verify sort on a buffer-backed array preserves byteOffset
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let arr: Uint16Array = new Uint16Array(buf);
      arr[0] = 3;
      arr[1] = 1;
      arr[2] = 2;
      let before: int = arr.byteOffset;
      arr.sort();
      expect(arr.byteOffset).assertEqual(before);
      expect(arr.join(',')).assertEqual('1,2,3');

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_5600
     * @tc.name testUint16ArraySortPart2056
     * @tc.desc Verify sorting a subarray preserves the shared buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(3, 1, 2);
      let sub: Uint16Array = arr.subarray(0);
      sub.sort();
      expect(sub.buffer).assertEqual(arr.buffer);
      expect(sub.join(',')).assertEqual('1,2,3');

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_5700
     * @tc.name testUint16ArraySortPart2057
      * @tc.desc Verify default sorting preserves backing buffer byte length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(3, 1, 2);
      let before: int = arr.buffer.byteLength;
      let result: Uint16Array = arr.sort();
      expect(result.buffer.byteLength).assertEqual(before);
      expect(arr.join(',')).assertEqual('1,2,3');

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_5800
     * @tc.name testUint16ArraySortPart2058
      * @tc.desc Verify sort propagates a comparator-thrown Error
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(3, 1, 2);
      try {
        arr.sort((a: number, b: number): int => {
          throw new Error('sort error');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_5900
     * @tc.name testUint16ArraySortPart2059
      * @tc.desc Verify a comparator Error leaves the source order unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(3, 1, 2);
      let before: string = arr.join(',');
      try {
        arr.sort((a: number, b: number): int => {
          throw new Error('stop');
        });
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(arr.join(',')).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_6000
     * @tc.name testUint16ArraySortPart2060
      * @tc.desc Verify a reusable ascending comparator orders values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cmpAsc = (a: number, b: number): int => (a - b).toInt();
      let arr: Uint16Array = Uint16Array.of(3, 1, 2);
      arr.sort(cmpAsc);
      expect(arr.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_6100
     * @tc.name testUint16ArraySortPart2061
      * @tc.desc Verify a reusable descending comparator orders values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cmpDesc = (a: number, b: number): int => (b - a).toInt();
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
      arr.sort(cmpDesc);
      expect(arr.join(',')).assertEqual('3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_6200
     * @tc.name testUint16ArraySortPart2062
      * @tc.desc Verify default sort preserves a single zero value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(0);
      arr.sort();
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_6300
     * @tc.name testUint16ArraySortPart2063
      * @tc.desc Verify default sort preserves a single maximum Uint16 value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(65535);
      arr.sort();
      expect(arr[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_6400
     * @tc.name testUint16ArraySortPart2064
      * @tc.desc Verify default sort preserves a single midpoint Uint16 value
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(32768);
      arr.sort();
      expect(arr[0]).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_6500
     * @tc.name testUint16ArraySortPart2065
      * @tc.desc Verify default sort retains the maximum value in a boundary pair
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(0, 65535);
      arr.sort();
      expect(arr[1]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_6600
     * @tc.name testUint16ArraySortPart2066
      * @tc.desc Verify default sort moves zero to the front of a boundary pair
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(65535, 0);
      arr.sort();
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_6700
     * @tc.name testUint16ArraySortPart2067
       * @tc.desc Verify default sort orders zero before 32768
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(32768, 0);
      arr.sort();
      expect(arr[1]).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_6800
     * @tc.name testUint16ArraySortPart2068
      * @tc.desc Verify sorting preserves fractional maximum-value truncation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(1);
      arr[0] = 65535.9;
      arr.sort();
      expect(arr[0]).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_6900
     * @tc.name testUint16ArraySortPart2069
      * @tc.desc Verify sorting preserves fractional input truncation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array(1);
      arr[0] = 3.14;
      arr.sort();
      expect(arr[0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_7000
     * @tc.name testUint16ArraySortPart2070
      * @tc.desc Verify default sort orders minimum midpoint and maximum values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(65535, 0, 32768);
      arr.sort();
      expect(arr[0]).assertEqual(0);
      expect(arr[0] & 0xFFFF).assertEqual(0);
      expect(arr.join(',')).assertEqual('0,32768,65535');

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_7100
     * @tc.name testUint16ArraySortPart2071
      * @tc.desc Verify default sort returns the receiver with ascending content
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(3, 1, 2);
      let result: Uint16Array = arr.sort();
      expect(result).assertEqual(arr);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_7200
     * @tc.name testUint16ArraySortPart2072
      * @tc.desc Verify default sort preserves receiver length and byte length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(3, 1, 2);
      let result: Uint16Array = arr.sort();
      expect(result.length).assertEqual(3);
      expect(result.byteLength).assertEqual(6);
      expect(arr.join(',')).assertEqual('1,2,3');

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_7300
     * @tc.name testUint16ArraySortPart2073
      * @tc.desc Verify default sort preserves backing buffer byte length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(3, 1, 2);
      let before: int = arr.buffer.byteLength;
      arr.sort();
      expect(arr.buffer.byteLength).assertEqual(before);
      expect(arr.join(',')).assertEqual('1,2,3');

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_7400
     * @tc.name testUint16ArraySortPart2074
      * @tc.desc Verify toString reports default-sorted content
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(3, 1, 2);
      arr.sort();
      expect(arr.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_7500
     * @tc.name testUint16ArraySortPart2075
      * @tc.desc Verify toString reports comparator-sorted descending content
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
      arr.sort((a: number, b: number): int => a < b ? 1 : (a > b ? -1 : 0));
      expect(arr.toString()).assertEqual('3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_7600
     * @tc.name testUint16ArraySortPart2076
      * @tc.desc Verify forEach consumes all values after default sorting
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(3, 1, 2);
      let sum: number = 0;
      arr.sort().forEach((val: number): void => {
        sum += val;
      });
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_7700
     * @tc.name testUint16ArraySortPart2077
      * @tc.desc Verify map receives values in default-sorted order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(3, 1, 2);
      let mapped: Uint16Array = arr.sort().map((val: number): number => val * 2);
      expect(mapped.join(',')).assertEqual('2,4,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_7800
     * @tc.name testUint16ArraySortPart2078
      * @tc.desc Verify an empty array remains empty after sorting
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = new Uint16Array();
      arr.sort();
      expect(arr.toString()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_7900
     * @tc.name testUint16ArraySortPart2079
      * @tc.desc Verify the comparator is invoked during sorting
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let counter: int = 0;
      let arr: Uint16Array = Uint16Array.of(3, 1, 2);
      arr.sort((a: number, b: number): int => {
        counter++;
        return (a - b).toInt();
      });
      expect(arr.join(',')).assertEqual('1,2,3');
      expect(counter > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_8000
     * @tc.name testUint16ArraySortPart2080
      * @tc.desc Verify indexOf reports ascending positions after sorting
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(3, 1, 2);
      arr.sort();
      expect(arr.indexOf(1)).assertEqual(0);
      expect(arr.indexOf(2)).assertEqual(1);
      expect(arr.indexOf(3)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_8100
     * @tc.name testUint16ArraySortPart2081
       * @tc.desc Verify a descending comparator orders values from largest to smallest
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(0, 10000, 20000, 30000, 40000, 50000, 60000, 65535);
      arr.sort((a: number, b: number): int => a < b ? 1 : (a > b ? -1 : 0));
      expect(arr[0]).assertEqual(65535);
      expect(arr[7]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_8200
     * @tc.name testUint16ArraySortPart2082
      * @tc.desc Verify a comparator orders a two-element array descending
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(100, 200);
      arr.sort((a: number, b: number): int => a < b ? 1 : (a > b ? -1 : 0));
      expect(arr[0]).assertEqual(200);
      expect(arr[1]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_8300
     * @tc.name testUint16ArraySortPart2083
      * @tc.desc Verify chained default and descending sorts return descending content
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(3, 1, 2);
      let result: Uint16Array = arr.sort().sort((a: number, b: number): int => a < b ? 1 : (a > b ? -1 : 0));
      expect(result[0]).assertEqual(3);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(1);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_SORT_PART2_8400
     * @tc.name testUint16ArraySortPart2084
      * @tc.desc Verify default sort preserves the backing buffer size
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testUint16ArraySortPart2084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Uint16Array = Uint16Array.of(3, 1, 2);
      arr.sort();
      expect(arr.join(',')).assertEqual('1,2,3');
      expect(arr.buffer.byteLength).assertEqual(6);
    });

  });
}
