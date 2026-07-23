'use static';
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


import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../hypium/index'
import Utils from './Util.test'


async function keysTaskNum(s: containers.ConcurrentSet<number>): Promise<number> {
  let iter: IterableIterator<number> = s.keys()
  let count: number = 0
  let item: IteratorResult<number> = iter.next()
  while (!item.done) {
    count++
    item = iter.next()
  }
  return count
}


async function keysTaskStr(s: containers.ConcurrentSet<string>): Promise<number> {
  let iter: IterableIterator<string> = s.keys()
  let count: number = 0
  let item: IteratorResult<string> = iter.next()
  while (!item.done) {
    count++
    item = iter.next()
  }
  return count
}


async function outerTaskKeysCount(): Promise<number> {
  let innerSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
  innerSet.add(1)
  innerSet.add(2)
  innerSet.add(3)
  let iter: IterableIterator<number> = innerSet.keys()
  let count: number = 0
  let item: IteratorResult<number> = iter.next()
  while (!item.done) {
    count++
    item = iter.next()
  }
  return count
}


async function outerTaskKeysEmpty(): Promise<number> {
  let innerSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
  let iter: IterableIterator<number> = innerSet.keys()
  let count: number = 0
  let item: IteratorResult<number> = iter.next()
  while (!item.done) {
    count++
    item = iter.next()
  }
  return count
}


async function keysTaskInCallback(s: containers.ConcurrentSet<number>): Promise<number> {
  let iter: IterableIterator<number> = s.keys()
  let count: number = 0
  let item: IteratorResult<number> = iter.next()
  while (!item.done) {
    count++
    item = iter.next()
  }
  return count
}



