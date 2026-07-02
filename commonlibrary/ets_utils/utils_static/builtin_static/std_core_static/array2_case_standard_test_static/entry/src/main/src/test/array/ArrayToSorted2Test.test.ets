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

class SortTwoItem025 {
  value: number = 0;
}

class SortTwoPerson034 {
  name: string = '';
  age: number = 0;
}

class SortTwoTask039 {
  priority: number = 0;
  name: string = '';
}

class ToSortedStableItemTwo {
  key: number = 0;
  id: number = 0;
}

class ToSortedRankItemTwo {
  name: string = '';
  rank: number = 0;
}

function normalizeToSortedTwo(value: number): int {
  if (value < 0) {
    return -1;
  }
  if (value > 0) {
    return 1;
  }
  return 0;
}

function compareNumbersAscendingTwo(a: number, b: number): int {
  return normalizeToSortedTwo(a - b);
}

function compareNumbersDescendingTwo(a: number, b: number): int {
  return normalizeToSortedTwo(b - a);
}

function toSortedFromAnyNumberArrayTwo(value: Any): string {
  const arr = value as Array<number>;
  return arr.toSorted(compareNumbersAscendingTwo).toString();
}

function compareStringsAscendingTwo(a: string, b: string): int {
  return normalizeToSortedTwo(a.localeCompare(b));
}

function toIntComparator<T>(compare: (a: T, b: T) => number): (a: T, b: T) => int {
  return (a: T, b: T): int => normalizeToSortedTwo(compare(a, b));
}

function createDescendingRangeTwo(size: int): Array<number> {
  let arr = new Array<number>();
  for (let i: int = size; i >= 1; i--) {
    arr.pushOne(i);
  }
  return arr;
}

function createPseudoRandomNumbersTwo(size: int, modulo: int): Array<number> {
  let arr = new Array<number>();
  for (let i: int = 0; i < size; i++) {
    arr.pushOne((i * 97) % modulo);
  }
  return arr;
}

function isAscendingSequenceTwo(values: Array<number>, firstValue: number): boolean {
  for (let i: int = 0; i < values.length; i++) {
    if (values[i] !== firstValue + i) {
      return false;
    }
  }
  return true;
}

function isSortedByComparatorTwo<T>(values: Array<T>, compare: (a: T, b: T) => number): boolean {
  for (let i: int = 1; i < values.length; i++) {
    if (compare(values[i - 1], values[i]) > 0) {
      return false;
    }
  }
  return true;
}

