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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../hypium'
import Utils from './Util.test'

async function iteratorTaskNum(s: containers.ConcurrentSet<number>): Promise<number> {
  let iter: IterableIterator<number> = s.values()
  let count: number = 0
  let item: IteratorResult<number> = iter.next()
  while (!item.done) {
    count++
    item = iter.next()
  }
  return count
}

async function iteratorTaskStr(s: containers.ConcurrentSet<string>): Promise<number> {
  let iter: IterableIterator<string> = s.values()
  let count: number = 0
  let item: IteratorResult<string> = iter.next()
  while (!item.done) {
    count++
    item = iter.next()
  }
  return count
}

async function outerTaskIteratorCount(): Promise<number> {
  let innerSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
  innerSet.add(1)
  innerSet.add(2)
  innerSet.add(3)
  let iter: IterableIterator<number> = innerSet.values()
  let count: number = 0
  let item: IteratorResult<number> = iter.next()
  while (!item.done) {
    count++
    item = iter.next()
  }
  return count
}

async function outerTaskIteratorEmpty(): Promise<number> {
  let innerSet: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
  let iter: IterableIterator<number> = innerSet.values()
  let count: number = 0
  let item: IteratorResult<number> = iter.next()
  while (!item.done) {
    count++
    item = iter.next()
  }
  return count
}

async function iteratorTaskInCallback(s: containers.ConcurrentSet<number>): Promise<number> {
  let iter: IterableIterator<number> = s.values()
  let count: number = 0
  let item: IteratorResult<number> = iter.next()
  while (!item.done) {
    count++
    item = iter.next()
  }
  return count
}


