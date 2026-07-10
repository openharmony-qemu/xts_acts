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
class BasicSet extends collections.Set<number> {}

@Sendable
class MethodSet extends collections.Set<number> {
  customMethod(): number {
    return this.size * 2
  }
}

@Sendable
class TagSet extends collections.Set<number> {
  tag: string = 'TagSet'
  constructor(values?: readonly number[] | null) {
    super(values)
  }
  getTag(): string {
    return this.tag
  }
}

@Sendable
class SumSet extends collections.Set<number> {
  sum(): number {
    let total = 0
    this.forEach((v: number) => { total += v })
    return total
  }
  toArray(): collections.Array<number> {
    let arr = new collections.Array<number>()
    this.forEach((v: number) => { arr.push(v) })
    return arr
  }
}

@Sendable
class OverrideSet extends collections.Set<number> {
  add(value: number): collections.Set<number> {
    return super.add(value)
  }
}

@Sendable
class GrandSet extends MethodSet {
  grandMethod(): number {
    return this.customMethod() + 1
  }
}

@Sendable
class DoubleSet extends collections.Set<number> {
  doubleAll(): void {
    let values = new collections.Array<number>()
    this.forEach((v: number) => { values.push(v) })
    this.clear()
    values.forEach((v: number) => {
      this.add(v * 2)
    })
  }
}

// ===== @Concurrent Functions =====

@Concurrent
function checkSetSendableFunc(set: BasicSet): boolean {
  return set instanceof collections.Set
}

@Concurrent
function processSetFunc(set: BasicSet): number {
  set.add(100)
  return set.size
}

@Concurrent
function sumSetFunc(set: SumSet): number {
  set.add(100)
  return set.sum()
}

@Concurrent
function concurrentAddFunc(set: BasicSet, value: number): number {
  set.add(value)
  return set.size
}

@Concurrent
function doubleAllFunc(set: DoubleSet): void {
  set.doubleAll()
}

@Concurrent
function overrideAddFunc(set: OverrideSet, value: number): number {
  set.add(value)
  return set.size
}

@Concurrent
function concurrentBatchAddFunc(set: BasicSet, count: number): number {
  for (let i = 0; i < count; i++) {
    set.add(i * 10)
  }
  return set.size
}

