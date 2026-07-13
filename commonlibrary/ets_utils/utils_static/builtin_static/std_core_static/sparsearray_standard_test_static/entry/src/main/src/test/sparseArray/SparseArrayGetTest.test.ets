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

class User019 {
    name: string = ""
    age: int = 0
  }

class Person033 {
    name: string = ""
    age: int = 0
  }

class Address034 {
    city: string = ""
  }

class Person034 {
    name: string = ""
    address: Address034 = new Address034()
  }

export default function SparseArrayGetTest(): void {
  describe('SparseArrayGetTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_GET_0100
     * @tc.name testSparseArrayGet001
     * @tc.desc Verify SparseArray $_get with all required parameters present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayGet001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(3)
        arr[0] = 10
        expect(arr.$_get(0)).assertEqual(10)
    
        expect(arr instanceof SparseArray).assertTrue();
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_GET_0200
     * @tc.name testSparseArrayGet002
     * @tc.desc Verify SparseArray $_get with index in valid range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayGet002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10)
        arr[5] = 100
        expect(arr.$_get(5)).assertEqual(100)
    
        expect(arr instanceof SparseArray).assertTrue();
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_GET_0300
     * @tc.name testSparseArrayGet003
     * @tc.desc Verify SparseArray $_get with hexadecimal index literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayGet003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(100)
        arr[0x0A] = 10
        expect(arr.$_get(0x0A)).assertEqual(10)
    
        expect(arr instanceof SparseArray).assertTrue();
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_GET_0400
     * @tc.name testSparseArrayGet004
     * @tc.desc Verify SparseArray $_get with maximum int index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayGet004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        const result = arr.$_get(2147483647)
        expect(result).assertUndefined()
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_GET_0500
     * @tc.name testSparseArrayGet005
     * @tc.desc Verify SparseArray $_get with minimum int index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayGet005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        const result = arr.$_get(-2147483648)
        expect(result).assertUndefined()
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_GET_0600
     * @tc.name testSparseArrayGet006
     * @tc.desc $_get(2) on [5,3,5], verify returns 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayGet006', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5, 3, 5);
        expect(arr.$_get(2)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_GET_0700
     * @tc.name testSparseArrayGet007
     * @tc.desc Verify SparseArray $_get with index -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayGet007', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5)
        arr[0] = 1
        const result = arr.$_get(-1)
        expect(result).assertUndefined()
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_GET_0800
     * @tc.name testSparseArrayGet008
     * @tc.desc Verify SparseArray $_get throws when index is null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayGet008', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        try {
          const arr = new SparseArray<int>()
          arr.$_get((null as Object as int))
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError");
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_GET_0900
     * @tc.name testSparseArrayGet009
     * @tc.desc Verify SparseArray $_get throws when index is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayGet009', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        try {
          const arr = new SparseArray<int>()
          arr.$_get((undefined as Object as int))
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError");
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_GET_1000
     * @tc.name testSparseArrayGet010
     * @tc.desc Verify SparseArray $_get throws when index is empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayGet010', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        try {
          const arr = new SparseArray<int>()
          arr.$_get(("" as Object as int))
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError");
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_GET_1100
     * @tc.name testSparseArrayGet011
     * @tc.desc Verify (INT_MAX + 1) wraps to INT_MIN; $_get on empty array returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayGet011', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        expect(arr.$_get((2147483647 + 1) as int)).assertUndefined()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_GET_1200
     * @tc.name testSparseArrayGet012
     * @tc.desc Verify $_get after (INT_MIN - 1) int arithmetic: empty array yields undefined (no throw)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayGet012', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        expect(arr.$_get((-2147483648 - 1) as int)).assertUndefined()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_GET_1300
     * @tc.name testSparseArrayGet013
     * @tc.desc Verify SparseArray $_get throws when index is boolean true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayGet013', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        try {
          const arr = new SparseArray<int>()
          arr.$_get((true as Object as int))
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError");
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_GET_1400
     * @tc.name testSparseArrayGet014
     * @tc.desc Verify SparseArray $_get throws when index is object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayGet014', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        try {
          const arr = new SparseArray<int>()
          arr.$_get(({} as Object as int))
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError");
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_GET_1500
     * @tc.name testSparseArrayGet015
     * @tc.desc Verify SparseArray $_get throws when index is array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayGet015', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        try {
          const arr = new SparseArray<int>()
          const badArrIdx: Object = new Array<int>()
          arr.$_get((badArrIdx as Object as int))
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError");
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_GET_1600
     * @tc.name testSparseArrayGet016
     * @tc.desc Verify SparseArray $_get returns expected T value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayGet016', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>(3)
        arr[0] = "hello"
        let result = arr.$_get(0)
        expect(result).assertEqual("hello")
        expect((typeof result == "string")).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_GET_1700
     * @tc.name testSparseArrayGet017
     * @tc.desc Verify SparseArray $_get returns number type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayGet017', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<number>(5)
        arr[2] = 42
        let result = arr.$_get(2)
        expect(result).assertEqual(42)
        expect((typeof result == "number")).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_GET_1800
     * @tc.name testSparseArrayGet018
     * @tc.desc Verify SparseArray $_get returns boolean type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayGet018', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<boolean>(3)
        arr[0] = true
        let result = arr.$_get(0)
        expect(result).assertTrue()
        expect((typeof result == "boolean")).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_GET_1900
     * @tc.name testSparseArrayGet019
     * @tc.desc Verify SparseArray $_get returns custom object type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayGet019', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<User019>(1)
        arr[0] = new User019()
        let result = arr.$_get(0)
        expect(result !== null && result !== undefined).assertTrue()
        expect(result instanceof User019).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_GET_2000
     * @tc.name testSparseArrayGet020
     * @tc.desc Verify SparseArray $_get returns T or undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayGet020', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5)
        arr[2] = 100
        let result1 = arr.$_get(2)
        let result2 = arr.$_get(10)
        expect(result1).assertEqual(100)
        expect(result2).assertUndefined()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_GET_2100
     * @tc.name testSparseArrayGet021
     * @tc.desc Verify SparseArray $_get last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayGet021', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5)
        arr[4] = 5
        let result = arr.$_get(4)
        expect(result).assertEqual(5)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_GET_2200
     * @tc.name testSparseArrayGet022
     * @tc.desc Verify SparseArray $_get at index length minus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayGet022', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>(3)
        arr[2] = "last"
        let result = arr.$_get(arr.length - 1)
        expect(result).assertEqual("last")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_GET_2300
     * @tc.name testSparseArrayGet023
     * @tc.desc Verify SparseArray $_get returns undefined at index length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayGet023', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(3)
        let result = arr.$_get(arr.length)
        expect(result).assertUndefined()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_GET_2400
     * @tc.name testSparseArrayGet024
     * @tc.desc Verify SparseArray $_get for multiple holes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayGet024', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10)
        arr[0] = 0
        arr[3] = 3
        arr[7] = 7
        expect(arr.$_get(1)).assertUndefined()
        expect(arr.$_get(2)).assertUndefined()
        expect(arr.$_get(4)).assertUndefined()
        expect(arr.$_get(5)).assertUndefined()
        expect(arr.$_get(6)).assertUndefined()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_GET_2500
     * @tc.name testSparseArrayGet025
     * @tc.desc Verify SparseArray $_get for hole vs explicit undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayGet025', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | undefined>(5)
        arr[2] = undefined
        expect(arr.$_get(2)).assertUndefined()
        expect(arr.$_get(1)).assertUndefined()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_GET_2600
     * @tc.name testSparseArrayGet026
     * @tc.desc Verify SparseArray $_get on empty array indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayGet026', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        expect(arr.length).assertEqual(0)
        expect(arr.$_get(0)).assertUndefined()
        expect(arr.$_get(-1)).assertUndefined()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_GET_2700
     * @tc.name testSparseArrayGet027
     * @tc.desc Verify SparseArray $_get on single-element array indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayGet027', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1)
        arr[0] = 42
        expect(arr.$_get(0)).assertEqual(42)
        expect(arr.$_get(1)).assertUndefined()
        expect(arr.$_get(-1)).assertUndefined()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_GET_2800
     * @tc.name testSparseArrayGet028
     * @tc.desc Verify SparseArray $_get returns float number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayGet028', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<number>(3)
        arr[1] = 3.14
        let result = arr.$_get(1)
        expect(result).assertEqual(3.14)
        expect((typeof result == "number")).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_GET_2900
     * @tc.name testSparseArrayGet029
     * @tc.desc Verify SparseArray $_get returns scientific notation number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayGet029', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<number>(3)
        arr[2] = 1.0e6
        let result = arr.$_get(2)
        expect(result).assertEqual(1000000)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_GET_3000
     * @tc.name testSparseArrayGet030
     * @tc.desc Verify SparseArray $_get returns Unicode string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayGet030', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>(3)
        arr[1] = "测试"
        let result = arr.$_get(1)
        expect(result).assertEqual("测试")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_GET_3100
     * @tc.name testSparseArrayGet031
     * @tc.desc Verify SparseArray $_get returns empty string element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayGet031', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>(3)
        arr[2] = ""
        let result = arr.$_get(2)
        expect(result).assertEqual("")
        expect(result !== undefined).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_GET_3200
     * @tc.name testSparseArrayGet032
     * @tc.desc Verify SparseArray $_get returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayGet032', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<boolean>(3)
        arr[1] = false
        let result = arr.$_get(1)
        expect(result).assertFalse()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_GET_3300
     * @tc.name testSparseArrayGet033
     * @tc.desc Verify SparseArray $_get returns custom object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayGet033', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<Person033>(2)
        const p = new Person033()
        p.name = "Tom"
        p.age = 20
        arr[0] = p
        let result = arr.$_get(0)
        if (result === null || result === undefined) {
          expect(false).assertTrue()
          return
        }
        let pr033 = result as Person033
        expect(pr033.name).assertEqual("Tom")
        expect(pr033.age).assertEqual(20)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_GET_3400
     * @tc.name testSparseArrayGet034
     * @tc.desc Verify SparseArray $_get returns nested object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayGet034', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<Person034>(1)
        const p = new Person034()
        p.name = "Alice"
        p.address.city = "Beijing"
        arr[0] = p
        let result = arr.$_get(0)
        if (result === null || result === undefined) {
          expect(false).assertTrue()
          return
        }
        let pr034 = result as Person034
        expect(pr034.address.city).assertEqual("Beijing")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_GET_3500
     * @tc.name testSparseArrayGet035
     * @tc.desc Verify SparseArray $_get returns array element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayGet035', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<Array<int>>(2)
        arr[0] = [1, 2, 3]
        let result = arr.$_get(0)
        expect(result !== null && result !== undefined).assertTrue()
        let row57 = result as Array<int>
        expect(row57.length).assertEqual(3)
        expect(row57[0]).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_GET_3600
     * @tc.name testSparseArrayGet036
     * @tc.desc Verify SparseArray $_get with union type elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayGet036', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<number | string>(3)
        arr[0] = 100
        arr[1] = "test"
        expect(arr.$_get(0)).assertEqual(100)
        expect(arr.$_get(1)).assertEqual("test")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_GET_3700
     * @tc.name testSparseArrayGet037
     * @tc.desc Verify SparseArray $_get with union including undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayGet037', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<number | string | undefined>(3)
        arr[0] = undefined
        expect(arr.$_get(0)).assertUndefined()
        expect(arr.$_get(1)).assertUndefined()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_GET_3800
     * @tc.name testSparseArrayGet038
     * @tc.desc Verify SparseArray $_get on large sparse capacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayGet038', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10000)
        arr[0] = 1
        arr[9999] = 9999
        expect(arr.$_get(0)).assertEqual(1)
        expect(arr.$_get(5000)).assertUndefined()
        expect(arr.$_get(9999)).assertEqual(9999)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_GET_3900
     * @tc.name testSparseArrayGet039
     * @tc.desc Verify SparseArray $_get with discontinuous indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayGet039', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        arr[10] = 10
        arr[20] = 20
        arr[30] = 30
        expect(arr.$_get(10)).assertEqual(10)
        expect(arr.$_get(15)).assertUndefined()
        expect(arr.$_get(30)).assertEqual(30)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_GET_4000
     * @tc.name testSparseArrayGet040
     * @tc.desc Verify SparseArray $_get after length grows
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayGet040', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5)
        arr[10] = 100
        expect(arr.length).assertEqual(11)
        expect(arr.$_get(10)).assertEqual(100)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_GET_4100
     * @tc.name testSparseArrayGet041
     * @tc.desc Verify SparseArray $_get after length shrinks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayGet041', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10)
        arr[5] = 50
        arr.length = 3
        expect(arr.$_get(5)).assertUndefined()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_GET_4200
     * @tc.name testSparseArrayGet042
     * @tc.desc Verify SparseArray $_get at index value zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayGet042', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5)
        arr[0] = 0
        expect(arr.$_get(0)).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_GET_4300
     * @tc.name testSparseArrayGet043
     * @tc.desc $_get returns long element exceeding int range after $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayGet043', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<long>();
        const val: long = 9223372036854775807 as long;
        arr.$_set(0, val);
        expect(arr.$_get(0)).assertEqual(val);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_GET_4400
     * @tc.name testSparseArrayGet044
     * @tc.desc $_get returns short element after $_set on SparseArray<short>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayGet044', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<short>();
        arr.$_set(0, 32767 as short);
        expect(arr.$_get(0)).assertEqual(32767 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_GET_4500
     * @tc.name testSparseArrayGet045
     * @tc.desc $_get returns illegal UTF-16 code unit string after $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayGet045', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>();
        const bad = "\uFFFE";
        arr.$_set(0, bad);
        expect(arr.$_get(0)).assertEqual(bad);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_GET_4600
     * @tc.name testSparseArrayGet046
     * @tc.desc $_get returns null element stored at valid index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayGet046', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | null>();
        arr.$_set(0, 10);
        arr.$_set(1, null);
        expect(arr.$_get(1)).assertEqual(null);
        expect(arr.$_get(0)).assertEqual(10);
    });
  });
}
