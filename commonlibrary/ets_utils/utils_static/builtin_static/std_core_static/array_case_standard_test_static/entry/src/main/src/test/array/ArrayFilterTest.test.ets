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

import {
  afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level,
  Size, TestType
} from '../../../../hypium/index';
import Utils from '../Util.test';

class FilterPerson008 {
  name: string = '';
  age: int = 0;
}

class FilterPerson026 {
  name: string = '';
  age: int = 0;
}

class FilterProduct044 {
  name: string = '';
  price: number = 0;
}

function filterIsString051(value: string | number): boolean {
  const valueType = Class.of(value).getName().split('.');
  return valueType[valueType.length - 1] == 'String';
}

export default function ArrayFilterTest(): void {
  describe('ArrayFilterTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_0100
     * @tc.name testArrayFilter001
     * @tc.desc Verify filter keeps matching numeric elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const result = arr.filter((v: number): boolean => v % 2 == 0);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_0200
     * @tc.name testArrayFilter002
     * @tc.desc Verify filter predicate receives value index and source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result = arr.filter((value: number, index: int, array: Array<number>): boolean => {
        const valueType = Class.of(value).getName().split('.');
        const indexType = Class.of(index).getName().split('.');
        expect(valueType[valueType.length - 1]).assertEqual('Double');
        expect(indexType[indexType.length - 1]).assertEqual('Int');
        expect(Array.isArray(array)).assertTrue();
        return value > 2;
      });
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(3);
      expect(result[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_0300
     * @tc.name testArrayFilter003
     * @tc.desc Verify filter can remove falsy zero values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(0, 1, 0, 2, 0, 3);
      const result = arr.filter((v: number): boolean => v != 0);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_0400
     * @tc.name testArrayFilter004
     * @tc.desc Verify empty arrays return empty filter results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      const result = arr.filter((v: number): boolean => v > 0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_0500
     * @tc.name testArrayFilter005
     * @tc.desc Verify filter does not modify the source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const original = arr.toString();
      const result = arr.filter((v: number): boolean => v > 2);
      expect(arr.toString()).assertEqual(original);
      expect(result.toString()).assertEqual('3,4,5');
      expect(result === arr).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_0600
     * @tc.name testArrayFilter006
     * @tc.desc Verify filter works with object arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p1 = new FilterPerson008();
      p1.name = 'Alice';
      p1.age = 25;
      const p2 = new FilterPerson008();
      p2.name = 'Bob';
      p2.age = 17;
      const arr = new Array<FilterPerson008>(p1, p2);
      const adults = arr.filter((p: FilterPerson008): boolean => p.age >= 18);
      expect(adults.length).assertEqual(1);
      expect(adults[0].name).assertEqual('Alice');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_0700
     * @tc.name testArrayFilter007
     * @tc.desc Verify filter can remove null values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | null>(1, null, 3, null, 5);
      const result = arr.filter((v: number | null): boolean => v != null);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(3);
      expect(result[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_0800
     * @tc.name testArrayFilter008
     * @tc.desc Verify filter can remove undefined values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(1, undefined, 3, undefined, 5);
      const result = arr.filter((v: number | undefined): boolean => v != undefined);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(3);
      expect(result[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_0900
     * @tc.name testArrayFilter009
     * @tc.desc Verify filter evaluates every element without short circuiting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count = 0;
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result = arr.filter((v: number): boolean => {
        count++;
        return v > 3;
      });
      expect(count).assertEqual(5);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_1000
     * @tc.name testArrayFilter010
     * @tc.desc Verify filtered results preserve source order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5, 1, 4, 2, 3);
      const result = arr.filter((v: number): boolean => v <= 3);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_1100
     * @tc.name testArrayFilter011
     * @tc.desc Verify filtered results preserve relative index order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c', 'd', 'e');
      const result = arr.filter((v: string, i: int): boolean => i % 2 == 0);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual('a');
      expect(result[1]).assertEqual('c');
      expect(result[2]).assertEqual('e');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_1200
     * @tc.name testArrayFilter012
     * @tc.desc Verify filtering an empty array returns an empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      const result = arr.filter((v: number): boolean => true);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_1300
     * @tc.name testArrayFilter013
     * @tc.desc Verify filtering a single-element array handles both match and miss
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5);
      const result1 = arr.filter((v: number): boolean => v > 3);
      expect(result1.length).assertEqual(1);
      expect(result1[0]).assertEqual(5);

      const result2 = arr.filter((v: number): boolean => v > 10);
      expect(result2.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_1400
     * @tc.name testArrayFilter014
     * @tc.desc Verify filter does not modify source length or first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const originalLength = arr.length;
      const originalFirst = arr[0];
      const result = arr.filter((v: number): boolean => v > 2);
      expect(arr.length).assertEqual(originalLength);
      expect(arr[0]).assertEqual(originalFirst);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_1500
     * @tc.name testArrayFilter015
     * @tc.desc Verify filter returns a new array reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.filter((v: number): boolean => v > 1);
      expect(result == arr).assertFalse();
      expect(arr.length).assertEqual(3);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_1600
     * @tc.name testArrayFilter016
     * @tc.desc Verify source mutations inside the predicate are observable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const result = arr.filter((v: number, i: int, a: Array<number>): boolean => {
        if (i == 0) {
          a.pushOne(100);
        }
        return v > 2;
      });
      expect(arr.length).assertEqual(5);
      expect(arr[4]).assertEqual(100);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(3);
      expect(result[1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_1700
     * @tc.name testArrayFilter017
     * @tc.desc Verify filter works with number arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result = arr.filter((v: number): boolean => v % 2 == 0);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_1800
     * @tc.name testArrayFilter018
     * @tc.desc Verify filter works with string arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('apple', 'banana', 'cherry', 'date');
      const result = arr.filter((s: string): boolean => s.length > 5);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual('banana');
      expect(result[1]).assertEqual('cherry');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_1900
     * @tc.name testArrayFilter019
     * @tc.desc Verify filter works with boolean arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, false, true, true, false);
      const result = arr.filter((v: boolean): boolean => v);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertTrue();
      expect(result[1]).assertTrue();
      expect(result[2]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_2000
     * @tc.name testArrayFilter020
     * @tc.desc Verify filter works with char arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<char>(c'A', c'B', c'C', c'D', c'E');
      const result = arr.filter((c: char): boolean => c >= c'C');
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(c'C');
      expect(result[2]).assertEqual(c'E');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_2100
     * @tc.name testArrayFilter021
     * @tc.desc Verify filter works with object arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p1 = new FilterPerson026();
      p1.name = 'Alice';
      p1.age = 25;
      const p2 = new FilterPerson026();
      p2.name = 'Bob';
      p2.age = 17;
      const arr = new Array<FilterPerson026>();
      arr.push(p1, p2);
      const adults = arr.filter((p: FilterPerson026): boolean => p.age >= 18);
      expect(adults.length).assertEqual(1);
      expect(adults[0].name).assertEqual('Alice');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_2200
     * @tc.name testArrayFilter022
     * @tc.desc Verify filter removes NaN values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, NaN, 3, 4, NaN);
      const result = arr.filter((v: number): boolean => !Number.isNaN(v));
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(3);
      expect(result[2]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_2300
     * @tc.name testArrayFilter023
     * @tc.desc Verify filter removes empty strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', '', 'b', '', 'c');
      const result = arr.filter((v: string): boolean => v.length > 0);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual('a');
      expect(result[2]).assertEqual('c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_2400
     * @tc.name testArrayFilter024
     * @tc.desc Verify filter can keep values by index rule
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 40, 50);
      const result = arr.filter((v: number, i: int): boolean => i % 2 == 0);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(30);
      expect(result[2]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_2500
     * @tc.name testArrayFilter025
     * @tc.desc Verify filter can keep values in an index range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
      const result = arr.filter((v: number, i: int): boolean => i >= 3 && i <= 6);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(4);
      expect(result[3]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_2600
     * @tc.name testArrayFilter026
     * @tc.desc Verify filter can use the source array length in its predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result = arr.filter((v: number, i: int, a: Array<number>): boolean => i < a.length - 2);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_2700
     * @tc.name testArrayFilter027
     * @tc.desc Verify filter can be chained before map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5, 6);
      const result = arr.filter((v: number): boolean => v % 2 == 0)
        .map((v: number): number => v * 2);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(4);
      expect(result[1]).assertEqual(8);
      expect(result[2]).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_2800
     * @tc.name testArrayFilter028
     * @tc.desc Verify map results can be filtered afterward
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result = arr.map((v: number): number => v * 2)
        .filter((v: number): boolean => v > 5);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(6);
      expect(result[2]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_2900
     * @tc.name testArrayFilter029
     * @tc.desc Verify multiple filter calls can be chained
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
      const result = arr.filter((v: number): boolean => v % 2 == 0)
        .filter((v: number): boolean => v > 5);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(6);
      expect(result[1]).assertEqual(8);
      expect(result[2]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_3000
     * @tc.name testArrayFilter030
     * @tc.desc Verify filter differs from find by returning all matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const filtered = arr.filter((v: number): boolean => v > 2);
      const found = arr.find((v: number): boolean => v > 2);
      expect(filtered.length).assertEqual(3);
      expect(found).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_3100
     * @tc.name testArrayFilter031
     * @tc.desc Verify filter differs from some by returning elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const filtered = arr.filter((v: number): boolean => v > 2);
      const hasMatch = arr.some((v: number): boolean => v > 2);
      expect(filtered.length).assertEqual(3);
      expect(hasMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_3200
     * @tc.name testArrayFilter032
     * @tc.desc Verify filter differs from every by not requiring all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const filtered = arr.filter((v: number): boolean => v > 2);
      const allGreaterThanTwo = arr.every((v: number): boolean => v > 2);
      expect(filtered.length).assertEqual(3);
      expect(allGreaterThanTwo).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_3300
     * @tc.name testArrayFilter033
     * @tc.desc Verify filter traverses a large array and returns matching values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      for (let i = 0; i < 10; i++) {
        arr.pushOne(i);
      }
      const result = arr.filter((v: number): boolean => v % 2 == 0);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_3400
     * @tc.name testArrayFilter034
     * @tc.desc Verify filter does not short circuit its traversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count = 0;
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result = arr.filter((v: number): boolean => {
        count++;
        return v > 2;
      });
      expect(count).assertEqual(5);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_3500
     * @tc.name testArrayFilter035
     * @tc.desc Verify filter can keep matching data records
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const p1 = new FilterProduct044();
      p1.name = 'Apple';
      p1.price = 5;
      const p2 = new FilterProduct044();
      p2.name = 'Banana';
      p2.price = 2;
      const products = new Array<FilterProduct044>();
      products.push(p1, p2);
      const expensive = products.filter((p: FilterProduct044): boolean => p.price > 3);
      expect(expensive.length).assertEqual(1);
      expect(expensive[0].name).assertEqual('Apple');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_3600
     * @tc.name testArrayFilter036
     * @tc.desc Verify filter can narrow search results by suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const users = new Array<string>('alice@example.com', 'bob@test.com', 'charlie@example.com');
      const exampleUsers = users.filter((email: string): boolean => email.endsWith('@example.com'));
      expect(exampleUsers.length).assertEqual(2);
      expect(exampleUsers[0]).assertEqual('alice@example.com');
      expect(exampleUsers[1]).assertEqual('charlie@example.com');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_3700
     * @tc.name testArrayFilter037
     * @tc.desc Verify filter can remove null and undefined values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | null | undefined>(1, null, 2, undefined, 3, null, 4);
      const valid = arr.filter((v: number | null | undefined): boolean => v != null);
      expect(valid.length).assertEqual(4);
      expect(valid[0]).assertEqual(1);
      expect(valid[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_3800
     * @tc.name testArrayFilter038
     * @tc.desc Verify filter supports concise arrow functions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result = arr.filter((v: number): boolean => v > 3);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(4);
      expect(result[1]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_3900
     * @tc.name testArrayFilter039
     * @tc.desc Verify filter supports block arrow functions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result = arr.filter((v: number): boolean => {
        const doubled = v * 2;
        return doubled > 5;
      });
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(3);
      expect(result[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_4000
     * @tc.name testArrayFilter040
     * @tc.desc Verify filter supports traditional function predicates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result = arr.filter((v: number): boolean => {
        return v % 2 == 0;
      });
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_4100
     * @tc.name testArrayFilter041
     * @tc.desc Verify filter can keep only numeric members from a union array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string | number>(1, 'two', 3, 'four', 5);
      const numbers = arr.filter((v: string | number): boolean => {
        const valueType = Class.of(v).getName().split('.');
        return valueType[valueType.length - 1] == 'Double';
      });
      expect(numbers.length).assertEqual(3);
      expect(numbers[0]).assertEqual(1);
      expect(numbers[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_4200
     * @tc.name testArrayFilter042
     * @tc.desc Verify filter can use a helper predicate function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string | number>(1, 'hello', 2, 'world');
      const strings = arr.filter(filterIsString051);
      expect(strings.length).assertEqual(2);
      expect(strings[0]).assertEqual('hello');
      expect(strings[1]).assertEqual('world');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_4300
     * @tc.name testArrayFilter043
     * @tc.desc Verify filter handles numeric boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(
        Number.MAX_VALUE,
        Number.MIN_VALUE,
        Number.MAX_SAFE_INTEGER,
        0,
        -0
      );
      const result = arr.filter((v: number): boolean => v > Number.MIN_VALUE);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(Number.MAX_VALUE);
      expect(result[1]).assertEqual(Number.MAX_SAFE_INTEGER);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_4400
     * @tc.name testArrayFilter044
     * @tc.desc Verify filter handles string boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const longText = 'very long string value';
      const arr = new Array<string>('', '\u0000', 'a', longText);
      const result = arr.filter((s: string): boolean => s.length > 0);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual('\u0000');
      expect(result[2]).assertEqual(longText);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_4500
     * @tc.name testArrayFilter045
     * @tc.desc Verify filter works with ReadonlyArray inputs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = [1, 2, 3, 4, 5];
      const arr: ReadonlyArray<Int> = source;
      const result = arr.filter((v: Int): boolean => v > 2);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(3);
      expect(result[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_4600
     * @tc.name testArrayFilter046
     * @tc.desc Verify filter skips holes and keeps sparse array values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<number>();
      arr[0] = 1;
      arr[2] = 3;
      arr[4] = 5;
      const result = arr.filter((v: number): boolean => v > 0);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(3);
      expect(result[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_4700
     * @tc.name testArrayFilter047
     * @tc.desc Verify predicate side effects do not change filter results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const logs = new Array<number>();
      const result = arr.filter((v: number): boolean => {
        logs.pushOne(v);
        return v > 2;
      });
      expect(result.length).assertEqual(2);
      expect(logs.length).assertEqual(4);
      expect(logs[0]).assertEqual(1);
      expect(logs[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_4800
     * @tc.name testArrayFilter048
     * @tc.desc Verify filter can update an external counter in the predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      let count = 0;
      const result = arr.filter((v: number): boolean => {
        count++;
        return v > 3;
      });
      expect(count).assertEqual(5);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_4900
     * @tc.name testArrayFilter049
     * @tc.desc Verify filter supports combined conditions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
      const result = arr.filter((v: number): boolean => v > 3 && v < 8);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(4);
      expect(result[3]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_5000
     * @tc.name testArrayFilter050
     * @tc.desc Verify filter supports ternary expressions in the predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result = arr.filter((v: number): boolean => v % 2 == 0 ? true : v > 3);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_5100
     * @tc.name testArrayFilter051
     * @tc.desc Verify filter matches an equivalent for loop result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result1 = arr.filter((v: number): boolean => v > 2);
      const result2 = new Array<number>();
      for (let i = 0; i < arr.length; i++) {
        if (arr[i] > 2) {
          result2.pushOne(arr[i]);
        }
      }
      expect(result1.length).assertEqual(result2.length);
      expect(result1.toString()).assertEqual(result2.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_5200
     * @tc.name testArrayFilter052
     * @tc.desc Verify filter cannot stop early once traversal starts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      let callCount = 0;
      const result = arr.filter((v: number): boolean => {
        callCount++;
        return v > 2;
      });
      expect(callCount).assertEqual(5);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILTER_5300
     * @tc.name testArrayFilter053
     * @tc.desc Verify filter can handle large datasets
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFilter053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      for (let i = 0; i < 100000; i++) {
        arr.pushOne(i);
      }
      const result = arr.filter((v: number): boolean => v % 100 == 0);
      expect(result.length).assertEqual(1000);
      expect(result[0]).assertEqual(0);
      expect(result[999]).assertEqual(99900);
    });
  });
}
