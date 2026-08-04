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

function cmpNumber(a: number, b: number): int {
  if (a < b) {
    return -1;
  }
  if (a > b) {
    return 1;
  }
  return 0;
}

function cmpInt(a: int, b: int): int {
  if (a < b) {
    return -1;
  }
  if (a > b) {
    return 1;
  }
  return 0;
}

function cmpIntDesc(a: int, b: int): int {
  return cmpInt(b, a);
}

function cmpDouble(a: double, b: double): int {
  if (a < b) {
    return -1;
  }
  if (a > b) {
    return 1;
  }
  return 0;
}

function cmpDoubleDesc(a: double, b: double): int {
  return cmpDouble(b, a);
}

interface SortEntry029 {
  value: int;
  index: int;
}

function cmpSortEntryByValue(a: SortEntry029, b: SortEntry029): int {
  if (a.value < b.value) {
    return -1;
  }
  if (a.value > b.value) {
    return 1;
  }
  return 0;
}

function cmpStringLower(a: string, b: string): int {
  const la = a.toLowerCase();
  const lb = b.toLowerCase();
  if (la < lb) {
    return -1;
  }
  if (la > lb) {
    return 1;
  }
  return 0;
}

function cmpStringLocale(a: string, b: string): int {
  return a.localeCompare(b) as int;
}

function cmpStringLen(a: string, b: string): int {
  const d = a.length - b.length;
  if (d < 0) {
    return -1;
  }
  if (d > 0) {
    return 1;
  }
  return 0;
}

interface Person031 {
    name: string;
    age: number;
  }

function cmpPerson031ByAge(a: Person031, b: Person031): int {
  return cmpDouble(a.age as double, b.age as double);
}

class Product047 {
    name: string;
    price: number;
    constructor(name: string, price: number) {
      this.name = name;
      this.price = price;
    }
  }

function cmpProduct047Price(a: Product047, b: Product047): int {
  return cmpDouble(a.price as double, b.price as double);
}

class Item048 {
    name: string;
    price: number;
    constructor(name: string, price: number) {
      this.name = name;
      this.price = price;
    }
  }

function cmpItem048(a: Item048, b: Item048): int {
  if (a.price !== b.price) {
    return cmpDouble(a.price as double, b.price as double);
  }
  return a.name.localeCompare(b.name) as int;
}