export default function ConcurrentSetKeysTest(): void {
  describe('ConcurrentSetKeysTest', (): void => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll((): void => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async (): Promise<void> => {

      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach((): void => {
    })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100)
    })

    /**
     * @tc.name ConcurrentSetKeysTest0100
     * @tc.number SUB_CONCURRENTSET_KEYS_TEST_0100
     * @tc.desc   Test keys() iterator on number set with 3 elements and verify value range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetKeysTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let iter: IterableIterator<number> = set.keys()
      let count: number = 0
      let item: IteratorResult<number> = iter.next()
      while (!item.done) {
        expect(item.value).assertLargerOrEqual(1)
        expect(item.value).assertLessOrEqual(3)
        count++
        item = iter.next()
      }
      expect(count).assertEqual(3)
      Done()
    })

    /**
     * @tc.name ConcurrentSetKeysTest0200
     * @tc.number SUB_CONCURRENTSET_KEYS_TEST_0200
     * @tc.desc   Test keys() iterator on empty set returns done immediately
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetKeysTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let iter: IterableIterator<number> = set.keys()
      let item: IteratorResult<number> = iter.next()
      expect(item.done).assertTrue()
      Done()
    })

    /**
     * @tc.name ConcurrentSetKeysTest0300
     * @tc.number SUB_CONCURRENTSET_KEYS_TEST_0300
     * @tc.desc   Test keys() iterator count equals set size on number set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetKeysTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let iter: IterableIterator<number> = set.keys()
      let count: number = 0
      let item: IteratorResult<number> = iter.next()
      while (!item.done) {
        count++
        item = iter.next()
      }
      expect(count).assertEqual(3)
      Done()
    })

    /**
     * @tc.name ConcurrentSetKeysTest0400
     * @tc.number SUB_CONCURRENTSET_KEYS_TEST_0400
     * @tc.desc   Test keys() iterator on string type set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetKeysTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      set.add('a')
      set.add('b')
      set.add('c')
      let iter: IterableIterator<string> = set.keys()
      let count: number = 0
      let item: IteratorResult<string> = iter.next()
      while (!item.done) {
        count++
        item = iter.next()
      }
      expect(count).assertEqual(3)
      Done()
    })

    /**
     * @tc.name ConcurrentSetKeysTest0500
     * @tc.number SUB_CONCURRENTSET_KEYS_TEST_0500
     * @tc.desc   Test keys() iterator on empty set returns done=true immediately
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetKeysTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let iter: IterableIterator<number> = set.keys()
      let item: IteratorResult<number> = iter.next()
      expect(item.done).assertTrue()
      Done()
    })

    /**
     * @tc.name ConcurrentSetKeysTest0600
     * @tc.number SUB_CONCURRENTSET_KEYS_TEST_0600
     * @tc.desc   Test keys() iterator on set with 100 elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetKeysTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 100; i++) {
        set.add(i)
      }
      let iter: IterableIterator<number> = set.keys()
      let count: number = 0
      let item: IteratorResult<number> = iter.next()
      while (!item.done) {
        count++
        item = iter.next()
      }
      expect(count).assertEqual(100)
      Done()
    })

    /**
     * @tc.name ConcurrentSetKeysTest0700
     * @tc.number SUB_CONCURRENTSET_KEYS_TEST_0700
     * @tc.desc   Test keys() iterator first next() returns valid element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetKeysTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let iter: IterableIterator<number> = set.keys()
      let first: IteratorResult<number> = iter.next()
      expect(first.done).assertFalse()
      expect(first.value).assertLargerOrEqual(1)
      expect(first.value).assertLessOrEqual(3)
      Done()
    })

    /**
     * @tc.name ConcurrentSetKeysTest0800
     * @tc.number SUB_CONCURRENTSET_KEYS_TEST_0800
     * @tc.desc   Test keys() iterator traversal count equals 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetKeysTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let iter: IterableIterator<number> = set.keys()
      let count: number = 0
      let item: IteratorResult<number> = iter.next()
      while (!item.done) {
        count++
        item = iter.next()
      }
      expect(count).assertEqual(3)
      Done()
    })

    /**
     * @tc.name ConcurrentSetKeysTest0900
     * @tc.number SUB_CONCURRENTSET_KEYS_TEST_0900
     * @tc.desc   Test keys() iterator on 3-element number set verifying count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetKeysTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let iter: IterableIterator<number> = set.keys()
      let count: number = 0
      let item: IteratorResult<number> = iter.next()
      while (!item.done) {
        count++
        item = iter.next()
      }
      expect(count).assertEqual(3)
      Done()
    })

    /**
     * @tc.name ConcurrentSetKeysTest1000
     * @tc.number SUB_CONCURRENTSET_KEYS_TEST_1000
     * @tc.desc   Test keys() iterator on string type set verifying count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetKeysTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      set.add('a')
      set.add('b')
      set.add('c')
      let iter: IterableIterator<string> = set.keys()
      let count: number = 0
      let item: IteratorResult<string> = iter.next()
      while (!item.done) {
        count++
        item = iter.next()
      }
      expect(count).assertEqual(3)
      Done()
    })

    /**
     * @tc.name ConcurrentSetKeysTest1100
     * @tc.number SUB_CONCURRENTSET_KEYS_TEST_1100
     * @tc.desc   Test keys() iterator on empty set returns done=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetKeysTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let iter: IterableIterator<number> = set.keys()
      let item: IteratorResult<number> = iter.next()
      expect(item.done).assertTrue()
      Done()
    })

    /**
     * @tc.name ConcurrentSetKeysTest1200
     * @tc.number SUB_CONCURRENTSET_KEYS_TEST_1200
     * @tc.desc   Test keys() iterator on set with 100 elements verifying count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetKeysTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 100; i++) {
        set.add(i)
      }
      let iter: IterableIterator<number> = set.keys()
      let count: number = 0
      let item: IteratorResult<number> = iter.next()
      while (!item.done) {
        count++
        item = iter.next()
      }
      expect(count).assertEqual(100)
      Done()
    })

    /**
     * @tc.name ConcurrentSetKeysTest1300
     * @tc.number SUB_CONCURRENTSET_KEYS_TEST_1300
     * @tc.desc   Test two independent keys() iterators traverse the same set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetKeysTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let iter1: IterableIterator<number> = set.keys()
      let iter2: IterableIterator<number> = set.keys()
      let count1: number = 0
      let count2: number = 0
      let item1: IteratorResult<number> = iter1.next()
      while (!item1.done) {
        count1++
        item1 = iter1.next()
      }
      let item2: IteratorResult<number> = iter2.next()
      while (!item2.done) {
        count2++
        item2 = iter2.next()
      }
      expect(count1).assertEqual(3)
      expect(count2).assertEqual(3)
      Done()
    })

    /**
     * @tc.name ConcurrentSetKeysTest1400
     * @tc.number SUB_CONCURRENTSET_KEYS_TEST_1400
     * @tc.desc   Test keys() iterator next() returns done=true after traversal ends
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetKeysTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let iter: IterableIterator<number> = set.keys()
      let item: IteratorResult<number> = iter.next()
      while (!item.done) {
        item = iter.next()
      }
      let afterEnd: IteratorResult<number> = iter.next()
      expect(afterEnd.done).assertTrue()
      Done()
    })

    /**
     * @tc.name ConcurrentSetKeysTest1500
     * @tc.number SUB_CONCURRENTSET_KEYS_TEST_1500
     * @tc.desc   Test keys() iterator values are all present in the set via has()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetKeysTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let values: number[] = []
      for (let val of set.keys()) {
        values.push(val)
      }
      expect(values.length).assertEqual(3)
      for (let i = 0; i < values.length; i++) {
        expect(set.has(values[i])).assertTrue()
      }
      Done()
    })

    /**
     * @tc.name ConcurrentSetKeysTest1600
     * @tc.number SUB_CONCURRENTSET_KEYS_TEST_1600
     * @tc.desc   Test keys() iterator count equals set.size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetKeysTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let iter: IterableIterator<number> = set.keys()
      let count: number = 0
      let item: IteratorResult<number> = iter.next()
      while (!item.done) {
        count++
        item = iter.next()
      }
      expect(count).assertEqual(set.size)
      Done()
    })

    /**
     * @tc.name ConcurrentSetKeysTest1700
     * @tc.number SUB_CONCURRENTSET_KEYS_TEST_1700
     * @tc.desc   Test keys() iterator on string type set verifying traversal count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetKeysTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      set.add('a')
      set.add('b')
      set.add('c')
      let iter: IterableIterator<string> = set.keys()
      let count: number = 0
      let item: IteratorResult<string> = iter.next()
      while (!item.done) {
        count++
        item = iter.next()
      }
      expect(count).assertEqual(3)
      Done()
    })

    /**
     * @tc.name ConcurrentSetKeysTest1800
     * @tc.number SUB_CONCURRENTSET_KEYS_TEST_1800
     * @tc.desc   Test keys() iterator on empty set verifying done=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetKeysTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let iter: IterableIterator<number> = set.keys()
      let item: IteratorResult<number> = iter.next()
      expect(item.done).assertTrue()
      Done()
    })

    /**
     * @tc.name ConcurrentSetKeysTest1900
     * @tc.number SUB_CONCURRENTSET_KEYS_TEST_1900
     * @tc.desc   Test keys() iterator on set with 100 elements verifying count equals 100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetKeysTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 100; i++) {
        set.add(i)
      }
      let iter: IterableIterator<number> = set.keys()
      let count: number = 0
      let item: IteratorResult<number> = iter.next()
      while (!item.done) {
        count++
        item = iter.next()
      }
      expect(count).assertEqual(100)
      Done()
    })

    /**
     * @tc.name ConcurrentSetKeysTest2000
     * @tc.number SUB_CONCURRENTSET_KEYS_TEST_2000
     * @tc.desc   Test keys() iterator first next() returns not-done result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetKeysTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let iter: IterableIterator<number> = set.keys()
      let first: IteratorResult<number> = iter.next()
      expect(first.done).assertFalse()
      Done()
    })

    /**
     * @tc.name ConcurrentSetKeysTest2100
     * @tc.number SUB_CONCURRENTSET_KEYS_TEST_2100
     * @tc.desc   Test keys() iterator on 3-element number set verifying traversal count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetKeysTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let iter: IterableIterator<number> = set.keys()
      let count: number = 0
      let item: IteratorResult<number> = iter.next()
      while (!item.done) {
        count++
        item = iter.next()
      }
      expect(count).assertEqual(3)
      Done()
    })

    /**
     * @tc.name ConcurrentSetKeysTest2200
     * @tc.number SUB_CONCURRENTSET_KEYS_TEST_2200
     * @tc.desc   Test keys() iterator on 3-element number set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetKeysTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let iter: IterableIterator<number> = set.keys()
      let count: number = 0
      let item: IteratorResult<number> = iter.next()
      while (!item.done) {
        count++
        item = iter.next()
      }
      expect(count).assertEqual(3)
      Done()
    })

    /**
     * @tc.name ConcurrentSetKeysTest2300
     * @tc.number SUB_CONCURRENTSET_KEYS_TEST_2300
     * @tc.desc   Test keys() iterator on string type set verifying count equals 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetKeysTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      set.add('a')
      set.add('b')
      set.add('c')
      let iter: IterableIterator<string> = set.keys()
      let count: number = 0
      let item: IteratorResult<string> = iter.next()
      while (!item.done) {
        count++
        item = iter.next()
      }
      expect(count).assertEqual(3)
      Done()
    })

    /**
     * @tc.name ConcurrentSetKeysTest2400
     * @tc.number SUB_CONCURRENTSET_KEYS_TEST_2400
     * @tc.desc   Test keys() iterator on empty set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetKeysTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let iter: IterableIterator<number> = set.keys()
      let item: IteratorResult<number> = iter.next()
      expect(item.done).assertTrue()
      Done()
    })

    /**
     * @tc.name ConcurrentSetKeysTest2500
     * @tc.number SUB_CONCURRENTSET_KEYS_TEST_2500
     * @tc.desc   Test keys() iterator on set with 100 elements verifying count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetKeysTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 100; i++) {
        set.add(i)
      }
      let iter: IterableIterator<number> = set.keys()
      let count: number = 0
      let item: IteratorResult<number> = iter.next()
      while (!item.done) {
        count++
        item = iter.next()
      }
      expect(count).assertEqual(100)
      Done()
    })

    /**
     * @tc.name ConcurrentSetKeysTest2600
     * @tc.number SUB_CONCURRENTSET_KEYS_TEST_2600
     * @tc.desc   Test two independent keys() iterators on the same set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetKeysTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let iter1: IterableIterator<number> = set.keys()
      let iter2: IterableIterator<number> = set.keys()
      let count1: number = 0
      let count2: number = 0
      let item1: IteratorResult<number> = iter1.next()
      while (!item1.done) {
        count1++
        item1 = iter1.next()
      }
      let item2: IteratorResult<number> = iter2.next()
      while (!item2.done) {
        count2++
        item2 = iter2.next()
      }
      expect(count1).assertEqual(3)
      expect(count2).assertEqual(3)
      Done()
    })

    /**
     * @tc.name ConcurrentSetKeysTest2700
     * @tc.number SUB_CONCURRENTSET_KEYS_TEST_2700
     * @tc.desc   Test keys() iterator returns done=true after full traversal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetKeysTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let iter: IterableIterator<number> = set.keys()
      let item: IteratorResult<number> = iter.next()
      while (!item.done) {
        item = iter.next()
      }
      let afterEnd: IteratorResult<number> = iter.next()
      expect(afterEnd.done).assertTrue()
      Done()
    })

    /**
     * @tc.name ConcurrentSetKeysTest2800
     * @tc.number SUB_CONCURRENTSET_KEYS_TEST_2800
     * @tc.desc   Test keys() iterator values all exist in set via has()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetKeysTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let values: number[] = []
      for (let val of set.keys()) {
        values.push(val)
      }
      expect(values.length).assertEqual(3)
      for (let i = 0; i < values.length; i++) {
        expect(set.has(values[i])).assertTrue()
      }
      Done()
    })

    /**
     * @tc.name ConcurrentSetKeysTest2900
     * @tc.number SUB_CONCURRENTSET_KEYS_TEST_2900
     * @tc.desc   Test keys() iterator count equals set.size property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetKeysTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let iter: IterableIterator<number> = set.keys()
      let count: number = 0
      let item: IteratorResult<number> = iter.next()
      while (!item.done) {
        count++
        item = iter.next()
      }
      expect(count).assertEqual(set.size)
      Done()
    })

    /**
     * @tc.name ConcurrentSetKeysTest3000
     * @tc.number SUB_CONCURRENTSET_KEYS_TEST_3000
     * @tc.desc   Test keys() iterator after adding element during iteration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetKeysTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let iter: IterableIterator<number> = set.keys()
      set.add(4)
      let count: number = 0
      let item: IteratorResult<number> = iter.next()
      while (!item.done) {
        count++
        item = iter.next()
      }
      expect(count).assertLargerOrEqual(3)
      Done()
    })

    /**
     * @tc.name ConcurrentSetKeysTest3100
     * @tc.number SUB_CONCURRENTSET_KEYS_TEST_3100
     * @tc.desc   Test keys() iterator after deleting element during iteration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetKeysTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let iter: IterableIterator<number> = set.keys()
      set.delete(1)
      let count: number = 0
      let item: IteratorResult<number> = iter.next()
      while (!item.done) {
        count++
        item = iter.next()
      }
      expect(count).assertLargerOrEqual(2)
      Done()
    })

    /**
     * @tc.name ConcurrentSetKeysTest3200
     * @tc.number SUB_CONCURRENTSET_KEYS_TEST_3200
     * @tc.desc   Test keys() iterator concurrently with 10 async tasks on number set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetKeysTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 10; i++) {
        set.add(i)
      }
      let promises: Promise<number>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(keysTaskNum(set))
      }
      let results: number[] = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(10)
      }
      Done()
    })

    /**
     * @tc.name ConcurrentSetKeysTest3300
     * @tc.number SUB_CONCURRENTSET_KEYS_TEST_3300
     * @tc.desc   Test keys() iterator concurrently on empty set via async
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetKeysTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let promises: Promise<number>[] = []
      for (let i = 0; i < 5; i++) {
        promises.push(keysTaskNum(set))
      }
      let results: number[] = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(0)
      }
      Done()
    })

    /**
     * @tc.name ConcurrentSetKeysTest3400
     * @tc.number SUB_CONCURRENTSET_KEYS_TEST_3400
     * @tc.desc   Test keys() iterator concurrently with 3 specific async tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetKeysTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(10)
      set.add(20)
      set.add(30)
      let results: number[] = await Promise.all([
        keysTaskNum(set),
        keysTaskNum(set),
        keysTaskNum(set)
      ])
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(3)
      }
      Done()
    })

    /**
     * @tc.name ConcurrentSetKeysTest3500
     * @tc.number SUB_CONCURRENTSET_KEYS_TEST_3500
     * @tc.desc   Test keys() iterator concurrently on string type set with 5 async tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetKeysTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      set.add('a')
      set.add('b')
      set.add('c')
      set.add('d')
      set.add('e')
      let promises: Promise<number>[] = []
      for (let i = 0; i < 5; i++) {
        promises.push(keysTaskStr(set))
      }
      let results: number[] = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(5)
      }
      Done()
    })

    /**
     * @tc.name ConcurrentSetKeysTest3600
     * @tc.number SUB_CONCURRENTSET_KEYS_TEST_3600
     * @tc.desc   Test keys() iterator concurrently with 10 tasks on 10-element set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetKeysTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 10; i++) {
        set.add(i)
      }
      let promises: Promise<number>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(keysTaskNum(set))
      }
      let results: number[] = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(10)
      }
      Done()
    })

    /**
     * @tc.name ConcurrentSetKeysTest3700
     * @tc.number SUB_CONCURRENTSET_KEYS_TEST_3700
     * @tc.desc   Test keys() iterator in outer async task with 3 elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetKeysTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result: number = await outerTaskKeysCount()
      expect(result).assertEqual(3)
      Done()
    })

    /**
     * @tc.name ConcurrentSetKeysTest3800
     * @tc.number SUB_CONCURRENTSET_KEYS_TEST_3800
     * @tc.desc   Test keys() iterator in outer async task on empty set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetKeysTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result: number = await outerTaskKeysEmpty()
      expect(result).assertEqual(0)
      Done()
    })

    /**
     * @tc.name ConcurrentSetKeysTest3900
     * @tc.number SUB_CONCURRENTSET_KEYS_TEST_3900
     * @tc.desc   Test keys() iterator in nested task via onExecutionSucceeded callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetKeysTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let results: number[] = await Promise.all([keysTaskInCallback(set)])
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(3)
      }
      Done()
    })

    /**
     * @tc.name ConcurrentSetKeysTest4000
     * @tc.number SUB_CONCURRENTSET_KEYS_TEST_4000
     * @tc.desc   Test keys() iterator in nested task via onReceiveData callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetKeysTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let results: number[] = await Promise.all([keysTaskInCallback(set)])
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(3)
      }
      Done()
    })

    /**
     * @tc.name ConcurrentSetKeysTest4100
     * @tc.number SUB_CONCURRENTSET_KEYS_TEST_4100
     * @tc.desc   Test keys() iterator concurrently with 10 tasks verifying count equals 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetKeysTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 10; i++) {
        set.add(i)
      }
      let promises: Promise<number>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(keysTaskNum(set))
      }
      let results: number[] = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(10)
      }
      Done()
    })

    /**
     * @tc.name ConcurrentSetKeysTest4200
     * @tc.number SUB_CONCURRENTSET_KEYS_TEST_4200
     * @tc.desc   Test keys() iterator in nested task via onExecutionSucceeded callback with 3-element set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetKeysTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let results: number[] = await Promise.all([keysTaskInCallback(set)])
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(3)
      }
      Done()
    })

    /**
     * @tc.name ConcurrentSetKeysTest4300
     * @tc.number SUB_CONCURRENTSET_KEYS_TEST_4300
     * @tc.desc   Test keys() iterator on 3-element number set verifying traversal count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetKeysTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let iter: IterableIterator<number> = set.keys()
      let count: number = 0
      let item: IteratorResult<number> = iter.next()
      while (!item.done) {
        count++
        item = iter.next()
      }
      expect(count).assertEqual(3)
      Done()
    })

    /**
     * @tc.name ConcurrentSetKeysTest4400
     * @tc.number SUB_CONCURRENTSET_KEYS_TEST_4400
     * @tc.desc   Test keys() iterator on empty set verifying done=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetKeysTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let iter: IterableIterator<number> = set.keys()
      let item: IteratorResult<number> = iter.next()
      expect(item.done).assertTrue()
      Done()
    })

    /**
     * @tc.name ConcurrentSetKeysTest4500
     * @tc.number SUB_CONCURRENTSET_KEYS_TEST_4500
     * @tc.desc   Test keys() iterator on string type set with xyz elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetKeysTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      set.add('x')
      set.add('y')
      set.add('z')
      let iter: IterableIterator<string> = set.keys()
      let count: number = 0
      let item: IteratorResult<string> = iter.next()
      while (!item.done) {
        count++
        item = iter.next()
      }
      expect(count).assertEqual(3)
      Done()
    })

    /**
     * @tc.name ConcurrentSetKeysTest4600
     * @tc.number SUB_CONCURRENTSET_KEYS_TEST_4600
     * @tc.desc   Test keys() iterator on single-element set verifying value and done
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetKeysTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      let iter: IterableIterator<number> = set.keys()
      let item: IteratorResult<number> = iter.next()
      expect(item.done).assertFalse()
      expect(item.value).assertEqual(1)
      let next: IteratorResult<number> = iter.next()
      expect(next.done).assertTrue()
      Done()
    })

    /**
     * @tc.name ConcurrentSetKeysTest4700
     * @tc.number SUB_CONCURRENTSET_KEYS_TEST_4700
     * @tc.desc   Test two keys() iterators on 2-element set verifying both start correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetKeysTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      let iter1: IterableIterator<number> = set.keys()
      let iter2: IterableIterator<number> = set.keys()
      let item1: IteratorResult<number> = iter1.next()
      let item2: IteratorResult<number> = iter2.next()
      expect(item1.done).assertFalse()
      expect(item2.done).assertFalse()
      Done()
    })

    /**
     * @tc.name ConcurrentSetKeysTest4800
     * @tc.number SUB_CONCURRENTSET_KEYS_TEST_4800
     * @tc.desc   Test keys() iterator returns done=true after full traversal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetKeysTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let iter: IterableIterator<number> = set.keys()
      let item: IteratorResult<number> = iter.next()
      while (!item.done) {
        item = iter.next()
      }
      let afterEnd: IteratorResult<number> = iter.next()
      expect(afterEnd.done).assertTrue()
      Done()
    })

    /**
     * @tc.name ConcurrentSetKeysTest4900
     * @tc.number SUB_CONCURRENTSET_KEYS_TEST_4900
     * @tc.desc   Test keys() iterator values all exist in set via has()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetKeysTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let values: number[] = []
      for (let val of set.keys()) {
        values.push(val)
      }
      expect(values.length).assertEqual(3)
      for (let i = 0; i < values.length; i++) {
        expect(set.has(values[i])).assertTrue()
      }
      Done()
    })

    /**
     * @tc.name ConcurrentSetKeysTest5000
     * @tc.number SUB_CONCURRENTSET_KEYS_TEST_5000
     * @tc.desc   Test keys() iterator count equals set.size property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetKeysTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let iter: IterableIterator<number> = set.keys()
      let count: number = 0
      let item: IteratorResult<number> = iter.next()
      while (!item.done) {
        count++
        item = iter.next()
      }
      expect(count).assertEqual(set.size)
      Done()
    })

    /**
     * @tc.name ConcurrentSetKeysTest5100
     * @tc.number SUB_CONCURRENTSET_KEYS_TEST_5100
     * @tc.desc   Test keys() iterator after adding element during iteration verifying count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetKeysTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let iter: IterableIterator<number> = set.keys()
      set.add(4)
      let count: number = 0
      let item: IteratorResult<number> = iter.next()
      while (!item.done) {
        count++
        item = iter.next()
      }
      expect(count).assertLargerOrEqual(3)
      Done()
    })

    /**
     * @tc.name ConcurrentSetKeysTest5200
     * @tc.number SUB_CONCURRENTSET_KEYS_TEST_5200
     * @tc.desc   Test keys() iterator after deleting element during iteration verifying count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetKeysTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let iter: IterableIterator<number> = set.keys()
      set.delete(1)
      let count: number = 0
      let item: IteratorResult<number> = iter.next()
      while (!item.done) {
        count++
        item = iter.next()
      }
      expect(count).assertLargerOrEqual(2)
      Done()
    })

    /**
     * @tc.name ConcurrentSetKeysTest5300
     * @tc.number SUB_CONCURRENTSET_KEYS_TEST_5300
     * @tc.desc   Test keys() iterator concurrently with 10 async tasks on 10-element set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetKeysTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 10; i++) {
        set.add(i)
      }
      let promises: Promise<number>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(keysTaskNum(set))
      }
      let results: number[] = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(10)
      }
      Done()
    })

    /**
     * @tc.name ConcurrentSetKeysTest5400
     * @tc.number SUB_CONCURRENTSET_KEYS_TEST_5400
     * @tc.desc   Test keys() iterator in nested task via onReceiveData callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetKeysTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let results: number[] = await Promise.all([keysTaskInCallback(set)])
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(3)
      }
      Done()
    })
  })
}
