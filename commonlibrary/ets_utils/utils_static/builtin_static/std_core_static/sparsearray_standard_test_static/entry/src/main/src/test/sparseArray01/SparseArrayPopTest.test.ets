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



class TestObj017 {
    value: int = 0
  }

class Person029 {
    name: string = ""
    age: int = 0
  }

class TestClass040 {
    value: int = 0
  }

class TestClass042 {
    value: int = 0
  }

class UndoStack063 {
    private history: SparseArray<string> = new SparseArray<string>()

    pushState(state: string): void {
      this.history.push(state)
    }

    undo(): string | undefined {
      return this.history.pop()
    }

    canUndo(): boolean {
      return this.history.length > 0
    }
  }

class TaskQueue064 {
    private tasks: SparseArray<int> = new SparseArray<int>()

    addTask(taskId: int): void {
      this.tasks.push(taskId)
    }

    getNextTask(): int | undefined {
      return this.tasks.pop()
    }

    hasTasks(): boolean {
      return this.tasks.length > 0
    }
  }

export default function SparseArrayPopTest(): void {
  describe('SparseArrayPopTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_0100
     * @tc.name testSparseArrayPop001
     * @tc.desc Pop [1,2,3], verify returns 3, length shrinks by 1, trailing index cleared, instanceof SparseArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const arr = new SparseArray<int>(1, 2, 3)
        expect(arr instanceof SparseArray).assertTrue()
        const oldLength = arr.length
        const result = arr.pop()
        expect(result).assertEqual(3)
        expect(arr.length).assertEqual(2)
        expect(arr.length).assertEqual(oldLength - 1)
        expect(arr[2]).assertEqual(undefined)

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_0200
     * @tc.name testSparseArrayPop002
     * @tc.desc Pop [10,20,30], verify returns 30, length 2, remaining indices unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const arr = new SparseArray<int>(10, 20, 30)
        const result = arr.pop()
        expect(result).assertEqual(30)
        expect(arr.length).assertEqual(2)
        expect(arr[2]).assertEqual(undefined)
        expect(arr[0]).assertEqual(10)
        expect(arr[1]).assertEqual(20)

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_0300
     * @tc.name testSparseArrayPop003
     * @tc.desc Test SparseArray.pop, verify method result (result equals 3, typeof result equals 'number')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<number>(1, 2, 3)
        const result = arr.pop()
        expect(result).assertEqual(3)
        expect(typeof result).assertEqual('number')
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_0400
     * @tc.name testSparseArrayPop004
     * @tc.desc Test SparseArray.pop, verify method result (result equals "c", typeof result equals 'string')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("a", "b", "c")
        const result = arr.pop()
        expect(result).assertEqual("c")
        expect(typeof result).assertEqual('string')
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_0500
     * @tc.name testSparseArrayPop005
     * @tc.desc Test SparseArray.pop, verify method result (result equals true, typeof result equals 'boolean')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<boolean>(true, false, true)
        const result = arr.pop()
        expect(result).assertEqual(true)
        expect(typeof result).assertEqual('boolean')
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_0600
     * @tc.name testSparseArrayPop006
     * @tc.desc Pop on empty SparseArray, verify returns undefined and length stays 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop006', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const arr = new SparseArray<int>()
        expect(arr.length).assertEqual(0)
        const result = arr.pop()
        expect(result).assertEqual(undefined)
        expect(arr.length).assertEqual(0)

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_0700
     * @tc.name testSparseArrayPop007
     * @tc.desc Test SparseArray.pop, verify method result (result equals undefined, arr.length equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop007', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | undefined>(1, 2, undefined)
        arr.length = 4
        const result = arr.pop()
        expect(result).assertEqual(undefined)
        expect(arr.length).assertEqual(3)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_0800
     * @tc.name testSparseArrayPop008
     * @tc.desc Test SparseArray.pop, verify method result (result equals undefined, arr.length equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop008', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | undefined>(1, 2, undefined)
        const result = arr.pop()
        expect(result).assertEqual(undefined)
        expect(arr.length).assertEqual(2)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_0900
     * @tc.name testSparseArrayPop009
     * @tc.desc Test SparseArray.pop, verify method result (result1 equals undefined, result2 equals undefined)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop009', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr1 = new SparseArray<int>(1, 2)
        arr1.length = 3
        const result1 = arr1.pop()
        expect(result1).assertEqual(undefined)

        const arr2 = new SparseArray<int | undefined>(1, 2, undefined)
        const result2 = arr2.pop()
        expect(result2).assertEqual(undefined)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_1000
     * @tc.name testSparseArrayPop010
     * @tc.desc Test SparseArray.pop, verify method result (result equals null)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop010', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | null>(1, 2, null)
        const result = arr.pop()
        expect(result).assertEqual(null)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_1100
     * @tc.name testSparseArrayPop011
     * @tc.desc Test SparseArray.pop, verify method result (result equals 3, result2 equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop011', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 0, 3)
        const result = arr.pop()
        expect(result).assertEqual(3)
        const result2 = arr.pop()
        expect(result2).assertEqual(0)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_1200
     * @tc.name testSparseArrayPop012
     * @tc.desc Test SparseArray.pop, verify method result (result equals false, typeof result equals 'boolean')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop012', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<boolean>(true, false, false)
        const result = arr.pop()
        expect(result).assertEqual(false)
        expect(typeof result).assertEqual('boolean')
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_1300
     * @tc.name testSparseArrayPop013
     * @tc.desc Test SparseArray.pop, verify method result (result equals "c", result2 equals "")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop013', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("a", "", "c")
        const result = arr.pop()
        expect(result).assertEqual("c")
        const result2 = arr.pop()
        expect(result2).assertEqual("")
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_1400
     * @tc.name testSparseArrayPop014
     * @tc.desc Test SparseArray.pop, verify method result (result equals 50, arr.length equals 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop014', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10, 20, 30, 40, 50)
        const result = arr.pop()
        expect(result).assertEqual(50)
        expect(arr.length).assertEqual(4)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_1500
     * @tc.name testSparseArrayPop015
     * @tc.desc Test SparseArray.pop, verify method result (result equals 42, arr.length equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop015', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        arr.push(42)
        const result = arr.pop()
        expect(result).assertEqual(42)
        expect(arr.length).assertEqual(0)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_1600
     * @tc.name testSparseArrayPop016
     * @tc.desc Pop last of 10000 elements, verify returns 9999 and completes within 100ms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop016', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const arr = new SparseArray<int>()
        for (let i = 0; i < 10000; i++) {
          arr.push(i)
        }
        const start = Date.now()
        const result = arr.pop()
        const end = Date.now()
        expect(result).assertEqual(9999)
        expect(arr.length).assertEqual(9999)
        expect(end - start).assertLess(100)

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_1700
     * @tc.name testSparseArrayPop017
     * @tc.desc Test SparseArray.pop, verify method result (result!.value equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop017', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<TestObj017>()
        const obj1 = new TestObj017()
        obj1.value = 1
        const obj2 = new TestObj017()
        obj2.value = 2
        arr.push(obj1, obj2)
        const result = arr.pop()
        expect(result!.value).assertEqual(2)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_1800
     * @tc.name testSparseArrayPop018
     * @tc.desc Test SparseArray.pop, verify method result (result equals undefined, arr.length equals 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop018', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5)
        arr[0] = 10
        arr[2] = 30
        arr.length = 5
        const result = arr.pop()
        expect(result).assertEqual(undefined)
        expect(arr.length).assertEqual(4)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_1900
     * @tc.name testSparseArrayPop019
     * @tc.desc Test SparseArray.pop, verify method result (result equals 50, arr.length equals 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop019', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5)
        arr[0] = 10
        arr[4] = 50
        const result = arr.pop()
        expect(result).assertEqual(50)
        expect(arr.length).assertEqual(4)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_2000
     * @tc.name testSparseArrayPop020
     * @tc.desc Test SparseArray.pop, verify method result (result equals undefined, arr.length equals 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop020', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        arr.push(1, 2)
        arr.length = 5
        const result = arr.pop()
        expect(result).assertEqual(undefined)
        expect(arr.length).assertEqual(4)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_2100
     * @tc.name testSparseArrayPop021
     * @tc.desc Test SparseArray.pop, verify method result (result equals 90, arr.length equals 9)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop021', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10)
        arr[0] = 10
        arr[5] = 50
        arr[9] = 90
        const result = arr.pop()
        expect(result).assertEqual(90)
        expect(arr.length).assertEqual(9)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_2200
     * @tc.name testSparseArrayPop022
     * @tc.desc Test SparseArray.pop, verify method result (result1 equals undefined, result1 === undefined is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop022', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | undefined>(1, 2, undefined)
        const result1 = arr.pop()
        expect(result1).assertEqual(undefined)
        expect(result1 === undefined).assertTrue()

        const arr2 = new SparseArray<int>(1, 2, 3)
        const result2 = arr2.pop()
        expect(result2).assertEqual(3)
        expect(result2 !== undefined).assertTrue()
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_2300
     * @tc.name testSparseArrayPop023
     * @tc.desc Test SparseArray.pop, verify method result (result === 2 is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop023', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | undefined>(1, 2)
        const result = arr.pop()
        expect(result === 2).assertTrue()
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_2400
     * @tc.name testSparseArrayPop024
     * @tc.desc Test SparseArray.pop, verify method result (arr.length equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop024', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10, 20, 30)
        expect(arr.pop()).assertEqual(30)
        expect(arr.pop()).assertEqual(20)
        expect(arr.pop()).assertEqual(10)
        expect(arr.pop()).assertEqual(undefined)
        expect(arr.length).assertEqual(0)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_2500
     * @tc.name testSparseArrayPop025
     * @tc.desc Test SparseArray.pop, verify method result (result1 equals undefined, result2 equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop025', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | undefined>(1, undefined, 3)
        arr.length = 4
        const result1 = arr.pop()
        expect(result1).assertEqual(undefined)
        const result2 = arr.pop()
        expect(result2).assertEqual(3)
        const result3 = arr.pop()
        expect(result3).assertEqual(undefined)
        const result4 = arr.pop()
        expect(result4).assertEqual(1)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_2600
     * @tc.name testSparseArrayPop026
     * @tc.desc Test SparseArray.pop, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop026', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        arr.push(1, 2, 3)
        expect(arr.pop()).assertEqual(3)
        arr.push(4, 5)
        expect(arr.pop()).assertEqual(5)
        expect(arr.pop()).assertEqual(4)
        expect(arr.pop()).assertEqual(2)
        expect(arr.pop()).assertEqual(1)
        expect(arr.pop()).assertEqual(undefined)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_2700
     * @tc.name testSparseArrayPop027
     * @tc.desc Test SparseArray.pop, verify method result (result equals 3.5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop027', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<number>(1.5, 2.5, 3.5)
        const result = arr.pop()
        expect(result).assertEqual(3.5)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_2800
     * @tc.name testSparseArrayPop028
     * @tc.desc Test SparseArray.pop, verify method result (result equals 3n)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop028', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<bigint>(1n, 2n, 3n)
        const result = arr.pop()
        expect(result).assertEqual(3n)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_2900
     * @tc.name testSparseArrayPop029
     * @tc.desc Test SparseArray.pop, verify method result (result!.name equals "Bob", result!.age equals 30)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop029', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const p1 = new Person029()
        p1.name = "Alice"
        p1.age = 25
        const p2 = new Person029()
        p2.name = "Bob"
        p2.age = 30
        const arr = new SparseArray<Person029>(p1, p2)
        const result = arr.pop()
        expect(result!.name).assertEqual("Bob")
        expect(result!.age).assertEqual(30)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_3000
     * @tc.name testSparseArrayPop030
     * @tc.desc Test SparseArray.pop, verify method result (result1 equals null, result2 equals "hello")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop030', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | string | null>(1, "hello", null)
        const result1 = arr.pop()
        expect(result1).assertEqual(null)
        const result2 = arr.pop()
        expect(result2).assertEqual("hello")
        const result3 = arr.pop()
        expect(result3).assertEqual(1)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_3100
     * @tc.name testSparseArrayPop031
     * @tc.desc Test SparseArray.pop, verify method result (result equals undefined, arr.length equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop031', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1)
        const result = arr.pop()
        expect(result).assertEqual(undefined)
        expect(arr.length).assertEqual(0)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_3200
     * @tc.name testSparseArrayPop032
     * @tc.desc Test SparseArray.pop, verify method result (result equals 300)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop032', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = SparseArray.of<int>(100, 200, 300)
        const result = arr.pop()
        expect(result).assertEqual(300)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_3300
     * @tc.name testSparseArrayPop033
     * @tc.desc Test SparseArray.pop, verify method result (result equals 3, arr.length equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop033', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4, 5)
        arr.length = 3
        const result = arr.pop()
        expect(result).assertEqual(3)
        expect(arr.length).assertEqual(2)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_3400
     * @tc.name testSparseArrayPop034
     * @tc.desc Test SparseArray.pop, verify method result (result equals undefined, arr.length equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop034', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3)
        arr.length = 0
        const result = arr.pop()
        expect(result).assertEqual(undefined)
        expect(arr.length).assertEqual(0)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_3500
     * @tc.name testSparseArrayPop035
     * @tc.desc Test SparseArray.pop, verify method result (result equals undefined, arr.length equals 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop035', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2)
        arr.length = 5
        const result = arr.pop()
        expect(result).assertEqual(undefined)
        expect(arr.length).assertEqual(4)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_3600
     * @tc.name testSparseArrayPop036
     * @tc.desc Test SparseArray.pop, verify method result (arr[arr.length - 1] equals 4, arr.length equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop036', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3)
        arr.pop()
        arr.push(4)
        expect(arr[arr.length - 1]).assertEqual(4)
        expect(arr.length).assertEqual(3)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_3700
     * @tc.name testSparseArrayPop037
     * @tc.desc Test SparseArray.pop, verify method result (last equals 4, first equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop037', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4)
        const last = arr.pop()
        const first = arr.shift()
        expect(last).assertEqual(4)
        expect(first).assertEqual(1)
        expect(arr.length).assertEqual(2)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_3800
     * @tc.name testSparseArrayPop038
     * @tc.desc Test SparseArray.pop, verify method result (arr.length equals 9000, arr[arr.length - 1] equals 8999)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop038', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
          for (let i = 0; i < 10000; i++) {
          arr.push(i)
        }
          for (let i = 0; i < 1000; i++) {
          arr.pop()
        }
        expect(arr.length).assertEqual(9000)
        expect(arr[arr.length - 1]).assertEqual(8999)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_3900
     * @tc.name testSparseArrayPop039
     * @tc.desc Test SparseArray.pop, verify method result (result!.value equals 42, result === obj is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop039', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const obj = new TestClass040()
        obj.value = 42
        const arr = new SparseArray<TestClass040>(obj)
        const result = arr.pop()
        expect(result!.value).assertEqual(42)
        expect(result === obj).assertTrue()
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_4000
     * @tc.name testSparseArrayPop040
     * @tc.desc Test SparseArray.pop, verify method result (result !== undefined is true, r[0] equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop040', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const innerArray: Array<int> = [1, 2, 3]
        const arr = new SparseArray<Array<int>>(innerArray)
        const result = arr.pop()
        expect(result !== undefined).assertTrue()
        const r = result as Array<int>
        expect(r[0]).assertEqual(1)
        expect(r[1]).assertEqual(2)
        expect(r[2]).assertEqual(3)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_4100
     * @tc.name testSparseArrayPop041
     * @tc.desc Test SparseArray.pop, verify method result (result !== undefined is true, arr[0] equals undefined)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop041', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const obj = new TestClass042()
        obj.value = 42
        const arr = new SparseArray<TestClass042>(obj)
        const result = arr.pop()
        expect(result !== undefined).assertTrue()
        const r = result as TestClass042
        r.value = 100
        expect(arr[0]).assertEqual(undefined)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_4200
     * @tc.name testSparseArrayPop042
     * @tc.desc Test SparseArray.pop, verify method result (result equals Number.MAX_VALUE)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop042', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<number>(1, 2, Number.MAX_VALUE)
        const result = arr.pop()
        expect(result).assertEqual(Number.MAX_VALUE)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_4300
     * @tc.name testSparseArrayPop043
     * @tc.desc Test SparseArray.pop, verify method result (result equals Number.MIN_VALUE)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop043', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<number>(1, Number.MIN_VALUE, 3)
        arr.pop()
        const result = arr.pop()
        expect(result).assertEqual(Number.MIN_VALUE)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_4400
     * @tc.name testSparseArrayPop044
     * @tc.desc Test SparseArray.pop, verify method result (result equals Double.POSITIVE_INFINITY)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop044', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<number>(1, Double.POSITIVE_INFINITY, 3)
        arr.pop()
        const result = arr.pop()
        expect(result).assertEqual(Double.POSITIVE_INFINITY)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_4500
     * @tc.name testSparseArrayPop045
     * @tc.desc Test SparseArray.pop, verify method result (result !== undefined is true, element is NaN)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop045', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<number>(1, Double.NaN, 3)
        arr.pop()
        const result = arr.pop()
        expect(result !== undefined).assertTrue()
        expect(isNaN(result as number)).assertTrue()
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_4600
     * @tc.name testSparseArrayPop046
     * @tc.desc Test SparseArray.pop, verify method result (result equals "", typeof result equals 'string')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop046', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("hello", "", "world")
        arr.pop()
        const result = arr.pop()
        expect(result).assertEqual("")
        expect(typeof result).assertEqual('string')
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_4700
     * @tc.name testSparseArrayPop047
     * @tc.desc Test SparseArray.pop, verify method result (result equals longStr, result!.length equals 10000)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop047', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let longStr = ""
          for (let i = 0; i < 10000; i++) {
          longStr += "a"
        }
        const arr = new SparseArray<string>("short", longStr)
        const result = arr.pop()
        expect(result).assertEqual(longStr)
        expect(result!.length).assertEqual(10000)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_4800
     * @tc.name testSparseArrayPop048
     * @tc.desc Test SparseArray.pop, verify method result (result equals "\n\t\r")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop048', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("a", "\n\t\r", "c")
        arr.pop()
        const result = arr.pop()
        expect(result).assertEqual("\n\t\r")
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_4900
     * @tc.name testSparseArrayPop049
     * @tc.desc Test SparseArray.pop, verify method result (result equals "한글")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop049', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("中文", "日本語", "한글")
        const result = arr.pop()
        expect(result).assertEqual("한글")
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_5000
     * @tc.name testSparseArrayPop050
     * @tc.desc Test SparseArray.pop, verify method result (arr.length equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop050', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5)
        expect(arr.pop()).assertEqual(undefined)
        expect(arr.pop()).assertEqual(undefined)
        expect(arr.pop()).assertEqual(undefined)
        expect(arr.pop()).assertEqual(undefined)
        expect(arr.pop()).assertEqual(undefined)
        expect(arr.length).assertEqual(0)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_5100
     * @tc.name testSparseArrayPop051
     * @tc.desc Test SparseArray.pop, verify method result (result equals 3, result2 equals undefined)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop051', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1000)
        arr[0] = 1
        arr[500] = 2
        arr[999] = 3
        const result = arr.pop()
        expect(result).assertEqual(3)
        const result2 = arr.pop()
        expect(result2).assertEqual(undefined)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_5200
     * @tc.name testSparseArrayPop052
     * @tc.desc Test SparseArray.pop, verify method result (result equals 30)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop052', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        arr[0] = 10
        arr[100] = 20
        arr[999] = 30
        const result = arr.pop()
        expect(result).assertEqual(30)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_5300
     * @tc.name testSparseArrayPop053
     * @tc.desc Test SparseArray.pop, verify method result (result!.length equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop053', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("a", "b", "c")
        const result = arr.pop()
          if (result !== undefined) {
          expect(result!.length).assertEqual(1)
        }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_5400
     * @tc.name testSparseArrayPop054
     * @tc.desc pop on [6,5,5], verify returns last element 5 and length becomes 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop054', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(6, 5, 5);
        const val = arr.pop();
        expect(val).assertEqual(5);
        expect(arr.length).assertEqual(2);
        expect(arr[0]).assertEqual(6);
        expect(arr[1]).assertEqual(5);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_5500
     * @tc.name testSparseArrayPop055
     * @tc.desc Test SparseArray.pop, verify method result (result === 2 is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop055', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<number | string>(1, "hello", 2)
        const result = arr.pop()
        expect(result === 2).assertTrue()
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_5600
     * @tc.name testSparseArrayPop056
     * @tc.desc Test SparseArray.pop, verify method result (arr instanceof SparseArray is true, result is undefined)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop056', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | undefined>(1, undefined)
        expect(arr instanceof SparseArray).assertTrue();
        arr.length = 3
        const result = arr.pop()
        expect(result).assertUndefined();
        expect(arr.length).assertEqual(2);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_5700
     * @tc.name testSparseArrayPop057
     * @tc.desc Test SparseArray.pop, verify method result (sum equals 15, arr.length equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop057', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4, 5)
        let sum = 0
          while (arr.length > 0) {
          const value = arr.pop()
          if (value !== undefined) {
            sum += value
          }
        }
        expect(sum).assertEqual(15)
        expect(arr.length).assertEqual(0)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_5800
     * @tc.name testSparseArrayPop058
     * @tc.desc Test SparseArray.pop, verify method result (arr.length equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop058', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
          for (let i = 0; i < 100; i++) {
          arr.push(i)
        }
          for (let i = 99; i >= 0; i--) {
          expect(arr.pop()).assertEqual(i)
        }
        expect(arr.length).assertEqual(0)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_5900
     * @tc.name testSparseArrayPop059
     * @tc.desc Test SparseArray.pop, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop059', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr1 = new SparseArray<int>()
        expect(arr1.pop()).assertEqual(undefined)

        const arr2 = new SparseArray<int>(1)
        expect(arr2.pop()).assertEqual(undefined)

        const arr3 = new SparseArray<int | undefined>(undefined)
        expect(arr3.pop()).assertEqual(undefined)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_6000
     * @tc.name testSparseArrayPop060
     * @tc.desc Test SparseArray.pop, verify method result (result === 3.5 is true, result2 === undefined is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop060', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<number | undefined>(1.5, 2.5, 3.5)
        const result = arr.pop()
        expect(result === 3.5).assertTrue()

        const arr2 = new SparseArray<number>()
        const result2 = arr2.pop()
        expect(result2 === undefined).assertTrue()
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_6100
     * @tc.name testSparseArrayPop061
     * @tc.desc Test SparseArray.pop, verify method result (last equals undefined, newlast equals undefined)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop061', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | undefined>(1, 2, undefined)
        arr.length = 4
        const last = arr.pop()
        expect(last).assertEqual(undefined)
        const newlast = arr.pop()
        expect(newlast).assertEqual(undefined)
        expect(arr.length).assertEqual(2)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_6200
     * @tc.name testSparseArrayPop062
     * @tc.desc Test SparseArray pop, verify expected behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop062', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const stack = new UndoStack063()
        stack.pushState("Action1")
        stack.pushState("Action2")
        stack.pushState("Action3")

        expect(stack.canUndo()).assertTrue()
        expect(stack.undo()).assertEqual("Action3")
        expect(stack.undo()).assertEqual("Action2")
        expect(stack.undo()).assertEqual("Action1")
        expect(stack.undo()).assertEqual(undefined)
        expect(stack.canUndo()).assertFalse()
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_6300
     * @tc.name testSparseArrayPop063
     * @tc.desc Test SparseArray pop, verify expected behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop063', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const queue = new TaskQueue064()
        queue.addTask(1)
        queue.addTask(2)
        queue.addTask(3)

        expect(queue.hasTasks()).assertTrue()
        expect(queue.getNextTask()).assertEqual(3)
        expect(queue.getNextTask()).assertEqual(2)
        expect(queue.getNextTask()).assertEqual(1)
        expect(queue.hasTasks()).assertFalse()
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_6400
     * @tc.name testSparseArrayPop064
     * @tc.desc Test SparseArray.pop, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop064', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | undefined>()
        arr.push(1)
        arr.push(2)
        arr.push(undefined)
        arr.length = 5
        arr[4] = 100

        expect(arr.pop()).assertEqual(100)
        expect(arr.pop()).assertEqual(undefined)
        expect(arr.pop()).assertEqual(undefined)
        expect(arr.pop()).assertEqual(2)
        expect(arr.pop()).assertEqual(1)
        expect(arr.pop()).assertEqual(undefined)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_6500
     * @tc.name testSparseArrayPop065
     * @tc.desc Test SparseArray.pop, verify method result (result1 equals undefined, result2 equals undefined)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop065', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<undefined>(undefined, undefined, undefined)
        const result1 = arr.pop()
        const result2 = arr.pop()
        const result3 = arr.pop()
        expect(result1).assertEqual(undefined)
        expect(result2).assertEqual(undefined)
        expect(result3).assertEqual(undefined)
        expect(arr.length).assertEqual(0)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_6600
     * @tc.name testSparseArrayPop066
     * @tc.desc Test SparseArray.pop, verify method result (result1 equals 4, result2 equals undefined)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop066', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        arr[0] = 1
        arr[2] = 2
        arr[4] = 3
        arr[6] = 4
        const result1 = arr.pop()
        expect(result1).assertEqual(4)
        const result2 = arr.pop()
        expect(result2).assertEqual(undefined)
        const result3 = arr.pop()
        expect(result3).assertEqual(3)
        const result4 = arr.pop()
        expect(result4).assertEqual(undefined)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_6700
     * @tc.name testSparseArrayPop067
     * @tc.desc Test SparseArray.pop, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop067', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | undefined>()
        arr.push(undefined)
        arr.push(undefined)
        arr.push(42)
        arr.push(undefined)
        arr.push(undefined)

        expect(arr.pop()).assertEqual(undefined)
        expect(arr.pop()).assertEqual(undefined)
        expect(arr.pop()).assertEqual(42)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_6800
     * @tc.name testSparseArrayPop068
     * @tc.desc Test SparseArray.pop, verify method result (result equals 3, typeof result equals 'number')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop068', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<number>(1, 2.5, 3)
        const result = arr.pop()
        expect(result).assertEqual(3)
        expect(typeof result).assertEqual('number')
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_6900
     * @tc.name testSparseArrayPop069
     * @tc.desc Test SparseArray.pop, verify method result (result equals "world", typeof result equals 'string')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop069', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("hello", "world")
        const result = arr.pop()
        expect(result).assertEqual("world")
        expect(typeof result).assertEqual('string')
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_7000
     * @tc.name testSparseArrayPop070
     * @tc.desc Test SparseArray.pop, verify method result (r1 equals undefined, r2 equals undefined)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop070', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr1 = new SparseArray<string>("test")
        const r1 = arr1.pop()
          if (r1 !== undefined) {
          expect(r1.length).assertLarger(0)
          } else {
          expect(r1).assertEqual(undefined)
        }

        const arr2 = new SparseArray<string>()
        const r2 = arr2.pop()
          if (r2 !== undefined) {
          expect(r2.length).assertLarger(0)
          } else {
          expect(r2).assertEqual(undefined)
        }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_7100
     * @tc.name testSparseArrayPop071
     * @tc.desc Test SparseArray.pop, verify method result (arr.length equals 1000)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop071', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
          for (let i = 0; i < 1000; i++) {
          arr.push(i)
        }
          for (let i = 0; i < 500; i++) {
          arr.pop()
          arr.push(1000 + i)
        }
          for (let j = 0; j < 10; j++) {
          for (let k = 0; k < 100; k++) {
            arr.pop()
          }
          for (let k = 0; k < 100; k++) {
            arr.push(k)
          }
        }
        expect(arr.length).assertEqual(1000)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_7200
     * @tc.name testSparseArrayPop072
     * @tc.desc pop returns long element exceeding int range from SparseArray<long>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop072', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const big: long = 9223372036854775807 as long;
        const arr = new SparseArray<long>(10000000000 as long, big);
        const result = arr.pop();
        expect(result).assertEqual(big);
        expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_7300
     * @tc.name testSparseArrayPop073
     * @tc.desc pop returns float element from SparseArray<float>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop073', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<float>(1.0f, 3.14f);
        const result = arr.pop();
        expect(result).assertEqual(3.14f);
        expect(arr.length).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_7400
     * @tc.name testSparseArrayPop074
     * @tc.desc pop returns null element from SparseArray<int|null>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop074', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | null>(1, 2, null);
        const v = arr.pop();
        expect(v).assertEqual(null);
        expect(arr.length).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_7500
     * @tc.name testSparseArrayPop075
     * @tc.desc pop returns last octal literal element 0o7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop075', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(0x1, 0b10, 0o7);
        const v = arr.pop();
        expect(v).assertEqual(0o7);
        expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_7600
     * @tc.name testSparseArrayPop076
     * @tc.desc pop returns char element and decrements length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop076', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<char>(c'A', c'B');
        const v = arr.pop();
        expect(v).assertEqual(c'B');
        expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_7700
     * @tc.name testSparseArrayPop077
     * @tc.desc pop returns explicit undefined element from SparseArray<int|undefined>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop077', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | undefined>(1, undefined);
        const v = arr.pop();
        expect(v).assertUndefined();
        expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_POP_7800
     * @tc.name testSparseArrayPop078
     * @tc.desc pop returns byte boundary value from SparseArray<byte>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayPop078', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<byte>(127 as byte, (-128 as byte));
        const v = arr.pop();
        expect(v).assertEqual(-128 as byte);
        expect(arr.length).assertEqual(1);
    });

  });
}
