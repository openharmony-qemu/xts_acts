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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../Util.test';

class Person009 {
    name: string;
    age: int;
    constructor(name: string, age: int) {
      this.name = name;
      this.age = age;
    }
  }

class Item020 {
    id: int;
    name: string;
    constructor(id: int, name: string) {
      this.id = id;
      this.name = name;
    }
  }

interface Container021Item {
  value: int;
}

class Container021 {
    item: Container021Item;
    constructor(value: int) {
      this.item = { value: value };
    }
  }

class NullableItem022 {
    id: int | null;
    constructor(id: int | null) {
      this.id = id;
    }
  }

class Item034 {
    value: int;
    constructor(value: int) {
      this.value = value;
    }
  }

class StableItem038 {
    id: int;
    value: int;
    constructor(id: int, value: int) {
      this.id = id;
      this.value = value;
    }
  }

export default function SparseArrayToSortedTest(): void {
  describe('SparseArrayToSortedTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SORTED_0100
     * @tc.name testSparseArrayToSorted001
     * @tc.desc toSorted ascending on [5,6,4], verify sorted order [4,5,6] without mutating original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSorted001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5, 6, 4);
        const sorted = arr.toSorted((x: int, y: int): int => x - y);
        expect(sorted[0]).assertEqual(4);
        expect(sorted[1]).assertEqual(5);
        expect(sorted[2]).assertEqual(6);
        expect(arr[0]).assertEqual(5);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SORTED_0200
     * @tc.name testSparseArrayToSorted002
     * @tc.desc Test SparseArray.toSorted, verify method result (sorted[0] equals 3, sorted[1] equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSorted002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(3, 1);
        const sorted = arr.toSorted((a: int, b: int): int => 1);
        expect(sorted[0]).assertEqual(3);
        expect(sorted[1]).assertEqual(1);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SORTED_0300
     * @tc.name testSparseArrayToSorted003
     * @tc.desc Test SparseArray.toSorted, verify method result (sorted[0] equals 1, sorted[1] equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSorted003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(3, 1);
        const sorted = arr.toSorted((a: int, b: int): int => -1);
        expect(sorted[0]).assertEqual(1);
        expect(sorted[1]).assertEqual(3);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SORTED_0400
     * @tc.name testSparseArrayToSorted004
     * @tc.desc Test SparseArray.toSorted, verify method result (sorted[0] equals 3, sorted[1] equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSorted004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(3, 1, 2);
        const sorted = arr.toSorted((a: int, b: int): int => 0);
        expect(sorted[0]).assertEqual(3);
        expect(sorted[1]).assertEqual(1);
        expect(sorted[2]).assertEqual(2);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SORTED_0500
     * @tc.name testSparseArrayToSorted005
     * @tc.desc Test SparseArray.toSorted, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSorted005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5, 2, 8, 1, 9);
        const sorted = arr.toSorted((a: int, b: int): int => a - b);
        expect(sorted.toString()).assertEqual("1,2,5,8,9");

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SORTED_0600
     * @tc.name testSparseArrayToSorted006
     * @tc.desc Test SparseArray.toSorted, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSorted006', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5, 2, 8, 1, 9);
        const sorted = arr.toSorted((a: int, b: int): int => b - a);
        expect(sorted.toString()).assertEqual("9,8,5,2,1");

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SORTED_0700
     * @tc.name testSparseArrayToSorted007
     * @tc.desc Test SparseArray.toSorted, verify method result (sorted[0] equals 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSorted007', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(3, 1, 4, 1, 5);
        const sorted = arr.toSorted((a: int, b: int): int => {
          if (a % 2 === 0 && b % 2 === 0) {
            return a - b;
          }
          if (a % 2 === 0) {
            return -1;
          }
          if (b % 2 === 0) {
            return 1;
          }
          return a - b;
        });
        expect(sorted[0]).assertEqual(4);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SORTED_0800
     * @tc.name testSparseArrayToSorted008
     * @tc.desc Test SparseArray.toSorted, verify method result (sorted[0] equals "apple", sorted[2] equals "cherry")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSorted008', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("banana", "apple", "cherry");
        const sorted = arr.toSorted((a: string, b: string): int => a.localeCompare(b) as int);
        expect(sorted[0]).assertEqual("apple");
        expect(sorted[2]).assertEqual("cherry");

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SORTED_0900
     * @tc.name testSparseArrayToSorted009
     * @tc.desc Test SparseArray.toSorted, verify method result (s0 != null && s2 != null is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSorted009', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<Person009>(
          new Person009("Alice", 30),
          new Person009("Bob", 25),
          new Person009("Charlie", 35)
        );
        const sorted = arr.toSorted((a: Person009, b: Person009): int => a.age - b.age);
        const s0 = sorted[0];
        const s2 = sorted[2];
        expect(s0 != null && s2 != null).assertTrue();
        expect((s0 as Person009).name).assertEqual("Bob");
        expect((s2 as Person009).name).assertEqual("Charlie");

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SORTED_1000
     * @tc.name testSparseArrayToSorted010
     * @tc.desc Test SparseArray.toSorted, verify method result (sorted[0] equals 1, sorted[1] equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSorted010', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(3, 1);
        const sorted = arr.toSorted((a: int, b: int): int => a - b);
        expect(sorted[0]).assertEqual(1);
        expect(sorted[1]).assertEqual(3);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SORTED_1100
     * @tc.name testSparseArrayToSorted011
     * @tc.desc Test SparseArray.toSorted, verify method result (sorted[0] equals -5, sorted[4] equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSorted011', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(-3, 1, -5, 2, 0);
        const sorted = arr.toSorted((a: int, b: int): int => a - b);
        expect(sorted[0]).assertEqual(-5);
        expect(sorted[4]).assertEqual(2);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SORTED_1200
     * @tc.name testSparseArrayToSorted012
     * @tc.desc Test SparseArray.toSorted, verify method result (sorted[0] equals -1, sorted[4] equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSorted012', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(0, 1, 0, -1, 0);
        const sorted = arr.toSorted((a: int, b: int): int => a - b);
        expect(sorted[0]).assertEqual(-1);
        expect(sorted[4]).assertEqual(1);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SORTED_1300
     * @tc.name testSparseArrayToSorted013
     * @tc.desc Test SparseArray.toSorted, verify method result (sorted[0] equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSorted013', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(2147483647, 1, 100, 2147483647);
        const sorted = arr.toSorted((a: int, b: int): int => a - b);
        expect(sorted[0]).assertEqual(1);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SORTED_1400
     * @tc.name testSparseArrayToSorted014
     * @tc.desc Test SparseArray.toSorted, verify method result (sorted[0] equals -10, sorted[1] equals -1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSorted014', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(-10, -1, 0);
        const sorted = arr.toSorted((a: int, b: int): int => a - b);
        expect(sorted[0]).assertEqual(-10);
        expect(sorted[1]).assertEqual(-1);
        expect(sorted[2]).assertEqual(0);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SORTED_1500
     * @tc.name testSparseArrayToSorted015
     * @tc.desc Test SparseArray.toSorted, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSorted015', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(3, 1, 3, 2, 1);
        const sorted = arr.toSorted((a: int, b: int): int => a - b);
        expect(sorted.toString()).assertEqual("1,1,2,3,3");

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SORTED_1600
     * @tc.name testSparseArrayToSorted016
     * @tc.desc Test SparseArray.toSorted, verify string sort result with ASCII elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSorted016', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("test", "abc", "123", "local");
        const sorted = arr.toSorted((a: string, b: string): int => a.localeCompare(b) as int);
        expect(sorted[0]).assertEqual("123");
        expect(sorted[3]).assertEqual("test");

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SORTED_1700
     * @tc.name testSparseArrayToSorted017
     * @tc.desc Test SparseArray.toSorted, verify method result (sorted[0] equals "")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSorted017', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("", "a", "", "b");
        const sorted = arr.toSorted((a: string, b: string): int => a.localeCompare(b) as int);
        expect(sorted[0]).assertEqual("");

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SORTED_1800
     * @tc.name testSparseArrayToSorted018
     * @tc.desc Test SparseArray.toSorted, verify method result (sorted[0] equals longStr)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSorted018', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let longStr = "a".repeat(10000);
        const arr = new SparseArray<string>(longStr, "z", longStr);
        const sorted = arr.toSorted((a: string, b: string): int => a.localeCompare(b) as int);
        expect(sorted[0]).assertEqual(longStr);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SORTED_1900
     * @tc.name testSparseArrayToSorted019
     * @tc.desc Test SparseArray.toSorted, verify method result (sorted[0] equals "!hello", sorted[2] equals "#test")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSorted019', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("!hello", "@world", "#test");
        const sorted = arr.toSorted((a: string, b: string): int => a.localeCompare(b) as int);
        expect(sorted[0]).assertEqual("!hello");
        expect(sorted[2]).assertEqual("#test");

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SORTED_2000
     * @tc.name testSparseArrayToSorted020
     * @tc.desc Test SparseArray.toSorted, verify object id order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSorted020', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<Item020>(
          new Item020(3, "C"),
          new Item020(1, "A"),
          new Item020(2, "B")
        );
        const sorted = arr.toSorted((a: Item020, b: Item020): int => a.id - b.id);
        const head = sorted[0] as Item020;
        expect(head.id).assertEqual(1);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SORTED_2100
     * @tc.name testSparseArrayToSorted021
     * @tc.desc Test SparseArray.toSorted, verify nested object value order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSorted021', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<Container021>(
          new Container021(3),
          new Container021(1),
          new Container021(2)
        );
        const sorted = arr.toSorted((a: Container021, b: Container021): int => a.item.value - b.item.value);
        const head = sorted[0] as Container021;
        expect(head.item.value).assertEqual(1);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SORTED_2200
     * @tc.name testSparseArrayToSorted022
     * @tc.desc Test SparseArray.toSorted with nullable object field, verify sorted length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSorted022', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<NullableItem022>(
          new NullableItem022(3),
          new NullableItem022(null),
          new NullableItem022(1)
        );
        const sorted = arr.toSorted((a: NullableItem022, b: NullableItem022): int => {
          const valA = a.id ?? -1;
          const valB = b.id ?? -1;
          return valA - valB;
        });
        expect(sorted.length).assertEqual(3);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SORTED_2300
     * @tc.name testSparseArrayToSorted023
     * @tc.desc Test SparseArray.toSorted, verify method result (sorted.length equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSorted023', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        const sorted = arr.toSorted((a: int, b: int): int => a - b);
        expect(sorted.length).assertEqual(0);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SORTED_2400
     * @tc.name testSparseArrayToSorted024
     * @tc.desc toSorted on length-5 sparse array (all holes), undefined-safe comparator, verify sorted.length equals 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSorted024', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5);
        const sorted = arr.toSorted((a: int | undefined, b: int | undefined): int => {
          if (a === undefined) {
            return 1;
          }
          if (b === undefined) {
            return -1;
          }
          return a - b;
        });
        expect(sorted.length).assertEqual(5);
        expect(sorted.toString()).assertEqual(",,,,");

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SORTED_2500
     * @tc.name testSparseArrayToSorted025
     * @tc.desc toSorted on sparse array with holes at [2]=10 [4]=20, undefined-safe comparator, verify sorted order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSorted025', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5);
        arr[2] = 10;
        arr[4] = 20;
        const sorted = arr.toSorted((a: int | undefined, b: int | undefined): int => {
          if (a === undefined) {
            return 1;
          }
          if (b === undefined) {
            return -1;
          }
          return a - b;
        });
        expect(sorted.toString()).assertEqual(",,10,,20");

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SORTED_2600
     * @tc.name testSparseArrayToSorted026
     * @tc.desc Test SparseArray.toSorted, verify method result (arr.length equals originalLength, arr[0] equals originalFirst)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSorted026', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(3, 1, 4, 1, 5);
        const originalLength = arr.length;
        const originalFirst = arr[0];
        const sorted = arr.toSorted((a: int, b: int): int => a - b);
        expect(arr.length).assertEqual(originalLength);
        expect(arr[0]).assertEqual(originalFirst);
        expect(sorted.length).assertEqual(5);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SORTED_2700
     * @tc.name testSparseArrayToSorted027
     * @tc.desc Test SparseArray.toSorted, verify sorted result length and first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSorted027', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(3, 1, 4);
        const sorted = arr.toSorted((a: int, b: int): int => a - b);
        expect(sorted.length).assertEqual(3);
        expect(sorted[0]).assertEqual(1);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SORTED_2800
     * @tc.name testSparseArrayToSorted028
     * @tc.desc Test SparseArray.toSorted ascending on [3,1,4,1,5]: full sorted order and sorted.length equals 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSorted028', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(3, 1, 4, 1, 5);
        const sorted = arr.toSorted((a: int, b: int): int => a - b);
        expect(sorted[0]).assertEqual(1);
        expect(sorted.length).assertEqual(5);

        expect(sorted[1]).assertEqual(1);
        expect(sorted[2]).assertEqual(3);
        expect(sorted[3]).assertEqual(4);
        expect(sorted[4]).assertEqual(5);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SORTED_2900
     * @tc.name testSparseArrayToSorted029
     * @tc.desc Test SparseArray.toSorted, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSorted029', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(3, 1, 4, 1, 5);
        const sorted = arr.toSorted((a: int, b: int): int => a - b);
        expect(arr.toString()).assertEqual("3,1,4,1,5");
        expect(sorted.toString()).assertEqual("1,1,3,4,5");

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SORTED_3000
     * @tc.name testSparseArrayToSorted030
     * @tc.desc Test SparseArray.toSorted, verify first sorted element equals 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSorted030', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(3, 1, 4);
        const sorted = arr.toSorted((a: int, b: int): int => a - b);
        expect(sorted[0]).assertEqual(1);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SORTED_3100
     * @tc.name testSparseArrayToSorted031
     * @tc.desc Test SparseArray.toSorted, verify method result (sorted === arr is false, arr[0] equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSorted031', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(3, 1, 4);
        const sorted = arr.toSorted((a: int, b: int): int => a - b);
        expect(sorted === arr).assertFalse();
        sorted[0] = 100;
        expect(arr[0]).assertEqual(3);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SORTED_3200
     * @tc.name testSparseArrayToSorted032
     * @tc.desc Test SparseArray.toSorted, verify method result (sorted[0] equals 1, sorted[999] equals 1000)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSorted032', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        for (let i = 0; i < 1000; i++) {
          arr.push(1000 - i);
        }
        const sorted = arr.toSorted((a: int, b: int): int => a - b);
        expect(sorted[0]).assertEqual(1);
        expect(sorted[999]).assertEqual(1000);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SORTED_3300
     * @tc.name testSparseArrayToSorted033
     * @tc.desc Test SparseArray.toSorted, verify method result (sorted[0] equals -100, sorted[4] equals 2147483647)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSorted033', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(
          2147483647,
          -100,
          0,
          -1,
          1
        );
        const sorted = arr.toSorted((a: int, b: int): int => {
          if (a < b) {
            return -1;
          }
          if (a > b) {
            return 1;
          }
          return 0;
        });
        expect(sorted[0]).assertEqual(-100);
        expect(sorted[4]).assertEqual(2147483647);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SORTED_3400
     * @tc.name testSparseArrayToSorted034
     * @tc.desc Test SparseArray.to Sorted error path, verify expected exception is thrown (assertFail is triggered, error.name equals "Error")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSorted034', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        try {
          const arr = new SparseArray<Item034>(new Item034(1), new Item034(2));
          arr.toSorted((a: Item034, b: Item034): int => {
            throw new Error("Comparator error");
          });
          expect().assertFail();
        } catch (error) {
          expect((error as Error).name).assertEqual("Error");
        }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SORTED_3500
     * @tc.name testSparseArrayToSorted035
     * @tc.desc Test SparseArray.toSorted comparator throws Error, verify error message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSorted035', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(3, 1, 4);
        try {
          arr.toSorted((a: int, b: int): int => {
            throw new Error("Test error");
          });
          expect().assertFail();
        } catch (error) {
          const caughtError = error as Error;
          expect(caughtError.message).assertEqual("Test error");
        }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SORTED_3600
     * @tc.name testSparseArrayToSorted036
     * @tc.desc Test SparseArray.toSorted, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSorted036', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr1 = new SparseArray<int>(3, 1, 4);
        const arr2 = new SparseArray<int>(3, 1, 4);
        const sorted = arr1.toSorted((a: int, b: int): int => a - b);
        arr2.sort((a: int, b: int): int => a - b);
        expect(arr1.toString()).assertEqual("3,1,4");
        expect(arr2.toString()).assertEqual("1,3,4");
        expect(sorted.toString()).assertEqual("1,3,4");

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SORTED_3700
     * @tc.name testSparseArrayToSorted037
     * @tc.desc Test SparseArray.toSorted returns new sorted array while sort mutates source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSorted037', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr1 = new SparseArray<int>(3, 1, 4);
        const arr2 = new SparseArray<int>(3, 1, 4);
        const sorted = arr1.toSorted((a: int, b: int): int => a - b);
        const sorted2 = arr2.sort((a: int, b: int): int => a - b);
        expect(sorted === arr1).assertFalse();
        expect(sorted.toString()).assertEqual("1,3,4");
        expect(sorted2.toString()).assertEqual("1,3,4");
        expect(arr2.toString()).assertEqual("1,3,4");

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SORTED_3800
     * @tc.name testSparseArrayToSorted038
     * @tc.desc Test SparseArray.toSorted keeps stable order for equal comparator values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSorted038', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<StableItem038>(
          new StableItem038(1, 3),
          new StableItem038(2, 1),
          new StableItem038(3, 1),
          new StableItem038(4, 2)
        );
        const sorted = arr.toSorted((a: StableItem038, b: StableItem038): int => a.value - b.value);
        const s1 = sorted[1] as StableItem038;
        const s2 = sorted[2] as StableItem038;
        expect(s1.id).assertEqual(3);
        expect(s2.id).assertEqual(4);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SORTED_3900
     * @tc.name testSparseArrayToSorted039
     * @tc.desc Test SparseArray.toSorted on deterministic 100 element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSorted039', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        for (let i: int = 0; i < 100; i++) {
          arr.push(100 - i);
        }
        const sorted = arr.toSorted((a: int, b: int): int => a - b);
        expect(sorted.length).assertEqual(100);
        expect(sorted[0]).assertEqual(1);
        expect(sorted[99]).assertEqual(100);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SORTED_4000
     * @tc.name testSparseArrayToSorted040
     * @tc.desc Test SparseArray.toSorted, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSorted040', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5, 2, 8, 1, 9);
        const sorted1 = arr.toSorted((a: int, b: int): int => a - b);
        const sorted2 = sorted1.toSorted((a: int, b: int): int => b - a);
        expect(sorted2.toString()).assertEqual("9,8,5,2,1");

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SORTED_4100
     * @tc.name testSparseArrayToSorted041
     * @tc.desc Test SparseArray.toSorted, verify method result (filtered.length equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSorted041', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5, 2, 8, 1, 9);
        const sorted = arr.toSorted((a: int, b: int): int => a - b);
        const filtered = sorted.filter((v: int): boolean => v > 3);
        expect(filtered.length).assertEqual(3);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SORTED_4200
     * @tc.name testSparseArrayToSorted042
     * @tc.desc toSorted on SparseArray<float> returns ascending float order without mutating source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSorted042', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<float>(3.0f, 1.0f, 2.0f);
        const sorted = arr.toSorted((a: float, b: float): int => {
          if (a < b) {
            return -1;
          }
          if (a > b) {
            return 1;
          }
          return 0;
        });
        expect(arr[0]).assertEqual(3.0f);
        expect(sorted[0]).assertEqual(1.0f);
        expect(sorted[2]).assertEqual(3.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SORTED_4300
     * @tc.name testSparseArrayToSorted043
     * @tc.desc toSorted orders 0x7 0b10 0x3 literals ascending without mutating source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSorted043', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(0x7, 0b10, 0x3, 1);
        const sorted = arr.toSorted((a: int, b: int): int => {
          if (a < b) {
            return -1;
          }
          if (a > b) {
            return 1;
          }
          return 0;
        });
        expect(arr[0]).assertEqual(0x7);
        expect(sorted[0]).assertEqual(1);
        expect(sorted[1]).assertEqual(0b10);
        expect(sorted[2]).assertEqual(0x3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SORTED_4400
     * @tc.name testSparseArrayToSorted044
     * @tc.desc toSorted on SparseArray<boolean> orders false before true without mutating source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSorted044', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<boolean>(true, false, true);
        const sorted = arr.toSorted((a: boolean, b: boolean): int => {
          if (a === b) {
            return 0;
          }
          if (!a && b) {
            return -1;
          }
          return 1;
        });
        expect(arr[0]).assertTrue();
        expect(sorted[0]).assertFalse();
        expect(sorted[1]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SORTED_4500
     * @tc.name testSparseArrayToSorted045
     * @tc.desc toSorted on SparseArray<byte> orders byte boundary values ascending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSorted045', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<byte>(127 as byte, 0 as byte, (-128 as byte));
        const sorted = arr.toSorted((a: byte, b: byte): int => {
          if (a < b) {
            return -1;
          }
          if (a > b) {
            return 1;
          }
          return 0;
        });
        expect(arr[0]).assertEqual(127 as byte);
        expect(sorted[0]).assertEqual(-128 as byte);
        expect(sorted[2]).assertEqual(127 as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SORTED_4600
     * @tc.name testSparseArrayToSorted046
     * @tc.desc toSorted on SparseArray<short> orders short values ascending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSorted046', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<short>(300 as short, 100 as short, 200 as short);
        const sorted = arr.toSorted((a: short, b: short): int => {
          if (a < b) {
            return -1;
          }
          if (a > b) {
            return 1;
          }
          return 0;
        });
        expect(sorted[0]).assertEqual(100 as short);
        expect(sorted[2]).assertEqual(300 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SORTED_4700
     * @tc.name testSparseArrayToSorted047
     * @tc.desc toSorted on SparseArray<long> orders long values ascending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSorted047', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<long>(30000000000 as long, 10000000000 as long, 20000000000 as long);
        const sorted = arr.toSorted((a: long, b: long): int => {
          if (a < b) {
            return -1;
          }
          if (a > b) {
            return 1;
          }
          return 0;
        });
        expect(arr[0]).assertEqual(30000000000 as long);
        expect(sorted[0]).assertEqual(10000000000 as long);
        expect(sorted[2]).assertEqual(30000000000 as long);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SORTED_4800
     * @tc.name testSparseArrayToSorted048
     * @tc.desc toSorted on SparseArray<double> orders double values ascending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSorted048', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<double>(3.75, 1.25, 2.5);
        const sorted = arr.toSorted((a: double, b: double): int => {
          if (a < b) {
            return -1;
          }
          if (a > b) {
            return 1;
          }
          return 0;
        });
        expect(sorted[0]).assertEqual(1.25);
        expect(sorted[2]).assertEqual(3.75);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SORTED_4900
     * @tc.name testSparseArrayToSorted049
     * @tc.desc toSorted on SparseArray<char> orders char elements ascending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSorted049', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<char>(c'C', c'A', c'B');
        const sorted = arr.toSorted((a: char, b: char): int => {
          if (a < b) {
            return -1;
          }
          if (a > b) {
            return 1;
          }
          return 0;
        });
        expect(sorted[0]).assertEqual(c'A');
        expect(sorted[2]).assertEqual(c'C');
    });

  });
}
