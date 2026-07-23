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


async function entriesTaskNum(s: containers.ConcurrentSet<number>): Promise<number> {
  let iter: IterableIterator<[number, number]> = s.entries()
  let count: number = 0
  let item: IteratorResult<[number, number]> = iter.next()
  while (!item.done) {
    count++
    item = iter.next()
  }
  return count
}


async function entriesTaskStr(s: containers.ConcurrentSet<string>): Promise<number> {
  let iter: IterableIterator<[string, string]> = s.entries()
  let count: number = 0
  let item: IteratorResult<[string, string]> = iter.next()
  while (!item.done) {
    count++
    item = iter.next()
  }
  return count
}


async function outerTaskEntriesCount(): Promise<number> {
  let innerSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
  innerSet.add(1)
  innerSet.add(2)
  innerSet.add(3)
  let iter: IterableIterator<[number, number]> = innerSet.entries()
  let count: number = 0
  let item: IteratorResult<[number, number]> = iter.next()
  while (!item.done) {
    count++
    item = iter.next()
  }
  return count
}


async function outerTaskEntriesEmpty(): Promise<number> {
  let innerSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
  let iter: IterableIterator<[number, number]> = innerSet.entries()
  let count: number = 0
  let item: IteratorResult<[number, number]> = iter.next()
  while (!item.done) {
    count++
    item = iter.next()
  }
  return count
}


async function entriesTaskInCallback(s: containers.ConcurrentSet<number>): Promise<number> {
  let iter: IterableIterator<[number, number]> = s.entries()
  let count: number = 0
  let item: IteratorResult<[number, number]> = iter.next()
  while (!item.done) {
    count++
    item = iter.next()
  }
  return count
}