export default function SparseArraySortTest(): void {
  describe('SparseArraySortTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SORT_0100
     * @tc.name testSparseArraySort001
     * @tc.desc Test SparseArray.sort, verify method result (result equals arr, arr[0] equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySort001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<number>(10, 2, 8, 5);
        const result = arr.sort(cmpNumber);
        expect(result).assertEqual(arr);
        expect(arr[0]).assertEqual(2);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SORT_0200
     * @tc.name testSparseArraySort002
     * @tc.desc Test SparseArray.sort, verify method result (result equals arr, arr[0] equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySort002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<number>(3, 1, 4, 1, 5);
        const result = arr.sort(cmpDouble);
        expect(result).assertEqual(arr);
        expect(arr[0]).assertEqual(1);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SORT_0300
     * @tc.name testSparseArraySort003
     * @tc.desc Test SparseArray.sort, verify method result (arr[0] equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySort003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<number>(5, 3, 1, 4, 2);
        arr.sort(cmpDouble);
        expect(arr[0]).assertEqual(1);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SORT_0400
     * @tc.name testSparseArraySort004
     * @tc.desc Test SparseArray.sort, verify method result (arr[0] equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySort004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<number>(3, 2, 1);
        arr.sort(cmpDouble);
        expect(arr[0]).assertEqual(1);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SORT_0500
     * @tc.name testSparseArraySort005
     * @tc.desc Test SparseArray.sort, verify method result (arr instanceof SparseArray is true, arr.length equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySort005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<number>(1, 2);
        expect(arr instanceof SparseArray).assertTrue();
        arr.sort(cmpDouble);
        expect(arr.length).assertEqual(2);
        expect(arr[0]).assertEqual(1);
        expect(arr[1]).assertEqual(2);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SORT_0600
     * @tc.name testSparseArraySort006
     * @tc.desc sort ascending on [7,3,3], verify in-place sorted order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySort006', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(7, 3, 3);
        arr.sort((x: int, y: int): int => x - y);
        expect(arr[0]).assertEqual(3);
        expect(arr[1]).assertEqual(3);
        expect(arr[2]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SORT_0700
     * @tc.name testSparseArraySort007
     * @tc.desc Test SparseArray.sort, verify method result (arr[0] equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySort007', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<number>(1, 2, 3);
        arr.sort(cmpDouble);
        expect(arr[0]).assertEqual(1);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SORT_0800
     * @tc.name testSparseArraySort008
     * @tc.desc Test SparseArray.sort, verify method result (arr instanceof SparseArray is true, arr.length equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySort008', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<number>(10, 2, 5);
        expect(arr instanceof SparseArray).assertTrue();
        arr.sort(cmpNumber);
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(2);
        expect(arr[1]).assertEqual(5);
        expect(arr[2]).assertEqual(10);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SORT_0900
     * @tc.name testSparseArraySort009
     * @tc.desc sort ascending on [3,6,3], verify in-place sorted order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySort009', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(3, 6, 3);
        arr.sort((x: int, y: int): int => x - y);
        expect(arr[0]).assertEqual(3);
        expect(arr[1]).assertEqual(3);
        expect(arr[2]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SORT_1000
     * @tc.name testSparseArraySort010
     * @tc.desc Test SparseArray.sort, verify method result (arr[0] equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySort010', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<number>(1, 2);
        arr.sort(cmpDouble);
        expect(arr[0]).assertEqual(1);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SORT_1100
     * @tc.name testSparseArraySort011
     * @tc.desc Test SparseArray.sort, verify method result (arr[0] equals 1, arr[4] equals 5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySort011', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<number>(5, 3, 1, 4, 2);
        arr.sort(cmpDouble);
        expect(arr[0]).assertEqual(1);
        expect(arr[4]).assertEqual(5);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SORT_1200
     * @tc.name testSparseArraySort012
     * @tc.desc Test SparseArray.sort, verify method result (arr[0] equals "apple", arr[1] equals "banana")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySort012', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("banana", "apple", "cherry");
        arr.sort(cmpStringLocale);
        expect(arr[0]).assertEqual("apple");
        expect(arr[1]).assertEqual("banana");
        expect(arr[2]).assertEqual("cherry");

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SORT_1300
     * @tc.name testSparseArraySort013
     * @tc.desc Test SparseArray.sort, verify method result (result equals arr, arr.length equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySort013', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<number>();
        const result = arr.sort();
        expect(result).assertEqual(arr);
        expect(arr.length).assertEqual(0);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SORT_1400
     * @tc.name testSparseArraySort014
     * @tc.desc Test SparseArray.sort, verify method result (result equals arr, arr[0] equals 42)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySort014', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<number>();
        arr.push(42);
        const result = arr.sort();
        expect(result).assertEqual(arr);
        expect(arr[0]).assertEqual(42);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SORT_1500
     * @tc.name testSparseArraySort015
     * @tc.desc Test SparseArray.sort, verify method result (arr instanceof SparseArray is true, arr.length equals 6)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySort015', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<number>(6);
        expect(arr instanceof SparseArray).assertTrue();
        arr[0] = 10;
        arr[2] = 30;
        arr[4] = 20;
        arr.sort(cmpDouble);
        expect(arr.length).assertEqual(6);
        expect(arr[0]).assertEqual(10);
        expect(arr[2]).assertEqual(20);
        expect(arr[4]).assertEqual(30);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SORT_1600
     * @tc.name testSparseArraySort016
     * @tc.desc Test SparseArray.sort, verify method result (arr[0] equals 1, arr[1] equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySort016', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<number>(3, 1, 4, 1, 5, 9, 2, 6, 5);
        arr.sort(cmpDouble);
        expect(arr[0]).assertEqual(1);
        expect(arr[1]).assertEqual(1);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SORT_1700
     * @tc.name testSparseArraySort017
     * @tc.desc Test SparseArray.sort, verify method result (result equals arr, result === arr is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySort017', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<number>(3, 1, 4, 1, 5);
        const result = arr.sort(cmpDouble);
        expect(result).assertEqual(arr);
        expect(result === arr).assertTrue();

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SORT_1800
     * @tc.name testSparseArraySort018
     * @tc.desc Test SparseArray.sort, verify method result (arr[0] equals 4, arr[2] equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySort018', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<number>(3, 1, 4);
        arr.sort(cmpDouble)
           .sort(cmpDoubleDesc);
        expect(arr[0]).assertEqual(4);
        expect(arr[2]).assertEqual(1);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SORT_1900
     * @tc.name testSparseArraySort019
     * @tc.desc Test SparseArray.sort, verify method result (arr equals originalRef)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySort019', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<number>(2, 1);
        const originalRef = arr;
        arr.sort();
        expect(arr).assertEqual(originalRef);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SORT_2000
     * @tc.name testSparseArraySort020
     * @tc.desc Test SparseArray.sort, verify method result (arr2[0] equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySort020', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr1 = new SparseArray<number>(3, 1, 2);
        const arr2 = arr1;
        arr1.sort(cmpDouble);
        expect(arr2[0]).assertEqual(1);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SORT_2100
     * @tc.name testSparseArraySort021
     * @tc.desc Test SparseArray.sort, verify method result (result!.length equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySort021', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<number>(3, 1, 2);
        const result: SparseArray<number> = arr.sort();
        expect(result!.length).assertEqual(3);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SORT_2200
     * @tc.name testSparseArraySort022
     * @tc.desc Test SparseArray.sort, verify method result (arr[0] equals 1, arr[999] equals 1000)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySort022', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<number>();
        for (let i = 1000; i >= 1; i--) {
          arr.push(i);
        }
        arr.sort(cmpDouble);
        expect(arr[0]).assertEqual(1);
        expect(arr[999]).assertEqual(1000);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SORT_2300
     * @tc.name testSparseArraySort023
     * @tc.desc Test SparseArray.sort, verify method result (arr[0] equals -1, arr[4] equals Number.MAX_VALUE)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySort023', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<number>(
          Number.MAX_VALUE,
          Number.MIN_VALUE,
          0,
          -1,
          1
        );
        arr.sort(cmpDouble);
        expect(arr[0]).assertEqual(-1);
        expect(arr[4]).assertEqual(Number.MAX_VALUE);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SORT_2400
     * @tc.name testSparseArraySort024
     * @tc.desc Test SparseArray.sort error path, verify expected exception is thrown (assertFail is triggered, error.name equals "Error")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySort024', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        try {
          const arr = new SparseArray<int>(1, 2, 3);
          arr.sort((a: int, b: int): int => {
            throw new Error("Comparison error");
          });
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("Error");
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SORT_2500
     * @tc.name testSparseArraySort025
     * @tc.desc sort ascending on [5,2,4], verify in-place sorted order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySort025', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5, 2, 4);
        arr.sort((x: int, y: int): int => x - y);
        expect(arr[0]).assertEqual(2);
        expect(arr[1]).assertEqual(4);
        expect(arr[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SORT_2600
     * @tc.name testSparseArraySort026
     * @tc.desc sort ascending on [6,3,5], verify in-place sorted order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySort026', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(6, 3, 5);
        arr.sort((x: int, y: int): int => x - y);
        expect(arr[0]).assertEqual(3);
        expect(arr[1]).assertEqual(5);
        expect(arr[2]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SORT_2700
     * @tc.name testSparseArraySort027
     * @tc.desc Test SparseArray.sort error path, verify expected exception is thrown (assertFail is triggered, error.name equals "Error")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySort027', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(3, 1, 2);
        try {
          arr.sort((a: int, b: int): int => {
            if (a === 2) {
              throw new Error("Stop");
            }
            return cmpInt(a, b);
          });
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("Error");
          expect(arr.length).assertEqual(3);
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SORT_2800
     * @tc.name testSparseArraySort028
     * @tc.desc Test SparseArray.sort error path, verify expected exception is thrown (assertFail is triggered, error.name equals "Error")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySort028', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        try {
          const arr = new SparseArray<int>(1, 2);
          arr.sort((a: int, b: int): int => {
            throw new Error("string error");
          });
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("Error");
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SORT_2900
     * @tc.name testSparseArraySort029
     * @tc.desc Test SparseArray.sort, verify method result (e0 != null && e1 != null && e2 != null is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySort029', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<SortEntry029>();
        arr.push({ value: 1, index: 0 }, { value: 1, index: 1 }, { value: 1, index: 2 });
        arr.sort(cmpSortEntryByValue);
        const e0 = arr[0];
        const e1 = arr[1];
        const e2 = arr[2];
        expect(e0 != null && e1 != null && e2 != null).assertTrue();
        expect((e0 as SortEntry029).index).assertEqual(0);
        expect((e1 as SortEntry029).index).assertEqual(1);
        expect((e2 as SortEntry029).index).assertEqual(2);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SORT_3000
     * @tc.name testSparseArraySort030
     * @tc.desc Test SparseArray.sort, verify method result (arr[0] equals 5, arr[4] equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySort030', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4, 5);
        arr.sort(cmpIntDesc);
        expect(arr[0]).assertEqual(5);
        expect(arr[4]).assertEqual(1);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SORT_3100
     * @tc.name testSparseArraySort031
     * @tc.desc Test SparseArray.sort, verify method result (head != null is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySort031', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<Person031>();
        arr.push({name: "Alice", age: 30}, {name: "Bob", age: 25});
        arr.sort(cmpPerson031ByAge);
        const head = arr[0];
        expect(head != null).assertTrue();
        expect((head as Person031).name).assertEqual("Bob");
        expect((head as Person031).age).assertEqual(25);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SORT_3200
     * @tc.name testSparseArraySort032
     * @tc.desc Test SparseArray.sort, verify method result (arr[0] equals "apple", arr[1] equals "Banana")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySort032', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("Zebra", "apple", "Banana");
        arr.sort(cmpStringLower);
        expect(arr[0]).assertEqual("apple");
        expect(arr[1]).assertEqual("Banana");

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SORT_3300
     * @tc.name testSparseArraySort033
     * @tc.desc Test SparseArray.sort, verify method result (arr[0] equals 1, arr[3] equals 100)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySort033', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10, 2, 100, 1);
        arr.sort(cmpInt);
        expect(arr[0]).assertEqual(1);
        expect(arr[3]).assertEqual(100);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SORT_3400
     * @tc.name testSparseArraySort034
     * @tc.desc Test SparseArray.sort, verify method result (arr instanceof SparseArray is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySort034', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        expect(arr instanceof SparseArray).assertTrue();
        arr.sort();

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SORT_3500
     * @tc.name testSparseArraySort035
     * @tc.desc Test SparseArray.sort, verify method result (arr[0] equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySort035', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<double>(1.0, Double.NaN, 3.0, 2.0);
        arr.sort((a: double, b: double): int => {
          if (isNaN(a)) {
            return 1;
          }
          if (isNaN(b)) {
            return -1;
          }
          return cmpDouble(a, b);
        });
        expect(arr[0]).assertEqual(1.0);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SORT_3600
     * @tc.name testSparseArraySort036
     * @tc.desc Test SparseArray.sort, verify method result (arr[0] equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySort036', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | undefined>(1, undefined, 3);
        arr.sort((a: int | undefined, b: int | undefined): int => {
          if (a === undefined) {
            return 1;
          }
          if (b === undefined) {
            return -1;
          }
          return cmpInt(a, b);
        });
        expect(arr[0]).assertEqual(1);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SORT_3700
     * @tc.name testSparseArraySort037
     * @tc.desc Test SparseArray.sort, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySort037', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        const size = 10000;
        for (let i = 0; i < size; i++) {
          arr.push(Double.toInt(Math.floor(Math.random() * size)));
        }
        const startTime = Date.now();
        arr.sort(cmpInt);
        const endTime = Date.now();
        expect(endTime - startTime).assertLess(5000);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SORT_3800
     * @tc.name testSparseArraySort038
     * @tc.desc Test SparseArray.sort, verify method result (arr[0] equals 0, arr[999] equals 999)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySort038', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        for (let i = 0; i < 1000; i++) {
          arr.push(i);
        }
        arr.sort(cmpInt);
        expect(arr[0]).assertEqual(0);
        expect(arr[999]).assertEqual(999);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SORT_3900
     * @tc.name testSparseArraySort039
     * @tc.desc Test SparseArray.sort, verify method result (arr[0] equals 1, arr[999] equals 1000)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySort039', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        for (let i = 1000; i > 0; i--) {
          arr.push(i);
        }
        arr.sort(cmpInt);
        expect(arr[0]).assertEqual(1);
        expect(arr[999]).assertEqual(1000);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SORT_4000
     * @tc.name testSparseArraySort040
     * @tc.desc Test SparseArray.sort, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySort040', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(3, 1, 4);
        const original = arr.toString();
        arr.sort((a: int, b: int): int => 0);
        expect(arr.toString()).assertEqual(original);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SORT_4100
     * @tc.name testSparseArraySort041
     * @tc.desc Test SparseArray.sort, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySort041', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2);
        let callCount = 0;
        arr.sort((a: int, b: int): int => {
          callCount++;
          return callCount % 2 === 0 ? 1 : -1;
        });
        expect(callCount).assertLarger(0);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SORT_4200
     * @tc.name testSparseArraySort042
     * @tc.desc Test SparseArray.sort, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySort042', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5, 3, 8, 1, 9, 2, 7, 4, 6);
        arr.sort(cmpInt);
        expect(arr.toString()).assertEqual("1,2,3,4,5,6,7,8,9");

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SORT_4300
     * @tc.name testSparseArraySort043
     * @tc.desc Test SparseArray.sort, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySort043', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4, 5);
        arr.sort(cmpIntDesc);
        expect(arr.toString()).assertEqual("5,4,3,2,1");

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SORT_4400
     * @tc.name testSparseArraySort044
     * @tc.desc Test SparseArray.sort, verify method result (arr[0] equals -5, arr[5] equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySort044', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(3, -1, -5, 2, -4, 0);
        arr.sort(cmpInt);
        expect(arr[0]).assertEqual(-5);
        expect(arr[5]).assertEqual(3);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SORT_4500
     * @tc.name testSparseArraySort045
     * @tc.desc Test SparseArray.sort, verify method result (arr[0] equals "apple", arr[1] equals "banana")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySort045', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("orange", "apple", "banana");
        arr.sort(cmpStringLocale);
        expect(arr[0]).assertEqual("apple");
        expect(arr[1]).assertEqual("banana");
        expect(arr[2]).assertEqual("orange");

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SORT_4600
     * @tc.name testSparseArraySort046
     * @tc.desc Test SparseArray.sort, verify method result (arr[0] equals "a", arr[4] equals "dddd")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySort046', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("a", "ccc", "bb", "dddd", "e");
        arr.sort(cmpStringLen);
        expect(arr[0]).assertEqual("a");
        expect(arr[4]).assertEqual("dddd");

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SORT_4700
     * @tc.name testSparseArraySort047
     * @tc.desc Test SparseArray.sort, verify method result (p0 != null && p1 != null && p2 != null is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySort047', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<Product047>();
        arr.push(new Product047("A", 100), new Product047("B", 50), new Product047("C", 75));
        arr.sort(cmpProduct047Price);
        const p0 = arr[0];
        const p1 = arr[1];
        const p2 = arr[2];
        expect(p0 != null && p1 != null && p2 != null).assertTrue();
        expect((p0 as Product047).price).assertEqual(50);
        expect((p1 as Product047).price).assertEqual(75);
        expect((p2 as Product047).price).assertEqual(100);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SORT_4800
     * @tc.name testSparseArraySort048
     * @tc.desc Test SparseArray.sort, verify method result (i0 != null && i1 != null && i2 != null is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySort048', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<Item048>();
        arr.push(new Item048("B", 100), new Item048("A", 100), new Item048("C", 50));
        arr.sort(cmpItem048);
        const i0 = arr[0];
        const i1 = arr[1];
        const i2 = arr[2];
        expect(i0 != null && i1 != null && i2 != null).assertTrue();
        expect((i0 as Item048).name).assertEqual("C");
        expect((i1 as Item048).name).assertEqual("A");
        expect((i2 as Item048).name).assertEqual("B");

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SORT_4900
     * @tc.name testSparseArraySort049
     * @tc.desc sort on SparseArray<float> with NaN ordered after finite values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySort049', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const nan = Double.toFloat(Double.NaN);
        const arr = new SparseArray<float>(1.0f, nan, 3.0f, 2.0f);
        arr.sort((a: float, b: float): int => {
          if (a !== a) {
            return 1;
          }
          if (b !== b) {
            return -1;
          }
          if (a < b) {
            return -1;
          }
          if (a > b) {
            return 1;
          }
          return 0;
        });
        expect(arr[0]).assertEqual(1.0f);
        expect(arr[1]).assertEqual(2.0f);
        expect(arr[2]).assertEqual(3.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SORT_5000
     * @tc.name testSparseArraySort050
     * @tc.desc sort orders int elements with 0x7 0b10 0x3 literals ascending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySort050', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(0x7, 0b10, 0x3, 1);
        arr.sort((a: int, b: int): int => {
          if (a < b) {
            return -1;
          }
          if (a > b) {
            return 1;
          }
          return 0;
        });
        expect(arr[0]).assertEqual(1);
        expect(arr[1]).assertEqual(0b10);
        expect(arr[2]).assertEqual(0x3);
        expect(arr[3]).assertEqual(0x7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SORT_5100
     * @tc.name testSparseArraySort051
     * @tc.desc sort on SparseArray<boolean> orders false before true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySort051', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<boolean>(true, false, true);
        arr.sort((a: boolean, b: boolean): int => {
          if (a === b) {
            return 0;
          }
          if (!a && b) {
            return -1;
          }
          return 1;
        });
        expect(arr[0]).assertFalse();
        expect(arr[1]).assertTrue();
        expect(arr[2]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SORT_5200
     * @tc.name testSparseArraySort052
     * @tc.desc sort on SparseArray<byte> orders byte boundary values ascending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySort052', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<byte>(127 as byte, 0 as byte, (-128 as byte));
        arr.sort((a: byte, b: byte): int => {
          if (a < b) {
            return -1;
          }
          if (a > b) {
            return 1;
          }
          return 0;
        });
        expect(arr[0]).assertEqual(-128 as byte);
        expect(arr[1]).assertEqual(0 as byte);
        expect(arr[2]).assertEqual(127 as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SORT_5300
     * @tc.name testSparseArraySort053
     * @tc.desc sort on SparseArray<short> orders short values ascending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySort053', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<short>(300 as short, 100 as short, 200 as short);
        arr.sort((a: short, b: short): int => {
          if (a < b) {
            return -1;
          }
          if (a > b) {
            return 1;
          }
          return 0;
        });
        expect(arr[0]).assertEqual(100 as short);
        expect(arr[1]).assertEqual(200 as short);
        expect(arr[2]).assertEqual(300 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SORT_5400
     * @tc.name testSparseArraySort054
     * @tc.desc sort on SparseArray<long> orders long values ascending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySort054', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<long>(30000000000 as long, 10000000000 as long, 20000000000 as long);
        arr.sort((a: long, b: long): int => {
          if (a < b) {
            return -1;
          }
          if (a > b) {
            return 1;
          }
          return 0;
        });
        expect(arr[0]).assertEqual(10000000000 as long);
        expect(arr[1]).assertEqual(20000000000 as long);
        expect(arr[2]).assertEqual(30000000000 as long);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SORT_5500
     * @tc.name testSparseArraySort055
     * @tc.desc sort on SparseArray<char> orders char elements ascending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySort055', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<char>(c'C', c'A', c'B');
        arr.sort((a: char, b: char): int => {
          if (a < b) {
            return -1;
          }
          if (a > b) {
            return 1;
          }
          return 0;
        });
        expect(arr[0]).assertEqual(c'A');
        expect(arr[1]).assertEqual(c'B');
        expect(arr[2]).assertEqual(c'C');
    });

  });
}