export default function ArrayToSorted2Test(): void {
  describe('ArrayToSorted2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_0100
     * @tc.name testArrayToSortedTwo001
     * @tc.desc Verify toSorted with comparator accepts one comparator parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 1, 2);
      const comparator = (a: number, b: number): number => a - b;
      const result = arr.toSorted(toIntComparator(comparator));
      expect(result.toString()).assertEqual('1,2,3');
      expect(arr.toString()).assertEqual('3,1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_0200
     * @tc.name testArrayToSortedTwo002
     * @tc.desc Verify comparator uses a function type from two elements to number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5, 2, 8);
      const comparator: (a: number, b: number) => number = (a, b): number => a - b;
      const result = arr.toSorted(toIntComparator(comparator));
      expect(result[0]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_0300
     * @tc.name testArrayToSortedTwo003
     * @tc.desc Verify the comparator overload is used when a comparator is supplied
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 1, 2);
      const comparator = (a: number, b: number): number => a - b;
      const result = arr.toSorted(toIntComparator(comparator));
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_0400
     * @tc.name testArrayToSortedTwo004
     * @tc.desc Verify comparator accepts two parameters and returns a numeric result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const comparator = (a: number, b: number): number => {
        return a - b;
      };
      const result = arr.toSorted(toIntComparator(comparator));
      expect(result[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_0500
     * @tc.name testArrayToSortedTwo005
     * @tc.desc Verify comparator parameter types match the array element type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('c', 'a', 'b');
      const comparator = (a: string, b: string): number => {
        return a.localeCompare(b);
      };
      const result = arr.toSorted(toIntComparator(comparator));
      expect(result.toString()).assertEqual('a,b,c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_0600
     * @tc.name testArrayToSortedTwo006
     * @tc.desc Verify comparator returns a number value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 1, 2);
      const comparator = (a: number, b: number): number => {
        const diff = a - b;
        return diff;
      };
      const result = arr.toSorted(toIntComparator(comparator));
      expect(result[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_0700
     * @tc.name testArrayToSortedTwo007
     * @tc.desc Verify toSorted returns a new array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 1, 2);
      const comparator = (a: number, b: number): number => a - b;
      const result = arr.toSorted(toIntComparator(comparator));
      expect(Array.isArray(result)).assertTrue();
      expect(result !== arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_0800
     * @tc.name testArrayToSortedTwo008
     * @tc.desc Verify toSorted does not modify the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 1, 2);
      const originalStr = arr.toString();
      arr.toSorted(compareNumbersAscendingTwo);
      expect(arr.toString()).assertEqual(originalStr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_0900
     * @tc.name testArrayToSortedTwo009
     * @tc.desc Verify toSorted returns an array ordered by the comparator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5, 2, 8, 1);
      const comparator = (a: number, b: number): number => a - b;
      const result = arr.toSorted(toIntComparator(comparator));
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(5);
      expect(result[3]).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_1000
     * @tc.name testArrayToSortedTwo010
     * @tc.desc Verify negative comparator values place a before b
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 1, 2);
      const comparator = (a: number, b: number): number => {
        if (a < b) {
          return -1;
        }
        if (a > b) {
          return 1;
        }
        return 0;
      };
      const result = arr.toSorted(toIntComparator(comparator));
      expect(result.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_1100
     * @tc.name testArrayToSortedTwo011
     * @tc.desc Verify positive comparator values place b before a
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const comparator = (a: number, b: number): number => {
        if (a < b) {
          return 1;
        }
        if (a > b) {
          return -1;
        }
        return 0;
      };
      const result = arr.toSorted(toIntComparator(comparator));
      expect(result.toString()).assertEqual('3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_1200
     * @tc.name testArrayToSortedTwo012
     * @tc.desc Verify zero comparator values preserve the original arrangement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 1, 1);
      const comparator = (_a: number, _b: number): number => 0;
      const result = arr.toSorted(toIntComparator(comparator));
      expect(result.length).assertEqual(3);
      expect(result.toString()).assertEqual('1,1,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_1300
     * @tc.name testArrayToSortedTwo013
     * @tc.desc Verify ascending order can be implemented with a minus b
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5, 3, 1, 4, 2);
      const result = arr.toSorted(compareNumbersAscendingTwo);
      expect(result.toString()).assertEqual('1,2,3,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_1400
     * @tc.name testArrayToSortedTwo014
     * @tc.desc Verify descending order can be implemented with b minus a
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result = arr.toSorted(compareNumbersDescendingTwo);
      expect(result.toString()).assertEqual('5,4,3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_1500
     * @tc.name testArrayToSortedTwo015
     * @tc.desc Verify empty arrays stay empty after comparator sorting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      const result = arr.toSorted(compareNumbersAscendingTwo);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_1600
     * @tc.name testArrayToSortedTwo016
     * @tc.desc Verify single-element arrays stay unchanged after comparator sorting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 42);
      const result = arr.toSorted(compareNumbersAscendingTwo);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_1700
     * @tc.name testArrayToSortedTwo017
     * @tc.desc Verify two-element arrays are sorted correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 1);
      const result = arr.toSorted(compareNumbersAscendingTwo);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_1800
     * @tc.name testArrayToSortedTwo018
     * @tc.desc Verify already sorted arrays keep ascending order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const result = arr.toSorted(compareNumbersAscendingTwo);
      expect(result.toString()).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_1900
     * @tc.name testArrayToSortedTwo019
     * @tc.desc Verify reverse-ordered arrays become ascending with the comparator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(4, 3, 2, 1);
      const result = arr.toSorted(compareNumbersAscendingTwo);
      expect(result.toString()).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_2000
     * @tc.name testArrayToSortedTwo020
     * @tc.desc Verify arrays with duplicate elements are sorted correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 1, 2, 1);
      const result = arr.toSorted(compareNumbersAscendingTwo);
      expect(result.toString()).assertEqual('1,1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_2100
     * @tc.name testArrayToSortedTwo021
     * @tc.desc Verify number arrays support ascending comparator sorting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 1, 4, 1, 5);
      const result = arr.toSorted(compareNumbersAscendingTwo);
      expect(result.toString()).assertEqual('1,1,3,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_2200
     * @tc.name testArrayToSortedTwo022
     * @tc.desc Verify string arrays support alphabetical sorting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('c', 'a', 'b');
      const result = arr.toSorted(compareStringsAscendingTwo);
      expect(result.toString()).assertEqual('a,b,c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_2300
     * @tc.name testArrayToSortedTwo023
     * @tc.desc Verify string arrays can be sorted by length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('aaa', 'a', 'aa');
      const result = arr.toSorted(toIntComparator((a: string, b: string): number => a.length - b.length));
      expect(result.toString()).assertEqual('a,aa,aaa');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_2400
     * @tc.name testArrayToSortedTwo024
     * @tc.desc Verify string arrays support descending lexical sorting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c');
      const result = arr.toSorted(toIntComparator((a: string, b: string): number => b.localeCompare(a)));
      expect(result.toString()).assertEqual('c,b,a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_2500
     * @tc.name testArrayToSortedTwo025
     * @tc.desc Verify object arrays can be sorted by property values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let item1 = new SortTwoItem025();
      item1.value = 3;
      let item2 = new SortTwoItem025();
      item2.value = 1;
      let item3 = new SortTwoItem025();
      item3.value = 2;
      const arr = new Array<SortTwoItem025>(item1, item2, item3);
      const result = arr.toSorted(toIntComparator((a: SortTwoItem025, b: SortTwoItem025): number => a.value - b.value));
      expect(result[0].value).assertEqual(1);
      expect(result[1].value).assertEqual(2);
      expect(result[2].value).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_2600
     * @tc.name testArrayToSortedTwo026
     * @tc.desc Verify arrays containing negative numbers can be sorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, -1, 0, -2);
      const result = arr.toSorted(compareNumbersAscendingTwo);
      expect(result.toString()).assertEqual('-2,-1,0,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_2700
     * @tc.name testArrayToSortedTwo027
     * @tc.desc Verify floating-point arrays can be sorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3.14, 1.41, 2.71);
      const result = arr.toSorted(compareNumbersAscendingTwo);
      expect(result.toString()).assertEqual('1.41,2.71,3.14');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_2800
     * @tc.name testArrayToSortedTwo028
     * @tc.desc Verify toSorted preserves original length and boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 1, 2);
      const originalLength = arr.length;
      const originalFirst = arr[0];
      const originalLast = arr[arr.length - 1];
      arr.toSorted(compareNumbersAscendingTwo);
      expect(arr.length).assertEqual(originalLength);
      expect(arr[0]).assertEqual(originalFirst);
      expect(arr[arr.length - 1]).assertEqual(originalLast);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_2900
     * @tc.name testArrayToSortedTwo029
     * @tc.desc Verify returned sorted arrays stay independent from the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 1, 2);
      const result = arr.toSorted(compareNumbersAscendingTwo);
      result[0] = 999;
      expect(arr[0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_3000
     * @tc.name testArrayToSortedTwo030
     * @tc.desc Verify repeated toSorted calls return independent arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 1, 2);
      const comparator = (a: number, b: number): number => a - b;
      const result1 = arr.toSorted(toIntComparator(comparator));
      const result2 = arr.toSorted(toIntComparator(comparator));
      expect(result1 !== result2).assertTrue();
      expect(result1.toString()).assertEqual(result2.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_3100
     * @tc.name testArrayToSortedTwo031
     * @tc.desc Verify arrow functions can be used as comparators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 1, 2);
      const result = arr.toSorted(compareNumbersAscendingTwo);
      expect(result.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_3200
     * @tc.name testArrayToSortedTwo032
     * @tc.desc Verify comparator variables can reference arrow functions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 1, 2);
      const comparator = (a: number, b: number): number => {
        return a - b;
      };
      const result = arr.toSorted(toIntComparator(comparator));
      expect(result.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_3300
     * @tc.name testArrayToSortedTwo033
     * @tc.desc Verify complex comparator logic can be used
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5, 1, 3, 2, 4);
      const comparator = (a: number, b: number): number => {
        const aOdd = a % 2 !== 0;
        const bOdd = b % 2 !== 0;
        if (aOdd && !bOdd) {
          return -1;
        }
        if (!aOdd && bOdd) {
          return 1;
        }
        return a - b;
      };
      const result = arr.toSorted(toIntComparator(comparator));
      expect(result.toString()).assertEqual('1,3,5,2,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_3400
     * @tc.name testArrayToSortedTwo034
     * @tc.desc Verify multi-condition comparators can sort objects by several fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p1 = new SortTwoPerson034();
      p1.name = 'Alice';
      p1.age = 25;
      let p2 = new SortTwoPerson034();
      p2.name = 'Bob';
      p2.age = 20;
      let p3 = new SortTwoPerson034();
      p3.name = 'Alice';
      p3.age = 20;
      const arr = new Array<SortTwoPerson034>(p1, p2, p3);
      const result = arr.toSorted(
        toIntComparator((a: SortTwoPerson034, b: SortTwoPerson034): number => {
          if (a.name !== b.name) {
            return a.name.localeCompare(b.name);
          }
          return a.age - b.age;
        })
      );
      expect(result[0] === p3).assertTrue();
      expect(result[1] === p1).assertTrue();
      expect(result[2] === p2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_3500
     * @tc.name testArrayToSortedTwo035
     * @tc.desc Verify toSorted does not mutate the original array while sort does
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<number>(3, 1, 2);
      const arr2 = new Array<number>(3, 1, 2);
      const comparator = (a: number, b: number): number => a - b;
      const toSortedResult = arr1.toSorted(toIntComparator(comparator));
      arr2.sort(toIntComparator(comparator));
      expect(arr1.toString()).assertEqual('3,1,2');
      expect(arr2.toString()).assertEqual('1,2,3');
      expect(toSortedResult.toString()).assertEqual(arr2.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_3600
     * @tc.name testArrayToSortedTwo036
     * @tc.desc Verify toSorted and sort produce the same order with the same comparator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<number>(3, 1, 2);
      const arr2 = new Array<number>(3, 1, 2);
      const comparator = (a: number, b: number): number => a - b;
      const toSortedResult = arr1.toSorted(toIntComparator(comparator));
      arr2.sort(toIntComparator(comparator));
      expect(toSortedResult.toString()).assertEqual(arr2.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_3700
     * @tc.name testArrayToSortedTwo037
     * @tc.desc Verify toSorted can produce a sorted copy without changing the original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original = new Array<number>(3, 1, 4, 1, 5);
      const sorted = original.toSorted(compareNumbersAscendingTwo);
      expect(sorted.toString()).assertEqual('1,1,3,4,5');
      expect(original.toString()).assertEqual('3,1,4,1,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_3800
     * @tc.name testArrayToSortedTwo038
     * @tc.desc Verify custom business rules can be expressed through comparators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let task1 = new SortTwoTask039();
      task1.priority = 2;
      task1.name = 'Low';
      let task2 = new SortTwoTask039();
      task2.priority = 1;
      task2.name = 'High';
      const arr = new Array<SortTwoTask039>(task1, task2);
      const result = arr.toSorted(
        toIntComparator((a: SortTwoTask039, b: SortTwoTask039): number => {
          return a.priority - b.priority;
        })
      );
      expect(result[0] === task2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_3900
     * @tc.name testArrayToSortedTwo039
     * @tc.desc Verify toSorted can be chained with map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 1, 2);
      const result = arr.toSorted(compareNumbersAscendingTwo).map((v: number): number => v * 2);
      expect(result.toString()).assertEqual('2,4,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_4000
     * @tc.name testArrayToSortedTwo040
     * @tc.desc Verify large descending arrays can be sorted with a comparator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = createDescendingRangeTwo(1000);
      const result = arr.toSorted(compareNumbersAscendingTwo);
      expect(isAscendingSequenceTwo(result, 1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_4100
     * @tc.name testArrayToSortedTwo041
     * @tc.desc Verify complex comparator logic orders values by modulo bucket and numeric value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = createPseudoRandomNumbersTwo(100, 1000);
      const comparator = (a: number, b: number): number => {
        const aMod = a % 10;
        const bMod = b % 10;
        if (aMod !== bMod) {
          return aMod - bMod;
        }
        return a - b;
      };
      const result = arr.toSorted(toIntComparator(comparator));
      const normalizedResult = result.toSorted(compareNumbersAscendingTwo);
      const normalizedSource = arr.toSorted(compareNumbersAscendingTwo);
      expect(result.length).assertEqual(100);
      expect(isSortedByComparatorTwo(result, comparator)).assertTrue();
      expect(normalizedResult.toString()).assertEqual(normalizedSource.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_4200
     * @tc.name testArrayToSortedTwo042
     * @tc.desc Verify generic result arrays preserve element types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 1, 2);
      const comparator = (a: number, b: number): number => a - b;
      const result: Array<number> = arr.toSorted(toIntComparator(comparator));
      expect(typeof result[0]).assertEqual('number');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_4300
     * @tc.name testArrayToSortedTwo043
     * @tc.desc Verify comparator parameter types can be inferred automatically
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 1, 2);
      const result = arr.toSorted(compareNumbersAscendingTwo);
      expect(result[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_4400
     * @tc.name testArrayToSortedTwo044
     * @tc.desc Verify multiple generic array types support comparator sorting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<number>(3, 1, 2);
      const r1 = arr1.toSorted(compareNumbersAscendingTwo);
      expect(r1.toString()).assertEqual('1,2,3');

      const arr2 = new Array<string>('c', 'a', 'b');
      const r2 = arr2.toSorted(compareStringsAscendingTwo);
      expect(r2.toString()).assertEqual('a,b,c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_4500
     * @tc.name testArrayToSortedTwo045
     * @tc.desc Verify toSorted can be combined with filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5, 2, 8, 1, 9);
      const filtered = arr.filter((v: number): boolean => v > 2);
      const result = filtered.toSorted(compareNumbersAscendingTwo);
      expect(result.toString()).assertEqual('5,8,9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_4600
     * @tc.name testArrayToSortedTwo046
     * @tc.desc Verify toSorted can be combined with slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5, 2, 8, 1, 9);
      const sliced = arr.slice(0, 3);
      const result = sliced.toSorted(compareNumbersAscendingTwo);
      expect(result.toString()).assertEqual('2,5,8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_4700
     * @tc.name testArrayToSortedTwo047
     * @tc.desc Verify several array methods can be chained around toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5, 2, 8, 1, 9, 3);
      const result = arr
        .filter((v: number): boolean => v > 1)
        .toSorted(compareNumbersAscendingTwo)
        .slice(0, 3);
      expect(result.toString()).assertEqual('2,3,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_4800
     * @tc.name testArrayToSortedTwo048
     * @tc.desc Verify arrays can be sorted by absolute value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(-3, 1, -2, 3, 2);
      const result = arr.toSorted(toIntComparator((a: number, b: number): number => Math.abs(a) - Math.abs(b)));
      expect(result[0]).assertEqual(1);
      expect(result[4]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_4900
     * @tc.name testArrayToSortedTwo049
     * @tc.desc Verify string arrays can be sorted case-insensitively
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('Zebra', 'apple', 'Banana');
      const result = arr.toSorted(
        toIntComparator((a: string, b: string): number => {
          return a.toLowerCase().localeCompare(b.toLowerCase());
        })
      );
      expect(result[0]).assertEqual('apple');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_5000
     * @tc.name testArrayToSortedTwo050
     * @tc.desc Verify numeric date-like values can be sorted with a comparator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1000, 500, 1500);
      const result = arr.toSorted(compareNumbersAscendingTwo);
      expect(result[0]).assertEqual(500);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_5100
     * @tc.name testArrayToSortedTwo051
     * @tc.desc Verify custom comparators can partition values deterministically
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const comparator = (a: number, b: number): number => {
        const aEven = a % 2 === 0;
        const bEven = b % 2 === 0;
        if (aEven && !bEven) {
          return -1;
        }
        if (!aEven && bEven) {
          return 1;
        }
        return a - b;
      };
      const result = arr.toSorted(toIntComparator(comparator));
      expect(result.toString()).assertEqual('2,4,1,3,5');
      expect(arr.toString()).assertEqual('1,2,3,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_5200
     * @tc.name testArrayToSortedTwo052
     * @tc.desc Verify comparator overloads remain more flexible than the no-argument overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 1, 2);
      const r1 = arr.toSorted();
      const arr2 = new Array<number>(3, 1, 2);
      const r2 = arr2.toSorted(compareNumbersDescendingTwo);
      expect(r1.toString()).assertEqual('1,2,3');
      expect(r2.toString()).assertEqual('3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_5300
     * @tc.name testArrayToSortedTwo053
     * @tc.desc Verify custom comparators can sort numeric strings by numeric value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('100', '20', '3');
      const r1 = arr.toSorted();
      expect(r1.toString()).assertEqual('100,20,3');

      const arr2 = new Array<string>('100', '20', '3');
      const r2 = arr2.toSorted(
        toIntComparator((a: string, b: string): number => {
          return Number.parseInt(a) - Number.parseInt(b);
        })
      );
      expect(r2.toString()).assertEqual('3,20,100');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_5400
     * @tc.name testArrayToSortedTwo054
     * @tc.desc Verify helper comparators can be reused with toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nums = new Array<number>(9, 4, 7, 1);
      const asc = nums.toSorted(compareNumbersAscendingTwo);
      const desc = nums.toSorted(compareNumbersDescendingTwo);
      const strs = new Array<string>('c', 'a', 'b');
      const strSorted = strs.toSorted(compareStringsAscendingTwo);
      expect(asc.toString()).assertEqual('1,4,7,9');
      expect(desc.toString()).assertEqual('9,7,4,1');
      expect(strSorted.toString()).assertEqual('a,b,c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_5500
     * @tc.name testArrayToSortedTwo055
     * @tc.desc Verify comparator large positive and negative values determine order by sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 1, 2);
      const result = arr.toSorted((left: number, right: number): int => {
        if (left < right) {
          return -1000;
        }
        if (left > right) {
          return 1000;
        }
        return 0;
      });
      expect(result.toString()).assertEqual('1,2,3');
      expect(arr.toString()).assertEqual('3,1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_5600
     * @tc.name testArrayToSortedTwo056
     * @tc.desc Verify a single-element array does not invoke the comparator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 5);
      let callCount: int = 0;
      const result = arr.toSorted((_left: number, _right: number): int => {
        callCount++;
        return 0;
      });
      expect(result[0]).assertEqual(5);
      expect(result !== arr).assertTrue();
      expect(callCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_5700
     * @tc.name testArrayToSortedTwo057
     * @tc.desc Verify comparator can sort objects by an external rank table
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const low = new ToSortedRankItemTwo();
      low.name = 'low';
      low.rank = 2;
      const high = new ToSortedRankItemTwo();
      high.name = 'high';
      high.rank = 0;
      const mid = new ToSortedRankItemTwo();
      mid.name = 'mid';
      mid.rank = 1;
      const arr = new Array<ToSortedRankItemTwo>(low, high, mid);
      const ranks = new Array<string>('high', 'mid', 'low');
      const result = arr.toSorted((left: ToSortedRankItemTwo, right: ToSortedRankItemTwo): int => {
        return normalizeToSortedTwo(ranks.indexOf(left.name) - ranks.indexOf(right.name));
      });
      expect(result[0] === high).assertTrue();
      expect(result[1] === mid).assertTrue();
      expect(result[2] === low).assertTrue();
      expect(arr[0] === low).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_5800
     * @tc.name testArrayToSortedTwo058
     * @tc.desc Verify comparator can group mixed primitive values by type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string | number | boolean>('b', 2, false, 'a', 1, true);
      const result = arr.toSorted((left: string | number | boolean, right: string | number | boolean): int => {
        const leftType = typeof left;
        const rightType = typeof right;
        if (leftType !== rightType) {
          if (leftType === 'number') {
            return -1;
          }
          if (rightType === 'number') {
            return 1;
          }
          if (leftType === 'string') {
            return -1;
          }
          return 1;
        }
        return normalizeToSortedTwo(left.toString().localeCompare(right.toString()));
      });
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual('a');
      expect(result[3]).assertEqual('b');
      expect(result[4]).assertEqual(false);
      expect(result[5]).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_5900
     * @tc.name testArrayToSortedTwo059
     * @tc.desc Verify comparator sorting object references remains shallow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new ToSortedStableItemTwo();
      first.key = 2;
      first.id = 1;
      const second = new ToSortedStableItemTwo();
      second.key = 1;
      second.id = 2;
      const arr = new Array<ToSortedStableItemTwo>(first, second);
      const result = arr.toSorted((left: ToSortedStableItemTwo, right: ToSortedStableItemTwo): int => {
        return normalizeToSortedTwo(left.key - right.key);
      });
      expect(result[0] === second).assertTrue();
      expect(result[1] === first).assertTrue();
      result[0].id = 20;
      expect(second.id).assertEqual(20);
      expect(arr[0] === first).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_6000
     * @tc.name testArrayToSortedTwo060
     * @tc.desc Verify comparator sorting nested arrays uses inner values without deep copying
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const high = new Array<number>(9, 1);
      const low = new Array<number>(1, 9);
      const mid = new Array<number>(5, 5);
      const arr = new Array<Array<number>>(high, low, mid);
      const result = arr.toSorted((left: Array<number>, right: Array<number>): int => {
        return normalizeToSortedTwo(left[0] - right[0]);
      });
      expect(result[0] === low).assertTrue();
      expect(result[1] === mid).assertTrue();
      expect(result[2] === high).assertTrue();
      result[2][0] = 10;
      expect(high[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_6100
     * @tc.name testArrayToSortedTwo061
     * @tc.desc Verify nullish comparator handling orders null before numbers and undefined last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | null | undefined>(2, undefined, null, 1);
      const result = arr.toSorted((left: number | null | undefined, right: number | null | undefined): int => {
        if (left === null) {
          return right === null ? 0 : -1;
        }
        if (right === null) {
          return 1;
        }
        if (left === undefined || right === undefined) {
          return 0;
        }
        return normalizeToSortedTwo(left - right);
      });
      expect(result[0]).assertNull();
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(2);
      expect(result[3]).assertUndefined();
      expect(arr[1]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_6200
     * @tc.name testArrayToSortedTwo062
     * @tc.desc Verify comparator can order negative values by absolute magnitude while preserving the source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(-4, 1, -2, 3);
      const result = arr.toSorted((left: number, right: number): int => {
        const leftAbs = Math.abs(left);
        const rightAbs = Math.abs(right);
        if (leftAbs < rightAbs) {
          return -1;
        }
        if (leftAbs > rightAbs) {
          return 1;
        }
        return 0;
      });
      expect(result.toString()).assertEqual('1,-2,3,-4');
      expect(arr.toString()).assertEqual('-4,1,-2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_6300
     * @tc.name testArrayToSortedTwo063
     * @tc.desc Verify comparator can order string arrays by length and keep equal lengths stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('pear', 'fig', 'plum', 'kiwi');
      const result = arr.toSorted((left: string, right: string): int => {
        if (left.length < right.length) {
          return -1;
        }
        if (left.length > right.length) {
          return 1;
        }
        return 0;
      });
      expect(result.toString()).assertEqual('fig,pear,plum,kiwi');
      expect(arr.toString()).assertEqual('pear,fig,plum,kiwi');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_6400
     * @tc.name testArrayToSortedTwo064
     * @tc.desc Verify comparator sorting is stable for equal numeric key values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new ToSortedStableItemTwo();
      first.key = 2;
      first.id = 1;
      const second = new ToSortedStableItemTwo();
      second.key = 1;
      second.id = 2;
      const third = new ToSortedStableItemTwo();
      third.key = 2;
      third.id = 3;
      const arr = new Array<ToSortedStableItemTwo>(first, second, third);
      const result = arr.toSorted((left: ToSortedStableItemTwo, right: ToSortedStableItemTwo): int => {
        if (left.key < right.key) {
          return -1;
        }
        if (left.key > right.key) {
          return 1;
        }
        return 0;
      });
      expect(result[0] === second).assertTrue();
      expect(result[1] === first).assertTrue();
      expect(result[2] === third).assertTrue();
      expect(arr[0] === first).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_6500
     * @tc.name testArrayToSortedTwo065
     * @tc.desc Verify undefined elements are placed after ordinary values even with a comparator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(2, undefined, 1);
      const result = arr.toSorted((_left: number | undefined, _right: number | undefined): int => -1);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertUndefined();
      expect(arr.lastIndexOf(undefined)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_6600
     * @tc.name testArrayToSortedTwo066
     * @tc.desc Verify explicit undefined values are moved after comparator-sorted numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[0] = 2;
      arr[2] = 1;
      let callCount: int = 0;
      const result = arr.toSorted((left: number | undefined, right: number | undefined): int => {
        callCount++;
        if (left === undefined || right === undefined) {
          return -1;
        }
        return normalizeToSortedTwo(left - right);
      });
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertUndefined();
      expect(result.lastIndexOf(undefined)).assertEqual(2);
      expect(arr.lastIndexOf(undefined)).assertEqual(1);
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_6700
     * @tc.name testArrayToSortedTwo067
     * @tc.desc Verify an all-undefined dense array is returned without invoking the comparator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      let callCount: int = 0;
      const result = arr.toSorted((_left: number | undefined, _right: number | undefined): int => {
        callCount++;
        return 1;
      });
      expect(result.length).assertEqual(3);
      expect(result[0]).assertUndefined();
      expect(result[1]).assertUndefined();
      expect(result[2]).assertUndefined();
      expect(result.lastIndexOf(undefined)).assertEqual(2);
      expect(callCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_6800
     * @tc.name testArrayToSortedTwo068
     * @tc.desc Verify arrays containing only explicit undefined values do not call the comparator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(undefined, undefined);
      let callCount: int = 0;
      const result = arr.toSorted((_left: number | undefined, _right: number | undefined): int => {
        callCount++;
        return -1;
      });
      expect(result[0]).assertUndefined();
      expect(result[1]).assertUndefined();
      expect(result.lastIndexOf(undefined)).assertEqual(1);
      expect(callCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_6900
     * @tc.name testArrayToSortedTwo069
     * @tc.desc Verify null remains an ordinary comparable value before undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | null | undefined>(undefined, null);
      const result = arr.toSorted((_left: number | null | undefined, _right: number | null | undefined): int => 1);
      expect(result[0]).assertNull();
      expect(result[1]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_7000
     * @tc.name testArrayToSortedTwo070
     * @tc.desc Verify a zero comparator result preserves stable object order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new ToSortedStableItemTwo();
      first.key = 1;
      first.id = 1;
      const second = new ToSortedStableItemTwo();
      second.key = 1;
      second.id = 2;
      const arr = new Array<ToSortedStableItemTwo>(first, second);
      const result = arr.toSorted((_left: ToSortedStableItemTwo, _right: ToSortedStableItemTwo): int => 0);
      expect(result[0] === first).assertTrue();
      expect(result[1] === second).assertTrue();
      expect(result !== arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_7100
     * @tc.name testArrayToSortedTwo071
     * @tc.desc Verify short equal-key object runs keep stable relative order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<ToSortedStableItemTwo>();
      for (let i: int = 0; i < 10; i++) {
        const item = new ToSortedStableItemTwo();
        item.key = 1;
        item.id = i;
        arr.pushOne(item);
      }
      const result = arr.toSorted((left: ToSortedStableItemTwo, right: ToSortedStableItemTwo): int => {
        return normalizeToSortedTwo(left.key - right.key);
      });
      for (let i: int = 0; i < result.length; i++) {
        expect(result[i].id).assertEqual(i);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_7200
     * @tc.name testArrayToSortedTwo072
     * @tc.desc Verify longer equal-key object runs keep stable relative order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<ToSortedStableItemTwo>();
      for (let i: int = 0; i < 200; i++) {
        const item = new ToSortedStableItemTwo();
        item.key = 1;
        item.id = i;
        arr.pushOne(item);
      }
      const result = arr.toSorted((left: ToSortedStableItemTwo, right: ToSortedStableItemTwo): int => {
        return normalizeToSortedTwo(left.key - right.key);
      });
      expect(result[0].id).assertEqual(0);
      expect(result[99].id).assertEqual(99);
      expect(result[199].id).assertEqual(199);
      expect(result !== arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_7300
     * @tc.name testArrayToSortedTwo073
     * @tc.desc Verify mixed equal and descending keys are merged stably
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const equal0 = new ToSortedStableItemTwo();
      equal0.key = 1;
      equal0.id = 0;
      const high = new ToSortedStableItemTwo();
      high.key = 3;
      high.id = 3;
      const equal1 = new ToSortedStableItemTwo();
      equal1.key = 1;
      equal1.id = 1;
      const mid = new ToSortedStableItemTwo();
      mid.key = 2;
      mid.id = 2;
      const arr = new Array<ToSortedStableItemTwo>(equal0, high, equal1, mid);
      const result = arr.toSorted((left: ToSortedStableItemTwo, right: ToSortedStableItemTwo): int => {
        return normalizeToSortedTwo(left.key - right.key);
      });
      expect(result[0] === equal0).assertTrue();
      expect(result[1] === equal1).assertTrue();
      expect(result[2] === mid).assertTrue();
      expect(result[3] === high).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_7400
     * @tc.name testArrayToSortedTwo074
     * @tc.desc Verify comparator exceptions propagate while the original array stays intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 1, 3);
      let thrown = false;
      try {
        arr.toSorted((_left: number, _right: number): int => {
          throw new Error('stop');
        });
      } catch (e) {
        thrown = e.name === 'Error' && e.message === 'stop';
      }
      expect(thrown).assertTrue();
      expect(arr.toString()).assertEqual('2,1,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_7500
     * @tc.name testArrayToSortedTwo075
     * @tc.desc Verify mutating the source during comparison does not affect copied sort inputs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 1);
      let mutated = false;
      const result = arr.toSorted((left: number, right: number): int => {
        if (!mutated) {
          arr[0] = 9;
          mutated = true;
        }
        return normalizeToSortedTwo(left - right);
      });
      expect(result.toString()).assertEqual('1,2');
      expect(arr.toString()).assertEqual('9,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_7600
     * @tc.name testArrayToSortedTwo076
     * @tc.desc Verify pushing during comparison is ignored by the returned sorted copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 1);
      let pushed = false;
      const result = arr.toSorted((left: number, right: number): int => {
        if (!pushed) {
          arr.pushOne(3);
          pushed = true;
        }
        return normalizeToSortedTwo(left - right);
      });
      expect(result.toString()).assertEqual('1,2');
      expect(arr.toString()).assertEqual('2,1,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_7700
     * @tc.name testArrayToSortedTwo077
     * @tc.desc Verify truncating source length during comparison does not shorten the returned copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 2, 1);
      let truncated = false;
      const result = arr.toSorted((left: number, right: number): int => {
        if (!truncated) {
          arr.length = 0;
          truncated = true;
        }
        return normalizeToSortedTwo(left - right);
      });
      expect(result.toString()).assertEqual('1,2,3');
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_7800
     * @tc.name testArrayToSortedTwo078
     * @tc.desc Verify omitting the comparator uses default sorting rules
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 2, 1);
      const result = arr.toSorted();
      expect(result.toString()).assertEqual('1,10,2');
      expect(arr.toString()).assertEqual('10,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_7900
     * @tc.name testArrayToSortedTwo079
     * @tc.desc Verify comparator is called with exactly two ordered element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 1);
      let sawPair = false;
      const result = arr.toSorted((left: number, right: number): int => {
        sawPair = left === 1 && right === 2 || left === 2 && right === 1;
        return normalizeToSortedTwo(left - right);
      });
      expect(sawPair).assertTrue();
      expect(result.toString()).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_8000
     * @tc.name testArrayToSortedTwo080
     * @tc.desc Verify bigint values can be sorted with an explicit comparator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<bigint>(10n, 5n, 20n);
      const result = arr.toSorted((left: bigint, right: bigint): int => {
        if (left < right) {
          return -1;
        }
        if (left > right) {
          return 1;
        }
        return 0;
      });
      expect(result[0]).assertEqual(5n);
      expect(result[1]).assertEqual(10n);
      expect(result[2]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_8100
     * @tc.name testArrayToSortedTwo081
     * @tc.desc Verify comparator-based toSorted supports consecutive chained calls with different sort orders
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 1, 4, 2);
      const result = arr.toSorted(compareNumbersAscendingTwo).toSorted(compareNumbersDescendingTwo);
      expect(result.toString()).assertEqual('4,3,2,1');
      expect(arr.toString()).assertEqual('3,1,4,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_8200
     * @tc.name testArrayToSortedTwo082
     * @tc.desc Verify comparator-based toSorted works after narrowing an Any value back to Array<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const anyValue: Any = new Array<number>(3, 1, 2);
      expect(toSortedFromAnyNumberArrayTwo(anyValue)).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SORTED_TWO_8300
     * @tc.name testArrayToSortedTwo083
     * @tc.desc Verify comparator-based toSorted supports arrays whose element type is Any
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSortedTwo083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const anyArr = new Array<Any>(3, 1, 2);
      const result = anyArr.toSorted();
      expect(result.toString()).assertEqual('1,2,3');
      expect(anyArr.toString()).assertEqual('3,1,2');
    });
  });
}

