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

import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../Util.test';
import { compareNumbersAscending } from './ArraySortTest.test';

class Item037 {
  value: number = 0;
}

class Item043 {
  value: number = 0;
  id: number = 0;
}

class ToSortedStableItem {
  key: number = 0;
  id: number = 0;
}

class ToSortedDefaultItem {
  label: string = '';

  toString(): string {
    return this.label;
  }
}

function compareNumbersDescending(a: number, b: number): int {
  if (a > b) {
    return -1;
  }
  if (a < b) {
    return 1;
  }
  return 0;
}

function createDescendingRange(size: int): Array<number> {
  const arr = new Array<number>();
  for (let i: int = size; i >= 1; i--) {
    arr.pushOne(i);
  }
  return arr;
}

function createPseudoRandomNumbers(size: int, modulo: int): Array<number> {
  const arr = new Array<number>();
  for (let i: int = 0; i < size; i++) {
    arr.pushOne(Math.floor(Math.random() * modulo));
  }
  return arr;
}

function getSortedCopy<T>(arr: Array<T>): Array<T> {
  return arr.toSorted();
}

function isNegativeZeroToSorted(value: number): boolean {
  return value === 0 && 1 / value === -Double.POSITIVE_INFINITY;
}

export default function ArrayToSorted1Test(): void {
  describe('ArrayToSorted1Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_0100
     * @tc.name testArrayToSortedOne001
     * @tc.desc Verify toSorted can be called without any parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 1, 2);
      const result = arr.toSorted();
      expect(result.toString()).assertEqual('1,2,3');
      expect(arr.toString()).assertEqual('3,1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_0200
     * @tc.name testArrayToSortedOne002
     * @tc.desc Verify the no-argument overload can be invoked directly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5, 2, 8);
      const result = arr.toSorted();
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_0300
     * @tc.name testArrayToSortedOne003
     * @tc.desc Verify toSorted returns a new Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 1, 2);
      const result = arr.toSorted();
      expect(Array.isArray(result)).assertTrue();
      expect(result !== arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_0400
     * @tc.name testArrayToSortedOne004
     * @tc.desc Verify toSorted does not modify the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 1, 2);
      const originalStr = arr.toString();
      arr.toSorted();
      expect(arr.toString()).assertEqual(originalStr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_0500
     * @tc.name testArrayToSortedOne005
     * @tc.desc Verify toSorted returns a sorted copy of the array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5, 2, 8, 1);
      const result = arr.toSorted();
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(5);
      expect(result[3]).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_0600
     * @tc.name testArrayToSortedOne006
     * @tc.desc Verify toSorted uses the default sorting rule without a comparator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      const result = arr.toSorted();
      expect(result.toString()).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_0700
     * @tc.name testArrayToSortedOne007
     * @tc.desc Verify toSorted returns an empty array for empty input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      const result = arr.toSorted();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_0800
     * @tc.name testArrayToSortedOne008
     * @tc.desc Verify toSorted keeps a single-element array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 42);
      const result = arr.toSorted();
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_0900
     * @tc.name testArrayToSortedOne009
     * @tc.desc Verify toSorted orders a two-element array correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 1);
      const result = arr.toSorted();
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_1000
     * @tc.name testArrayToSortedOne010
     * @tc.desc Verify toSorted keeps an already sorted array in ascending order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const result = arr.toSorted();
      expect(result.toString()).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_1100
     * @tc.name testArrayToSortedOne011
     * @tc.desc Verify toSorted sorts a reverse-ordered numeric array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(4, 3, 2, 1);
      const result = arr.toSorted();
      expect(result.toString()).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_1200
     * @tc.name testArrayToSortedOne012
     * @tc.desc Verify toSorted preserves duplicate values in the sorted copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 1, 2, 1);
      const result = arr.toSorted();
      expect(result.toString()).assertEqual('1,1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_1300
     * @tc.name testArrayToSortedOne013
     * @tc.desc Verify numeric arrays use ascending order by default
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 1, 4, 1, 5);
      const result = arr.toSorted();
      expect(result.toString()).assertEqual('1,1,3,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_1400
     * @tc.name testArrayToSortedOne014
     * @tc.desc Verify string arrays sort in alphabetical order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('c', 'a', 'b');
      const result = arr.toSorted();
      expect(result.toString()).assertEqual('a,b,c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_1500
     * @tc.name testArrayToSortedOne015
     * @tc.desc Verify boolean arrays sort with false values before true values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, false, true);
      const result = arr.toSorted();
      expect(result.toString()).assertEqual('false,true,true');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_1600
     * @tc.name testArrayToSortedOne016
     * @tc.desc Verify large numeric values are ordered by the default rule
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1000, 100, 10000);
      const result = arr.toSorted();
      expect(result.toString()).assertEqual('100,1000,10000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_1700
     * @tc.name testArrayToSortedOne017
     * @tc.desc Verify arrays containing negative values can be sorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, -1, 0, -2);
      const result = arr.toSorted(compareNumbersAscending);
      expect(result.toString()).assertEqual('-2,-1,0,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_1800
     * @tc.name testArrayToSortedOne018
     * @tc.desc Verify floating-point numbers are ordered in ascending order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3.14, 1.41, 2.71);
      const result = arr.toSorted();
      expect(result.toString()).assertEqual('1.41,2.71,3.14');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_1900
     * @tc.name testArrayToSortedOne019
     * @tc.desc Verify toSorted leaves all original array properties unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 1, 2);
      const originalLength = arr.length;
      const originalFirst = arr[0];
      const originalLast = arr[arr.length - 1];
      arr.toSorted();
      expect(arr.length).assertEqual(originalLength);
      expect(arr[0]).assertEqual(originalFirst);
      expect(arr[arr.length - 1]).assertEqual(originalLast);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_2000
     * @tc.name testArrayToSortedOne020
     * @tc.desc Verify mutating the returned array does not affect the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 1, 2);
      const result = arr.toSorted();
      result[0] = 999;
      expect(arr[0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_2100
     * @tc.name testArrayToSortedOne021
     * @tc.desc Verify repeated toSorted calls return independent array instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 1, 2);
      const result1 = arr.toSorted();
      const result2 = arr.toSorted();
      expect(result1 !== result2).assertTrue();
      expect(result1.toString()).assertEqual(result2.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_2200
     * @tc.name testArrayToSortedOne022
     * @tc.desc Verify toSorted can be used to obtain a sorted copy for display
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original = new Array<number>(3, 1, 4, 1, 5);
      const sorted = original.toSorted();
      expect(sorted.toString()).assertEqual('1,1,3,4,5');
      expect(original.toString()).assertEqual('3,1,4,1,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_2300
     * @tc.name testArrayToSortedOne023
     * @tc.desc Verify the original array keeps its initial element order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5, 2, 8);
      const sorted = arr.toSorted();
      expect(sorted.length).assertEqual(3);
      expect(arr[0]).assertEqual(5);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_2400
     * @tc.name testArrayToSortedOne024
     * @tc.desc Verify array operations can be chained after toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 1, 2);
      const result = arr.toSorted().map((v: number): number => v * 2);
      expect(result.toString()).assertEqual('2,4,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_2500
     * @tc.name testArrayToSortedOne025
     * @tc.desc Verify toSorted can be used inside a generic helper function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 1, 2);
      const sorted = getSortedCopy(arr);
      expect(sorted.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_2600
     * @tc.name testArrayToSortedOne026
     * @tc.desc Verify toSorted differs from sort because sort mutates the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<number>(3, 1, 2);
      const arr2 = new Array<number>(3, 1, 2);
      const toSortedResult = arr1.toSorted();
      arr2.sort();
      expect(arr1.toString()).assertEqual('3,1,2');
      expect(arr2.toString()).assertEqual('1,2,3');
      expect(toSortedResult.toString()).assertEqual(arr2.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_2700
     * @tc.name testArrayToSortedOne027
     * @tc.desc Verify sort returns the same array while toSorted returns a new one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 1, 2);
      const sortResult = arr.sort();
      expect(sortResult === arr).assertTrue();

      const arr2 = new Array<number>(3, 1, 2);
      const toSortedResult = arr2.toSorted();
      expect(toSortedResult !== arr2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_2800
     * @tc.name testArrayToSortedOne028
     * @tc.desc Verify toSorted is suitable when the original array must be preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original = new Array<number>(3, 1, 2);
      const sortedCopy = original.toSorted();
      expect(original.toString()).assertEqual('3,1,2');

      const arr = new Array<number>(3, 1, 2);
      arr.sort();
      expect(arr.toString()).assertEqual('1,2,3');
      expect(sortedCopy.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_2900
     * @tc.name testArrayToSortedOne029
     * @tc.desc Verify numeric values sort in ascending order with an explicit comparator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 2, 100, 1);
      const result = arr.toSorted(compareNumbersAscending);
      expect(result.toString()).assertEqual('1,2,10,100');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_3000
     * @tc.name testArrayToSortedOne030
     * @tc.desc Verify strings sort in alphabetical order by default
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('zebra', 'apple', 'banana');
      const result = arr.toSorted();
      expect(result.toString()).assertEqual('apple,banana,zebra');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_3100
     * @tc.name testArrayToSortedOne031
     * @tc.desc Verify default string sorting is case-sensitive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('Z', 'a', 'A', 'z');
      const result = arr.toSorted();
      expect(result.toString()).assertEqual('A,Z,a,z');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_3200
     * @tc.name testArrayToSortedOne032
     * @tc.desc Verify a large descending array can be sorted into ascending order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = createDescendingRange(1000);
      const result = arr.toSorted(compareNumbersAscending);
      expect(result[0]).assertEqual(1);
      expect(result[999]).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_3300
     * @tc.name testArrayToSortedOne033
     * @tc.desc Verify toSorted allocates a new array instead of reusing the original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 1, 2);
      const original = arr;
      const result = arr.toSorted();
      expect(result !== original).assertTrue();
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_3400
     * @tc.name testArrayToSortedOne034
     * @tc.desc Verify toSorted produces a sorted result for a pseudo-random dataset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = createPseudoRandomNumbers(100, 1000);
      const result = arr.toSorted();
      expect(result.length).assertEqual(100);
      expect(result.toString()).assertEqual(arr.sort().toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_3500
     * @tc.name testArrayToSortedOne035
     * @tc.desc Verify the returned array preserves the generic element type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 1, 2);
      const result: Array<number> = arr.toSorted();
      expect(typeof result[0]).assertEqual('number');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_3600
     * @tc.name testArrayToSortedOne036
     * @tc.desc Verify different generic element types can each use toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<number>(3, 1, 2);
      const r1 = arr1.toSorted();
      expect(r1.toString()).assertEqual('1,2,3');

      const arr2 = new Array<string>('c', 'a', 'b');
      const r2 = arr2.toSorted();
      expect(r2.toString()).assertEqual('a,b,c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_3700
     * @tc.name testArrayToSortedOne037
     * @tc.desc Verify object arrays can still return a new array with the same references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const item1 = new Item037();
      item1.value = 3;
      const item2 = new Item037();
      item2.value = 1;
      const item3 = new Item037();
      item3.value = 2;
      const arr = new Array<Item037>(item1, item2, item3);
      const result = arr.toSorted();
      expect(result.length).assertEqual(3);
      expect(result.includes(item1)).assertTrue();
      expect(result.includes(item2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_3800
     * @tc.name testArrayToSortedOne038
     * @tc.desc Verify toSorted can be combined with map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 1, 2);
      const result = arr.toSorted().map((v: number): number => v * 10);
      expect(result.toString()).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_3900
     * @tc.name testArrayToSortedOne039
     * @tc.desc Verify filtered results can be sorted with toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5, 2, 8, 1, 9);
      const filtered = arr.filter((v: number): boolean => v > 2);
      const result = filtered.toSorted();
      expect(result.toString()).assertEqual('5,8,9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_4000
     * @tc.name testArrayToSortedOne040
     * @tc.desc Verify sliced arrays can be sorted with toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5, 2, 8, 1, 9);
      const sliced = arr.slice(0, 3);
      const result = sliced.toSorted();
      expect(result.toString()).assertEqual('2,5,8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_4100
     * @tc.name testArrayToSortedOne041
     * @tc.desc Verify toSorted participates in chained array method pipelines
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5, 2, 8, 1, 9, 3);
      const result = arr
        .filter((v: number): boolean => v > 1)
        .toSorted()
        .slice(0, 3);
      expect(result.toString()).assertEqual('2,3,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_4200
     * @tc.name testArrayToSortedOne042
     * @tc.desc Verify arrays of identical values remain unchanged after sorting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 1, 1);
      const result = arr.toSorted();
      expect(result.toString()).assertEqual('1,1,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_4300
     * @tc.name testArrayToSortedOne043
     * @tc.desc Verify equal object references keep their relative order after sorting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const item1 = new Item043();
      item1.value = 1;
      item1.id = 1;
      const item2 = new Item043();
      item2.value = 1;
      item2.id = 2;
      const arr = new Array<Item043>(item1, item2);
      const result = arr.toSorted();
      expect(result.length).assertEqual(2);
      expect(result[0] === item1).assertTrue();
      expect(result[1] === item2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_4400
     * @tc.name testArrayToSortedOne044
     * @tc.desc Verify arrays containing zero values can be sorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5, 0, -5);
      const result = arr.toSorted();
      expect(result.toString()).assertEqual('-5,0,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_4500
     * @tc.name testArrayToSortedOne045
     * @tc.desc Verify arrays containing extreme numeric values can be sorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(Number.MAX_VALUE, 0, Number.MIN_VALUE);
      const result = arr.toSorted();
      expect(result.length).assertEqual(3);
      expect(result.includes(Number.MAX_VALUE)).assertTrue();
      expect(result.includes(Number.MIN_VALUE)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_4600
     * @tc.name testArrayToSortedOne046
     * @tc.desc Verify long strings can be sorted lexicographically
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('zzz', 'aaa', 'mmm');
      const result = arr.toSorted();
      expect(result.toString()).assertEqual('aaa,mmm,zzz');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_4700
     * @tc.name testArrayToSortedOne047
     * @tc.desc Verify strings with special characters can be sorted without errors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('@#', 'abc', '123');
      const result = arr.toSorted();
      expect(result.length).assertEqual(3);
      expect(result.includes('@#')).assertTrue();
      expect(result.includes('abc')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_4800
     * @tc.name testArrayToSortedOne048
     * @tc.desc Verify the no-argument overload differs from the comparator overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 1, 2);
      const r1 = arr.toSorted();

      const arr2 = new Array<number>(3, 1, 2);
      const r2 = arr2.toSorted(compareNumbersDescending);
      expect(r1.toString()).assertEqual('1,2,3');
      expect(r2.toString()).assertEqual('3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_4900
     * @tc.name testArrayToSortedOne049
     * @tc.desc Verify default and custom sorting rules can produce different results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 1, 2);
      const r1 = arr.toSorted();
      expect(r1[0]).assertEqual(1);

      const arr2 = new Array<number>(3, 1, 2);
      const r2 = arr2.toSorted(compareNumbersDescending);
      expect(r2[0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_5000
     * @tc.name testArrayToSortedOne050
     * @tc.desc Verify toSorted can prepare leaderboard data for ranked display
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const scores = new Array<number>(85, 92, 78, 95, 88);
      const ranked = scores.toSorted();
      expect(ranked.toString()).assertEqual('78,85,88,92,95');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_5100
     * @tc.name testArrayToSortedOne051
     * @tc.desc Verify toSorted can prepare numeric data for ordered display
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const prices = new Array<number>(99.99, 49.99, 149.99);
      const sortedPrices = prices.toSorted(compareNumbersAscending);
      expect(sortedPrices.toString()).assertEqual('49.99,99.99,149.99');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_5200
     * @tc.name testArrayToSortedOne052
     * @tc.desc Verify toSorted can prepare data for later binary-search style lookup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5, 3, 1, 4, 2);
      const sorted = arr.toSorted();
      expect(sorted[0]).assertEqual(1);
      expect(sorted[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_5300
     * @tc.name testArrayToSortedOne053
     * @tc.desc Verify sorted data can be used for simple range analysis
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const data = new Array<number>(23, 45, 12, 67, 34);
      const sorted = data.toSorted();
      const min = sorted[0];
      const max = sorted[sorted.length - 1];
      expect(min).assertEqual(12);
      expect(max).assertEqual(67);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_5400
     * @tc.name testArrayToSortedOne054
     * @tc.desc Verify default toSorted orders strings before null and undefined last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string | null | undefined>('b', undefined, null, 'a');
      const result = arr.toSorted();
      expect(result[0]).assertEqual('a');
      expect(result[1]).assertEqual('b');
      expect(result[2]).assertNull();
      expect(result[3]).assertUndefined();
      expect(arr[1]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_5500
     * @tc.name testArrayToSortedOne055
     * @tc.desc Verify default toSorted distinguishes empty strings and spaces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('b', ' ', '', 'a');
      const result = arr.toSorted();
      expect(result[0]).assertEqual('');
      expect(result[1]).assertEqual(' ');
      expect(result[2]).assertEqual('a');
      expect(result[3]).assertEqual('b');
      expect(arr[0]).assertEqual('b');
      expect(arr[1]).assertEqual(' ');
      expect(arr[2]).assertEqual('');
      expect(arr[3]).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_5600
     * @tc.name testArrayToSortedOne056
     * @tc.desc Verify mutating the sorted snapshot does not mutate primitive source values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 10, 1);
      const result = arr.toSorted();
      result[0] = 99;
      expect(result.toString()).assertEqual('99,10,2');
      expect(arr.toString()).assertEqual('2,10,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_5700
     * @tc.name testArrayToSortedOne057
     * @tc.desc Verify object arrays sort by default string projection while keeping references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const later = new ToSortedDefaultItem();
      later.label = 'b';
      const earlier = new ToSortedDefaultItem();
      earlier.label = 'a';
      const arr = new Array<ToSortedDefaultItem>(later, earlier);
      const result = arr.toSorted();
      expect(result[0] === earlier).assertTrue();
      expect(result[1] === later).assertTrue();
      result[0].label = 'z';
      expect(earlier.label).assertEqual('z');
      expect(arr[0] === later).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_5800
     * @tc.name testArrayToSortedOne058
     * @tc.desc Verify nested arrays use default comma-joined string ordering and remain shallow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pair = new Array<number>(2, 1);
      const single = Array.create<number>(1, 1);
      const arr = new Array<Array<number>>(pair, single);
      const result = arr.toSorted();
      expect(result[0] === single).assertTrue();
      expect(result[1] === pair).assertTrue();
      result[1][0] = 9;
      expect(pair[0]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_5900
     * @tc.name testArrayToSortedOne059
     * @tc.desc Verify mixed primitive values use default string ordering
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string | number | boolean>(true, '10', 2, false);
      const result = arr.toSorted();
      expect(result[0]).assertEqual('10');
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(false);
      expect(result[3]).assertEqual(true);
      expect(arr[0]).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_6000
     * @tc.name testArrayToSortedOne060
     * @tc.desc Verify a default sort result is independent from a dense source with undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[0] = 2;
      arr[2] = 1;
      const result = arr.toSorted();
      result[0] = 9;
      expect(result[0]).assertEqual(9);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertUndefined();
      expect(arr[0]).assertEqual(2);
      expect(arr[1]).assertUndefined();
      expect(arr.lastIndexOf(undefined)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_6100
     * @tc.name testArrayToSortedOne061
     * @tc.desc Verify toSorted can order positive numbers in ascending order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 1, 2);
      const result = arr.toSorted();
      expect(result.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_6200
     * @tc.name testArrayToSortedOne062
     * @tc.desc Verify toSorted can order numbers containing duplicates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 1, 3, 2);
      const result = arr.toSorted();
      expect(result.toString()).assertEqual('1,2,3,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_6300
     * @tc.name testArrayToSortedOne063
     * @tc.desc Verify toSorted can order negative values and zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(0, -1, 2, -3);
      const result = arr.toSorted((left: number, right: number): int => {
        if (left < right) {
          return -1;
        }
        if (left > right) {
          return 1;
        }
        return 0;
      });
      expect(result.toString()).assertEqual('-3,-1,0,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_6400
     * @tc.name testArrayToSortedOne064
     * @tc.desc Verify default toSorted orders uppercase strings before lowercase strings and preserves the source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('beta', 'Alpha', 'alpha');
      const result = arr.toSorted();
      expect(result.toString()).assertEqual('Alpha,alpha,beta');
      expect(arr.toString()).assertEqual('beta,Alpha,alpha');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_6500
     * @tc.name testArrayToSortedOne065
     * @tc.desc Verify toSorted can order boolean-like numeric projections
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, false, true).map((value: boolean): number => value ? 1 : 0);
      const result = arr.toSorted((left: number, right: number): int => {
        if (left < right) {
          return -1;
        }
        if (left > right) {
          return 1;
        }
        return 0;
      });
      expect(result.toString()).assertEqual('0,1,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_6600
     * @tc.name testArrayToSortedOne066
     * @tc.desc Verify default toSorted keeps numeric lexicographic ordering for 10 and 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 2);
      const result = arr.toSorted();
      expect(result.toString()).assertEqual('10,2');
      expect(arr.toString()).assertEqual('10,2');
      expect(result !== arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_6700
     * @tc.name testArrayToSortedOne067
     * @tc.desc Verify default toSorted orders NaN and signed zero by string conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(NaN, 1, +0, -0);
      const result = arr.toSorted();
      expect(result[0]).assertEqual(0);
      expect(isNegativeZeroToSorted(result[0])).assertFalse();
      expect(isNegativeZeroToSorted(result[1])).assertTrue();
      expect(result[2]).assertEqual(1);
      expect(Number.isNaN(result[3])).assertTrue();
      expect(Number.isNaN(arr[0])).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_6800
     * @tc.name testArrayToSortedOne068
     * @tc.desc Verify explicit undefined is moved after ordinary values by default sorting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(2, undefined, 1);
      const result = arr.toSorted();
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertUndefined();
      expect(result.lastIndexOf(undefined)).assertEqual(2);
      expect(arr.lastIndexOf(undefined)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_6900
     * @tc.name testArrayToSortedOne069
     * @tc.desc Verify a middle undefined value is moved to the end while the source is preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[0] = 2;
      arr[2] = 1;
      const result = arr.toSorted();
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertUndefined();
      expect(result.lastIndexOf(undefined)).assertEqual(2);
      expect(arr.lastIndexOf(undefined)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_7000
     * @tc.name testArrayToSortedOne070
     * @tc.desc Verify an all-undefined dense array remains undefined after toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      const result = arr.toSorted();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertUndefined();
      expect(result[1]).assertUndefined();
      expect(result[2]).assertUndefined();
      expect(result.lastIndexOf(undefined)).assertEqual(2);
      expect(arr.lastIndexOf(undefined)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_7100
     * @tc.name testArrayToSortedOne071
     * @tc.desc Verify explicit undefined values appear as undefined results after sorting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(2, (_index) => undefined);
      arr[1] = undefined;
      const result = arr.toSorted();
      expect(result[0]).assertUndefined();
      expect(result[1]).assertUndefined();
      expect(result.lastIndexOf(undefined)).assertEqual(1);
      expect(arr.lastIndexOf(undefined)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_7200
     * @tc.name testArrayToSortedOne072
     * @tc.desc Verify a trailing undefined value appears after sorted ordinary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[0] = 2;
      arr[1] = 1;
      const result = arr.toSorted();
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertUndefined();
      expect(result.lastIndexOf(undefined)).assertEqual(2);
      expect(arr.lastIndexOf(undefined)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_7300
     * @tc.name testArrayToSortedOne073
     * @tc.desc Verify null is treated as an ordinary value before undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | null | undefined>(undefined, null);
      const result = arr.toSorted();
      expect(result[0]).assertNull();
      expect(result[1]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_7400
     * @tc.name testArrayToSortedOne074
     * @tc.desc Verify equal default string projections keep mixed value order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string | number>('10', 10);
      const result = arr.toSorted();
      expect(result[0]).assertEqual('10');
      expect(result[1]).assertEqual(10);
      expect(arr[0]).assertEqual('10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_7500
     * @tc.name testArrayToSortedOne075
     * @tc.desc Verify default toSorted orders accented text by UTF-16 code units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('\u00E9', 'e');
      const result = arr.toSorted();
      expect(result[0]).assertEqual('e');
      expect(result[1]).assertEqual('\u00E9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_7600
     * @tc.name testArrayToSortedOne076
     * @tc.desc Verify default toSorted orders surrogate-pair text by UTF-16 code units
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('\uD842\uDFB7', 'A');
      const result = arr.toSorted();
      expect(result[0]).assertEqual('A');
      expect(result[1]).assertEqual('\uD842\uDFB7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_7700
     * @tc.name testArrayToSortedOne077
     * @tc.desc Verify Infinity values participate in default string ordering
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(Infinity, 1, -Infinity);
      const result = arr.toSorted();
      expect(result[0]).assertEqual(-Infinity);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_7800
     * @tc.name testArrayToSortedOne078
     * @tc.desc Verify bigint values use default string ordering without losing references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<bigint>(10n, 5n, 20n);
      const result = arr.toSorted();
      expect(result.toString()).assertEqual('10,20,5');
      expect(arr.toString()).assertEqual('10,5,20');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_7900
     * @tc.name testArrayToSortedOne079
     * @tc.desc Verify objects with equal default projections keep stable reference order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new ToSortedStableItem();
      first.key = 1;
      first.id = 1;
      const second = new ToSortedStableItem();
      second.key = 1;
      second.id = 2;
      const arr = new Array<ToSortedStableItem>(first, second);
      const result = arr.toSorted();
      expect(result[0] === first).assertTrue();
      expect(result[1] === second).assertTrue();
      expect(result !== arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_8000
     * @tc.name testArrayToSortedOne080
     * @tc.desc Verify modifying a sorted result does not touch the source with undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[0] = 2;
      arr[2] = 1;
      const result = arr.toSorted();
      result[2] = 99;
      expect(result.toString()).assertEqual('1,2,99');
      expect(arr.toString()).assertEqual('2,,1');
      expect(arr.lastIndexOf(undefined)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_8100
     * @tc.name testArrayToSortedOne081
     * @tc.desc Verify dense undefined slots remain searchable after sorting a source twice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[0] = 2;
      arr[2] = 1;
      const first = arr.toSorted();
      const second = first.toSorted();
      expect(first.lastIndexOf(undefined)).assertEqual(2);
      expect(second[0]).assertEqual(1);
      expect(second[1]).assertEqual(2);
      expect(second[2]).assertUndefined();
      expect(second.lastIndexOf(undefined)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_ONE_8200
     * @tc.name testArrayToSortedOne082
     * @tc.desc Verify toSorted supports consecutive chained calls without mutating the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedOne082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 1, 2);
      const result = arr.toSorted().toSorted();
      expect(result.toString()).assertEqual('1,2,3');
      expect(result !== arr).assertTrue();
      expect(arr.toString()).assertEqual('3,1,2');
    });

  });
}