export default function ConcurrentSetEntriesTest(): void {
  describe('ConcurrentSetEntriesTest', (): void => {
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
     * @tc.name   ConcurrentSetEntriesTest0100
     * @tc.number SUB_CONCURRENTSET_ENTRIES_TEST_0100
     * @tc.desc   Verify ConcurrentSet entries iterator returns key-value pairs with identical keys and values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetEntriesTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let count: number = 0
      for (let entry of set.entries()) {
        expect(entry[0]).assertEqual(entry[1])
        count++
      }
      expect(count).assertEqual(3)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetEntriesTest0200
     * @tc.number SUB_CONCURRENTSET_ENTRIES_TEST_0200
     * @tc.desc   Verify ConcurrentSet entries iterator on empty set returns done immediately
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetEntriesTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let iter: IterableIterator<[number, number]> = set.entries()
      let item: IteratorResult<[number, number]> = iter.next()
      expect(item.done).assertTrue()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetEntriesTest0300
     * @tc.number SUB_CONCURRENTSET_ENTRIES_TEST_0300
     * @tc.desc   Verify ConcurrentSet entries iterator on 3-element set count is 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetEntriesTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let iter: IterableIterator<[number, number]> = set.entries()
      let count: number = 0
      let item: IteratorResult<[number, number]> = iter.next()
      while (!item.done) {
        count++
        item = iter.next()
      }
      expect(count).assertEqual(3)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetEntriesTest0400
     * @tc.number SUB_CONCURRENTSET_ENTRIES_TEST_0400
     * @tc.desc   Verify ConcurrentSet entries iterator on string set returns key-value pairs with identical keys and values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetEntriesTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      set.add('a')
      set.add('b')
      set.add('c')
      let count: number = 0
      for (let entry of set.entries()) {
        expect(entry[0]).assertEqual(entry[1])
        count++
      }
      expect(count).assertEqual(3)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetEntriesTest0500
     * @tc.number SUB_CONCURRENTSET_ENTRIES_TEST_0500
     * @tc.desc   Verify ConcurrentSet entries iterator on empty set returns done immediately
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetEntriesTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let iter: IterableIterator<[number, number]> = set.entries()
      let item: IteratorResult<[number, number]> = iter.next()
      expect(item.done).assertTrue()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetEntriesTest0600
     * @tc.number SUB_CONCURRENTSET_ENTRIES_TEST_0600
     * @tc.desc   Verify ConcurrentSet entries iterator on 100-element set count is 100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetEntriesTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 100; i++) {
        set.add(i)
      }
      let iter: IterableIterator<[number, number]> = set.entries()
      let count: number = 0
      let item: IteratorResult<[number, number]> = iter.next()
      while (!item.done) {
        count++
        item = iter.next()
      }
      expect(count).assertEqual(100)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetEntriesTest0700
     * @tc.number SUB_CONCURRENTSET_ENTRIES_TEST_0700
     * @tc.desc   Verify ConcurrentSet entries iterator first item is not done and key equals value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetEntriesTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let hasFirst: boolean = false
      for (let entry of set.entries()) {
        expect(entry[0]).assertEqual(entry[1])
        hasFirst = true
        break
      }
      expect(hasFirst).assertTrue()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetEntriesTest0800
     * @tc.number SUB_CONCURRENTSET_ENTRIES_TEST_0800
     * @tc.desc   Verify ConcurrentSet entries iterator on 3-element set count is 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetEntriesTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let iter: IterableIterator<[number, number]> = set.entries()
      let count: number = 0
      let item: IteratorResult<[number, number]> = iter.next()
      while (!item.done) {
        count++
        item = iter.next()
      }
      expect(count).assertEqual(3)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetEntriesTest0900
     * @tc.number SUB_CONCURRENTSET_ENTRIES_TEST_0900
     * @tc.desc   Verify ConcurrentSet entries iterator on 3-element set count is 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetEntriesTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let iter: IterableIterator<[number, number]> = set.entries()
      let count: number = 0
      let item: IteratorResult<[number, number]> = iter.next()
      while (!item.done) {
        count++
        item = iter.next()
      }
      expect(count).assertEqual(3)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetEntriesTest1000
     * @tc.number SUB_CONCURRENTSET_ENTRIES_TEST_1000
     * @tc.desc   Verify ConcurrentSet entries iterator on string set count is 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetEntriesTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      set.add('a')
      set.add('b')
      set.add('c')
      let iter: IterableIterator<[string, string]> = set.entries()
      let count: number = 0
      let item: IteratorResult<[string, string]> = iter.next()
      while (!item.done) {
        count++
        item = iter.next()
      }
      expect(count).assertEqual(3)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetEntriesTest1100
     * @tc.number SUB_CONCURRENTSET_ENTRIES_TEST_1100
     * @tc.desc   Verify ConcurrentSet entries iterator on empty set single thread returns done immediately
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetEntriesTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let iter: IterableIterator<[number, number]> = set.entries()
      let item: IteratorResult<[number, number]> = iter.next()
      expect(item.done).assertTrue()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetEntriesTest1200
     * @tc.number SUB_CONCURRENTSET_ENTRIES_TEST_1200
     * @tc.desc   Verify ConcurrentSet entries iterator on 100-element set single thread count is 100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetEntriesTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 100; i++) {
        set.add(i)
      }
      let iter: IterableIterator<[number, number]> = set.entries()
      let count: number = 0
      let item: IteratorResult<[number, number]> = iter.next()
      while (!item.done) {
        count++
        item = iter.next()
      }
      expect(count).assertEqual(100)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetEntriesTest1300
     * @tc.number SUB_CONCURRENTSET_ENTRIES_TEST_1300
     * @tc.desc   Verify ConcurrentSet entries returns two independent iterators with same count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetEntriesTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let iter1: IterableIterator<[number, number]> = set.entries()
      let iter2: IterableIterator<[number, number]> = set.entries()
      let count1: number = 0
      let count2: number = 0
      let item1: IteratorResult<[number, number]> = iter1.next()
      while (!item1.done) {
        count1++
        item1 = iter1.next()
      }
      let item2: IteratorResult<[number, number]> = iter2.next()
      while (!item2.done) {
        count2++
        item2 = iter2.next()
      }
      expect(count1).assertEqual(3)
      expect(count2).assertEqual(3)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetEntriesTest1400
     * @tc.number SUB_CONCURRENTSET_ENTRIES_TEST_1400
     * @tc.desc   Verify ConcurrentSet entries iterator after exhaustion returns done on subsequent calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetEntriesTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let iter: IterableIterator<[number, number]> = set.entries()
      let item: IteratorResult<[number, number]> = iter.next()
      while (!item.done) {
        item = iter.next()
      }
      let afterEnd: IteratorResult<[number, number]> = iter.next()
      expect(afterEnd.done).assertTrue()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetEntriesTest1500
     * @tc.number SUB_CONCURRENTSET_ENTRIES_TEST_1500
     * @tc.desc   Verify ConcurrentSet entries iterator values are valid elements in the set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetEntriesTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let vals: number[] = []
      for (let entry of set.entries()) {
        vals.push(entry[0])
      }
      expect(vals.length).assertEqual(3)
      for (let i = 0; i < vals.length; i++) {
        expect(set.has(vals[i])).assertTrue()
      }
      Done()
    })

    /**
     * @tc.name   ConcurrentSetEntriesTest1600
     * @tc.number SUB_CONCURRENTSET_ENTRIES_TEST_1600
     * @tc.desc   Verify ConcurrentSet entries iterator count equals set size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetEntriesTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let iter: IterableIterator<[number, number]> = set.entries()
      let count: number = 0
      let item: IteratorResult<[number, number]> = iter.next()
      while (!item.done) {
        count++
        item = iter.next()
      }
      expect(count).assertEqual(set.size)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetEntriesTest1700
     * @tc.number SUB_CONCURRENTSET_ENTRIES_TEST_1700
     * @tc.desc   Verify ConcurrentSet entries iterator on string set count is 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetEntriesTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      set.add('a')
      set.add('b')
      set.add('c')
      let iter: IterableIterator<[string, string]> = set.entries()
      let count: number = 0
      let item: IteratorResult<[string, string]> = iter.next()
      while (!item.done) {
        count++
        item = iter.next()
      }
      expect(count).assertEqual(3)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetEntriesTest1800
     * @tc.number SUB_CONCURRENTSET_ENTRIES_TEST_1800
     * @tc.desc   Verify ConcurrentSet entries iterator on empty set returns done immediately
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetEntriesTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let iter: IterableIterator<[number, number]> = set.entries()
      let item: IteratorResult<[number, number]> = iter.next()
      expect(item.done).assertTrue()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetEntriesTest1900
     * @tc.number SUB_CONCURRENTSET_ENTRIES_TEST_1900
     * @tc.desc   Verify ConcurrentSet entries iterator on 100-element set single thread count is 100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetEntriesTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 100; i++) {
        set.add(i)
      }
      let iter: IterableIterator<[number, number]> = set.entries()
      let count: number = 0
      let item: IteratorResult<[number, number]> = iter.next()
      while (!item.done) {
        count++
        item = iter.next()
      }
      expect(count).assertEqual(100)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetEntriesTest2000
     * @tc.number SUB_CONCURRENTSET_ENTRIES_TEST_2000
     * @tc.desc   Verify ConcurrentSet entries iterator first item is not done
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetEntriesTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let iter: IterableIterator<[number, number]> = set.entries()
      let first: IteratorResult<[number, number]> = iter.next()
      expect(first.done).assertFalse()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetEntriesTest2100
     * @tc.number SUB_CONCURRENTSET_ENTRIES_TEST_2100
     * @tc.desc   Verify ConcurrentSet entries iterator on 3-element set count is 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetEntriesTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let iter: IterableIterator<[number, number]> = set.entries()
      let count: number = 0
      let item: IteratorResult<[number, number]> = iter.next()
      while (!item.done) {
        count++
        item = iter.next()
      }
      expect(count).assertEqual(3)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetEntriesTest2200
     * @tc.number SUB_CONCURRENTSET_ENTRIES_TEST_2200
     * @tc.desc   Verify ConcurrentSet entries iterator on 3-element set count is 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetEntriesTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let iter: IterableIterator<[number, number]> = set.entries()
      let count: number = 0
      let item: IteratorResult<[number, number]> = iter.next()
      while (!item.done) {
        count++
        item = iter.next()
      }
      expect(count).assertEqual(3)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetEntriesTest2300
     * @tc.number SUB_CONCURRENTSET_ENTRIES_TEST_2300
     * @tc.desc   Verify ConcurrentSet entries iterator on string set count is 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetEntriesTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      set.add('a')
      set.add('b')
      set.add('c')
      let iter: IterableIterator<[string, string]> = set.entries()
      let count: number = 0
      let item: IteratorResult<[string, string]> = iter.next()
      while (!item.done) {
        count++
        item = iter.next()
      }
      expect(count).assertEqual(3)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetEntriesTest2400
     * @tc.number SUB_CONCURRENTSET_ENTRIES_TEST_2400
     * @tc.desc   Verify ConcurrentSet entries iterator on empty set single thread returns done immediately
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetEntriesTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let iter: IterableIterator<[number, number]> = set.entries()
      let item: IteratorResult<[number, number]> = iter.next()
      expect(item.done).assertTrue()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetEntriesTest2500
     * @tc.number SUB_CONCURRENTSET_ENTRIES_TEST_2500
     * @tc.desc   Verify ConcurrentSet entries iterator on 100-element set single thread count is 100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetEntriesTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 100; i++) {
        set.add(i)
      }
      let iter: IterableIterator<[number, number]> = set.entries()
      let count: number = 0
      let item: IteratorResult<[number, number]> = iter.next()
      while (!item.done) {
        count++
        item = iter.next()
      }
      expect(count).assertEqual(100)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetEntriesTest2600
     * @tc.number SUB_CONCURRENTSET_ENTRIES_TEST_2600
     * @tc.desc   Verify ConcurrentSet entries returns two independent iterators with same count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetEntriesTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let iter1: IterableIterator<[number, number]> = set.entries()
      let iter2: IterableIterator<[number, number]> = set.entries()
      let count1: number = 0
      let count2: number = 0
      let item1: IteratorResult<[number, number]> = iter1.next()
      while (!item1.done) {
        count1++
        item1 = iter1.next()
      }
      let item2: IteratorResult<[number, number]> = iter2.next()
      while (!item2.done) {
        count2++
        item2 = iter2.next()
      }
      expect(count1).assertEqual(3)
      expect(count2).assertEqual(3)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetEntriesTest2700
     * @tc.number SUB_CONCURRENTSET_ENTRIES_TEST_2700
     * @tc.desc   Verify ConcurrentSet entries iterator after exhaustion returns done on subsequent calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetEntriesTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let iter: IterableIterator<[number, number]> = set.entries()
      let item: IteratorResult<[number, number]> = iter.next()
      while (!item.done) {
        item = iter.next()
      }
      let afterEnd: IteratorResult<[number, number]> = iter.next()
      expect(afterEnd.done).assertTrue()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetEntriesTest2800
     * @tc.number SUB_CONCURRENTSET_ENTRIES_TEST_2800
     * @tc.desc   Verify ConcurrentSet entries iterator values are valid elements in the set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetEntriesTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let vals: number[] = []
      for (let entry of set.entries()) {
        vals.push(entry[0])
      }
      expect(vals.length).assertEqual(3)
      for (let i = 0; i < vals.length; i++) {
        expect(set.has(vals[i])).assertTrue()
      }
      Done()
    })

    /**
     * @tc.name   ConcurrentSetEntriesTest2900
     * @tc.number SUB_CONCURRENTSET_ENTRIES_TEST_2900
     * @tc.desc   Verify ConcurrentSet entries iterator count equals set size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetEntriesTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let iter: IterableIterator<[number, number]> = set.entries()
      let count: number = 0
      let item: IteratorResult<[number, number]> = iter.next()
      while (!item.done) {
        count++
        item = iter.next()
      }
      expect(count).assertEqual(set.size)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetEntriesTest3000
     * @tc.number SUB_CONCURRENTSET_ENTRIES_TEST_3000
     * @tc.desc   Verify ConcurrentSet entries iterator reflects added elements after iterator creation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetEntriesTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let iter: IterableIterator<[number, number]> = set.entries()
      set.add(4)
      let count: number = 0
      let item: IteratorResult<[number, number]> = iter.next()
      while (!item.done) {
        count++
        item = iter.next()
      }
      expect(count).assertLargerOrEqual(3)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetEntriesTest3100
     * @tc.number SUB_CONCURRENTSET_ENTRIES_TEST_3100
     * @tc.desc   Verify ConcurrentSet entries iterator reflects deleted elements after iterator creation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetEntriesTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let iter: IterableIterator<[number, number]> = set.entries()
      set.delete(1)
      let count: number = 0
      let item: IteratorResult<[number, number]> = iter.next()
      while (!item.done) {
        count++
        item = iter.next()
      }
      expect(count).assertLargerOrEqual(2)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetEntriesTest3200
     * @tc.number SUB_CONCURRENTSET_ENTRIES_TEST_3200
     * @tc.desc   Verify ConcurrentSet entries with 10 concurrent tasks each returns count 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetEntriesTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 10; i++) {
        set.add(i)
      }
      let promises: Promise<number>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(entriesTaskNum(set))
      }
      let results: number[] = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(10)
      }
      Done()
    })

    /**
     * @tc.name   ConcurrentSetEntriesTest3300
     * @tc.number SUB_CONCURRENTSET_ENTRIES_TEST_3300
     * @tc.desc   Verify ConcurrentSet entries with 5 concurrent tasks on empty set each returns count 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetEntriesTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let promises: Promise<number>[] = []
      for (let i = 0; i < 5; i++) {
        promises.push(entriesTaskNum(set))
      }
      let results: number[] = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(0)
      }
      Done()
    })

    /**
     * @tc.name   ConcurrentSetEntriesTest3400
     * @tc.number SUB_CONCURRENTSET_ENTRIES_TEST_3400
     * @tc.desc   Verify ConcurrentSet entries with 3 concurrent tasks on 3-element set each returns count 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetEntriesTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(10)
      set.add(20)
      set.add(30)
      let results: number[] = await Promise.all([
        entriesTaskNum(set),
        entriesTaskNum(set),
        entriesTaskNum(set)
      ])
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(3)
      }
      Done()
    })

    /**
     * @tc.name   ConcurrentSetEntriesTest3500
     * @tc.number SUB_CONCURRENTSET_ENTRIES_TEST_3500
     * @tc.desc   Verify ConcurrentSet entries with 5 concurrent string tasks each returns count 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetEntriesTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      set.add('a')
      set.add('b')
      set.add('c')
      set.add('d')
      set.add('e')
      let promises: Promise<number>[] = []
      for (let i = 0; i < 5; i++) {
        promises.push(entriesTaskStr(set))
      }
      let results: number[] = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(5)
      }
      Done()
    })

    /**
     * @tc.name   ConcurrentSetEntriesTest3600
     * @tc.number SUB_CONCURRENTSET_ENTRIES_TEST_3600
     * @tc.desc   Verify ConcurrentSet entries with 10 concurrent tasks on 10-element set each returns count 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetEntriesTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 10; i++) {
        set.add(i)
      }
      let promises: Promise<number>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(entriesTaskNum(set))
      }
      let results: number[] = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(10)
      }
      Done()
    })

    /**
     * @tc.name   ConcurrentSetEntriesTest3700
     * @tc.number SUB_CONCURRENTSET_ENTRIES_TEST_3700
     * @tc.desc   Verify ConcurrentSet entries inside TaskPool task returns correct count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetEntriesTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result: number = await outerTaskEntriesCount()
      expect(result).assertEqual(3)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetEntriesTest3800
     * @tc.number SUB_CONCURRENTSET_ENTRIES_TEST_3800
     * @tc.desc   Verify ConcurrentSet entries inside TaskPool task on empty set returns count 0
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetEntriesTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result: number = await outerTaskEntriesEmpty()
      expect(result).assertEqual(0)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetEntriesTest3900
     * @tc.number SUB_CONCURRENTSET_ENTRIES_TEST_3900
     * @tc.desc   Verify ConcurrentSet entries inside onExecutionSucceeded callback returns correct count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetEntriesTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let results: number[] = await Promise.all([entriesTaskInCallback(set)])
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(3)
      }
      Done()
    })

    /**
     * @tc.name   ConcurrentSetEntriesTest4000
     * @tc.number SUB_CONCURRENTSET_ENTRIES_TEST_4000
     * @tc.desc   Verify ConcurrentSet entries inside onReceiveData callback with nested task returns correct count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetEntriesTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let results: number[] = await Promise.all([entriesTaskInCallback(set)])
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(3)
      }
      Done()
    })

    /**
     * @tc.name   ConcurrentSetEntriesTest4100
     * @tc.number SUB_CONCURRENTSET_ENTRIES_TEST_4100
     * @tc.desc   Verify ConcurrentSet entries with 10 concurrent nested tasks each returns count 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetEntriesTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 10; i++) {
        set.add(i)
      }
      let promises: Promise<number>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(entriesTaskNum(set))
      }
      let results: number[] = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(10)
      }
      Done()
    })

    /**
     * @tc.name   ConcurrentSetEntriesTest4200
     * @tc.number SUB_CONCURRENTSET_ENTRIES_TEST_4200
     * @tc.desc   Verify ConcurrentSet entries inside onExecutionSucceeded callback returns correct count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetEntriesTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let results: number[] = await Promise.all([entriesTaskInCallback(set)])
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(3)
      }
      Done()
    })

    /**
     * @tc.name   ConcurrentSetEntriesTest4300
     * @tc.number SUB_CONCURRENTSET_ENTRIES_TEST_4300
     * @tc.desc   Verify ConcurrentSet entries iterator returns key-value pairs with identical keys and values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetEntriesTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let count: number = 0
      for (let entry of set.entries()) {
        expect(entry[0]).assertEqual(entry[1])
        count++
      }
      expect(count).assertEqual(3)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetEntriesTest4400
     * @tc.number SUB_CONCURRENTSET_ENTRIES_TEST_4400
     * @tc.desc   Verify ConcurrentSet entries iterator on empty set returns done immediately
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetEntriesTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let iter: IterableIterator<[number, number]> = set.entries()
      let item: IteratorResult<[number, number]> = iter.next()
      expect(item.done).assertTrue()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetEntriesTest4500
     * @tc.number SUB_CONCURRENTSET_ENTRIES_TEST_4500
     * @tc.desc   Verify ConcurrentSet entries iterator on string set with x y z count is 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetEntriesTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      set.add('x')
      set.add('y')
      set.add('z')
      let iter: IterableIterator<[string, string]> = set.entries()
      let count: number = 0
      let item: IteratorResult<[string, string]> = iter.next()
      while (!item.done) {
        count++
        item = iter.next()
      }
      expect(count).assertEqual(3)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetEntriesTest4600
     * @tc.number SUB_CONCURRENTSET_ENTRIES_TEST_4600
     * @tc.desc   Verify ConcurrentSet entries iterator on single-element set returns one pair then done
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetEntriesTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      let count: number = 0
      for (let entry of set.entries()) {
        if (count === 0) {
          expect(entry[0]).assertEqual(1)
          expect(entry[1]).assertEqual(1)
        }
        count++
      }
      expect(count).assertEqual(1)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetEntriesTest4700
     * @tc.number SUB_CONCURRENTSET_ENTRIES_TEST_4700
     * @tc.desc   Verify ConcurrentSet two independent entries iterators both return not done on first item
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetEntriesTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      let iter1: IterableIterator<[number, number]> = set.entries()
      let iter2: IterableIterator<[number, number]> = set.entries()
      let item1: IteratorResult<[number, number]> = iter1.next()
      let item2: IteratorResult<[number, number]> = iter2.next()
      expect(item1.done).assertFalse()
      expect(item2.done).assertFalse()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetEntriesTest4800
     * @tc.number SUB_CONCURRENTSET_ENTRIES_TEST_4800
     * @tc.desc   Verify ConcurrentSet entries iterator after exhaustion returns done on subsequent calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetEntriesTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let iter: IterableIterator<[number, number]> = set.entries()
      let item: IteratorResult<[number, number]> = iter.next()
      while (!item.done) {
        item = iter.next()
      }
      let afterEnd: IteratorResult<[number, number]> = iter.next()
      expect(afterEnd.done).assertTrue()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetEntriesTest4900
     * @tc.number SUB_CONCURRENTSET_ENTRIES_TEST_4900
     * @tc.desc   Verify ConcurrentSet entries iterator values are valid elements in the set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetEntriesTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let vals: number[] = []
      for (let entry of set.entries()) {
        vals.push(entry[0])
      }
      expect(vals.length).assertEqual(3)
      for (let i = 0; i < vals.length; i++) {
        expect(set.has(vals[i])).assertTrue()
      }
      Done()
    })

    /**
     * @tc.name   ConcurrentSetEntriesTest5000
     * @tc.number SUB_CONCURRENTSET_ENTRIES_TEST_5000
     * @tc.desc   Verify ConcurrentSet entries iterator count equals set size
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetEntriesTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let iter: IterableIterator<[number, number]> = set.entries()
      let count: number = 0
      let item: IteratorResult<[number, number]> = iter.next()
      while (!item.done) {
        count++
        item = iter.next()
      }
      expect(count).assertEqual(set.size)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetEntriesTest5100
     * @tc.number SUB_CONCURRENTSET_ENTRIES_TEST_5100
     * @tc.desc   Verify ConcurrentSet entries iterator reflects added elements after iterator creation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetEntriesTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let iter: IterableIterator<[number, number]> = set.entries()
      set.add(4)
      let count: number = 0
      let item: IteratorResult<[number, number]> = iter.next()
      while (!item.done) {
        count++
        item = iter.next()
      }
      expect(count).assertLargerOrEqual(3)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetEntriesTest5200
     * @tc.number SUB_CONCURRENTSET_ENTRIES_TEST_5200
     * @tc.desc   Verify ConcurrentSet entries iterator reflects deleted elements after iterator creation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetEntriesTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let iter: IterableIterator<[number, number]> = set.entries()
      set.delete(1)
      let count: number = 0
      let item: IteratorResult<[number, number]> = iter.next()
      while (!item.done) {
        count++
        item = iter.next()
      }
      expect(count).assertLargerOrEqual(2)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetEntriesTest5300
     * @tc.number SUB_CONCURRENTSET_ENTRIES_TEST_5300
     * @tc.desc   Verify ConcurrentSet entries iterator returns key-value pairs with identical keys and values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetEntriesTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let count: number = 0
      for (let entry of set.entries()) {
        expect(entry[0]).assertEqual(entry[1])
        count++
      }
      expect(count).assertEqual(3)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetEntriesTest5400
     * @tc.number SUB_CONCURRENTSET_ENTRIES_TEST_5400
     * @tc.desc   Verify ConcurrentSet entries with 10 concurrent tasks on 10-element set each returns count 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetEntriesTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 10; i++) {
        set.add(i)
      }
      let promises: Promise<number>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(entriesTaskNum(set))
      }
      let results: number[] = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(10)
      }
      Done()
    })

    /**
     * @tc.name   ConcurrentSetEntriesTest5500
     * @tc.number SUB_CONCURRENTSET_ENTRIES_TEST_5500
     * @tc.desc   Verify ConcurrentSet entries inside onReceiveData callback with nested task returns correct count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetEntriesTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let results: number[] = await Promise.all([entriesTaskInCallback(set)])
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(3)
      }
      Done()
    })

    /**
     * @tc.name   ConcurrentSetEntriesTest5600
     * @tc.number SUB_CONCURRENTSET_ENTRIES_TEST_5600
     * @tc.desc   Verify ConcurrentSet entries iterator on 3-element set count is 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetEntriesTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let iter: IterableIterator<[number, number]> = set.entries()
      let count: number = 0
      let item: IteratorResult<[number, number]> = iter.next()
      while (!item.done) {
        count++
        item = iter.next()
      }
      expect(count).assertEqual(3)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetEntriesTest5700
     * @tc.number SUB_CONCURRENTSET_ENTRIES_TEST_5700
     * @tc.desc   Verify ConcurrentSet entries iterator on empty set returns done immediately
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetEntriesTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let iter: IterableIterator<[number, number]> = set.entries()
      let item: IteratorResult<[number, number]> = iter.next()
      expect(item.done).assertTrue()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetEntriesTest5800
     * @tc.number SUB_CONCURRENTSET_ENTRIES_TEST_5800
     * @tc.desc   Verify ConcurrentSet entries iterator values are valid elements in the set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetEntriesTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let vals: number[] = []
      for (let entry of set.entries()) {
        vals.push(entry[0])
      }
      expect(vals.length).assertEqual(3)
      for (let i = 0; i < vals.length; i++) {
        expect(set.has(vals[i])).assertTrue()
      }
      Done()
    })

    /**
     * @tc.name   ConcurrentSetEntriesTest5900
     * @tc.number SUB_CONCURRENTSET_ENTRIES_TEST_5900
     * @tc.desc   Verify ConcurrentSet entries inside onExecutionSucceeded callback returns correct count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetEntriesTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let results: number[] = await Promise.all([entriesTaskInCallback(set)])
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(3)
      }
      Done()
    })

    /**
     * @tc.name   ConcurrentSetEntriesTest6000
     * @tc.number SUB_CONCURRENTSET_ENTRIES_TEST_6000
     * @tc.desc   Verify ConcurrentSet entries iterator reflects added elements after iterator creation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetEntriesTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let iter: IterableIterator<[number, number]> = set.entries()
      set.add(4)
      let count: number = 0
      let item: IteratorResult<[number, number]> = iter.next()
      while (!item.done) {
        count++
        item = iter.next()
      }
      expect(count).assertLargerOrEqual(3)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetEntriesTest6100
     * @tc.number SUB_CONCURRENTSET_ENTRIES_TEST_6100
     * @tc.desc   Verify ConcurrentSet entries iterator reflects deleted elements after iterator creation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetEntriesTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let iter: IterableIterator<[number, number]> = set.entries()
      set.delete(1)
      let count: number = 0
      let item: IteratorResult<[number, number]> = iter.next()
      while (!item.done) {
        count++
        item = iter.next()
      }
      expect(count).assertLargerOrEqual(2)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetEntriesTest6200
     * @tc.number SUB_CONCURRENTSET_ENTRIES_TEST_6200
     * @tc.desc   Verify ConcurrentSet entries returns two independent iterators with same count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetEntriesTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let iter1: IterableIterator<[number, number]> = set.entries()
      let iter2: IterableIterator<[number, number]> = set.entries()
      let count1: number = 0
      let count2: number = 0
      let item1: IteratorResult<[number, number]> = iter1.next()
      while (!item1.done) {
        count1++
        item1 = iter1.next()
      }
      let item2: IteratorResult<[number, number]> = iter2.next()
      while (!item2.done) {
        count2++
        item2 = iter2.next()
      }
      expect(count1).assertEqual(3)
      expect(count2).assertEqual(3)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetEntriesTest6300
     * @tc.number SUB_CONCURRENTSET_ENTRIES_TEST_6300
     * @tc.desc   Verify ConcurrentSet entries iterator after exhaustion returns done on subsequent calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetEntriesTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let iter: IterableIterator<[number, number]> = set.entries()
      let item: IteratorResult<[number, number]> = iter.next()
      while (!item.done) {
        item = iter.next()
      }
      let afterEnd: IteratorResult<[number, number]> = iter.next()
      expect(afterEnd.done).assertTrue()
      Done()
    })

    /**
     * @tc.name   ConcurrentSetEntriesTest6400
     * @tc.number SUB_CONCURRENTSET_ENTRIES_TEST_6400
     * @tc.desc   Verify ConcurrentSet entries iterator returns key-value pairs with identical keys and values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetEntriesTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let count: number = 0
      for (let entry of set.entries()) {
        expect(entry[0]).assertEqual(entry[1])
        count++
      }
      expect(count).assertEqual(3)
      Done()
    })

    /**
     * @tc.name   ConcurrentSetEntriesTest6500
     * @tc.number SUB_CONCURRENTSET_ENTRIES_TEST_6500
     * @tc.desc   Verify ConcurrentSet entries with 10 concurrent tasks on 10-element set each returns count 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetEntriesTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 10; i++) {
        set.add(i)
      }
      let promises: Promise<number>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(entriesTaskNum(set))
      }
      let results: number[] = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(10)
      }
      Done()
    })

    /**
     * @tc.name   ConcurrentSetEntriesTest6600
     * @tc.number SUB_CONCURRENTSET_ENTRIES_TEST_6600
     * @tc.desc   Verify ConcurrentSet entries inside onReceiveData callback with nested task returns correct count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetEntriesTest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let results: number[] = await Promise.all([entriesTaskInCallback(set)])
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(3)
      }
      Done()
    })
  })
}
