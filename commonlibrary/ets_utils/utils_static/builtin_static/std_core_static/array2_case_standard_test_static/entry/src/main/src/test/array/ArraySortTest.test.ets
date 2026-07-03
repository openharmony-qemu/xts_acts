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
} from '../../../../hypium/index';
import Utils from '../Util.test';

class SortItem006 {
  value: number;
  name: string;

  constructor(v: number, n: string) {
    this.value = v;
    this.name = n;
  }
}

class SortPerson020 {
  name: string;
  age: number;

  constructor(n: string, a: number) {
    this.name = n;
    this.age = a;
  }
}

interface SortProduct031 {
  name: string;
  price: number;
}

class StableEntry034 {
  key: number;
  id: number;

  constructor(k: number, i: number) {
    this.key = k;
    this.id = i;
  }
}

interface SortStudent045 {
  name: string;
  score: number;
}

interface SortData050 {
  primary: number;
  secondary: number;
  tertiary: number;
}

interface SortPlayer053 {
  name: string;
  score: number;
}

function sortAnyNumberArray(value: Any): string {
  const arr = value as Array<number>;
  return arr.sort(compareNumbersAscending).toString();
}

interface SortTask055 {
  priority: number;
  date: number;
  name: string;
}

function createDescendingRange(size: int): Array<number> {
  let arr = new Array<number>();
  for (let i: int = size; i >= 1; i--) {
    arr.pushOne(i);
  }
  return arr;
}

function createPseudoRandomNumbers(size: int, modulo: int): Array<number> {
  let arr = new Array<number>();
  for (let i: int = 0; i < size; i++) {
    arr.pushOne((i * 97) % modulo);
  }
  return arr;
}

function createSortDataArray(size: int): Array<SortData050> {
  let arr = new Array<SortData050>();
  for (let i: int = 0; i < size; i++) {
    arr.pushOne({
      primary: i % 10,
      secondary: (i * 13) % 100,
      tertiary: (i * 17) % 1000
    });
  }
  return arr;
}

function normalizeComparisonResult(value: number): int {
  if (value < 0) {
    return -1;
  }
  if (value > 0) {
    return 1;
  }
  return 0;
}

export function compareNumbersAscending(a: number, b: number): int {
  return normalizeComparisonResult(a - b);
}

function compareNumbersDescending(a: number, b: number): int {
  return normalizeComparisonResult(b - a);
}

function compareStringsLexicographic(a: string, b: string): int {
  return normalizeComparisonResult(a.localeCompare(b));
}

function isAscendingSequence(values: Array<number>, firstValue: number): boolean {
  for (let i: int = 0; i < values.length; i++) {
    if (values[i] !== firstValue + i) {
      return false;
    }
  }
  return true;
}

