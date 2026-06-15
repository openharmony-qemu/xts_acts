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

class CustomFindError016 extends Error {
    constructor(message: string) {
      super(message);
      this.name = "CustomFindError016";
    }
  }

interface Person021 {
    name: string;
    age: int;
  }

function findPredGreaterThanTwo004(value: int): boolean {
  return value > 2;
}

export default function SparseArrayFindTest(): void {
  describe('SparseArrayFindTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPARSE_ARRAY_FIND_0100
     * @tc.name testSparseArrayFind001
     * @tc.desc Test SparseArray.find, verify method result (length equals 5, found equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFind001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5);
        expect(arr.length).assertEqual(5);
        arr.push(1, 2, 3, 4);
        const found = arr.find((v) => v > 2);
        expect(found).assertEqual(3);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPARSE_ARRAY_FIND_0200
     * @tc.name testSparseArrayFind002
     * @tc.desc Test SparseArray.find, verify method result (found equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFind002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5);
        arr[0] = 1;
        arr[1] = 2;
        arr[2] = 3;
        arr[3] = 4;
        const found = arr.find((value, index, array) => {
          return value > 2 && index < 4;
        });
        expect(found).assertEqual(3);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPARSE_ARRAY_FIND_0300
     * @tc.name testSparseArrayFind003
     * @tc.desc Test SparseArray.find, verify method result (found equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFind003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5);
        arr.push(1, 2, 3, 4);
        const found = arr.find(findPredGreaterThanTwo004);
        expect(found).assertEqual(3);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPARSE_ARRAY_FIND_0400
     * @tc.name testSparseArrayFind004
     * @tc.desc Test SparseArray.find, verify method result (found equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFind004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5);
        arr.push(1, 2, 3, 4);
        const found = arr.find(() => true);
        expect(found).assertEqual(1);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPARSE_ARRAY_FIND_0500
     * @tc.name testSparseArrayFind005
     * @tc.desc Test SparseArray.find, verify method result (found equals undefined)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFind005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5);
        arr.push(1, 2, 3, 4);
        const found = arr.find(() => false);
        expect(found).assertEqual(undefined);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPARSE_ARRAY_FIND_0600
     * @tc.name testSparseArrayFind006
     * @tc.desc Test SparseArray.find error path, verify expected exception is thrown (assertFail is triggered, error.name equals "Error")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFind006', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        try {
          const arr = new SparseArray<int>(5);
          arr.push(1, 2, 3, 4);
          arr.find((v) => {
            if (v === 2) throw new Error("Test error");
            return v > 2;
          });
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("Error");
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPARSE_ARRAY_FIND_0700
     * @tc.name testSparseArrayFind007
     * @tc.desc Test SparseArray.find, verify method result (found equals undefined)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFind007', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        const found = arr.find((v) => v > 2);
        expect(found).assertEqual(undefined);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPARSE_ARRAY_FIND_0800
     * @tc.name testSparseArrayFind008
     * @tc.desc Test SparseArray.find, verify method result (found equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFind008', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5);
        arr.push(0, 2, 3, 4);
        const found = arr.find((v) => v < 1);
        expect(found).assertEqual(0);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPARSE_ARRAY_FIND_0900
     * @tc.name testSparseArrayFind009
     * @tc.desc Test SparseArray.find, verify method result (found equals undefined)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFind009', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | undefined>(5);
        arr.push(undefined, 2, 3, 4);
        const found = arr.find((v) => v === undefined);
        expect(found).assertEqual(undefined);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPARSE_ARRAY_FIND_1000
     * @tc.name testSparseArrayFind010
     * @tc.desc Test SparseArray.find, verify method result (found equals 3, found equals undefined)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFind010', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5);
        arr.push(1, 2, 3, 4);
        let found: int | undefined = arr.find((v) => v > 2);
        expect(found).assertEqual(3);
        found = arr.find((v) => v > 10);
        expect(found).assertEqual(undefined);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPARSE_ARRAY_FIND_1100
     * @tc.name testSparseArrayFind011
     * @tc.desc Test SparseArray.find, verify method result (found equals 5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFind011', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1);
        arr[0] = 5;
        const found = arr.find((v) => v > 2);
        expect(found).assertEqual(5);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPARSE_ARRAY_FIND_1200
     * @tc.name testSparseArrayFind012
     * @tc.desc Test SparseArray.find, verify method result (found equals 500)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFind012', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1000);
        for (let i = 0; i < 1000; i++) {
          arr[i] = i;
        }
        const found = arr.find((v) => v === 500);
        expect(found).assertEqual(500);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPARSE_ARRAY_FIND_1300
     * @tc.name testSparseArrayFind013
     * @tc.desc Test SparseArray.find, verify method result (found equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFind013', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10);
        arr.push(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
        const found = arr.find((v, i) => v % 3 === 0 && i > 3);
        expect(found).assertEqual(3);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPARSE_ARRAY_FIND_1400
     * @tc.name testSparseArrayFind014
     * @tc.desc Test SparseArray.find error path, verify expected exception is thrown (assertFail is triggered, error.name equals "Error")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFind014', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        try {
          const arr = new SparseArray<int>(5);
          arr.push(1, 2, 3, 4);
          arr.find((v) => {
            throw new Error("predicate error");
          });
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("Error");
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPARSE_ARRAY_FIND_1500
     * @tc.name testSparseArrayFind015
     * @tc.desc Test SparseArray.find error path, verify expected exception is thrown (assertFail is triggered, error.name equals "CustomFindError016")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFind015', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        try {
          const arr = new SparseArray<int>(5);
          arr.push(1, 2, 3, 4);
          arr.find((v) => {
            if (v === 2) throw new CustomFindError016("custom error");
            return v > 2;
          });
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("CustomFindError016");
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPARSE_ARRAY_FIND_1600
     * @tc.name testSparseArrayFind016
     * @tc.desc Test SparseArray.find, verify method result (found equals 3, length keeps 9)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFind016', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5);
        arr.push(1, 2, 3, 4);
        const found = arr.find((v) => v > 2);
        expect(found).assertEqual(3);
        expect(arr.length).assertEqual(9);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPARSE_ARRAY_FIND_1700
     * @tc.name testSparseArrayFind017
     * @tc.desc Test SparseArray.find, verify method result (found equals "banana")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFind017', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>(3);
        arr.push("apple", "banana", "cherry");
        const found = arr.find((s) => s.length > 5);
        expect(found).assertEqual("banana");

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPARSE_ARRAY_FIND_1800
     * @tc.name testSparseArrayFind018
     * @tc.desc Test SparseArray.find, verify method result (found equals true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFind018', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<boolean>(5);
        arr.push(false, false, true, true);
        const found = arr.find((b) => b === true);
        expect(found).assertEqual(true);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPARSE_ARRAY_FIND_1900
     * @tc.name testSparseArrayFind019
     * @tc.desc Test SparseArray.find, verify method result (found equals c'C')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFind019', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<char>(5);
        arr[0] = c'A';
        arr[2] = c'C';
        arr[4] = c'E';
        const found = arr.find((ch) => ch > c'B');
        expect(found).assertEqual(c'C');

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPARSE_ARRAY_FIND_2000
     * @tc.name testSparseArrayFind020
     * @tc.desc Test SparseArray.find, verify method result (found name equals "Charlie", age equals 35)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFind020', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<Person021>(3);
        arr[0] = { name: "Alice", age: 25 };
        arr[1] = { name: "Bob", age: 30 };
        arr[2] = { name: "Charlie", age: 35 };
        const found = arr.find((p) => p.age > 30);
        expect(found!.name).assertEqual("Charlie");
        expect(found!.age).assertEqual(35);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPARSE_ARRAY_FIND_2100
     * @tc.name testSparseArrayFind021
     * @tc.desc Test SparseArray.find, verify method result (found equals "hello")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFind021', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | string>(5);
        arr.push(1, "hello", 3, "world", 5);
        const found = arr.find((item) => (typeof item == "string"));
        expect(found).assertEqual("hello");

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPARSE_ARRAY_FIND_2200
     * @tc.name testSparseArrayFind022
     * @tc.desc Test SparseArray.find, verify method result (found equals 5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFind022', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | undefined>(5);
        arr.push(1, undefined, 3, undefined, 5);
        const found = arr.find((item) => item !== undefined && item > 3);
        expect(found).assertEqual(5);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPARSE_ARRAY_FIND_2300
     * @tc.name testSparseArrayFind023
     * @tc.desc Test SparseArray.find, verify method result (found equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFind023', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5);
        arr[0] = 1;
        arr[1] = 2;
        arr[2] = 3;
        arr[3] = 4;
        const found = arr.find((v, i) => i === 2);
        expect(found).assertEqual(3);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPARSE_ARRAY_FIND_2400
     * @tc.name testSparseArrayFind024
     * @tc.desc Test SparseArray.find, verify method result (found equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFind024', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5);
        arr.push(1, 2, 3, 4);
        const found = arr.find((v, i, a) => a.length > 3 && v > 2);
        expect(found).assertEqual(3);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPARSE_ARRAY_FIND_2500
     * @tc.name testSparseArrayFind025
     * @tc.desc Sparse find v>20 returns 30 and callback invoked at most 3 times on sparse array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFind025', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(6);
        arr[0] = 10;
        arr[2] = 30;
        arr[4] = 50;
        let callCount = 0;
        const found = arr.find((v) => {
          callCount++;
          return v > 20;
        });
        expect(found).assertEqual(30);
        expect(callCount).assertLessOrEqual(3);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPARSE_ARRAY_FIND_2600
     * @tc.name testSparseArrayFind026
     * @tc.desc Test SparseArray.find, verify method result (calledIndices.length equals 3, calledIndices[0] equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFind026', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5);
        arr[0] = 10;
        arr[2] = 30;
        arr[4] = 50;
        const calledIndices: Array<int> = [];
        arr.find((v, i) => {
          calledIndices.push(i);
          return v > 40;
        });
        expect(calledIndices.length).assertEqual(3);
        expect(calledIndices[0]).assertEqual(0);
        expect(calledIndices[1]).assertEqual(2);
        expect(calledIndices[2]).assertEqual(4);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPARSE_ARRAY_FIND_2700
     * @tc.name testSparseArrayFind027
     * @tc.desc Test SparseArray.find, verify method result (found equals undefined)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFind027', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5);
        const found = arr.find((v) => v > 2);
        expect(found).assertEqual(undefined);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPARSE_ARRAY_FIND_2800
     * @tc.name testSparseArrayFind028
     * @tc.desc Test SparseArray.find, verify method result (found equals 9999)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFind028', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10000);
        for (let i = 0; i < 10000; i++) {
          arr[i] = i;
        }
        const startTime = Date.now();
        const found = arr.find((v) => v === 9999);
        const endTime = Date.now();
        expect(found).assertEqual(9999);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPARSE_ARRAY_FIND_2900
     * @tc.name testSparseArrayFind029
     * @tc.desc Test SparseArray.find, verify method result (found equals 5000)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFind029', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10000);
        for (let i = 0; i < 10000; i += 100) {
          arr[i] = i;
        }
        const found = arr.find((v) => v === 5000);
        expect(found).assertEqual(5000);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPARSE_ARRAY_FIND_3000
     * @tc.name testSparseArrayFind030
     * @tc.desc Test SparseArray.find, verify method result (found equals 3, callCount equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFind030', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10);
        arr.push(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
        let callCount = 0;
        const found = arr.find((v) => {
          callCount++;
          return v === 3;
        });
        expect(found).assertEqual(3);
        expect(callCount).assertEqual(3);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPARSE_ARRAY_FIND_3100
     * @tc.name testSparseArrayFind031
     * @tc.desc Test SparseArray.find, verify method result (found !== null && found !== undefined is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFind031', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(100);
        for (let i = 0; i < 100; i++) {
          arr[i] = i;
        }
        const found = arr.find((v) => {
          let sum = 0;
          for (let j = 0; j < v; j++) {
            sum += j;
          }
          return sum > 100;
        });
        expect(found).assertEqual(15);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPARSE_ARRAY_FIND_3200
     * @tc.name testSparseArrayFind032
     * @tc.desc find long element matching large business threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFind032', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<long>(1 as long, 10000000000 as long, 3 as long);
        const threshold: long = 1000000000 as long;
        const found = arr.find((v: long): boolean => v > threshold);
        expect(found).assertEqual(10000000000 as long);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPARSE_ARRAY_FIND_3300
     * @tc.name testSparseArrayFind033
     * @tc.desc find short element matching threshold in SparseArray<short>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFind033', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<short>(100 as short, 200 as short, 30000 as short);
        const found = arr.find((v: short): boolean => v > (10000 as short));
        expect(found).assertEqual(30000 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPARSE_ARRAY_FIND_3400
     * @tc.name testSparseArrayFind034
     * @tc.desc find locates null element in SparseArray<int|null>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFind034', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | null>(1, null, 3);
        const found = arr.find((v: int | null): boolean => v === null);
        expect(found).assertEqual(null);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPARSE_ARRAY_FIND_3500
     * @tc.name testSparseArrayFind035
     * @tc.desc find locates XSS script string element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFind035', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const xss = "<script>alert(1)</script>";
        const arr = new SparseArray<string>("a", xss);
        const found = arr.find((v: string): boolean => v === xss);
        expect(found).assertEqual(xss);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPARSE_ARRAY_FIND_3600
     * @tc.name testSparseArrayFind036
     * @tc.desc find locates binary literal element 0b111 in SparseArray<int>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFind036', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 0b111, 3);
        const found = arr.find((v: int): boolean => v === 0b111);
        expect(found).assertEqual(0b111);
    });


  });
}
