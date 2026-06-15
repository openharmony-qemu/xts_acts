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

class Person026 {
    name: string;
    age: int;
    constructor(name: string, age: int) {
      this.name = name;
      this.age = age;
    }
  }

interface ConcatProfile046 {
  id: int
  name: string
}

enum ConcatColor045 {
  Red,
  Green,
  Blue
}

export default function SparseArrayConcatTest(): void {
  describe('SparseArrayConcatTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONCAT_0100
     * @tc.name testSparseArrayConcat001
     * @tc.desc Test SparseArray.concat, verify method result (newArr.length equals 3, newArr[0] equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConcat001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr1 = new SparseArray<int>(1, 2, 3);
        const newArr = arr1.concat();
        expect(newArr.length).assertEqual(3);
        expect(newArr[0]).assertEqual(1);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONCAT_0200
     * @tc.name testSparseArrayConcat002
     * @tc.desc Test SparseArray.concat, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConcat002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr1 = new SparseArray<int>(1, 2);
        const arr2 = [3, 4] as Array<int>;
        const arr3 = [5, 6] as Array<int>;
        const newArr = arr1.concat(arr2, arr3);
        expect(newArr.length).assertEqual(6);
        expect(newArr.toString()).assertEqual("1,2,3,4,5,6");
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONCAT_0300
     * @tc.name testSparseArrayConcat003
     * @tc.desc Test SparseArray.concat, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConcat003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr1 = new SparseArray<int>(1, 2);
        const arr2 = [] as Array<int>;
        const newArr = arr1.concat(arr2);
        expect(newArr.length).assertEqual(2);
        expect(newArr.toString()).assertEqual("1,2");
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONCAT_0400
     * @tc.name testSparseArrayConcat004
     * @tc.desc Test SparseArray.concat, verify method result (newArr.length equals 11)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConcat004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr1 = new SparseArray<int>(10);
        arr1[0] = 1;
        arr1[3] = 4;
        const arr2 = [5] as Array<int>;
        const newArr = arr1.concat(arr2);
        expect(newArr.length).assertEqual(11);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONCAT_0500
     * @tc.name testSparseArrayConcat005
     * @tc.desc Test SparseArray.concat, verify method result (newArr.length equals 7)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConcat005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr1 = new SparseArray<int | undefined>(1, 2);
        arr1.push(undefined);
        const arr2 = [undefined, undefined, undefined, undefined] as Array<int | undefined>;
        const newArr = arr1.concat(arr2);
        expect(newArr.length).assertEqual(7);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONCAT_0600
     * @tc.name testSparseArrayConcat006
     * @tc.desc Test SparseArray.concat with undefined element and empty right operand
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConcat006', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr1 = new SparseArray<int | undefined>(1, undefined, 2);
        const arr2 = [] as Array<int | undefined>;
        const newArr = arr1.concat(arr2);
        expect(newArr.length).assertEqual(3);
        expect(newArr[0]).assertEqual(1);
        expect(newArr[1]).assertUndefined();
        expect(newArr[2]).assertEqual(2);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONCAT_0700
     * @tc.name testSparseArrayConcat007
     * @tc.desc Test SparseArray.concat, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConcat007', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr1 = new SparseArray<string>("a", "b");
        const arr2 = ["c", "d"] as Array<string>;
        const newArr = arr1.concat(arr2);
        expect(newArr.length).assertEqual(4);
        expect(newArr.toString()).assertEqual("a,b,c,d");
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONCAT_0800
     * @tc.name testSparseArrayConcat008
     * @tc.desc Test SparseArray.concat, verify method result (newArr.length equals 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConcat008', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr1 = new SparseArray<int | undefined>(1, 2);
        const arr2 = [undefined, 4] as Array<int | undefined>;
        const newArr = arr1.concat(arr2);
        expect(newArr.length).assertEqual(4);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONCAT_0900
     * @tc.name testSparseArrayConcat009
     * @tc.desc Test SparseArray.concat, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConcat009', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr1 = new SparseArray<int>();
        const arr2 = [1, 2, 3] as Array<int>;
        const newArr = arr1.concat(arr2);
        expect(newArr.length).assertEqual(3);
        expect(newArr.toString()).assertEqual("1,2,3");
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONCAT_1000
     * @tc.name testSparseArrayConcat010
     * @tc.desc Test SparseArray.concat, verify method result (newArr.length equals 7)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConcat010', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr1 = new SparseArray<int>(5);
        arr1[0] = 1;
        arr1[4] = 5;
        const arr2 = [6, 7] as Array<int>;
        const newArr = arr1.concat(arr2);
        expect(newArr.length).assertEqual(7);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONCAT_1100
     * @tc.name testSparseArrayConcat011
     * @tc.desc Test SparseArray.concat, verify method result (newArr.length equals 7)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConcat011', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr1 = new SparseArray<int>(1, 2);
        const arr2 = [3, undefined, undefined, undefined, 7] as Array<int | undefined>;
        const newArr = arr1.concat(arr2 as Array<int>);
        expect(newArr.length).assertEqual(7);
        expect(newArr[0]).assertEqual(1);
        expect(newArr[1]).assertEqual(2);
        expect(newArr[2]).assertEqual(3);
        expect(newArr[3]).assertUndefined();
        expect(newArr[4]).assertUndefined();
        expect(newArr[5]).assertUndefined();
        expect(newArr[6]).assertEqual(7);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONCAT_1200
     * @tc.name testSparseArrayConcat012
     * @tc.desc Test SparseArray.concat, verify method result (newArr !== null && newArr !== undefined is true, newArr instanceof SparseArray is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConcat012', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr1 = new SparseArray<int>(1, 2);
        const arr2 = [3, 4] as Array<int>;
        const newArr = arr1.concat(arr2);
        expect(newArr !== null && newArr !== undefined).assertTrue();
        expect(newArr instanceof SparseArray).assertTrue();
        expect(newArr.length).assertEqual(4);
        expect(newArr.toString()).assertEqual("1,2,3,4");
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONCAT_1300
     * @tc.name testSparseArrayConcat013
     * @tc.desc Test SparseArray.concat, verify method result (newArr !== arr1 is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConcat013', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr1 = new SparseArray<int>(1, 2);
        const arr2 = [3, 4] as Array<int>;
        const newArr = arr1.concat(arr2);
        expect(newArr !== arr1).assertTrue();
        expect(newArr.length).assertEqual(4);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONCAT_1400
     * @tc.name testSparseArrayConcat014
     * @tc.desc Test SparseArray.concat, verify method result (newArr.length equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConcat014', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr1 = new SparseArray<int>();
        const arr2 = [] as Array<int>;
        const newArr = arr1.concat(arr2);
        expect(newArr.length).assertEqual(0);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONCAT_1500
     * @tc.name testSparseArrayConcat015
     * @tc.desc Concat with multi-arg SparseArray (device-safe; avoid length-only (3) + concat).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConcat015', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr1 = new SparseArray<int>(1, 2);
        const arr2 = [3] as Array<int>;
        const newArr = arr1.concat(arr2);
        expect(newArr.length).assertEqual(3);
        expect(newArr[2]).assertEqual(3);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONCAT_1600
     * @tc.name testSparseArrayConcat016
     * @tc.desc Test SparseArray.concat, verify method result (newArr[0] equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConcat016', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr1 = new SparseArray<int>(1, 2);
        const arr2 = [3, 4] as Array<int>;
        const newArr: SparseArray<int> = arr1.concat(arr2);
        expect(newArr.length).assertEqual(4);
        expect(newArr[0]).assertEqual(1);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONCAT_1700
     * @tc.name testSparseArrayConcat017
     * @tc.desc Test SparseArray.concat, verify method result (typeof newArr[0] equals "string")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConcat017', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr1 = new SparseArray<string>("1", "2");
        const arr2 = ["3", "4"] as Array<string>;
        const newArr = arr1.concat(arr2);
        expect(newArr.length).assertEqual(4);
        expect(typeof newArr[0]).assertEqual("string");
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONCAT_1800
     * @tc.name testSparseArrayConcat018
     * @tc.desc Test SparseArray.concat, verify method result (newArr.length equals 2000)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConcat018', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr1 = new SparseArray<int>();
        for (let i = 0; i < 1000; i++) {
          arr1.push(i);
        }
        const arr2 = [] as Array<int>;
        for (let i = 1000; i < 2000; i++) {
          arr2.push(i);
        }
        const newArr = arr1.concat(arr2);
        expect(newArr.length).assertEqual(2000);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONCAT_1900
     * @tc.name testSparseArrayConcat019
     * @tc.desc Test SparseArray.concat, verify method result (arr1.length equals originalLength)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConcat019', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr1 = new SparseArray<int>(1, 2, 3);
        const originalLength = arr1.length;
        const arr2 = [4, 5] as Array<int>;
        arr1.concat(arr2);
        expect(arr1.length).assertEqual(originalLength);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONCAT_2000
     * @tc.name testSparseArrayConcat020
     * @tc.desc Test SparseArray.concat, verify method result (arr1[0] equals 1, arr1[1] equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConcat020', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr1 = new SparseArray<int>(1, 2, 3);
        const arr2 = [4, 5] as Array<int>;
        arr1.concat(arr2);
        expect(arr1[0]).assertEqual(1);
        expect(arr1[1]).assertEqual(2);
        expect(arr1[2]).assertEqual(3);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONCAT_2100
     * @tc.name testSparseArrayConcat021
     * @tc.desc Test SparseArray.concat, verify method result (arr2.length equals 2, arr2[0] equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConcat021', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr1 = new SparseArray<int>(1, 2);
        const arr2 = [3, 4] as Array<int>;
        arr1.concat(arr2);
        expect(arr2.length).assertEqual(2);
        expect(arr2[0]).assertEqual(3);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONCAT_2200
     * @tc.name testSparseArrayConcat022
     * @tc.desc Test SparseArray.concat, verify method result (arr1[0] equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConcat022', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr1 = new SparseArray<int>(1, 2);
        const arr2 = [3, 4] as Array<int>;
        const newArr = arr1.concat(arr2);
        newArr[0] = 99;
        expect(newArr.length).assertEqual(4);
        expect(arr1[0]).assertEqual(1);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONCAT_2300
     * @tc.name testSparseArrayConcat023
     * @tc.desc Test SparseArray.concat, verify method result (newArr[0] equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConcat023', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr1 = new SparseArray<int>(1, 2);
        const arr2 = [3, 4] as Array<int>;
        const newArr = arr1.concat(arr2);
        arr1[0] = 99;
        expect(newArr.length).assertEqual(4);
        expect(newArr[0]).assertEqual(1);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONCAT_2400
     * @tc.name testSparseArrayConcat024
     * @tc.desc Test SparseArray.concat, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConcat024', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr1 = new SparseArray<int>();
        arr1.push(1);
        const newArr = arr1.concat([2, 3, 4] as Array<int>);
        expect(newArr.length).assertEqual(4);
        expect(newArr.toString()).assertEqual("1,2,3,4");
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONCAT_2500
     * @tc.name testSparseArrayConcat025
     * @tc.desc Test SparseArray.concat, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConcat025', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr1 = new SparseArray<int>(1, 2);
        const arr2 = [3, 4] as Array<int>;
        const temp = arr1.concat(arr2);
        const arr3 = [5, 6] as Array<int>;
        const newArr = temp.concat(arr3);
        expect(newArr.length).assertEqual(6);
        expect(newArr.toString()).assertEqual("1,2,3,4,5,6");
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONCAT_2600
     * @tc.name testSparseArrayConcat026
     * @tc.desc Test SparseArray.concat, verify method result (first !== null && first !== undefined is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConcat026', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new SparseArray<Person026>(new Person026("Alice", 20));
        const arr2 = [new Person026("Bob", 25)] as Array<Person026>;
        const newArr = arr1.concat(arr2);
        const first = newArr[0];
        expect(newArr.length).assertEqual(2);
        expect(first !== null && first !== undefined).assertTrue();
        expect((first as Person026).name).assertEqual("Alice");
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONCAT_2700
     * @tc.name testSparseArrayConcat027
     * @tc.desc Test SparseArray.concat, verify method result (newArr.length equals 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConcat027', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr1 = new SparseArray<int | string>(1, "a");
        const arr2 = new Array<int | string>("b", 2);
        const newArr = arr1.concat(arr2);
        expect(newArr.length).assertEqual(4);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONCAT_2800
     * @tc.name testSparseArrayConcat028
     * @tc.desc Test SparseArray.concat error path, verify expected exception is thrown (assertFail is triggered, error.name equals "ClassCastError")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConcat028', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr1 = new SparseArray<int>(1, 2);
        try {
          arr1.concat((null as Object as Array<int>));
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError");
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONCAT_2900
     * @tc.name testSparseArrayConcat029
     * @tc.desc Test SparseArray.concat error path, verify expected exception is thrown (assertFail is triggered, error.name equals "ClassCastError")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConcat029', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr1 = new SparseArray<int>(1, 2);
        try {
          arr1.concat(("invalid" as Object as Array<int>));
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError");
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONCAT_3000
     * @tc.name testSparseArrayConcat030
     * @tc.desc Test SparseArray.concat, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConcat030', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr1 = new SparseArray<int>(1, 2);
        const arr2Sa = new SparseArray<int>(101);
        arr2Sa[100] = 100;
        const arr2 = [] as Array<int | undefined>;
        for (let i = 0; i < arr2Sa.length; i++) {
          arr2.push(arr2Sa[i] as int | undefined);
        }
        const newArr = arr1.concat(arr2 as Array<int>);
        expect(newArr.length).assertEqual(103);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONCAT_3100
     * @tc.name testSparseArrayConcat031
     * @tc.desc Test SparseArray.concat, verify method result (newArr.length equals 200)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConcat031', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr1 = new SparseArray<int>();
        const arr2 = [] as Array<int>;
        for (let i = 0; i < 100; i++) {
          arr1.push(i);
          arr2.push(i + 100);
        }
        const start = Date.now();
        const newArr = arr1.concat(arr2);
        const end = Date.now();
        expect(newArr.length).assertEqual(200);
        expect(end - start).assertLess(5000);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONCAT_3200
     * @tc.name testSparseArrayConcat032
     * @tc.desc Test SparseArray.concat, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConcat032', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new SparseArray<int>();
        arr.push(1);
        const start = Date.now();
        for (let i = 2; i <= 100; i++) {
          arr = arr.concat([i] as Array<int>);
        }
        const end = Date.now();
        expect(arr.length).assertEqual(100);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONCAT_3300
     * @tc.name testSparseArrayConcat033
     * @tc.desc concat result matches literal-built SparseArray (length and toString)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConcat033', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr1 = new SparseArray<int>(1, 2);
        const arr2 = [3, 4] as Array<int>;
        const concatArr = arr1.concat(arr2);
        const fromArr = new SparseArray<int>(1, 2, 3, 4);
        expect(concatArr.length).assertEqual(fromArr.length);
        expect(concatArr.toString()).assertEqual(fromArr.toString());
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONCAT_3400
     * @tc.name testSparseArrayConcat034
     * @tc.desc concat SparseArray<byte> with byte Array, verify byte elements merged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConcat034', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr1 = new SparseArray<byte>(10 as byte, 20 as byte);
        const arr2 = [30 as byte, 40 as byte] as Array<byte>;
        const result = arr1.concat(arr2);
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(10 as byte);
        expect(result[3]).assertEqual(40 as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONCAT_3500
     * @tc.name testSparseArrayConcat035
     * @tc.desc concat SparseArray<Set<int>> merges set elements in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConcat035', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const s1 = new Set<int>([1, 2]);
        const s2 = new Set<int>([3]);
        const arr1 = new SparseArray<Set<int>>();
        arr1.push(s1);
        const arr2 = [s2] as Array<Set<int>>;
        const result = arr1.concat(arr2);
        expect(result.length).assertEqual(2);
        expect(result[0]!.size).assertEqual(2);
        expect(result[1]!.size).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONCAT_3600
     * @tc.name testSparseArrayConcat036
     * @tc.desc concat merges SparseArray elements including zero-length inner SparseArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConcat036', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const inner = new SparseArray<int>();
        const outer = new SparseArray<SparseArray<int>>();
        outer.push(inner);
        const tailInner = new SparseArray<int>();
        tailInner[0] = 9;
        const tail = [tailInner] as Array<SparseArray<int>>;
        const result = outer.concat(tail);
        expect(result.length).assertEqual(2);
        expect(result[0]!.length).assertEqual(0);
        expect(result[1]![0]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONCAT_3700
     * @tc.name testSparseArrayConcat037
     * @tc.desc concat appends SparseArray with hex literal element 0xFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConcat037', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const base = new SparseArray<int>(1, 2);
        const tail = [0xFF] as Array<int>;
        const result = base.concat(tail);
        expect(result.length).assertEqual(3);
        expect(result[2]).assertEqual(0xFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONCAT_3800
     * @tc.name testSparseArrayConcat038
     * @tc.desc concat SparseArray<short> with short Array, verify short elements merged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConcat038', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr1 = new SparseArray<short>(10 as short, 20 as short);
        const arr2 = [30 as short, 40 as short] as Array<short>;
        const result = arr1.concat(arr2);
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(10 as short);
        expect(result[3]).assertEqual(40 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONCAT_3900
     * @tc.name testSparseArrayConcat039
     * @tc.desc concat SparseArray<long> with long Array, verify long elements merged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConcat039', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr1 = new SparseArray<long>(100 as long, 200 as long);
        const arr2 = [300 as long, 400 as long] as Array<long>;
        const result = arr1.concat(arr2);
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(100 as long);
        expect(result[3]).assertEqual(400 as long);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONCAT_4000
     * @tc.name testSparseArrayConcat040
     * @tc.desc concat SparseArray<float> with float Array, verify float elements merged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConcat040', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr1 = new SparseArray<float>(1.0f, 2.5f);
        const arr2 = [3.5f, 4.5f] as Array<float>;
        const result = arr1.concat(arr2);
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(1.0f);
        expect(result[3]).assertEqual(4.5f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONCAT_4100
     * @tc.name testSparseArrayConcat041
     * @tc.desc concat SparseArray<double> with double Array, verify double elements merged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConcat041', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr1 = new SparseArray<double>(1.1, 2.2);
        const arr2 = [3.3, 4.4] as Array<double>;
        const result = arr1.concat(arr2);
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(1.1);
        expect(result[3]).assertEqual(4.4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONCAT_4200
     * @tc.name testSparseArrayConcat042
     * @tc.desc concat SparseArray<number> with number Array, verify number elements merged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConcat042', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr1 = new SparseArray<number>(1.5, 2.5);
        const arr2 = [3.5, 4.5] as Array<number>;
        const result = arr1.concat(arr2);
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(1.5);
        expect(result[3]).assertEqual(4.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONCAT_4300
     * @tc.name testSparseArrayConcat043
     * @tc.desc concat SparseArray<boolean> with boolean Array, verify boolean elements merged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConcat043', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr1 = new SparseArray<boolean>(true, false);
        const arr2 = [false, true] as Array<boolean>;
        const result = arr1.concat(arr2);
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(true);
        expect(result[3]).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONCAT_4400
     * @tc.name testSparseArrayConcat044
     * @tc.desc concat SparseArray<char> with char Array, verify char elements merged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConcat044', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr1 = new SparseArray<char>(c'A', c'B');
        const arr2 = [c'C', c'D'] as Array<char>;
        const result = arr1.concat(arr2);
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(c'A');
        expect(result[3]).assertEqual(c'D');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONCAT_4500
     * @tc.name testSparseArrayConcat045
     * @tc.desc concat SparseArray<ConcatColor045> with enum Array, verify enum elements merged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConcat045', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr1 = new SparseArray<ConcatColor045>(ConcatColor045.Red, ConcatColor045.Green);
        const arr2 = [ConcatColor045.Blue] as Array<ConcatColor045>;
        const result = arr1.concat(arr2);
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(ConcatColor045.Red);
        expect(result[2]).assertEqual(ConcatColor045.Blue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONCAT_4600
     * @tc.name testSparseArrayConcat046
     * @tc.desc concat SparseArray<ConcatProfile046> with interface Array, verify interface elements merged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConcat046', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const first: ConcatProfile046 = { id: 1, name: "Alice" };
        const second: ConcatProfile046 = { id: 2, name: "Bob" };
        const arr1 = new SparseArray<ConcatProfile046>(first);
        const arr2 = [second] as Array<ConcatProfile046>;
        const result = arr1.concat(arr2);
        expect(result.length).assertEqual(2);
        expect(result[0]!.name).assertEqual("Alice");
        expect(result[1]!.id).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONCAT_4700
     * @tc.name testSparseArrayConcat047
     * @tc.desc concat SparseArray<Map<string,int>> with Map Array, verify Map elements merged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConcat047', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const first = new Map<string, int>();
        first.set("id", 1);
        const second = new Map<string, int>();
        second.set("id", 2);
        const arr1 = new SparseArray<Map<string, int>>(first);
        const arr2 = [second] as Array<Map<string, int>>;
        const result = arr1.concat(arr2);
        expect(result.length).assertEqual(2);
        expect(result[0]!.get("id")).assertEqual(1);
        expect(result[1]!.get("id")).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONCAT_4800
     * @tc.name testSparseArrayConcat048
     * @tc.desc concat SparseArray<Array<int>> with Array<int> Array, verify nested Array elements merged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConcat048', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const first = [1, 2] as Array<int>;
        const second = [3, 4] as Array<int>;
        const arr1 = new SparseArray<Array<int>>(first);
        const arr2 = [second] as Array<Array<int>>;
        const result = arr1.concat(arr2);
        expect(result.length).assertEqual(2);
        expect(result[0]![1]).assertEqual(2);
        expect(result[1]![0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONCAT_4900
     * @tc.name testSparseArrayConcat049
     * @tc.desc concat SparseArray<int|null> with nullable Array, verify null element merged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConcat049', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr1 = new SparseArray<int | null>(1, null);
        const arr2 = [2, null] as Array<int | null>;
        const result = arr1.concat(arr2);
        expect(result.length).assertEqual(4);
        expect(result[0]).assertEqual(1);
        expect(result[1]).assertNull();
        expect(result[3]).assertNull();
    });
  });
}
