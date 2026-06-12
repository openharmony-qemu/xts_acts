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

type SparseArrayIntFindLastPred = (v: int) => boolean;

class Person009 {
    name: string = "";
    age: int = 0;
  }

export default function SparseArrayFindLastTest(): void {
  describe('SparseArrayFindLastTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_0100
     * @tc.name testSparseArrayFindLast001
     * @tc.desc Test SparseArray.findLast, verify method result (found equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindLast001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const found = arr.findLast((v) => v > 1);
        expect(found).assertEqual(3);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_0200
     * @tc.name testSparseArrayFindLast002
     * @tc.desc Test SparseArray.findLast, verify method result (found equals 50)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindLast002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5);
        arr[0] = 10;
        arr[2] = 30;
        arr[4] = 50;
        const found = arr.findLast((v) => v > 20);
        expect(found).assertEqual(50);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_0300
     * @tc.name testSparseArrayFindLast003
     * @tc.desc Test SparseArray.findLast, verify method result (found is undefined)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindLast003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const found = arr.findLast((v) => v > 100);
        expect(found).assertUndefined();
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_0400
     * @tc.name testSparseArrayFindLast004
     * @tc.desc Test SparseArray.findLast, verify method result (found equals 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindLast004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4, 5);
        const found = arr.findLast((v, i) => v % 2 === 0 && i > 2);
        expect(found).assertEqual(4);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_0500
     * @tc.name testSparseArrayFindLast005
     * @tc.desc Test SparseArray.findLast, verify method result (found equals 20)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindLast005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5);
        arr[1] = 10;
        arr[3] = 20;
        arr[5] = 30;
        const found = arr.findLast((v, i) => i === 3);
        expect(found).assertEqual(20);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_0600
     * @tc.name testSparseArrayFindLast006
     * @tc.desc Test SparseArray.findLast, verify method result (found equals 5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindLast006', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4, 5);
        const found = arr.findLast((v, i, a) => a.length > 4);
        expect(found).assertEqual(5);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_0700
     * @tc.name testSparseArrayFindLast007
     * @tc.desc findLast on strings: startsWith match and lexicographic compare (v > "b")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindLast007', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("apple", "banana", "cherry");
        const found = arr.findLast((v) => v.startsWith("c"));
        expect(found).assertEqual("cherry");

        const arr2 = new SparseArray<string>("a", "b", "c");
        const found2 = arr2.findLast((v) => v > "b");
        expect(found2).assertEqual("c");
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_0800
     * @tc.name testSparseArrayFindLast008
     * @tc.desc Test SparseArray.findLast, verify method result (found equals 3.5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindLast008', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<number>(1.5, 2.5, 3.5);
        const found = arr.findLast((v) => v > 2.0);
        expect(found).assertEqual(3.5);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_0900
     * @tc.name testSparseArrayFindLast009
     * @tc.desc Test SparseArray.findLast, verify method result (found equals p2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindLast009', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<Person009>();
        let p1 = new Person009();
        p1.name = "Alice";
        p1.age = 20;
        let p2 = new Person009();
        p2.name = "Bob";
        p2.age = 30;
        arr.push(p1, p2);
        const found = arr.findLast((v) => v.age > 25);
        expect(found).assertEqual(p2);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_1000
     * @tc.name testSparseArrayFindLast010
     * @tc.desc Test SparseArray.findLast, verify method result (found is undefined)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindLast010', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        const found = arr.findLast((v) => v > 0);
        expect(found).assertUndefined();
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_1100
     * @tc.name testSparseArrayFindLast011
     * @tc.desc Test SparseArray.findLast, verify method result (found equals 42)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindLast011', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        arr[0] = 42;
        const found = arr.findLast((v) => v > 0);
        expect(found).assertEqual(42);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_1200
     * @tc.name testSparseArrayFindLast012
     * @tc.desc Test SparseArray.findLast, verify method result (found equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindLast012', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const found = arr.findLast((v) => v < 2);
        expect(found).assertEqual(1);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_1300
     * @tc.name testSparseArrayFindLast013
     * @tc.desc Test SparseArray.find Last error path, verify expected exception is thrown (assertFail is triggered, error.name equals "Error")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindLast013', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        try {
          const arr = new SparseArray<int>(1, 2, 3);
          arr.findLast(() => {
            throw new Error("predicate error");
          });
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("Error");
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_1400
     * @tc.name testSparseArrayFindLast014
     * @tc.desc Test SparseArray.findLast, verify method result (found is undefined)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindLast014', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5);
        const found = arr.findLast((v) => v > 0);
        expect(found).assertUndefined();
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_1500
     * @tc.name testSparseArrayFindLast015
     * @tc.desc Test SparseArray.findLast, verify method result (found equals 40)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindLast015', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        arr[0] = 10;
        arr[2] = 20;
        arr[4] = 30;
        arr[6] = 40;
        const found = arr.findLast((v) => v > 25);
        expect(found).assertEqual(40);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_1600
     * @tc.name testSparseArrayFindLast016
     * @tc.desc Test SparseArray.findLast, verify method result (found equals 5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindLast016', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4, 5);
        const found = arr.findLast((v) => v > 2);
        expect(found).assertEqual(5);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_1700
     * @tc.name testSparseArrayFindLast017
     * @tc.desc Test SparseArray.findLast, verify method result (found equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindLast017', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 2, 1);
        const found = arr.findLast((v) => v === 2);
        expect(found).assertEqual(2);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_1800
     * @tc.name testSparseArrayFindLast018
     * @tc.desc Test SparseArray.findLast, verify method result (found is null)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindLast018', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | null | undefined>(1, null, 2);
        const found = arr.findLast((v) => v === null);
        expect(found).assertNull();
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_1900
     * @tc.name testSparseArrayFindLast019
     * @tc.desc Test SparseArray.findLast, verify method result (found is undefined)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindLast019', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | undefined>();
        arr[0] = 1;
        arr[1] = undefined;
        arr[2] = 2;
        const found = arr.findLast((v) => v === undefined);
        expect(found).assertUndefined();
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_2000
     * @tc.name testSparseArrayFindLast020
     * @tc.desc Test SparseArray.find Last error path, verify expected exception is thrown (assertFail is triggered, error.name equals "Error")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindLast020', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        try {
          const arr = new SparseArray<int>(1, 2, 3);
          arr.findLast((v) => {
            if (v === 2) {
              throw new Error("found 2");
            }
            return false;
          });
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("Error");
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_2100
     * @tc.name testSparseArrayFindLast021
     * @tc.desc Test SparseArray.findLast, verify method result (found equals 2147483647)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindLast021', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        arr[0] = 2147483647;
        const found = arr.findLast((v) => v > 0);
        expect(found).assertEqual(2147483647);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_2200
     * @tc.name testSparseArrayFindLast022
     * @tc.desc Test SparseArray.findLast, verify method result (found equals -2147483648)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindLast022', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        arr[0] = -2147483648;
        const found = arr.findLast((v) => v < 0);
        expect(found).assertEqual(-2147483648);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_2300
     * @tc.name testSparseArrayFindLast023
     * @tc.desc Test SparseArray.findLast, verify method result (found equals 9999)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindLast023', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        for (let i = 0; i < 10000; i++) {
          arr.push(i);
        }
        const startTime = Date.now();
        const found = arr.findLast((v) => v === 9999);
        const endTime = Date.now();
        expect(found).assertEqual(9999);
        expect(endTime - startTime).assertLess(1000);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_2400
     * @tc.name testSparseArrayFindLast024
     * @tc.desc Test SparseArray.findLast, verify method result (found equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindLast024', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10000);
        arr[0] = 1;
        arr[9999] = 2;
        const found = arr.findLast((v) => v === 2);
        expect(found).assertEqual(2);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_2500
     * @tc.name testSparseArrayFindLast025
     * @tc.desc findLast on SparseArray<short> returns last matching short element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindLast025', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<short>(100 as short, 200 as short, 300 as short);
        const found = arr.findLast((v: short): boolean => v >= 300 as short);
        expect(found).assertEqual(300 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_2600
     * @tc.name testSparseArrayFindLast026
     * @tc.desc findLast returns last hex literal element 0xFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindLast026', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 0xFF, 0xFF, 2);
        const found = arr.findLast((v: int): boolean => v === 0xFF);
        expect(found).assertEqual(0xFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_2700
     * @tc.name testSparseArrayFindLast027
     * @tc.desc Test SparseArray.findLast error path, verify expected exception is thrown (assertFail is triggered, error.name equals "ClassCastError")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindLast027', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        try {
          arr.findLast(null as SparseArrayIntFindLastPred);
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError");
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_2800
     * @tc.name testSparseArrayFindLast028
     * @tc.desc Test SparseArray.findLast error path, verify expected exception is thrown (assertFail is triggered, error.name equals "ClassCastError")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindLast028', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        try {
          arr.findLast(undefined as SparseArrayIntFindLastPred);
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError");
        }
    });

  });
}