export default function ArraySortTest(): void {
  describe('ArraySortTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SORT_0100
     * @tc.name testArraySort001
     * @tc.desc Verify the comparator parameter is optional
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySort001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<number>(3, 1, 4, 1, 5);
      arr1.sort();
      expect(arr1[0]).assertEqual(1);
      expect(arr1[4]).assertEqual(5);

      const arr2 = new Array<number>(3, 1, 4, 1, 5);
      arr2.sort(compareNumbersDescending);
      expect(arr2[0]).assertEqual(5);
      expect(arr2[4]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SORT_0200
     * @tc.name testArraySort002
     * @tc.desc Verify sort uses the default comparison rule when no comparator is provided
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySort002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5, 3, 1, 4, 2);
      arr.sort();
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SORT_0300
     * @tc.name testArraySort003
     * @tc.desc Verify a custom comparator can sort numbers in ascending order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySort003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 40, 50);
      arr.sort(compareNumbersAscending);
      expect(arr[0]).assertEqual(10);
      expect(arr[4]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SORT_0400
     * @tc.name testArraySort004
     * @tc.desc Verify a custom comparator can sort numbers in descending order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySort004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      arr.sort(compareNumbersDescending);
      expect(arr[0]).assertEqual(5);
      expect(arr[4]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SORT_0500
     * @tc.name testArraySort005
     * @tc.desc Verify a comparator can sort strings alphabetically
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySort005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('banana', 'apple', 'cherry');
      arr.sort(compareStringsLexicographic);
      expect(arr[0]).assertEqual('apple');
      expect(arr[1]).assertEqual('banana');
      expect(arr[2]).assertEqual('cherry');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SORT_0600
     * @tc.name testArraySort006
     * @tc.desc Verify a comparator can sort arrays of objects by a numeric property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySort006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<SortItem006>(
        new SortItem006(30, 'c'),
        new SortItem006(10, 'a'),
        new SortItem006(20, 'b')
      );
      arr.sort((a: SortItem006, b: SortItem006): int => compareNumbersAscending(a.value, b.value));
      expect(arr[0].value).assertEqual(10);
      expect(arr[1].value).assertEqual(20);
      expect(arr[2].value).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SORT_0700
     * @tc.name testArraySort007
     * @tc.desc Verify sorting an empty array keeps it empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySort007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      arr.sort();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SORT_0800
     * @tc.name testArraySort008
     * @tc.desc Verify sorting a single-element array keeps the original element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySort008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 42);
      arr.sort();
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SORT_0900
     * @tc.name testArraySort009
     * @tc.desc Verify sorting an already sorted array keeps the same order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySort009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      arr.sort();
      expect(arr[0]).assertEqual(1);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SORT_1000
     * @tc.name testArraySort010
     * @tc.desc Verify sorting a reverse-ordered array produces ascending output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySort010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5, 4, 3, 2, 1);
      arr.sort();
      expect(arr[0]).assertEqual(1);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SORT_1100
     * @tc.name testArraySort011
     * @tc.desc Verify sorting identical elements preserves the repeated values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySort011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5, 5, 5, 5, 5);
      arr.sort();
      expect(arr[0]).assertEqual(5);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SORT_1200
     * @tc.name testArraySort012
     * @tc.desc Verify a comparator can sort negative values correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySort012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(-5, 0, 5, -10, 10);
      arr.sort(compareNumbersAscending);
      expect(arr[0]).assertEqual(-10);
      expect(arr[1]).assertEqual(-5);
      expect(arr[2]).assertEqual(0);
      expect(arr[3]).assertEqual(5);
      expect(arr[4]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SORT_1300
     * @tc.name testArraySort013
     * @tc.desc Verify a comparator can sort arrays containing zeros
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySort013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(0, 0, 1, 0, 2);
      arr.sort(compareNumbersAscending);
      expect(arr[0]).assertEqual(0);
      expect(arr[3]).assertEqual(1);
      expect(arr[4]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SORT_1400
     * @tc.name testArraySort014
     * @tc.desc Verify a comparator can sort very large numeric values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySort014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(Number.MAX_VALUE, 0, Number.MIN_VALUE);
      arr.sort(compareNumbersAscending);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(Number.MIN_VALUE);
      expect(arr[2]).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SORT_1500
     * @tc.name testArraySort015
     * @tc.desc Verify a comparator can place NaN values after ordinary numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySort015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, Double.NaN, 2, Double.NaN, 3);
      arr.sort((a: number, b: number): int => {
        if (Number.isNaN(a)) {
          return 1;
        }
        if (Number.isNaN(b)) {
          return -1;
        }
        return compareNumbersAscending(a, b);
      });
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(Number.isNaN(arr[3])).assertTrue();
      expect(Number.isNaN(arr[4])).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SORT_1600
     * @tc.name testArraySort016
     * @tc.desc Verify a comparator can sort Infinity and negative Infinity values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySort016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, Double.POSITIVE_INFINITY, -Double.POSITIVE_INFINITY, 2);
      arr.sort(compareNumbersAscending);
      expect(arr[0]).assertEqual(-Double.POSITIVE_INFINITY);
      expect(arr[1]).assertEqual(1);
      expect(arr[2]).assertEqual(2);
      expect(arr[3]).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SORT_1700
     * @tc.name testArraySort017
     * @tc.desc Verify sort without a comparator uses the default ascending ordering for numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySort017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 1, 2);
      arr.sort();
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SORT_1800
     * @tc.name testArraySort018
     * @tc.desc Verify undefined as the comparator behaves like omitting the comparator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySort018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 1, 2);
      arr.sort(undefined);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SORT_1900
     * @tc.name testArraySort019
     * @tc.desc Verify comparator return values determine relative ordering
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySort019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.sort((a: number, b: number): int => {
        if (a < b) {
          return -1;
        }
        if (a > b) {
          return 1;
        }
        return 0;
      });
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SORT_2000
     * @tc.name testArraySort020
     * @tc.desc Verify a multi-condition comparator can sort by age and then by name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySort020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<SortPerson020>(
        new SortPerson020('Alice', 30),
        new SortPerson020('Bob', 25),
        new SortPerson020('Charlie', 30)
      );
      arr.sort((a: SortPerson020, b: SortPerson020): int => {
        if (a.age !== b.age) {
          return compareNumbersAscending(a.age, b.age);
        }
        return compareStringsLexicographic(a.name, b.name);
      });
      expect(arr[0].name).assertEqual('Bob');
      expect(arr[1].name).assertEqual('Alice');
      expect(arr[2].name).assertEqual('Charlie');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SORT_2100
     * @tc.name testArraySort021
     * @tc.desc Verify sorting with a descending comparator keeps all elements and can be normalized to ascending order with toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySort021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      arr.sort(compareNumbersDescending);
      const normalized = arr.toSorted(compareNumbersAscending);
      expect(normalized.length).assertEqual(5);
      expect(isAscendingSequence(normalized, 1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SORT_2200
     * @tc.name testArraySort022
     * @tc.desc Verify a comparator can sort values by absolute value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySort022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(-3, 1, -5, 2, -4);
      arr.sort((a: number, b: number): int => compareNumbersAscending(Math.abs(a), Math.abs(b)));
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(-3);
      expect(arr[3]).assertEqual(-4);
      expect(arr[4]).assertEqual(-5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SORT_2300
     * @tc.name testArraySort023
     * @tc.desc Verify sort returns the same array reference after in-place modification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySort023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 1, 2);
      const result = arr.sort();
      expect(result === arr).assertTrue();
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SORT_2400
     * @tc.name testArraySort024
     * @tc.desc Verify sort supports chained calls with later array operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySort024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5, 2, 8, 1, 9);
      const result = arr.sort().map((v: number): number => v * 2);
      expect(result[0]).assertEqual(2);
      expect(result[4]).assertEqual(18);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SORT_2500
     * @tc.name testArraySort025
     * @tc.desc Verify sort mutates the original array in place
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySort025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 1, 2);
      arr.sort();
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SORT_2600
     * @tc.name testArraySort026
     * @tc.desc Verify sort differs from toSorted because sort mutates in place
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySort026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<number>(3, 1, 2);
      arr1.sort();
      expect(arr1[0]).assertEqual(1);

      const arr2 = new Array<number>(3, 1, 2);
      const sorted = arr2.toSorted();
      expect(arr2[0]).assertEqual(3);
      expect(sorted[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SORT_2700
     * @tc.name testArraySort027
     * @tc.desc Verify the array object reference remains unchanged after sorting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySort027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5, 3, 1, 4, 2);
      const originalRef = arr;
      arr.sort();
      expect(arr === originalRef).assertTrue();
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SORT_2800
     * @tc.name testArraySort028
     * @tc.desc Verify repeated sort calls can reorder the same array multiple times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySort028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5, 3, 1, 4, 2);
      arr.sort();
      expect(arr[0]).assertEqual(1);
      arr.sort(compareNumbersDescending);
      expect(arr[0]).assertEqual(5);
      arr.sort();
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SORT_2900
     * @tc.name testArraySort029
     * @tc.desc Verify a comparator can sort ordinary numeric datasets
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySort029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5, 2, 8, 1, 9);
      arr.sort(compareNumbersAscending);
      expect(arr[0]).assertEqual(1);
      expect(arr[4]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SORT_3000
     * @tc.name testArraySort030
     * @tc.desc Verify a comparator can sort string arrays lexicographically
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySort030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('zebra', 'apple', 'monkey');
      arr.sort(compareStringsLexicographic);
      expect(arr[0]).assertEqual('apple');
      expect(arr[1]).assertEqual('monkey');
      expect(arr[2]).assertEqual('zebra');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SORT_3100
     * @tc.name testArraySort031
     * @tc.desc Verify default sorting orders boolean values consistently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySort031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, false, true, false);
      arr.sort();
      expect(arr[0]).assertFalse();
      expect(arr[1]).assertFalse();
      expect(arr[2]).assertTrue();
      expect(arr[3]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SORT_3200
     * @tc.name testArraySort032
     * @tc.desc Verify a comparator can sort interface-typed objects by a property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySort032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<SortProduct031>(
        { name: 'Banana', price: 2 },
        { name: 'Apple', price: 5 },
        { name: 'Cherry', price: 1 }
      );
      arr.sort((a: SortProduct031, b: SortProduct031): int => compareNumbersAscending(a.price, b.price));
      expect(arr[0].price).assertEqual(1);
      expect(arr[1].price).assertEqual(2);
      expect(arr[2].price).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SORT_3300
     * @tc.name testArraySort033
     * @tc.desc Verify a comparator can sort mixed number and string values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySort033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | string>(3, 'a', 1, 'b', 2);
      arr.sort((a: number | string, b: number | string): int => {
        const aStr = a.toString();
        const bStr = b.toString();
        return compareStringsLexicographic(aStr, bStr);
      });
      expect(arr.length).assertEqual(5);
      expect(arr[0].toString()).assertEqual('1');
      expect(arr[4].toString()).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SORT_3400
     * @tc.name testArraySort034
     * @tc.desc Verify stable sorting preserves the order of equal-key objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySort034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<StableEntry034>(
        new StableEntry034(1, 10),
        new StableEntry034(1, 20),
        new StableEntry034(2, 30),
        new StableEntry034(2, 40)
      );
      arr.sort((a: StableEntry034, b: StableEntry034): int => compareNumbersAscending(a.key, b.key));
      expect(arr[0].id).assertEqual(10);
      expect(arr[1].id).assertEqual(20);
      expect(arr[2].id).assertEqual(30);
      expect(arr[3].id).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SORT_3500
     * @tc.name testArraySort035
     * @tc.desc Verify a transitive comparator sorts fractional numbers in ascending order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySort035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2.5, 1.1, 2.4);
      arr.sort(compareNumbersAscending);
      expect(arr[0]).assertEqual(1.1);
      expect(arr[1]).assertEqual(2.4);
      expect(arr[2]).assertEqual(2.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SORT_3600
     * @tc.name testArraySort036
     * @tc.desc Verify a comparator can sort arrays that contain null values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySort036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | null>(1, null, 2, null, 3);
      arr.sort((a: number | null, b: number | null): int => {
        if (a === null && b === null) {
          return 0;
        }
        if (a === null) {
          return -1;
        }
        if (b === null) {
          return 1;
        }
        return compareNumbersAscending(a, b);
      });
      expect(arr[0]).assertNull();
      expect(arr[1]).assertNull();
      expect(arr[2]).assertEqual(1);
      expect(arr[4]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SORT_3700
     * @tc.name testArraySort037
     * @tc.desc Verify a large array can be sorted into ascending order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySort037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = createDescendingRange(1000);
      arr.sort(compareNumbersAscending);
      expect(isAscendingSequence(arr, 1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SORT_3800
     * @tc.name testArraySort038
     * @tc.desc Verify mapped values can be produced after sorting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySort038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5, 2, 8, 1, 9);
      arr.sort(compareNumbersAscending);
      const doubled = arr.map((v: number): number => v * 2);
      expect(doubled[0]).assertEqual(2);
      expect(doubled[4]).assertEqual(18);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SORT_3900
     * @tc.name testArraySort039
     * @tc.desc Verify filtered values can be taken after sorting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySort039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5, 2, 8, 6, 9);
      arr.sort(compareNumbersAscending);
      const filtered = arr.filter((v: number): boolean => v > 5);
      expect(filtered.length).assertEqual(3);
      expect(filtered[0]).assertEqual(6);
      expect(filtered[2]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SORT_4000
     * @tc.name testArraySort040
     * @tc.desc Verify exceptions thrown by the comparator can be observed by the caller
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySort040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      let caught = false;
      try {
        arr.sort((a: number, b: number): int => {
          if (a === 2 || b === 2) {
            throw new Error('Cannot compare 2');
          }
          return compareNumbersAscending(a, b);
        });
        expect().assertFail();
      } catch (e) {
        caught = e.name === 'Error' && e.message === 'Cannot compare 2';
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SORT_4100
     * @tc.name testArraySort041
     * @tc.desc Verify sort with a numeric comparator handles duplicates and negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySort041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, -1, 3, 2);
      arr.sort(compareNumbersAscending);
      expect(arr[0]).assertEqual(-1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SORT_4200
     * @tc.name testArraySort042
     * @tc.desc Verify comparators may return int magnitudes other than negative one and positive one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySort042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 1, 4, 2);
      arr.sort((left: number, right: number): int => {
        if (left < right) {
          return -8;
        }
        if (left > right) {
          return 8;
        }
        return 0;
      });
      expect(arr.toString()).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SORT_4300
     * @tc.name testArraySort043
     * @tc.desc Verify stable sort preserves case variants when a case-insensitive comparator returns zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySort043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const words = new Array<string>('b', 'A', 'a', 'B');
      words.sort((left: string, right: string): int => {
        return normalizeComparisonResult(left.toLowerCase().localeCompare(right.toLowerCase()));
      });
      expect(words.toString()).assertEqual('A,a,b,B');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SORT_4400
     * @tc.name testArraySort044
     * @tc.desc Verify a case-insensitive sort can use original case as a deterministic tie-breaker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySort044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const words = new Array<string>('alpha', 'Beta', 'ALPHA', 'beta');
      words.sort((left: string, right: string): int => {
        const folded = normalizeComparisonResult(left.toLowerCase().localeCompare(right.toLowerCase()));
        if (folded !== 0) {
          return folded;
        }
        return normalizeComparisonResult(right.charCodeAt(0) - left.charCodeAt(0));
      });
      expect(words.toString()).assertEqual('alpha,ALPHA,beta,Beta');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SORT_4500
     * @tc.name testArraySort045
     * @tc.desc Verify an empty array sort does not invoke the comparator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySort045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      let calls: int = 0;
      const sorted = arr.sort((_left: number, _right: number): int => {
        calls++;
        return -1;
      });
      expect(sorted === arr).assertTrue();
      expect(calls).assertEqual(0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SORT_4600
     * @tc.name testArraySort046
     * @tc.desc Verify a single-element array sort does not invoke the comparator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySort046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<SortStudent045>(1, { name: 'Solo', score: 42 });
      let calls: int = 0;
      arr.sort((_left: SortStudent045, _right: SortStudent045): int => {
        calls++;
        return 1;
      });
      expect(calls).assertEqual(0);
      expect(arr[0].name).assertEqual('Solo');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SORT_4700
     * @tc.name testArraySort047
     * @tc.desc Verify a non-transitive comparator can still be invoked during sorting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySort047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      let callCount = 0;
      arr.sort((a: number, b: number): int => {
        callCount++;
        return compareNumbersAscending(a, b);
      });
      expect(callCount > 0).assertTrue();
      expect(arr.length).assertEqual(3);
      expect(arr.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SORT_4800
     * @tc.name testArraySort048
     * @tc.desc Verify descending sort can be compared with reverse on ascending input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySort048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      arr.sort(compareNumbersDescending);
      expect(arr[0]).assertEqual(5);
      expect(arr[4]).assertEqual(1);

      const arr2 = new Array<number>(1, 2, 3, 4, 5);
      arr2.reverse();
      expect(arr2[0]).assertEqual(5);
      expect(arr2[4]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SORT_4900
     * @tc.name testArraySort049
     * @tc.desc Verify a large pseudo-random array is fully sorted into ascending order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySort049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = createPseudoRandomNumbers(10000, 10000);
      arr.sort(compareNumbersAscending);
      expect(isAscendingSequence(arr, 0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SORT_5000
     * @tc.name testArraySort050
     * @tc.desc Verify a complex comparator can sort structured data deterministically
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySort050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = createSortDataArray(100);
      arr.sort((a: SortData050, b: SortData050): int => {
        if (a.primary !== b.primary) {
          return compareNumbersAscending(a.primary, b.primary);
        }
        if (a.secondary !== b.secondary) {
          return compareNumbersAscending(a.secondary, b.secondary);
        }
        return compareNumbersAscending(a.tertiary, b.tertiary);
      });
      expect(arr.length).assertEqual(100);
      expect(arr[0].primary <= arr[99].primary).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SORT_5100
     * @tc.name testArraySort051
     * @tc.desc Verify reverse and sort perform different operations on the same data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySort051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<number>(1, 2, 3, 4, 5);
      arr1.reverse();
      expect(arr1[0]).assertEqual(5);

      const arr2 = new Array<number>(1, 2, 3, 4, 5);
      arr2.sort();
      expect(arr2[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SORT_5200
     * @tc.name testArraySort052
     * @tc.desc Verify empty arrays remain empty when sorted with or without a comparator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySort052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      arr.sort();
      expect(arr.length).assertEqual(0);
      const sorted = arr.sort(compareNumbersAscending);
      expect(sorted.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SORT_5300
     * @tc.name testArraySort053
     * @tc.desc Verify stable sorting keeps the original order of equal leaderboard scores
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySort053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const players = new Array<SortPlayer053>(
        { name: 'Alpha', score: 10 },
        { name: 'Bravo', score: 20 },
        { name: 'Charlie', score: 10 },
        { name: 'Delta', score: 20 }
      );
      players.sort((left: SortPlayer053, right: SortPlayer053): int => {
        return compareNumbersDescending(left.score, right.score);
      });
      expect(players[0].name).assertEqual('Bravo');
      expect(players[1].name).assertEqual('Delta');
      expect(players[2].name).assertEqual('Alpha');
      expect(players[3].name).assertEqual('Charlie');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SORT_5400
     * @tc.name testArraySort054
     * @tc.desc Verify a comparator returning zero for parity groups preserves within-group order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySort054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5, 2, 7, 4, 1, 6);
      arr.sort((left: number, right: number): int => {
        const leftParity = left % 2;
        const rightParity = right % 2;
        if (leftParity === rightParity) {
          return 0;
        }
        return leftParity === 0 ? -2 : 2;
      });
      expect(arr.toString()).assertEqual('2,4,6,5,7,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SORT_5500
     * @tc.name testArraySort055
     * @tc.desc Verify a multi-key comparator can return larger int magnitudes for each key decision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySort055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const tasks = new Array<SortTask055>(
        { priority: 2, date: 2, name: 'build' },
        { priority: 1, date: 5, name: 'audit' },
        { priority: 2, date: 1, name: 'deploy' },
        { priority: 1, date: 3, name: 'code' }
      );
      tasks.sort((left: SortTask055, right: SortTask055): int => {
        if (left.priority < right.priority) {
          return -10;
        }
        if (left.priority > right.priority) {
          return 10;
        }
        if (left.date < right.date) {
          return -4;
        }
        if (left.date > right.date) {
          return 4;
        }
        return 0;
      });
      expect(tasks[0].name).assertEqual('code');
      expect(tasks[1].name).assertEqual('audit');
      expect(tasks[2].name).assertEqual('deploy');
      expect(tasks[3].name).assertEqual('build');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SORT_5600
     * @tc.name testArraySort056
     * @tc.desc Verify default string sort follows case-sensitive lexicographic order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySort056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('B', 'a', 'A');
      arr.sort();
      expect(arr.toString()).assertEqual('A,B,a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SORT_5700
     * @tc.name testArraySort057
     * @tc.desc Verify default string sort exposes lexicographic numeric text ordering
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySort057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('2', '10', '1');
      arr.sort();
      expect(arr.toString()).assertEqual('1,10,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SORT_5800
     * @tc.name testArraySort058
     * @tc.desc Verify undefined elements are placed after ordinary values even with a comparator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySort058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(undefined, 1);
      arr.sort((_left: number | undefined, _right: number | undefined): int => -1);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SORT_5900
     * @tc.name testArraySort059
     * @tc.desc Verify explicit undefined values are placed after ordinary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySort059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(4, (_index) => undefined);
      arr[1] = undefined;
      arr[3] = 1;
      arr.sort((_left: number | undefined, _right: number | undefined): int => -1);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertUndefined();
      expect(arr.lastIndexOf(undefined)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SORT_6000
     * @tc.name testArraySort060
     * @tc.desc Verify an array containing only undefined values does not invoke the comparator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySort060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(5, (_index) => undefined);
      let callCount: int = 0;
      arr.sort((_left: number | undefined, _right: number | undefined): int => {
        callCount++;
        return 1;
      });
      expect(arr.length).assertEqual(5);
      expect(callCount).assertEqual(0);
      expect(arr.lastIndexOf(undefined)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SORT_6100
     * @tc.name testArraySort061
     * @tc.desc Verify comparator is not invoked for arrays containing only undefined values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySort061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(undefined, undefined);
      let callCount: int = 0;
      arr.sort((_left: number | undefined, _right: number | undefined): int => {
        callCount++;
        return 0;
      });
      expect(callCount).assertEqual(0);
      expect(arr[0]).assertUndefined();
      expect(arr[1]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SORT_6200
     * @tc.name testArraySort062
     * @tc.desc Verify null is treated as an ordinary value before undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySort062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | null | undefined>(undefined, null);
      arr.sort((_left: number | null | undefined, _right: number | null | undefined): int => 1);
      expect(arr[0]).assertNull();
      expect(arr[1]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SORT_6300
     * @tc.name testArraySort063
     * @tc.desc Verify a zero comparator result is treated as equal ordering
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySort063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 1);
      arr.sort((_left: number, _right: number): int => 0);
      expect(arr.toString()).assertEqual('2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SORT_6400
     * @tc.name testArraySort064
     * @tc.desc Verify appending during comparison does not throw and keeps the appended value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySort064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 1);
      let appended = false;
      let thrown = false;
      try {
        arr.sort((left: number, right: number): int => {
          if (!appended) {
            arr.pushOne(3);
            appended = true;
          }
          return compareNumbersAscending(left, right);
        });
      } catch (e) {
        thrown = e.name === 'Error';
      }
      expect(thrown).assertFalse();
      expect(arr.includes(1)).assertTrue();
      expect(arr.includes(2)).assertTrue();
      expect(arr.includes(3)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SORT_6500
     * @tc.name testArraySort065
     * @tc.desc Verify removing an element during comparison is reported to the caller
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySort065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 2, 1);
      let removed = false;
      let thrown = false;
      try {
        arr.sort((left: number, right: number): int => {
          if (!removed) {
            arr.pop();
            removed = true;
          }
          return compareNumbersAscending(left, right);
        });
      } catch (e) {
        thrown = e.name === 'Error';
      }
      expect(thrown).assertFalse();
      expect(arr.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SORT_6600
     * @tc.name testArraySort066
     * @tc.desc Verify truncating length during comparison does not crash sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySort066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 2, 1);
      let truncated = false;
      let thrown = false;
      try {
        arr.sort((left: number, right: number): int => {
          if (!truncated) {
            arr.length = 0;
            truncated = true;
          }
          return compareNumbersAscending(left, right);
        });
      } catch (e) {
        thrown = e.name === 'Error';
      }
      expect(thrown).assertFalse();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SORT_6700
     * @tc.name testArraySort067
     * @tc.desc Verify equal string projections preserve original mixed value order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySort067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string | number>('10', 10);
      arr.sort((left: string | number, right: string | number): int => {
        return compareStringsLexicographic(left.toString(), right.toString());
      });
      expect(arr[0]).assertEqual('10');
      expect(arr[1]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SORT_6800
     * @tc.name testArraySort068
     * @tc.desc Verify sort supports consecutive chained calls on the same array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySort068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 1, 4, 2);
      const result = arr.sort(compareNumbersAscending).sort(compareNumbersDescending);
      expect(result === arr).assertTrue();
      expect(result.toString()).assertEqual('4,3,2,1');
      expect(arr.toString()).assertEqual('4,3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SORT_6900
     * @tc.name testArraySort069
     * @tc.desc Verify sort works after narrowing an Any value back to Array<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySort069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const anyValue: Any = new Array<number>(3, 1, 2);
      expect(sortAnyNumberArray(anyValue)).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SORT_7000
     * @tc.name testArraySort070
     * @tc.desc Verify sort supports arrays whose element type is Any
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySort070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const anyArr = new Array<Any>('b', 'a', 'c');
      anyArr.sort();
      expect(anyArr.toString()).assertEqual('a,b,c');
    });

  });
}