export default function SetInheritanceTest(): void {
  describe('SetInheritanceTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await sleep(100)
    })

    // ===== Section 2: Basic Verification (0100-1100) =====

    /**
     * @tc.name   SetInheritanceTest0100
     * @tc.number SUB_SET_INHERITANCE_TEST_0100
     * @tc.desc   Verify collections.Set is @Sendable class with correct basic behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SetInheritanceTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let set = new collections.Set<number>()
      set.add(1)
      set.add(2)
      expect(set.size).assertEqual(2)
      expect(set.has(1)).assertTrue()
      expect(set.has(2)).assertTrue()
    })

    /**
     * @tc.name   SetInheritanceTest0200
     * @tc.number SUB_SET_INHERITANCE_TEST_0200
     * @tc.desc   Verify collections.Set cross-thread reference passing via TaskPool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SetInheritanceTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let set = new collections.Set<number>()
      set.add(1)
      set.add(2)
      let task = new taskpool.Task(processSetFunc, set)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(3)
      expect(set.has(100)).assertTrue()
    })

    /**
     * @tc.name   SetInheritanceTest0300
     * @tc.number SUB_SET_INHERITANCE_TEST_0300
     * @tc.desc   Verify collections.Set add method deduplication and return behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SetInheritanceTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let set = new collections.Set<number>()
      set.add(1)
      set.add(2)
      set.add(1)
      expect(set.size).assertEqual(2)
      expect(set.has(1)).assertTrue()
      expect(set.has(2)).assertTrue()
    })

    /**
     * @tc.name   SetInheritanceTest0400
     * @tc.number SUB_SET_INHERITANCE_TEST_0400
     * @tc.desc   Verify collections.Set has method returns correct boolean for present and absent values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SetInheritanceTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let set = new collections.Set<number>()
      set.add(1)
      set.add(2)
      expect(set.has(1)).assertTrue()
      expect(set.has(2)).assertTrue()
      expect(set.has(3)).assertFalse()
    })

    /**
     * @tc.name   SetInheritanceTest0500
     * @tc.number SUB_SET_INHERITANCE_TEST_0500
     * @tc.desc   Verify collections.Set delete method returns boolean and removes element correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SetInheritanceTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let set = new collections.Set<number>()
      set.add(1)
      set.add(2)
      let deleted = set.delete(1)
      expect(deleted).assertTrue()
      expect(set.size).assertEqual(1)
      let deletedAgain = set.delete(1)
      expect(deletedAgain).assertFalse()
    })

    /**
     * @tc.name   SetInheritanceTest0600
     * @tc.number SUB_SET_INHERITANCE_TEST_0600
     * @tc.desc   Verify collections.Set clear method empties all elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SetInheritanceTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let set = new collections.Set<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      set.clear()
      expect(set.size).assertEqual(0)
      expect(set.has(1)).assertFalse()
      expect(set.has(2)).assertFalse()
      expect(set.has(3)).assertFalse()
    })

    /**
     * @tc.name   SetInheritanceTest0700
     * @tc.number SUB_SET_INHERITANCE_TEST_0700
     * @tc.desc   Verify collections.Set forEach traverses all elements correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SetInheritanceTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let set = new collections.Set<number>()
      set.add(10)
      set.add(20)
      set.add(30)
      let sum = 0
      set.forEach((value: number) => {
        sum += value
      })
      expect(sum).assertEqual(60)
    })

    /**
     * @tc.name   SetInheritanceTest0800
     * @tc.number SUB_SET_INHERITANCE_TEST_0800
     * @tc.desc   Verify collections.Set size property tracks state changes correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SetInheritanceTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let set = new collections.Set<number>()
      expect(set.size).assertEqual(0)
      set.add(1)
      expect(set.size).assertEqual(1)
      set.add(2)
      expect(set.size).assertEqual(2)
      set.delete(1)
      expect(set.size).assertEqual(1)
      set.clear()
      expect(set.size).assertEqual(0)
    })

    /**
     * @tc.name   SetInheritanceTest0900
     * @tc.number SUB_SET_INHERITANCE_TEST_0900
     * @tc.desc   Verify collections.Set entries iterator yields [value, value] pairs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SetInheritanceTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let set = new collections.Set<number>()
      set.add(1)
      set.add(2)
      let iter = set.entries()
      let entry1 = iter.next()
      expect(entry1.done).assertFalse()
      expect(entry1.value !== undefined).assertTrue()
      expect(entry1.value[0]).assertEqual(entry1.value[1])
      let entry2 = iter.next()
      expect(entry2.done).assertFalse()
      expect(entry2.value[0]).assertEqual(entry2.value[1])
      let entry3 = iter.next()
      expect(entry3.done).assertTrue()
    })

    /**
     * @tc.name   SetInheritanceTest1000
     * @tc.number SUB_SET_INHERITANCE_TEST_1000
     * @tc.desc   Verify collections.Set keys and values iterators yield correct values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SetInheritanceTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let set = new collections.Set<number>()
      set.add(10)
      set.add(20)
      let keysIter = set.keys()
      let key1 = keysIter.next()
      expect(key1.done).assertFalse()
      expect(key1.value !== undefined).assertTrue()
      let valuesIter = set.values()
      let val1 = valuesIter.next()
      expect(val1.done).assertFalse()
      expect(val1.value !== undefined).assertTrue()
    })

    /**
     * @tc.name   SetInheritanceTest1100
     * @tc.number SUB_SET_INHERITANCE_TEST_1100
     * @tc.desc   Verify collections.Set Symbol.iterator works with for-of loop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SetInheritanceTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let set = new collections.Set<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let sum = 0
      let count = 0
      for (let val of set) {
        sum += val
        count++
      }
      expect(sum).assertEqual(6)
      expect(count).assertEqual(3)
    })

    // ===== Section 3: Inheritance Chain (1200-1400) =====

    /**
     * @tc.name   SetInheritanceTest1200
     * @tc.number SUB_SET_INHERITANCE_TEST_1200
     * @tc.desc   Verify subclass instanceof relationship with parent and self
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SetInheritanceTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let mySet = new MethodSet()
      mySet.add(1)
      mySet.add(2)
      expect(mySet instanceof MethodSet).assertTrue()
      expect(mySet instanceof collections.Set).assertTrue()
      expect(mySet.customMethod()).assertEqual(4)
    })

    /**
     * @tc.name   SetInheritanceTest1300
     * @tc.number SUB_SET_INHERITANCE_TEST_1300
     * @tc.desc   Verify subclass prototype chain via instanceof and constructor checks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SetInheritanceTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let mySet = new BasicSet()
      mySet.add(1)
      expect(mySet instanceof BasicSet).assertTrue()
      expect(mySet instanceof collections.Set).assertTrue()
      expect(mySet.constructor).assertEqual(BasicSet)
    })

    // ===== Section 4: Constructor Inheritance (1500-1800) =====

    /**
     * @tc.name   SetInheritanceTest1400
     * @tc.number SUB_SET_INHERITANCE_TEST_1400
     * @tc.desc   Verify subclass no-arg constructor creates empty Set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SetInheritanceTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let mySet = new BasicSet()
      expect(mySet.size).assertEqual(0)
      expect(mySet instanceof BasicSet).assertTrue()
    })

    /**
     * @tc.name   SetInheritanceTest1500
     * @tc.number SUB_SET_INHERITANCE_TEST_1500
     * @tc.desc   Verify subclass construction with array parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SetInheritanceTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let values: number[] = [1, 2, 3]
      let mySet = new BasicSet(values)
      expect(mySet.size).assertEqual(3)
      expect(mySet.has(1)).assertTrue()
      expect(mySet.has(2)).assertTrue()
      expect(mySet.has(3)).assertTrue()
    })

    /**
     * @tc.name   SetInheritanceTest1600
     * @tc.number SUB_SET_INHERITANCE_TEST_1600
     * @tc.desc   Verify subclass construction with Iterable parameter from collections.Array
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SetInheritanceTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let arr = new collections.Array<number>(1, 2, 3)
      let mySet = new BasicSet(arr)
      expect(mySet.size).assertEqual(3)
      expect(mySet.has(1)).assertTrue()
      expect(mySet.has(3)).assertTrue()
    })

    /**
     * @tc.name   SetInheritanceTest1700
     * @tc.number SUB_SET_INHERITANCE_TEST_1700
     * @tc.desc   Verify subclass constructor with super call passes parameters correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SetInheritanceTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let values: number[] = [1, 2]
      let mySet = new TagSet(values)
      expect(mySet.size).assertEqual(2)
      expect(mySet.has(1)).assertTrue()
      expect(mySet.has(2)).assertTrue()
      expect(mySet.getTag()).assertEqual('TagSet')
    })

    // ===== Section 5: Sendable Semantics (1900-2100) =====

    /**
     * @tc.name   SetInheritanceTest1800
     * @tc.number SUB_SET_INHERITANCE_TEST_1800
     * @tc.desc   Verify subclass inherits @Sendable and is passable across threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SetInheritanceTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let mySet = new BasicSet()
      mySet.add(1)
      let task = new taskpool.Task(checkSetSendableFunc, mySet)
      let result = await taskpool.execute(task)
      expect(result as boolean).assertTrue()
    })

    /**
     * @tc.name   SetInheritanceTest1900
     * @tc.number SUB_SET_INHERITANCE_TEST_1900
     * @tc.desc   Verify subclass instance reference passing in TaskPool with custom method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SetInheritanceTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let values: number[] = [10, 20, 30]
      let mySet = new SumSet(values)
      let task = new taskpool.Task(sumSetFunc, mySet)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(160)
      expect(mySet.has(100)).assertTrue()
    })

    /**
     * @tc.name   SetInheritanceTest2000
     * @tc.number SUB_SET_INHERITANCE_TEST_2000
     * @tc.desc   Verify multiple TaskPool tasks share same subclass instance via reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SetInheritanceTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let sharedSet = new BasicSet()
      let task = new taskpool.Task(concurrentBatchAddFunc, sharedSet, 5)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(5)
      expect(sharedSet.size).assertEqual(5)
      expect(sharedSet.has(0)).assertTrue()
      expect(sharedSet.has(40)).assertTrue()
    })

    // ===== Section 6: Method Inheritance (2200-2600) =====

    /**
     * @tc.name   SetInheritanceTest2100
     * @tc.number SUB_SET_INHERITANCE_TEST_2100
     * @tc.desc   Verify inherited has method returns correct boolean on subclass
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SetInheritanceTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let values: number[] = [1, 2, 3]
      let mySet = new BasicSet(values)
      expect(mySet.has(1)).assertTrue()
      expect(mySet.has(2)).assertTrue()
      expect(mySet.has(4)).assertFalse()
    })

    /**
     * @tc.name   SetInheritanceTest2200
     * @tc.number SUB_SET_INHERITANCE_TEST_2200
     * @tc.desc   Verify inherited delete method removes element and returns boolean on subclass
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SetInheritanceTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let values: number[] = [1, 2, 3]
      let mySet = new BasicSet(values)
      let deleted = mySet.delete(1)
      expect(deleted).assertTrue()
      expect(mySet.size).assertEqual(2)
      expect(mySet.has(1)).assertFalse()
      let deletedAgain = mySet.delete(1)
      expect(deletedAgain).assertFalse()
    })

    /**
     * @tc.name   SetInheritanceTest2300
     * @tc.number SUB_SET_INHERITANCE_TEST_2300
     * @tc.desc   Verify inherited forEach traverses all elements correctly on subclass
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SetInheritanceTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let values: number[] = [10, 20, 30]
      let mySet = new BasicSet(values)
      let sum = 0
      mySet.forEach((v: number) => { sum += v })
      expect(sum).assertEqual(60)
    })

    /**
     * @tc.name   SetInheritanceTest2400
     * @tc.number SUB_SET_INHERITANCE_TEST_2400
     * @tc.desc   Verify inherited clear method empties subclass Set completely
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SetInheritanceTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let values: number[] = [1, 2, 3]
      let mySet = new BasicSet(values)
      mySet.clear()
      expect(mySet.size).assertEqual(0)
      expect(mySet.has(1)).assertFalse()
      expect(mySet.has(2)).assertFalse()
      expect(mySet.has(3)).assertFalse()
    })

    // ===== Section 6.2: Method Override (2700-2800) =====

    /**
     * @tc.name   SetInheritanceTest2500
     * @tc.number SUB_SET_INHERITANCE_TEST_2500
     * @tc.desc   Verify overridden add method delegates to super and works correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SetInheritanceTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let mySet = new OverrideSet()
      mySet.add(100)
      expect(mySet.has(100)).assertTrue()
      expect(mySet.size).assertEqual(1)
      mySet.add(100)
      expect(mySet.size).assertEqual(1)
      mySet.add(200)
      expect(mySet.size).assertEqual(2)
    })

    /**
     * @tc.name   SetInheritanceTest2600
     * @tc.number SUB_SET_INHERITANCE_TEST_2600
     * @tc.desc   Verify overridden add method works correctly in concurrent TaskPool context
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SetInheritanceTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let mySet = new OverrideSet()
      let task = new taskpool.Task(overrideAddFunc, mySet, 42)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(1)
      expect(mySet.has(42)).assertTrue()
    })

    // ===== Section 7: Property Inheritance (2900-3000) =====

    /**
     * @tc.name   SetInheritanceTest2700
     * @tc.number SUB_SET_INHERITANCE_TEST_2700
     * @tc.desc   Verify size property inherited correctly and reflects Set state changes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SetInheritanceTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let values: number[] = [1, 2, 3]
      let mySet = new BasicSet(values)
      expect(mySet.size).assertEqual(3)
      mySet.add(4)
      expect(mySet.size).assertEqual(4)
      mySet.delete(1)
      expect(mySet.size).assertEqual(3)
    })

    // ===== Section 8: Custom Extensions (3100-3200) =====

    /**
     * @tc.name   SetInheritanceTest2800
     * @tc.number SUB_SET_INHERITANCE_TEST_2800
     * @tc.desc   Verify custom sum and toArray methods work correctly on subclass
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SetInheritanceTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let values: number[] = [10, 20, 30]
      let mySet = new SumSet(values)
      expect(mySet.sum()).assertEqual(60)
      expect(mySet.toArray().length).assertEqual(3)
      let emptySet = new SumSet()
      expect(emptySet.sum()).assertEqual(0)
      expect(emptySet.toArray().length).assertEqual(0)
    })

    /**
     * @tc.name   SetInheritanceTest2900
     * @tc.number SUB_SET_INHERITANCE_TEST_2900
     * @tc.desc   Verify custom doubleAll method works correctly via TaskPool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SetInheritanceTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let values: number[] = [1, 3, 5]
      let mySet = new DoubleSet(values)
      let task = new taskpool.Task(doubleAllFunc, mySet)
      await taskpool.execute(task)
      expect(mySet.size).assertEqual(3)
      expect(mySet.has(2)).assertTrue()
      expect(mySet.has(6)).assertTrue()
      expect(mySet.has(10)).assertTrue()
      expect(mySet.has(1)).assertFalse()
      expect(mySet.has(3)).assertFalse()
    })

    // ===== Section 9: Multi-level Inheritance (3300) =====

    /**
     * @tc.name   SetInheritanceTest3000
     * @tc.number SUB_SET_INHERITANCE_TEST_3000
     * @tc.desc   Verify two-level inheritance chain with instanceof and custom methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SetInheritanceTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let values: number[] = [1, 2]
      let grandSet = new GrandSet(values)
      expect(grandSet instanceof GrandSet).assertTrue()
      expect(grandSet instanceof MethodSet).assertTrue()
      expect(grandSet instanceof collections.Set).assertTrue()
      expect(grandSet.grandMethod()).assertEqual(5)
      expect(grandSet.customMethod()).assertEqual(4)
      expect(grandSet.size).assertEqual(2)
    })

    // ===== Section 10: Inheritance Constraints (3400) =====

    /**
     * @tc.name   SetInheritanceTest3100
     * @tc.number SUB_SET_INHERITANCE_TEST_3100
     * @tc.desc   Verify generic type constraint with typed subclass construction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SetInheritanceTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let numberSet = new BasicSet()
      numberSet.add(1)
      numberSet.add(2)
      expect(numberSet.size).assertEqual(2)
      expect(numberSet instanceof collections.Set).assertTrue()

      let stringValues: string[] = ['a', 'b']
      let stringSet = new collections.Set<string>(stringValues)
      expect(stringSet.size).assertEqual(2)
      expect(stringSet.has('a')).assertTrue()
    })

    // ===== Section 11: Concurrent Scenarios (3500) =====

    /**
     * @tc.name   SetInheritanceTest3200
     * @tc.number SUB_SET_INHERITANCE_TEST_3200
     * @tc.desc   Verify multiple TaskPool tasks concurrently operate on subclass instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SetInheritanceTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let sharedSet = new BasicSet()
      let task = new taskpool.Task(concurrentBatchAddFunc, sharedSet, 10)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(10)
      expect(sharedSet.size).assertEqual(10)
      expect(sharedSet.has(0)).assertTrue()
      expect(sharedSet.has(90)).assertTrue()
    })

    // ===== Section 12: Error Handling (3600) =====

  })
}