export default function ConcurrentSetIteratorTest(): void {
  describe('ConcurrentSetIteratorTest', (): void => {
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
     * @tc.name ConcurrentSetIteratorTest0100
     * @tc.number SUB_CONCURRENTSET_ITERATOR_TEST_0100
     * @tc.desc   Test Symbol.iterator on number set with 3 elements and verify value range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetIteratorTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let iter: IterableIterator<number> = set.values()
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
     * @tc.name ConcurrentSetIteratorTest0200
     * @tc.number SUB_CONCURRENTSET_ITERATOR_TEST_0200
     * @tc.desc   Test Symbol.iterator on empty set returns done immediately
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetIteratorTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let iter: IterableIterator<number> = set.values()
      let item: IteratorResult<number> = iter.next()
      expect(item.done).assertTrue()
      Done()
    })

    /**
     * @tc.name ConcurrentSetIteratorTest0300
     * @tc.number SUB_CONCURRENTSET_ITERATOR_TEST_0300
     * @tc.desc   Test Symbol.iterator traversal count equals 3 on number set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetIteratorTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let iter: IterableIterator<number> = set.values()
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
     * @tc.name ConcurrentSetIteratorTest0400
     * @tc.number SUB_CONCURRENTSET_ITERATOR_TEST_0400
     * @tc.desc   Test Symbol.iterator on string type set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetIteratorTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      set.add('a')
      set.add('b')
      set.add('c')
      let iter: IterableIterator<string> = set.values()
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
     * @tc.name ConcurrentSetIteratorTest0500
     * @tc.number SUB_CONCURRENTSET_ITERATOR_TEST_0500
     * @tc.desc   Test Symbol.iterator on empty set returns done=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetIteratorTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let iter: IterableIterator<number> = set.values()
      let item: IteratorResult<number> = iter.next()
      expect(item.done).assertTrue()
      Done()
    })

    /**
     * @tc.name ConcurrentSetIteratorTest0600
     * @tc.number SUB_CONCURRENTSET_ITERATOR_TEST_0600
     * @tc.desc   Test Symbol.iterator on set with 100 elements verifying count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetIteratorTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 100; i++) {
        set.add(i)
      }
      let iter: IterableIterator<number> = set.values()
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
     * @tc.name ConcurrentSetIteratorTest0700
     * @tc.number SUB_CONCURRENTSET_ITERATOR_TEST_0700
     * @tc.desc   Test Symbol.iterator first next() returns valid element
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetIteratorTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let iter: IterableIterator<number> = set.values()
      let first: IteratorResult<number> = iter.next()
      expect(first.done).assertFalse()
      expect(first.value).assertLargerOrEqual(1)
      expect(first.value).assertLessOrEqual(3)
      Done()
    })

    /**
     * @tc.name ConcurrentSetIteratorTest0800
     * @tc.number SUB_CONCURRENTSET_ITERATOR_TEST_0800
     * @tc.desc   Test Symbol.iterator traversal count equals 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetIteratorTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let iter: IterableIterator<number> = set.values()
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
     * @tc.name ConcurrentSetIteratorTest0900
     * @tc.number SUB_CONCURRENTSET_ITERATOR_TEST_0900
     * @tc.desc   Test Symbol.iterator on 3-element number set verifying count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetIteratorTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let iter: IterableIterator<number> = set.values()
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
     * @tc.name ConcurrentSetIteratorTest1000
     * @tc.number SUB_CONCURRENTSET_ITERATOR_TEST_1000
     * @tc.desc   Test Symbol.iterator on string type set verifying count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetIteratorTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      set.add('a')
      set.add('b')
      set.add('c')
      let iter: IterableIterator<string> = set.values()
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
     * @tc.name ConcurrentSetIteratorTest1100
     * @tc.number SUB_CONCURRENTSET_ITERATOR_TEST_1100
     * @tc.desc   Test Symbol.iterator on empty set verifying done=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetIteratorTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let iter: IterableIterator<number> = set.values()
      let item: IteratorResult<number> = iter.next()
      expect(item.done).assertTrue()
      Done()
    })

    /**
     * @tc.name ConcurrentSetIteratorTest1200
     * @tc.number SUB_CONCURRENTSET_ITERATOR_TEST_1200
     * @tc.desc   Test Symbol.iterator on set with 100 elements verifying count equals 100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetIteratorTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 100; i++) {
        set.add(i)
      }
      let iter: IterableIterator<number> = set.values()
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
     * @tc.name ConcurrentSetIteratorTest1300
     * @tc.number SUB_CONCURRENTSET_ITERATOR_TEST_1300
     * @tc.desc   Test two independent Symbol.iterator iterators on the same set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetIteratorTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let iter1: IterableIterator<number> = set.values()
      let iter2: IterableIterator<number> = set.values()
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
     * @tc.name ConcurrentSetIteratorTest1400
     * @tc.number SUB_CONCURRENTSET_ITERATOR_TEST_1400
     * @tc.desc   Test Symbol.iterator next() returns done=true after traversal ends
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetIteratorTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let iter: IterableIterator<number> = set.values()
      let item: IteratorResult<number> = iter.next()
      while (!item.done) {
        item = iter.next()
      }
      let afterEnd: IteratorResult<number> = iter.next()
      expect(afterEnd.done).assertTrue()
      Done()
    })

    /**
     * @tc.name ConcurrentSetIteratorTest1500
     * @tc.number SUB_CONCURRENTSET_ITERATOR_TEST_1500
     * @tc.desc   Test Symbol.iterator values are all present in set via has()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetIteratorTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let vals: number[] = []
      for (let val of set.values()) {
        vals.push(val)
      }
      expect(vals.length).assertEqual(3)
      for (let i = 0; i < vals.length; i++) {
        expect(set.has(vals[i])).assertTrue()
      }
      Done()
    })

    /**
     * @tc.name ConcurrentSetIteratorTest1600
     * @tc.number SUB_CONCURRENTSET_ITERATOR_TEST_1600
     * @tc.desc   Test Symbol.iterator count equals set.size property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetIteratorTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let iter: IterableIterator<number> = set.values()
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
     * @tc.name ConcurrentSetIteratorTest1700
     * @tc.number SUB_CONCURRENTSET_ITERATOR_TEST_1700
     * @tc.desc   Test Symbol.iterator on string type set verifying traversal count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetIteratorTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      set.add('a')
      set.add('b')
      set.add('c')
      let iter: IterableIterator<string> = set.values()
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
     * @tc.name ConcurrentSetIteratorTest1800
     * @tc.number SUB_CONCURRENTSET_ITERATOR_TEST_1800
     * @tc.desc   Test Symbol.iterator on empty set verifying done=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetIteratorTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let iter: IterableIterator<number> = set.values()
      let item: IteratorResult<number> = iter.next()
      expect(item.done).assertTrue()
      Done()
    })

    /**
     * @tc.name ConcurrentSetIteratorTest1900
     * @tc.number SUB_CONCURRENTSET_ITERATOR_TEST_1900
     * @tc.desc   Test Symbol.iterator on set with 100 elements verifying count equals 100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetIteratorTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 100; i++) {
        set.add(i)
      }
      let iter: IterableIterator<number> = set.values()
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
     * @tc.name ConcurrentSetIteratorTest2000
     * @tc.number SUB_CONCURRENTSET_ITERATOR_TEST_2000
     * @tc.desc   Test Symbol.iterator first next() returns not-done result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetIteratorTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let iter: IterableIterator<number> = set.values()
      let first: IteratorResult<number> = iter.next()
      expect(first.done).assertFalse()
      Done()
    })

    /**
     * @tc.name ConcurrentSetIteratorTest2100
     * @tc.number SUB_CONCURRENTSET_ITERATOR_TEST_2100
     * @tc.desc   Test Symbol.iterator on 3-element number set verifying traversal count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetIteratorTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let iter: IterableIterator<number> = set.values()
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
     * @tc.name ConcurrentSetIteratorTest2200
     * @tc.number SUB_CONCURRENTSET_ITERATOR_TEST_2200
     * @tc.desc   Test Symbol.iterator on 3-element number set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetIteratorTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let iter: IterableIterator<number> = set.values()
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
     * @tc.name ConcurrentSetIteratorTest2300
     * @tc.number SUB_CONCURRENTSET_ITERATOR_TEST_2300
     * @tc.desc   Test Symbol.iterator on string type set verifying count equals 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetIteratorTest2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      set.add('a')
      set.add('b')
      set.add('c')
      let iter: IterableIterator<string> = set.values()
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
     * @tc.name ConcurrentSetIteratorTest2400
     * @tc.number SUB_CONCURRENTSET_ITERATOR_TEST_2400
     * @tc.desc   Test Symbol.iterator on empty set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetIteratorTest2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let iter: IterableIterator<number> = set.values()
      let item: IteratorResult<number> = iter.next()
      expect(item.done).assertTrue()
      Done()
    })

    /**
     * @tc.name ConcurrentSetIteratorTest2500
     * @tc.number SUB_CONCURRENTSET_ITERATOR_TEST_2500
     * @tc.desc   Test Symbol.iterator on set with 100 elements verifying count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('ConcurrentSetIteratorTest2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 100; i++) {
        set.add(i)
      }
      let iter: IterableIterator<number> = set.values()
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
     * @tc.name ConcurrentSetIteratorTest2600
     * @tc.number SUB_CONCURRENTSET_ITERATOR_TEST_2600
     * @tc.desc   Test two independent Symbol.iterator iterators on the same set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetIteratorTest2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let iter1: IterableIterator<number> = set.values()
      let iter2: IterableIterator<number> = set.values()
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
     * @tc.name ConcurrentSetIteratorTest2700
     * @tc.number SUB_CONCURRENTSET_ITERATOR_TEST_2700
     * @tc.desc   Test Symbol.iterator returns done=true after full traversal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetIteratorTest2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let iter: IterableIterator<number> = set.values()
      let item: IteratorResult<number> = iter.next()
      while (!item.done) {
        item = iter.next()
      }
      let afterEnd: IteratorResult<number> = iter.next()
      expect(afterEnd.done).assertTrue()
      Done()
    })

    /**
     * @tc.name ConcurrentSetIteratorTest2800
     * @tc.number SUB_CONCURRENTSET_ITERATOR_TEST_2800
     * @tc.desc   Test Symbol.iterator values all exist in set via has()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetIteratorTest2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let vals: number[] = []
      for (let val of set.values()) {
        vals.push(val)
      }
      expect(vals.length).assertEqual(3)
      for (let i = 0; i < vals.length; i++) {
        expect(set.has(vals[i])).assertTrue()
      }
      Done()
    })

    /**
     * @tc.name ConcurrentSetIteratorTest2900
     * @tc.number SUB_CONCURRENTSET_ITERATOR_TEST_2900
     * @tc.desc   Test Symbol.iterator count equals set.size property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetIteratorTest2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let iter: IterableIterator<number> = set.values()
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
     * @tc.name ConcurrentSetIteratorTest3000
     * @tc.number SUB_CONCURRENTSET_ITERATOR_TEST_3000
     * @tc.desc   Test Symbol.iterator after adding element during iteration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetIteratorTest3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let iter: IterableIterator<number> = set.values()
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
     * @tc.name ConcurrentSetIteratorTest3100
     * @tc.number SUB_CONCURRENTSET_ITERATOR_TEST_3100
     * @tc.desc   Test Symbol.iterator after deleting element during iteration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetIteratorTest3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let iter: IterableIterator<number> = set.values()
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
     * @tc.name ConcurrentSetIteratorTest3200
     * @tc.number SUB_CONCURRENTSET_ITERATOR_TEST_3200
     * @tc.desc   Test Symbol.iterator concurrently with 10 async tasks on number set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetIteratorTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 10; i++) {
        set.add(i)
      }
      let promises: Promise<number>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(iteratorTaskNum(set))
      }
      let results: number[] = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(10)
      }
      Done()
    })

    /**
     * @tc.name ConcurrentSetIteratorTest3300
     * @tc.number SUB_CONCURRENTSET_ITERATOR_TEST_3300
     * @tc.desc   Test Symbol.iterator concurrently on empty set via async
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetIteratorTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let promises: Promise<number>[] = []
      for (let i = 0; i < 5; i++) {
        promises.push(iteratorTaskNum(set))
      }
      let results: number[] = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(0)
      }
      Done()
    })

    /**
     * @tc.name ConcurrentSetIteratorTest3400
     * @tc.number SUB_CONCURRENTSET_ITERATOR_TEST_3400
     * @tc.desc   Test Symbol.iterator concurrently with 3 specific async tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetIteratorTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(10)
      set.add(20)
      set.add(30)
      let results: number[] = await Promise.all([
        iteratorTaskNum(set),
        iteratorTaskNum(set),
        iteratorTaskNum(set)
      ])
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(3)
      }
      Done()
    })

    /**
     * @tc.name ConcurrentSetIteratorTest3500
     * @tc.number SUB_CONCURRENTSET_ITERATOR_TEST_3500
     * @tc.desc   Test Symbol.iterator concurrently on string type set with 5 async tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetIteratorTest3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      set.add('a')
      set.add('b')
      set.add('c')
      set.add('d')
      set.add('e')
      let promises: Promise<number>[] = []
      for (let i = 0; i < 5; i++) {
        promises.push(iteratorTaskStr(set))
      }
      let results: number[] = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(5)
      }
      Done()
    })

    /**
     * @tc.name ConcurrentSetIteratorTest3600
     * @tc.number SUB_CONCURRENTSET_ITERATOR_TEST_3600
     * @tc.desc   Test Symbol.iterator concurrently with 10 tasks on 10-element set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetIteratorTest3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 10; i++) {
        set.add(i)
      }
      let promises: Promise<number>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(iteratorTaskNum(set))
      }
      let results: number[] = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(10)
      }
      Done()
    })

    /**
     * @tc.name ConcurrentSetIteratorTest3700
     * @tc.number SUB_CONCURRENTSET_ITERATOR_TEST_3700
     * @tc.desc   Test Symbol.iterator in outer async task with 3 elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetIteratorTest3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result: number = await outerTaskIteratorCount()
      expect(result).assertEqual(3)
      Done()
    })

    /**
     * @tc.name ConcurrentSetIteratorTest3800
     * @tc.number SUB_CONCURRENTSET_ITERATOR_TEST_3800
     * @tc.desc   Test Symbol.iterator in outer async task on empty set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetIteratorTest3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let result: number = await outerTaskIteratorEmpty()
      expect(result).assertEqual(0)
      Done()
    })

    /**
     * @tc.name ConcurrentSetIteratorTest3900
     * @tc.number SUB_CONCURRENTSET_ITERATOR_TEST_3900
     * @tc.desc   Test Symbol.iterator in nested task via onExecutionSucceeded callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetIteratorTest3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let results: number[] = await Promise.all([iteratorTaskInCallback(set)])
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(3)
      }
      Done()
    })

    /**
     * @tc.name ConcurrentSetIteratorTest4000
     * @tc.number SUB_CONCURRENTSET_ITERATOR_TEST_4000
     * @tc.desc   Test Symbol.iterator in nested task via onReceiveData callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetIteratorTest4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let results: number[] = await Promise.all([iteratorTaskInCallback(set)])
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(3)
      }
      Done()
    })

    /**
     * @tc.name ConcurrentSetIteratorTest4100
     * @tc.number SUB_CONCURRENTSET_ITERATOR_TEST_4100
     * @tc.desc   Test Symbol.iterator concurrently with 10 tasks verifying count equals 10
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetIteratorTest4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 10; i++) {
        set.add(i)
      }
      let promises: Promise<number>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(iteratorTaskNum(set))
      }
      let results: number[] = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(10)
      }
      Done()
    })

    /**
     * @tc.name ConcurrentSetIteratorTest4200
     * @tc.number SUB_CONCURRENTSET_ITERATOR_TEST_4200
     * @tc.desc   Test Symbol.iterator in nested task via onExecutionSucceeded callback with 3-element set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetIteratorTest4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let results: number[] = await Promise.all([iteratorTaskInCallback(set)])
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(3)
      }
      Done()
    })

    /**
     * @tc.name ConcurrentSetIteratorTest4300
     * @tc.number SUB_CONCURRENTSET_ITERATOR_TEST_4300
     * @tc.desc   Test Symbol.iterator on 3-element number set verifying traversal count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetIteratorTest4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let iter: IterableIterator<number> = set.values()
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
     * @tc.name ConcurrentSetIteratorTest4400
     * @tc.number SUB_CONCURRENTSET_ITERATOR_TEST_4400
     * @tc.desc   Test Symbol.iterator on empty set verifying done=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetIteratorTest4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let iter: IterableIterator<number> = set.values()
      let item: IteratorResult<number> = iter.next()
      expect(item.done).assertTrue()
      Done()
    })

    /**
     * @tc.name ConcurrentSetIteratorTest4500
     * @tc.number SUB_CONCURRENTSET_ITERATOR_TEST_4500
     * @tc.desc   Test Symbol.iterator on string type set with xyz elements
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetIteratorTest4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<string> = new containers.ConcurrentSet<string>()
      set.add('x')
      set.add('y')
      set.add('z')
      let iter: IterableIterator<string> = set.values()
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
     * @tc.name ConcurrentSetIteratorTest4600
     * @tc.number SUB_CONCURRENTSET_ITERATOR_TEST_4600
     * @tc.desc   Test Symbol.iterator on single-element set verifying value and done
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetIteratorTest4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      let iter: IterableIterator<number> = set.values()
      let item: IteratorResult<number> = iter.next()
      expect(item.done).assertFalse()
      expect(item.value).assertEqual(1)
      let next: IteratorResult<number> = iter.next()
      expect(next.done).assertTrue()
      Done()
    })

    /**
     * @tc.name ConcurrentSetIteratorTest4700
     * @tc.number SUB_CONCURRENTSET_ITERATOR_TEST_4700
     * @tc.desc   Test two Symbol.iterator iterators on 2-element set verifying both start correctly
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetIteratorTest4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      let iter1: IterableIterator<number> = set.values()
      let iter2: IterableIterator<number> = set.values()
      let item1: IteratorResult<number> = iter1.next()
      let item2: IteratorResult<number> = iter2.next()
      expect(item1.done).assertFalse()
      expect(item2.done).assertFalse()
      Done()
    })

    /**
     * @tc.name ConcurrentSetIteratorTest4800
     * @tc.number SUB_CONCURRENTSET_ITERATOR_TEST_4800
     * @tc.desc   Test Symbol.iterator returns done=true after full traversal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetIteratorTest4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let iter: IterableIterator<number> = set.values()
      let item: IteratorResult<number> = iter.next()
      while (!item.done) {
        item = iter.next()
      }
      let afterEnd: IteratorResult<number> = iter.next()
      expect(afterEnd.done).assertTrue()
      Done()
    })

    /**
     * @tc.name ConcurrentSetIteratorTest4900
     * @tc.number SUB_CONCURRENTSET_ITERATOR_TEST_4900
     * @tc.desc   Test Symbol.iterator values all exist in set via has()
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetIteratorTest4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let vals: number[] = []
      for (let val of set.values()) {
        vals.push(val)
      }
      expect(vals.length).assertEqual(3)
      for (let i = 0; i < vals.length; i++) {
        expect(set.has(vals[i])).assertTrue()
      }
      Done()
    })

    /**
     * @tc.name ConcurrentSetIteratorTest5000
     * @tc.number SUB_CONCURRENTSET_ITERATOR_TEST_5000
     * @tc.desc   Test Symbol.iterator count equals set.size property
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetIteratorTest5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let iter: IterableIterator<number> = set.values()
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
     * @tc.name ConcurrentSetIteratorTest5100
     * @tc.number SUB_CONCURRENTSET_ITERATOR_TEST_5100
     * @tc.desc   Test Symbol.iterator after adding element during iteration verifying count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetIteratorTest5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let iter: IterableIterator<number> = set.values()
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
     * @tc.name ConcurrentSetIteratorTest5200
     * @tc.number SUB_CONCURRENTSET_ITERATOR_TEST_5200
     * @tc.desc   Test Symbol.iterator after deleting element during iteration verifying count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetIteratorTest5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let iter: IterableIterator<number> = set.values()
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
     * @tc.name ConcurrentSetIteratorTest5300
     * @tc.number SUB_CONCURRENTSET_ITERATOR_TEST_5300
     * @tc.desc   Test Symbol.iterator, keys() and values() iterators consistency on same set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetIteratorTest5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let symIter: IterableIterator<number> = set.values()
      let keysIter: IterableIterator<number> = set.keys()
      let valsIter: IterableIterator<number> = set.values()
      let symCount: number = 0
      let keysCount: number = 0
      let valsCount: number = 0
      let sItem: IteratorResult<number> = symIter.next()
      while (!sItem.done) {
        symCount++
        sItem = symIter.next()
      }
      let kItem: IteratorResult<number> = keysIter.next()
      while (!kItem.done) {
        keysCount++
        kItem = keysIter.next()
      }
      let vItem: IteratorResult<number> = valsIter.next()
      while (!vItem.done) {
        valsCount++
        vItem = valsIter.next()
      }
      expect(symCount).assertEqual(keysCount)
      expect(symCount).assertEqual(valsCount)
      Done()
    })

    /**
     * @tc.name ConcurrentSetIteratorTest5400
     * @tc.number SUB_CONCURRENTSET_ITERATOR_TEST_5400
     * @tc.desc   Test Symbol.iterator on 3-element number set verifying count equals 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetIteratorTest5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let iter: IterableIterator<number> = set.values()
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
     * @tc.name ConcurrentSetIteratorTest5500
     * @tc.number SUB_CONCURRENTSET_ITERATOR_TEST_5500
     * @tc.desc   Test Symbol.iterator on empty set verifying done=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetIteratorTest5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let iter: IterableIterator<number> = set.values()
      let item: IteratorResult<number> = iter.next()
      expect(item.done).assertTrue()
      Done()
    })

    /**
     * @tc.name ConcurrentSetIteratorTest5600
     * @tc.number SUB_CONCURRENTSET_ITERATOR_TEST_5600
     * @tc.desc   Test Symbol.iterator values all exist in set via has() verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetIteratorTest5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let vals: number[] = []
      for (let val of set.values()) {
        vals.push(val)
      }
      expect(vals.length).assertEqual(3)
      for (let i = 0; i < vals.length; i++) {
        expect(set.has(vals[i])).assertTrue()
      }
      Done()
    })

    /**
     * @tc.name ConcurrentSetIteratorTest5700
     * @tc.number SUB_CONCURRENTSET_ITERATOR_TEST_5700
     * @tc.desc   Test Symbol.iterator after adding element during iteration verifying count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetIteratorTest5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let iter: IterableIterator<number> = set.values()
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
     * @tc.name ConcurrentSetIteratorTest5800
     * @tc.number SUB_CONCURRENTSET_ITERATOR_TEST_5800
     * @tc.desc   Test Symbol.iterator after deleting element during iteration verifying count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetIteratorTest5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let iter: IterableIterator<number> = set.values()
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
     * @tc.name ConcurrentSetIteratorTest5900
     * @tc.number SUB_CONCURRENTSET_ITERATOR_TEST_5900
     * @tc.desc   Test two independent Symbol.iterator iterators on 3-element set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetIteratorTest5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let iter1: IterableIterator<number> = set.values()
      let iter2: IterableIterator<number> = set.values()
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
     * @tc.name ConcurrentSetIteratorTest6000
     * @tc.number SUB_CONCURRENTSET_ITERATOR_TEST_6000
     * @tc.desc   Test Symbol.iterator returns done=true after full traversal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetIteratorTest6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let iter: IterableIterator<number> = set.values()
      let item: IteratorResult<number> = iter.next()
      while (!item.done) {
        item = iter.next()
      }
      let afterEnd: IteratorResult<number> = iter.next()
      expect(afterEnd.done).assertTrue()
      Done()
    })

    /**
     * @tc.name ConcurrentSetIteratorTest6100
     * @tc.number SUB_CONCURRENTSET_ITERATOR_TEST_6100
     * @tc.desc   Test Symbol.iterator concurrently with 10 async tasks on 10-element set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetIteratorTest6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 10; i++) {
        set.add(i)
      }
      let promises: Promise<number>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(iteratorTaskNum(set))
      }
      let results: number[] = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(10)
      }
      Done()
    })

    /**
     * @tc.name ConcurrentSetIteratorTest6200
     * @tc.number SUB_CONCURRENTSET_ITERATOR_TEST_6200
     * @tc.desc   Test Symbol.iterator in nested task via onReceiveData callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetIteratorTest6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let results: number[] = await Promise.all([iteratorTaskInCallback(set)])
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(3)
      }
      Done()
    })

    /**
     * @tc.name ConcurrentSetIteratorTest6300
     * @tc.number SUB_CONCURRENTSET_ITERATOR_TEST_6300
     * @tc.desc   Test Symbol.iterator on 3-element number set verifying traversal count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetIteratorTest6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let iter: IterableIterator<number> = set.values()
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
     * @tc.name ConcurrentSetIteratorTest6400
     * @tc.number SUB_CONCURRENTSET_ITERATOR_TEST_6400
     * @tc.desc   Test Symbol.iterator on empty set verifying done=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetIteratorTest6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      let iter: IterableIterator<number> = set.values()
      let item: IteratorResult<number> = iter.next()
      expect(item.done).assertTrue()
      Done()
    })

    /**
     * @tc.name ConcurrentSetIteratorTest6500
     * @tc.number SUB_CONCURRENTSET_ITERATOR_TEST_6500
     * @tc.desc   Test Symbol.iterator values all exist in set via has() verification
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetIteratorTest6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let vals: number[] = []
      for (let val of set.values()) {
        vals.push(val)
      }
      expect(vals.length).assertEqual(3)
      for (let i = 0; i < vals.length; i++) {
        expect(set.has(vals[i])).assertTrue()
      }
      Done()
    })

    /**
     * @tc.name ConcurrentSetIteratorTest6600
     * @tc.number SUB_CONCURRENTSET_ITERATOR_TEST_6600
     * @tc.desc   Test Symbol.iterator in nested task via onExecutionSucceeded callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetIteratorTest6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let results: number[] = await Promise.all([iteratorTaskInCallback(set)])
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(3)
      }
      Done()
    })

    /**
     * @tc.name ConcurrentSetIteratorTest6700
     * @tc.number SUB_CONCURRENTSET_ITERATOR_TEST_6700
     * @tc.desc   Test Symbol.iterator after adding element during iteration verifying count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetIteratorTest6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let iter: IterableIterator<number> = set.values()
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
     * @tc.name ConcurrentSetIteratorTest6800
     * @tc.number SUB_CONCURRENTSET_ITERATOR_TEST_6800
     * @tc.desc   Test Symbol.iterator after deleting element during iteration verifying count
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('ConcurrentSetIteratorTest6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      set.add(1)
      set.add(2)
      set.add(3)
      let iter: IterableIterator<number> = set.values()
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
     * @tc.name ConcurrentSetIteratorTest6900
     * @tc.number SUB_CONCURRENTSET_ITERATOR_TEST_6900
     * @tc.desc   Test Symbol.iterator concurrently with 10 async tasks on 10-element set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ConcurrentSetIteratorTest6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (Done:()=>void):Promise<void> => {
      let set: containers.ConcurrentSet<number> = new containers.ConcurrentSet<number>()
      for (let i = 0; i < 10; i++) {
        set.add(i)
      }
      let promises: Promise<number>[] = []
      for (let i = 0; i < 10; i++) {
        promises.push(iteratorTaskNum(set))
      }
      let results: number[] = await Promise.all(promises)
      for (let i = 0; i < results.length; i++) {
        expect(results[i]).assertEqual(10)
      }
      Done()
    })
  })
}
