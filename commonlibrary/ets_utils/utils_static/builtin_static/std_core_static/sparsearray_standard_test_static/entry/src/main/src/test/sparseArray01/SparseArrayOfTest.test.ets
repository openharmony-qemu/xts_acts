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

class Person028 {
  name: string = '';
  age: number = 0;
  constructor(name: string = '', age: number = 0) {
    this.name = name
    this.age = age
  }
}

enum ColorOf050 {
  Red,
  Green,
  Blue
}

export default function SparseArrayOfTest(): void {
  describe('SparseArrayOfTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_OF_0100
     * @tc.name testSparseArrayOf001
     * @tc.desc Test SparseArray of, verify expected behavior (arr.length equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayOf001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = SparseArray.of<int>()
        expect(arr.length).assertEqual(0)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_OF_0200
     * @tc.name testSparseArrayOf002
     * @tc.desc Test SparseArray of, verify indexed access and length (arr.length equals 1, arr[0] equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayOf002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = SparseArray.of<int>(1)
        expect(arr.length).assertEqual(1)
        expect(arr[0]).assertEqual(1)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_OF_0300
     * @tc.name testSparseArrayOf003
     * @tc.desc Test SparseArray of, verify indexed access (arr[0] equals 1, arr[4] equals 5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayOf003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = SparseArray.of<int>(1, 2, 3, 4, 5)
        expect(arr[0]).assertEqual(1)
        expect(arr[4]).assertEqual(5)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_OF_0400
     * @tc.name testSparseArrayOf004
     * @tc.desc Test SparseArray of, verify expected behavior (arr.length equals 10)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayOf004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = SparseArray.of<int>(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
        expect(arr.length).assertEqual(10)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_OF_0500
     * @tc.name testSparseArrayOf005
     * @tc.desc Test SparseArray of, verify expected behavior (arr[0] equals 100)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayOf005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = SparseArray.of<number>(100, 200, 300)
        expect(arr[0]).assertEqual(100)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_OF_0600
     * @tc.name testSparseArrayOf006
     * @tc.desc Test SparseArray of, verify expected behavior (arr[0] equals Number.MAX_VALUE)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayOf006', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = SparseArray.of<number>(Number.MAX_VALUE)
        expect(arr[0]).assertEqual(Number.MAX_VALUE)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_OF_0700
     * @tc.name testSparseArrayOf007
     * @tc.desc Test SparseArray of, verify expected behavior (arr[0] equals Number.MIN_VALUE)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayOf007', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = SparseArray.of<number>(Number.MIN_VALUE)
        expect(arr[0]).assertEqual(Number.MIN_VALUE)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_OF_0800
     * @tc.name testSparseArrayOf008
     * @tc.desc Test SparseArray of, verify expected behavior (arr[0] equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayOf008', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = SparseArray.of<number>(0)
        expect(arr[0]).assertEqual(0)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_OF_0900
     * @tc.name testSparseArrayOf009
     * @tc.desc Test SparseArray of, verify expected behavior (arr[0] equals -1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayOf009', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = SparseArray.of<number>(-1, -100)
        expect(arr[0]).assertEqual(-1)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_OF_1000
     * @tc.name testSparseArrayOf010
     * @tc.desc Test SparseArray of, verify expected behavior (arr[0] equals "hello")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayOf010', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = SparseArray.of<string>("hello", "world")
        expect(arr[0]).assertEqual("hello")
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_OF_1100
     * @tc.name testSparseArrayOf011
     * @tc.desc Test SparseArray of, verify expected behavior (arr[0] equals "")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayOf011', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = SparseArray.of<string>("")
        expect(arr[0]).assertEqual("")
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_OF_1200
     * @tc.name testSparseArrayOf012
     * @tc.desc Test SparseArray of, verify expected behavior (arr[0] equals "你好")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayOf012', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = SparseArray.of<string>("你好", "世界")
        expect(arr[0]).assertEqual("你好")
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_OF_1300
     * @tc.name testSparseArrayOf013
     * @tc.desc Test SparseArray of, verify expected behavior (arr[0] equals true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayOf013', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = SparseArray.of<boolean>(true)
        expect(arr[0]).assertEqual(true)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_OF_1400
     * @tc.name testSparseArrayOf014
     * @tc.desc Test SparseArray of, verify expected behavior (arr[0] equals false)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayOf014', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = SparseArray.of<boolean>(false)
        expect(arr[0]).assertEqual(false)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_OF_1500
     * @tc.name testSparseArrayOf015
     * @tc.desc Test SparseArray of, verify expected behavior (arr[0] equals obj1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayOf015', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const obj1 = new Person028("Alice", 20)
        const obj2 = new Person028("Bob", 30)
        const arr = SparseArray.of<Person028>(obj1, obj2)
        expect(arr[0]).assertEqual(obj1)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_OF_1600
     * @tc.name testSparseArrayOf016
     * @tc.desc Test SparseArray of, verify expected behavior (arr[0] equals empty)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayOf016', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const empty = new Person028()
        const arr = SparseArray.of<Person028>(empty)
        expect(arr[0]).assertEqual(empty)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_OF_1700
     * @tc.name testSparseArrayOf017
     * @tc.desc Test SparseArray of, verify expected behavior (arr[0] equals arr1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayOf017', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr1: Array<int> = [1, 2, 3]
        const arr2: Array<int> = [4, 5, 6]
        const arr = SparseArray.of<Array<int>>(arr1, arr2)
        expect(arr[0]).assertEqual(arr1)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_OF_1800
     * @tc.name testSparseArrayOf018
     * @tc.desc Test SparseArray of, verify indexed access and length (arr.length equals 1, arr[0]!.length equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayOf018', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const empty: Array<int> = []
        const arr = SparseArray.of<Array<int>>(empty)
        expect(arr.length).assertEqual(1)
        expect(arr[0]!.length).assertEqual(0)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_OF_1900
     * @tc.name testSparseArrayOf019
     * @tc.desc Test SparseArray of, verify expected behavior (arr[0] equals 1, arr[1] equals "hello")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayOf019', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = SparseArray.of<number | string>(1, "hello", 2, "world")
        expect(arr[0]).assertEqual(1)
        expect(arr[1]).assertEqual("hello")
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_OF_2000
     * @tc.name testSparseArrayOf020
     * @tc.desc Test SparseArray of, verify expected behavior (arr[0] equals null)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayOf020', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = SparseArray.of<number | null>(null)
        expect(arr[0]).assertEqual(null)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_OF_2100
     * @tc.name testSparseArrayOf021
     * @tc.desc Test SparseArray of, verify expected behavior (arr[0] equals undefined)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayOf021', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = SparseArray.of<number | undefined>(undefined)
        expect(arr[0]).assertEqual(undefined)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_OF_2200
     * @tc.name testSparseArrayOf022
     * @tc.desc Test SparseArray of, verify indexed access and length (arr.length equals 3, arr[0] equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayOf022', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const values: Array<int> = [1, 2, 3]
        const arr = SparseArray.of<int>(...values)
        expect(arr.length).assertEqual(3)
        expect(arr[0]).assertEqual(1)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_OF_2300
     * @tc.name testSparseArrayOf023
     * @tc.desc Test SparseArray of, verify indexed access and length (arr.length equals 4, arr[0] equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayOf023', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const values: Array<int> = [2, 3]
        const arr = SparseArray.of<int>(1, ...values, 4)
        expect(arr.length).assertEqual(4)
        expect(arr[0]).assertEqual(1)
        expect(arr[3]).assertEqual(4)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_OF_2400
     * @tc.name testSparseArrayOf024
     * @tc.desc SparseArray.of with (4, 6, 3), verify elements and length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayOf024', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = SparseArray.of<int>(4, 6, 3)
        expect(arr.length).assertEqual(3)
        expect(arr[0]).assertEqual(4)
        expect(arr[1]).assertEqual(6)
        expect(arr[2]).assertEqual(3)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_OF_2500
     * @tc.name testSparseArrayOf025
     * @tc.desc Test SparseArray of, verify expected behavior (arr[2] equals "c")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayOf025', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = SparseArray.of<string>("a", "b", "c")
        expect(arr[2]).assertEqual("c")
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_OF_2600
     * @tc.name testSparseArrayOf026
     * @tc.desc Test SparseArray of, verify expected behavior (arr[0] equals a1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayOf026', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const a1: Array<int> = [1, 2]
        const a2: Array<int> = [3, 4]
        const arr = SparseArray.of<Array<int>>(a1, a2)
        expect(arr[0]).assertEqual(a1)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_OF_2700
     * @tc.name testSparseArrayOf027
     * @tc.desc Test SparseArray of, verify expected behavior (head.name equals "Alice")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayOf027', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const p = new Person028("Alice", 20)
        const arr = SparseArray.of<Person028>(p)
        const head = arr[0] as Person028
        expect(head.name).assertEqual("Alice")
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_OF_2800
     * @tc.name testSparseArrayOf028
     * @tc.desc Test SparseArray of, verify expected behavior (arr !== null && arr !== undefined is true, arr instanceof SparseArray is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayOf028', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = SparseArray.of<int>(1, 2, 3)
        expect(arr !== null && arr !== undefined).assertTrue()
        expect(arr instanceof SparseArray).assertTrue()
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_OF_2900
     * @tc.name testSparseArrayOf029
     * @tc.desc Test SparseArray of, verify expected behavior (arr[0] equals "a", typeof arr[0] equals "string")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayOf029', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = SparseArray.of<string>("a", "b", "c")
        expect(arr[0]).assertEqual("a")
        expect(typeof arr[0]).assertEqual("string")
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_OF_3000
     * @tc.name testSparseArrayOf030
     * @tc.desc Test SparseArray of, verify expected behavior (arr[0] equals 10, arr[1] equals 20)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayOf030', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = SparseArray.of<int>(10, 20, 30, 40, 50)
        expect(arr[0]).assertEqual(10)
        expect(arr[1]).assertEqual(20)
        expect(arr[2]).assertEqual(30)
        expect(arr[3]).assertEqual(40)
        expect(arr[4]).assertEqual(50)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_OF_3100
     * @tc.name testSparseArrayOf031
     * @tc.desc Test SparseArray of, verify expected behavior (arr[2] equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayOf031', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = SparseArray.of<int>(1, 2, 3, 4, 5)
        expect(arr[2]).assertEqual(3)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_OF_3200
     * @tc.name testSparseArrayOf032
     * @tc.desc SparseArray.of with (6, 5, 3), verify elements and length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayOf032', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = SparseArray.of<int>(6, 5, 3)
        expect(arr.length).assertEqual(3)
        expect(arr[0]).assertEqual(6)
        expect(arr[1]).assertEqual(5)
        expect(arr[2]).assertEqual(3)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_OF_3300
     * @tc.name testSparseArrayOf033
     * @tc.desc Test SparseArray of, verify expected behavior (arr instanceof SparseArray is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayOf033', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = SparseArray.of<int>(1, 2, 3)
        expect(arr instanceof SparseArray).assertTrue()
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_OF_3400
     * @tc.name testSparseArrayOf034
     * @tc.desc Test SparseArray of, verify expected behavior (arr1[0] equals 1, arr2[0] equals 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayOf034', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr1 = SparseArray.of<int>(1, 2, 3)
        const arr2 = SparseArray.of<int>(4, 5, 6)
        expect((arr1 === arr2)).assertFalse()
        expect(arr1[0]).assertEqual(1)
        expect(arr2[0]).assertEqual(4)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_OF_3500
     * @tc.name testSparseArrayOf035
     * @tc.desc Test SparseArray of, verify indexed access and length (arr.length equals 1, arr[0] equals 42)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayOf035', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = SparseArray.of<int>(42)
        expect(arr.length).assertEqual(1)
        expect(arr[0]).assertEqual(42)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_OF_3600
     * @tc.name testSparseArrayOf036
     * @tc.desc Test SparseArray of, verify indexed access and length (arr.length equals 4, arr[0] equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayOf036', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = SparseArray.of<int>(1, 1, 1, 1)
        expect(arr.length).assertEqual(4)
        expect(arr[0]).assertEqual(1)
        expect(arr[3]).assertEqual(1)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_OF_3700
     * @tc.name testSparseArrayOf037
     * @tc.desc Test SparseArray of, verify expected behavior (arr.length equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayOf037', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = SparseArray.of<int>(1, 2, 3)
        expect(arr.length).assertEqual(3)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_OF_3800
     * @tc.name testSparseArrayOf038
     * @tc.desc Test SparseArray of, verify expected behavior (arr[0] equals "test")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayOf038', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = SparseArray.of<string>("test")
        expect(arr[0]).assertEqual("test")
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_OF_3900
     * @tc.name testSparseArrayOf039
     * @tc.desc Test SparseArray of, verify expected behavior (val equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayOf039', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = SparseArray.of<number>(1, 2, 3)
        const val: number = arr[0] as number
        expect(val).assertEqual(1)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_OF_4000
     * @tc.name testSparseArrayOf040
     * @tc.desc Test SparseArray.of, verify method result (arr.length equals 4, arr[3] equals 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayOf040', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = SparseArray.of<int>(1, 2, 3)
        arr.push(4)
        expect(arr.length).assertEqual(4)
        expect(arr[3]).assertEqual(4)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_OF_4100
     * @tc.name testSparseArrayOf041
     * @tc.desc Test SparseArray of, verify expected behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayOf041', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = SparseArray.of<int>(1, 2, 3)
        const iterator = arr.$_iterator()
        expect(iterator.next().value).assertEqual(1)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_OF_4200
     * @tc.name testSparseArrayOf042
     * @tc.desc Test SparseArray of, verify indexed access and length (arr.length equals 20, arr[19] equals 20)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayOf042', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = SparseArray.of<int>(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20)
        expect(arr.length).assertEqual(20)
        expect(arr[19]).assertEqual(20)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_OF_4300
     * @tc.name testSparseArrayOf043
     * @tc.desc Test SparseArray of, verify indexed access and length (arr.length equals 3, arr[0] equals "a")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayOf043', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = SparseArray.of<string>("a", "b", "c")
        expect(arr.length).assertEqual(3)
        expect(arr[0]).assertEqual("a")
        expect(arr[1]).assertEqual("b")
        expect(arr[2]).assertEqual("c")
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_OF_4400
     * @tc.name testSparseArrayOf044
     * @tc.desc Test SparseArray of, verify indexed access and length (arr.length equals 5, arr[0] equals 10)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayOf044', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = SparseArray.of<number>(10, 20, 30, 40, 50)
        expect(arr.length).assertEqual(5)
        expect(arr[0]).assertEqual(10)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_OF_4500
     * @tc.name testSparseArrayOf045
     * @tc.desc Test SparseArray of, verify indexed access and length (arr.length equals 3, arr[0] equals true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayOf045', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = SparseArray.of<boolean>(true, false, true)
        expect(arr.length).assertEqual(3)
        expect(arr[0]).assertEqual(true)
        expect(arr[1]).assertEqual(false)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_OF_4600
     * @tc.name testSparseArrayOf046
     * @tc.desc SparseArray.of with short boundary values, verify elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayOf046', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = SparseArray.of<short>(32767 as short, (-32768 as short))
        expect(arr.length).assertEqual(2)
        expect(arr[0]).assertEqual(32767 as short)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_OF_4700
     * @tc.name testSparseArrayOf047
     * @tc.desc SparseArray.of with long large integer, verify element stored
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayOf047', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const big: long = 9223372036854775807 as long
        const arr = SparseArray.of<long>(big)
        expect(arr[0]).assertEqual(big)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_OF_4800
     * @tc.name testSparseArrayOf048
     * @tc.desc SparseArray.of with null enum slot placeholder in ColorOf050 array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayOf048', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = SparseArray.of<ColorOf050 | null>(ColorOf050.Red, null, ColorOf050.Blue)
        expect(arr.length).assertEqual(3);
        expect(arr[1]).assertEqual(null);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_OF_4900
     * @tc.name testSparseArrayOf049
     * @tc.desc SparseArray.of with long near LONG_MAX boundary value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayOf049', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const nearMax: long = 9223372036854775806 as long
        const arr = SparseArray.of<long>(nearMax)
        expect(arr[0]).assertEqual(nearMax)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_OF_5000
     * @tc.name testSparseArrayOf050
     * @tc.desc SparseArray.of stores hex 0x1 binary 0b10 octal 0o3 literals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayOf050', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = SparseArray.of<int>(0x1, 0b10, 0o3)
        expect(arr.length).assertEqual(3)
        expect(arr[2]).assertEqual(0o3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_OF_5100
     * @tc.name testSparseArrayOf051
     * @tc.desc SparseArray.of with char values stores char order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayOf051', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = SparseArray.of<char>(c'A', c'Z')
        expect(arr.length).assertEqual(2)
        expect(arr[0]).assertEqual(c'A')
        expect(arr[1]).assertEqual(c'Z')
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_OF_5200
     * @tc.name testSparseArrayOf052
     * @tc.desc SparseArray.of with explicit undefined element stores undefined slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayOf052', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = SparseArray.of<int | undefined>(1, undefined, 3)
        expect(arr.length).assertEqual(3)
        expect(arr[1]).assertUndefined()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_OF_5300
     * @tc.name testSparseArrayOf053
     * @tc.desc SparseArray.of with byte boundary values stores byte elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayOf053', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = SparseArray.of<byte>(127 as byte, (-128 as byte))
        expect(arr.length).assertEqual(2)
        expect(arr[0]).assertEqual(127 as byte)
        expect(arr[1]).assertEqual(-128 as byte)
    });


  });
}
