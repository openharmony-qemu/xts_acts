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
class BasicMap extends collections.Map<string, number> {}

@Sendable
class MethodMap extends collections.Map<string, number> {
  customMethod(): number {
    return this.size * 2
  }
}

@Sendable
class TagMap extends collections.Map<string, number> {
  tag: string = 'TagMap'
  constructor(entries?: readonly (readonly [string, number])[] | null) {
    super(entries)
  }
  getTag(): string {
    return this.tag
  }
}

@Sendable
class SumMap extends collections.Map<string, number> {
  sumValues(): number {
    let total = 0
    this.forEach((v: number) => { total += v })
    return total
  }
  average(): number {
    if (this.size === 0) return 0
    return this.sumValues() / this.size
  }
}

@Sendable
class OverrideMap extends collections.Map<string, number> {
  set(key: string, value: number): collections.Map<string, number> {
    return super.set(key, value)
  }
}

@Sendable
class CustomPropMap extends collections.Map<string, number> {
  tag: string = 'CustomPropMap'
  version: number = 1
  metadata: collections.Array<string> = new collections.Array<string>()
}

@Sendable
class GrandMap extends collections.Map<string, number> {
  customMethod(): number {
    return this.size * 2
  }
}

@Sendable
class GreatGrandMap extends GrandMap {
  grandMethod(): number {
    return this.customMethod() + 1
  }
}

@Sendable
class DoubleMap extends collections.Map<string, number> {
  doubleAll(): void {
    let keys = new collections.Array<string>()
    this.forEach((_: number, key: string) => { keys.push(key) })
    keys.forEach((key: string) => {
      let val = this.get(key) as number
      this.set(key, val * 2)
    })
  }
}

// ===== @Concurrent Functions =====

@Concurrent
function checkMapSendableFunc(map: BasicMap): boolean {
  return map instanceof collections.Map
}

@Concurrent
function processMapFunc(map: BasicMap): number {
  map.set('added', 200)
  return map.size
}

@Concurrent
function sumMapFunc(map: SumMap): number {
  map.set('added', 100)
  return map.sumValues()
}

@Concurrent
function concurrentSetFunc(map: BasicMap, key: string, value: number): number {
  map.set(key, value)
  return map.size
}

@Concurrent
function doubleAllFunc(map: DoubleMap): void {
  map.doubleAll()
}

@Concurrent
function overrideSetFunc(map: OverrideMap, key: string, value: number): number {
  map.set(key, value)
  return map.get(key) as number
}

@Concurrent
function concurrentBatchSetFunc(map: BasicMap, count: number): number {
  for (let i = 0; i < count; i++) {
    map.set('key' + i.toString(), i * 10)
  }
  return map.size
}

