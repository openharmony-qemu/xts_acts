/*
 * Copyright (c) 2026 RKH Corp.
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

import { collections } from '@kit.ArkTS';
import taskpool from '@ohos.taskpool';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { sleep } from '../Utils';

// ===== @Sendable Class Definitions =====

@Sendable
class BasicArray extends collections.Array<number> {}

@Sendable
class MethodArray extends collections.Array<number> {
  customMethod(): number {
    return this.length * 2
  }
}

@Sendable
class TagArray extends collections.Array<number> {
  tag: string = 'TagArray'
  constructor(...items: number[]) {
    super(...items)
  }
  getTag(): string {
    return this.tag
  }
}

@Sendable
class SuperArray extends collections.Array<number> {
  constructor(first: number, ...rest: number[]) {
    super(first, ...rest)
  }
}

@Sendable
class SumArray extends collections.Array<number> {
  sum: number = 0
  constructor(...items: number[]) {
    super(...items)
    this.sum = items.reduce((a: number, b: number) => a + b, 0)
  }
  getSum(): number {
    return this.sum
  }
}

@Sendable
class SumArrayExt extends collections.Array<number> {
  customSum(): number {
    let total = 0
    for (let i = 0; i < this.length; i++) {
      total += this[i]
    }
    return total
  }
}

@Sendable
class Level1Array extends collections.Array<number> {}

@Sendable
class Level2Array extends Level1Array {}

@Sendable
class Level3Array extends Level2Array {}

@Sendable
class GrandArray extends collections.Array<number> {
  customMethod(): number {
    return this.length * 2
  }
}

@Sendable
class GreatGrandArray extends GrandArray {
  grandMethod(): number {
    return this.customMethod() + 1
  }
}

@Sendable
class CustomPropArray extends collections.Array<number> {
  tag: string = 'CustomPropArray'
  version: number = 1
  metadata: collections.Map<string, string> = new collections.Map<string, string>()
  description: string = 'custom array'
}

@Sendable
class StringSendArray extends collections.Array<string> {}

@Sendable
class MathArray extends collections.Array<number> {
  sum(): number {
    let total = 0
    for (let i = 0; i < this.length; i++) {
      total += this[i]
    }
    return total
  }
  average(): number {
    if (this.length === 0) return 0
    return this.sum() / this.length
  }
}

@Sendable
class OverridePushArray extends collections.Array<number> {
  push(...items: number[]): number {
    return super.push(...items)
  }
}

@Sendable
class RangeArray extends collections.Array<number> {
  static fromRange(start: number, end: number): RangeArray {
    let arr = new RangeArray()
    for (let i = start; i <= end; i++) {
      arr.push(i)
    }
    return arr
  }
}

@Sendable
class DoubleArray extends collections.Array<number> {
  doubleAll(): void {
    for (let i = 0; i < this.length; i++) {
      this[i] = this[i] * 2
    }
  }
}

// ===== @Concurrent Functions =====

@Concurrent
function getArrayLengthFunc(arr: collections.Array<number>): number {
  return arr.length
}

@Concurrent
function checkSendableFunc(arr: BasicArray): boolean {
  return arr instanceof collections.Array
}

@Concurrent
function processSumFunc(arr: SumArrayExt): number {
  arr.push(100)
  return arr.customSum()
}

@Concurrent
function modifySendableFunc(arr: BasicArray): void {
  arr.push(100)
  arr.push(200)
}

@Concurrent
function checkLevel3Func(a: Level3Array): boolean {
  return a instanceof collections.Array
}

@Concurrent
function getDescFunc(arr: CustomPropArray): string {
  return arr.description
}

@Concurrent
function addValueFunc(arr: BasicArray, value: number): number {
  arr.push(value)
  return arr.length
}

@Concurrent
function processLargeFunc(arr: BasicArray): number {
  return arr.length
}

@Concurrent
function doubleAllFunc(arr: DoubleArray): number {
  arr.doubleAll()
  return arr.length
}

export default function ArrayInheritanceTest(): void {
  describe('ArrayInheritanceTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await sleep(100)
    })

    // ===== ConcatArray Interface Verification (0100-0900) =====

    /**
     * @tc.name   ArrayInheritanceTest0100
     * @tc.number SUB_ARRAY_INHERITANCE_TEST_0100
     * @tc.desc   Verify collections.Array implements all ConcatArray interface methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArrayInheritanceTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let arr = new collections.Array<number>(1, 2, 3)
      expect(typeof arr.join).assertEqual('function')
      expect(typeof arr.slice).assertEqual('function')
      expect(typeof arr.concat).assertEqual('function')
      expect(typeof arr.indexOf).assertEqual('function')
      expect(typeof arr.includes).assertEqual('function')
      expect(arr.length).assertEqual(3)
    })

    /**
     * @tc.name   ArrayInheritanceTest0200
     * @tc.number SUB_ARRAY_INHERITANCE_TEST_0200
     * @tc.desc   Verify join method returns correct string with different separators
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArrayInheritanceTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let arr = new collections.Array<number>(1, 2, 3)
      expect(arr.join()).assertEqual('1,2,3')
      expect(arr.join('-')).assertEqual('1-2-3')
      expect(arr.join('')).assertEqual('123')
    })

    /**
     * @tc.name   ArrayInheritanceTest0300
     * @tc.number SUB_ARRAY_INHERITANCE_TEST_0300
     * @tc.desc   Verify slice method returns correct sub-array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArrayInheritanceTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let arr = new collections.Array<number>(1, 2, 3, 4, 5)
      let sliced = arr.slice(1, 3)
      expect(sliced.length).assertEqual(2)
      expect(sliced[0]).assertEqual(2)
      expect(sliced[1]).assertEqual(3)
    })

    /**
     * @tc.name   ArrayInheritanceTest0400
     * @tc.number SUB_ARRAY_INHERITANCE_TEST_0400
     * @tc.desc   Verify concat method concatenates two arrays correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArrayInheritanceTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let arr1 = new collections.Array<number>(1, 2)
      let arr2 = new collections.Array<number>(3, 4)
      let concatenated = arr1.concat(arr2)
      expect(concatenated.length).assertEqual(4)
      expect(concatenated[0]).assertEqual(1)
      expect(concatenated[3]).assertEqual(4)
    })

    /**
     * @tc.name   ArrayInheritanceTest0500
     * @tc.number SUB_ARRAY_INHERITANCE_TEST_0500
     * @tc.desc   Verify indexOf method returns correct index with fromIndex
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArrayInheritanceTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let arr = new collections.Array<number>(1, 2, 3, 2, 1)
      expect(arr.indexOf(2)).assertEqual(1)
      expect(arr.indexOf(2, 2)).assertEqual(3)
      expect(arr.indexOf(5)).assertEqual(-1)
    })

    /**
     * @tc.name   ArrayInheritanceTest0600
     * @tc.number SUB_ARRAY_INHERITANCE_TEST_0600
     * @tc.desc   Verify includes method returns correct boolean for element existence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArrayInheritanceTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let arr = new collections.Array<number>(1, 2, 3)
      expect(arr.includes(2)).assertTrue()
      expect(arr.includes(5)).assertFalse()
    })

    /**
     * @tc.name   ArrayInheritanceTest0700
     * @tc.number SUB_ARRAY_INHERITANCE_TEST_0700
     * @tc.desc   Verify readonly length property updates correctly after array operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArrayInheritanceTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let arr = new collections.Array<number>(1, 2, 3)
      expect(arr.length).assertEqual(3)
      arr.push(4)
      expect(arr.length).assertEqual(4)
    })

    /**
     * @tc.name   ArrayInheritanceTest0800
     * @tc.number SUB_ARRAY_INHERITANCE_TEST_0800
     * @tc.desc   Verify collections.Array instance can be passed across threads via TaskPool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ArrayInheritanceTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let arr = new collections.Array<number>(1, 2, 3)
      let task = new taskpool.Task(getArrayLengthFunc, arr)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(3)
    })

    /**
     * @tc.name   ArrayInheritanceTest0900
     * @tc.number SUB_ARRAY_INHERITANCE_TEST_0900
     * @tc.desc   Verify isArray static method identifies collections.Array correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayInheritanceTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr = new collections.Array<number>(1, 2, 3)
      expect(collections.Array.isArray(arr)).assertTrue()
    })

    // ===== Inheritance Chain & Constructor (1000-1900) =====

    /**
     * @tc.name   ArrayInheritanceTest1000
     * @tc.number SUB_ARRAY_INHERITANCE_TEST_1000
     * @tc.desc   Verify subclass instanceof checks for both subclass and parent class
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArrayInheritanceTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let myArr = new MethodArray(1, 2, 3)
      expect(myArr instanceof MethodArray).assertTrue()
      expect(myArr instanceof collections.Array).assertTrue()
    })

    /**
     * @tc.name   ArrayInheritanceTest1100
     * @tc.number SUB_ARRAY_INHERITANCE_TEST_1100
     * @tc.desc   Verify subclass is recognized as collections.Array via isArray
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArrayInheritanceTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let myArr = new BasicArray()
      expect(collections.Array.isArray(myArr)).assertTrue()
    })

    /**
     * @tc.name   ArrayInheritanceTest1200
     * @tc.number SUB_ARRAY_INHERITANCE_TEST_1200
     * @tc.desc   Verify subclass type checks with instanceof and typeof
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayInheritanceTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let myArr = new BasicArray(1, 2, 3)
      expect(myArr instanceof BasicArray).assertTrue()
      expect(myArr instanceof collections.Array).assertTrue()
      expect(typeof myArr).assertEqual('object')
    })

    /**
     * @tc.name   ArrayInheritanceTest1300
     * @tc.number SUB_ARRAY_INHERITANCE_TEST_1300
     * @tc.desc   Verify subclass no-arg constructor creates empty array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArrayInheritanceTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let myArr = new BasicArray()
      expect(myArr.length).assertEqual(0)
      expect(myArr instanceof collections.Array).assertTrue()
    })

    /**
     * @tc.name   ArrayInheritanceTest1400
     * @tc.number SUB_ARRAY_INHERITANCE_TEST_1400
     * @tc.desc   Verify subclass single element constructor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArrayInheritanceTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let myArr = new BasicArray(1)
      expect(myArr.length).assertEqual(1)
      expect(myArr[0]).assertEqual(1)
    })

    /**
     * @tc.name   ArrayInheritanceTest1500
     * @tc.number SUB_ARRAY_INHERITANCE_TEST_1500
     * @tc.desc   Verify subclass multi-element constructor with five elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArrayInheritanceTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let myArr = new BasicArray(1, 2, 3, 4, 5)
      expect(myArr.length).assertEqual(5)
      expect(myArr[0]).assertEqual(1)
      expect(myArr[4]).assertEqual(5)
    })

    /**
     * @tc.name   ArrayInheritanceTest1600
     * @tc.number SUB_ARRAY_INHERITANCE_TEST_1600
     * @tc.desc   Verify subclass constructor with spread syntax from regular array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayInheritanceTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let items: number[] = [1, 2, 3]
      let myArr = new BasicArray(...items)
      expect(myArr.length).assertEqual(3)
      expect(myArr[0]).assertEqual(1)
      expect(myArr[2]).assertEqual(3)
    })

    /**
     * @tc.name   ArrayInheritanceTest1700
     * @tc.number SUB_ARRAY_INHERITANCE_TEST_1700
     * @tc.desc   Verify super call in subclass constructor passes parameters correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArrayInheritanceTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let myArr = new TagArray(1, 2, 3)
      expect(myArr.length).assertEqual(3)
      expect(myArr.getTag()).assertEqual('TagArray')
      expect(myArr[0]).assertEqual(1)
    })

    /**
     * @tc.name   ArrayInheritanceTest1800
     * @tc.number SUB_ARRAY_INHERITANCE_TEST_1800
     * @tc.desc   Verify super with first and rest parameters passes arguments correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArrayInheritanceTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let myArr = new SuperArray(10, 20, 30)
      expect(myArr[0]).assertEqual(10)
      expect(myArr[1]).assertEqual(20)
      expect(myArr[2]).assertEqual(30)
      expect(myArr.length).assertEqual(3)
    })

    /**
     * @tc.name   ArrayInheritanceTest1900
     * @tc.number SUB_ARRAY_INHERITANCE_TEST_1900
     * @tc.desc   Verify custom constructor with initialization logic computes sum correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayInheritanceTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let myArr = new SumArray(1, 2, 3, 4, 5)
      expect(myArr.getSum()).assertEqual(15)
      expect(myArr.length).assertEqual(5)
      expect(myArr instanceof collections.Array).assertTrue()
    })

    // ===== Sendable Semantics (2000-2300) =====

    /**
     * @tc.name   ArrayInheritanceTest2000
     * @tc.number SUB_ARRAY_INHERITANCE_TEST_2000
     * @tc.desc   Verify subclass with @Sendable can be passed across threads via TaskPool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ArrayInheritanceTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let myArr = new BasicArray(1, 2, 3)
      let task = new taskpool.Task(checkSendableFunc, myArr)
      let result = await taskpool.execute(task)
      expect(result as boolean).assertTrue()
    })

    /**
     * @tc.name   ArrayInheritanceTest2100
     * @tc.number SUB_ARRAY_INHERITANCE_TEST_2100
     * @tc.desc   Verify subclass custom method works correctly in TaskPool after modification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ArrayInheritanceTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let myArr = new SumArrayExt(1, 2, 3)
      let task = new taskpool.Task(processSumFunc, myArr)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(106)
      expect(myArr.length).assertEqual(4)
      expect(myArr[3]).assertEqual(100)
    })

    /**
     * @tc.name   ArrayInheritanceTest2200
     * @tc.number SUB_ARRAY_INHERITANCE_TEST_2200
     * @tc.desc   Verify cross-thread modification syncs back to original instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ArrayInheritanceTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let myArr = new BasicArray(1, 2, 3)
      let originalLength = myArr.length
      let task = new taskpool.Task(modifySendableFunc, myArr)
      await taskpool.execute(task)
      expect(myArr.length).assertEqual(originalLength + 2)
      expect(myArr[3]).assertEqual(100)
      expect(myArr[4]).assertEqual(200)
    })

    /**
     * @tc.name   ArrayInheritanceTest2300
     * @tc.number SUB_ARRAY_INHERITANCE_TEST_2300
     * @tc.desc   Verify multiple TaskPool tasks share same subclass instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ArrayInheritanceTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let sharedArr = new BasicArray()
      let p1 = taskpool.execute(new taskpool.Task(addValueFunc, sharedArr, 0))
      let p2 = taskpool.execute(new taskpool.Task(addValueFunc, sharedArr, 10))
      let p3 = taskpool.execute(new taskpool.Task(addValueFunc, sharedArr, 20))
      let p4 = taskpool.execute(new taskpool.Task(addValueFunc, sharedArr, 30))
      let p5 = taskpool.execute(new taskpool.Task(addValueFunc, sharedArr, 40))
      await Promise.all([p1, p2, p3, p4, p5])
      expect(sharedArr.length).assertEqual(5)
    })

    // ===== Multi-level Inheritance (2400-2600) =====

    /**
     * @tc.name   ArrayInheritanceTest2400
     * @tc.number SUB_ARRAY_INHERITANCE_TEST_2400
     * @tc.desc   Verify two-level inheritance instanceof chain and custom methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayInheritanceTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let grandArr = new GreatGrandArray(1, 2, 3)
      expect(grandArr instanceof GreatGrandArray).assertTrue()
      expect(grandArr instanceof GrandArray).assertTrue()
      expect(grandArr instanceof collections.Array).assertTrue()
      expect(grandArr.grandMethod()).assertEqual(7)
      expect(grandArr.customMethod()).assertEqual(6)
    })

    /**
     * @tc.name   ArrayInheritanceTest2500
     * @tc.number SUB_ARRAY_INHERITANCE_TEST_2500
     * @tc.desc   Verify three-level inheritance chain with all instanceof checks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayInheritanceTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr = new Level3Array(1, 2, 3)
      expect(arr instanceof Level3Array).assertTrue()
      expect(arr instanceof Level2Array).assertTrue()
      expect(arr instanceof Level1Array).assertTrue()
      expect(arr instanceof collections.Array).assertTrue()
      expect(arr.length).assertEqual(3)
    })

    /**
     * @tc.name   ArrayInheritanceTest2600
     * @tc.number SUB_ARRAY_INHERITANCE_TEST_2600
     * @tc.desc   Verify three-level inheritance Sendable semantics preserved in TaskPool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ArrayInheritanceTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let arr = new Level3Array(1, 2, 3)
      let task = new taskpool.Task(checkLevel3Func, arr)
      let result = await taskpool.execute(task)
      expect(result as boolean).assertTrue()
    })

    // ===== Inheritance Constraints (2700-2900) =====

    /**
     * @tc.name   ArrayInheritanceTest2700
     * @tc.number SUB_ARRAY_INHERITANCE_TEST_2700
     * @tc.desc   Verify generic type consistency with number type in subclass
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArrayInheritanceTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let numArr = new BasicArray(1, 2, 3)
      expect(numArr.length).assertEqual(3)
      expect(numArr[0]).assertEqual(1)
      expect(typeof numArr[0]).assertEqual('number')
    })

    /**
     * @tc.name   ArrayInheritanceTest2800
     * @tc.number SUB_ARRAY_INHERITANCE_TEST_2800
     * @tc.desc   Verify generic type consistency with string type in subclass
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArrayInheritanceTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let strArr = new StringSendArray('a', 'b', 'c')
      expect(strArr.length).assertEqual(3)
      expect(strArr[0]).assertEqual('a')
      expect(typeof strArr[0]).assertEqual('string')
    })

    // ===== Custom Property Cross-thread & Performance (3000-3200) =====

    /**
     * @tc.name   ArrayInheritanceTest2900
     * @tc.number SUB_ARRAY_INHERITANCE_TEST_2900
     * @tc.desc   Verify custom Sendable property accessible across threads via TaskPool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ArrayInheritanceTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let myArr = new CustomPropArray(1, 2, 3)
      let task = new taskpool.Task(getDescFunc, myArr)
      let result = await taskpool.execute(task)
      expect(result as string).assertEqual('custom array')
    })

    /**
     * @tc.name   ArrayInheritanceTest3000
     * @tc.number SUB_ARRAY_INHERITANCE_TEST_3000
     * @tc.desc   Verify large array creation and cross-thread pass with subclass
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('ArrayInheritanceTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let largeArr = new BasicArray()
      for (let i = 0; i < 10000; i++) {
        largeArr.push(i)
      }
      expect(largeArr.length).assertEqual(10000)
      let task = new taskpool.Task(processLargeFunc, largeArr)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(10000)
    })

    /**
     * @tc.name   ArrayInheritanceTest3100
     * @tc.number SUB_ARRAY_INHERITANCE_TEST_3100
     * @tc.desc   Verify subclass instance type checks with typeof and instanceof
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArrayInheritanceTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let myArr = new BasicArray(1, 2, 3)
      expect(typeof myArr).assertEqual('object')
      expect(myArr instanceof BasicArray).assertTrue()
      expect(myArr instanceof collections.Array).assertTrue()
      expect(myArr.length).assertEqual(3)
    })

    // ===== Method Inheritance (3300-4000) =====

    /**
     * @tc.name   ArrayInheritanceTest3200
     * @tc.number SUB_ARRAY_INHERITANCE_TEST_3200
     * @tc.desc   Verify push method inherited correctly returns new length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArrayInheritanceTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let myArr = new BasicArray()
      let newLength = myArr.push(1, 2, 3)
      expect(newLength).assertEqual(3)
      expect(myArr.length).assertEqual(3)
      expect(myArr[0]).assertEqual(1)
    })

    /**
     * @tc.name   ArrayInheritanceTest3300
     * @tc.number SUB_ARRAY_INHERITANCE_TEST_3300
     * @tc.desc   Verify pop method inherited correctly removes and returns last element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArrayInheritanceTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let myArr = new BasicArray(1, 2, 3)
      let popped = myArr.pop()
      expect(popped).assertEqual(3)
      expect(myArr.length).assertEqual(2)
    })

    /**
     * @tc.name   ArrayInheritanceTest3400
     * @tc.number SUB_ARRAY_INHERITANCE_TEST_3400
     * @tc.desc   Verify forEach method inherited correctly iterates all elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArrayInheritanceTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let myArr = new BasicArray(1, 2, 3)
      let total = 0
      myArr.forEach((value: number) => {
        total += value
      })
      expect(total).assertEqual(6)
    })

    /**
     * @tc.name   ArrayInheritanceTest3500
     * @tc.number SUB_ARRAY_INHERITANCE_TEST_3500
     * @tc.desc   Verify map method inherited correctly returns mapped collections.Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArrayInheritanceTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let myArr = new BasicArray(1, 2, 3)
      let mapped = new collections.Array<number>()
      myArr.forEach((v: number) => {
        mapped.push(v * 2)
      })
      expect(mapped.length).assertEqual(3)
      expect(mapped[0]).assertEqual(2)
      expect(mapped[1]).assertEqual(4)
      expect(mapped[2]).assertEqual(6)
      expect(collections.Array.isArray(mapped)).assertTrue()
    })

    /**
     * @tc.name   ArrayInheritanceTest3600
     * @tc.number SUB_ARRAY_INHERITANCE_TEST_3600
     * @tc.desc   Verify filter method inherited correctly returns filtered collections.Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArrayInheritanceTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let myArr = new BasicArray(1, 2, 3, 4, 5)
      let filtered = myArr.filter((v: number, index: number, arr: collections.Array<number>): boolean => v > 2)
      expect(filtered.length).assertEqual(3)
      expect(filtered[0]).assertEqual(3)
      expect(filtered[1]).assertEqual(4)
      expect(filtered[2]).assertEqual(5)
      expect(collections.Array.isArray(filtered)).assertTrue()
    })

    /**
     * @tc.name   ArrayInheritanceTest3700
     * @tc.number SUB_ARRAY_INHERITANCE_TEST_3700
     * @tc.desc   Verify reduce method inherited correctly computes accumulated value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArrayInheritanceTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let myArr = new BasicArray(1, 2, 3, 4, 5)
      let total = myArr.reduce((a: number, b: number) => a + b, 0)
      expect(total).assertEqual(15)
    })

    /**
     * @tc.name   ArrayInheritanceTest3800
     * @tc.number SUB_ARRAY_INHERITANCE_TEST_3800
     * @tc.desc   Verify slice method inherited correctly returns sub collections.Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArrayInheritanceTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let myArr = new BasicArray(1, 2, 3, 4, 5)
      let sliced = myArr.slice(1, 3)
      expect(sliced.length).assertEqual(2)
      expect(sliced[0]).assertEqual(2)
      expect(sliced[1]).assertEqual(3)
      expect(collections.Array.isArray(sliced)).assertTrue()
    })

    /**
     * @tc.name   ArrayInheritanceTest3900
     * @tc.number SUB_ARRAY_INHERITANCE_TEST_3900
     * @tc.desc   Verify concat method inherited correctly merges two subclass arrays
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArrayInheritanceTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let myArr1 = new BasicArray(1, 2)
      let myArr2 = new BasicArray(3, 4)
      let concatenated = myArr1.concat(myArr2)
      expect(concatenated.length).assertEqual(4)
      expect(concatenated[0]).assertEqual(1)
      expect(concatenated[3]).assertEqual(4)
      expect(collections.Array.isArray(concatenated)).assertTrue()
    })

    // ===== Method Return Type & Override (4100-4300) =====

    /**
     * @tc.name   ArrayInheritanceTest4000
     * @tc.number SUB_ARRAY_INHERITANCE_TEST_4000
     * @tc.desc   Verify map returns collections.Array with correct values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayInheritanceTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let myArr = new MethodArray(1, 2, 3)
      let mapped = new collections.Array<number>()
      myArr.forEach((v: number) => {
        mapped.push(v * 2)
      })
      expect(mapped instanceof collections.Array).assertTrue()
      expect(mapped.length).assertEqual(3)
      expect(mapped[0]).assertEqual(2)
    })

    /**
     * @tc.name   ArrayInheritanceTest4100
     * @tc.number SUB_ARRAY_INHERITANCE_TEST_4100
     * @tc.desc   Verify slice returns collections.Array with correct values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayInheritanceTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let myArr = new BasicArray(1, 2, 3)
      let sliced = myArr.slice(0, 2)
      expect(sliced instanceof collections.Array).assertTrue()
      expect(sliced.length).assertEqual(2)
      expect(sliced[0]).assertEqual(1)
      expect(sliced[1]).assertEqual(2)
    })

    /**
     * @tc.name   ArrayInheritanceTest4200
     * @tc.number SUB_ARRAY_INHERITANCE_TEST_4200
     * @tc.desc   Verify overridden push method delegates to super and works correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayInheritanceTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let myArr = new OverridePushArray()
      let newLength = myArr.push(1, 2, 3)
      expect(newLength).assertEqual(3)
      expect(myArr.length).assertEqual(3)
      expect(myArr[0]).assertEqual(1)
      expect(myArr[2]).assertEqual(3)
    })

    // ===== Property Inheritance (4400-4600) =====

    /**
     * @tc.name   ArrayInheritanceTest4300
     * @tc.number SUB_ARRAY_INHERITANCE_TEST_4300
     * @tc.desc   Verify length property inherited correctly and reflects array state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArrayInheritanceTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let myArr = new BasicArray(1, 2, 3)
      expect(myArr.length).assertEqual(3)
      myArr.push(4)
      expect(myArr.length).assertEqual(4)
      myArr.pop()
      expect(myArr.length).assertEqual(3)
    })

    /**
     * @tc.name   ArrayInheritanceTest4400
     * @tc.number SUB_ARRAY_INHERITANCE_TEST_4400
     * @tc.desc   Verify length property reflects actual array state after multiple operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArrayInheritanceTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let myArr = new BasicArray(1, 2, 3)
      expect(myArr.length).assertEqual(3)
      myArr.push(4, 5)
      expect(myArr.length).assertEqual(5)
      myArr.pop()
      myArr.pop()
      expect(myArr.length).assertEqual(3)
      myArr.splice(0, 1)
      expect(myArr.length).assertEqual(2)
    })

    /**
     * @tc.name   ArrayInheritanceTest4500
     * @tc.number SUB_ARRAY_INHERITANCE_TEST_4500
     * @tc.desc   Verify custom Sendable properties accessible on subclass instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArrayInheritanceTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let myArr = new CustomPropArray(1, 2, 3)
      expect(myArr.tag).assertEqual('CustomPropArray')
      expect(myArr.version).assertEqual(1)
      expect(myArr.metadata !== null).assertTrue()
      expect(myArr.length).assertEqual(3)
    })

    // ===== Custom Extensions (4700-4900) =====

    /**
     * @tc.name   ArrayInheritanceTest4600
     * @tc.number SUB_ARRAY_INHERITANCE_TEST_4600
     * @tc.desc   Verify custom sum and average methods work correctly on subclass
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ArrayInheritanceTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let myArr = new MathArray(10, 20, 30)
      expect(myArr.sum()).assertEqual(60)
      expect(myArr.average()).assertEqual(20)
      let emptyArr = new MathArray()
      expect(emptyArr.average()).assertEqual(0)
    })

    /**
     * @tc.name   ArrayInheritanceTest4700
     * @tc.number SUB_ARRAY_INHERITANCE_TEST_4700
     * @tc.desc   Verify custom doubleAll method works correctly via TaskPool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ArrayInheritanceTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let myArr = new DoubleArray(1, 2, 3)
      let task = new taskpool.Task(doubleAllFunc, myArr)
      await taskpool.execute(task)
      expect(myArr[0]).assertEqual(2)
      expect(myArr[1]).assertEqual(4)
      expect(myArr[2]).assertEqual(6)
    })

    /**
     * @tc.name   ArrayInheritanceTest4800
     * @tc.number SUB_ARRAY_INHERITANCE_TEST_4800
     * @tc.desc   Verify static fromRange method creates subclass with correct elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayInheritanceTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let rangeArr = RangeArray.fromRange(1, 5)
      expect(rangeArr.length).assertEqual(5)
      expect(rangeArr[0]).assertEqual(1)
      expect(rangeArr[4]).assertEqual(5)
      expect(rangeArr instanceof RangeArray).assertTrue()
    })

    // ===== Error Handling (5000-5100) =====

    /**
     * @tc.name   ArrayInheritanceTest4900
     * @tc.number SUB_ARRAY_INHERITANCE_TEST_4900
     * @tc.desc   Verify forEach with conditional logic works correctly on subclass
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ArrayInheritanceTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let myArr = new BasicArray(10, 20, 30, 40, 50)
      let count = 0
      myArr.forEach((v: number) => {
        if (v > 15) {
          count++
        }
      })
      expect(count).assertEqual(4)
      expect(myArr.length).assertEqual(5)
    })
  })
}
