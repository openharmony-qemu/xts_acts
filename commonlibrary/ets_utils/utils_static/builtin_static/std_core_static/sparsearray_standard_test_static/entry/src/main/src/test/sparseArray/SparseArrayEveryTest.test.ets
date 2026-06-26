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

type SparseArrayIntEveryPred = (v: int, i: int, a: SparseArray<int>) => boolean;

class CustomError028 extends Error {
    constructor(message: string) {
      super(message);
      this.name = "CustomError028";
    }
  }

class Person030 {
    name: string;
    age: int;
    constructor(name: string, age: int) {
      this.name = name;
      this.age = age;
    }
  }



export default function SparseArrayEveryTest(): void {
  describe('SparseArrayEveryTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_EVERY_0100
     * @tc.name testSparseArrayEvery001
     * @tc.desc Every [1,2,3] with v>0: result true, typeof boolean, assertEqual(true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayEvery001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.every((v, i, a) => v > 0);
        expect(result).assertTrue();
        expect(typeof result).assertEqual("boolean");
        expect(result).assertEqual(true);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_EVERY_0200
     * @tc.name testSparseArrayEvery002
     * @tc.desc Test SparseArray.every, verify method result (result is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayEvery002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.every(() => true);
        expect(result).assertTrue();
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_EVERY_0300
     * @tc.name testSparseArrayEvery003
     * @tc.desc Test SparseArray.every, verify method result (result is false)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayEvery003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.every(() => false);
        expect(result).assertFalse();
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_EVERY_0400
     * @tc.name testSparseArrayEvery004
     * @tc.desc Test SparseArray.every, verify method result (result is false)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayEvery004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, -2, 3);
        const result = arr.every((v) => v > 0);
        expect(result).assertFalse();
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_EVERY_0500
     * @tc.name testSparseArrayEvery005
     * @tc.desc Verify every returns false when boolean predicate fails on last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayEvery005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.every((v: int): boolean => v < 3);
        expect(result).assertFalse();
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_EVERY_0600
     * @tc.name testSparseArrayEvery006
     * @tc.desc Test SparseArray.every error path, verify expected exception is thrown (assertFail is triggered, error.name equals "ClassCastError")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayEvery006', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        try {
          arr.every(null as SparseArrayIntEveryPred);
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError");
        }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_EVERY_0700
     * @tc.name testSparseArrayEvery007
     * @tc.desc Test SparseArray.every error path, verify expected exception is thrown (assertFail is triggered, error.name equals "ClassCastError")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayEvery007', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        try {
          arr.every(undefined as SparseArrayIntEveryPred);
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError");
        }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_EVERY_0800
     * @tc.name testSparseArrayEvery008
     * @tc.desc Test SparseArray.every, verify method result (values.length equals 3, values[0] equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayEvery008', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const values: Array<int> = [];
        arr.every((v) => {
          values.push(v);
          return true;
        });
        expect(values.length).assertEqual(3);
        expect(values[0]).assertEqual(1);
        expect(values[1]).assertEqual(2);
        expect(values[2]).assertEqual(3);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_EVERY_0900
     * @tc.name testSparseArrayEvery009
     * @tc.desc Test SparseArray.every, verify method result (result is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayEvery009', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(2147483647, 2147483647);
        const result = arr.every((v) => v === 2147483647);
        expect(result).assertTrue();
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_EVERY_1000
     * @tc.name testSparseArrayEvery010
     * @tc.desc Test SparseArray.every, verify method result (result is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayEvery010', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(0, 1, 2);
        const result = arr.every((v) => v >= 0);
        expect(result).assertTrue();
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_EVERY_1100
     * @tc.name testSparseArrayEvery011
     * @tc.desc Test SparseArray.every, verify method result (result is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayEvery011', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(-1, -2, -3);
        const result = arr.every((v) => v < 0);
        expect(result).assertTrue();
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_EVERY_1200
     * @tc.name testSparseArrayEvery012
     * @tc.desc Test SparseArray.every, verify method result (result is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayEvery012', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("a", "b", "c");
        const result = arr.every((v) => v.length > 0);
        expect(result).assertTrue();
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_EVERY_1300
     * @tc.name testSparseArrayEvery013
     * @tc.desc Test SparseArray.every, verify method result (result is false)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayEvery013', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<boolean>(true, true, false);
        const result = arr.every((v) => v === true);
        expect(result).assertFalse();
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_EVERY_1400
     * @tc.name testSparseArrayEvery014
     * @tc.desc Test SparseArray.every, verify method result (indices.length equals 3, indices[0] equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayEvery014', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const indices: Array<int> = [];
        arr.every((v, i) => {
          indices.push(i);
          return true;
        });
        expect(indices.length).assertEqual(3);
        expect(indices[0]).assertEqual(0);
        expect(indices[1]).assertEqual(1);
        expect(indices[2]).assertEqual(2);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_EVERY_1500
     * @tc.name testSparseArrayEvery015
     * @tc.desc Test SparseArray.every, verify method result (firstIndex equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayEvery015', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1);
        arr[0] = 1;
        let firstIndex: int = -1;
        arr.every((v, i) => {
          firstIndex = i;
          return true;
        });
        expect(firstIndex).assertEqual(0);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_EVERY_1600
     * @tc.name testSparseArrayEvery016
     * @tc.desc Test SparseArray.every, verify method result (lastIndex equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayEvery016', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        let lastIndex: int = -1;
        arr.every((v, i) => {
          lastIndex = i;
          return true;
        });
        expect(lastIndex).assertEqual(2);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_EVERY_1700
     * @tc.name testSparseArrayEvery017
     * @tc.desc Test SparseArray.every, verify method result (receivedArray !== null && receivedArray !== undefined is true, receivedArray equals arr)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayEvery017', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        let receivedArray: SparseArray<int> | null = null;
        arr.every((v, i, a) => {
          receivedArray = a;
          return true;
        });
        expect(receivedArray !== null && receivedArray !== undefined).assertTrue();
        expect(receivedArray).assertEqual(arr);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_EVERY_1800
     * @tc.name testSparseArrayEvery018
     * @tc.desc Test SparseArray.every, verify method result (arr[0] equals 100)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayEvery018', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        arr.every((v, i, a) => {
          a[0] = 100;
          return true;
        });
        expect(arr[0]).assertEqual(100);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_EVERY_1900
     * @tc.name testSparseArrayEvery019
     * @tc.desc Test SparseArray.every, verify method result (arrayLength equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayEvery019', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        let arrayLength: int = -1;
        arr.every((v, i, a) => {
          arrayLength = a.length;
          return true;
        });
        expect(arrayLength).assertEqual(3);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_EVERY_2000
     * @tc.name testSparseArrayEvery020
     * @tc.desc Test SparseArray.every, verify method result (callCount equals 3, result is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayEvery020', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5);
        arr[0] = 10;
        arr[2] = 30;
        arr[4] = 50;
        let callCount: int = 0;
        const result = arr.every((v) => {
          callCount++;
          return v > 0;
        });
        expect(callCount).assertEqual(3);
        expect(result).assertTrue();
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_EVERY_2100
     * @tc.name testSparseArrayEvery021
     * @tc.desc Test SparseArray.every, verify method result (result is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayEvery021', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        const result = arr.every((v) => v > 0);
        expect(result).assertTrue();
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_EVERY_2200
     * @tc.name testSparseArrayEvery022
     * @tc.desc Test SparseArray.every, verify method result (callCount equals 1, result is false)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayEvery022', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(-1, 2, 3);
        let callCount: int = 0;
        const result = arr.every((v) => {
          callCount++;
          return v > 0;
        });
        expect(callCount).assertEqual(1);
        expect(result).assertFalse();
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_EVERY_2300
     * @tc.name testSparseArrayEvery023
     * @tc.desc Test SparseArray.every, verify method result (callCount equals 3, result is false)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayEvery023', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, -3, 4);
        let callCount: int = 0;
        const result = arr.every((v) => {
          callCount++;
          return v > 0;
        });
        expect(callCount).assertEqual(3);
        expect(result).assertFalse();
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_EVERY_2400
     * @tc.name testSparseArrayEvery024
     * @tc.desc Test SparseArray.every, verify method result (result is false)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayEvery024', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("a", "b", "");
        const result = arr.every((v) => v.length > 0);
        expect(result).assertFalse();
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_EVERY_2500
     * @tc.name testSparseArrayEvery025
     * @tc.desc Test SparseArray.every, verify method result (result is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayEvery025', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<boolean>(true, true, true);
        const result = arr.every((v) => v === true);
        expect(result).assertTrue();
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_EVERY_2600
     * @tc.name testSparseArrayEvery026
     * @tc.desc Test SparseArray.every, verify method result (arr.length === 0 is true, result is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayEvery026', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(-1);
        expect(arr.length === 0).assertTrue();
        const result = arr.every((v) => v > 0);
        expect(result).assertTrue();
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_EVERY_2700
     * @tc.name testSparseArrayEvery027
     * @tc.desc Test SparseArray.every, verify method result (result is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayEvery027', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1000);
        for (let i = 0; i < 1000; i++) {
          arr[i] = i;
        }
        const result = arr.every((v) => v >= 0);
        expect(result).assertTrue();
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_EVERY_2800
     * @tc.name testSparseArrayEvery028
     * @tc.desc Test SparseArray.every error path, verify expected exception is thrown (assertFail is triggered, error.name equals "CustomError028")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayEvery028', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        try {
          const arr = new SparseArray<int>(1, 2, 3);
          arr.every(() => {
            throw new CustomError028("custom error");
          });
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("CustomError028");
        }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_EVERY_2900
     * @tc.name testSparseArrayEvery029
     * @tc.desc every propagates callback Error with expected name and message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayEvery029', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const arr = new SparseArray<int>(1, 2, 3);
        try {
          arr.every(() => {
            throw new Error("error");
          });
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("Error");
          expect(error.message).assertEqual("error");
        }

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_EVERY_3000
     * @tc.name testSparseArrayEvery030
     * @tc.desc Test SparseArray.every, verify method result (result is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayEvery030', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<Person030>(new Person030("Alice", 20), new Person030("Bob", 25));
        const result = arr.every((p: Person030) => p.age > 18);
        expect(result).assertTrue();
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_EVERY_3100
     * @tc.name testSparseArrayEvery031
     * @tc.desc Test SparseArray.every, verify method result (visitedIndices.length equals 3, visitedIndices[0] equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayEvery031', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5);
        arr[0] = 10;
        arr[2] = 30;
        arr[4] = 50;
        const visitedIndices: Array<int> = [];
        arr.every((v, i) => {
          visitedIndices.push(i);
          return true;
        });
        expect(visitedIndices.length).assertEqual(3);
        expect(visitedIndices[0]).assertEqual(0);
        expect(visitedIndices[1]).assertEqual(2);
        expect(visitedIndices[2]).assertEqual(4);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_EVERY_3200
     * @tc.name testSparseArrayEvery032
     * @tc.desc Test SparseArray.every, verify method result (arr[0] equals 2, arr[1] equals 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayEvery032', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        arr.every((v, i, a) => {
          a[i] = v * 2;
          return true;
        });
        expect(arr[0]).assertEqual(2);
        expect(arr[1]).assertEqual(4);
        expect(arr[2]).assertEqual(6);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_EVERY_3300
     * @tc.name testSparseArrayEvery033
     * @tc.desc Test SparseArray.every, verify method result (arr.length equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayEvery033', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4, 5);
        arr.every((v, i, a) => {
          if (i === 2) {
            a.length = 2;
          }
          return true;
        });
        expect(arr.length).assertEqual(2);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_EVERY_3400
     * @tc.name testSparseArrayEvery034
     * @tc.desc Test SparseArray.every, verify method result (arr.length equals 4, arr[3] equals 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayEvery034', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        arr.every((v, i, a) => {
          if (i === 0) {
            a.push(4);
          }
          return true;
        });
        expect(arr.length).assertEqual(4);
        expect(arr[3]).assertEqual(4);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_EVERY_3500
     * @tc.name testSparseArrayEvery035
     * @tc.desc every on SparseArray<short> returns true when all elements positive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayEvery035', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<short>(10 as short, 20 as short, 30 as short);
        const allPositive = arr.every((v: short): boolean => v > 0 as short);
        expect(allPositive).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_EVERY_3600
     * @tc.name testSparseArrayEvery036
     * @tc.desc every on SparseArray<byte> returns true when all byte elements below 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayEvery036', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<byte>(10 as byte, 127 as byte, 20 as byte);
        const ok = arr.every((v: byte): boolean => Byte.toInt(v) < 128);
        expect(ok).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_EVERY_3700
     * @tc.name testSparseArrayEvery037
     * @tc.desc every returns false when array contains null element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayEvery037', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | null>(1, null, 3);
        const allNonNull = arr.every((v: int | null): boolean => v !== null);
        expect(allNonNull).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_EVERY_3800
     * @tc.name testSparseArrayEvery038
     * @tc.desc every on array with 0xA and 0b101 elements all satisfy v >= 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayEvery038', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(0xA, 0b101, 0);
        const ok = arr.every((v: int): boolean => v >= 0);
        expect(ok).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_EVERY_3900
     * @tc.name testSparseArrayEvery039
     * @tc.desc every returns true when all elements are empty strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayEvery039', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("", "", "");
        const ok = arr.every((v: string): boolean => v.length === 0);
        expect(ok).assertTrue();
    });

  });
}