export default function MapInheritanceTest(): void {
  describe('MapInheritanceTest', (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {})
    afterAll(async (): Promise<void> => {
      await sleep(100)
    })

    // ===== Section 2: Basic Verification (0100-0600) =====

    /**
     * @tc.name   MapInheritanceTest0100
     * @tc.number SUB_MAP_INHERITANCE_TEST_0100
     * @tc.desc   Verify collections.Map is @Sendable class with correct basic behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MapInheritanceTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let map = new collections.Map<string, number>()
      map.set('key', 100)
      expect(map.size).assertEqual(1)
      expect(map.get('key')).assertEqual(100)
    })

    /**
     * @tc.name   MapInheritanceTest0200
     * @tc.number SUB_MAP_INHERITANCE_TEST_0200
     * @tc.desc   Verify collections.Map cross-thread reference passing via TaskPool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MapInheritanceTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let map = new collections.Map<string, number>()
      map.set('original', 100)
      let task = new taskpool.Task(processMapFunc, map)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(2)
      expect(map.has('added')).assertTrue()
      expect(map.get('added')).assertEqual(200)
    })

    /**
     * @tc.name   MapInheritanceTest0300
     * @tc.number SUB_MAP_INHERITANCE_TEST_0300
     * @tc.desc   Verify collections.Map set/get/has/delete/clear methods behavior
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MapInheritanceTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let map = new collections.Map<string, number>()
      map.set('a', 1)
      map.set('b', 2)
      map.set('a', 100)
      expect(map.size).assertEqual(2)
      expect(map.get('a')).assertEqual(100)
      expect(map.has('b')).assertTrue()
      expect(map.has('missing')).assertFalse()
      let deleted = map.delete('a')
      expect(deleted).assertTrue()
      expect(map.size).assertEqual(1)
      let deletedAgain = map.delete('a')
      expect(deletedAgain).assertFalse()
      map.clear()
      expect(map.size).assertEqual(0)
    })

    /**
     * @tc.name   MapInheritanceTest0400
     * @tc.number SUB_MAP_INHERITANCE_TEST_0400
     * @tc.desc   Verify collections.Map forEach traverses all entries correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MapInheritanceTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let map = new collections.Map<string, number>()
      map.set('a', 10)
      map.set('b', 20)
      map.set('c', 30)
      let sum = 0
      map.forEach((value: number, key: string) => {
        sum += value
      })
      expect(sum).assertEqual(60)
    })

    /**
     * @tc.name   MapInheritanceTest0500
     * @tc.number SUB_MAP_INHERITANCE_TEST_0500
     * @tc.desc   Verify collections.Map entries/keys/values iterators work correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapInheritanceTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let map = new collections.Map<string, number>()
      map.set('a', 1)
      map.set('b', 2)
      let iter = map.entries()
      let entry1 = iter.next()
      expect(entry1.value !== undefined).assertTrue()
      expect(entry1.done).assertFalse()
      let keysIter = map.keys()
      let key1 = keysIter.next()
      expect(key1.value !== undefined).assertTrue()
      let valuesIter = map.values()
      let val1 = valuesIter.next()
      expect(val1.value !== undefined).assertTrue()
    })

    /**
     * @tc.name   MapInheritanceTest0600
     * @tc.number SUB_MAP_INHERITANCE_TEST_0600
     * @tc.desc   Verify collections.Map size property tracks state changes and is consistent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MapInheritanceTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let map = new collections.Map<string, number>()
      expect(map.size).assertEqual(0)
      map.set('a', 1)
      expect(map.size).assertEqual(1)
      map.set('b', 2)
      expect(map.size).assertEqual(2)
      map.delete('a')
      expect(map.size).assertEqual(1)
      map.clear()
      expect(map.size).assertEqual(0)
    })

    // ===== Section 3: Inheritance Chain (0700-0900) =====

    /**
     * @tc.name   MapInheritanceTest0700
     * @tc.number SUB_MAP_INHERITANCE_TEST_0700
     * @tc.desc   Verify subclass instanceof relationship with parent and self
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MapInheritanceTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let myMap = new MethodMap()
      myMap.set('a', 1)
      myMap.set('b', 2)
      expect(myMap instanceof MethodMap).assertTrue()
      expect(myMap instanceof collections.Map).assertTrue()
      expect(myMap.customMethod()).assertEqual(4)
    })

    /**
     * @tc.name   MapInheritanceTest0800
     * @tc.number SUB_MAP_INHERITANCE_TEST_0800
     * @tc.desc   Verify subclass prototype chain via instanceof and constructor checks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapInheritanceTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let myMap = new BasicMap()
      myMap.set('key', 1)
      expect(myMap instanceof BasicMap).assertTrue()
      expect(myMap instanceof collections.Map).assertTrue()
      expect(myMap.constructor).assertEqual(BasicMap)
    })

    /**
     * @tc.name   MapInheritanceTest0900
     * @tc.number SUB_MAP_INHERITANCE_TEST_0900
     * @tc.desc   Verify subclass constructor points to subclass not parent class
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapInheritanceTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let myMap = new BasicMap()
      expect(myMap.constructor).assertEqual(BasicMap)
      expect(myMap.constructor !== collections.Map).assertTrue()
    })

    // ===== Section 4: Constructor Inheritance (1000-1300) =====

    /**
     * @tc.name   MapInheritanceTest1000
     * @tc.number SUB_MAP_INHERITANCE_TEST_1000
     * @tc.desc   Verify subclass no-arg constructor creates empty Map
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MapInheritanceTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let myMap = new BasicMap()
      expect(myMap.size).assertEqual(0)
      expect(myMap instanceof BasicMap).assertTrue()
    })

    /**
     * @tc.name   MapInheritanceTest1100
     * @tc.number SUB_MAP_INHERITANCE_TEST_1100
     * @tc.desc   Verify subclass construction with key-value pair array parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MapInheritanceTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let entries: (readonly [string, number])[] = [['a', 1], ['b', 2], ['c', 3]]
      let myMap = new BasicMap(entries)
      expect(myMap.size).assertEqual(3)
      expect(myMap.get('a')).assertEqual(1)
      expect(myMap.get('b')).assertEqual(2)
      expect(myMap.get('c')).assertEqual(3)
    })

    /**
     * @tc.name   MapInheritanceTest1200
     * @tc.number SUB_MAP_INHERITANCE_TEST_1200
     * @tc.desc   Verify subclass construction with Iterable parameter from Array entries
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapInheritanceTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let source: [string, number][] = [['a', 1], ['b', 2], ['c', 3]]
      let myMap = new BasicMap(source)
      expect(myMap.size).assertEqual(3)
      expect(myMap.get('a')).assertEqual(1)
      expect(myMap.get('c')).assertEqual(3)
    })

    /**
     * @tc.name   MapInheritanceTest1300
     * @tc.number SUB_MAP_INHERITANCE_TEST_1300
     * @tc.desc   Verify subclass constructor with super call passes parameters correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MapInheritanceTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let entries: (readonly [string, number])[] = [['key', 100]]
      let myMap = new TagMap(entries)
      expect(myMap.get('key')).assertEqual(100)
      expect(myMap.getTag()).assertEqual('TagMap')
      expect(myMap.size).assertEqual(1)
    })

    // ===== Section 5: Sendable Semantics (1400-1600) =====

    /**
     * @tc.name   MapInheritanceTest1400
     * @tc.number SUB_MAP_INHERITANCE_TEST_1400
     * @tc.desc   Verify subclass inherits @Sendable and is passable across threads
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MapInheritanceTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let myMap = new BasicMap()
      myMap.set('test', 1)
      let task = new taskpool.Task(checkMapSendableFunc, myMap)
      let result = await taskpool.execute(task)
      expect(result as boolean).assertTrue()
    })

    /**
     * @tc.name   MapInheritanceTest1500
     * @tc.number SUB_MAP_INHERITANCE_TEST_1500
     * @tc.desc   Verify subclass instance reference passing in TaskPool with custom method
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MapInheritanceTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let entries: (readonly [string, number])[] = [['a', 10], ['b', 20]]
      let myMap = new SumMap(entries)
      let task = new taskpool.Task(sumMapFunc, myMap)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(130)
      expect(myMap.has('added')).assertTrue()
      expect(myMap.get('added')).assertEqual(100)
    })

    /**
     * @tc.name   MapInheritanceTest1600
     * @tc.number SUB_MAP_INHERITANCE_TEST_1600
     * @tc.desc   Verify multiple TaskPool tasks share same subclass instance via reference
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapInheritanceTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let sharedMap = new BasicMap()
      let task = new taskpool.Task(concurrentBatchSetFunc, sharedMap, 5)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(5)
      expect(sharedMap.size).assertEqual(5)
      expect(sharedMap.get('key0')).assertEqual(0)
      expect(sharedMap.get('key4')).assertEqual(40)
    })

    // ===== Section 6: Method Inheritance (1700-2200) =====

    /**
     * @tc.name   MapInheritanceTest1700
     * @tc.number SUB_MAP_INHERITANCE_TEST_1700
     * @tc.desc   Verify inherited set method behavior on subclass matches parent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MapInheritanceTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let myMap = new BasicMap()
      myMap.set('a', 1)
      expect(myMap.size).assertEqual(1)
      expect(myMap.get('a')).assertEqual(1)
      myMap.set('a', 100)
      expect(myMap.get('a')).assertEqual(100)
      expect(myMap.size).assertEqual(1)
    })

    /**
     * @tc.name   MapInheritanceTest1800
     * @tc.number SUB_MAP_INHERITANCE_TEST_1800
     * @tc.desc   Verify inherited get method returns value or undefined on subclass
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MapInheritanceTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let entries: (readonly [string, number])[] = [['key', 100]]
      let myMap = new BasicMap(entries)
      expect(myMap.get('key')).assertEqual(100)
      expect(myMap.get('nonexistent')).assertUndefined()
    })

    /**
     * @tc.name   MapInheritanceTest1900
     * @tc.number SUB_MAP_INHERITANCE_TEST_1900
     * @tc.desc   Verify inherited has method returns correct boolean on subclass
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MapInheritanceTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let entries: (readonly [string, number])[] = [['exists', 1]]
      let myMap = new BasicMap(entries)
      expect(myMap.has('exists')).assertTrue()
      expect(myMap.has('missing')).assertFalse()
    })

    /**
     * @tc.name   MapInheritanceTest2000
     * @tc.number SUB_MAP_INHERITANCE_TEST_2000
     * @tc.desc   Verify inherited delete method removes entry and returns boolean on subclass
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MapInheritanceTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let entries: (readonly [string, number])[] = [['a', 1], ['b', 2]]
      let myMap = new BasicMap(entries)
      let deleted = myMap.delete('a')
      expect(deleted).assertTrue()
      expect(myMap.size).assertEqual(1)
      expect(myMap.has('a')).assertFalse()
      let deletedAgain = myMap.delete('a')
      expect(deletedAgain).assertFalse()
    })

    /**
     * @tc.name   MapInheritanceTest2100
     * @tc.number SUB_MAP_INHERITANCE_TEST_2100
     * @tc.desc   Verify inherited forEach traverses all entries correctly on subclass
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MapInheritanceTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let entries: (readonly [string, number])[] = [['a', 10], ['b', 20]]
      let myMap = new BasicMap(entries)
      let sum = 0
      myMap.forEach((value: number, key: string) => {
        sum += value
      })
      expect(sum).assertEqual(30)
    })

    /**
     * @tc.name   MapInheritanceTest2200
     * @tc.number SUB_MAP_INHERITANCE_TEST_2200
     * @tc.desc   Verify inherited clear method empties subclass Map completely
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MapInheritanceTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let entries: (readonly [string, number])[] = [['a', 1], ['b', 2]]
      let myMap = new BasicMap(entries)
      myMap.clear()
      expect(myMap.size).assertEqual(0)
      expect(myMap.has('a')).assertFalse()
      expect(myMap.has('b')).assertFalse()
    })

    // ===== Section 6.2: Method Override (2300-2400) =====

    /**
     * @tc.name   MapInheritanceTest2300
     * @tc.number SUB_MAP_INHERITANCE_TEST_2300
     * @tc.desc   Verify overridden set method delegates to super and works correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapInheritanceTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let myMap = new OverrideMap()
      myMap.set('test', 100)
      expect(myMap.get('test')).assertEqual(100)
      expect(myMap.size).assertEqual(1)
      myMap.set('test', 200)
      expect(myMap.get('test')).assertEqual(200)
      expect(myMap.size).assertEqual(1)
    })

    /**
     * @tc.name   MapInheritanceTest2400
     * @tc.number SUB_MAP_INHERITANCE_TEST_2400
     * @tc.desc   Verify overridden set method works correctly in concurrent TaskPool context
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapInheritanceTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let myMap = new OverrideMap()
      let task = new taskpool.Task(overrideSetFunc, myMap, 'concurrent', 42)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(42)
      expect(myMap.get('concurrent')).assertEqual(42)
    })

    // ===== Section 7: Property Inheritance (2500-2700) =====

    /**
     * @tc.name   MapInheritanceTest2500
     * @tc.number SUB_MAP_INHERITANCE_TEST_2500
     * @tc.desc   Verify size property inherited correctly and reflects Map state changes
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MapInheritanceTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let entries: (readonly [string, number])[] = [['a', 1], ['b', 2]]
      let myMap = new BasicMap(entries)
      expect(myMap.size).assertEqual(2)
      myMap.set('c', 3)
      expect(myMap.size).assertEqual(3)
      myMap.delete('a')
      expect(myMap.size).assertEqual(2)
    })

    /**
     * @tc.name   MapInheritanceTest2600
     * @tc.number SUB_MAP_INHERITANCE_TEST_2600
     * @tc.desc   Verify inherited size property correctly tracks Map state on subclass
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MapInheritanceTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let myMap = new BasicMap()
      expect(myMap.size).assertEqual(0)
      myMap.set('a', 1)
      expect(myMap.size).assertEqual(1)
      myMap.set('b', 2)
      expect(myMap.size).assertEqual(2)
      myMap.delete('a')
      expect(myMap.size).assertEqual(1)
      myMap.clear()
      expect(myMap.size).assertEqual(0)
    })

    /**
     * @tc.name   MapInheritanceTest2700
     * @tc.number SUB_MAP_INHERITANCE_TEST_2700
     * @tc.desc   Verify custom Sendable properties accessible on subclass instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MapInheritanceTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let myMap = new CustomPropMap()
      expect(myMap.tag).assertEqual('CustomPropMap')
      expect(myMap.version).assertEqual(1)
      expect(myMap.metadata !== null).assertTrue()
      expect(myMap.size).assertEqual(0)
    })

    // ===== Section 8: Custom Extensions (2800-2900) =====

    /**
     * @tc.name   MapInheritanceTest2800
     * @tc.number SUB_MAP_INHERITANCE_TEST_2800
     * @tc.desc   Verify custom sumValues and average methods work correctly on subclass
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MapInheritanceTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let entries: (readonly [string, number])[] = [['a', 10], ['b', 20], ['c', 30]]
      let myMap = new SumMap(entries)
      expect(myMap.sumValues()).assertEqual(60)
      expect(myMap.average()).assertEqual(20)
      let emptyMap = new SumMap()
      expect(emptyMap.average()).assertEqual(0)
    })

    /**
     * @tc.name   MapInheritanceTest2900
     * @tc.number SUB_MAP_INHERITANCE_TEST_2900
     * @tc.desc   Verify custom doubleAll method works correctly via TaskPool
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapInheritanceTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let entries: (readonly [string, number])[] = [['a', 1], ['b', 2]]
      let myMap = new DoubleMap(entries)
      let task = new taskpool.Task(doubleAllFunc, myMap)
      await taskpool.execute(task)
      expect(myMap.get('a')).assertEqual(2)
      expect(myMap.get('b')).assertEqual(4)
    })

    // ===== Section 9: Multi-level Inheritance (3000) =====

    /**
     * @tc.name   MapInheritanceTest3000
     * @tc.number SUB_MAP_INHERITANCE_TEST_3000
     * @tc.desc   Verify two-level inheritance chain with instanceof and custom methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('MapInheritanceTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      let entries: (readonly [string, number])[] = [['a', 1], ['b', 2]]
      let grandMap = new GreatGrandMap(entries)
      expect(grandMap instanceof GreatGrandMap).assertTrue()
      expect(grandMap instanceof GrandMap).assertTrue()
      expect(grandMap instanceof collections.Map).assertTrue()
      expect(grandMap.grandMethod()).assertEqual(5)
      expect(grandMap.customMethod()).assertEqual(4)
      expect(grandMap.size).assertEqual(2)
    })

    // ===== Section 11: Concurrent Scenarios (3100) =====

    /**
     * @tc.name   MapInheritanceTest3100
     * @tc.number SUB_MAP_INHERITANCE_TEST_3100
     * @tc.desc   Verify multiple TaskPool tasks concurrently operate on subclass instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('MapInheritanceTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let sharedMap = new BasicMap()
      let task = new taskpool.Task(concurrentBatchSetFunc, sharedMap, 10)
      let result = await taskpool.execute(task)
      expect(result as number).assertEqual(10)
      expect(sharedMap.size).assertEqual(10)
    })

    // ===== Section 12: Error Handling (3200) =====

    /**
     * @tc.name   MapInheritanceTest3200
     * @tc.number SUB_MAP_INHERITANCE_TEST_3200
     * @tc.desc   Verify subclass constructor works normally and instance has correct type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('MapInheritanceTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (): void => {
      let entries: (readonly [string, number])[] = [['a', 1]]
      let myMap = new BasicMap(entries)
      expect(myMap instanceof collections.Map).assertTrue()
      expect(myMap instanceof BasicMap).assertTrue()
      expect(myMap.size).assertEqual(1)
      expect(myMap.get('a')).assertEqual(1)
    })
  })
}
