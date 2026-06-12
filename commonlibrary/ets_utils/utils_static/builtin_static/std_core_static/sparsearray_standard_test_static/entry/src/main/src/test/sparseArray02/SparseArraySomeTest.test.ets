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


class CustomError021 extends Error {
    constructor(message: string) {
      super(message);
      this.name = "CustomError021";
    }
  }

class Item028 {
    id: int;
    name: string;
    constructor(id: int, name: string) {
      this.id = id;
      this.name = name;
    }
  }

export default function SparseArraySomeTest(): void {
  describe('SparseArraySomeTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SOME_0100
     * @tc.name testSparseArraySome001
     * @tc.desc Test SparseArray.some, verify method result (ok is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySome001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const ok = arr.some((v: int, _i: int, _a: SparseArray<int>): boolean => v > 0);
        expect(ok).assertTrue();
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SOME_0200
     * @tc.name testSparseArraySome002
     * @tc.desc some(v > 2) on [1,2,3], verify true result, boolean type, and strict equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySome002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.some((v: int, _i: int, _a: SparseArray<int>): boolean => v > 2);
        expect(result).assertEqual(true);
        expect(typeof result).assertEqual("boolean");
        expect(result === true).assertEqual(true);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SOME_0300
     * @tc.name testSparseArraySome003
     * @tc.desc some(v > 3) on [5,6,4], verify all elements satisfy predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySome003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5, 6, 4);
        const ok = arr.some((v: int): boolean => v > 3);
        expect(ok).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SOME_0400
     * @tc.name testSparseArraySome004
     * @tc.desc some(v > 7) on [6,2,5], verify no element satisfies predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySome004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(6, 2, 5);
        const ok = arr.some((v: int): boolean => v > 7);
        expect(ok).assertFalse();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SOME_0500
     * @tc.name testSparseArraySome005
     * @tc.desc Test SparseArray.some, verify method result (ok is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySome005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const ok = arr.some((v: int, _i: int, _a: SparseArray<int>): boolean => v === 2);
        expect(ok).assertTrue();
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SOME_0600
     * @tc.name testSparseArraySome006
     * @tc.desc some(v >= 6) on [3,6,3], verify predicate matches at least one element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySome006', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(3, 6, 3);
        const ok = arr.some((v: int): boolean => v >= 6);
        expect(ok).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SOME_0700
     * @tc.name testSparseArraySome007
     * @tc.desc some throws when v===2, verify instanceof SparseArray and Error is caught
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySome007', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        expect(arr instanceof SparseArray).assertTrue();
        try {
          arr.some((v: int): boolean => {
            if (v === 2) {
              throw new Error("test error");
            }
            return v > 2;
          });
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("Error");
        }

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SOME_0800
     * @tc.name testSparseArraySome008
     * @tc.desc Test SparseArray.some, verify method result (array === arr is true, result equals false)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySome008', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.some((value: int, index: int, array: SparseArray<int>): boolean => {
          expect(array === arr).assertTrue();
          return false;
        });
        expect(result).assertEqual(false);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SOME_0900
     * @tc.name testSparseArraySome009
     * @tc.desc Test SparseArray.some, verify method result (result equals true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySome009', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.some((v: int, i: int): boolean => v > 1 && i > 0);
        expect(result).assertEqual(true);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SOME_1000
     * @tc.name testSparseArraySome010
     * @tc.desc some(v > 5) on [1,2,3], verify false result and strict false equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySome010', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.some((v: int): boolean => v > 5);
        expect(result).assertEqual(false);
        expect(result === false).assertEqual(true);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SOME_1100
     * @tc.name testSparseArraySome011
     * @tc.desc Test SparseArray.some, verify method result (result equals false)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySome011', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        const result = arr.some((v: int): boolean => v > 0);
        expect(result).assertEqual(false);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SOME_1200
     * @tc.name testSparseArraySome012
     * @tc.desc Test SparseArray.some, verify method result (result equals true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySome012', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5);
        arr[0] = 1;
        arr[2] = 3;  
        arr[4] = 5;  
        const result = arr.some((v: int): boolean => v > 2);
        expect(result).assertEqual(true);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SOME_1300
     * @tc.name testSparseArraySome013
     * @tc.desc Test SparseArray.some, verify method result (result equals false)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySome013', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5);
        arr[0] = 1;
        arr[2] = 2;  
        arr[4] = 3;  
        const result = arr.some((v: int): boolean => v > 5);
        expect(result).assertEqual(false);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SOME_1400
     * @tc.name testSparseArraySome014
     * @tc.desc Test SparseArray.some, verify method result (count equals 2, result equals true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySome014', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5);
        arr[0] = 1;
        arr[2] = 3;  
        let count = 0;
        const result = arr.some((v: int, i: int): boolean => {
          count++;
          return v > 2;
        });
        expect(count).assertEqual(2);
        expect(result).assertEqual(true);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SOME_1500
     * @tc.name testSparseArraySome015
     * @tc.desc Test SparseArray.some, verify method result (result equals false)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySome015', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5);
        const result = arr.some((v: int): boolean => v > 2);
        expect(result).assertEqual(false);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SOME_1600
     * @tc.name testSparseArraySome016
     * @tc.desc Test SparseArray.some, verify method result (result equals false)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySome016', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1);
        const result = arr.some((v: int): boolean => v > 2);
        expect(result).assertEqual(false);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SOME_1700
     * @tc.name testSparseArraySome017
     * @tc.desc Test SparseArray.some, verify method result (result equals false)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySome017', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4, 5);
        const result = arr.some((v: int): boolean => false);
        expect(result).assertEqual(false);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SOME_1800
     * @tc.name testSparseArraySome018
     * @tc.desc Test SparseArray.some, verify method result (result equals true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySome018', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4, 5);
        const result = arr.some((v: int): boolean => true);
        expect(result).assertEqual(true);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SOME_1900
     * @tc.name testSparseArraySome019
     * @tc.desc Test SparseArray.some, verify method result (result equals true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySome019', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        for (let i = 0; i < 1000; i++) {
          arr.push(i);
        }
        const result = arr.some((v: int): boolean => v > 500);
        expect(result).assertEqual(true);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SOME_2000
     * @tc.name testSparseArraySome020
     * @tc.desc Test SparseArray.some, verify method result (result equals true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySome020', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1000);
        arr[0] = 1;
        arr[500] = 2;
        arr[999] = 3;
        const result = arr.some((v: int): boolean => v > 2);
        expect(result).assertEqual(true);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SOME_2100
     * @tc.name testSparseArraySome021
     * @tc.desc some throws CustomError, verify assertFail and error.name equals CustomError021
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySome021', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        try {
          const arr = new SparseArray<int>(1, 2, 3);
          arr.some((v: int): boolean => {
            throw new CustomError021("custom error");
          });
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("CustomError021");
        }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SOME_2200
     * @tc.name testSparseArraySome022
     * @tc.desc some throws Error, verify catch and finally block executes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySome022', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        let finallyExecuted = false;
        try {
          arr.some((v: int): boolean => {
            throw new Error("error");
          });
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("Error");
        } finally {
          finallyExecuted = true;
        }
        expect(finallyExecuted).assertEqual(true);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SOME_2300
     * @tc.name testSparseArraySome023
     * @tc.desc Test SparseArray.some, verify method result (visited.length equals 2, visited[0] equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySome023', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5);
        arr[0] = 1;
        arr[2] = 3;  
        arr[4] = 5;  
        const visited: int[] = [];
        const result = arr.some((v: int, i: int): boolean => {
          visited.push(i);
          return v > 2;
        });
        expect(visited.length).assertEqual(2);
        expect(visited[0]).assertEqual(0);
        expect(visited[1]).assertEqual(2);
        expect(result).assertEqual(true);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SOME_2400
     * @tc.name testSparseArraySome024
     * @tc.desc Test SparseArray.some, verify method result (indices.length equals 2, indices[0] equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySome024', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10);
        arr[2] = 20;
        arr[5] = 50;
        arr[8] = 80;
        const indices: int[] = [];
        const result = arr.some((v: int, i: int): boolean => {
          indices.push(i);
          return v > 40;
        });
        expect(indices.length).assertEqual(2);
        expect(indices[0]).assertEqual(2);
        expect(indices[1]).assertEqual(5);
        expect(result).assertEqual(true);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SOME_2500
     * @tc.name testSparseArraySome025
     * @tc.desc Test SparseArray.some, verify method result (indices.length equals 3, indices[0] equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySome025', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10);
        arr[0] = 10;
        arr[3] = 30;  
        arr[6] = 60;  
        const indices: int[] = [];
        arr.some((v: int, i: int): boolean => {
          indices.push(i);
          return false;
        });
        expect(indices.length).assertEqual(3);
        expect(indices[0]).assertEqual(0);
        expect(indices[1]).assertEqual(3);
        expect(indices[2]).assertEqual(6);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SOME_2600
     * @tc.name testSparseArraySome026
     * @tc.desc Test SparseArray.some, verify method result (arr[0] equals 100)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySome026', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        arr.some((v: int, i: int, a: SparseArray<int>): boolean => {
          if (i === 0) {
            a[i] = 100;
          }
          return false;
        });
        expect(arr[0]).assertEqual(100);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SOME_2700
     * @tc.name testSparseArraySome027
     * @tc.desc Test SparseArray.some, verify method result (result equals true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySome027', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("apple", "banana", "cherry");
        const result = arr.some((v: string): boolean => v.length > 5);
        expect(result).assertEqual(true);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SOME_2800
     * @tc.name testSparseArraySome028
     * @tc.desc Test SparseArray.some, verify method result (result equals true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySome028', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<Item028>(new Item028(1, "one"), new Item028(2, "two"));
        const result = arr.some((v: Item028): boolean => v.id > 1);
        expect(result).assertEqual(true);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SOME_2900
     * @tc.name testSparseArraySome029
     * @tc.desc Test SparseArray.some, verify method result (result equals true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySome029', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | string>(1, "two", 3);
        const result = arr.some((v: int | string): boolean => typeof v == "string");
        expect(result).assertEqual(true);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SOME_3000
     * @tc.name testSparseArraySome030
     * @tc.desc Test SparseArray.some, verify method result (visited.length equals 3, visited[0] equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySome030', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4, 5);
        const visited: int[] = [];
        const result = arr.some((v: int): boolean => {
          visited.push(v);
          return v === 3;  
        });
        expect(visited.length).assertEqual(3);
        expect(visited[0]).assertEqual(1);
        expect(visited[1]).assertEqual(2);
        expect(visited[2]).assertEqual(3);
        expect(result).assertEqual(true);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SOME_3100
     * @tc.name testSparseArraySome031
     * @tc.desc Test SparseArray.some, verify method result (count equals 1, result equals true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySome031', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5, 1, 2, 3, 4);
        let count = 0;
        const result = arr.some((v: int): boolean => {
          count++;
          return v > 2;
        });
        expect(count).assertEqual(1);
        expect(result).assertEqual(true);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SOME_3200
     * @tc.name testSparseArraySome032
     * @tc.desc Test SparseArray.some, verify method result (visited.length equals 5, visited[i] equals i + 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySome032', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4, 5);
        const visited: int[] = [];
        const result = arr.some((v: int): boolean => {
          visited.push(v);
          return v === 5;
        });
        expect(visited.length).assertEqual(5);
        for (let i = 0; i < 5; i++) {
          expect(visited[i]).assertEqual(i + 1);
        }
        expect(result).assertEqual(true);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SOME_3300
     * @tc.name testSparseArraySome033
     * @tc.desc Test SparseArray.some, verify method result (visited.length equals 5, visited[i] equals i + 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySome033', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4, 5);
        const visited: int[] = [];
        const result = arr.some((v: int): boolean => {
          visited.push(v);
          return v > 10;
        });
        expect(visited.length).assertEqual(5);
        for (let i = 0; i < 5; i++) {
          expect(visited[i]).assertEqual(i + 1);
        }
        expect(result).assertEqual(false);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SOME_3400
     * @tc.name testSparseArraySome034
     * @tc.desc Test SparseArray.some, verify method result (called equals false, result equals false)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySome034', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        let called = false;
        const result = arr.some((_v: int, _i: int, _a: SparseArray<int>): boolean => {
          called = true;
          return true;
        });
        expect(called).assertEqual(false);
        expect(result).assertEqual(false);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SOME_3500
     * @tc.name testSparseArraySome035
     * @tc.desc some does not mutate array length or element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySome035', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const arr = new SparseArray<int>(1, 2, 3);
        const originalLength = arr.length;
        const original0 = arr[0];
        const original1 = arr[1];
        const original2 = arr[2];
        arr.some((v: int): boolean => v > 2);
        expect(arr.length).assertEqual(originalLength);
        expect(arr[0]).assertEqual(original0);
        expect(arr[1]).assertEqual(original1);
        expect(arr[2]).assertEqual(original2);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SOME_3600
     * @tc.name testSparseArraySome036
     * @tc.desc Test SparseArray.some, verify method result (arr[0] equals 1, arr[1] === undefined equals true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySome036', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5);
        arr[0] = 1;
        arr[2] = 3;  
        arr.some((v: int): boolean => v > 2);
        expect(arr[0]).assertEqual(1);
        expect(arr[1] === undefined).assertEqual(true);
        expect(arr[2]).assertEqual(3);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SOME_3700
     * @tc.name testSparseArraySome037
     * @tc.desc Test SparseArray.some, verify method result (result1 equals true, result2 equals true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySome037', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4, 5);
        const result1 = arr.some((v: int): boolean => v > 2);
        const result2 = arr.some((v: int): boolean => v < 3);
        const result3 = arr.some((v: int): boolean => v === 10);
        expect(result1).assertEqual(true);
        expect(result2).assertEqual(true);
        expect(result3).assertEqual(false);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SOME_3800
     * @tc.name testSparseArraySome038
     * @tc.desc Test SparseArray.some, verify method result (result equals false)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySome038', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        for (let i = 0; i < 10000; i++) {
          arr.push(i);
        }
        const result = arr.some((v: int): boolean => v > 9999);
        expect(result).assertEqual(false);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SOME_3900
     * @tc.name testSparseArraySome039
     * @tc.desc Test SparseArray.some, verify method result (result equals true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySome039', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10000);
        for (let i = 0; i < 10000; i += 1000) {
          arr[i] = i;
        }
        const result = arr.some((v: int): boolean => v > 5000);
        expect(result).assertEqual(true);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SOME_4000
     * @tc.name testSparseArraySome040
     * @tc.desc Test SparseArray.some, verify method result (count equals 1, result equals true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySome040', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        arr.push(100000);  
        for (let i = 0; i < 99999; i++) {
          arr.push(i);
        }
        let count = 0;
        const result = arr.some((v: int): boolean => {
          count++;
          return v > 50000;
        });
        expect(count).assertEqual(1);
        expect(result).assertEqual(true);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SOME_4100
     * @tc.name testSparseArraySome041
     * @tc.desc some on SparseArray<short> finds element above threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySome041', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<short>(100 as short, 200 as short, 30000 as short);
        const result = arr.some((v: short): boolean => v > (10000 as short));
        expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SOME_4200
     * @tc.name testSparseArraySome042
     * @tc.desc some on SparseArray<float> finds float element above threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySome042', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<float>(1.0f, 2.5f, 3.0f);
        const result = arr.some((v: float): boolean => v > 2.0f);
        expect(result).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SOME_4300
     * @tc.name testSparseArraySome043
     * @tc.desc some returns true when null element exists
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySome043', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | null>(10, null, 20);
        expect(arr.some((v: int | null): boolean => v === null)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SOME_4400
     * @tc.name testSparseArraySome044
     * @tc.desc some returns true for element equal to hex 0xFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySome044', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 0xFF);
        expect(arr.some((v: int): boolean => v === 0xFF)).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SOME_4500
     * @tc.name testSparseArraySome045
     * @tc.desc some returns true when single-space element exists
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySome045', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("a", " ", "b");
        expect(arr.some((v: string): boolean => v === " ")).assertTrue();
    });

  });
}
