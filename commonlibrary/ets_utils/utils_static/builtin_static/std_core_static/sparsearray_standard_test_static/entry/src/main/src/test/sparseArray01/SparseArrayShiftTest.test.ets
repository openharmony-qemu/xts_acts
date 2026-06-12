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


class TestClass007 {
    public value: int = 100;
  }

class Person025 {
    public name: string = "test";
    public age: int = 30;
  }

export default function SparseArrayShiftTest(): void {
  describe('SparseArrayShiftTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SHIFT_0100
     * @tc.name testSparseArrayShift001
     * @tc.desc Test SparseArray.shift, verify method result (arr instanceof SparseArray is true, result equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayShift001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        expect(arr instanceof SparseArray).assertTrue();
        const result = arr.shift();
        expect(result).assertEqual(1);
        expect(arr.length).assertEqual(2);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SHIFT_0200
     * @tc.name testSparseArrayShift002
     * @tc.desc Test SparseArray.shift, verify method result (arr instanceof SparseArray is true, result equals "a")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayShift002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("a", "b");
        expect(arr instanceof SparseArray).assertTrue();
        const result = arr.shift();
        expect(result).assertEqual("a");
        expect(arr.length).assertEqual(1);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SHIFT_0300
     * @tc.name testSparseArrayShift003
     * @tc.desc Test SparseArray.shift, verify method result (result equals 10, arr.length equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayShift003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10, 20, 30);
        const result = arr.shift();
        expect(result).assertEqual(10);
        expect(arr.length).assertEqual(2);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SHIFT_0400
     * @tc.name testSparseArrayShift004
     * @tc.desc Test SparseArray.shift, verify method result (result equals undefined, arr.length equals 41)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayShift004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(42);
        const result = arr.shift();
        expect(result).assertEqual(undefined);
        expect(arr.length).assertEqual(41);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SHIFT_0500
     * @tc.name testSparseArrayShift005
     * @tc.desc Test SparseArray.shift, verify method result (result equals "hello")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayShift005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("hello", "world");
        const result = arr.shift();
        expect(result).assertEqual("hello");
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SHIFT_0600
     * @tc.name testSparseArrayShift006
     * @tc.desc Test SparseArray.shift, verify method result (result equals true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayShift006', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<boolean>(true, false);
        const result = arr.shift();
        expect(result).assertEqual(true);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SHIFT_0700
     * @tc.name testSparseArrayShift007
     * @tc.desc Test SparseArray.shift, verify method result (result!.value equals 100)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayShift007', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<TestClass007>(new TestClass007());
        const result = arr.shift();
        expect(result!.value).assertEqual(100);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SHIFT_0800
     * @tc.name testSparseArrayShift008
     * @tc.desc Test SparseArray.shift, verify method result (result equals undefined, arr.length equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayShift008', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        const result = arr.shift();
        expect(result).assertEqual(undefined);
        expect(arr.length).assertEqual(0);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SHIFT_0900
     * @tc.name testSparseArrayShift009
     * @tc.desc Test SparseArray.shift, verify method result (first equals undefined, arr.length equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayShift009', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | undefined>(1);
        arr.push(undefined, 2, 3);
        const first = arr.shift();
        expect(first).assertEqual(undefined);
        expect(arr.length).assertEqual(3);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SHIFT_1000
     * @tc.name testSparseArrayShift010
     * @tc.desc Test SparseArray.shift, verify method result (result equals undefined, arr.length equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayShift010', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | undefined>();
        arr[0] = undefined;
        arr[1] = 10;
        const result = arr.shift();
        expect(result).assertEqual(undefined);
        expect(arr.length).assertEqual(1);
        expect(arr[0]).assertEqual(10);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SHIFT_1100
     * @tc.name testSparseArrayShift011
     * @tc.desc Test SparseArray.shift, verify method result (result equals 42, arr.length equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayShift011', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        arr.push(42);
        const result = arr.shift();
        expect(result).assertEqual(42);
        expect(arr.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SHIFT_1200
     * @tc.name testSparseArrayShift012
     * @tc.desc Test SparseArray.shift, verify method result (result equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayShift012', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(0, 1, 2);
        const result = arr.shift();
        expect(result).assertEqual(0);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SHIFT_1300
     * @tc.name testSparseArrayShift013
     * @tc.desc Test SparseArray.shift, verify method result (result equals false)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayShift013', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<boolean>(false, true);
        const result = arr.shift();
        expect(result).assertEqual(false);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SHIFT_1400
     * @tc.name testSparseArrayShift014
     * @tc.desc Test SparseArray.shift, verify method result (result equals "")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayShift014', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("", "non-empty");
        const result = arr.shift();
        expect(result).assertEqual("");
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SHIFT_1500
     * @tc.name testSparseArrayShift015
     * @tc.desc Test SparseArray.shift, verify method result (result equals 7, arr.length equals 99)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayShift015', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(100);
        arr[0] = 7;
        const result = arr.shift();
        expect(result).assertEqual(7);
        expect(arr.length).assertEqual(99);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SHIFT_1600
     * @tc.name testSparseArrayShift016
     * @tc.desc Test SparseArray.shift, verify method result (result equals undefined)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayShift016', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        const result = arr.shift();
        expect(result).assertEqual(undefined);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SHIFT_1700
     * @tc.name testSparseArrayShift017
     * @tc.desc Test SparseArray.shift, verify method result (result1 equals 1, result2 equals undefined)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayShift017', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | undefined>(1, undefined);
        const result1 = arr.shift();
        expect(result1).assertEqual(1);
        const result2 = arr.shift();
        expect(result2).assertEqual(undefined);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SHIFT_1800
     * @tc.name testSparseArrayShift018
     * @tc.desc Test SparseArray.shift, verify method result (result equals 1000)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayShift018', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1000, 0);
        const result = arr.shift();
        expect(result).assertEqual(1000);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SHIFT_1900
     * @tc.name testSparseArrayShift019
     * @tc.desc Test SparseArray.shift, verify method result (result equals -1000)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayShift019', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(-1000, 0);
        const result = arr.shift();
        expect(result).assertEqual(-1000);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SHIFT_2000
     * @tc.name testSparseArrayShift020
     * @tc.desc Test SparseArray.shift, verify method result (arr.length equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayShift020', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        expect(arr.shift()).assertEqual(1);
        expect(arr.shift()).assertEqual(2);
        expect(arr.shift()).assertEqual(3);
        expect(arr.shift()).assertEqual(undefined);
        expect(arr.length).assertEqual(0);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SHIFT_2100
     * @tc.name testSparseArrayShift021
     * @tc.desc Test SparseArray.shift, verify method result (arr.length equals oldLength - 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayShift021', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4);
        const oldLength = arr.length;
        arr.shift();
        expect(arr.length).assertEqual(oldLength - 1);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SHIFT_2200
     * @tc.name testSparseArrayShift022
     * @tc.desc Test SparseArray.shift, verify method result (arr.length equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayShift022', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        arr.shift();
        expect(arr.length).assertEqual(0);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SHIFT_2300
     * @tc.name testSparseArrayShift023
     * @tc.desc Test SparseArray.shift, verify method result (arr[0] equals 20, arr[1] equals 30)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayShift023', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10, 20, 30);
        arr.shift();
        expect(arr[0]).assertEqual(20);
        expect(arr[1]).assertEqual(30);
        expect(arr[2]).assertEqual(undefined);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SHIFT_2400
     * @tc.name testSparseArrayShift024
     * @tc.desc Test SparseArray.shift, verify method result (arr[0] equals undefined, arr[1] equals 30)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayShift024', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5);
        arr[0] = 10;
        arr[2] = 30;
        arr[4] = 50;
        arr.shift();
        expect(arr[0]).assertEqual(undefined);
        expect(arr[1]).assertEqual(30);
        expect(arr[3]).assertEqual(50);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SHIFT_2500
     * @tc.name testSparseArrayShift025
     * @tc.desc Test SparseArray.shift, verify method result (result equals "a")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayShift025', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("a", "b", "c");
        const result = arr.shift();
        expect(result).assertEqual("a");
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SHIFT_2600
     * @tc.name testSparseArrayShift026
     * @tc.desc shift on [7,4,3], verify returns 7 and remaining elements shift left
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayShift026', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(7, 4, 3);
        const val = arr.shift();
        expect(val).assertEqual(7);
        expect(arr.length).assertEqual(2);
        expect(arr[0]).assertEqual(4);
        expect(arr[1]).assertEqual(3);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SHIFT_2700
     * @tc.name testSparseArrayShift027
     * @tc.desc Test SparseArray.shift, verify method result (result equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayShift027', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | undefined>(1, undefined, 2);
        const result = arr.shift();
        expect(result).assertEqual(1);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SHIFT_2800
     * @tc.name testSparseArrayShift028
     * @tc.desc Test SparseArray.shift, verify method result (result equals "hello")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayShift028', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string | null>("hello", null);
        const result = arr.shift();
        expect(result).assertEqual("hello");
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SHIFT_2900
     * @tc.name testSparseArrayShift029
     * @tc.desc Test SparseArray.shift, verify method result (result!.name equals "test")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayShift029', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<Person025>(new Person025());
        const result = arr.shift();
        expect(result!.name).assertEqual("test");
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SHIFT_3000
     * @tc.name testSparseArrayShift030
     * @tc.desc Test SparseArray.shift, verify method result (result!.length equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayShift030', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<SparseArray<int>>(
          new SparseArray<int>(1, 2),
          new SparseArray<int>(3, 4)
        );
        const result = arr.shift();
        expect(result!.length).assertEqual(2);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SHIFT_3100
     * @tc.name testSparseArrayShift031
     * @tc.desc Test SparseArray.shift, verify method result (result equals 10, arr.length equals 9)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayShift031', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10);
        arr[0] = 10;
        arr[9] = 90;
        const result = arr.shift();
        expect(result).assertEqual(10);
        expect(arr.length).assertEqual(9);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SHIFT_3200
     * @tc.name testSparseArrayShift032
     * @tc.desc Test SparseArray.shift, verify method result (result equals undefined)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayShift032', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10);
        arr[5] = 50;
        arr[6] = 60;
        const result = arr.shift();
        expect(result).assertEqual(undefined);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SHIFT_3300
     * @tc.name testSparseArrayShift033
     * @tc.desc Test SparseArray.shift, verify method result (result equals 1, arr.length equals 9999)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayShift033', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10000);
        arr[0] = 1;
        const result = arr.shift();
        expect(result).assertEqual(1);
        expect(arr.length).assertEqual(9999);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SHIFT_3400
     * @tc.name testSparseArrayShift034
     * @tc.desc Test SparseArray.shift, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayShift034', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        arr.push(1, 2, 3);
        expect(arr.shift()).assertEqual(1);
        arr.push(4);
        expect(arr.shift()).assertEqual(2);
        expect(arr.shift()).assertEqual(3);
        expect(arr.shift()).assertEqual(4);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SHIFT_3500
     * @tc.name testSparseArrayShift035
     * @tc.desc Test SparseArray.shift, verify method result (result equals 1, arr instanceof SparseArray is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayShift035', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.shift();
        expect(result).assertEqual(1);
        expect(arr instanceof SparseArray).assertTrue();
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SHIFT_3600
     * @tc.name testSparseArrayShift036
     * @tc.desc Test SparseArray.shift, verify method result (r === undefined is true, arr.length equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayShift036', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        const r = arr.shift();
        expect(r === undefined).assertTrue();
        expect(arr.length).assertEqual(0);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SHIFT_3700
     * @tc.name testSparseArrayShift037
     * @tc.desc Test SparseArray.shift, verify method result (arr.length equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayShift037', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        for (let i = 0; i < 100; i++) {
          arr.shift();
        }
        expect(arr.length).assertEqual(0);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SHIFT_3800
     * @tc.name testSparseArrayShift038
     * @tc.desc Test SparseArray.shift, verify method result (arr instanceof SparseArray is true, result is undefined)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayShift038', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10);
        expect(arr instanceof SparseArray).assertTrue();
        const result: int | undefined = arr.shift();
        expect(result).assertUndefined();
        expect(arr.length).assertEqual(9);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SHIFT_3900
     * @tc.name testSparseArrayShift039
     * @tc.desc Test SparseArray.shift, verify method result (first equals 1, queue.length equals 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayShift039', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const queue = new SparseArray<int>();
        queue.push(1, 2, 3, 4, 5);
        const first = queue.shift();
        expect(first).assertEqual(1);
        expect(queue.length).assertEqual(4);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SHIFT_4000
     * @tc.name testSparseArrayShift040
     * @tc.desc Test SparseArray.shift, verify method result (count equals 60)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayShift040', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10, 20, 30);
        let count = 0;
        while (arr.length > 0) {
          const item = arr.shift();
          if (item !== undefined) {
            count += item;
          }
        }
        expect(count).assertEqual(60);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SHIFT_4100
     * @tc.name testSparseArrayShift041
     * @tc.desc shift removes first short element and returns it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayShift041', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<short>(100 as short, 200 as short, 300 as short);
        const first = arr.shift();
        expect(first).assertEqual(100 as short);
        expect(arr.length).assertEqual(2);
        expect(arr[0]).assertEqual(200 as short);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SHIFT_4200
     * @tc.name testSparseArrayShift042
     * @tc.desc shift removes first float element and returns it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayShift042', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<float>(1.5f, 2.5f, 3.5f);
        const first = arr.shift();
        expect(first).assertEqual(1.5f);
        expect(arr.length).assertEqual(2);
        expect(arr[0]).assertEqual(2.5f);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SHIFT_4300
     * @tc.name testSparseArrayShift043
     * @tc.desc shift removes first hex literal element 0xFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayShift043', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(0xFF, 2, 3);
        const first = arr.shift();
        expect(first).assertEqual(0xFF);
        expect(arr[0]).assertEqual(2);
    });


  });
}
