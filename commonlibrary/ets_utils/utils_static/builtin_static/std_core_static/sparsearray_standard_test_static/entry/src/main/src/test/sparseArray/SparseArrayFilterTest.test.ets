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

type SparseArrayIntFilterPred = (v: int) => boolean;

interface Person009 {
    name: string;
    age: int;
  }

class CustomError023 extends Error {
    constructor(message: string) {
      super(message);
      this.name = "CustomError023";
    }
  }

class Item028 {
    value: int;
    constructor(v: int) {
      this.value = v;
    }
  }

export default function SparseArrayFilterTest(): void {
  describe('SparseArrayFilterTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILTER_0100
     * @tc.name testSparseArrayFilter001
     * @tc.desc Test SparseArray.filter, verify method result (array === arr is true, result!.length equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFilter001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4);
        const result = arr.filter((value, index, array) => {
          expect(array === arr).assertTrue();
          return index > 1;
        });
        expect(result!.length).assertEqual(2);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILTER_0200
     * @tc.name testSparseArrayFilter002
     * @tc.desc Test SparseArray.filter, verify method result (result!.length equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFilter002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.filter((v) => true);
        expect(result!.length).assertEqual(3);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILTER_0300
     * @tc.name testSparseArrayFilter003
     * @tc.desc Test SparseArray.filter, verify method result (result!.length equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFilter003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.filter((v) => false);
        expect(result!.length).assertEqual(0);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILTER_0400
     * @tc.name testSparseArrayFilter004
     * @tc.desc Test SparseArray.filter, verify method result (result!.length equals 2, result![0] equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFilter004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4);
        const result = arr.filter((v) => v > 2);
        expect(result!.length).assertEqual(2);
        expect(result![0]).assertEqual(3);
        expect(result[1]).assertEqual(4);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILTER_0500
     * @tc.name testSparseArrayFilter005
     * @tc.desc Test SparseArray.filter, verify method result (result!.length equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFilter005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4);
        const result = arr.filter((v, index) => index >= 1);
        expect(result!.length).assertEqual(3);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILTER_0600
     * @tc.name testSparseArrayFilter006
     * @tc.desc Test SparseArray.filter, verify method result (a.length equals 3, result!.length equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFilter006', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.filter((v, i, a) => {
          expect(a.length).assertEqual(3);
          return v > 1;
        });
        expect(result!.length).assertEqual(2);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILTER_0700
     * @tc.name testSparseArrayFilter007
     * @tc.desc Test SparseArray.filter, verify method result (result![0] equals 1, result![1] equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFilter007', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(0, 1, 2);
        const result = arr.filter((v): boolean => v !== 0);
        expect(result![0]).assertEqual(1);
        expect(result![1]).assertEqual(2);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILTER_0800
     * @tc.name testSparseArrayFilter008
     * @tc.desc Test SparseArray.filter, verify method result (result!.length equals 2, result![0] equals "banana")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFilter008', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("apple", "banana", "cherry");
        const result = arr.filter((v) => v.length > 5);
        expect(result!.length).assertEqual(2);
        expect(result![0]).assertEqual("banana");
        expect(result[1]).assertEqual("cherry");
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILTER_0900
     * @tc.name testSparseArrayFilter009
     * @tc.desc Test SparseArray.filter, verify method result (result!.length equals 1, result![0]!.name equals "Bob")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFilter009', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<Person009>(
          { name: "Alice", age: 25 },
          { name: "Bob", age: 30 }
        );
        const result = arr.filter((p) => p.age > 28);
        expect(result!.length).assertEqual(1);
        expect(result![0]!.name).assertEqual("Bob");
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILTER_1000
     * @tc.name testSparseArrayFilter010
     * @tc.desc Test SparseArray.filter, verify method result (result!.length equals 2, result![0] equals "hello")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFilter010', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string | int>("hello", 42, "world", 100);
        const result = arr.filter((v) => (typeof v == "string"));
        expect(result!.length).assertEqual(2);
        expect(result![0]).assertEqual("hello");
        expect(result[1]).assertEqual("world");
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILTER_1100
     * @tc.name testSparseArrayFilter011
     * @tc.desc Test SparseArray.filter, verify method result (result!.length equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFilter011', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | null>(1, null, 2, null);
        const result = arr.filter((v) => v !== null);
        expect(result!.length).assertEqual(2);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILTER_1200
     * @tc.name testSparseArrayFilter012
     * @tc.desc Test SparseArray.filter, verify method result (result!.length equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFilter012', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | undefined>(1, undefined, 2, undefined);
        const result = arr.filter((v) => v !== undefined);
        expect(result!.length).assertEqual(2);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILTER_1300
     * @tc.name testSparseArrayFilter013
     * @tc.desc Test SparseArray.filter error path, verify expected exception is thrown (assertFail is triggered, error.name equals "ClassCastError")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFilter013', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        try {
          arr.filter(null as SparseArrayIntFilterPred);
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError");
        }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILTER_1400
     * @tc.name testSparseArrayFilter014
     * @tc.desc Test SparseArray.filter error path, verify expected exception is thrown (assertFail is triggered, error.name equals "ClassCastError")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFilter014', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        try {
          arr.filter(undefined as SparseArrayIntFilterPred);
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError");
        }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILTER_1500
     * @tc.name testSparseArrayFilter015
     * @tc.desc Test SparseArray.filter when predicate throws, verify Error is propagated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFilter015', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        try {
          arr.filter((v) => {
            throw new Error("error in predicate");
          });
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("Error");
        }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILTER_1600
     * @tc.name testSparseArrayFilter016
     * @tc.desc Test SparseArray.filter, verify method result (result!.length equals 3, result![0] equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFilter016', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4, 5);
        const result = arr.filter((v) => v > 2);
        expect(result!.length).assertEqual(3);
        expect(result![0]).assertEqual(3);
        expect(result[1]).assertEqual(4);
        expect(result[2]).assertEqual(5);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILTER_1700
     * @tc.name testSparseArrayFilter017
     * @tc.desc Test SparseArray.filter, verify method result (result!.length equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFilter017', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        const result = arr.filter((v) => v > 1);
        expect(result!.length).assertEqual(0);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILTER_1800
     * @tc.name testSparseArrayFilter018
     * @tc.desc Test SparseArray.filter, verify method result (result!.length equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFilter018', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10);
        arr[0] = 1;
        arr[2] = 3;
        arr[4] = 5;
        const result = arr.filter((v) => v > 2);
        expect(result!.length).assertEqual(2);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILTER_1900
     * @tc.name testSparseArrayFilter019
     * @tc.desc Test SparseArray.filter, verify method result (result!.length equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFilter019', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5);
        arr[0] = 10;
        arr[2] = 20;
        arr[4] = 30;
        const result = arr.filter((v) => v !== undefined);
        expect(result!.length).assertEqual(3);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILTER_2000
     * @tc.name testSparseArrayFilter020
     * @tc.desc Test SparseArray.filter, verify method result (result instanceof SparseArray is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFilter020', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result: SparseArray<int> = arr.filter((v) => v > 1);
        expect(result instanceof SparseArray).assertTrue();
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(2);
        expect(result[1]).assertEqual(3);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILTER_2100
     * @tc.name testSparseArrayFilter021
     * @tc.desc Test SparseArray.filter, verify method result (result!.length equals 1, result![0] equals 5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFilter021', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5);
        arr[4] = 5;
        const result = arr.filter((v) => v > 3);
        expect(result!.length).assertEqual(1);
        expect(result![0]).assertEqual(5);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILTER_2200
     * @tc.name testSparseArrayFilter022
     * @tc.desc Test SparseArray.filter, verify method result (result!.length equals 500)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFilter022', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        for (let i = 0; i < 1000; i++) {
          arr.push(i);
        }
        const result = arr.filter((v) => v % 2 == 0);
        expect(result!.length).assertEqual(500);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILTER_2300
     * @tc.name testSparseArrayFilter023
     * @tc.desc Test SparseArray.filter error path, verify expected exception is thrown (assertFail is triggered, e.name equals "CustomError023")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFilter023', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        try {
          arr.filter((v) => {
            throw new CustomError023("custom error");
          });
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("CustomError023");
        }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILTER_2400
     * @tc.name testSparseArrayFilter024
     * @tc.desc Test SparseArray.filter error path, verify expected exception is thrown (assertFail is triggered, error.name equals "Error")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFilter024', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        try {
          arr.filter((v) => {
            if (v === 2) {
              throw new Error("error");
            }
            return true;
          });
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("Error");
        }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILTER_2500
     * @tc.name testSparseArrayFilter025
     * @tc.desc Test SparseArray.filter, verify method result (arr.length equals 3, result!.length equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFilter025', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.filter((v) => v > 1);
        result.push(4);
        expect(arr.length).assertEqual(3);
        expect(result!.length).assertEqual(3);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILTER_2600
     * @tc.name testSparseArrayFilter026
     * @tc.desc Test SparseArray.filter, verify method result (result![0] equals 5, result[1] equals 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFilter026', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5, 1, 4, 2, 3);
        const result = arr.filter((v) => v > 2);
        expect(result![0]).assertEqual(5);
        expect(result[1]).assertEqual(4);
        expect(result[2]).assertEqual(3);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILTER_2700
     * @tc.name testSparseArrayFilter027
     * @tc.desc Test SparseArray.filter, verify method result (arr.length equals originalLength, arr[0] equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFilter027', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const originalLength = arr.length;
        const result = arr.filter((v) => v > 1);
        expect(arr.length).assertEqual(originalLength);
        expect(arr[0]).assertEqual(1);
        expect(arr[1]).assertEqual(2);
        expect(arr[2]).assertEqual(3);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILTER_2800
     * @tc.name testSparseArrayFilter028
     * @tc.desc Test SparseArray.filter, verify method result (head !== undefined && head !== null is true, arr[1]!.value equals 10)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFilter028', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<Item028>(new Item028(1), new Item028(2));
        const result = arr.filter((item) => item.value > 1);
        const head = result![0];
        expect(head !== undefined && head !== null).assertTrue();
        head!.value = 10;
        expect(arr[1]!.value).assertEqual(10);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILTER_2900
     * @tc.name testSparseArrayFilter029
     * @tc.desc Test SparseArray.filter, verify method result (result!.length equals 2, result![0] equals 30)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFilter029', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10);
        arr[1] = 10;
        arr[3] = 30;
        arr[5] = 50;
        const result = arr.filter((v) => v > 20);
        expect(result!.length).assertEqual(2);
        expect(result![0]).assertEqual(30);
        expect(result![1]).assertEqual(50);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILTER_3000
     * @tc.name testSparseArrayFilter030
     * @tc.desc Test SparseArray.filter, verify method result (indices[0] equals 2, indices[1] equals 5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFilter030', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10);
        arr[2] = 20;
        arr[5] = 50;
        arr[8] = 80;
        const indices: Array<int> = [];
        arr.filter((v, index) => {
          indices.push(index);
          return true;
        });
        expect(indices[0]).assertEqual(2);
        expect(indices[1]).assertEqual(5);
        expect(indices[2]).assertEqual(8);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILTER_3100
     * @tc.name testSparseArrayFilter031
     * @tc.desc filter long elements above threshold, verify matched long values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFilter031', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<long>();
        const low: long = 100 as long;
        const high: long = 10000000000 as long;
        arr.$_set(0, low);
        arr.$_set(1, high);
        const threshold: long = 1000000 as long;
        const result = arr.filter((v: long): boolean => v > threshold);
        expect(result!.length).assertEqual(1);
        expect(result![0]).assertEqual(high);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILTER_3200
     * @tc.name testSparseArrayFilter032
     * @tc.desc filter float elements above threshold, verify matched float values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFilter032', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<float>(1.0f, 2.5f, 3.0f, 0.5f);
        const result = arr.filter((v: float): boolean => v > 2.0f);
        expect(result!.length).assertEqual(2);
        expect(result![0]).assertEqual(2.5f);
        expect(result![1]).assertEqual(3.0f);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILTER_3300
     * @tc.name testSparseArrayFilter033
     * @tc.desc filter keeps strings containing illegal UTF code unit \uFFFE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFilter033', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const bad = "\uFFFE";
        const arr = new SparseArray<string>("ok", bad, "tail");
        const result = arr.filter((v: string): boolean => v.indexOf("\uFFFE") >= 0);
        expect(result!.length).assertEqual(1);
        expect(result![0]).assertEqual(bad);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILTER_3400
     * @tc.name testSparseArrayFilter034
     * @tc.desc filter keeps only null elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFilter034', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | null>(1, null, 3, null);
        const result = arr.filter((v: int | null): boolean => v === null);
        expect(result!.length).assertEqual(2);
        expect(result![0]).assertEqual(null);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILTER_3500
     * @tc.name testSparseArrayFilter035
     * @tc.desc filter keeps only elements equal to hex literal 0xFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFilter035', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 0xFF, 2, 0xFF);
        const result = arr.filter((v: int): boolean => v === 0xFF);
        expect(result!.length).assertEqual(2);
        expect(result![0]).assertEqual(0xFF);
    });

  });
}
